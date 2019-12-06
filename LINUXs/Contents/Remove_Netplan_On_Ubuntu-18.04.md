# Xóa Netplan và cài đặt ifupdown thay thế trên Ubuntu 18.04



Từ trong những bản phát hành mới đây của Ubuntu, `Netplan` là tiện ích mặc định giúp ta cấu hình network, `Netplan` cho phép dễ dàng cấu hình mạng trên hệ thống thông qua các tệp YAML. `Netplan` xử lý YAML và tạo các cấu hình cần thiết cho `NetworkManager` hoặc `systemd-network` của trình kết xuất hệ thống, tuy nếu bạn chưa quen với `netplan` hoặc vì một lý do nào đó bạn hoàn toàn có thể xóa bỏ `netplan` và sử dụng `ifupdown` thay thế, trong bài viết này Cloud365 sẽ hướng dẫn bạn cách xóa bỏ netplan và cài đặt ifupdown để thay thế.

Để xóa bỏ `netplan` và sử dụng `ifupdown` bạn làm theo các bước sau đây.





## Disable netplan
Để tắt netplan ta cần thêm dòng sau vào file cấu hình của grub tại đường dẫn `/etc/default/grub`:

```
GRUB_CMDLINE_LINUX = "netcfg/do_not_use_netplan = true"
```

Để thêm ta có thể mở file bằng trình soạn thảo yêu thích tùy ý, ở đây mình sử dụng `vi`:

```
vi /etc/default/grub
```

Sau đó ta cập nhật lại grub:

```
sudo update-grub
```

## Cài đặt `ifupdown` thay thế `netplan`
Để cài đặt `ifupdown` ta thực hiện các lệnh sau:

```
sudo apt-get update
sudo apt-get install -y ifupdown
```



## Xóa netplan khỏi hệ thống
Ta thực hiện lệnh sau để xóa bỏ netplan khỏi hệ thống:

```
sudo apt-get --purge remove netplan.io
```

Nếu bạn chưa cài đặt `ifupdown`, khi xóa bỏ `netplan` hệ thống sẽ tự cài đặt `ifupdown` thay thế cho bạn, đầu ra của lệnh sẽ tương tự như sau:

```
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following package was automatically installed and is no longer required:
  python3-netifaces
Use 'sudo apt autoremove' to remove it.
The following additional packages will be installed:
  cloud-init ifupdown
Suggested packages:
  ppp rdnssd
The following packages will be REMOVED:
  netplan.io* nplan* ubuntu-minimal*
The following NEW packages will be installed:
  ifupdown
The following packages will be upgraded:
  cloud-init
1 upgraded, 1 newly installed, 3 to remove and 50 not upgraded.
Need to get 460 kB of archives.
After this operation, 4,096 B disk space will be freed.
Do you want to continue? [Y/n] n
Abort.
```

Sau đó ta xóa toàn bộ cấu hình của `netplan`:

```
sudo rm -rf /usr/share/netplan
sudo rm -rf /etc/netplan
```



## Cấu hình interfaces
Mặc định khi `netplan` được sử dụng thì trong file config tại `/etc/network/interfaces` sẽ có nội dung như sau:

```
# ifupdown has been replaced by netplan(5) on this system.  See
# /etc/netplan for current configuration.
# To re-enable ifupdown on this system, you can run:
#    sudo apt install ifupdown
```

Đây là file cấu hình các network interface sử dụng cho `ifupdown`, để cấu hình ta cần chỉnh sửa file này, tuy nhiên trước khi cấu hình ta cần xác định tên các interface để sử dụng trong lúc cấu hình, ta chạy lệnh `ip addr` để xem thông tin, kết quả sẽ như dưới đây:

```
ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: ens33: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 00:0c:29:b9:b6:44 brd ff:ff:ff:ff:ff:ff
    inet 192.168.4.133/24 brd 192.168.4.255 scope global dynamic ens33
       valid_lft 1522sec preferred_lft 1522sec
    inet6 fe80::20c:29ff:feb9:b644/64 scope link 
       valid_lft forever preferred_lft forever
```

Trong đó:
- `lo` là giao diện loopback
- `ens33` là một inteface chính của ta

Ngoài ra ta còn có thể xác định bằng lệnh sau:

```
ls /sys/class/net/
ens33  lo
```

Tiếp ta cần chỉnh sửa file để cấu hình. dưới dây là hai cách cấu hình ip tĩnh (static IP) và ip động (dynamic IP), tùy vào nhu cầu sử dụng chúng ta có thể cấu hình theo một trong hai cách sau:


### Config dynamic IP
Để cấu hình dynamic ip ta thêm các dòng sau vào file `/etc/network/interfaces`:

```
auto lo
iface lo inet loopback

auto ens33
iface ens33 inet dhcp
```

**Chú ý: ** bạn cần thay thế `ens33` đúng với tên ta đã xác định ở bước trên

### Config static IP
Để cấu hình dynamic ip ta thêm các dòng sau vào file `/etc/network/interfaces`:

```
auto lo
iface lo inet loopback


auto ens33
iface ens33 inet static
address 192.168.1.10
netmask 255.255.255.0
gateway 192.168.1.1
broadcst 192.168.1.255
dns-nameservers 8.8.8.8 8.8.4.4
dns-search lan
```

**Chú ý: ** bạn cần thay thế `ens33` đúng với tên ta đã xác định ở bước trên và các thông số về ip theo cấu hình mạng của bạn.

Cuối cùng khi đã cấu hình xong ta cần khởi động lại hệ thống để mọi thứ được áp dụng bằng lệnh sau.

```
sudo shutdown -r now
```