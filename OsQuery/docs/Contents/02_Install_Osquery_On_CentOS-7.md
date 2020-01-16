# Install Osquery On CentOS-7
Dưới đây là các bước cài đặt Osquery trên CentOS 7, đối với các nền tảng khác có thể tham khảo ở trang download của Osquery tại đường dẫn https://osquery.io/downloads:



## Cập nhật OS và cài đặt các gói bổ trợ
Thực hiện các lệnh sau để cập nhật hệ thống và cài đặt các gói bổ trợ trong quá trình cài đặt Osquery:

```
$ sudo yum update -y
$ sudo yum install -y epel-release
$ sudo yum update -y
$ sudo yum install -y yum-utils wget git unzip
```



## Cài đặt OsQuery
Để cài đặt Osquery ta thực hiện các lệnh sau để thêm các repository và cài đặt:
```
$ curl -L https://pkg.osquery.io/rpm/GPG | sudo tee /etc/pki/rpm-gpg/RPM-GPG-KEY-osquery
$ sudo yum-config-manager --add-repo https://pkg.osquery.io/rpm/osquery-s3-rpm.repo
$ sudo yum-config-manager --enable osquery-s3-rpm
$ sudo yum install osquery
```

## Cấu hình Osquery
Sau khi đã cài đặt thành công Osquery ta cần copy file cấu hình mẫu của Osquery tại đường dẫn /usr/share/osquery/osquery.example.conf đến /etc/osquery/osquery.conf bằng lệnh sau:

```
$ sudo cp /usr/share/osquery/osquery.example.conf /etc/osquery/osquery.conf
```

Sau đó ta cần sửa lại một số cấu hình trước khi khởi chạy Osquery cụ thể như sau:

Bỏ dòng comment (//) tại các dòng:

```
//"logger_path": "/var/log/osquery",
//"disable_logging": "false",
//"database_path": "/var/osquery/osquery.db",
```

Thành:

```
"logger_path": "/var/log/osquery",
"disable_logging": "false",
"database_path": "/var/osquery/osquery.db",
```



## Khởi động Osquery
Để khởi động trình nền của Osqueryd ta sử dụng lệnh sau:
```
$ sudo systemctl start osqueryd
# Hoặc
$ sudo osqueryctl start
```

Để bật hoặc tắt trình nền Osqueryd khởi động cùng hệ thống ta sử dụng lệnh sau:

```
# Bật trình nền khởi động cùng hệ thống
$ sudo systemctl enable osqueryd

# Tắt trình nền khởi động cùng hệ thống
$ sudo systemctl disable osqueryd
```

Để khởi động chế độ shell của Osquery ta sử dụng lệnh sau:

```
$ sudo osqueryi
```

Ngoài ra dưới đây là một số lệnh khác để tương tác với Osquery:

```
# Tắt trình nền osqueryd
$ sudo systemctl stop osqueryd
# Hoặc
$ sudo osqueryctl stop

# Khởi động lại trình nền osqueryd
$ sudo systemctl restart osqueryd
# Hoặc
$ sudo osqueryctl restart

# Kiểm tra trạng thái của osquery
$ sudo systemctl status osqueryd
# Hoặc
$ sudo osqueryctl status

# Kiểm tra cấu hình osquery
$ sudo osqueryctl config-check
```