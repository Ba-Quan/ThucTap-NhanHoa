#### acpi_tables
Firmware ACPI functional table common metadata and content.

Bảng chức năng phổ biến và thông tin về Firmware ACPI.

| COLUMN |  TYPE   |         DESCRIPTION         |
|--------|---------|-----------------------------|
|  name  |  text   |       ACPI table name       |
|  size  | integer | Size of compiled table data |
|  md5   |  text   |  MD5 hash of table content  |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from acpi_tables;
+------+-------+----------------------------------+
| name | size  | md5                              |
+------+-------+----------------------------------+
| APIC | 1858  | c5e12d825cfb07411acf98340989cc9c |
| BOOT | 40    | 3220aab64cd0f703d6c8125c5f4d16c0 |
| DSDT | 83051 | 0466d3eb41793e1af114e5bcf1c43c05 |
| FACP | 244   | 74577e1c36e5c31c8c006d86161216ac |
| FACS | 64    | 41e41fb4ff3ef53e3cecb9b7db61f9f1 |
| HPET | 56    | 6a31cafd3d5392e2631594cd00234f24 |
| MCFG | 60    | 264d4ca64e6e1fd067711a1a3fef4b7f |
| SRAT | 2216  | 3fc2a7e0ea72f6a69d6e5efe673e66b3 |
| WAET | 40    | 22c8a0e46563b9eab834958f900cf662 |
+------+-------+----------------------------------+
```
</details>



#### apt_sources
Current list of APT repositories or software channels.

Danh sách hiện tại của kho APT hoặc kênh phần mềm.

|    COLUMN     | TYPE |        DESCRIPTION        |
|---------------|------|---------------------------|
|     name      | text |      Repository name      |
|    source     | text |        Source file        |
|   base_uri    | text |    Repository base URI    |
|    release    | text |       Release name        |
|    version    | text | Repository source version |
|  maintainer   | text |   Repository maintainer   |
|  components   | text |   Repository components   |
| architectures | text | Repository architectures  |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from apt_sources;
+---------------------------------------------------------+-----------------------+-------------------------------------+---------+---------+-----------------+-------------------------------------+--------------------------------------+
| name                                                    | source                | base_uri                            | release | version | maintainer      | components                          | architectures                        |
+---------------------------------------------------------+-----------------------+-------------------------------------+---------+---------+-----------------+-------------------------------------+--------------------------------------+
| vn.archive.ubuntu.com/ubuntu bionic universe            | /etc/apt/sources.list | http://vn.archive.ubuntu.com/ubuntu | bionic  | 18.04   | Ubuntu          | main restricted universe multiverse | amd64 arm64 armhf i386 ppc64el s390x |
| vn.archive.ubuntu.com/ubuntu bionic-updates universe    | /etc/apt/sources.list | http://vn.archive.ubuntu.com/ubuntu | bionic  | 18.04   | Ubuntu          | main restricted universe multiverse | amd64 arm64 armhf i386 ppc64el s390x |
| vn.archive.ubuntu.com/ubuntu bionic multiverse          | /etc/apt/sources.list | http://vn.archive.ubuntu.com/ubuntu | bionic  | 18.04   | Ubuntu          | main restricted universe multiverse | amd64 arm64 armhf i386 ppc64el s390x |
| vn.archive.ubuntu.com/ubuntu bionic-updates multiverse  | /etc/apt/sources.list | http://vn.archive.ubuntu.com/ubuntu | bionic  | 18.04   | Ubuntu          | main restricted universe multiverse | amd64 arm64 armhf i386 ppc64el s390x |
| vn.archive.ubuntu.com/ubuntu bionic-security universe   | /etc/apt/sources.list | http://vn.archive.ubuntu.com/ubuntu | bionic  | 18.04   | Ubuntu          | main restricted universe multiverse | amd64 arm64 armhf i386 ppc64el s390x |
| vn.archive.ubuntu.com/ubuntu bionic-security multiverse | /etc/apt/sources.list | http://vn.archive.ubuntu.com/ubuntu | bionic  | 18.04   | Ubuntu          | main restricted universe multiverse | amd64 arm64 armhf i386 ppc64el s390x |
| pkg.osquery.io/deb deb main                             | /etc/apt/sources.list | https://pkg.osquery.io/deb          | deb     |         | osquery-builder | main                                | amd64                                |
+---------------------------------------------------------+-----------------------+-------------------------------------+---------+---------+-----------------+-------------------------------------+--------------------------------------+
```
</details>



#### arp_cache
Address resolution cache, both static and dynamic (from ARP, NDP).

Chứa thông tin về cache phân giải địa chỉ, cả tĩnh và động (từ ARP, NDP).

|  COLUMN   | TYPE |             DESCRIPTION              |
|-----------|------|--------------------------------------|
|  address  | text |         IPv4 address target          |
|    mac    | text |  MAC address of broadcasted address  |
| interface | text | Interface of the network for the MAC |
| permanent | text |       1 for true, 0 for false        |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from arp_cache;
+---------------+-------------------+-----------+-----------+
| address       | mac               | interface | permanent |
+---------------+-------------------+-----------+-----------+
| 192.168.4.1   | 00:50:56:c0:00:08 | ens160    | 0         |
| 192.168.4.254 | 00:50:56:e2:97:bf | ens160    | 0         |
| 192.168.4.2   | 00:50:56:ed:2d:be | ens160    | 0         |
+---------------+-------------------+-----------+-----------+
```
</details>



#### atom_packages
Lists all atom packages in a directory or globally installed in a system.

Liệt kê tất cả các atom packages trong một thư mục hoặc được cài đặt trên toàn cầu trong một hệ thống.

|   COLUMN    |  TYPE  |             DESCRIPTION             |
|-------------|--------|-------------------------------------|
|    name     |  text  |        Package display name         |
|   version   |  text  |      Package supplied version       |
| description |  text  |    Package supplied description     |
|    path     |  text  |     Package's package.json path     |
|   license   |  text  |         License for package         |
|  homepage   |  text  |      Package supplied homepage      |
|     uid     | bigint | The local user that owns the plugin |



#### augeas
Configuration files parsed by augeas.

Các tập tin cấu hình được phân tích cú pháp bởi augeas.

| COLUMN | TYPE |               DESCRIPTION               |
|--------|------|-----------------------------------------|
|  node  | text | The node path of the configuration item |
| value  | text |   The value of the configuration item   |
| label  | text |   The label of the configuration item   |
|  path  | text |   The path to the configuration file    |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from augeas;
+-------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------+----------------------------------------------------------------------------------------+
| node                                                                                                                          | value                                                                                                                                                                                                                       | label                                       | path                                                                                   |
+-------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------+----------------------------------------------------------------------------------------+
| /files/etc                                                                                                                    |                                                                                                                                                                                                                             | etc                                         | /etc                                                                                   |
| /files/boot                                                                                                                   |                                                                                                                                                                                                                             | boot                                        | /boot                                                                                  |
| /files/run                                                                                                                    |                                                                                                                                                                                                                             | run                                         | /run                                                                                   |
| /files/usr                                                                                                                    |                                                                                                                                                                                                                             | usr                                         | /usr                                                                                   |
| /files/lib                                                                                                                    |                                                                                                                                                                                                                             | lib                                         | /lib                                                                                   |
| /files/etc/shells                                                                                                             |                                                                                                                                                                                                                             | shells                                      | /etc/shells                                                                            |
| /files/etc/sysconfig                                                                                                          |                                                                                                                                                                                                                             | sysconfig                                   | /etc/sysconfig                                                                         |
| /files/etc/profile.d                                                                                                          |                                                                                                                                                                                                                             | profile.d                                   | /etc/profile.d                                                                         |
| /files/etc/default                                                                                                            |                                                                                                                                                                                                                             | default                                     | /etc/default                                                                           |
| /files/etc/vconsole.conf                                                                                                      |                                                                                                                                                                                                                             | vconsole.conf                               | /etc/vconsole.conf                                                                     |
| /files/etc/locale.conf                                                                                                        |                                                                                                                                                                                                                             | locale.conf                                 | /etc/locale.conf                                                                       |
| /files/etc/selinux                                                                                                            |                                                                                                                                                                                                                             | selinux                                     | /etc/selinux                                                                           |
| /files/etc/dhcp                                                                                                               |                                                                                                                                                                                                                             | dhcp                                        | /etc/dhcp                                                                              |
| /files/etc/ld.so.conf.d                                                                                                       |                                                                                                                                                                                                                             | ld.so.conf.d                                | /etc/ld.so.conf.d                                                                      |
| /files/etc/ld.so.conf                                                                                                         |                                                                                                                                                                                                                             | ld.so.conf                                  | /etc/ld.so.conf                                                                        |
| /files/etc/networks                                                                                                           |                                                                                                                                                                                                                             | networks                                    | /etc/networks                                                                          |
| /files/etc/nsswitch.conf                                                                                                      |                                                                                                                                                                                                                             | nsswitch.conf                               | /etc/nsswitch.conf                                                                     |
| /files/etc/exports                                                                                                            |                                                                                                                                                                                                                             | exports                                     | /etc/exports                                                                           |
| /files/etc/mtab                                                                                                               |                                                                                                                                                                                                                             | mtab                                        | /etc/mtab                                                                              |
| /files/etc/fstab                                                                                                              |                                                                                                                                                                                                                             | fstab                                       | /etc/fstab                                                                             |
| /files/etc/hosts                                                                                                              |                                                                                                                                                                                                                             | hosts                                       | /etc/hosts                                                                             |
| /files/etc/security                                                                                                           |                                                                                                                                                                                                                             | security                                    | /etc/security                                                                          |
| /files/etc/inittab                                                                                                            |                                                                                                                                                                                                                             | inittab                                     | /etc/inittab                                                                           |
| /files/etc/inputrc                                                                                                            |                                                                                                                                                                                                                             | inputrc                                     | /etc/inputrc                                                                           |
| /files/lib/systemd/system/sysinit.target/Unit/Wants/value[1]                                                                  | local-fs.target                                                                                                                                                                                                             | value                                       | /lib/systemd/system/sysinit.target                                                     |
| /files/lib/systemd/system/sysinit.target/Unit/Wants/value[2]                                                                  | swap.target                                                                                                                                                                                                                 | value                                       | /lib/systemd/system/sysinit.target                                                     |
| /files/lib/systemd/system/sysinit.target/Unit/After/value[1]                                                                  | local-fs.target                                                                                                                                                                                                             | value                                       | /lib/systemd/system/sysinit.target                                                     |
| /files/lib/systemd/system/sysinit.target/Unit/After/value[2]                                                                  | swap.target                                                                                                                                                                                                                 | value                                       | /lib/systemd/system/sysinit.target                                                     |
| /files/lib/systemd/system/sysinit.target/Unit/After/value[3]                                                                  | emergency.service                                                                                                                                                                                                           | value                                       | /lib/systemd/system/sysinit.target                                                     |
| /files/lib/systemd/system/sysinit.target/Unit/After/value[4]                                                                  | emergency.target                                                                                                                                                                                                            | value                                       | /lib/systemd/system/sysinit.target                                                     |
+-------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+---------------------------------------------+----------------------------------------------------------------------------------------+
```
</details>



#### authorized_keys
A line-delimited authorized_keys table.

|  COLUMN   |  TYPE  |               DESCRIPTION               |
|-----------|--------|-----------------------------------------|
|    uid    | bigint | The local owner of authorized_keys file |
| algorithm |  text  |            algorithm of key             |
|    key    |  text  |       parsed authorized keys line       |
| key_file  |  text  |    Path to the authorized_keys file     |



#### block_devices
Block (buffered access) device file nodes: disks, ramdisks, and DMG containers.

Chặn (buffered access) các nút tệp thiết bị: disks, ramdisks, và DMG containers

|   COLUMN   |  TYPE   |                DESCRIPTION                 |
|------------|---------|--------------------------------------------|
|    name    |  text   |             Block device name              |
|   parent   |  text   |          Block device parent name          |
|   vendor   |  text   |         Block device vendor string         |
|   model    |  text   |    Block device model string identifier    |
|    size    | bigint  |        Block device size in blocks         |
| block_size | integer |            Block size in bytes             |
|    uuid    |  text   | Block device Universally Unique Identifier |
|    type    |  text   |          Block device type string          |
|   label    |  text   |         Block device label string          |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from block_devices;
+----------------+----------------+----------+------------------+-----------+------------+----------------------------------------+-------------+------------------------+
| name           | parent         | vendor   | model            | size      | block_size | uuid                                   | type        | label                  |
+----------------+----------------+----------+------------------+-----------+------------+----------------------------------------+-------------+------------------------+
| /dev/sr0       |                | NECVMWar | VMware SATA CD01 | 13936640  | 2048       | 2019-08-15-21-52-52-00                 | iso9660     | CentOS-8-BaseOS-x86_64 |
| /dev/nvme0n1   |                |          |                  | 104857600 | 512        |                                        |             |                        |
| /dev/nvme0n1p1 | /dev/nvme0n1   |          |                  | 2097152   |            | ed808604-2cd2-4d3c-aa3a-0b799196e139   | ext4        |                        |
| /dev/nvme0n1p2 | /dev/nvme0n1   |          |                  | 102758400 |            | kZddyU-jtDo-06z5-tGTc-gtmp-S3M6-vKgNgV | LVM2_member |                        |
| /dev/dm-0      | /dev/nvme0n1p2 |          |                  | 98295808  | 512        | 08fac3ee-62e1-4857-bc14-a79668a4cc44   | xfs         |                        |
| /dev/dm-1      | /dev/nvme0n1p2 |          |                  | 4456448   | 512        | cd6f20c0-717d-47e7-a8a5-7e191cd21ca4   | swap        |                        |
+----------------+----------------+----------+------------------+-----------+------------+----------------------------------------+-------------+------------------------+
```
</details>



#### carbon_black_info
Returns info about a Carbon Black sensor install.

Thông tin về cài đặt cảm biến Carbon Black.

|             COLUMN             |  TYPE   |                                 DESCRIPTION                                  |
|--------------------------------|---------|------------------------------------------------------------------------------|
|           sensor_id            | integer |                     Sensor ID of the Carbon Black sensor                     |
|          config_name           |  text   |                                 Sensor group                                 |
|      collect_store_files       | integer | If the sensor is configured to send back binaries to the Carbon Black server |
|      collect_module_loads      | integer |             If the sensor is configured to capture module loads              |
|      collect_module_info       | integer |         If the sensor is configured to collect metadata of binaries          |
|       collect_file_mods        | integer |       If the sensor is configured to collect file modification events        |
|        collect_reg_mods        | integer |     If the sensor is configured to collect registry modification events      |
|       collect_net_conns        | integer |          If the sensor is configured to collect network connections          |
|       collect_processes        | integer |                If the sensor is configured to process events                 |
|    collect_cross_processes     | integer |             If the sensor is configured to cross process events              |
|      collect_emet_events       | integer |                  If the sensor is configured to EMET events                  |
|    collect_data_file_writes    | integer |        If the sensor is configured to collect non binary file writes         |
|  collect_process_user_context  | integer |      If the sensor is configured to collect the user running a process       |
|   collect_sensor_operations    | integer |                                   Unknown                                    |
|     log_file_disk_quota_mb     | integer |                         Event file disk quota in MB                          |
| log_file_disk_quota_percentage | integer |                    Event file disk quota in a percentage                     |
|      protection_disabled       | integer |             If the sensor is configured to report tamper events              |
|         sensor_ip_addr         |  text   |                           IP address of the sensor                           |
|     sensor_backend_server      |  text   |                             Carbon Black server                              |
|          event_queue           | integer |              Size in bytes of Carbon Black event files on disk               |
|          binary_queue          | integer |     Size in bytes of binaries waiting to be sent to Carbon Black server      |



#### carves
Forensic Carves.

|   COLUMN   |  TYPE   |                            DESCRIPTION                            |
|------------|---------|-------------------------------------------------------------------|
|    time    | bigint  |              Time at which the carve was kicked off               |
|   sha256   |  text   |                A SHA256 sum of the carved archive                 |
|    size    | integer |                    Size of the carved archive                     |
|    path    |  text   |                  The path of the requested carve                  |
|   status   |  text   | Status of the carve, can be STARTING, PENDING, SUCCESS, or FAILED |
| carve_guid |  text   |              Identifying value of the carve session               |
|   carve    | integer |            Set this value to '1' to start a file carve            |



#### chrome_extensions
Chrome browser extensions.

Thông tin về các tiện ích mở rộng của chrome.

|   COLUMN    |  TYPE   |                     DESCRIPTION                     |
|-------------|---------|-----------------------------------------------------|
|     uid     | bigint  |       The local user that owns the extension        |
|    name     |  text   |               Extension display name                |
|   profile   |  text   |   The Chrome profile that contains this extension   |
| identifier  |  text   |                Extension identifier                 |
|   version   |  text   |             Extension-supplied version              |
| description |  text   |           Extension-optional description            |
|   locale    |  text   |        Default locale supported by extension        |
| update_url  |  text   |            Extension-supplied update URI            |
|   author    |  text   |              Optional extension author              |
| persistent  | integer | 1 If extension is persistent across all tabs else 0 |
|    path     |  text   |              Path to extension folder               |
| permissions |  text   |      The permissions required by the extension      |



#### cpu_time
Displays information from /proc/stat file about the time the cpu cores spent in different parts of the system.

Hiển thị thông tin từ tập tin `/Proc/stat` về thời gian các lõi cpu dành cho các phần khác nhau của hệ thống.

|   COLUMN   |  TYPE   |                                      DESCRIPTION                                      |
|------------|---------|---------------------------------------------------------------------------------------|
|    core    | integer |                                Name of the cpu (core)                                 |
|    user    | bigint  |                                Time spent in user mode                                |
|    nice    | bigint  |                   Time spent in user mode with low priority (nice)                    |
|   system   | bigint  |                               Time spent in system mode                               |
|    idle    | bigint  |                              Time spent in the idle task                              |
|   iowait   | bigint  |                        Time spent waiting for I/O to complete                         |
|    irq     | bigint  |                            Time spent servicing interrupts                            |
|  softirq   | bigint  |                             Time spent servicing softirqs                             |
|   steal    | bigint  |    Time spent in other operating systems when running in a virtualized environment    |
|   guest    | bigint  | Time spent running a virtual CPU for a guest OS under the control of the Linux kernel |
| guest_nice | bigint  |                           Time spent running a niced guest                            |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from cpu_time;
+------+------+------+--------+--------+--------+------+---------+-------+-------+------------+
| core | user | nice | system | idle   | iowait | irq  | softirq | steal | guest | guest_nice |
+------+------+------+--------+--------+--------+------+---------+-------+-------+------------+
| 0    | 2259 | 506  | 2620   | 173377 | 3767   | 1042 | 205     | 0     | 0     | 0          |
+------+------+------+--------+--------+--------+------+---------+-------+-------+------------+
```
</details>



#### cpuid
Useful CPU features from the cpuid ASM call.

|     COLUMN      |  TYPE   |               DESCRIPTION               |
|-----------------|---------|-----------------------------------------|
|     feature     |  text   |          Present feature flags          |
|      value      |  text   |           Bit value or string           |
| output_register |  text   |   Register used to for feature value    |
|   output_bit    | integer | Bit in register value for feature value |
|    input_eax    |  text   |            Value of EAX used            |



#### crontab
Line parsed values from system and user cron/tab.

Thông tin về cron/tab có trên hệ thống.

|    COLUMN    | TYPE |            DESCRIPTION            |
|--------------|------|-----------------------------------|
|    event     | text |    The job @event name (rare)     |
|    minute    | text |   The exact minute for the job    |
|     hour     | text |  The hour of the day for the job  |
| day_of_month | text | The day of the month for the job  |
|    month     | text | The month of the year for the job |
| day_of_week  | text |  The day of the week for the job  |
|   command    | text |        Raw command string         |
|     path     | text |            File parsed            |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from crontab;
+-------+--------+------+--------------+-------+-------------+---------------------------------+---------------------+
| event | minute | hour | day_of_month | month | day_of_week | command                         | path                |
+-------+--------+------+--------------+-------+-------------+---------------------------------+---------------------+
|       | 01     | *    | *            | *     | *           | root run-parts /etc/cron.hourly | /etc/cron.d/0hourly |
+-------+--------+------+--------------+-------+-------------+---------------------------------+---------------------+
```
</details>



#### curl
Perform an http request and return stats about it.

|     COLUMN      |  TYPE   |                 DESCRIPTION                  |
|-----------------|---------|----------------------------------------------|
|       url       |  text   |           The url for the request            |
|     method      |  text   |       The HTTP method for the request        |
|   user_agent    |  text   | The user-agent string to use for the request |
|  response_code  | integer |    The HTTP status code for the response     |
| round_trip_time | bigint  |      Time taken to complete the request      |
|      bytes      | bigint  |       Number of bytes in the response        |
|     result      |  text   |            The HTTP response body            |



#### curl_certificate
Inspect TLS certificates by connecting to input hostnames.

|          COLUMN          | TYPE |           DESCRIPTION            |
|--------------------------|------|----------------------------------|
|         hostname         | text | Hostname (domain[:port]) to CURL |
|       common_name        | text | Common name of company issued to |
|       organization       | text |      Organization issued to      |
|    organization_unit     | text |   Organization unit issued to    |
|      serial_number       | text |    Certificate serial number     |
|    issuer_common_name    | text |        Issuer common name        |
|   issuer_organization    | text |       Issuer organization        |
| issuer_organization_unit | text |     Issuer organization unit     |
|        valid_from        | text |  Period of validity start date   |
|         valid_to         | text |   Period of validity end date    |
|    sha256_fingerprint    | text |       SHA-256 fingerprint        |
|     sha1_fingerprint     | text |         SHA1 fingerprint         |



#### deb_packages
The installed DEB package database.

Dữ liệu về các gói deb đã được cài đặt.

|  COLUMN  |  TYPE  |      DESCRIPTION      |
|----------|--------|-----------------------|
|   name   |  text  |     Package name      |
| version  |  text  |    Package version    |
|  source  |  text  |    Package source     |
|   size   | bigint | Package size in bytes |
|   arch   |  text  | Package architecture  |
| revision |  text  |   Package revision    |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from deb_packages;
+---------------------------------------+-------------------------------------------------+------------------------------------+--------+-------+--------------------+
| name                                  | version                                         | source                             | size   | arch  | revision           |
+---------------------------------------+-------------------------------------------------+------------------------------------+--------+-------+--------------------+
| accountsservice                       | 0.6.45-1ubuntu1                                 |                                    | 440    | amd64 | 1ubuntu1           |
| acl                                   | 2.2.52-3build1                                  |                                    | 200    | amd64 | 3build1            |
| acpid                                 | 1:2.0.28-1ubuntu1                               |                                    | 139    | amd64 | 1ubuntu1           |
| adduser                               | 3.116ubuntu1                                    |                                    | 624    | all   |                    |
| amd64-microcode                       | 3.20191021.1+really3.20181128.1~ubuntu0.18.04.1 |                                    | 76     | amd64 |                    |
| apparmor                              | 2.12-4ubuntu5.1                                 |                                    | 1848   | amd64 | 4ubuntu5.1         |
| apport                                | 2.20.9-0ubuntu7.9                               |                                    | 776    | all   | 0ubuntu7.9         |
| apport-symptoms                       | 0.20                                            |                                    | 75     | all   |                    |
| apt                                   | 1.6.11                                          |                                    | 3823   | amd64 |                    |
| apt-utils                             | 1.6.11                                          | apt                                | 768    | amd64 |                    |
| at                                    | 3.1.20-3.1ubuntu2                               |                                    | 151    | amd64 | 3.1ubuntu2         |
| base-files                            | 10.1ubuntu2.6                                   |                                    | 386    | amd64 |                    |
| base-passwd                           | 3.5.44                                          |                                    | 228    | amd64 |                    |
| bash                                  | 4.4.18-2ubuntu1.2                               |                                    | 1588   | amd64 | 2ubuntu1.2         |
| bash-completion                       | 1:2.8-1ubuntu1                                  |                                    | 1361   | all   | 1ubuntu1           |
| bc                                    | 1.07.1-2                                        |                                    | 218    | amd64 | 2                  |
| bcache-tools                          | 1.0.8-2build1                                   |                                    | 86     | amd64 | 2build1            |
| bind9-host                            | 1:9.11.3+dfsg-1ubuntu1.11                       | bind9                              | 174    | amd64 | 1ubuntu1.11        |
| bsdmainutils                          | 11.1.2ubuntu1                                   |                                    | 583    | amd64 |                    |
| bsdutils                              | 1:2.31.1-0.4ubuntu3.3                           | util-linux (2.31.1-0.4ubuntu3.3)   | 264    | amd64 | 0.4ubuntu3.3       |
| btrfs-progs                           | 4.15.1-1build1                                  |                                    | 4110   | amd64 | 1build1            |
| btrfs-tools                           | 4.15.1-1build1                                  | btrfs-progs                        | 18     | amd64 | 1build1            |
| busybox-initramfs                     | 1:1.27.2-2ubuntu3.2                             | busybox                            | 345    | amd64 | 2ubuntu3.2         |
| busybox-static                        | 1:1.27.2-2ubuntu3.2                             | busybox                            | 2113   | amd64 | 2ubuntu3.2         |
| byobu                                 | 5.125-0ubuntu1                                  |                                    | 650    | all   | 0ubuntu1           |
| bzip2                                 | 1.0.6-8.1ubuntu0.2                              |                                    | 177    | amd64 | 8.1ubuntu0.2       |
| rsyslog                               | 8.32.0-1ubuntu4                                 |                                    | 1432   | amd64 | 1ubuntu4           |
| run-one                               | 1.17-0ubuntu1                                   |                                    | 44     | all   | 0ubuntu1           |
| screen                                | 4.6.2-1ubuntu1                                  |                                    | 986    | amd64 | 1ubuntu1           |
| sed                                   | 4.4-2                                           |                                    | 320    | amd64 | 2                  |
| sensible-utils                        | 0.0.12                                          |                                    | 62     | all   |                    |
| shared-mime-info                      | 1.9-2                                           |                                    | 2600   | amd64 | 2                  |
| ubuntu-advantage-tools                | 17                                              |                                    | 74     | all   |                    |
| ubuntu-keyring                        | 2018.09.18.1~18.04.0                            |                                    | 46     | all   |                    |
| ubuntu-minimal                        | 1.417.3                                         | ubuntu-meta                        | 47     | amd64 |                    |
| ubuntu-release-upgrader-core          | 1:18.04.34                                      | ubuntu-release-upgrader            | 336    | all   |                    |
| ubuntu-server                         | 1.417.3                                         | ubuntu-meta                        | 47     | amd64 |                    |
| ubuntu-standard                       | 1.417.3                                         | ubuntu-meta                        | 47     | amd64 |                    |
| ucf                                   | 3.0038                                          |                                    | 183    | all   |                    |
| udev                                  | 237-3ubuntu10.29                                | systemd                            | 7722   | amd64 | 3ubuntu10.29       |
| ufw                                   | 0.36-0ubuntu0.18.04.1                           |                                    | 823    | all   | 0ubuntu0.18.04.1   |
| uidmap                                | 1:4.5-1ubuntu2                                  | shadow                             | 339    | amd64 | 1ubuntu2           |
| unattended-upgrades                   | 1.1ubuntu1.18.04.11                             |                                    | 384    | all   |                    |
| update-manager-core                   | 1:18.04.11.10                                   | update-manager                     | 172    | all   |                    |
| update-notifier-common                | 3.192.1.7                                       | update-notifier                    | 1378   | all   |                    |
| ureadahead                            | 0.100.0-21                                      |                                    | 73     | amd64 | 21                 |
| usbutils                              | 1:007-4build1                                   |                                    | 716    | amd64 | 4build1            |
| util-linux                            | 2.31.1-0.4ubuntu3.3                             |                                    | 3374   | amd64 | 0.4ubuntu3.3       |
| uuid-runtime                          | 2.31.1-0.4ubuntu3.3                             | util-linux                         | 201    | amd64 | 0.4ubuntu3.3       |
| vim                                   | 2:8.0.1453-1ubuntu1.1                           |                                    | 2785   | amd64 | 1ubuntu1.1         |
| vim-common                            | 2:8.0.1453-1ubuntu1.1                           | vim                                | 329    | all   | 1ubuntu1.1         |
| vim-runtime                           | 2:8.0.1453-1ubuntu1.1                           | vim                                | 28420  | all   | 1ubuntu1.1         |
| vim-tiny                              | 2:8.0.1453-1ubuntu1.1                           | vim                                | 1271   | amd64 | 1ubuntu1.1         |
| wget                                  | 1.19.4-1ubuntu2.2                               |                                    | 932    | amd64 | 1ubuntu2.2         |
| whiptail                              | 0.52.20-1ubuntu1                                | newt                               | 65     | amd64 | 1ubuntu1           |
| wireless-regdb                        | 2018.05.09-0ubuntu1~18.04.1                     |                                    | 33     | all   | 0ubuntu1~18.04.1   |
| xauth                                 | 1:1.0.10-1                                      |                                    | 72     | amd64 | 1                  |
| xdelta3                               | 3.0.11-dfsg-1ubuntu1                            |                                    | 165    | amd64 | 1ubuntu1           |
| xdg-user-dirs                         | 0.17-1ubuntu1                                   |                                    | 533    | amd64 | 1ubuntu1           |
| xfsprogs                              | 4.9.0+nmu1ubuntu2                               |                                    | 3876   | amd64 |                    |
| xkb-data                              | 2.23.1-1ubuntu1                                 | xkeyboard-config                   | 3186   | all   | 1ubuntu1           |
| xxd                                   | 2:8.0.1453-1ubuntu1.1                           | vim                                | 195    | amd64 | 1ubuntu1.1         |
| xz-utils                              | 5.2.2-1.3                                       |                                    | 428    | amd64 | 1.3                |
| zerofree                              | 1.0.4-1                                         |                                    | 25     | amd64 | 1                  |
| zlib1g                                | 1:1.2.11.dfsg-0ubuntu2                          | zlib                               | 169    | amd64 | 0ubuntu2           |
+---------------------------------------+-------------------------------------------------+------------------------------------+--------+-------+--------------------+
```
</details>



#### device_file
Similar to the file table, but use TSK and allow block address access.

Lưu trữ thông tin về các file thiết bị (device file)

|   COLUMN   |  TYPE   |              DESCRIPTION              |
|------------|---------|---------------------------------------|
|   device   |  text   |   Absolute file path to device node   |
| partition  |  text   |          A partition number           |
|    path    |  text   | A logical path within the device node |
|  filename  |  text   |       Name portion of file path       |
|   inode    | bigint  |        Filesystem inode number        |
|    uid     | bigint  |            Owning user ID             |
|    gid     | bigint  |            Owning group ID            |
|    mode    |  text   |            Permission bits            |
|    size    | bigint  |         Size of file in bytes         |
| block_size | integer |       Block size of filesystem        |
|   atime    | bigint  |           Last access time            |
|   mtime    | bigint  |        Last modification time         |
|   ctime    | bigint  |             Creation time             |
| hard_links | integer |         Number of hard links          |
|    type    |  text   |              File status              |



#### device_hash
Similar to the hash table, but use TSK and allow block address access.

Lưu trữ hàm băm của các file thiết bị

|  COLUMN   |  TYPE  |            DESCRIPTION             |
|-----------|--------|------------------------------------|
|  device   |  text  | Absolute file path to device node  |
| partition |  text  |         A partition number         |
|   inode   | bigint |      Filesystem inode number       |
|    md5    |  text  |  MD5 hash of provided inode data   |
|   sha1    |  text  |  SHA1 hash of provided inode data  |
|  sha256   |  text  | SHA256 hash of provided inode data |



#### device_partitions
Use TSK to enumerate details about partitions on a disk device.

Sử dụng TSK để liệt kê chi tiết về các phân vùng trên thiết bị đĩa.

|   COLUMN    |  TYPE   |            DESCRIPTION            |
|-------------|---------|-----------------------------------|
|   device    |  text   | Absolute file path to device node |
|  partition  | integer | A partition number or description |
|    label    |  text   |                                   |
|    type     |  text   |                                   |
|   offset    | bigint  |                                   |
| blocks_size | bigint  |      Byte size of each block      |
|   blocks    | bigint  |         Number of blocks          |
|   inodes    | bigint  |       Number of meta nodes        |
|    flags    | integer |                                   |



#### disk_encryption
Disk encryption status and information.

|      COLUMN       |  TYPE   |                                        DESCRIPTION                                         |
|-------------------|---------|--------------------------------------------------------------------------------------------|
|       name        |  text   |                                         Disk name                                          |
|       uuid        |  text   |                             Disk Universally Unique Identifier                             |
|     encrypted     | integer |                      1 If encrypted: true (disk is encrypted), else 0                      |
|       type        |  text   |                      Description of cipher type and mode if available                      |
|        uid        |  text   |                     Currently authenticated user if available (Apple)                      |
|     user_uuid     |  text   |                      UUID of authenticated user if available (Apple)                       |
| encryption_status |  text   | Disk encryption status with one of following values: encrypted | not encrypted | undefined |



#### dns_resolvers
Resolvers used by this host.

Danh sách DNS được phân giải vởi hệ thống.

| COLUMN  |  TYPE   |                DESCRIPTION                 |
|---------|---------|--------------------------------------------|
|   id    | integer |        Address type index or order         |
|  type   |  text   | Address type: sortlist, nameserver, search |
| address |  text   |          Resolver IP/IPv6 address          |
| netmask |  text   |     Address (sortlist) netmask length      |
| options | bigint  |              Resolver options              |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from dns_resolvers;
+----+------------+-------------+---------+---------+
| id | type       | address     | netmask | options |
+----+------------+-------------+---------+---------+
| 0  | nameserver | 192.168.4.2 | 32      | 705     |
| 0  | search     | localdomain |         | 705     |
+----+------------+-------------+---------+---------+
```
</details>



#### docker_container_labels
Docker container labels.

| COLUMN | TYPE |     DESCRIPTION      |
|--------|------|----------------------|
|   id   | text |     Container ID     |
|  key   | text |      Label key       |
| value  | text | Optional label value |



#### docker_container_mounts
Docker container mounts.

|   COLUMN    |  TYPE   |            DESCRIPTION            |
|-------------|---------|-----------------------------------|
|     id      |  text   |           Container ID            |
|    type     |  text   |   Type of mount (bind, volume)    |
|    name     |  text   |        Optional mount name        |
|   source    |  text   |        Source path on host        |
| destination |  text   | Destination path inside container |
|   driver    |  text   |    Driver providing the mount     |
|    mode     |  text   |      Mount options (rw, ro)       |
|     rw      | integer |   1 if read/write. 0 otherwise    |
| propagation |  text   |         Mount propagation         |



#### docker_container_networks
Docker container networks.

|     COLUMN      |  TYPE   |        DESCRIPTION        |
|-----------------|---------|---------------------------|
|       id        |  text   |       Container ID        |
|      name       |  text   |       Network name        |
|   network_id    |  text   |        Network ID         |
|   endpoint_id   |  text   |        Endpoint ID        |
|     gateway     |  text   |          Gateway          |
|   ip_address    |  text   |        IP address         |
|  ip_prefix_len  | integer |  IP subnet prefix length  |
|  ipv6_gateway   |  text   |       IPv6 gateway        |
|  ipv6_address   |  text   |       IPv6 address        |
| ipv6_prefix_len | integer | IPv6 subnet prefix length |
|   mac_address   |  text   |        MAC address        |



#### docker_container_ports
Docker container ports.

|  COLUMN   |  TYPE   |                    DESCRIPTION                    |
|-----------|---------|---------------------------------------------------|
|    id     |  text   |                   Container ID                    |
|   type    |  text   |                Protocol (tcp, udp)                |
|   port    | integer |             Port inside the container             |
|  host_ip  |  text   | Host IP address on which public port is listening |
| host_port | integer |                     Host port                     |



#### docker_container_processes
Docker container processes.

|    COLUMN     |  TYPE   |                    DESCRIPTION                     |
|---------------|---------|----------------------------------------------------|
|      id       |  text   |                    Container ID                    |
|      pid      | bigint  |                     Process ID                     |
|     name      |  text   |       The process path or shorthand argv[0]        |
|    cmdline    |  text   |                   Complete argv                    |
|     state     |  text   |                   Process state                    |
|      uid      | bigint  |                      User ID                       |
|      gid      | bigint  |                      Group ID                      |
|     euid      | bigint  |                 Effective user ID                  |
|     egid      | bigint  |                 Effective group ID                 |
|     suid      | bigint  |                   Saved user ID                    |
|     sgid      | bigint  |                   Saved group ID                   |
|  wired_size   | bigint  |     Bytes of unpagable memory used by process      |
| resident_size | bigint  |      Bytes of private memory used by process       |
|  total_size   | bigint  |             Total virtual memory size              |
|  start_time   | bigint  | Process start in seconds since boot (non-sleeping) |
|    parent     | bigint  |                Process parent's PID                |
|    pgroup     | bigint  |                   Process group                    |
|    threads    | integer |         Number of threads used by process          |
|     nice      | integer |     Process nice level (-20 to 20, default 0)      |
|     user      |  text   |                     User name                      |
|     time      |  text   |     Cumulative CPU time. [DD-]HH:MM:SS format      |
|      cpu      | double  |           CPU utilization as percentage            |
|      mem      | double  |          Memory utilization as percentage          |



#### docker_container_stats
Docker container statistics. Queries on this table take at least one second.

|          COLUMN          |  TYPE   |                     DESCRIPTION                     |
|--------------------------|---------|-----------------------------------------------------|
|            id            |  text   |                    Container ID                     |
|           name           |  text   |                   Container name                    |
|           pids           | integer |                 Number of processes                 |
|           read           | bigint  |           UNIX time when stats were read            |
|         preread          | bigint  |         UNIX time when stats were last read         |
|         interval         | bigint  | Difference between read and preread in nano-seconds |
|        disk_read         | bigint  |                Total disk read bytes                |
|        disk_write        | bigint  |               Total disk write bytes                |
|        num_procs         | integer |                Number of processors                 |
|     cpu_total_usage      | bigint  |                   Total CPU usage                   |
|   cpu_kernelmode_usage   | bigint  |                CPU kernel mode usage                |
|    cpu_usermode_usage    | bigint  |                 CPU user mode usage                 |
|     system_cpu_usage     | bigint  |                  CPU system usage                   |
|       online_cpus        | integer |                     Online CPUs                     |
|   pre_cpu_total_usage    | bigint  |              Last read total CPU usage              |
| pre_cpu_kernelmode_usage | bigint  |           Last read CPU kernel mode usage           |
|  pre_cpu_usermode_usage  | bigint  |            Last read CPU user mode usage            |
|   pre_system_cpu_usage   | bigint  |             Last read CPU system usage              |
|     pre_online_cpus      | integer |                Last read online CPUs                |
|       memory_usage       | bigint  |                    Memory usage                     |
|     memory_max_usage     | bigint  |                Memory maximum usage                 |
|       memory_limit       | bigint  |                    Memory limit                     |
|     network_rx_bytes     | bigint  |              Total network bytes read               |
|     network_tx_bytes     | bigint  |           Total network bytes transmitted           |



#### docker_containers
Docker containers information.

|      COLUMN       |  TYPE   |                                  DESCRIPTION                                   |
|-------------------|---------|--------------------------------------------------------------------------------|
|        id         |  text   |                                  Container ID                                  |
|       name        |  text   |                                 Container name                                 |
|       image       |  text   |               Docker image (name) used to launch this container                |
|     image_id      |  text   |                                Docker image ID                                 |
|      command      |  text   |                             Command with arguments                             |
|      created      | bigint  |                         Time of creation as UNIX time                          |
|       state       |  text   | Container state (created, restarting, running, removing, paused, exited, dead) |
|      status       |  text   |                          Container status information                          |
|        pid        | bigint  |                       Identifier of the initial process                        |
|       path        |  text   |                                 Container path                                 |
| config_entrypoint |  text   |                            Container entrypoint(s)                             |
|    started_at     |  text   |                         Container start time as string                         |
|    finished_at    |  text   |                        Container finish time as string                         |
|    privileged     | integer |                          Is the container privileged                           |
| security_options  |  text   |                       List of container security options                       |
|   env_variables   |  text   |                       Container environmental variables                        |
|  readonly_rootfs  | integer |                  Is the root filesystem mounted as read only                   |
| cgroup_namespace  |  text   |                                cgroup namespace                                |
|   ipc_namespace   |  text   |                                 IPC namespace                                  |
|   mnt_namespace   |  text   |                                Mount namespace                                 |
|   net_namespace   |  text   |                               Network namespace                                |
|   pid_namespace   |  text   |                                 PID namespace                                  |
|  user_namespace   |  text   |                                 User namespace                                 |
|   uts_namespace   |  text   |                                 UTS namespace                                  |



#### docker_image_labels
Docker image labels.

| COLUMN | TYPE |     DESCRIPTION      |
|--------|------|----------------------|
|   id   | text |       Image ID       |
|  key   | text |      Label key       |
| value  | text | Optional label value |



#### docker_images
Docker images information.

|   COLUMN   |  TYPE  |               DESCRIPTION               |
|------------|--------|-----------------------------------------|
|     id     |  text  |                Image ID                 |
|  created   | bigint |      Time of creation as UNIX time      |
| size_bytes | bigint |         Size of image in bytes          |
|    tags    |  text  | Comma-separated list of repository tags |



#### docker_info
Docker system information.

|       COLUMN        |  TYPE   |                                   DESCRIPTION                                   |
|---------------------|---------|---------------------------------------------------------------------------------|
|         id          |  text   |                                Docker system ID                                 |
|     containers      | integer |                           Total number of containers                            |
| containers_running  | integer |                     Number of containers currently running                      |
|  containers_paused  | integer |                      Number of containers in paused state                       |
| containers_stopped  | integer |                      Number of containers in stopped state                      |
|       images        | integer |                                Number of images                                 |
|   storage_driver    |  text   |                                 Storage driver                                  |
|    memory_limit     | integer |                1 if memory limit support is enabled. 0 otherwise                |
|     swap_limit      | integer |                 1 if swap limit support is enabled. 0 otherwise                 |
|    kernel_memory    | integer |            1 if kernel memory limit support is enabled. 0 otherwise             |
|   cpu_cfs_period    | integer | 1 if CPU Completely Fair Scheduler (CFS) period support is enabled. 0 otherwise |
|    cpu_cfs_quota    | integer | 1 if CPU Completely Fair Scheduler (CFS) quota support is enabled. 0 otherwise  |
|     cpu_shares      | integer |            1 if CPU share weighting support is enabled. 0 otherwise             |
|       cpu_set       | integer |             1 if CPU set selection support is enabled. 0 otherwise              |
|   ipv4_forwarding   | integer |                  1 if IPv4 forwarding is enabled. 0 otherwise                   |
| bridge_nf_iptables  | integer |             1 if bridge netfilter iptables is enabled. 0 otherwise              |
| bridge_nf_ip6tables | integer |             1 if bridge netfilter ip6tables is enabled. 0 otherwise             |
|  oom_kill_disable   | integer |                1 if Out-of-memory kill is disabled. 0 otherwise                 |
|   logging_driver    |  text   |                                 Logging driver                                  |
|    cgroup_driver    |  text   |                              Control groups driver                              |
|   kernel_version    |  text   |                                 Kernel version                                  |
|         os          |  text   |                                Operating system                                 |
|       os_type       |  text   |                              Operating system type                              |
|    architecture     |  text   |                              Hardware architecture                              |
|        cpus         | integer |                                 Number of CPUs                                  |
|       memory        | bigint  |                                  Total memory                                   |
|     http_proxy      |  text   |                                   HTTP proxy                                    |
|     https_proxy     |  text   |                                   HTTPS proxy                                   |
|      no_proxy       |  text   |     Comma-separated list of domain extensions proxy should not be used for      |
|        name         |  text   |                             Name of the docker host                             |
|   server_version    |  text   |                                 Server version                                  |
|      root_dir       |  text   |                              Docker root directory                              |



#### docker_network_labels
Docker network labels.

| COLUMN | TYPE |     DESCRIPTION      |
|--------|------|----------------------|
|   id   | text |      Network ID      |
|  key   | text |      Label key       |
| value  | text | Optional label value |



#### docker_networks
Docker networks information.

|   COLUMN    |  TYPE   |                    DESCRIPTION                    |
|-------------|---------|---------------------------------------------------|
|     id      |  text   |                    Network ID                     |
|    name     |  text   |                   Network name                    |
|   driver    |  text   |                  Network driver                   |
|   created   | bigint  |           Time of creation as UNIX time           |
| enable_ipv6 | integer | 1 if IPv6 is enabled on this network. 0 otherwise |
|   subnet    |  text   |                  Network subnet                   |
|   gateway   |  text   |                  Network gateway                  |



#### docker_version
Docker version information.

|     COLUMN      | TYPE |          DESCRIPTION          |
|-----------------|------|-------------------------------|
|     version     | text |        Docker version         |
|   api_version   | text |          API version          |
| min_api_version | text | Minimum API version supported |
|   git_commit    | text |    Docker build git commit    |
|   go_version    | text |          Go version           |
|       os        | text |       Operating system        |
|      arch       | text |     Hardware architecture     |
| kernel_version  | text |        Kernel version         |
|   build_time    | text |          Build time           |



#### docker_volume_labels
Docker volume labels.

| COLUMN | TYPE |     DESCRIPTION      |
|--------|------|----------------------|
|  name  | text |     Volume name      |
|  key   | text |      Label key       |
| value  | text | Optional label value |



#### docker_volumes
Docker volumes information.

|   COLUMN    | TYPE |  DESCRIPTION  |
|-------------|------|---------------|
|    name     | text |  Volume name  |
|   driver    | text | Volume driver |
| mount_point | text |  Mount point  |
|    type     | text |  Volume type  |



#### ec2_instance_metadata
EC2 instance metadata.

|      COLUMN       | TYPE |                                     DESCRIPTION                                     |
|-------------------|------|-------------------------------------------------------------------------------------|
|    instance_id    | text |                                   EC2 instance ID                                   |
|   instance_type   | text |                                  EC2 instance type                                  |
|   architecture    | text |                     Hardware architecture of this EC2 instance                      |
|      region       | text |                     AWS region in which this instance launched                      |
| availability_zone | text |                  Availability zone in which this instance launched                  |
|  local_hostname   | text |          Private IPv4 DNS hostname of the first interface of this instance          |
|    local_ipv4     | text |            Private IPv4 address of the first interface of this instance             |
|        mac        | text |          MAC address for the first network interface of this EC2 instance           |
|  security_groups  | text |                    Comma separated list of security group names                     |
|      iam_arn      | text | If there is an IAM role associated with the instance, contains instance profile ARN |
|      ami_id       | text |                       AMI ID used to launch this EC2 instance                       |
|  reservation_id   | text |                                ID of the reservation                                |
|    account_id     | text |                     AWS account ID which owns this EC2 instance                     |
|  ssh_public_key   | text |         SSH public key. Only available if supplied at instance launch time          |



#### ec2_instance_tags
EC2 instance tag key value pairs.

|   COLUMN    | TYPE |   DESCRIPTION   |
|-------------|------|-----------------|
| instance_id | text | EC2 instance ID |
|     key     | text |     Tag key     |
|    value    | text |    Tag value    |



#### elf_dynamic
ELF dynamic section information.

| COLUMN |  TYPE   |   DESCRIPTION    |
|--------|---------|------------------|
|  tag   | integer |      Tag ID      |
| value  | integer |    Tag value     |
| class  | integer | Class (32 or 64) |
|  path  |  text   | Path to ELF file |



#### elf_info
ELF file information.

|   COLUMN    |  TYPE   |            DESCRIPTION            |
|-------------|---------|-----------------------------------|
|    class    |  text   |      Class type, 32 or 64bit      |
|     abi     |  text   |           Section type            |
| abi_version | integer | Section virtual address in memory |
|    type     |  text   |     Offset of section in file     |
|   machine   | integer |           Machine type            |
|   version   | integer |        Object file version        |
|    entry    | bigint  |        Entry point address        |
|    flags    | integer |         ELF header flags          |
|    path     |  text   |         Path to ELF file          |



#### elf_sections
ELF section information.

| COLUMN |  TYPE   |            DESCRIPTION            |
|--------|---------|-----------------------------------|
|  name  |  text   |           Section name            |
|  type  | integer |           Section type            |
| vaddr  | integer | Section virtual address in memory |
| offset | integer |     Offset of section in file     |
|  size  | integer |          Size of section          |
| flags  |  text   |        Section attributes         |
|  link  |  text   |       Link to other section       |
| align  | integer |         Segment alignment         |
|  path  |  text   |         Path to ELF file          |



#### elf_segments
ELF segment information.

| COLUMN |  TYPE   |            DESCRIPTION            |
|--------|---------|-----------------------------------|
|  name  |  text   |         Segment type/name         |
| offset | integer |      Segment offset in file       |
| vaddr  | integer | Segment virtual address in memory |
| psize  | integer |      Size of segment in file      |
| msize  | integer |     Segment offset in memory      |
| flags  |  text   |        Segment attributes         |
| align  | integer |         Segment alignment         |
|  path  |  text   |         Path to ELF file          |



#### elf_symbols
ELF symbol list.

| COLUMN  |  TYPE   |         DESCRIPTION          |
|---------|---------|------------------------------|
|  name   |  text   |         Symbol name          |
|  addr   | integer |    Symbol address (value)    |
|  size   | integer |        Size of object        |
|  type   |  text   |         Symbol type          |
| binding |  text   |         Binding type         |
| offset  | integer |     Section table index      |
|  table  |  text   | Table name containing symbol |
|  path   |  text   |       Path to ELF file       |



#### etc_hosts
Line-parsed /etc/hosts.

File `/etc/hosts` được phân tích.

|  COLUMN   | TYPE |    DESCRIPTION     |
|-----------|------|--------------------|
|  address  | text | IP address mapping |
| hostnames | text | Raw hosts mapping  |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from etc_hosts;
+-----------+--------------------------------------------------------------------+
| address   | hostnames                                                          |
+-----------+--------------------------------------------------------------------+
| 127.0.0.1 | localhost localhost.localdomain localhost4 localhost4.localdomain4 |
| ::1       | localhost localhost.localdomain localhost6 localhost6.localdomain6 |
+-----------+--------------------------------------------------------------------+
```
</details>



#### etc_protocols
Line-parsed /etc/protocols.

File `/etc/services` được phân tích.

| COLUMN  |  TYPE   |            DESCRIPTION            |
|---------|---------|-----------------------------------|
|  name   |  text   |           Protocol name           |
| number  | integer |          Protocol number          |
|  alias  |  text   |          Protocol alias           |
| comment |  text   | Comment with protocol description |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from etc_protocols;
+-----------------+--------+-----------------+-------------------------------------------------------+
| name            | number | alias           | comment                                               |
+-----------------+--------+-----------------+-------------------------------------------------------+
| ip              | 0      | IP              | internet protocol, pseudo protocol number             |
| hopopt          | 0      | HOPOPT          | hop-by-hop options for ipv6                           |
| icmp            | 1      | ICMP            | internet control message protocol                     |
| igmp            | 2      | IGMP            | internet group management protocol                    |
| ggp             | 3      | GGP             | gateway-gateway protocol                              |
| ipv4            | 4      | IPv4            | IPv4 encapsulation                                    |
| st              | 5      | ST              | ST datagram mode                                      |
| tcp             | 6      | TCP             | transmission control protocol                         |
| cbt             | 7      | CBT             | CBT, Tony Ballardie <A.Ballardie@cs.ucl.ac.uk>        |
| egp             | 8      | EGP             | exterior gateway protocol                             |
| igp             | 9      | IGP             | any private interior gateway (Cisco: for IGRP)        |
| bbn-rcc         | 10     | BBN-RCC-MON     | BBN RCC Monitoring                                    |
| nvp             | 11     | NVP-II          | Network Voice Protocol                                |
| pup             | 12     | PUP             | PARC universal packet protocol                        |
| argus           | 13     | ARGUS           | ARGUS (deprecated)                                    |
| emcon           | 14     | EMCON           | EMCON                                                 |
| xnet            | 15     | XNET            | Cross Net Debugger                                    |
| chaos           | 16     | CHAOS           | Chaos                                                 |
| udp             | 17     | UDP             | user datagram protocol                                |
| mux             | 18     | MUX             | Multiplexing protocol                                 |
| dcn             | 19     | DCN-MEAS        | DCN Measurement Subsystems                            |
| hmp             | 20     | HMP             | host monitoring protocol                              |
| rsvp-e2e-ignore | 134    | RSVP-E2E-IGNORE |                                                       |
| mobility-header | 135    | Mobility-Header | Mobility Header                                       |
| udplite         | 136    | UDPLite         |                                                       |
| mpls-in-ip      | 137    | MPLS-in-IP      |                                                       |
| manet           | 138    | manet           | MANET Protocols                                       |
| hip             | 139    | HIP             | Host Identity Protocol                                |
| shim6           | 140    | Shim6           | Shim6 Protocol                                        |
| wesp            | 141    | WESP            | Wrapped Encapsulating Security Payload                |
| rohc            | 142    | ROHC            | Robust Header Compression                             |
+-----------------+--------+-----------------+-------------------------------------------------------+
```
</details>



#### etc_services
Line-parsed /etc/services.

File `/etc/services` được phân tích.

|  COLUMN  |  TYPE   |                        DESCRIPTION                         |
|----------|---------|------------------------------------------------------------|
|   name   |  text   |                        Service name                        |
|   port   | integer |                    Service port number                     |
| protocol |  text   |                Transport protocol (TCP/UDP)                |
| aliases  |  text   | Optional space separated list of other names for a service |
| comment  |  text   |              Optional comment for a service.               |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from etc_services;
+-----------------+-------+----------+---------------------------------------------+------------------------------------------------------------------------------------------+
| name            | port  | protocol | aliases                                     | comment                                                                                  |
+-----------------+-------+----------+---------------------------------------------+------------------------------------------------------------------------------------------+
| tcpmux          | 1     | tcp      |                                             | TCP port service multiplexer                                                             |
| tcpmux          | 1     | udp      |                                             | TCP port service multiplexer                                                             |
| rje             | 5     | tcp      |                                             | Remote Job Entry                                                                         |
| rje             | 5     | udp      |                                             | Remote Job Entry                                                                         |
| echo            | 7     | tcp      |                                             |                                                                                          |
| echo            | 7     | udp      |                                             |                                                                                          |
| discard         | 9     | tcp      | sink null                                   |                                                                                          |
| discard         | 9     | udp      | sink null                                   |                                                                                          |
| systat          | 11    | tcp      | users                                       |                                                                                          |
| systat          | 11    | udp      | users                                       |                                                                                          |
| daytime         | 13    | tcp      |                                             |                                                                                          |
| daytime         | 13    | udp      |                                             |                                                                                          |
| qotd            | 17    | tcp      | quote                                       |                                                                                          |
| qotd            | 17    | udp      | quote                                       |                                                                                          |
| chargen         | 19    | tcp      | ttytst source                               |                                                                                          |
| chargen         | 19    | udp      | ttytst source                               |                                                                                          |
| ftp-data        | 20    | tcp      |                                             |                                                                                          |
| ftp-data        | 20    | udp      |                                             |                                                                                          |
| ftp             | 21    | tcp      |                                             |                                                                                          |
| ftp             | 21    | udp      | fsp fspd                                    |                                                                                          |
| ssh             | 22    | tcp      |                                             | The Secure Shell (SSH) Protocol                                                          |
| ssh             | 22    | udp      |                                             | The Secure Shell (SSH) Protocol                                                          |
| telnet          | 23    | tcp      |                                             |                                                                                          |
| wpl-analytics   | 8006  | tcp      |                                             | World Programming analytics                                                              |
| wpl-disc        | 8006  | udp      |                                             | World Programming analytics discovery                                                    |
| ucs-isc         | 8070  | tcp      |                                             | Oracle Communication Indexed Search Converter                                            |
| mles            | 8077  | tcp      |                                             | Client-server data distribution                                                          |
| opsmessaging    | 8090  | tcp      |                                             | Vehicle to station messaging                                                             |
| robot-remote    | 8270  | tcp      |                                             | Robot Framework Remote Library Interface                                                 |
| aritts          | 8423  | tcp      |                                             | Aristech text-to-speech server                                                           |
| ssports-bcast   | 8808  | udp      |                                             | STATSports Broadcast Service                                                             |
| CardWeb-IO      | 9060  | tcp      |                                             | CardWeb request-response I/O exchange                                                    |
| CardWeb-RT      | 9060  | udp      |                                             | CardWeb realtime device data                                                             |
| pumpkindb       | 9981  | tcp      |                                             | Event sourcing database engine/language                                                  |
| abb-hw          | 10020 | tcp      |                                             | Hardware configuration and maintenance                                                   |
| tile-ml         | 10261 | tcp      |                                             | Tile remote machine learning                                                             |
| xpra            | 14500 | tcp      |                                             | xpra network protocol                                                                    |
| vdmmesh-disc    | 18668 | udp      |                                             | Manufacturing Execution Systems Mesh Comm                                                |
| vdmmesh         | 18668 | tcp      |                                             | Manufacturing Execution Systems Mesh Comm                                                |
| cora-disc       | 19220 | udp      |                                             | Discovery for Client Connection ... Service                                              |
| cora            | 19220 | tcp      |                                             | Client Connection Mgmt/Data Exchange Service                                             |
| aigairserver    | 21221 | tcp      |                                             | Services for Air Server                                                                  |
| ka-kdp          | 31016 | udp      |                                             | Kollective Agent Kollective Delivery                                                     |
| ka-sddp         | 31016 | tcp      |                                             | Kollective Agent Secure Distributed Delivery                                             |
| edi_service     | 34567 | udp      |                                             | dhanalakshmi.org EDI Service                                                             |
| axio-disc       | 35100 | tcp      |                                             | Axiomatic discovery protocol                                                             |
| axio-disc       | 35100 | udp      |                                             | Axiomatic discovery protocol                                                             |
| pmwebapi        | 44323 | tcp      |                                             | Performance Co-Pilot client HTTP API                                                     |
| cloudcheck-ping | 45514 | udp      |                                             | ASSIA CloudCheck WiFi Management keepalive                                               |
| cloudcheck      | 45514 | tcp      |                                             | ASSIA CloudCheck WiFi Management System                                                  |
| spremotetablet  | 46998 | tcp      |                                             | Capture handwritten signatures                                                           |
+-----------------+-------+----------+---------------------------------------------+------------------------------------------------------------------------------------------+
```
</details>



#### example(EVENTED TABLE)
This is an example table spec.

| COLUMN |  TYPE   |              DESCRIPTION              |
|--------|---------|---------------------------------------|
|  name  |  text   |      Description for name column      |
| points | integer |  This is a signed SQLite int column   |
|  size  | bigint  | This is a signed SQLite bigint column |
| action |  text   |    Action performed in generation     |
|   id   | integer |         An index of some sort         |
|  path  |  text   |            Path of example            |



#### file
Interactive filesystem attributes and metadata.

Thông tin về thuộc tính và metadata của các file.

|     COLUMN      |  TYPE   |                       DESCRIPTION                        |
|-----------------|---------|----------------------------------------------------------|
|      path       |  text   |                    Absolute file path                    |
|    directory    |  text   |                   Directory of file(s)                   |
|    filename     |  text   |                Name portion of file path                 |
|      inode      | bigint  |                 Filesystem inode number                  |
|       uid       | bigint  |                      Owning user ID                      |
|       gid       | bigint  |                     Owning group ID                      |
|      mode       |  text   |                     Permission bits                      |
|     device      | bigint  |                   Device ID (optional)                   |
|      size       | bigint  |                  Size of file in bytes                   |
|   block_size    | integer |                 Block size of filesystem                 |
|      atime      | bigint  |                     Last access time                     |
|      mtime      | bigint  |                  Last modification time                  |
|      ctime      | bigint  |                 Last status change time                  |
|      btime      | bigint  |                 (B)irth or (cr)eate time                 |
|   hard_links    | integer |                   Number of hard links                   |
|     symlink     | integer |         1 if the path is a symlink, otherwise 0          |
|      type       |  text   |                       File status                        |
|   attributes    |  text   | File attrib string. See: https://ss64.com/nt/attrib.html |
|  volume_serial  |  text   |                   Volume serial number                   |
|     file_id     |  text   |                         file ID                          |
| product_version |  text   |                   File product version                   |



#### file_events(EVENTED TABLE)
Track time/action changes to files specified in configuration data.

Thông tin theo dõi sự toàn vẹn của file được chỉ định trong cấu hình.

|     COLUMN     |  TYPE   |                       DESCRIPTION                        |
|----------------|---------|----------------------------------------------------------|
|  target_path   |  text   |            The path associated with the event            |
|    category    |  text   |      The category of the file defined in the config      |
|     action     |  text   |           Change action (UPDATE, REMOVE, etc)            |
| transaction_id | bigint  |                ID used during bulk update                |
|     inode      | bigint  |                 Filesystem inode number                  |
|      uid       | bigint  |                      Owning user ID                      |
|      gid       | bigint  |                     Owning group ID                      |
|      mode      |  text   |                     Permission bits                      |
|      size      | bigint  |                  Size of file in bytes                   |
|     atime      | bigint  |                     Last access time                     |
|     mtime      | bigint  |                  Last modification time                  |
|     ctime      | bigint  |                 Last status change time                  |
|      md5       |  text   |             The MD5 of the file after change             |
|      sha1      |  text   |            The SHA1 of the file after change             |
|     sha256     |  text   |           The SHA256 of the file after change            |
|     hashed     | integer | 1 if the file was hashed, 0 if not, -1 if hashing failed |
|      time      | bigint  |                    Time of file event                    |
|      eid       |  text   |                         Event ID                         |



#### firefox_addons
Firefox browser extensions, webapps, and addons.

Thông tin về các extensions trong firefox, webapps, addons.

|   COLUMN    |  TYPE   |                   DESCRIPTION                    |
|-------------|---------|--------------------------------------------------|
|     uid     | bigint  |        The local user that owns the addon        |
|    name     |  text   |                Addon display name                |
| identifier  |  text   |                 Addon identifier                 |
|   creator   |  text   |          Addon-supported creator string          |
|    type     |  text   |             Extension, addon, webapp             |
|   version   |  text   |          Addon-supplied version string           |
| description |  text   |        Addon-supplied description string         |
| source_url  |  text   |           URL that installed the addon           |
|   visible   | integer |    1 If the addon is shown in browser else 0     |
|   active    | integer |         1 If the addon is active else 0          |
|  disabled   | integer |  1 If the addon is application-disabled else 0   |
| autoupdate  | integer | 1 If the addon applies background updates else 0 |
|   native    | integer | 1 If the addon includes binary components else 0 |
|  location   |  text   |             Global, profile location             |
|    path     |  text   |              Path to plugin bundle               |



#### groups
Local system groups.

Thông tin về các nhóm trên hệ thống.

|   COLUMN   |  TYPE   |                  DESCRIPTION                  |
|------------|---------|-----------------------------------------------|
|    gid     | bigint  |            Unsigned int64 group ID            |
| gid_signed | bigint  |         A signed int64 version of gid         |
| groupname  |  text   |          Canonical local group name           |
| group_sid  |  text   |                Unique group ID                |
|  comment   |  text   | Remarks or comments associated with the group |
| is_hidden  | integer |    IsHidden attribute set in OpenDirectory    |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from groups;
+-------+------------+------------------+
| gid   | gid_signed | groupname        |
+-------+------------+------------------+
| 0     | 0          | root             |
| 1     | 1          | bin              |
| 2     | 2          | daemon           |
| 3     | 3          | sys              |
| 4     | 4          | adm              |
| 5     | 5          | tty              |
| 6     | 6          | disk             |
| 7     | 7          | lp               |
| 8     | 8          | mem              |
| 9     | 9          | kmem             |
| 10    | 10         | wheel            |
| 11    | 11         | cdrom            |
| 12    | 12         | mail             |
| 15    | 15         | man              |
| 18    | 18         | dialout          |
| 19    | 19         | floppy           |
| 20    | 20         | games            |
| 33    | 33         | tape             |
| 39    | 39         | video            |
| 50    | 50         | ftp              |
| 54    | 54         | lock             |
| 63    | 63         | audio            |
| 100   | 100        | users            |
| 65534 | 65534      | nobody           |
| 81    | 81         | dbus             |
| 22    | 22         | utmp             |
| 35    | 35         | utempter         |
| 999   | 999        | input            |
| 36    | 36         | kvm              |
| 998   | 998        | render           |
| 190   | 190        | systemd-journal  |
| 997   | 997        | systemd-coredump |
| 193   | 193        | systemd-resolve  |
| 59    | 59         | tss              |
| 996   | 996        | polkitd          |
| 995   | 995        | unbound          |
| 994   | 994        | ssh_keys         |
| 993   | 993        | sssd             |
| 74    | 74         | sshd             |
| 992   | 992        | chrony           |
| 1000  | 1000       | toor             |
| 27    | 27         | mysql            |
| 991   | 991        | redis            |
+-------+------------+------------------+
```
</details>



#### hardware_events(EVENTED TABLE)
Hardware (PCI/USB/HID) events from UDEV or IOKit.

|  COLUMN   |  TYPE  |              DESCRIPTION               |
|-----------|--------|----------------------------------------|
|  action   |  text  | Remove, insert, change properties, etc |
|   path    |  text  | Local device path assigned (optional)  |
|   type    |  text  |  Type of hardware and hardware event   |
|  driver   |  text  |       Driver claiming the device       |
|  vendor   |  text  |         Hardware device vendor         |
| vendor_id |  text  | Hex encoded Hardware vendor identifier |
|   model   |  text  |         Hardware device model          |
| model_id  |  text  | Hex encoded Hardware model identifier  |
|  serial   |  text  |        Device serial (optional)        |
| revision  |  text  |       Device revision (optional)       |
|   time    | bigint |         Time of hardware event         |
|    eid    |  text  |                Event ID                |



#### hash
Filesystem hash data.

Hàm băm của file hệ thống.

|  COLUMN   | TYPE |               DESCRIPTION               |
|-----------|------|-----------------------------------------|
|   path    | text |    Must provide a path or directory     |
| directory | text |    Must provide a path or directory     |
|    md5    | text |  MD5 hash of provided filesystem data   |
|   sha1    | text |  SHA1 hash of provided filesystem data  |
|  sha256   | text | SHA256 hash of provided filesystem data |
|  ssdeep   | text | ssdeep hash of provided filesystem data |



#### intel_me_info
Intel ME/CSE Info.

| COLUMN  | TYPE |   DESCRIPTION    |
|---------|------|------------------|
| version | text | Intel ME version |



#### interface_addresses
Network interfaces and relevant metadata.

Chứ thông tin về các network interface

|     COLUMN     | TYPE |                        DESCRIPTION                         |
|----------------|------|------------------------------------------------------------|
|   interface    | text |                       Interface name                       |
|    address     | text |               Specific address for interface               |
|      mask      | text |                     Interface netmask                      |
|   broadcast    | text |            Broadcast address for the interface             |
| point_to_point | text |               PtP address for the interface                |
|      type      | text | Type of address. One of dhcp, manual, auto, other, unknown |
| friendly_name  | text |        The friendly display name of the interface.         |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from interface_addresses;
+-----------+----------------------------------+-----------------------------------------+---------------+----------------+---------+
| interface | address                          | mask                                    | broadcast     | point_to_point | type    |
+-----------+----------------------------------+-----------------------------------------+---------------+----------------+---------+
| lo        | 127.0.0.1                        | 255.0.0.0                               |               | 127.0.0.1      | unknown |
| ens160    | 192.168.4.135                    | 255.255.255.0                           | 192.168.4.255 |                | unknown |
| lo        | ::1                              | ffff:ffff:ffff:ffff:ffff:ffff:ffff:ffff |               |                | unknown |
| ens160    | fe80::55b8:2cca:7ab5:bfe3%ens160 | ffff:ffff:ffff:ffff::                   |               |                | unknown |
+-----------+----------------------------------+-----------------------------------------+---------------+----------------+---------+
```
</details>



#### interface_details
Detailed information and stats of network interfaces.

Thông tin chi tiết và số liệu thống kê của các network interface.

|             COLUMN             |  TYPE   |                                                                            DESCRIPTION                                                                            |
|--------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|           interface            |  text   |                                                                          Interface name                                                                           |
|              mac               |  text   |                                                                    MAC of interface (optional)                                                                    |
|              type              | integer |                                                                 Interface type (includes virtual)                                                                 |
|              mtu               | integer |                                                                            Network MTU                                                                            |
|             metric             | integer |                                                            Metric based on the speed of the interface                                                             |
|             flags              | integer |                                                                 Flags (netdevice) for the device                                                                  |
|            ipackets            | bigint  |                                                                           Input packets                                                                           |
|            opackets            | bigint  |                                                                          Output packets                                                                           |
|             ibytes             | bigint  |                                                                            Input bytes                                                                            |
|             obytes             | bigint  |                                                                           Output bytes                                                                            |
|            ierrors             | bigint  |                                                                           Input errors                                                                            |
|            oerrors             | bigint  |                                                                           Output errors                                                                           |
|             idrops             | bigint  |                                                                            Input drops                                                                            |
|             odrops             | bigint  |                                                                           Output drops                                                                            |
|           collisions           | bigint  |                                                                    Packet Collisions detected                                                                     |
|          last_change           | bigint  |                                                            Time of last device modification (optional)                                                            |
|           link_speed           | bigint  |                                                                      Interface speed in Mb/s                                                                      |
|            pci_slot            |  text   |                                                                          PCI slot number                                                                          |
|         friendly_name          |  text   |                                                            The friendly display name of the interface.                                                            |
|          description           |  text   |                                                        Short description of the object a one-line string.                                                         |
|          manufacturer          |  text   |                                                            Name of the network adapter's manufacturer.                                                            |
|         connection_id          |  text   |                                  Name of the network connection as it appears in the Network Connections Control Panel program.                                   |
|       connection_status        |  text   |                                                      State of the network adapter connection to the network.                                                      |
|            enabled             | integer |                                                         Indicates whether the adapter is enabled or not.                                                          |
|        physical_adapter        | integer |                                                 Indicates whether the adapter is a physical or a logical adapter.                                                 |
|             speed              | integer |                                                       Estimate of the current bandwidth in bits per second.                                                       |
|            service             |  text   |                                                         The name of the service the network adapter uses.                                                         |
|          dhcp_enabled          | integer | If TRUE, the dynamic host configuration protocol (DHCP) server automatically assigns an IP address to the computer system when establishing a network connection. |
|       dhcp_lease_expires       |  text   |           Expiration date and time for a leased IP address that was assigned to the computer by the dynamic host configuration protocol (DHCP) server.            |
|      dhcp_lease_obtained       |  text   |            Date and time the lease was obtained for the IP address assigned to the computer by the dynamic host configuration protocol (DHCP) server.             |
|          dhcp_server           |  text   |                                               IP address of the dynamic host configuration protocol (DHCP) server.                                                |
|           dns_domain           |  text   |                     Organization name followed by a period and an extension that indicates the type of organization, such as 'microsoft.com'.                     |
| dns_domain_suffix_search_order |  text   |                                   Array of DNS domain suffixes to be appended to the end of host names during name resolution.                                    |
|         dns_host_name          |  text   |                                        Host name used to identify the local computer for authentication by some utilities.                                        |
|    dns_server_search_order     |  text   |                                               Array of server IP addresses to be used in querying for DNS servers.                                                |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from interface_details;
+-----------+-------------------+------+-------+--------+-------+----------+----------+-----------+-----------+---------+---------+--------+--------+------------+-------------+------------+--------------+
| interface | mac               | type | mtu   | metric | flags | ipackets | opackets | ibytes    | obytes    | ierrors | oerrors | idrops | odrops | collisions | last_change | link_speed | pci_slot     |
+-----------+-------------------+------+-------+--------+-------+----------+----------+-----------+-----------+---------+---------+--------+--------+------------+-------------+------------+--------------+
| lo        | 00:00:00:00:00:00 | 4    | 65536 | 0      | 65609 | 363541   | 363541   | 130229512 | 130229512 | 0       | 0       | 0      | 0      | 0          | -1          | 0          | -1           |
| ens160    | 00:0c:29:97:99:e9 | 1    | 1500  | 0      | 69699 | 10549    | 34059    | 968855    | 45918103  | 0       | 0       | 0      | 0      | 0          | -1          | 10000      | 0000:03:00.0 |
+-----------+-------------------+------+-------+--------+-------+----------+----------+-----------+-----------+---------+---------+--------+--------+------------+-------------+------------+--------------+
```
</details>



#### interface_ipv6
IPv6 configuration and stats of network interfaces.

Thông tin về cấu hình IPv6 và số liệu thống kê về network interface.

|       COLUMN       |  TYPE   |           DESCRIPTION            |
|--------------------|---------|----------------------------------|
|     interface      |  text   |          Interface name          |
|     hop_limit      | integer |        Current Hop Limit         |
| forwarding_enabled | integer |       Enable IP forwarding       |
|  redirect_accept   | integer |  Accept ICMP redirect messages   |
|    rtadv_accept    | integer | Accept ICMP Router Advertisement |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from interface_ipv6;
+-----------+-----------+--------------------+-----------------+--------------+
| interface | hop_limit | forwarding_enabled | redirect_accept | rtadv_accept |
+-----------+-----------+--------------------+-----------------+--------------+
| lo        | 64        | 0                  | 1               | 1            |
| ens160    | 64        | 0                  | 1               | 1            |
+-----------+-----------+--------------------+-----------------+--------------+
```
</details>



#### iptables
Linux IP packet filtering and NAT tool.
Thông tin về tường lửa lọc gói tin và NAT tool.

|    COLUMN     |  TYPE   |                DESCRIPTION                |
|---------------|---------|-------------------------------------------|
|  filter_name  |  text   |    Packet matching filter table name.     |
|     chain     |  text   |          Size of module content.          |
|    policy     |  text   |    Policy that applies for this rule.     |
|    target     |  text   |    Target that applies for this rule.     |
|   protocol    | integer |      Protocol number identification.      |
|   src_port    |  text   |         Protocol source port(s).          |
|   dst_port    |  text   |       Protocol destination port(s).       |
|    src_ip     |  text   |            Source IP address.             |
|   src_mask    |  text   |          Source IP address mask.          |
|    iniface    |  text   |       Input interface for the rule.       |
| iniface_mask  |  text   |    Input interface mask for the rule.     |
|    dst_ip     |  text   |          Destination IP address.          |
|   dst_mask    |  text   |       Destination IP address mask.        |
|   outiface    |  text   |      Output interface for the rule.       |
| outiface_mask |  text   |    Output interface mask for the rule.    |
|     match     |  text   |        Matching rule that applies.        |
|    packets    | integer | Number of matching packets for this rule. |
|     bytes     | integer |  Number of matching bytes for this rule.  |



#### kernel_info
Basic active kernel information.

Thông tin cơ bản về kernel.

|  COLUMN   | TYPE |       DESCRIPTION        |
|-----------|------|--------------------------|
|  version  | text |      Kernel version      |
| arguments | text |     Kernel arguments     |
|   path    | text |       Kernel path        |
|  device   | text | Kernel device identifier |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from kernel_info;
+-----------------------------+-----------------------------------------------------------------------------------------------+--------------------------------------------------+---------------------+
| version                     | arguments                                                                                     | path                                             | device              |
+-----------------------------+-----------------------------------------------------------------------------------------------+--------------------------------------------------+---------------------+
| 4.18.0-80.11.2.el8_0.x86_64 | ro crashkernel=auto resume=/dev/mapper/cl-swap rd.lvm.lv=cl/root rd.lvm.lv=cl/swap rhgb quiet | (hd0,msdos1)/vmlinuz-4.18.0-80.11.2.el8_0.x86_64 | /dev/mapper/cl-root |
+-----------------------------+-----------------------------------------------------------------------------------------------+--------------------------------------------------+---------------------+
```
</details>



#### kernel_modules
Linux kernel modules both loaded and within the load search path.

Thông tin về các mô-đun hạt nhân Linux được tải.

| COLUMN  | TYPE |         DESCRIPTION         |
|---------|------|-----------------------------|
|  name   | text |         Module name         |
|  size   | text |   Size of module content    |
| used_by | text | Module reverse dependencies |
| status  | text |    Kernel module status     |
| address | text |    Kernel module address    |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from kernel_modules;
+--------------------------+---------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+--------------------+
| name                     | size    | used_by                                                                                                                                                                                   | status | address            |
+--------------------------+---------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+--------------------+
| nf_tables_set            | 32768   | -                                                                                                                                                                                         | Live   | 0xffffffffc084f000 |
| nft_fib_inet             | 16384   | -                                                                                                                                                                                         | Live   | 0xffffffffc084a000 |
| nft_fib_ipv4             | 16384   | nft_fib_inet                                                                                                                                                                              | Live   | 0xffffffffc0845000 |
| nft_fib_ipv6             | 16384   | nft_fib_inet                                                                                                                                                                              | Live   | 0xffffffffc0840000 |
| nft_fib                  | 16384   | nft_fib_inet,nft_fib_ipv4,nft_fib_ipv6                                                                                                                                                    | Live   | 0xffffffffc083b000 |
| nft_reject_inet          | 16384   | -                                                                                                                                                                                         | Live   | 0xffffffffc0836000 |
| nf_reject_ipv4           | 16384   | nft_reject_inet                                                                                                                                                                           | Live   | 0xffffffffc0831000 |
| nf_reject_ipv6           | 16384   | nft_reject_inet                                                                                                                                                                           | Live   | 0xffffffffc082c000 |
| nft_reject               | 16384   | nft_reject_inet                                                                                                                                                                           | Live   | 0xffffffffc0827000 |
| nft_ct                   | 20480   | -                                                                                                                                                                                         | Live   | 0xffffffffc0821000 |
| nft_chain_nat_ipv6       | 16384   | -                                                                                                                                                                                         | Live   | 0xffffffffc081c000 |
| nf_conntrack_ipv6        | 20480   | -                                                                                                                                                                                         | Live   | 0xffffffffc0812000 |
| nf_defrag_ipv6           | 20480   | nf_conntrack_ipv6                                                                                                                                                                         | Live   | 0xffffffffc0808000 |
| nf_nat_ipv6              | 16384   | nft_chain_nat_ipv6                                                                                                                                                                        | Live   | 0xffffffffc07ff000 |
| nft_chain_route_ipv6     | 16384   | -                                                                                                                                                                                         | Live   | 0xffffffffc07fa000 |
| nft_chain_nat_ipv4       | 16384   | -                                                                                                                                                                                         | Live   | 0xffffffffc07f5000 |
| nf_conntrack_ipv4        | 16384   | -                                                                                                                                                                                         | Live   | 0xffffffffc07ec000 |
| nf_defrag_ipv4           | 16384   | nf_conntrack_ipv4                                                                                                                                                                         | Live   | 0xffffffffc07de000 |
| nf_nat_ipv4              | 16384   | nft_chain_nat_ipv4                                                                                                                                                                        | Live   | 0xffffffffc07e3000 |
| nf_nat                   | 36864   | nf_nat_ipv6,nf_nat_ipv4                                                                                                                                                                   | Live   | 0xffffffffc07cb000 |
| nft_chain_route_ipv4     | 16384   | -                                                                                                                                                                                         | Live   | 0xffffffffc07d9000 |
| nf_conntrack             | 155648  | nft_ct,nf_conntrack_ipv6,nf_nat_ipv6,nf_conntrack_ipv4,nf_nat_ipv4,nf_nat                                                                                                                 | Live   | 0xffffffffc07a4000 |
| ip6_tables               | 32768   | -                                                                                                                                                                                         | Live   | 0xffffffffc0797000 |
| ip_tables                | 28672   | -                                                                                                                                                                                         | Live   | 0xffffffffc078b000 |
| nft_compat               | 20480   | -                                                                                                                                                                                         | Live   | 0xffffffffc0781000 |
| ip_set                   | 45056   | -                                                                                                                                                                                         | Live   | 0xffffffffc0743000 |
| nf_tables                | 147456  | nf_tables_set,nft_fib_inet,nft_fib_ipv4,nft_fib_ipv6,nft_fib,nft_reject_inet,nft_reject,nft_ct,nft_chain_nat_ipv6,nft_chain_route_ipv6,nft_chain_nat_ipv4,nft_chain_route_ipv4,nft_compat | Live   | 0xffffffffc071e000 |
| nfnetlink                | 16384   | nft_compat,ip_set,nf_tables                                                                                                                                                               | Live   | 0xffffffffc0715000 |
| vmw_vsock_vmci_transport | 32768   | -                                                                                                                                                                                         | Live   | 0xffffffffc06ee000 |
| vsock                    | 40960   | vmw_vsock_vmci_transport                                                                                                                                                                  | Live   | 0xffffffffc06de000 |
| ext4                     | 733184  | -                                                                                                                                                                                         | Live   | 0xffffffffc062a000 |
| mbcache                  | 16384   | ext4                                                                                                                                                                                      | Live   | 0xffffffffc0604000 |
| jbd2                     | 122880  | ext4                                                                                                                                                                                      | Live   | 0xffffffffc060b000 |
| snd_ens1371              | 32768   | -                                                                                                                                                                                         | Live   | 0xffffffffc05f1000 |
| crct10dif_pclmul         | 16384   | -                                                                                                                                                                                         | Live   | 0xffffffffc05fa000 |
| crc32_pclmul             | 16384   | -                                                                                                                                                                                         | Live   | 0xffffffffc05c3000 |
| snd_ac97_codec           | 143360  | snd_ens1371                                                                                                                                                                               | Live   | 0xffffffffc05cd000 |
| ac97_bus                 | 16384   | snd_ac97_codec                                                                                                                                                                            | Live   | 0xffffffffc05c8000 |
| snd_rawmidi              | 40960   | snd_ens1371                                                                                                                                                                               | Live   | 0xffffffffc05b8000 |
| ghash_clmulni_intel      | 16384   | -                                                                                                                                                                                         | Live   | 0xffffffffc0589000 |
| snd_seq_device           | 16384   | snd_rawmidi                                                                                                                                                                               | Live   | 0xffffffffc0561000 |
| snd_pcm                  | 110592  | snd_ens1371,snd_ac97_codec                                                                                                                                                                | Live   | 0xffffffffc059c000 |
| snd_timer                | 36864   | snd_pcm                                                                                                                                                                                   | Live   | 0xffffffffc0592000 |
| snd                      | 94208   | snd_ens1371,snd_ac97_codec,snd_rawmidi,snd_seq_device,snd_pcm,snd_timer                                                                                                                   | Live   | 0xffffffffc0571000 |
| vmw_balloon              | 24576   | -                                                                                                                                                                                         | Live   | 0xffffffffc0566000 |
| intel_rapl_perf          | 16384   | -                                                                                                                                                                                         | Live   | 0xffffffffc055c000 |
| soundcore                | 16384   | snd                                                                                                                                                                                       | Live   | 0xffffffffc029a000 |
| pcspkr                   | 16384   | -                                                                                                                                                                                         | Live   | 0xffffffffc0262000 |
| sg                       | 40960   | -                                                                                                                                                                                         | Live   | 0xffffffffc054d000 |
| joydev                   | 24576   | -                                                                                                                                                                                         | Live   | 0xffffffffc0529000 |
| vmw_vmci                 | 86016   | vmw_vsock_vmci_transport,vmw_balloon                                                                                                                                                      | Live   | 0xffffffffc0537000 |
| i2c_piix4                | 24576   | -                                                                                                                                                                                         | Live   | 0xffffffffc0530000 |
| xfs                      | 1474560 | -                                                                                                                                                                                         | Live   | 0xffffffffc03c0000 |
| libcrc32c                | 16384   | nf_nat,nf_conntrack,xfs                                                                                                                                                                   | Live   | 0xffffffffc0272000 |
| sr_mod                   | 28672   | -                                                                                                                                                                                         | Live   | 0xffffffffc02a0000 |
| cdrom                    | 69632   | sr_mod                                                                                                                                                                                    | Live   | 0xffffffffc03ae000 |
| vmwgfx                   | 327680  | -                                                                                                                                                                                         | Live   | 0xffffffffc035d000 |
| ata_generic              | 16384   | -                                                                                                                                                                                         | Live   | 0xffffffffc025d000 |
| drm_kms_helper           | 200704  | vmwgfx                                                                                                                                                                                    | Live   | 0xffffffffc032b000 |
| syscopyarea              | 16384   | drm_kms_helper                                                                                                                                                                            | Live   | 0xffffffffc0258000 |
| sysfillrect              | 16384   | drm_kms_helper                                                                                                                                                                            | Live   | 0xffffffffc0251000 |
| sysimgblt                | 16384   | drm_kms_helper                                                                                                                                                                            | Live   | 0xffffffffc024a000 |
| fb_sys_fops              | 16384   | drm_kms_helper                                                                                                                                                                            | Live   | 0xffffffffc0243000 |
| ttm                      | 131072  | vmwgfx                                                                                                                                                                                    | Live   | 0xffffffffc0279000 |
| ahci                     | 40960   | -                                                                                                                                                                                         | Live   | 0xffffffffc0267000 |
| drm                      | 520192  | vmwgfx,drm_kms_helper,ttm                                                                                                                                                                 | Live   | 0xffffffffc02ab000 |
| libahci                  | 40960   | ahci                                                                                                                                                                                      | Live   | 0xffffffffc0238000 |
| ata_piix                 | 36864   | -                                                                                                                                                                                         | Live   | 0xffffffffc01ea000 |
| libata                   | 274432  | ata_generic,ahci,libahci,ata_piix                                                                                                                                                         | Live   | 0xffffffffc01f4000 |
| crc32c_intel             | 24576   | -                                                                                                                                                                                         | Live   | 0xffffffffc01d6000 |
| nvme                     | 45056   | -                                                                                                                                                                                         | Live   | 0xffffffffc01de000 |
| serio_raw                | 16384   | -                                                                                                                                                                                         | Live   | 0xffffffffc01be000 |
| nvme_core                | 73728   | nvme                                                                                                                                                                                      | Live   | 0xffffffffc01c3000 |
| vmxnet3                  | 61440   | -                                                                                                                                                                                         | Live   | 0xffffffffc01ae000 |
| dm_mirror                | 28672   | -                                                                                                                                                                                         | Live   | 0xffffffffc0190000 |
| dm_region_hash           | 20480   | dm_mirror                                                                                                                                                                                 | Live   | 0xffffffffc0179000 |
| dm_log                   | 20480   | dm_mirror,dm_region_hash                                                                                                                                                                  | Live   | 0xffffffffc0186000 |
| dm_mod                   | 151552  | dm_mirror,dm_log                                                                                                                                                                          | Live   | 0xffffffffc0153000 |
+--------------------------+---------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+--------+--------------------+
```
</details>



#### known_hosts
A line-delimited known_hosts table.

|  COLUMN  |  TYPE  |                  DESCRIPTION                  |
|----------|--------|-----------------------------------------------|
|   uid    | bigint | The local user that owns the known_hosts file |
|   key    |  text  |          parsed authorized keys line          |
| key_file |  text  |           Path to known_hosts file            |



#### last
System logins and logouts.

Chứa thông tin về lịch sử đăng nhập của user.

|  COLUMN  |  TYPE   |                   DESCRIPTION                   |
|----------|---------|-------------------------------------------------|
| username |  text   |                 Entry username                  |
|   tty    |  text   |                 Entry terminal                  |
|   pid    | integer |             Process (or thread) ID              |
|   type   | integer | Entry type, according to ut_type types (utmp.h) |
|   time   | integer |                 Entry timestamp                 |
|   host   |  text   |                 Entry hostname                  |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from last;
+----------+-------+-------+------+------------+-------------+
| username | tty   | pid   | type | time       | host        |
+----------+-------+-------+------+------------+-------------+
| toor     | pts/0 | 6611  | 7    | 1575681968 | 192.168.4.1 |
| toor     | pts/0 | 6583  | 7    | 1575682498 | 192.168.4.1 |
| toor     | pts/1 | 10462 | 7    | 1575684146 | 192.168.4.1 |
| toor     | pts/0 | 1717  | 7    | 1575793587 | 192.168.4.1 |
| toor     | pts/0 | 1740  | 7    | 1575853689 | 192.168.4.1 |
| toor     | pts/0 | 1657  | 7    | 1575854714 | 192.168.4.1 |
| toor     | pts/0 | 1718  | 7    | 1575855343 | 192.168.4.1 |
| toor     | pts/0 | 1795  | 7    | 1575857057 | 192.168.4.1 |
| toor     | pts/0 | 1589  | 7    | 1575895498 | 192.168.4.1 |
| toor     | pts/0 | 1776  | 7    | 1575940552 | 192.168.4.1 |
| toor     | pts/1 | 2583  | 7    | 1575946089 | 192.168.4.1 |
| toor     | pts/0 | 1741  | 7    | 1575947657 | 192.168.4.1 |
| toor     | pts/1 | 1806  | 7    | 1575947678 | 192.168.4.1 |
| toor     | pts/0 | 3198  | 7    | 1575972900 | 192.168.4.1 |
| toor     | pts/0 | 1789  | 7    | 1576025907 | 192.168.4.1 |
| toor     | pts/1 | 1971  | 7    | 1576032047 | 192.168.4.1 |
+----------+-------+-------+------+------------+-------------+
```
</details>



#### listening_ports
Processes with listening (bound) network sockets/ports.

Thông tin về các process và sockets/port mà nó đang lắng nghe.

|    COLUMN     |  TYPE   |                DESCRIPTION                |
|---------------|---------|-------------------------------------------|
|      pid      | integer |          Process (or thread) ID           |
|     port      | integer |           Transport layer port            |
|   protocol    | integer |       Transport protocol (TCP/UDP)        |
|    family     | integer |       Network protocol (IPv4, IPv6)       |
|    address    |  text   |         Specific address for bind         |
|      fd       | bigint  |       Socket file descriptor number       |
|    socket     | bigint  |       Socket handle or inode number       |
|     path      |  text   |       Path for UNIX domain sockets        |
| net_namespace |  text   | The inode number of the network namespace |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from listening_ports;
+------+-------+----------+--------+---------------+----+--------+-------------------------------------------------------+---------------+
| pid  | port  | protocol | family | address       | fd | socket | path                                                  | net_namespace |
+------+-------+----------+--------+---------------+----+--------+-------------------------------------------------------+---------------+
| 957  | 22    | 6        | 2      | 0.0.0.0       | 6  | 28621  |                                                       | 4026531992    |
| 960  | 6379  | 6        | 2      | 127.0.0.1     | 6  | 28693  |                                                       | 4026531992    |
| 957  | 22    | 6        | 10     | ::            | 8  | 28630  |                                                       | 4026531992    |
| 1009 | 33060 | 6        | 10     | ::            | 39 | 34051  |                                                       | 4026531992    |
| 1009 | 3306  | 6        | 10     | ::            | 32 | 34036  |                                                       | 4026531992    |
| 959  | 8080  | 6        | 10     | ::            | 8  | 34070  |                                                       | 4026531992    |
| 872  | 323   | 17       | 2      | 127.0.0.1     | 6  | 26125  |                                                       | 4026531992    |
| 940  | 68    | 17       | 2      | 192.168.4.135 | 18 | 41092  |                                                       | 4026531992    |
| 872  | 323   | 17       | 10     | ::1           | 7  | 26126  |                                                       | 4026531992    |
| 940  | 58    | 255      | 10     | ::            | 21 | 33381  |                                                       | 4026531992    |
| 1    | 0     | 0        | 1      |               | 15 | 0      | /run/systemd/private                                  | 4026531992    |
| 1009 | 0     | 0        | 1      |               | 40 | 0      | /var/run/mysqld/mysqlx.sock                           | 4026531992    |
| 729  | 0     | 0        | 1      |               | 5  | 0      | /run/systemd/journal/dev-log                          | 4026531992    |
| 872  | 0     | 0        | 1      |               | 9  | 0      | /var/run/chrony/chronyd.sock                          | 4026531992    |
| 1    | 0     | 0        | 1      |               | 43 | 0      | /var/run/.heim_org.h5l.kcm-socket                     | 4026531992    |
| 870  | 0     | 0        | 1      |               | 3  | 0      | /run/dbus/system_bus_socket                           | 4026531992    |
| 1    | 0     | 0        | 1      |               | 31 | 0      | /run/systemd/coredump                                 | 4026531992    |
| 1    | 0     | 0        | 1      |               | 37 | 0      | /run/lvm/lvmpolld.socket                              | 4026531992    |
| 1787 | 0     | 0        | 1      |               | 15 | 0      | /run/user/1000/systemd/notify                         | 4026531992    |
| 1787 | 0     | 0        | 1      |               | 18 | 0      | /run/user/1000/systemd/private                        | 4026531992    |
| 1787 | 0     | 0        | 1      |               | 11 | 0      | /run/user/1000/bus                                    | 4026531992    |
| 894  | 0     | 0        | 1      |               | 16 | 0      | /var/lib/sss/pipes/nss                                | 4026531992    |
| 868  | 0     | 0        | 1      |               | 10 | 0      | /var/run/vmware/guestServicePipe                      | 4026531992    |
| 1761 | 0     | 0        | 1      |               | 17 | 0      | /var/osquery/osquery.em                               | 4026531992    |
| 865  | 0     | 0        | 1      |               | 13 | 0      | /var/lib/sss/pipes/private/sbus-monitor               | 4026531992    |
| 893  | 0     | 0        | 1      |               | 15 | 0      | /var/lib/sss/pipes/private/sbus-dp_implicit_files.893 | 4026531992    |
| 1009 | 0     | 0        | 1      |               | 33 | 0      | /var/lib/mysql/mysql.sock                             | 4026531992    |
| 1873 | 0     | 0        | 1      |               | 9  | 0      | /root/.osquery/shell.em                               | 4026531992    |
| 765  | 0     | 0        | 1      |               | 4  | 0      | /run/udev/control                                     | 4026531992    |
| 1    | 0     | 0        | 1      |               | 18 | 0      | /run/systemd/notify                                   | 4026531992    |
| 1    | 0     | 0        | 1      |               | 25 | 0      | /run/systemd/cgroups-agent                            | 4026531992    |
| 729  | 0     | 0        | 1      |               | 3  | 0      | /run/systemd/journal/stdout                           | 4026531992    |
| 729  | 0     | 0        | 1      |               | 4  | 0      | /run/systemd/journal/socket                           | 4026531992    |
| 729  | 0     | 0        | 1      |               | 19 | 0      | /run/systemd/journal/stdout                           | 4026531992    |
| 729  | 0     | 0        | 1      |               | 20 | 0      | /run/systemd/journal/stdout                           | 4026531992    |
| 870  | 0     | 0        | 1      |               | 21 | 0      | /run/dbus/system_bus_socket                           | 4026531992    |
| 870  | 0     | 0        | 1      |               | 16 | 0      | /run/dbus/system_bus_socket                           | 4026531992    |
| 870  | 0     | 0        | 1      |               | 15 | 0      | /run/dbus/system_bus_socket                           | 4026531992    |
| 870  | 0     | 0        | 1      |               | 14 | 0      | /run/dbus/system_bus_socket                           | 4026531992    |
| 729  | 0     | 0        | 1      |               | 29 | 0      | /run/systemd/journal/stdout                           | 4026531992    |
| 729  | 0     | 0        | 1      |               | 16 | 0      | /run/systemd/journal/stdout                           | 4026531992    |
| 729  | 0     | 0        | 1      |               | 17 | 0      | /run/systemd/journal/stdout                           | 4026531992    |
| 870  | 0     | 0        | 1      |               | 12 | 0      | /run/dbus/system_bus_socket                           | 4026531992    |
| 729  | 0     | 0        | 1      |               | 28 | 0      | /run/systemd/journal/stdout                           | 4026531992    |
| 729  | 0     | 0        | 1      |               | 30 | 0      | /run/systemd/journal/stdout                           | 4026531992    |
| 893  | 0     | 0        | 1      |               | 23 | 0      | /var/lib/sss/pipes/private/sbus-dp_implicit_files.893 | 4026531992    |
| 894  | 0     | 0        | 1      |               | 32 | 0      | /var/lib/sss/pipes/nss                                | 4026531992    |
| 729  | 0     | 0        | 1      |               | 24 | 0      | /run/systemd/journal/stdout                           | 4026531992    |
| 865  | 0     | 0        | 1      |               | 18 | 0      | /var/lib/sss/pipes/private/sbus-monitor               | 4026531992    |
| 729  | 0     | 0        | 1      |               | 21 | 0      | /run/systemd/journal/stdout                           | 4026531992    |
| 729  | 0     | 0        | 1      |               | 23 | 0      | /run/systemd/journal/stdout                           | 4026531992    |
| 870  | 0     | 0        | 1      |               | 19 | 0      | /run/dbus/system_bus_socket                           | 4026531992    |
| 729  | 0     | 0        | 1      |               | 27 | 0      | /run/systemd/journal/stdout                           | 4026531992    |
| 870  | 0     | 0        | 1      |               | 22 | 0      | /run/dbus/system_bus_socket                           | 4026531992    |
| 865  | 0     | 0        | 1      |               | 19 | 0      | /var/lib/sss/pipes/private/sbus-monitor               | 4026531992    |
| 893  | 0     | 0        | 1      |               | 17 | 0      | /var/lib/sss/pipes/private/sbus-dp_implicit_files.893 | 4026531992    |
| 729  | 0     | 0        | 1      |               | 26 | 0      | /run/systemd/journal/stdout                           | 4026531992    |
| 729  | 0     | 0        | 1      |               | 18 | 0      | /run/systemd/journal/stdout                           | 4026531992    |
| 870  | 0     | 0        | 1      |               | 13 | 0      | /run/dbus/system_bus_socket                           | 4026531992    |
| 729  | 0     | 0        | 1      |               | 22 | 0      | /run/systemd/journal/stdout                           | 4026531992    |
| 729  | 0     | 0        | 1      |               | 25 | 0      | /run/systemd/journal/stdout                           | 4026531992    |
| 865  | 0     | 0        | 1      |               | 15 | 0      | /var/lib/sss/pipes/private/sbus-monitor               | 4026531992    |
+------+-------+----------+--------+---------------+----+--------+-------------------------------------------------------+---------------+
```
</details>



#### lldp_neighbors
LLDP neighbors of interfaces.

|                COLUMN                 |  TYPE   |                  DESCRIPTION                   |
|---------------------------------------|---------|------------------------------------------------|
|               interface               |  text   |                 Interface name                 |
|                  rid                  | integer |             Neighbor chassis index             |
|            chassis_id_type            |  text   |            Neighbor chassis ID type            |
|              chassis_id               |  text   |           Neighbor chassis ID value            |
|            chassis_sysname            |  text   |  CPU brand string, contains vendor and model   |
|        chassis_sys_description        | integer |        Max number of CPU physical cores        |
|  chassis_bridge_capability_available  | integer |     Chassis bridge capability availability     |
|   chassis_bridge_capability_enabled   | integer |     Is chassis bridge capability enabled.      |
|  chassis_router_capability_available  | integer |     Chassis router capability availability     |
|   chassis_router_capability_enabled   | integer |       Chassis router capability enabled        |
| chassis_repeater_capability_available | integer |    Chassis repeater capability availability    |
|  chassis_repeater_capability_enabled  | integer |      Chassis repeater capability enabled       |
|   chassis_wlan_capability_available   | integer |      Chassis wlan capability availability      |
|    chassis_wlan_capability_enabled    | integer |        Chassis wlan capability enabled         |
|   chassis_tel_capability_available    | integer |   Chassis telephone capability availability    |
|    chassis_tel_capability_enabled     | integer |      Chassis telephone capability enabled      |
|  chassis_docsis_capability_available  | integer |     Chassis DOCSIS capability availability     |
|   chassis_docsis_capability_enabled   | integer |       Chassis DOCSIS capability enabled        |
| chassis_station_capability_available  | integer |    Chassis station capability availability     |
|  chassis_station_capability_enabled   | integer |       Chassis station capability enabled       |
|  chassis_other_capability_available   | integer |     Chassis other capability availability      |
|   chassis_other_capability_enabled    | integer |        Chassis other capability enabled        |
|           chassis_mgmt_ips            |  text   | Comma delimited list of chassis management IPS |
|             port_id_type              |  text   |                  Port ID type                  |
|                port_id                |  text   |                 Port ID value                  |
|           port_description            |  text   |                Port description                |
|               port_ttl                | bigint  |              Age of neighbor port              |
|               port_mfs                | bigint  |              Port max frame size               |
|          port_aggregation_id          |  text   |              Port aggregation ID               |
|        port_autoneg_supported         | integer |           Auto negotiation supported           |
|         port_autoneg_enabled          | integer |          Is auto negotiation enabled           |
|             port_mau_type             |  text   |                    MAU type                    |
|    port_autoneg_10baset_hd_enabled    | integer |      10Base-T HD auto negotiation enabled      |
|    port_autoneg_10baset_fd_enabled    | integer |      10Base-T FD auto negotiation enabled      |
|   port_autoneg_100basetx_hd_enabled   | integer |     100Base-TX HD auto negotiation enabled     |
|   port_autoneg_100basetx_fd_enabled   | integer |     100Base-TX FD auto negotiation enabled     |
|   port_autoneg_100baset2_hd_enabled   | integer |     100Base-T2 HD auto negotiation enabled     |
|   port_autoneg_100baset2_fd_enabled   | integer |     100Base-T2 FD auto negotiation enabled     |
|   port_autoneg_100baset4_hd_enabled   | integer |     100Base-T4 HD auto negotiation enabled     |
|   port_autoneg_100baset4_fd_enabled   | integer |     100Base-T4 FD auto negotiation enabled     |
|   port_autoneg_1000basex_hd_enabled   | integer |     1000Base-X HD auto negotiation enabled     |
|   port_autoneg_1000basex_fd_enabled   | integer |     1000Base-X FD auto negotiation enabled     |
|   port_autoneg_1000baset_hd_enabled   | integer |     1000Base-T HD auto negotiation enabled     |
|   port_autoneg_1000baset_fd_enabled   | integer |     1000Base-T FD auto negotiation enabled     |
|           power_device_type           |  text   |             Dot3 power device type             |
|          power_mdi_supported          | integer |              MDI power supported               |
|           power_mdi_enabled           | integer |              Is MDI power enabled              |
|       power_paircontrol_enabled       | integer |         Is power pair control enabled          |
|              power_pairs              |  text   |                Dot3 power pairs                |
|              power_class              |  text   |                  Power class                   |
|         power_8023at_enabled          | integer |               Is 802.3at enabled               |
|        power_8023at_power_type        |  text   |               802.3at power type               |
|       power_8023at_power_source       |  text   |              802.3at power source              |
|      power_8023at_power_priority      |  text   |             802.3at power priority             |
|     power_8023at_power_allocated      |  text   |            802.3at power allocated             |
|     power_8023at_power_requested      |  text   |            802.3at power requested             |
|            med_device_type            |  text   |                Chassis MED type                |
|      med_capability_capabilities      | integer |          Is MED capabilities enabled           |
|         med_capability_policy         | integer |        Is MED policy capability enabled        |
|        med_capability_location        | integer |       Is MED location capability enabled       |
|        med_capability_mdi_pse         | integer |       Is MED MDI PSE capability enabled        |
|         med_capability_mdi_pd         | integer |        Is MED MDI PD capability enabled        |
|       med_capability_inventory        | integer |      Is MED inventory capability enabled       |
|             med_policies              |  text   |      Comma delimited list of MED policies      |
|                 vlans                 |  text   |        Comma delimited list of vlan ids        |
|                 pvid                  |  text   |                Primary VLAN id                 |
|           ppvids_supported            |  text   |    Comma delimited list of supported PPVIDs    |
|            ppvids_enabled             |  text   |     Comma delimited list of enabled PPVIDs     |
|                 pids                  |  text   |          Comma delimited list of PIDs          |



#### load_average
Displays information about the system wide load averages.

Thông tin về mức trung bình tải của hệ thống.

| COLUMN  | TYPE |                 DESCRIPTION                  |
|---------|------|----------------------------------------------|
| period  | text | Period over which the average is calculated. |
| average | text |   Load average over the specified period.    |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from load_average;
+--------+----------+
| period | average  |
+--------+----------+
| 1m     | 0.070000 |
| 5m     | 0.040000 |
| 15m    | 0.010000 |
+--------+----------+
```
</details>



#### logged_in_users
Users with an active shell on the system.

Lịch sử của những user có quyền shell đang hoạt động trên hệ hống.

|    COLUMN     |  TYPE   |              DESCRIPTION              |
|---------------|---------|---------------------------------------|
|     type      |  text   |              Login type               |
|     user      |  text   |            User login name            |
|      tty      |  text   |              Device name              |
|     host      |  text   |            Remote hostname            |
|     time      | integer |          Time entry was made          |
|      pid      | integer |        Process (or thread) ID         |
|      sid      |  text   | The user's unique security identifier |
| registry_hive |  text   |       HKEY_USERS registry hive        |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from logged_in_users;
+-----------+----------+-------+-----------------------------+------------+-------+
| type      | user     | tty   | host                        | time       | pid   |
+-----------+----------+-------+-----------------------------+------------+-------+
| boot_time | reboot   | ~     | 4.18.0-80.el8.x86_64        | 1574951925 | 0     |
| init      |          | tty1  |                             | 1574951936 | 943   |
| login     | LOGIN    | tty1  |                             | 1574951936 | 943   |
| runlevel  | runlevel | ~     | 4.18.0-80.el8.x86_64        | 1574951936 | 51    |
| dead      |          | tty1  |                             | 1574951943 | 943   |
| runlevel  | shutdown | ~     | 4.18.0-80.el8.x86_64        | 1574951945 | 0     |
| boot_time | reboot   | ~     | 4.18.0-80.el8.x86_64        | 1575681864 | 0     |
| runlevel  | runlevel | ~     | 4.18.0-80.el8.x86_64        | 1575681874 | 51    |
| init      |          | tty1  |                             | 1575681874 | 939   |
| login     | LOGIN    | tty1  |                             | 1575681874 | 939   |
| user      | toor     | pts/0 | 192.168.4.1                 | 1575681968 | 6611  |
| dead      |          | pts/0 |                             | 1575682372 | 6611  |
| dead      |          | tty1  |                             | 1575682372 | 939   |
| runlevel  | shutdown | ~     | 4.18.0-80.el8.x86_64        | 1575682373 | 0     |
| boot_time | reboot   | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575682416 | 0     |
| runlevel  | runlevel | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575682426 | 51    |
| init      |          | tty1  |                             | 1575682428 | 946   |
| login     | LOGIN    | tty1  |                             | 1575682428 | 946   |
| user      | toor     | pts/0 | 192.168.4.1                 | 1575682498 | 6583  |
| user      | toor     | pts/1 | 192.168.4.1                 | 1575684146 | 10462 |
| dead      |          | tty1  |                             | 1575693836 | 946   |
| dead      |          | pts/1 |                             | 1575693839 | 10462 |
| dead      |          | pts/0 |                             | 1575693839 | 6583  |
| runlevel  | shutdown | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575693846 | 0     |
| boot_time | reboot   | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575793472 | 0     |
| init      |          | tty1  |                             | 1575793495 | 957   |
| login     | LOGIN    | tty1  |                             | 1575793495 | 957   |
| runlevel  | runlevel | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575793503 | 51    |
| user      | toor     | pts/0 | 192.168.4.1                 | 1575793587 | 1717  |
| dead      |          | pts/0 |                             | 1575793778 | 1717  |
| dead      |          | tty1  |                             | 1575793778 | 957   |
| runlevel  | shutdown | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575793781 | 0     |
| boot_time | reboot   | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575853612 | 0     |
| init      |          | tty1  |                             | 1575853638 | 976   |
| login     | LOGIN    | tty1  |                             | 1575853638 | 976   |
| runlevel  | runlevel | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575853657 | 51    |
| user      | toor     | pts/0 | 192.168.4.1                 | 1575853689 | 1740  |
| dead      |          | tty1  |                             | 1575854596 | 976   |
| dead      |          | pts/0 |                             | 1575854596 | 1740  |
| runlevel  | shutdown | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575854599 | 0     |
| boot_time | reboot   | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575854678 | 0     |
| init      |          | tty1  |                             | 1575854688 | 961   |
| login     | LOGIN    | tty1  |                             | 1575854688 | 961   |
| runlevel  | runlevel | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575854700 | 51    |
| user      | toor     | pts/0 | 192.168.4.1                 | 1575854714 | 1657  |
| dead      |          | pts/0 |                             | 1575855288 | 1657  |
| dead      |          | tty1  |                             | 1575855288 | 961   |
| runlevel  | shutdown | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575855290 | 0     |
| boot_time | reboot   | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575855306 | 0     |
| init      |          | tty1  |                             | 1575855316 | 963   |
| login     | LOGIN    | tty1  |                             | 1575855316 | 963   |
| runlevel  | runlevel | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575855327 | 51    |
| user      | toor     | pts/0 | 192.168.4.1                 | 1575855343 | 1718  |
| dead      |          | pts/0 |                             | 1575856916 | 1718  |
| dead      |          | tty1  |                             | 1575856916 | 963   |
| runlevel  | shutdown | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575856918 | 0     |
| boot_time | reboot   | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575857010 | 0     |
| init      |          | tty1  |                             | 1575857021 | 969   |
| login     | LOGIN    | tty1  |                             | 1575857021 | 969   |
| runlevel  | runlevel | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575857028 | 51    |
| user      | toor     | pts/0 | 192.168.4.1                 | 1575857057 | 1795  |
| dead      |          | tty1  |                             | 1575883949 | 969   |
| dead      |          | pts/0 |                             | 1575883950 | 1795  |
| runlevel  | shutdown | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575883984 | 0     |
| boot_time | reboot   | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575895437 | 0     |
| init      |          | tty1  |                             | 1575895449 | 937   |
| login     | LOGIN    | tty1  |                             | 1575895449 | 937   |
| runlevel  | runlevel | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575895460 | 51    |
| user      | toor     | pts/0 | 192.168.4.1                 | 1575895498 | 1589  |
| dead      |          | pts/0 |                             | 1575901802 | 1589  |
| dead      |          | tty1  |                             | 1575901802 | 937   |
| runlevel  | shutdown | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575901805 | 0     |
| boot_time | reboot   | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575940504 | 0     |
| init      |          | tty1  |                             | 1575940530 | 977   |
| login     | LOGIN    | tty1  |                             | 1575940531 | 977   |
| runlevel  | runlevel | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575940541 | 51    |
| user      | toor     | pts/0 | 192.168.4.1                 | 1575940552 | 1776  |
| user      | toor     | pts/1 | 192.168.4.1                 | 1575946089 | 2583  |
| dead      |          | pts/0 |                             | 1575947613 | 1776  |
| dead      |          | pts/1 |                             | 1575947613 | 2583  |
| dead      |          | tty1  |                             | 1575947613 | 977   |
| runlevel  | shutdown | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575947615 | 0     |
| boot_time | reboot   | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575947640 | 0     |
| init      |          | tty1  |                             | 1575947650 | 953   |
| login     | LOGIN    | tty1  |                             | 1575947650 | 953   |
| user      | toor     | pts/0 | 192.168.4.1                 | 1575947657 | 1741  |
| runlevel  | runlevel | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575947670 | 51    |
| user      | toor     | pts/1 | 192.168.4.1                 | 1575947678 | 1806  |
| dead      |          | pts/1 |                             | 1575972891 | 1806  |
| dead      |          | pts/0 |                             | 1575972897 | 1741  |
| user      | toor     | pts/0 | 192.168.4.1                 | 1575972900 | 3198  |
| dead      |          | tty1  |                             | 1575981753 | 953   |
| dead      |          | pts/0 |                             | 1575981753 | 3198  |
| runlevel  | shutdown | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1575981760 | 0     |
| boot_time | reboot   | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1576025814 | 0     |
| init      |          | tty1  |                             | 1576025843 | 986   |
| login     | LOGIN    | tty1  |                             | 1576025843 | 986   |
| runlevel  | runlevel | ~     | 4.18.0-80.11.2.el8_0.x86_64 | 1576025865 | 51    |
| user      | toor     | pts/0 | 192.168.4.1                 | 1576025907 | 1789  |
| user      | toor     | pts/1 | 192.168.4.1                 | 1576032047 | 1971  |
+-----------+----------+-------+-----------------------------+------------+-------+
```
</details>



#### magic
Magic number recognition library table.

|     COLUMN     | TYPE |                                                                                           DESCRIPTION                                                                                           |
|----------------|------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|      path      | text |                                                                                  Absolute path to target file                                                                                   |
| magic_db_files | text | Colon(:) separated list of files where the magic db file can be found. By default one of the following is used: /usr/share/file/magic/magic, /usr/share/misc/magic or /usr/share/misc/magic.mgc |
|      data      | text |                                                                                 Magic number data from libmagic                                                                                 |
|   mime_type    | text |                                                                                  MIME type data from libmagic                                                                                   |
| mime_encoding  | text |                                                                                MIME encoding data from libmagic                                                                                 |



#### md_devices
Software RAID array settings.

Thông tin về RAID

|         COLUMN         |  TYPE   |                        DESCRIPTION                         |
|------------------------|---------|------------------------------------------------------------|
|      device_name       |  text   |                       md device name                       |
|         status         |  text   |                 Current state of the array                 |
|       raid_level       | integer |              Current raid level of the array               |
|          size          | bigint  |                size of the array in blocks                 |
|       chunk_size       | bigint  |                    chunk size in bytes                     |
|       raid_disks       | integer |          Number of configured RAID disks in array          |
|     nr_raid_disks      | integer | Number of partitions or disk devices to comprise the array |
|     working_disks      | integer |              Number of working disks in array              |
|      active_disks      | integer |              Number of active disks in array               |
|      failed_disks      | integer |              Number of active disks in array               |
|      spare_disks       | integer |              Number of active disks in array               |
|    superblock_state    |  text   |                  State of the superblock                   |
|   superblock_version   |  text   |                 Version of the superblock                  |
| superblock_update_time | bigint  |               Unix timestamp of last update                |
|     bitmap_on_mem      |  text   |      Pages allocated in in-memory bitmap, if enabled       |
|   bitmap_chunk_size    |  text   |                     Bitmap chunk size                      |
|  bitmap_external_file  |  text   |              External referenced bitmap file               |
|   recovery_progress    |  text   |             Progress of the recovery activity              |
|    recovery_finish     |  text   |          Estimated duration of recovery activity           |
|     recovery_speed     |  text   |                 Speed of recovery activity                 |
|    resync_progress     |  text   |              Progress of the resync activity               |
|     resync_finish      |  text   |           Estimated duration of resync activity            |
|      resync_speed      |  text   |                  Speed of resync activity                  |
|    reshape_progress    |  text   |              Progress of the reshape activity              |
|     reshape_finish     |  text   |           Estimated duration of reshape activity           |
|     reshape_speed      |  text   |                 Speed of reshape activity                  |
|  check_array_progress  |  text   |              Progress of the resync activity               |
|   check_array_finish   |  text   |           Estimated duration of resync activity            |
|   check_array_speed    |  text   |                  Speed of resync activity                  |
|     unused_devices     |  text   |                       Unused devices                       |
|         other          |  text   | Other information associated with array from /proc/mdstat  |



#### md_drives
Drive devices used for Software RAID.

Thông tin về các drive thiết bị được sử dụng trong RAID.

|     COLUMN     |  TYPE   |      DESCRIPTION      |
|----------------|---------|-----------------------|
| md_device_name |  text   |    md device name     |
|   drive_name   |  text   |   Drive device name   |
|      slot      | integer | Slot position of disk |
|     state      |  text   |  State of the drive   |



#### md_personalities
Software RAID setting supported by the kernel.

Thông tin về cài đặt RAID phần mềm được hỗ trợ bởi kernel.

| COLUMN | TYPE |               DESCRIPTION               |
|--------|------|-----------------------------------------|
|  name  | text | Name of personality supported by kernel |



#### memory_array_mapped_addresses
Data associated for address mapping of physical memory arrays.

|       COLUMN        |  TYPE   |                                              DESCRIPTION                                              |
|---------------------|---------|-------------------------------------------------------------------------------------------------------|
|       handle        |  text   |                       Handle, or instance number, associated with the structure                       |
| memory_array_handle |  text   |                       Handle of the memory array associated with this structure                       |
|  starting_address   |  text   |     Physical stating address, in kilobytes, of a range of memory mapped to physical memory array      |
|   ending_address    |  text   |     Physical ending address of last kilobyte of a range of memory mapped to physical memory array     |
|   partition_width   | integer | Number of memory devices that form a single row of memory for the address partition of this structure |



#### memory_arrays
Data associated with collection of memory devices that operate to form a memory address.

|          COLUMN          |  TYPE   |                                      DESCRIPTION                                      |
|--------------------------|---------|---------------------------------------------------------------------------------------|
|          handle          |  text   |                 Handle, or instance number, associated with the array                 |
|         location         |  text   |                         Physical location of the memory array                         |
|           use            |  text   |                         Function for which the array is used                          |
| memory_error_correction  |  text   |            Primary hardware error correction or detection method supported            |
|       max_capacity       | integer |                        Maximum capacity of array in gigabytes                         |
| memory_error_info_handle |  text   | Handle, or instance number, associated with any error that was detected for the array |
|  number_memory_devices   | integer |                           Number of memory devices on array                           |



#### memory_device_mapped_addresses
Data associated for address mapping of physical memory devices.

|               COLUMN               |  TYPE   |                                                                  DESCRIPTION                                                                  |
|------------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------|
|               handle               |  text   |                                           Handle, or instance number, associated with the structure                                           |
|        memory_device_handle        |  text   |                                     Handle of the memory device structure associated with this structure                                      |
| memory_array_mapped_address_handle |  text   |                               Handle of the memory array mapped address to which this device range is mapped to                               |
|          starting_address          |  text   |                         Physical stating address, in kilobytes, of a range of memory mapped to physical memory array                          |
|           ending_address           |  text   |                         Physical ending address of last kilobyte of a range of memory mapped to physical memory array                         |
|       partition_row_position       | integer |                           Identifies the position of the referenced memory device in a row of the address partition                           |
|        interleave_position         | integer |   The position of the device in a interleave, i.e. 0 indicates non-interleave, 1 indicates 1st interleave, 2 indicates 2nd interleave, etc.   |
|       interleave_data_depth        | integer | The max number of consecutive rows from memory device that are accessed in a single interleave transfer; 0 indicates device is non-interleave |



#### memory_devices
Physical memory device (type 17) information retrieved from SMBIOS.

|         COLUMN         |  TYPE   |                                                          DESCRIPTION                                                           |
|------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------|
|         handle         |  text   |                              Handle, or instance number, associated with the structure in SMBIOS                               |
|      array_handle      |  text   |                                        The memory array that the device is attached to                                         |
|      form_factor       |  text   |                                       Implementation form factor for this memory device                                        |
|      total_width       | integer |                   Total width, in bits, of this memory device, including any check or error-correction bits                    |
|       data_width       | integer |                                           Data width, in bits, of this memory device                                           |
|          size          | integer |                                               Size of memory device in Megabyte                                                |
|          set           | integer |              Identifies if memory device is one of a set of devices.  A value of 0 indicates no set affiliation.               |
|     device_locator     |  text   | String number of the string that identifies the physically-labeled socket or board position where the memory device is located |
|      bank_locator      |  text   |           String number of the string that identifies the physically-labeled bank where the memory device is located           |
|      memory_type       |  text   |                                                      Type of memory used                                                       |
|  memory_type_details   |  text   |                                              Additional details for memory device                                              |
|       max_speed        | integer |                                 Max speed of memory device in megatransfers per second (MT/s)                                  |
| configured_clock_speed | integer |                              Configured speed of memory device in megatransfers per second (MT/s)                              |
|      manufacturer      |  text   |                                                     Manufacturer ID string                                                     |
|     serial_number      |  text   |                                                 Serial number of memory device                                                 |
|       asset_tag        |  text   |                                        Manufacturer specific asset tag of memory device                                        |
|      part_number       |  text   |                                      Manufacturer specific serial number of memory device                                      |
|      min_voltage       | integer |                                       Minimum operating voltage of device in millivolts                                        |
|      max_voltage       | integer |                                       Maximum operating voltage of device in millivolts                                        |
|   configured_voltage   | integer |                                      Configured operating voltage of device in millivolts                                      |



#### memory_error_info
Data associated with errors of a physical memory array.

|           COLUMN           | TYPE |                                                  DESCRIPTION                                                   |
|----------------------------|------|----------------------------------------------------------------------------------------------------------------|
|           handle           | text |                           Handle, or instance number, associated with the structure                            |
|         error_type         | text |                     type of error associated with current error status for array or device                     |
|     error_granularity      | text |                                 Granularity to which the error can be resolved                                 |
|      error_operation       | text |                                 Memory access operation that caused the error                                  |
|      vendor_syndrome       | text |                 Vendor specific ECC syndrome or CRC data associated with the erroneous access                  |
| memory_array_error_address | text | 32 bit physical address of the error based on the addressing of the bus to which the memory array is connected |
|    device_error_address    | text |       32 bit physical address of the error relative to the start of the failing memory address, in bytes       |
|      error_resolution      | text |           Range, in bytes, within which this error can be determined, when an error address is given           |



#### memory_info
Main memory information in bytes.

|    COLUMN    |  TYPE  |                                      DESCRIPTION                                       |
|--------------|--------|----------------------------------------------------------------------------------------|
| memory_total | bigint |                         Total amount of physical RAM, in bytes                         |
| memory_free  | bigint |            The amount of physical RAM, in bytes, left unused by the system             |
|   buffers    | bigint |              The amount of physical RAM, in bytes, used for file buffers               |
|    cached    | bigint |               The amount of physical RAM, in bytes, used as cache memory               |
| swap_cached  | bigint |                   The amount of swap, in bytes, used as cache memory                   |
|    active    | bigint |    The total amount of buffer or page cache memory, in bytes, that is in active use    |
|   inactive   | bigint | The total amount of buffer or page cache memory, in bytes, that are free and available |
|  swap_total  | bigint |                      The total amount of swap available, in bytes                      |
|  swap_free   | bigint |                        The total amount of swap free, in bytes                         |



#### memory_map
OS memory region map.

| COLUMN | TYPE |          DESCRIPTION           |
|--------|------|--------------------------------|
|  name  | text |          Region name           |
| start  | text | Start address of memory region |
|  end   | text |  End address of memory region  |



#### mounts
System mounted devices and filesystems (not process specific).

|      COLUMN      |  TYPE  |           DESCRIPTION           |
|------------------|--------|---------------------------------|
|      device      |  text  |         Mounted device          |
|   device_alias   |  text  |      Mounted device alias       |
|       path       |  text  |       Mounted device path       |
|       type       |  text  |       Mounted device type       |
|   blocks_size    | bigint |       Block size in bytes       |
|      blocks      | bigint |   Mounted device used blocks    |
|   blocks_free    | bigint |   Mounted device free blocks    |
| blocks_available | bigint | Mounted device available blocks |
|      inodes      | bigint |   Mounted device used inodes    |
|   inodes_free    | bigint |   Mounted device free inodes    |
|      flags       |  text  |      Mounted device flags       |



#### msr
Various pieces of data stored in the model specific register per processor. NOTE: the msr kernel module must be enabled, and osquery must be run as root.

|       COLUMN       |  TYPE  |                    DESCRIPTION                    |
|--------------------|--------|---------------------------------------------------|
|  processor_number  | bigint | The processor number as reported in /proc/cpuinfo |
|   turbo_disabled   | bigint |      Whether the turbo feature is disabled.       |
| turbo_ratio_limit  | bigint |          The turbo feature ratio limit.           |
|   platform_info    | bigint |               Platform information.               |
|      perf_ctl      | bigint |      Performance setting for the processor.       |
|    perf_status     | bigint |       Performance status for the processor.       |
|  feature_control   | bigint |      Bitfield controlling enabled features.       |
|  rapl_power_limit  | bigint |   Run Time Average Power Limiting power limit.    |
| rapl_energy_status | bigint |  Run Time Average Power Limiting energy status.   |
|  rapl_power_units  | bigint |   Run Time Average Power Limiting power units.    |



#### npm_packages
Lists all npm packages in a directory or globally installed in a system.

Liệt kê tất cả các gói npm trong một thư mục hoặc được cài đặt trên toàn cầu trong một hệ thống.

|   COLUMN    | TYPE |                      DESCRIPTION                      |
|-------------|------|-------------------------------------------------------|
|    name     | text |                 Package display name                  |
|   version   | text |               Package supplied version                |
| description | text |             Package supplied description              |
|   author    | text |                  Package author name                  |
|   license   | text |                  License for package                  |
|    path     | text |              Module's package.json path               |
|  directory  | text | Node module's directory where this package is located |

<details>
<summary>Ví dụ:</summary>

```

```
</details>



#### oem_strings
OEM defined strings retrieved from SMBIOS.

| COLUMN |  TYPE   |                            DESCRIPTION                            |
|--------|---------|-------------------------------------------------------------------|
| handle |  text   | Handle, or instance number, associated with the Type 11 structure |
| number | integer |                 The string index of the structure                 |
| value  |  text   |                    The value of the OEM string                    |



#### opera_extensions
Opera browser extensions.

Thông tin về các tiện ích mở rộng của trình duyệt opera.

|   COLUMN    |  TYPE   |                     DESCRIPTION                     |
|-------------|---------|-----------------------------------------------------|
|     uid     | bigint  |       The local user that owns the extension        |
|    name     |  text   |               Extension display name                |
| identifier  |  text   |                Extension identifier                 |
|   version   |  text   |             Extension-supplied version              |
| description |  text   |           Extension-optional description            |
|   locale    |  text   |        Default locale supported by extension        |
| update_url  |  text   |            Extension-supplied update URI            |
|   author    |  text   |              Optional extension author              |
| persistent  | integer | 1 If extension is persistent across all tabs else 0 |
|    path     |  text   |              Path to extension folder               |



#### os_version
A single row containing the operating system name and version.

Một hàng duy nhất chứa tên và phiên bản hệ điều hành.

|    COLUMN     |  TYPE   |                  DESCRIPTION                  |
|---------------|---------|-----------------------------------------------|
|     name      |  text   |         Distribution or product name          |
|    version    |  text   | Pretty, suitable for presentation, OS version |
|     major     | integer |             Major release version             |
|     minor     | integer |             Minor release version             |
|     patch     | integer |            Optional patch release             |
|     build     |  text   |   Optional build-specific or variant string   |
|   platform    |  text   |               OS Platform or ID               |
| platform_like |  text   |           Closely related platforms           |
|   codename    |  text   |              OS version codename              |
| install_date  |  text   |          The install date of the OS.          |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from os_version;
+--------------+--------------------------------------+-------+-------+-------+-------+----------+---------------+----------+
| name         | version                              | major | minor | patch | build | platform | platform_like | codename |
+--------------+--------------------------------------+-------+-------+-------+-------+----------+---------------+----------+
| CentOS Linux | CentOS Linux release 8.0.1905 (Core) | 8     | 0     | 1905  |       | rhel     | rhel          |          |
+--------------+--------------------------------------+-------+-------+-------+-------+----------+---------------+----------+
```
</details>



#### osquery_events
Information about the event publishers and subscribers.

|    COLUMN     |  TYPE   |                            DESCRIPTION                            |
|---------------|---------|-------------------------------------------------------------------|
|     name      |  text   |                Event publisher or subscriber name                 |
|   publisher   |  text   |                 Name of the associated publisher                  |
|     type      |  text   |                  Either publisher or subscriber                   |
| subscriptions | integer | Number of subscriptions the publisher received or subscriber used |
|    events     | integer |    Number of events emitted or received since osquery started     |
|   refreshes   | integer |            Publisher only: number of runloop restarts             |
|    active     | integer |         1 if the publisher or subscriber is active else 0         |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from osquery_events;
+---------------------+---------------------+------------+---------------+--------+-----------+--------+
| name                | publisher           | type       | subscriptions | events | refreshes | active |
+---------------------+---------------------+------------+---------------+--------+-----------+--------+
| auditeventpublisher | auditeventpublisher | publisher  | 0             | 0      | 0         | 0      |
| inotify             | inotify             | publisher  | 0             | 0      | 0         | 0      |
| syslog              | syslog              | publisher  | 0             | 0      | 0         | 0      |
| udev                | udev                | publisher  | 0             | 0      | 0         | 0      |
| file_events         | inotify             | subscriber | 0             | 0      | 0         | 0      |
| hardware_events     | udev                | subscriber | 0             | 0      | 0         | 0      |
| process_events      | auditeventpublisher | subscriber | 0             | 0      | 0         | 0      |
| process_file_events | auditeventpublisher | subscriber | 0             | 0      | 0         | 0      |
| selinux_events      | auditeventpublisher | subscriber | 0             | 0      | 0         | 0      |
| socket_events       | auditeventpublisher | subscriber | 0             | 0      | 0         | 0      |
| syslog_events       | syslog              | subscriber | 0             | 0      | 0         | 0      |
| user_events         | auditeventpublisher | subscriber | 0             | 0      | 0         | 0      |
| yara_events         | inotify             | subscriber | 0             | 0      | 0         | 0      |
+---------------------+---------------------+------------+---------------+--------+-----------+--------+
```
</details>



#### osquery_extensions
List of active osquery extensions.

Danh sách các phần mở rộng trong osquery.

|   COLUMN    |  TYPE  |                     DESCRIPTION                      |
|-------------|--------|------------------------------------------------------|
|    uuid     | bigint |     The transient ID assigned for communication      |
|    name     |  text  |                   Extension's name                   |
|   version   |  text  |                 Extension's version                  |
| sdk_version |  text  |   osquery SDK version used to build the extension    |
|    path     |  text  | Path of the extenion's domain socket or library path |
|    type     |  text  |       SDK extension type: extension or module        |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from osquery_extensions;
+------+------+---------+-------------+-------------------------+------+
| uuid | name | version | sdk_version | path                    | type |
+------+------+---------+-------------+-------------------------+------+
| 0    | core | 4.0.2   | 0.0.0       | /root/.osquery/shell.em | core |
+------+------+---------+-------------+-------------------------+------+
```
</details>



#### osquery_flags
Configurable flags that modify osquery's behavior.

Các cờ (flags) có thể thay đổi cấu hình của osquery

|    COLUMN     |  TYPE   |       DESCRIPTION       |
|---------------|---------|-------------------------|
|     name      |  text   |        Flag name        |
|     type      |  text   |        Flag type        |
|  description  |  text   |    Flag description     |
| default_value |  text   |   Flag default value    |
|     value     |  text   |       Flag value        |
|  shell_only   | integer | Is the flag shell only? |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from osquery_flags;
+-----------------------------------------+--------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------------------------------------+------------+
| name                                    | type   | description                                                                                                                                                                                                                                                                                                                                                                                                          | default_value                           | value                                   | shell_only |
+-----------------------------------------+--------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------------------------------------+------------+
| alarm_timeout                           | uint64 | Seconds to wait for a graceful shutdown                                                                                                                                                                                                                                                                                                                                                                              | 4                                       | 4                                       | 0          |
| allow_unsafe                            | bool   | Allow unsafe executable permissions                                                                                                                                                                                                                                                                                                                                                                                  | false                                   | false                                   | 0          |
| audit_allow_config                      | bool   | Allow the audit publisher to change auditing configuration                                                                                                                                                                                                                                                                                                                                                           | false                                   | false                                   | 0          |
| audit_allow_fim_events                  | bool   | Allow the audit publisher to install file event monitoring rules                                                                                                                                                                                                                                                                                                                                                     | false                                   | false                                   | 0          |
| audit_allow_fork_process_events         | bool   | Allow the audit publisher to install process event monitoring rules to capture fork/vfork/clone system calls                                                                                                                                                                                                                                                                                                         | false                                   | false                                   | 0          |
| audit_allow_process_events              | bool   | Allow the audit publisher to install process event monitoring rules                                                                                                                                                                                                                                                                                                                                                  | true                                    | true                                    | 0          |
| audit_allow_selinux_events              | bool   | Allow the audit publisher to process audit events                                                                                                                                                                                                                                                                                                                                                                    | false                                   | false                                   | 0          |
| audit_allow_sockets                     | bool   | Allow the audit publisher to install socket-related rules                                                                                                                                                                                                                                                                                                                                                            | false                                   | false                                   | 0          |
| tls_client_cert                         | string | Optional path to a TLS client-auth PEM certificate                                                                                                                                                                                                                                                                                                                                                                   |                                         |                                         | 0          |
| tls_client_key                          | string | Optional path to a TLS client-auth PEM private key                                                                                                                                                                                                                                                                                                                                                                   |                                         |                                         | 0          |
| tls_dump                                | bool   | Print remote requests and responses                                                                                                                                                                                                                                                                                                                                                                                  | false                                   | false                                   | 0          |
| tls_enroll_max_attempts                 | uint64 | Number of attempts to retry a TLS enroll request, it used to be the same as [config_tls_max_attempts]                                                                                                                                                                                                                                                                                                                | 3                                       | 3                                       | 0          |
| tls_enroll_override                     | string | Override the TLS enroll secret key name                                                                                                                                                                                                                                                                                                                                                                              | enroll_secret                           | enroll_secret                           | 0          |
| tls_hostname                            | string | TLS/HTTPS hostname for Config, Logger, and Enroll plugins                                                                                                                                                                                                                                                                                                                                                            |                                         |                                         | 0          |
| tls_node_api                            | bool   | Use node key as TLS endpoints                                                                                                                                                                                                                                                                                                                                                                                        | false                                   | false                                   | 0          |
| tls_secret_always                       | bool   | Include TLS enroll secret in every request                                                                                                                                                                                                                                                                                                                                                                           | false                                   | false                                   | 0          |
| tls_server_certs                        | string | Optional path to a TLS server PEM certificate(s) bundle                                                                                                                                                                                                                                                                                                                                                              | /usr/share/osquery/certs/certs.pem      | /usr/share/osquery/certs/certs.pem      | 0          |
| tls_session_reuse                       | bool   | Reuse TLS session sockets                                                                                                                                                                                                                                                                                                                                                                                            | true                                    | true                                    | 0          |
| tls_session_timeout                     | uint32 | TLS session keep alive timeout in seconds                                                                                                                                                                                                                                                                                                                                                                            | 3600                                    | 3600                                    | 0          |
| uninstall                               | bool   | Uninstall osqueryd as a service                                                                                                                                                                                                                                                                                                                                                                                      | false                                   | false                                   | 0          |
| utc                                     | bool   | Convert all UNIX times to UTC                                                                                                                                                                                                                                                                                                                                                                                        | true                                    | true                                    | 0          |
| value_max                               | int32  | Maximum returned row value size                                                                                                                                                                                                                                                                                                                                                                                      | 512                                     | 512                                     | 0          |
| verbose                                 | bool   | Enable verbose informational messages                                                                                                                                                                                                                                                                                                                                                                                | false                                   | false                                   | 0          |
| watchdog_delay                          | uint64 | Initial delay in seconds before watchdog starts                                                                                                                                                                                                                                                                                                                                                                      | 60                                      | 60                                      | 0          |
| watchdog_level                          | int32  | Performance limit level (0=normal, 1=restrictive, -1=off)                                                                                                                                                                                                                                                                                                                                                            | 0                                       | 0                                       | 0          |
| watchdog_max_delay                      | uint64 | Max delay in seconds between worker respawns                                                                                                                                                                                                                                                                                                                                                                         | 600                                     | 600                                     | 0          |
| watchdog_memory_limit                   | uint64 | Override watchdog profile memory limit (e.g., 300, for 300MB)                                                                                                                                                                                                                                                                                                                                                        | 0                                       | 0                                       | 0          |
| watchdog_utilization_limit              | uint64 | Override watchdog profile CPU utilization limit                                                                                                                                                                                                                                                                                                                                                                      | 0                                       | 0                                       | 0          |
| worker_threads                          | int32  | Number of work dispatch threads                                                                                                                                                                                                                                                                                                                                                                                      | 4                                       | 2                                       | 0          |
+-----------------------------------------+--------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------------------------------------+------------+
```
</details>



#### osquery_info
Top level information about the running version of osquery.

Thông tin về Osquery

|     COLUMN     |  TYPE   |                        DESCRIPTION                        |
|----------------|---------|-----------------------------------------------------------|
|      pid       | integer |               Process (or thread/handle) ID               |
|      uuid      |  text   |             Unique ID provided by the system              |
|  instance_id   |  text   |       Unique, long-lived ID per instance of osquery       |
|    version     |  text   |                  osquery toolkit version                  |
|  config_hash   |  text   |          Hash of the working configuration state          |
|  config_valid  | integer |  1 if the config was loaded and considered valid, else 0  |
|   extensions   |  text   |                 osquery extensions status                 |
| build_platform |  text   |              osquery toolkit build platform               |
|  build_distro  |  text   |  osquery toolkit platform distribution name (os version)  |
|   start_time   | integer |       UNIX time in seconds when the process started       |
|    watcher     | integer | Process (or thread/handle) ID of optional watcher process |
| platform_mask  | integer |               The osquery platform bitmask                |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from osquery_info;
+------+--------------------------------------+--------------------------------------+---------+------------------------------------------+--------------+------------+----------------+--------------+------------+---------+
| pid  | uuid                                 | instance_id                          | version | config_hash                              | config_valid | extensions | build_platform | build_distro | start_time | watcher |
+------+--------------------------------------+--------------------------------------+---------+------------------------------------------+--------------+------------+----------------+--------------+------------+---------+
| 1890 | b5c44d56-7c47-b40a-cfaa-091a699799e9 | dc69c312-fbdf-4b06-871a-18f26e6cbc6b | 4.0.2   | f649b3315fa11bdfe37ed0b5eb0ce67525f9bdff | 1            | active     | 1              | centos7      | 1576464922 | -1      |
+------+--------------------------------------+--------------------------------------+---------+------------------------------------------+--------------+------------+----------------+--------------+------------+---------+
```
</details>



#### osquery_packs
Information about the current query packs that are loaded in osquery.

Thông tin về packs có trong Osquery hiện tại.

|        COLUMN        |  TYPE   |                                                  DESCRIPTION                                                  |
|----------------------|---------|---------------------------------------------------------------------------------------------------------------|
|         name         |  text   |                                      The given name for this query pack                                       |
|       platform       |  text   |                                     Platforms this query is supported on                                      |
|       version        |  text   |                              Minimum osquery version that this query will run on                              |
|        shard         | integer |                           Shard restriction limit, 1-100, 0 meaning no restriction                            |
| discovery_cache_hits | integer |  The number of times that the discovery query used cached values since the last time the config was reloaded  |
| discovery_executions | integer | The number of times that the discovery queries have been executed since the last time the config was reloaded |
|        active        | integer |         Whether this pack is active (the version, platform and discovery queries match) yes=1, no=0.          |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from osquery_packs;
+------+----------+---------+-------+----------------------+----------------------+--------+
| name | platform | version | shard | discovery_cache_hits | discovery_executions | active |
+------+----------+---------+-------+----------------------+----------------------+--------+
| main |          |         | 0     | 1                    | 1                    | 1      |
+------+----------+---------+-------+----------------------+----------------------+--------+
```
</details>



#### osquery_registry
List the osquery registry plugins.

Thông tin về registry osquery.

|   COLUMN   |  TYPE   |            DESCRIPTION             |
|------------|---------|------------------------------------|
|  registry  |  text   |    Name of the osquery registry    |
|    name    |  text   |      Name of the plugin item       |
| owner_uuid | integer | Extension route UUID (0 for core)  |
|  internal  | integer | 1 If the plugin is internal else 0 |
|   active   | integer | 1 If this plugin is active else 0  |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from osquery_registry;
+--------------------+--------------------------------+------------+----------+--------+
| registry           | name                           | owner_uuid | internal | active |
+--------------------+--------------------------------+------------+----------+--------+
| config             | filesystem                     | 0          | 0        | 1      |
| config             | tls                            | 0          | 0        | 0      |
| config             | update                         | 0          | 0        | 0      |
| config_parser      | auto_constructed_tables        | 0          | 1        | 1      |
| config_parser      | decorators                     | 0          | 1        | 1      |
| config_parser      | events                         | 0          | 1        | 1      |
| config_parser      | feature_vectors                | 0          | 1        | 1      |
| config_parser      | file_paths                     | 0          | 1        | 1      |
| config_parser      | kafka_topics                   | 0          | 1        | 1      |
| config_parser      | logger                         | 0          | 1        | 1      |
| config_parser      | options                        | 0          | 1        | 1      |
| config_parser      | prometheus_targets             | 0          | 1        | 1      |
| config_parser      | views                          | 0          | 1        | 1      |
| config_parser      | yara                           | 0          | 0        | 1      |
| database           | ephemeral                      | 0          | 1        | 1      |
| database           | rocksdb                        | 0          | 1        | 0      |
| database           | sqlite                         | 0          | 1        | 0      |
| distributed        | tls                            | 0          | 0        | 1      |
| enroll             | tls                            | 0          | 0        | 1      |
| event_publisher    | auditeventpublisher            | 0          | 0        | 0      |
| event_publisher    | inotify                        | 0          | 0        | 0      |
| event_publisher    | syslog                         | 0          | 0        | 0      |
| event_publisher    | udev                           | 0          | 0        | 0      |
| event_subscriber   | file_events                    | 0          | 0        | 0      |
| event_subscriber   | hardware_events                | 0          | 0        | 0      |
| event_subscriber   | process_events                 | 0          | 0        | 0      |
| event_subscriber   | process_file_events            | 0          | 0        | 0      |
| event_subscriber   | selinux_events                 | 0          | 0        | 0      |
| event_subscriber   | socket_events                  | 0          | 0        | 0      |
| event_subscriber   | syslog_events                  | 0          | 0        | 0      |
| event_subscriber   | user_events                    | 0          | 0        | 0      |
| event_subscriber   | yara_events                    | 0          | 0        | 0      |
| killswitch         | killswitch_filesystem          | 0          | 0        | 1      |
| killswitch         | tls                            | 0          | 0        | 1      |
| logger             | aws_firehose                   | 0          | 0        | 0      |
| logger             | aws_kinesis                    | 0          | 0        | 0      |
| logger             | filesystem                     | 0          | 0        | 1      |
| logger             | kafka_producer                 | 0          | 0        | 0      |
| logger             | stdout                         | 0          | 0        | 0      |
| logger             | syslog                         | 0          | 0        | 0      |
| logger             | tls                            | 0          | 0        | 0      |
| numeric_monitoring | filesystem                     | 0          | 0        | 1      |
| sql                | sql                            | 0          | 1        | 1      |
| table              | acpi_tables                    | 0          | 0        | 1      |
| table              | apt_sources                    | 0          | 0        | 1      |
| table              | arp_cache                      | 0          | 0        | 1      |
| table              | atom_packages                  | 0          | 0        | 1      |
| table              | augeas                         | 0          | 0        | 1      |
| table              | authorized_keys                | 0          | 0        | 1      |
| table              | block_devices                  | 0          | 0        | 1      |
| table              | carbon_black_info              | 0          | 0        | 1      |
| table              | carves                         | 0          | 0        | 1      |
| table              | chrome_extensions              | 0          | 0        | 1      |
| table              | cpu_time                       | 0          | 0        | 1      |
| table              | cpuid                          | 0          | 0        | 1      |
| table              | crontab                        | 0          | 0        | 1      |
| table              | curl                           | 0          | 0        | 1      |
| table              | curl_certificate               | 0          | 0        | 1      |
| table              | deb_packages                   | 0          | 0        | 1      |
| table              | device_file                    | 0          | 0        | 1      |
| table              | device_hash                    | 0          | 0        | 1      |
| table              | device_partitions              | 0          | 0        | 1      |
| table              | disk_encryption                | 0          | 0        | 1      |
| table              | dns_resolvers                  | 0          | 0        | 1      |
| table              | docker_container_labels        | 0          | 0        | 1      |
| table              | docker_container_mounts        | 0          | 0        | 1      |
| table              | docker_container_networks      | 0          | 0        | 1      |
| table              | docker_container_ports         | 0          | 0        | 1      |
| table              | docker_container_processes     | 0          | 0        | 1      |
| table              | docker_container_stats         | 0          | 0        | 1      |
| table              | docker_containers              | 0          | 0        | 1      |
| table              | ulimit_info                    | 0          | 0        | 1      |
| table              | uptime                         | 0          | 0        | 1      |
| table              | usb_devices                    | 0          | 0        | 1      |
| table              | user_events                    | 0          | 0        | 1      |
| table              | user_groups                    | 0          | 0        | 1      |
| table              | user_ssh_keys                  | 0          | 0        | 1      |
| table              | users                          | 0          | 0        | 1      |
| table              | yara                           | 0          | 0        | 1      |
| table              | yara_events                    | 0          | 0        | 1      |
| table              | yum_sources                    | 0          | 0        | 1      |
+--------------------+--------------------------------+------------+----------+--------+
```
</details>



#### osquery_schedule
Information about the current queries that are scheduled in osquery.

Thông tin về các truy vấn được lên lịch trong osquery.

|     COLUMN     |  TYPE   |                           DESCRIPTION                            |
|----------------|---------|------------------------------------------------------------------|
|      name      |  text   |                  The given name for this query                   |
|     query      |  text   |                      The exact query to run                      |
|    interval    | integer | The interval in seconds to run this query, not an exact interval |
|   executions   | bigint  |              Number of times the query was executed              |
| last_executed  | bigint  |    UNIX time stamp in seconds of the last completed execution    |
|  blacklisted   | integer |               1 if the query is blacklisted else 0               |
|  output_size   | bigint  |           Total number of bytes generated by the query           |
|   wall_time    | bigint  |                 Total wall time spent executing                  |
|   user_time    | bigint  |                 Total user time spent executing                  |
|  system_time   | bigint  |                Total system time spent executing                 |
| average_memory | bigint  |           Average private memory left after executing            |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from osquery_schedule;
+-------------+---------------------------------------------------------------+----------+------------+---------------+-------------+-------------+-----------+-----------+-------------+----------------+
| name        | query                                                         | interval | executions | last_executed | blacklisted | output_size | wall_time | user_time | system_time | average_memory |
+-------------+---------------------------------------------------------------+----------+------------+---------------+-------------+-------------+-----------+-----------+-------------+----------------+
| system_info | SELECT hostname, cpu_brand, physical_memory FROM system_info; | 3600     | 0          | 0             | 0           |             | 0         | 0         | 0           | 0              |
| user_info   | SELECT * FROM users;                                          | 10       | 0          | 0             | 0           |             | 0         | 0         | 0           | 0              |
+-------------+---------------------------------------------------------------+----------+------------+---------------+-------------+-------------+-----------+-----------+-------------+----------------+
```
</details>



#### pci_devices
PCI devices active on the host system.

|       COLUMN        | TYPE |                DESCRIPTION                 |
|---------------------|------|--------------------------------------------|
|      pci_slot       | text |            PCI Device used slot            |
|      pci_class      | text |              PCI Device class              |
|       driver        | text |           PCI Device used driver           |
|       vendor        | text |             PCI Device vendor              |
|      vendor_id      | text |  Hex encoded PCI Device vendor identifier  |
|        model        | text |              PCI Device model              |
|      model_id       | text |  Hex encoded PCI Device model identifier   |
|    pci_class_id     | text |     PCI Device class ID in hex format      |
|   pci_subclass_id   | text |     PCI Device  subclass in hex format     |
|    pci_subclass     | text |            PCI Device subclass             |
| subsystem_vendor_id | text |     Vendor ID of PCI device subsystem      |
|  subsystem_vendor   | text |       Vendor of PCI device subsystem       |
| subsystem_model_id  | text |      Model ID of PCI device subsystem      |
|   subsystem_model   | text | Device description of PCI device subsystem |



#### platform_info
Information about EFI/UEFI/ROM and platform/boot.

|   COLUMN    |  TYPE   |               DESCRIPTION                |
|-------------|---------|------------------------------------------|
|   vendor    |  text   |           Platform code vendor           |
|   version   |  text   |          Platform code version           |
|    date     |  text   | Self-reported platform code update date  |
|  revision   |  text   |      BIOS major and minor revision       |
|   address   |  text   |   Relative address of firmware mapping   |
|    size     |  text   |        Size in bytes of firmware         |
| volume_size | integer |    (Optional) size of firmware volume    |
|    extra    |  text   | Platform-specific additional information |



#### portage_keywords
A summary about portage configurations like keywords, mask and unmask.

| COLUMN  |  TYPE   |                           DESCRIPTION                            |
|---------|---------|------------------------------------------------------------------|
| package |  text   |                           Package name                           |
| version |  text   | The version which are affected by the use flags, empty means all |
| keyword |  text   |                The keyword applied to the package                |
|  mask   | integer |                     If the package is masked                     |
| unmask  | integer |                    If the package is unmasked                    |



#### portage_packages
List of currently installed packages.

Danh sách các gói portage đã cài đặt.

|   COLUMN   |  TYPE   |                           DESCRIPTION                            |
|------------|---------|------------------------------------------------------------------|
|  package   |  text   |                           Package name                           |
|  version   |  text   | The version which are affected by the use flags, empty means all |
|    slot    |  text   |                     The slot used by package                     |
| build_time | bigint  |                 Unix time when package was built                 |
| repository |  text   |            From which repository the ebuild was used             |
|    eapi    | bigint  |                     The eapi for the ebuild                      |
|    size    | bigint  |                     The size of the package                      |
|   world    | integer |                 If package is in the world file                  |

<details>
<summary>Ví dụ:</summary>

```

```
</details>



#### portage_use
List of enabled portage USE values for specific package.

| COLUMN  | TYPE |                 DESCRIPTION                 |
|---------|------|---------------------------------------------|
| package | text |                Package name                 |
| version | text |    The version of the installed package     |
|   use   | text | USE flag which has been enabled for package |



#### process_envs
A key/value table of environment variables for each process.

Bảng chứa key/value của các biến môi trường của mỗi process

| COLUMN |  TYPE   |        DESCRIPTION         |
|--------|---------|----------------------------|
|  pid   | integer |   Process (or thread) ID   |
|  key   |  text   | Environment variable name  |
| value  |  text   | Environment variable value |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from process_envs;
+------+---------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| pid  | key                       | value                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
+------+---------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| 1    | HOME                      | /                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| 1    | TERM                      | linux                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| 1    | BOOT_IMAGE                | (hd0,msdos1)/vmlinuz-4.18.0-80.11.2.el8_0.x86_64                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| 1    | crashkernel               | auto                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| 1009 | LANG                      | en_US.UTF-8                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| 1009 | PATH                      | /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| 1009 | NOTIFY_SOCKET             | /run/systemd/notify                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| 1009 | HOME                      | /var/lib/mysql                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| 1009 | LOGNAME                   | mysql                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| 1009 | USER                      | mysql                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| 1009 | INVOCATION_ID             | 5dbac8468f964da48c05122e4a3365f7                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| 1009 | JOURNAL_STREAM            | 9:28587                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| 1009 | MYSQLD_PARENT_PID         | 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| 1433 | LANG                      | en_US.UTF-8                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| 1433 | PATH                      | /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| 1433 | NOTIFY_SOCKET             | /run/systemd/notify                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| 1433 | INVOCATION_ID             | dae2527fd36144d29aefaec38192b5de                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| 1433 | SYSLOGD_OPTIONS           |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| 1757 | LANG                      | en_US.UTF-8                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| 1757 | PATH                      | /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| 1757 | INVOCATION_ID             | 0d27d64cfefd4f24b2bf0d9623b54f36                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| 1757 | JOURNAL_STREAM            | 9:34398                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| 1757 | FLAG_FILE                 | /etc/osquery/osquery.flags                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| 1757 | CONFIG_FILE               | /etc/osquery/osquery.conf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| 1757 | LOCAL_PIDFILE             | /var/osquery/osqueryd.pidfile                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| 1757 | PIDFILE                   | /var/run/osqueryd.pidfile                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| 1761 | LANG                      | en_US.UTF-8                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| 1761 | PATH                      | /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| 1761 | INVOCATION_ID             | 0d27d64cfefd4f24b2bf0d9623b54f36                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| 1761 | JOURNAL_STREAM            | 9:34398                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| 1761 | FLAG_FILE                 | /etc/osquery/osquery.flags                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| 1761 | CONFIG_FILE               | /etc/osquery/osquery.conf                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| 1761 | LOCAL_PIDFILE             | /var/osquery/osqueryd.pidfile                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| 1761 | PIDFILE                   | /var/run/osqueryd.pidfile                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| 1761 | OSQUERY_WORKER            | 1761                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| 1787 | LANG                      | en_US.UTF-8                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| 1787 | PATH                      | /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| 1787 | NOTIFY_SOCKET             | /run/systemd/notify                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| 1787 | HOME                      | /home/toor                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| 982  | INVOCATION_ID             | a37a4e1afa60421ba2c2cf9f7090f3fd                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| 982  | TERM                      | linux                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| 982  | JOURNAL_STREAM            | 9:29251                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
+------+---------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
```
</details>



#### process_events(EVENTED TABLE)
Track time/action process executions.

Theo dõi thời gian và hành động của process.

|    COLUMN    |  TYPE  |                     DESCRIPTION                      |
|--------------|--------|------------------------------------------------------|
|     pid      | bigint |                Process (or thread) ID                |
|     path     |  text  |                Path of executed file                 |
|     mode     |  text  |                File mode permissions                 |
|   cmdline    |  text  |            Command line arguments (argv)             |
| cmdline_size | bigint |    Actual size (bytes) of command line arguments     |
|     env      |  text  |      Environment variables delimited by spaces       |
|  env_count   | bigint |           Number of environment variables            |
|   env_size   | bigint |       Actual size (bytes) of environment list        |
|     cwd      |  text  |        The process current working directory         |
|     auid     | bigint |            Audit User ID at process start            |
|     uid      | bigint |               User ID at process start               |
|     euid     | bigint |          Effective user ID at process start          |
|     gid      | bigint |              Group ID at process start               |
|     egid     | bigint |         Effective group ID at process start          |
|  owner_uid   | bigint |                  File owner user ID                  |
|  owner_gid   | bigint |                 File owner group ID                  |
|    atime     | bigint |            File last access in UNIX time             |
|    mtime     | bigint |            File modification in UNIX time            |
|    ctime     | bigint |        File last metadata change in UNIX time        |
|    btime     | bigint |              File creation in UNIX time              |
|  overflows   |  text  |          List of structures that overflowed          |
|    parent    | bigint | Process parent's PID, or -1 if cannot be determined. |
|     time     | bigint |            Time of execution in UNIX time            |
|    uptime    | bigint |          Time of execution in system uptime          |
|     eid      |  text  |                       Event ID                       |
|    status    | bigint |       OpenBSM Attribute: Status of the process       |
|   syscall    |  text  |  Syscall name: fork, vfork, clone, execve, execveat  |



#### process_file_events(EVENTED TABLE)
A File Integrity Monitor implementation using the audit service.

Thông tin giáp sát sợ toàn vẹn của file sử dụng audit.

|   COLUMN   |  TYPE  |                                      DESCRIPTION                                       |
|------------|--------|----------------------------------------------------------------------------------------|
| operation  |  text  |                                     Operation type                                     |
|    pid     | bigint |                                       Process ID                                       |
|    ppid    | bigint |                                   Parent process ID                                    |
|    time    | bigint |                             Time of execution in UNIX time                             |
| executable |  text  |                                  The executable path                                   |
|  partial   |  text  | True if this is a partial event (i.e.: this process existed before we started osquery) |
|    cwd     |  text  |                      The current working directory of the process                      |
|    path    |  text  |                           The path associated with the event                           |
| dest_path  |  text  |                      The canonical path associated with the event                      |
|    uid     |  text  |                      The uid of the process performing the action                      |
|    gid     |  text  |                      The gid of the process performing the action                      |
|    euid    |  text  |                    Effective user ID of the process using the file                     |
|    egid    |  text  |                    Effective group ID of the process using the file                    |
|   uptime   | bigint |                           Time of execution in system uptime                           |
|    eid     |  text  |                                        Event ID                                        |



#### process_memory_map
Process memory mapped files and pseudo device/regions.

Thông tin về bộ nhớ của process được map với file và device/regions giả.

|   COLUMN    |  TYPE   |                  DESCRIPTION                   |
|-------------|---------|------------------------------------------------|
|     pid     | integer |             Process (or thread) ID             |
|    start    |  text   |          Virtual start address (hex)           |
|     end     |  text   |           Virtual end address (hex)            |
| permissions |  text   |  r=read, w=write, x=execute, p=private (cow)   |
|   offset    | bigint  |            Offset into mapped path             |
|   device    |  text   |          MA:MI Major/minor device ID           |
|    inode    | integer | Mapped path inode, 0 means uninitialized (BSS) |
|    path     |  text   |       Path to mapped file or mapped type       |
|   pseudo    | integer |       1 If path is a pseudo path, else 0       |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from process_memory_map;
+------+--------------------+--------------------+-------------+----------+--------+-----------+-------------------------------------------------------------------------------------------------------------------------------------+--------+
| pid  | start              | end                | permissions | offset   | device | inode     | path                                                                                                                                | pseudo |
+------+--------------------+--------------------+-------------+----------+--------+-----------+-------------------------------------------------------------------------------------------------------------------------------------+--------+
| 1    | 0x55ffe9cc4000     | 0x55ffe9df7000     | r-xp        | 0        | fd:00  | 291717    | /usr/lib/systemd/systemd                                                                                                            | 0      |
| 1    | 0x55ffe9ff6000     | 0x55ffea036000     | r--p        | 1253376  | fd:00  | 291717    | /usr/lib/systemd/systemd                                                                                                            | 0      |
| 1    | 0x55ffea036000     | 0x55ffea037000     | rw-p        | 1515520  | fd:00  | 291717    | /usr/lib/systemd/systemd                                                                                                            | 0      |
| 1    | 0x55ffea3ea000     | 0x55ffea664000     | rw-p        | 0        | 00:00  | 0         | [heap]                                                                                                                              | 1      |
| 1    | 0x7fb25c000000     | 0x7fb25c021000     | rw-p        | 0        | 00:00  | 0         |                                                                                                                                     | 0      |
| 1    | 0x7fb25c021000     | 0x7fb260000000     | ---p        | 0        | 00:00  | 0         |                                                                                                                                     | 0      |
| 1    | 0x7fb26029c000     | 0x7fb26029d000     | ---p        | 0        | 00:00  | 0         |                                                                                                                                     | 0      |
| 1    | 0x7fb26029d000     | 0x7fb260a9d000     | rw-p        | 0        | 00:00  | 0         |                                                                                                                                     | 0      |
| 1    | 0x7fb260a9d000     | 0x7fb260a9e000     | ---p        | 0        | 00:00  | 0         |                                                                                                                                     | 0      |
| 1    | 0x7fb260a9e000     | 0x7fb26129e000     | rw-p        | 0        | 00:00  | 0         |                                                                                                                                     | 0      |
| 982  | 0x7ff9bf793000     | 0x7ff9bf794000     | r--p        | 163840   | fd:00  | 100875290 | /usr/lib64/ld-2.28.so                                                                                                               | 0      |
| 982  | 0x7ff9bf794000     | 0x7ff9bf795000     | rw-p        | 167936   | fd:00  | 100875290 | /usr/lib64/ld-2.28.so                                                                                                               | 0      |
| 982  | 0x7ff9bf795000     | 0x7ff9bf796000     | rw-p        | 0        | 00:00  | 0         |                                                                                                                                     | 0      |
| 982  | 0x7fff9eb39000     | 0x7fff9eb5a000     | rw-p        | 0        | 00:00  | 0         | [stack]                                                                                                                             | 1      |
| 982  | 0x7fff9eb6f000     | 0x7fff9eb72000     | r--p        | 0        | 00:00  | 0         | [vvar]                                                                                                                              | 1      |
| 982  | 0x7fff9eb72000     | 0x7fff9eb74000     | r-xp        | 0        | 00:00  | 0         | [vdso]                                                                                                                              | 1      |
| 982  | 0xffffffffff600000 | 0xffffffffff601000 | r-xp        | 0        | 00:00  | 0         | [vsyscall]                                                                                                                          | 1      |
+------+--------------------+--------------------+-------------+----------+--------+-----------+-------------------------------------------------------------------------------------------------------------------------------------+--------+
```
</details>



#### process_namespaces
Linux namespaces for processes running on the host system.

Linux namespaces của các tiến trình đang chạy trên hệ thống.

|      COLUMN      |  TYPE   |      DESCRIPTION       |
|------------------|---------|------------------------|
|       pid        | integer | Process (or thread) ID |
| cgroup_namespace |  text   | cgroup namespace inode |
|  ipc_namespace   |  text   |  ipc namespace inode   |
|  mnt_namespace   |  text   |  mnt namespace inode   |
|  net_namespace   |  text   |  net namespace inode   |
|  pid_namespace   |  text   |  pid namespace inode   |
|  user_namespace  |  text   |  user namespace inode  |
|  uts_namespace   |  text   |  uts namespace inode   |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from process_namespaces;
+------+------------------+---------------+---------------+---------------+---------------+----------------+---------------+
| pid  | cgroup_namespace | ipc_namespace | mnt_namespace | net_namespace | pid_namespace | user_namespace | uts_namespace |
+------+------------------+---------------+---------------+---------------+---------------+----------------+---------------+
| 1    | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 10   | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 100  | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 1009 | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 101  | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 102  | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 103  | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 92   | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 93   | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 94   | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 940  | 4026531835       | 4026531839    | 4026532738    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 95   | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 957  | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 958  | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 959  | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 96   | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 960  | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 97   | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 98   | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 980  | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 982  | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
| 99   | 4026531835       | 4026531839    | 4026531840    | 4026531992    | 4026531836    | 4026531837     | 4026531838    |
+------+------------------+---------------+---------------+---------------+---------------+----------------+---------------+
```
</details>



#### process_open_files
File descriptors for each process.

Mô tả file cho mỗi process.

| COLUMN |  TYPE  |               DESCRIPTION               |
|--------|--------|-----------------------------------------|
|  pid   | bigint |         Process (or thread) ID          |
|   fd   | bigint | Process-specific file descriptor number |
|  path  |  text  |      Filesystem path of descriptor      |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from process_open_files;
+------+-----+-------------------------------------------------------------------------------------------------------------------------------------+
| pid  | fd  | path                                                                                                                                |
+------+-----+-------------------------------------------------------------------------------------------------------------------------------------+
| 1    | 0   | /dev/null                                                                                                                           |
| 1    | 1   | /dev/null                                                                                                                           |
| 1    | 12  | /proc/1/mountinfo                                                                                                                   |
| 1    | 14  | /proc/swaps                                                                                                                         |
| 1    | 2   | /dev/null                                                                                                                           |
| 1    | 24  | /run/initctl                                                                                                                        |
| 1    | 28  | /run/dmeventd-server                                                                                                                |
| 1    | 3   | /dev/kmsg                                                                                                                           |
| 1    | 30  | /run/dmeventd-client                                                                                                                |
| 1    | 38  | /dev/autofs                                                                                                                         |
| 1    | 6   | /sys/fs/cgroup/systemd                                                                                                              |
| 1009 | 0   | /dev/null                                                                                                                           |
| 1009 | 1   | /var/log/mysqld.log                                                                                                                 |
| 1009 | 10  | /var/lib/mysql/ibdata1                                                                                                              |
| 1009 | 11  | /var/lib/mysql/ib_logfile1                                                                                                          |
| 1009 | 12  | /var/lib/mysql/undo_001                                                                                                             |
| 1009 | 13  | /tmp/#101228101 (deleted)                                                                                                           |
| 1009 | 14  | /var/lib/mysql/undo_002                                                                                                             |
| 1009 | 15  | /var/lib/mysql/ibtmp1                                                                                                               |
| 1009 | 16  | /var/lib/mysql/#innodb_temp/temp_1.ibt                                                                                              |
| 1009 | 17  | /var/lib/mysql/#innodb_temp/temp_2.ibt                                                                                              |
| 1009 | 18  | /var/lib/mysql/#innodb_temp/temp_3.ibt                                                                                              |
| 1009 | 19  | /var/lib/mysql/#innodb_temp/temp_4.ibt                                                                                              |
| 1009 | 2   | /var/log/mysqld.log                                                                                                                 |
| 894  | 15  | /var/lib/sss/db/timestamps_implicit_files.ldb                                                                                       |
| 894  | 17  | /var/lib/sss/mc/passwd                                                                                                              |
| 894  | 18  | /var/lib/sss/mc/group                                                                                                               |
| 894  | 19  | /var/lib/sss/mc/passwd                                                                                                              |
| 894  | 20  | /var/lib/sss/mc/group                                                                                                               |
| 894  | 21  | /var/lib/sss/mc/initgroups                                                                                                          |
| 894  | 5   | /var/lib/sss/db/config.ldb                                                                                                          |
| 894  | 6   | /var/log/sssd/sssd_nss.log                                                                                                          |
| 897  | 0   | /dev/null                                                                                                                           |
| 897  | 1   | /dev/null                                                                                                                           |
| 897  | 2   | /dev/null                                                                                                                           |
| 897  | 3   | /var/lib/sss/mc/passwd                                                                                                              |
| 897  | 5   | /var/log/firewalld                                                                                                                  |
| 897  | 8   | /tmp/ffiWZyfSi (deleted)                                                                                                            |
| 898  | 0   | /dev/null                                                                                                                           |
| 898  | 14  | /dev/input/event0                                                                                                                   |
| 898  | 15  | /dev/input/event1                                                                                                                   |
| 898  | 16  | /dev/tty6                                                                                                                           |
| 898  | 17  | /run/systemd/inhibit/1.ref                                                                                                          |
| 898  | 18  | /var/lib/sss/mc/passwd                                                                                                              |
| 898  | 19  | /run/systemd/sessions/1.ref                                                                                                         |
| 898  | 7   | /sys/devices/virtual/tty/tty0/active                                                                                                |
| 940  | 0   | /dev/null                                                                                                                           |
| 940  | 11  | /var/lib/sss/mc/passwd                                                                                                              |
| 940  | 19  | /run/systemd/inhibit/1.ref                                                                                                          |
| 957  | 0   | /dev/null                                                                                                                           |
| 957  | 3   | /dev/urandom                                                                                                                        |
| 957  | 4   | /var/lib/sss/mc/passwd                                                                                                              |
| 957  | 7   | /var/lib/sss/mc/group                                                                                                               |
| 958  | 0   | /dev/null                                                                                                                           |
| 958  | 11  | /dev/cpu_dma_latency                                                                                                                |
| 958  | 3   | /var/lib/sss/mc/passwd                                                                                                              |
| 958  | 5   | /var/log/tuned/tuned.log                                                                                                            |
| 959  | 0   | /dev/null                                                                                                                           |
| 959  | 5   | /tmp/osquery_status                                                                                                                 |
| 959  | 6   | /tmp/osquery_result                                                                                                                 |
| 960  | 0   | /dev/null                                                                                                                           |
| 980  | 0   | /dev/null                                                                                                                           |
| 980  | 6   | /var/lib/sss/mc/passwd                                                                                                              |
| 982  | 0   | /dev/tty1                                                                                                                           |
| 982  | 1   | /dev/tty1                                                                                                                           |
| 982  | 2   | /dev/tty1                                                                                                                           |
| 982  | 3   | /var/lib/sss/mc/group                                                                                                               |
+------+-----+-------------------------------------------------------------------------------------------------------------------------------------+
```
</details>



#### process_open_sockets
Processes which have open network sockets on the system.

Thông tin về các tiến trình có sockets đang mở trên hệ thống.

|     COLUMN     |  TYPE   |                    DESCRIPTION                     |
|----------------|---------|----------------------------------------------------|
|      pid       | integer |               Process (or thread) ID               |
|       fd       | bigint  |           Socket file descriptor number            |
|     socket     | bigint  |           Socket handle or inode number            |
|     family     | integer |           Network protocol (IPv4, IPv6)            |
|    protocol    | integer |            Transport protocol (TCP/UDP)            |
| local_address  |  text   |                Socket local address                |
| remote_address |  text   |               Socket remote address                |
|   local_port   | integer |                 Socket local port                  |
|  remote_port   | integer |                 Socket remote port                 |
|      path      |  text   | For UNIX sockets (family=AF_UNIX), the domain path |
|     state      |  text   |                  TCP socket state                  |
| net_namespace  |  text   |     The inode number of the network namespace      |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from process_open_sockets;
+------+----+--------+--------+----------+------------------+------------------+------------+-------------+-------------------------------------------------------+-------------+---------------+
| pid  | fd | socket | family | protocol | local_address    | remote_address   | local_port | remote_port | path                                                  | state       | net_namespace |
+------+----+--------+--------+----------+------------------+------------------+------------+-------------+-------------------------------------------------------+-------------+---------------+
| 957  | 6  | 28621  | 2      | 6        | 0.0.0.0          | 0.0.0.0          | 22         | 0           |                                                       | LISTEN      | 4026531992    |
| 960  | 6  | 28693  | 2      | 6        | 127.0.0.1        | 0.0.0.0          | 6379       | 0           |                                                       | LISTEN      | 4026531992    |
| 959  | 7  | 34048  | 2      | 6        | 127.0.0.1        | 127.0.0.1        | 51212      | 3306        |                                                       | ESTABLISHED | 4026531992    |
| 959  | 3  | 34039  | 2      | 6        | 127.0.0.1        | 127.0.0.1        | 51210      | 3306        |                                                       | ESTABLISHED | 4026531992    |
| 1797 | 5  | 34604  | 2      | 6        | 192.168.4.135    | 192.168.4.1      | 22         | 52994       |                                                       | ESTABLISHED | 4026531992    |
| 957  | 8  | 28630  | 10     | 6        | ::               | ::               | 22         | 0           |                                                       | LISTEN      | 4026531992    |
| 1009 | 39 | 34051  | 10     | 6        | ::               | ::               | 33060      | 0           |                                                       | LISTEN      | 4026531992    |
| 1009 | 32 | 34036  | 10     | 6        | ::               | ::               | 3306       | 0           |                                                       | LISTEN      | 4026531992    |
| 959  | 8  | 34070  | 10     | 6        | ::               | ::               | 8080       | 0           |                                                       | LISTEN      | 4026531992    |
| 1009 | 34 | 34040  | 10     | 6        | ::ffff:127.0.0.1 | ::ffff:127.0.0.1 | 3306       | 51210       |                                                       | ESTABLISHED | 4026531992    |
| 1009 | 38 | 34049  | 10     | 6        | ::ffff:127.0.0.1 | ::ffff:127.0.0.1 | 3306       | 51212       |                                                       | ESTABLISHED | 4026531992    |
| 959  | 9  | 48488  | 10     | 6        | ::1              | ::1              | 8080       | 52150       |                                                       | ESTABLISHED | 4026531992    |
| 1761 | 27 | 48487  | 10     | 6        | ::1              | ::1              | 52150      | 8080        |                                                       | ESTABLISHED | 4026531992    |
| 872  | 6  | 26125  | 2      | 17       | 127.0.0.1        | 0.0.0.0          | 323        | 0           |                                                       |             | 4026531992    |
| 940  | 18 | 53633  | 2      | 17       | 192.168.4.135    | 0.0.0.0          | 68         | 0           |                                                       |             | 4026531992    |
| 872  | 7  | 26126  | 10     | 17       | ::1              | ::               | 323        | 0           |                                                       |             | 4026531992    |
| 940  | 21 | 33381  | 10     | 255      | ::               | ::               | 58         | 0           |                                                       |             | 4026531992    |
| 1    | 15 | 22016  | 1      | 0        |                  |                  | 0          | 0           | /run/systemd/private                                  |             | 4026531992    |
| 1009 | 40 | 34053  | 1      | 0        |                  |                  | 0          | 0           | /var/run/mysqld/mysqlx.sock                           |             | 4026531992    |
| 729  | 5  | 12551  | 1      | 0        |                  |                  | 0          | 0           | /run/systemd/journal/dev-log                          |             | 4026531992    |
| 872  | 9  | 26132  | 1      | 0        |                  |                  | 0          | 0           | /var/run/chrony/chronyd.sock                          |             | 4026531992    |
| 1    | 43 | 25644  | 1      | 0        |                  |                  | 0          | 0           | /var/run/.heim_org.h5l.kcm-socket                     |             | 4026531992    |
| 958  | 7  | 30382  | 1      | 0        |                  |                  | 0          | 0           |                                                       |             | 4026531992    |
| 1    | 46 | 26043  | 1      | 0        |                  |                  | 0          | 0           |                                                       |             | 4026531992    |
| 2095 | 9  | 53988  | 1      | 0        |                  |                  | 0          | 0           |                                                       |             | 4026531992    |
| 980  | 2  | 28350  | 1      | 0        |                  |                  | 0          | 0           |                                                       |             | 4026531992    |
| 940  | 9  | 27064  | 1      | 0        |                  |                  | 0          | 0           |                                                       |             | 4026531992    |
| 898  | 12 | 26654  | 1      | 0        |                  |                  | 0          | 0           |                                                       |             | 4026531992    |
| 940  | 5  | 27027  | 1      | 0        |                  |                  | 0          | 0           |                                                       |             | 4026531992    |
| 1787 | 3  | 34913  | 1      | 0        |                  |                  | 0          | 0           |                                                       |             | 4026531992    |
| 765  | 5  | 23054  | 1      | 0        |                  |                  | 0          | 0           |                                                       |             | 4026531992    |
| 958  | 13 | 30966  | 1      | 0        |                  |                  | 0          | 0           |                                                       |             | 4026531992    |
| 893  | 16 | 26490  | 1      | 0        |                  |                  | 0          | 0           |                                                       |             | 4026531992    |
| 940  | 17 | 28670  | 1      | 0        |                  |                  | 0          | 0           |                                                       |             | 4026531992    |
| 870  | 13 | 26458  | 1      | 0        |                  |                  | 0          | 0           | /run/dbus/system_bus_socket                           |             | 4026531992    |
| 729  | 22 | 25985  | 1      | 0        |                  |                  | 0          | 0           | /run/systemd/journal/stdout                           |             | 4026531992    |
| 729  | 25 | 27213  | 1      | 0        |                  |                  | 0          | 0           | /run/systemd/journal/stdout                           |             | 4026531992    |
| 1787 | 19 | 34932  | 1      | 0        |                  |                  | 0          | 0           |                                                       |             | 4026531992    |
| 865  | 15 | 26473  | 1      | 0        |                  |                  | 0          | 0           | /var/lib/sss/pipes/private/sbus-monitor               |             | 4026531992    |
+------+----+--------+--------+----------+------------------+------------------+------------+-------------+-------------------------------------------------------+-------------+---------------+
```
</details>



#### processes
All running processes on the host system.

Thông tin về tất cả các tiến trình đang chạy trên hệ thống.

|         COLUMN         |  TYPE   |                                                               DESCRIPTION                                                                |
|------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------|
|          pid           | bigint  |                                                          Process (or thread) ID                                                          |
|          name          |  text   |                                                  The process path or shorthand argv[0]                                                   |
|          path          |  text   |                                                         Path to executed binary                                                          |
|        cmdline         |  text   |                                                              Complete argv                                                               |
|         state          |  text   |                                                              Process state                                                               |
|          cwd           |  text   |                                                    Process current working directory                                                     |
|          root          |  text   |                                                      Process virtual root directory                                                      |
|          uid           | bigint  |                                                             Unsigned user ID                                                             |
|          gid           | bigint  |                                                            Unsigned group ID                                                             |
|          euid          | bigint  |                                                        Unsigned effective user ID                                                        |
|          egid          | bigint  |                                                       Unsigned effective group ID                                                        |
|          suid          | bigint  |                                                          Unsigned saved user ID                                                          |
|          sgid          | bigint  |                                                         Unsigned saved group ID                                                          |
|        on_disk         | integer |                                             The process path exists yes=1, no=0, unknown=-1                                              |
|       wired_size       | bigint  |                                                Bytes of unpagable memory used by process                                                 |
|     resident_size      | bigint  |                                                 Bytes of private memory used by process                                                  |
|       total_size       | bigint  |                                                        Total virtual memory size                                                         |
|       user_time        | bigint  |                                               CPU time in milliseconds spent in user space                                               |
|      system_time       | bigint  |                                              CPU time in milliseconds spent in kernel space                                              |
|    disk_bytes_read     | bigint  |                                                           Bytes read from disk                                                           |
|   disk_bytes_written   | bigint  |                                                          Bytes written to disk                                                           |
|       start_time       | bigint  |                                      Process start time in seconds since Epoch, in case of error -1                                      |
|         parent         | bigint  |                                                           Process parent's PID                                                           |
|         pgroup         | bigint  |                                                              Process group                                                               |
|        threads         | integer |                                                    Number of threads used by process                                                     |
|          nice          | integer |                                                Process nice level (-20 to 20, default 0)                                                 |
|   is_elevated_token    | integer |                                                 Process uses elevated token yes=1, no=0                                                  |
|      elapsed_time      | bigint  |                                          Elapsed time in seconds this process has been running.                                          |
|      handle_count      | bigint  | Total number of handles that the process has open. This number is the sum of the handles currently opened by each thread in the process. |
| percent_processor_time | bigint  |    Returns elapsed time that all of the threads of this process used the processor to execute instructions in 100 nanoseconds ticks.     |
|          upid          | bigint  |                         A 64bit pid that is never reused. Returns -1 if we couldn't gather them from the system.                         |
|         uppid          | bigint  |                    The 64bit parent pid that is never reused. Returns -1 if we couldn't gather them from the system.                     |
|        cpu_type        | integer |                         A 64bit pid that is never reused. Returns -1 if we couldn't gather them from the system.                         |
|      cpu_subtype       | integer |                    The 64bit parent pid that is never reused. Returns -1 if we couldn't gather them from the system.                     |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from processes;
+------+------------------------------------+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------+----------------+------+------+------+------+------+------+------+---------+------------+---------------+------------+-----------+-------------+-----------------+--------------------+------------+--------+--------+---------+------+
| pid  | name                               | path                              | cmdline                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | state | cwd            | root | uid  | gid  | euid | egid | suid | sgid | on_disk | wired_size | resident_size | total_size | user_time | system_time | disk_bytes_read | disk_bytes_written | start_time | parent | pgroup | threads | nice |
+------+------------------------------------+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------+----------------+------+------+------+------+------+------+------+---------+------------+---------------+------------+-----------+-------------+-----------------+--------------------+------------+--------+--------+---------+------+
| 1    | systemd                            | /usr/lib/systemd/systemd          | /usr/lib/systemd/systemd --switched-root --system --deserialize 17                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0          | 9220000       | 178440000  | 470       | 1960        | 290369024       | 13643776           | 1576112128 | 0      | 1      | 1       | 0    |
| 10   | rcu_sched                          |                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | R     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | -1      | 0          |               |            | 10        | 720         | 0               | 0                  | 1576112128 | 2      | 0      | 1       | 0    |
| 100  | irq/31-pciehp                      |                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | -1      | 0          |               |            | 0         | 0           | 0               | 0                  | 1576112128 | 2      | 0      | 1       | 0    |
| 1009 | mysqld                             | /usr/sbin/mysqld                  | /usr/sbin/mysqld                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | S     | /var/lib/mysql | /    | 27   | 27   | 27   | 27   | 27   | 27   | 1       | 0          | 303248000     | 1387960000 | 36500     | 39710       | 107548672       | 623996928          | 1576112153 | 1      | 1009   | 40      | 0    |
| 101  | irq/32-pciehp                      |                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | -1      | 0          |               |            | 0         | 0           | 0               | 0                  | 1576112128 | 2      | 0      | 1       | 0    |
| 102  | irq/33-pciehp                      |                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | -1      | 0          |               |            | 0         | 0           | 0               | 0                  | 1576112128 | 2      | 0      | 1       | 0    |
| 103  | irq/34-pciehp                      |                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | -1      | 0          |               |            | 0         | 0           | 0               | 0                  | 1576112128 | 2      | 0      | 1       | 0    |
| 104  | irq/35-pciehp                      |                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | -1      | 0          |               |            | 0         | 0           | 0               | 0                  | 1576112128 | 2      | 0      | 1       | 0    |
| 105  | irq/36-pciehp                      |                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | -1      | 0          |               |            | 0         | 0           | 0               | 0                  | 1576112128 | 2      | 0      | 1       | 0    |
| 106  | irq/37-pciehp                      |                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | -1      | 0          |               |            | 0         | 0           | 0               | 0                  | 1576112128 | 2      | 0      | 1       | 0    |
| 897  | firewalld                          | /usr/libexec/platform-python3.6   | /usr/libexec/platform-python -s /usr/sbin/firewalld --nofork --nopid                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0          | 19288000      | 252576000  | 800       | 500         | 15466496        | 8192               | 1576112148 | 1      | 897    | 2       | 0    |
| 898  | systemd-logind                     | /usr/lib/systemd/systemd-logind   | /usr/lib/systemd/systemd-logind                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0          | 6232000       | 95108000   | 30        | 50          | 839680          | 0                  | 1576112148 | 1      | 898    | 1       | 0    |
| 9    | ksoftirqd/0                        |                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | R     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | -1      | 0          |               |            | 10        | 120         | 0               | 0                  | 1576112128 | 2      | 0      | 1       | 0    |
| 92   | kthrotld                           |                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | I     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | -1      | 0          |               |            | 0         | 0           | 0               | 0                  | 1576112128 | 2      | 0      | 1       | -20  |
| 93   | irq/24-pciehp                      |                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | -1      | 0          |               |            | 0         | 0           | 0               | 0                  | 1576112128 | 2      | 0      | 1       | 0    |
| 94   | irq/25-pciehp                      |                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | -1      | 0          |               |            | 0         | 0           | 0               | 0                  | 1576112128 | 2      | 0      | 1       | 0    |
| 940  | NetworkManager                     | /usr/sbin/NetworkManager          | /usr/sbin/NetworkManager --no-daemon                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0          | 8208000       | 390724000  | 180       | 220         | 8798720         | 53248              | 1576112151 | 1      | 940    | 3       | 0    |
| 95   | irq/26-pciehp                      |                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | -1      | 0          |               |            | 0         | 0           | 0               | 0                  | 1576112128 | 2      | 0      | 1       | 0    |
| 957  | sshd                               | /usr/sbin/sshd                    | /usr/sbin/sshd -D -oCiphers=aes256-gcm@openssh.com,chacha20-poly1305@openssh.com,aes256-ctr,aes256-cbc,aes128-gcm@openssh.com,aes128-ctr,aes128-cbc -oMACs=hmac-sha2-256-etm@openssh.com,hmac-sha1-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512-etm@openssh.com,hmac-sha2-256,hmac-sha1,umac-128@openssh.com,hmac-sha2-512 -oGSSAPIKexAlgorithms=gss-gex-sha1-,gss-group14-sha1- -oKexAlgorithms=curve25519-sha256@libssh.org,ecdh-sha2-nistp256,ecdh-sha2-nistp384,ecdh-sha2-nistp521,diffie-hellman-group-exchange-sha256,diffie-hellman-group14-sha256,diffie-hellman-group16-sha512,diffie-hellman-group18-sha512,diffie-hellman-group-exchange-sha1,diffie-hellman-group14-sha1 -oHostKeyAlgorithms=rsa-sha2-256,ecdsa-sha2-nistp256,ecdsa-sha2-nistp256-cert-v01@openssh.com,ecdsa-sha2-nistp384,ecdsa-sha2-nistp384-cert-v01@openssh.com,rsa-sha2-512,ecdsa-sha2-nistp521,ecdsa-sha2-nistp521-cert-v01@openssh.com,ssh-ed25519,ssh-ed25519-cert-v01@openssh.com,ssh-rsa,ssh-rsa-cert-v01@openssh.com -oPubkeyAcceptedKeyTypes=rsa-sha2-256,ecdsa-sha2-nistp256,ecdsa-sha2-nistp256-cert-v01@openssh.com,ecdsa-sha2-nistp384,ecdsa-sha2-nistp384-cert-v01@openssh.com,rsa-sha2-512,ecdsa-sha2-nistp521,ecdsa-sha2-nistp521-cert-v01@openssh.com,ssh-ed25519,ssh-ed25519-cert-v01@openssh.com,ssh-rsa,ssh-rsa-cert-v01@openssh.com | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0          | 2996000       | 92248000   | 0         | 20          | 1314816         | 0                  | 1576112152 | 1      | 957    | 1       | 0    |
| 958  | tuned                              | /usr/libexec/platform-python3.6   | /usr/libexec/platform-python -Es /usr/sbin/tuned -l -P                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0          | 16992000      | 401612000  | 1290      | 330         | 4071936         | 12288              | 1576112152 | 1      | 958    | 4       | 0    |
| 959  | fleet                              | /usr/bin/fleet                    | /usr/bin/fleet serve --mysql_address=127.0.0.1:3306 --mysql_database=kolide --mysql_username=kolide --mysql_password=P@ssw0rd --redis_address=127.0.0.1:6379 --server_cert=/etc/pki/tls/certs/server.cert --server_key=/etc/pki/tls/private/server.key --auth_jwt_key=MuijLKzrBcs3MzamaC9HwNJ3rNykCAlF --logging_json                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0          | 18852000      | 131080000  | 4080      | 3380        | 33734656        | 0                  | 1576112152 | 1      | 959    | 8       | 0    |
| 96   | irq/27-pciehp                      |                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | -1      | 0          |               |            | 0         | 0           | 0               | 0                  | 1576112128 | 2      | 0      | 1       | 0    |
| 960  | redis-server                       | /usr/bin/redis-server             | /usr/bin/redis-server 127.0.0.1:6379                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | S     | /var/lib/redis | /    | 994  | 991  | 994  | 991  | 994  | 991  | 1       | 0          | 2512000       | 53524000   | 7180      | 7690        | 2400256         | 8192               | 1576112152 | 1      | 960    | 4       | 0    |
| 97   | irq/28-pciehp                      |                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | -1      | 0          |               |            | 0         | 0           | 0               | 0                  | 1576112128 | 2      | 0      | 1       | 0    |
| 98   | irq/29-pciehp                      |                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | -1      | 0          |               |            | 0         | 0           | 0               | 0                  | 1576112128 | 2      | 0      | 1       | 0    |
| 980  | crond                              | /usr/sbin/crond                   | /usr/sbin/crond -n                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0          | 3044000       | 36088000   | 0         | 120         | 6594560         | 0                  | 1576112152 | 1      | 980    | 1       | 0    |
| 982  | agetty                             | /usr/sbin/agetty                  | /sbin/agetty -o -p -- \u --noclear tty1 linux                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | 1       | 0          | 1340000       | 13104000   | 0         | 0           | 352256          | 0                  | 1576112152 | 1      | 982    | 1       | 0    |
| 99   | irq/30-pciehp                      |                                   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | S     | /              | /    | 0    | 0    | 0    | 0    | 0    | 0    | -1      | 0          |               |            | 0         | 0           | 0               | 0                  | 1576112128 | 2      | 0      | 1       | 0    |
+------+------------------------------------+-----------------------------------+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------+----------------+------+------+------+------+------+------+------+---------+------------+---------------+------------+-----------+-------------+-----------------+--------------------+------------+--------+--------+---------+------+
```
</details>



#### prometheus_metrics
Network interfaces and relevant metadata.

|    COLUMN    |  TYPE  |              DESCRIPTION               |
|--------------|--------|----------------------------------------|
| target_name  |  text  |      Address of prometheus target      |
| metric_name  |  text  |  Name of collected Prometheus metric   |
| metric_value | double |  Value of collected Prometheus metric  |
| timestamp_ms | bigint | Unix timestamp of collected data in MS |



#### python_packages
Python packages installed in a system.

Danh sách các gói Python được cài đặt trong hệ thống.

|  COLUMN   | TYPE |                DESCRIPTION                 |
|-----------|------|--------------------------------------------|
|   name    | text |            Package display name            |
|  version  | text |          Package-supplied version          |
|  summary  | text |          Package-supplied summary          |
|  author   | text |          Optional package author           |
|  license  | text |  License under which package is launched   |
|   path    | text |     Path at which this module resides      |
| directory | text | Directory where Python modules are located |

<details>
<summary>Ví dụ:</summary>

```

```
</details>



#### routes
The active route table for the host system.
Thông tin bảng route hoạt động trên hệ thống.

|   COLUMN    |  TYPE   |               DESCRIPTION               |
|-------------|---------|-----------------------------------------|
| destination |  text   |         Destination IP address          |
|   netmask   | integer |             Netmask length              |
|   gateway   |  text   |              Route gateway              |
|   source    |  text   |              Route source               |
|    flags    | integer |         Flags to describe route         |
|  interface  |  text   |          Route local interface          |
|     mtu     | integer | Maximum Transmission Unit for the route |
|   metric    | integer |   Cost of route. Lowest is preferred    |
|    type     |  text   |              Type of route              |
|  hopcount   | integer |            Max hops expected            |



#### rpm_package_files
RPM packages that are currently installed on the host system.

Các gói RPM hiện đang được cài đặt trên hệ thống máy.

|  COLUMN   |  TYPE  |                 DESCRIPTION                  |
|-----------|--------|----------------------------------------------|
|  package  |  text  |               RPM package name               |
|   path    |  text  |                  Path name                   |
| username  |  text  |      File default username from info DB      |
| groupname |  text  |     File default groupname from info DB      |
|   mode    |  text  |      File permissions mode from info DB      |
|   size    | bigint | Expected file size in bytes from RPM info DB |
|  sha256   |  text  |     SHA256 file digest from RPM info DB      |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from rpm_package_files;
+-------------------------------+-----------------------------------------------------------------------------------------------------------------------------------+----------+-----------+------+----------+------------------------------------------------------------------+
| package                       | path                                                                                                                              | username | groupname | mode | size     | sha256                                                           |
+-------------------------------+-----------------------------------------------------------------------------------------------------------------------------------+----------+-----------+------+----------+------------------------------------------------------------------+
| NetworkManager                | /etc/NetworkManager                                                                                                               | root     | root      | 0755 | 0        | 0000000000000000000000000000000000000000000000000000000000000000 |
| NetworkManager                | /etc/NetworkManager/NetworkManager.conf                                                                                           | root     | root      | 0644 | 2145     | 39e9ceaa8ecd6b4ab9ef5fdaadbe69e3cabd632b32c2a6f5241ce105029f87f2 |
| NetworkManager                | /etc/NetworkManager/conf.d                                                                                                        | root     | root      | 0755 | 0        | 0000000000000000000000000000000000000000000000000000000000000000 |
| NetworkManager                | /etc/NetworkManager/dispatcher.d                                                                                                  | root     | root      | 0755 | 0        | 0000000000000000000000000000000000000000000000000000000000000000 |
| NetworkManager                | /etc/NetworkManager/dispatcher.d/no-wait.d                                                                                        | root     | root      | 0755 | 0        | 0000000000000000000000000000000000000000000000000000000000000000 |
| NetworkManager                | /etc/NetworkManager/dispatcher.d/pre-down.d                                                                                       | root     | root      | 0755 | 0        | 0000000000000000000000000000000000000000000000000000000000000000 |
| NetworkManager                | /etc/NetworkManager/dispatcher.d/pre-up.d                                                                                         | root     | root      | 0755 | 0        | 0000000000000000000000000000000000000000000000000000000000000000 |
| NetworkManager                | /etc/NetworkManager/dnsmasq-shared.d                                                                                              | root     | root      | 0755 | 0        | 0000000000000000000000000000000000000000000000000000000000000000 |
| NetworkManager                | /etc/NetworkManager/dnsmasq.d                                                                                                     | root     | root      | 0755 | 0        | 0000000000000000000000000000000000000000000000000000000000000000 |
| NetworkManager                | /etc/NetworkManager/system-connections                                                                                            | root     | root      | 0755 | 0        | 0000000000000000000000000000000000000000000000000000000000000000 |
| xz                            | /usr/share/man/man1/xz.1.gz                                                                                                       | root     | root      | 0644 | 20347    | cc0cd3a0d572851c516b9879da1852a5c24d11c584508f05c7fe9ea877b53770 |
| xz                            | /usr/share/man/man1/xzcat.1.gz                                                                                                    | root     | root      | 0777 | 7        | 0000000000000000000000000000000000000000000000000000000000000000 |
| xz                            | /usr/share/man/man1/xzcmp.1.gz                                                                                                    | root     | root      | 0777 | 11       | 0000000000000000000000000000000000000000000000000000000000000000 |
| xz                            | /usr/share/man/man1/xzdec.1.gz                                                                                                    | root     | root      | 0644 | 1283     | a8365cc214524b33516663d4ec174fc56b38826426281bfe6394068947a166a8 |
| xz                            | /usr/share/man/man1/xzdiff.1.gz                                                                                                   | root     | root      | 0644 | 664      | e2fe902ce8ac87799df0529b9590c6ff7c3ca474b482a4a2808e508513b8a105 |
| xz                            | /usr/share/man/man1/xzegrep.1.gz                                                                                                  | root     | root      | 0777 | 11       | 0000000000000000000000000000000000000000000000000000000000000000 |
| xz                            | /usr/share/man/man1/xzfgrep.1.gz                                                                                                  | root     | root      | 0777 | 11       | 0000000000000000000000000000000000000000000000000000000000000000 |
| xz                            | /usr/share/man/man1/xzgrep.1.gz                                                                                                   | root     | root      | 0644 | 700      | a94ec3ae3c9d01a11ca59aecb9f3533032789ac461764640115f808a317994eb |
| xz                            | /usr/share/man/man1/xzless.1.gz                                                                                                   | root     | root      | 0644 | 743      | c8d18f6125245e34e40f840f346a55404b3d8910682232a7cd89ac105fe8d112 |
| xz                            | /usr/share/man/man1/xzmore.1.gz                                                                                                   | root     | root      | 0644 | 636      | 7f4ad5d4263cbee6dff1787a1e95011be60894cb86495a99331b4d4a6135faac |
| xz-libs                       | /usr/lib/.build-id                                                                                                                | root     | root      | 0755 | 0        | 0000000000000000000000000000000000000000000000000000000000000000 |
| xz-libs                       | /usr/lib/.build-id/4b                                                                                                             | root     | root      | 0755 | 0        | 0000000000000000000000000000000000000000000000000000000000000000 |
| xz-libs                       | /usr/lib/.build-id/4b/9ca720dd420f278183935c63e76f079b4e8295                                                                      | root     | root      | 0777 | 38       | 0000000000000000000000000000000000000000000000000000000000000000 |
| xz-libs                       | /usr/lib64/liblzma.so.5                                                                                                           | root     | root      | 0777 | 16       | 0000000000000000000000000000000000000000000000000000000000000000 |
| xz-libs                       | /usr/lib64/liblzma.so.5.2.4                                                                                                       | root     | root      | 0755 | 192024   | 068e64692eea45539d4f8c7cd65f103a3334efb3f50f41835c3c3ff1e4bd4bb9 |
| xz-libs                       | /usr/share/doc/xz/COPYING                                                                                                         | root     | root      | 0644 | 2775     | bcb02973ef6e87ea73d331b3a80df7748407f17efdb784b61b47e0e610d3bb5c |
| yum                           | /etc/yum.conf                                                                                                                     | root     | root      | 0777 | 12       | 0000000000000000000000000000000000000000000000000000000000000000 |
| yum                           | /etc/yum/pluginconf.d                                                                                                             | root     | root      | 0777 | 14       | 0000000000000000000000000000000000000000000000000000000000000000 |
| yum                           | /etc/yum/protected.d                                                                                                              | root     | root      | 0777 | 18       | 0000000000000000000000000000000000000000000000000000000000000000 |
| yum                           | /etc/yum/vars                                                                                                                     | root     | root      | 0777 | 11       | 0000000000000000000000000000000000000000000000000000000000000000 |
| yum                           | /usr/bin/yum                                                                                                                      | root     | root      | 0777 | 5        | 0000000000000000000000000000000000000000000000000000000000000000 |
| yum                           | /usr/share/man/man1/yum-aliases.1.gz                                                                                              | root     | root      | 0644 | 17654    | 43e8941ffb4b9c7ff8bd3b2500287b36f8e085538dad96d6ef51beae371c6ab6 |
| yum                           | /usr/share/man/man5/yum.conf.5.gz                                                                                                 | root     | root      | 0644 | 7325     | f2500ecd6c7f0e27037083c47ba4aa1d9e5f9e70a67f19c4667b8c2de9f55adf |
| yum                           | /usr/share/man/man8/yum-shell.8.gz                                                                                                | root     | root      | 0644 | 17659    | 305ca2965dee732fb4335310c91cbf6589f114e00465967320db402f9bc48c71 |
| yum                           | /usr/share/man/man8/yum.8.gz                                                                                                      | root     | root      | 0644 | 17646    | 9c723a6bf26e565e92f389050dd98f87b8920cc77f937683d26f510ebbd4f381 |
| zlib                          | /usr/lib/.build-id                                                                                                                | root     | root      | 0755 | 0        | 0000000000000000000000000000000000000000000000000000000000000000 |
| zlib                          | /usr/lib/.build-id/38                                                                                                             | root     | root      | 0755 | 0        | 0000000000000000000000000000000000000000000000000000000000000000 |
| zlib                          | /usr/lib/.build-id/38/baffa0dcdbe3fda8e068d76ce8684ffdcd23d0                                                                      | root     | root      | 0777 | 36       | 0000000000000000000000000000000000000000000000000000000000000000 |
| zlib                          | /usr/lib64/libz.so.1                                                                                                              | root     | root      | 0777 | 14       | 0000000000000000000000000000000000000000000000000000000000000000 |
| zlib                          | /usr/lib64/libz.so.1.2.11                                                                                                         | root     | root      | 0755 | 101032   | 41c45beb0031fd6afecabdad8e6113a973db7d4c091b9c00f634defe6959d6c6 |
| zlib                          | /usr/share/doc/zlib                                                                                                               | root     | root      | 0755 | 0        | 0000000000000000000000000000000000000000000000000000000000000000 |
| zlib                          | /usr/share/doc/zlib/ChangeLog                                                                                                     | root     | root      | 0644 | 78559    | 13cc1a013ea21d5dae40d60cf4721cba9264f51e892951b3fa324e96e125cd1d |
| zlib                          | /usr/share/doc/zlib/FAQ                                                                                                           | root     | root      | 0644 | 16573    | 1e8a0078be0ff1b60d57561a9e4a8cad72892318a8831946cba1abd30d65521c |
| zlib                          | /usr/share/licenses/zlib                                                                                                          | root     | root      | 0755 | 0        | 0000000000000000000000000000000000000000000000000000000000000000 |
| zlib                          | /usr/share/licenses/zlib/README                                                                                                   | root     | root      | 0644 | 5187     | 7960b6b1cc63e619abb77acaea5427159605afee8c8b362664f4effc7d7f7d15 |
+-------------------------------+-----------------------------------------------------------------------------------------------------------------------------------+----------+-----------+------+----------+------------------------------------------------------------------+
```
</details>



#### rpm_packages
RPM packages that are currently installed on the host system.

Các gói RPM hiện đang được cài đặt trên hệ thống máy.

| COLUMN  |  TYPE   |            DESCRIPTION             |
|---------|---------|------------------------------------|
|  name   |  text   |          RPM package name          |
| version |  text   |          Package version           |
| release |  text   |          Package release           |
| source  |  text   | Source RPM package name (optional) |
|  size   | bigint  |       Package size in bytes        |
|  sha1   |  text   | SHA1 hash of the package contents  |
|  arch   |  text   |     Architecture(s) supported      |
|  epoch  | integer |        Package epoch value         |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from rpm_packages;
+-------------------------------+-------------+--------------------------------+-------------------------------------------------------------------+-----------+------------------------------------------+--------+-------+
| name                          | version     | release                        | source                                                            | size      | sha1                                     | arch   | epoch |
+-------------------------------+-------------+--------------------------------+-------------------------------------------------------------------+-----------+------------------------------------------+--------+-------+
| NetworkManager                | 1.14.0      | 14.el8                         | NetworkManager-1.14.0-14.el8.src.rpm                              | 9797209   | de081d9b028818b7a1917833289f91cd14971062 | x86_64 | 1     |
| NetworkManager-libnm          | 1.14.0      | 14.el8                         | NetworkManager-1.14.0-14.el8.src.rpm                              | 11109712  | 6d2721a08d56e3e44a4a6c8f7356d9a7a16b3668 | x86_64 | 1     |
| NetworkManager-team           | 1.14.0      | 14.el8                         | NetworkManager-1.14.0-14.el8.src.rpm                              | 60648     | a6504a1d686bb840c1e6d9f220bd019599c3b322 | x86_64 | 1     |
| NetworkManager-tui            | 1.14.0      | 14.el8                         | NetworkManager-1.14.0-14.el8.src.rpm                              | 723639    | edf06d80ed9e65a4aefe2022eeab188bbd9a3b72 | x86_64 | 1     |
| acl                           | 2.2.53      | 1.el8                          | acl-2.2.53-1.el8.src.rpm                                          | 205740    | cab7082e31039162ce59d1182734d9351260af1e | x86_64 |       |
| audit                         | 3.0         | 0.10.20180831git0047a6c.el8    | audit-3.0-0.10.20180831git0047a6c.el8.src.rpm                     | 678098    | 94cc030f09888dd804db81d1c67e2e8d50938fdf | x86_64 |       |
| audit-libs                    | 3.0         | 0.10.20180831git0047a6c.el8    | audit-3.0-0.10.20180831git0047a6c.el8.src.rpm                     | 298564    | 37bd6d51859cfaac03ebb240746214413cb7f36b | x86_64 |       |
| authselect                    | 1.0         | 13.el8                         | authselect-1.0-13.el8.src.rpm                                     | 60378     | 5993ef58ef9cbb0fd7093060fd58de62038d0cb0 | x86_64 |       |
| authselect-libs               | 1.0         | 13.el8                         | authselect-1.0-13.el8.src.rpm                                     | 535853    | 4f8beb3a5c058853e500a4bea2c40ac3ab72679e | x86_64 |       |
| basesystem                    | 11          | 5.el8                          | basesystem-11-5.el8.src.rpm                                       | 0         | 56c194df6ff81afccab1479eb6f71b66f23bb852 | noarch |       |
| bash                          | 4.4.19      | 8.el8_0                        | bash-4.4.19-8.el8_0.src.rpm                                       | 6929996   | aed98d148290c1b1498161c66949c2e640b32499 | x86_64 |       |
| bind-export-libs              | 9.11.4      | 17.P2.el8_0.1                  | bind-9.11.4-17.P2.el8_0.1.src.rpm                                 | 3109737   | cf16b5736f221fab0d32ea44e2a566e961ccd27c | x86_64 | 32    |
| biosdevname                   | 0.7.3       | 2.el8                          | biosdevname-0.7.3-2.el8.src.rpm                                   | 68988     | 4b23bdafe04c27519f13a8c131e7d9a09b4cd52d | x86_64 |       |
| tar                           | 1.30        | 4.el8                          | tar-1.30-4.el8.src.rpm                                            | 2914728   | 6524bd7da7d1a3ecb5147d692d5a740138786517 | x86_64 | 2     |
| teamd                         | 1.27        | 10.el8                         | libteam-1.27-10.el8.src.rpm                                       | 312194    | 1eec8836b49f0051c5b43db3aa955ab364b06d93 | x86_64 |       |
| timedatex                     | 0.5         | 3.el8                          | timedatex-0.5-3.el8.src.rpm                                       | 55948     | 3782bdf18952b1563faa60308d3082829020a5e7 | x86_64 |       |
| trousers                      | 0.3.14      | 2.el8                          | trousers-0.3.14-2.el8.src.rpm                                     | 417832    | 3142b1ad72332617731a6a4722013a575dc191bf | x86_64 |       |
| trousers-lib                  | 0.3.14      | 2.el8                          | trousers-0.3.14-2.el8.src.rpm                                     | 543325    | 760b3c941926499454ee35d20a583a626b09430b | x86_64 |       |
| tuned                         | 2.10.0      | 15.el8                         | tuned-2.10.0-15.el8.src.rpm                                       | 690364    | 7b472f49931ce1652c6fe1a92af99ebcf7e9ed7e | noarch |       |
| tzdata                        | 2019a       | 1.el8                          | tzdata-2019a-1.el8.src.rpm                                        | 1894965   | 4bbebd6ca20af1509e5f00e35b52adb766289abd | noarch |       |
| unbound-libs                  | 1.7.3       | 8.el8                          | unbound-1.7.3-8.el8.src.rpm                                       | 1412254   | 3ba08abee4ba706b6420fbef872a39b485120cf4 | x86_64 |       |
| unzip                         | 6.0         | 41.el8                         | unzip-6.0-41.el8.src.rpm                                          | 431562    | 99d933ff1e2ecbc72989791114eda8730bb6707b | x86_64 |       |
| util-linux                    | 2.32.1      | 8.el8                          | util-linux-2.32.1-8.el8.src.rpm                                   | 11756536  | 17d71321ee1355e65467c70123cf1533b6dd3414 | x86_64 |       |
| vim-minimal                   | 8.0.1763    | 10.el8                         | vim-8.0.1763-10.el8.src.rpm                                       | 1212852   | 84ebf9db2acaad8989be0343b1fb5d519db9ba5c | x86_64 | 2     |
| virt-what                     | 1.18        | 6.el8                          | virt-what-1.18-6.el8.src.rpm                                      | 48352     | 98ae6b8aaaa00379d68cc7b782350bc568ccda04 | x86_64 |       |
| wget                          | 1.19.5      | 7.el8_0.1                      | wget-1.19.5-7.el8_0.1.src.rpm                                     | 2917441   | 5471a8e2d1b32473bfd1ebba42fbd86c49a85de0 | x86_64 |       |
| which                         | 2.21        | 10.el8                         | which-2.21-10.el8.src.rpm                                         | 85406     | 0070a23aad56d04524c39982ce0dab89988daaae | x86_64 |       |
| xfsprogs                      | 4.19.0      | 2.el8                          | xfsprogs-4.19.0-2.el8.src.rpm                                     | 5306570   | 3dc9dafacdd34fd33d5f5bb37eaf42c6885eb673 | x86_64 |       |
| xkeyboard-config              | 2.24        | 3.el8                          | xkeyboard-config-2.24-3.el8.src.rpm                               | 5836251   | f472f314227b64384f31659be070d25506bd8ace | noarch |       |
| xmlsec1                       | 1.2.25      | 4.el8                          | xmlsec1-1.2.25-4.el8.src.rpm                                      | 611681    | 1bcc1a1be4a56d33d633342c35d879ad28135f67 | x86_64 |       |
| xmlsec1-openssl               | 1.2.25      | 4.el8                          | xmlsec1-1.2.25-4.el8.src.rpm                                      | 293904    | d9d538f08486a756f9fba4fcbebb748a51eb29ef | x86_64 |       |
| xz                            | 5.2.4       | 3.el8                          | xz-5.2.4-3.el8.src.rpm                                            | 432832    | 5d84e5ff96d36f921231179ce61fdd334820326f | x86_64 |       |
| xz-libs                       | 5.2.4       | 3.el8                          | xz-5.2.4-3.el8.src.rpm                                            | 194799    | 88908a4e92d0b88845dbdd215b17b267bae71888 | x86_64 |       |
| yum                           | 4.0.9.2     | 5.el8                          | dnf-4.0.9.2-5.el8.src.rpm                                         | 60284     | ba9909ae1055b9f1312623ca07036aa3d53895de | noarch |       |
| zlib                          | 1.2.11      | 10.el8                         | zlib-1.2.11-10.el8.src.rpm                                        | 201351    | 8eaa3295fedd267a8da29eddaa5c8c6935e86650 | x86_64 |       |
+-------------------------------+-------------+--------------------------------+-------------------------------------------------------------------+-----------+------------------------------------------+--------+-------+
```
</details>



#### selinux_events(EVENTED TABLE)
Track SELinux events.

Thông tin theo dõi các sự kiện của Selinux

| COLUMN  |  TYPE  |            DESCRIPTION             |
|---------|--------|------------------------------------|
|  type   |  text  |             Event type             |
| message |  text  |              Message               |
|  time   | bigint |   Time of execution in UNIX time   |
| uptime  | bigint | Time of execution in system uptime |
|   eid   |  text  |              Event ID              |



#### shadow
Local system users encrypted passwords and related information. Please note, that you usually need superuser rights to access `/etc/shadow`.

Thông tin về mật khẩu của các user trong hệ thống được mã hóa và các thông tin liên quan.

|     COLUMN      |  TYPE  |                          DESCRIPTION                           |
|-----------------|--------|----------------------------------------------------------------|
| password_status |  text  |                        Password status                         |
|    hash_alg     |  text  |                   Password hashing algorithm                   |
|   last_change   | bigint |  Date of last password change (starting from UNIX epoch date)  |
|       min       | bigint |        Minimal number of days between password changes         |
|       max       | bigint |        Maximum number of days between password changes         |
|     warning     | bigint |  Number of days before password expires to warn user about it  |
|    inactive     | bigint | Number of days after password expires until account is blocked |
|     expire      | bigint | Number of days since UNIX epoch date until account is disabled |
|      flag       | bigint |                            Reserved                            |
|    username     |  text  |                            Username                            |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from shadow;
+-----------------+----------+-------------+-----+-------+---------+----------+--------+------+------------------+
| password_status | hash_alg | last_change | min | max   | warning | inactive | expire | flag | username         |
+-----------------+----------+-------------+-----+-------+---------+----------+--------+------+------------------+
| active          | 6        | -1          | 0   | 99999 | 7       | -1       | -1     |      | root             |
| locked          |          | 18027       | 0   | 99999 | 7       | -1       | -1     |      | bin              |
| locked          |          | 18027       | 0   | 99999 | 7       | -1       | -1     |      | daemon           |
| locked          |          | 18027       | 0   | 99999 | 7       | -1       | -1     |      | adm              |
| locked          |          | 18027       | 0   | 99999 | 7       | -1       | -1     |      | lp               |
| locked          |          | 18027       | 0   | 99999 | 7       | -1       | -1     |      | sync             |
| locked          |          | 18027       | 0   | 99999 | 7       | -1       | -1     |      | shutdown         |
| locked          |          | 18027       | 0   | 99999 | 7       | -1       | -1     |      | halt             |
| locked          |          | 18027       | 0   | 99999 | 7       | -1       | -1     |      | mail             |
| locked          |          | 18027       | 0   | 99999 | 7       | -1       | -1     |      | operator         |
| locked          |          | 18027       | 0   | 99999 | 7       | -1       | -1     |      | games            |
| locked          |          | 18027       | 0   | 99999 | 7       | -1       | -1     |      | ftp              |
| locked          |          | 18027       | 0   | 99999 | 7       | -1       | -1     |      | nobody           |
| not_set         |          | 18228       | -1  | -1    | -1      | -1       | -1     |      | dbus             |
| not_set         |          | 18228       | -1  | -1    | -1      | -1       | -1     |      | systemd-coredump |
| not_set         |          | 18228       | -1  | -1    | -1      | -1       | -1     |      | systemd-resolve  |
| not_set         |          | 18228       | -1  | -1    | -1      | -1       | -1     |      | tss              |
| not_set         |          | 18228       | -1  | -1    | -1      | -1       | -1     |      | polkitd          |
| not_set         |          | 18228       | -1  | -1    | -1      | -1       | -1     |      | unbound          |
| not_set         |          | 18228       | -1  | -1    | -1      | -1       | -1     |      | sssd             |
| not_set         |          | 18228       | -1  | -1    | -1      | -1       | -1     |      | sshd             |
| not_set         |          | 18228       | -1  | -1    | -1      | -1       | -1     |      | chrony           |
| active          | 6        | -1          | 0   | 99999 | 7       | -1       | -1     |      | toor             |
| not_set         |          | 18237       | -1  | -1    | -1      | -1       | -1     |      | mysql            |
| not_set         |          | 18237       | -1  | -1    | -1      | -1       | -1     |      | redis            |
+-----------------+----------+-------------+-----+-------+---------+----------+--------+------+------------------+
```
</details>



#### shared_memory
OS shared memory regions.

|   COLUMN    |  TYPE   |             DESCRIPTION             |
|-------------|---------|-------------------------------------|
|    shmid    | integer |      Shared memory segment ID       |
|  owner_uid  | bigint  |      User ID of owning process      |
| creator_uid | bigint  |     User ID of creator process      |
|     pid     | bigint  | Process ID to last use the segment  |
| creator_pid | bigint  | Process ID that created the segment |
|    atime    | bigint  |            Attached time            |
|    dtime    | bigint  |            Detached time            |
|    ctime    | bigint  |            Changed time             |
| permissions |  text   |     Memory segment permissions      |
|    size     | bigint  |            Size in bytes            |
|  attached   | integer |    Number of attached processes     |
|   status    |  text   |      Destination/attach status      |
|   locked    | integer |    1 if segment is locked else 0    |



#### shell_history
A line-delimited (command) table of per-user .*_history data.

|    COLUMN    |  TYPE   |                       DESCRIPTION                        |
|--------------|---------|----------------------------------------------------------|
|     uid      | bigint  |                   Shell history owner                    |
|     time     | integer | Entry timestamp. It could be absent, default value is 0. |
|   command    |  text   |         Unparsed date/line/command history line          |
| history_file |  text   |           Path to the .*_history for this user           |



#### smart_drive_info
Drive information read by SMART controller utilizing autodetect.

|            COLUMN            |  TYPE   |                                     DESCRIPTION                                     |
|------------------------------|---------|-------------------------------------------------------------------------------------|
|         device_name          |  text   |                                Name of block device                                 |
|           disk_id            | integer | Physical slot number of device, only exists when hardware storage controller exists |
|         driver_type          |  text   |           The explicit device type used to retrieve the SMART information           |
|         model_family         |  text   |                                 Drive model family                                  |
|         device_model         |  text   |                                    Device Model                                     |
|        serial_number         |  text   |                                Device serial number                                 |
|       lu_wwn_device_id       |  text   |                                  Device Identifier                                  |
|    additional_product_id     |  text   |                        An additional drive identifier if any                        |
|       firmware_version       |  text   |                               Drive firmware version                                |
|        user_capacity         |  text   |                               Bytes of drive capacity                               |
|         sector_sizes         |  text   |                             Bytes of drive sector sizes                             |
|        rotation_rate         |  text   |                                      Drive RPM                                      |
|         form_factor          |  text   |                               Form factor if reported                               |
|        in_smartctl_db        | integer |                      Boolean value for if drive is recognized                       |
|         ata_version          |  text   |                                ATA version of drive                                 |
|        transport_type        |  text   |                                Drive transport type                                 |
|         sata_version         |  text   |                                SATA version, if any                                 |
| read_device_identity_failure |  text   |                       Error string for device id read, if any                       |
|       smart_supported        |  text   |                                SMART support status                                 |
|        smart_enabled         |  text   |                                SMART enabled status                                 |
|      packet_device_type      |  text   |                                 Packet device type                                  |
|          power_mode          |  text   |                                  Device power mode                                  |
|           warnings           |  text   |                       Warning messages from SMART controller                        |



#### smbios_tables
BIOS (DMI) structure common details and content.

|   COLUMN    |  TYPE   |        DESCRIPTION        |
|-------------|---------|---------------------------|
|   number    | integer |    Table entry number     |
|    type     | integer |     Table entry type      |
| description |  text   |  Table entry description  |
|   handle    | integer |    Table entry handle     |
| header_size | integer |   Header size in bytes    |
|    size     | integer | Table entry size in bytes |
|     md5     |  text   |  MD5 hash of table entry  |



#### socket_events(EVENTED TABLE)
Track network socket opens and closes.

Thông tin sự kiện của các kết nối socket.

|     COLUMN     |  TYPE   |                 DESCRIPTION                 |
|----------------|---------|---------------------------------------------|
|     action     |  text   |   The socket action (bind, listen, close)   |
|      pid       | bigint  |           Process (or thread) ID            |
|      path      |  text   |            Path of executed file            |
|       fd       |  text   | The file description for the process socket |
|      auid      | bigint  |                Audit User ID                |
|    success     | integer |       The socket open attempt status        |
|     family     | integer |       The Internet protocol family ID       |
|    protocol    | integer |           The network protocol ID           |
| local_address  |  text   |    Local address associated with socket     |
| remote_address |  text   |    Remote address associated with socket    |
|   local_port   | integer |     Local network protocol port number      |
|  remote_port   | integer |     Remote network protocol port number     |
|     socket     |  text   |  The local path (UNIX domain socket only)   |
|      time      | bigint  |       Time of execution in UNIX time        |
|     uptime     | bigint  |     Time of execution in system uptime      |
|      eid       |  text   |                  Event ID                   |



#### ssh_configs
A table of parsed ssh_configs.

Chứa thông tin cấu hình trong ssh_configs

|     COLUMN      |  TYPE  |              DESCRIPTION               |
|-----------------|--------|----------------------------------------|
|       uid       | bigint | The local owner of the ssh_config file |
|      block      |  text  |        The host or match block         |
|     option      |  text  |          The option and value          |
| ssh_config_file |  text  |      Path to the ssh_config file       |

<details>
<summary>Ví dụ:</summary>

```
+-----+-------+--------------------------------------+---------------------+
| uid | block | option                               | ssh_config_file     |
+-----+-------+--------------------------------------+---------------------+
| 0   |       | include /etc/ssh/ssh_config.d/*.conf | /etc/ssh/ssh_config |
+-----+-------+--------------------------------------+---------------------+
```
</details>



#### sudoers
Rules for running commands as other users via sudo.

Quy tắc (rules) chạy lệnh như những người dùng khác thông qua sudo.

|    COLUMN    | TYPE |              DESCRIPTION              |
|--------------|------|---------------------------------------|
|    source    | text | Source file containing the given rule |
|    header    | text |         Symbol for given rule         |
| rule_details | text |            Rule definition            |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from sudoers;
+--------------+-------------+--------------------------------------------------------------------------+
| source       | header      | rule_details                                                             |
+--------------+-------------+--------------------------------------------------------------------------+
| /etc/sudoers | Defaults    |   !visiblepw                                                             |
| /etc/sudoers | Defaults    |    always_set_home                                                       |
| /etc/sudoers | Defaults    |    match_group_by_gid                                                    |
| /etc/sudoers | Defaults    |    always_query_group_plugin                                             |
| /etc/sudoers | Defaults    |    env_reset                                                             |
| /etc/sudoers | Defaults    |    env_keep =  "COLORS DISPLAY HOSTNAME HISTSIZE KDEDIR LS_COLORS"       |
| /etc/sudoers | Defaults    |    env_keep += "MAIL PS1 PS2 QTDIR USERNAME LANG LC_ADDRESS LC_CTYPE"    |
| /etc/sudoers | Defaults    |    env_keep += "LC_COLLATE LC_IDENTIFICATION LC_MEASUREMENT LC_MESSAGES" |
| /etc/sudoers | Defaults    |    env_keep += "LC_MONETARY LC_NAME LC_NUMERIC LC_PAPER LC_TELEPHONE"    |
| /etc/sudoers | Defaults    |    env_keep += "LC_TIME LC_ALL LANGUAGE LINGUAS _XKB_CHARSET XAUTHORITY" |
| /etc/sudoers | Defaults    |    secure_path = /sbin:/bin:/usr/sbin:/usr/bin                           |
| /etc/sudoers | root        | ALL=(ALL) 	ALL                                                         |
| /etc/sudoers | %wheel      | ALL=(ALL)	ALL                                                         |
| /etc/sudoers | #includedir | /etc/sudoers.d                                                           |
+--------------+-------------+--------------------------------------------------------------------------+
```
</details>



#### suid_bin
suid binaries in common locations.

|   COLUMN    | TYPE |      DESCRIPTION      |
|-------------|------|-----------------------|
|    path     | text |      Binary path      |
|  username   | text | Binary owner username |
|  groupname  | text |  Binary owner group   |
| permissions | text |  Binary permissions   |



#### syslog_events(EVENTED TABLE)


|  COLUMN  |  TYPE   |          DESCRIPTION           |
|----------|---------|--------------------------------|
|   time   | bigint  |    Current unix epoch time     |
| datetime |  text   |      Time known to syslog      |
|   host   |  text   | Hostname configured for syslog |
| severity | integer |        Syslog severity         |
| facility |  text   |        Syslog facility         |
|   tag    |  text   |         The syslog tag         |
| message  |  text   |       The syslog message       |
|   eid    |  text   |            Event ID            |



#### system_controls
sysctl names, values, and settings information.

|    COLUMN     | TYPE |              DESCRIPTION              |
|---------------|------|---------------------------------------|
|     name      | text |         Full sysctl MIB name          |
|      oid      | text |              Control MIB              |
|   subsystem   | text |      Subsystem ID, control type       |
| current_value | text |           Value of setting            |
| config_value  | text | The MIB value set in /etc/sysctl.conf |
|     type      | text |               Data type               |
|  field_name   | text |   Specific attribute of opaque type   |



#### system_info
System information for identification.

Chứa thông tin về hệ thống để nhận diện.

|       COLUMN       |  TYPE   |                     DESCRIPTION                     |
|--------------------|---------|-----------------------------------------------------|
|      hostname      |  text   |          Network hostname including domain          |
|        uuid        |  text   |          Unique ID provided by the system           |
|      cpu_type      |  text   |                      CPU type                       |
|    cpu_subtype     |  text   |                     CPU subtype                     |
|     cpu_brand      |  text   |     CPU brand string, contains vendor and model     |
| cpu_physical_cores | integer |    Number of physical CPU cores in to the system    |
| cpu_logical_cores  | integer | Number of logical CPU cores available to the system |
|   cpu_microcode    |  text   |                  Microcode version                  |
|  physical_memory   | bigint  |           Total physical memory in bytes            |
|  hardware_vendor   |  text   |              Hardware or board vendor               |
|   hardware_model   |  text   |               Hardware or board model               |
|  hardware_version  |  text   |              Hardware or board version              |
|  hardware_serial   |  text   |            Device or board serial number            |
|   computer_name    |  text   |          Friendly computer name (optional)          |
|   local_hostname   |  text   |              Local hostname (optional)              |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from system_info;
+---------------+--------------------------------------+----------+-------------+------------------------------------------+--------------------+-------------------+---------------+-----------------+-----------------+-------------------------+------------------+--------------------------------------------------------+---------------+----------------+
| hostname      | uuid                                 | cpu_type | cpu_subtype | cpu_brand                                | cpu_physical_cores | cpu_logical_cores | cpu_microcode | physical_memory | hardware_vendor | hardware_model          | hardware_version | hardware_serial                                        | computer_name | local_hostname |
+---------------+--------------------------------------+----------+-------------+------------------------------------------+--------------------+-------------------+---------------+-----------------+-----------------+-------------------------+------------------+--------------------------------------------------------+---------------+----------------+
| CentOS-8-1905 | b5c44d56-7c47-b40a-cfaa-091a699799e9 | x86_64   | 61          | Intel(R) Core(TM) i7-5500U CPU @ 2.40GHz | 1                  | 1                 | 0x2e          | 836816896       | VMware, Inc.    | VMware Virtual Platform | None             | VMware-56 4d c4 b5 47 7c 0a b4-cf aa 09 1a 69 97 99 e9 | CentOS-8-1905 | CentOS-8-1905  |
+---------------+--------------------------------------+----------+-------------+------------------------------------------+--------------------+-------------------+---------------+-----------------+-----------------+-------------------------+------------------+--------------------------------------------------------+---------------+----------------+
```
</details>



#### time
Track current date and time in the system.

|     COLUMN     |  TYPE   |                            DESCRIPTION                             |
|----------------|---------|--------------------------------------------------------------------|
|    weekday     |  text   |                   Current weekday in the system                    |
|      year      | integer |                     Current year in the system                     |
|     month      | integer |                    Current month in the system                     |
|      day       | integer |                     Current day in the system                      |
|      hour      | integer |                     Current hour in the system                     |
|    minutes     | integer |                   Current minutes in the system                    |
|    seconds     | integer |                   Current seconds in the system                    |
|    timezone    |  text   |                   Current timezone in the system                   |
|   local_time   | integer |               Current local UNIX time in the system                |
| local_timezone |  text   |                Current local timezone in the system                |
|   unix_time    | integer | Current UNIX time in the system, converted to UTC if --utc enabled |
|   timestamp    |  text   |            Current timestamp (log format) in the system            |
|    datetime    |  text   |          Current date and time (ISO format) in the system          |
|    iso_8601    |  text   |              Current time (ISO format) in the system               |
| win_timestamp  | bigint  |              Timestamp value in 100 nanosecond units.              |



#### ulimit_info
System resource usage limits.

|   COLUMN   | TYPE |          DESCRIPTION          |
|------------|------|-------------------------------|
|    type    | text | System resource to be limited |
| soft_limit | text |      Current limit value      |
| hard_limit | text |      Maximum limit value      |



#### uptime
Track time passed since last boot.

|    COLUMN     |  TYPE   |     DESCRIPTION      |
|---------------|---------|----------------------|
|     days      | integer |    Days of uptime    |
|     hours     | integer |   Hours of uptime    |
|    minutes    | integer |  Minutes of uptime   |
|    seconds    | integer |  Seconds of uptime   |
| total_seconds | bigint  | Total uptime seconds |



#### usb_devices
USB devices that are actively plugged into the host system.

|   COLUMN    |  TYPE   |               DESCRIPTION                |
|-------------|---------|------------------------------------------|
| usb_address | integer |         USB Device used address          |
|  usb_port   | integer |           USB Device used port           |
|   vendor    |  text   |         USB Device vendor string         |
|  vendor_id  |  text   | Hex encoded USB Device vendor identifier |
|   version   |  text   |        USB Device version number         |
|    model    |  text   |         USB Device model string          |
|  model_id   |  text   | Hex encoded USB Device model identifier  |
|   serial    |  text   |       USB Device serial connection       |
|    class    |  text   |             USB Device class             |
|  subclass   |  text   |           USB Device subclass            |
|  protocol   |  text   |           USB Device protocol            |
|  removable  | integer |   1 If USB device is removable else 0    |



#### user_events(EVENTED TABLE)
Track user events from the audit framework.
Theo dõi các sự kiện của người dùng từ audit framework.

|  COLUMN  |  TYPE   |                 DESCRIPTION                 |
|----------|---------|---------------------------------------------|
|   uid    | bigint  |                   User ID                   |
|   auid   | bigint  |                Audit User ID                |
|   pid    | bigint  |           Process (or thread) ID            |
| message  |  text   |           Message from the event            |
|   type   | integer | The file description for the process socket |
|   path   |  text   |          Supplied path from event           |
| address  |  text   | The Internet protocol address or family ID  |
| terminal |  text   |           The network protocol ID           |
|   time   | bigint  |       Time of execution in UNIX time        |
|  uptime  | bigint  |     Time of execution in system uptime      |
|   eid    |  text   |                  Event ID                   |



#### user_groups
Local system user group relationships.

Thông tin về mối quan hệ giữa các user và group.

| COLUMN |  TYPE  | DESCRIPTION |
|--------|--------|-------------|
|  uid   | bigint |   User ID   |
|  gid   | bigint |  Group ID   |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from user_groups;
+-------+-------+
| uid   | gid   |
+-------+-------+
| 0     | 0     |
| 1     | 1     |
| 2     | 2     |
| 3     | 4     |
| 4     | 7     |
| 5     | 0     |
| 6     | 0     |
| 7     | 0     |
| 8     | 12    |
| 11    | 0     |
| 12    | 100   |
| 14    | 50    |
| 65534 | 65534 |
| 81    | 81    |
| 999   | 997   |
| 193   | 193   |
| 59    | 59    |
| 998   | 996   |
| 997   | 995   |
| 996   | 993   |
| 74    | 74    |
| 995   | 992   |
| 1000  | 1000  |
| 1000  | 10    |
| 27    | 27    |
| 994   | 991   |
+-------+-------+
```
</details>



#### user_ssh_keys
Returns the private keys in the users ~/.ssh directory and whether or not they are encrypted.

Chứa private keys trong thư mục `~/.ssh` và thông tin nó có được mã hóa hay không.

|  COLUMN   |  TYPE   |              DESCRIPTION              |
|-----------|---------|---------------------------------------|
|    uid    | bigint  | The local user that owns the key file |
|   path    |  text   |           Path to key file            |
| encrypted | integer |  1 if key is encrypted, 0 otherwise   |



#### users
Local user accounts (including domain accounts that have logged on locally (Windows)).

Thông tin về tài khoản người dùng cục bộ (Bao gồm các tài khoản miền đã đăng nhập cục bộ (Windows))

|   COLUMN    |  TYPE   |                             DESCRIPTION                             |
|-------------|---------|---------------------------------------------------------------------|
|     uid     | bigint  |                               User ID                               |
|     gid     | bigint  |                         Group ID (unsigned)                         |
| uid_signed  | bigint  |                   User ID as int64 signed (Apple)                   |
| gid_signed  | bigint  |              Default group ID as int64 signed (Apple)               |
|  username   |  text   |                              Username                               |
| description |  text   |                      Optional user description                      |
|  directory  |  text   |                        User's home directory                        |
|    shell    |  text   |                   User's configured default shell                   |
|    uuid     |  text   |                User's UUID (Apple) or SID (Windows)                 |
|    type     |  text   | Whether the account is roaming (domain), local, or a system profile |
|  is_hidden  | integer |               IsHidden attribute set in OpenDirectory               |

<details>
<summary>Ví dụ:</summary>

```
osquery> select * from users;
+-------+-------+------------+------------+------------------+-----------------------------------------------------------------+-----------------+----------------+------+
| uid   | gid   | uid_signed | gid_signed | username         | description                                                     | directory       | shell          | uuid |
+-------+-------+------------+------------+------------------+-----------------------------------------------------------------+-----------------+----------------+------+
| 0     | 0     | 0          | 0          | root             | root                                                            | /root           | /bin/bash      |      |
| 1     | 1     | 1          | 1          | bin              | bin                                                             | /bin            | /sbin/nologin  |      |
| 2     | 2     | 2          | 2          | daemon           | daemon                                                          | /sbin           | /sbin/nologin  |      |
| 3     | 4     | 3          | 4          | adm              | adm                                                             | /var/adm        | /sbin/nologin  |      |
| 4     | 7     | 4          | 7          | lp               | lp                                                              | /var/spool/lpd  | /sbin/nologin  |      |
| 5     | 0     | 5          | 0          | sync             | sync                                                            | /sbin           | /bin/sync      |      |
| 6     | 0     | 6          | 0          | shutdown         | shutdown                                                        | /sbin           | /sbin/shutdown |      |
| 7     | 0     | 7          | 0          | halt             | halt                                                            | /sbin           | /sbin/halt     |      |
| 8     | 12    | 8          | 12         | mail             | mail                                                            | /var/spool/mail | /sbin/nologin  |      |
| 11    | 0     | 11         | 0          | operator         | operator                                                        | /root           | /sbin/nologin  |      |
| 12    | 100   | 12         | 100        | games            | games                                                           | /usr/games      | /sbin/nologin  |      |
| 14    | 50    | 14         | 50         | ftp              | FTP User                                                        | /var/ftp        | /sbin/nologin  |      |
| 65534 | 65534 | 65534      | 65534      | nobody           | Kernel Overflow User                                            | /               | /sbin/nologin  |      |
| 81    | 81    | 81         | 81         | dbus             | System message bus                                              | /               | /sbin/nologin  |      |
| 999   | 997   | 999        | 997        | systemd-coredump | systemd Core Dumper                                             | /               | /sbin/nologin  |      |
| 193   | 193   | 193        | 193        | systemd-resolve  | systemd Resolver                                                | /               | /sbin/nologin  |      |
| 59    | 59    | 59         | 59         | tss              | Account used by the trousers package to sandbox the tcsd daemon | /dev/null       | /sbin/nologin  |      |
| 998   | 996   | 998        | 996        | polkitd          | User for polkitd                                                | /               | /sbin/nologin  |      |
| 997   | 995   | 997        | 995        | unbound          | Unbound DNS resolver                                            | /etc/unbound    | /sbin/nologin  |      |
| 996   | 993   | 996        | 993        | sssd             | User for sssd                                                   | /               | /sbin/nologin  |      |
| 74    | 74    | 74         | 74         | sshd             | Privilege-separated SSH                                         | /var/empty/sshd | /sbin/nologin  |      |
| 995   | 992   | 995        | 992        | chrony           |                                                                 | /var/lib/chrony | /sbin/nologin  |      |
| 1000  | 1000  | 1000       | 1000       | toor             | toor                                                            | /home/toor      | /bin/bash      |      |
| 27    | 27    | 27         | 27         | mysql            | MySQL Server                                                    | /var/lib/mysql  | /bin/false     |      |
| 994   | 991   | 994        | 991        | redis            | Redis Database Server                                           | /var/lib/redis  | /sbin/nologin  |      |
+-------+-------+------------+------------+------------------+-----------------------------------------------------------------+-----------------+----------------+------+
```
</details>



#### yara
Track YARA matches for files or PIDs.

|  COLUMN   |  TYPE   |      DESCRIPTION       |
|-----------|---------|------------------------|
|   path    |  text   |    The path scanned    |
|  matches  |  text   |  List of YARA matches  |
|   count   | integer | Number of YARA matches |
| sig_group |  text   |  Signature group used  |
|  sigfile  |  text   |  Signature file used   |
|  strings  |  text   |    Matching strings    |
|   tags    |  text   |     Matching tags      |



#### yara_events(EVENTED TABLE)
Track YARA matches for files specified in configuration data.

|     COLUMN     |  TYPE   |             DESCRIPTION             |
|----------------|---------|-------------------------------------|
|  target_path   |  text   |          The path scanned           |
|    category    |  text   |      The category of the file       |
|     action     |  text   | Change action (UPDATE, REMOVE, etc) |
| transaction_id | bigint  |     ID used during bulk update      |
|    matches     |  text   |        List of YARA matches         |
|     count      | integer |       Number of YARA matches        |
|    strings     |  text   |          Matching strings           |
|      tags      |  text   |            Matching tags            |
|      time      | bigint  |          Time of the scan           |
|      eid       |  text   |              Event ID               |



#### yum_sources
Current list of Yum repositories or software channels.

|  COLUMN  | TYPE |           DESCRIPTION            |
|----------|------|----------------------------------|
|   name   | text |         Repository name          |
| baseurl  | text |       Repository base URL        |
| enabled  | text |  Whether the repository is used  |
| gpgcheck | text | Whether packages are GPG checked |
|  gpgkey  | text |          URL to GPG key          |