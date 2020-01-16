# OSQUERY CONFIGURATION



Mặc định sau khi cài đặt Osquery ta có một file cấu hình mẫu tại `/usr/share/osquery/osquery.example.conf`, để osquery hoạt động ta cần copy file cấu hình này vào đường sau tùy thuộc vào nền tảng:

- Windows: `C:\Program Files\osquery\osquery.conf`
- Linux: `/etc/osquery/osquery.conf và /etc/osquery/osquery.conf.d/`
- MacOS: `/var/osquery/osquery.conf và /var/osquery/osquery.conf.d/`

File cấu hình của osquery được viết theo định dạng json với nhiều thành phần cấu hình khác nhau, dưới đây là cấu trúc của file cấu hình osquery:

```
{
    "options": {
        // Các khai báo
    },

    "schedule": {
        // Các khai báo
    },

    "packs": {
        // Các khai báo
    },

    "decorators": {
        //Các khai báo

    },

    "file_paths": {
        // Các khai báo
    }

    // Các khai báo khác.
}
```

Sau đây là chi tiết về các thành phần trong file cấu hình của osquery:



## Options
Khóa options là khóa chỉ định các tùy chọn cho osquery, các giá trị trong options là một trong các cờ CLI của osquery, trong options ta có thể xác định các cấu hình như plugin ghi log, đường dẫn thư mục ghi log, đường dẫn lưu trữ database, .v.v. và rất nhiều cấu hình khác. Để biết về các cờ CLI ta có thể chạy lệnh “osqueryd –help”. Sau đây là ví dụ về các cấu hình trong options của osquery:

```
{
    "options": {
        "config_plugin": "filesystem",
        "logger_plugin": "filesystem",
        "logger_path": "/var/log/osquery",
        "disable_logging": "false",
        "database_path": "/var/osquery/osquery.db",
        "host_identifier": "uuid"
    }
}
```



## Schedule
Khóa schedule là khóa xác định tên và chi tiết về các truy vấn được lên lịch như chuỗi truy vấn được thực hiện, khoảng thời gian để chạy lại truy vấn, dạng xuất kết quả, .v.v. Sau đây là ví dụ và chi tiết về các thành phần trong shedule:

```
{
    "schedule": {
        "system_info": {
            "query": "SELECT * FROM system_info",
            "interval": 60,
            "snapshot": true,
            "blacklist": false
        },
        "users_info": {
            "query": "SELECT * FROM users;",
            "interval": 3600,
            "removed": false,
            "platform": "darwin",
            "version": "1.4.5"
        }
    }
}
```

Trong đó:
- query: xác định chuỗi truy vấn cần chạy
- interval: xác định một khoảng thời gian tính bằng giây để chạy lại truy vấn
- removed: một giá trị boolean để xác định xem các sự kiện “removed” có được ghi lại vào log hay không, mặc định là true
- snapshot: một giá trị boolean để đặt chế độ “snapshot” cho query, mặc định là false
- platform: giới hạn truy vấn này đối với một nền tảng nhất định, mặc định nó cho phép chạy trên tất cả các nền tảng; ta có thể sử dụng dấu phẩy để đặt nhiều nền tảng.
- version: chỉ chạy trên các phiên bản osquery lớn hơn hoặc bằng chuỗi phiên bản này
- blacklist: một giá trị boolean để xác định xem truy vấn này có thể nằm trong danh sách đen hay không, mặc định là true

Giá trị của platform có thể là một trong các giá trị sau đây:
- darwin: chỉ định MacOS
- freebsd: chỉ định FreeBSD
- linux: chỉ định mọi Os dựa trên RedHat hoặc Debian
- posixcho: chỉ định darwin, freebsd và linux
- windows chỉ định bất kỳ Windows desktop hoặc Windows server
- any hoặc all cho tất cả



## Packs
Packs (gói) cho phép ta đóng gói các truy vấn lại và có thể áp dụng cho từng nền tảng cụ thể, giúp ta dễ dàng hơn trong việc quản lý các truy vấn. Trong mỗi gói ta sẽ xác định tên gói và các thành phần cấu hình riêng cho mỗi gói, sau đây là các thành phần cấu hình trong một gói:
- Queries: xác định các truy vấn trong gói
- Version: chỉ chạy trên các phiên bản osquery lớn hơn hoặc bằng chuỗi phiên bản này
- Platform: giới hạn truy vấn này đối với một nền tảng nhất định, mặc định nó cho phép chạy trên tất cả các nền tảng; ta có thể sử dụng dấu phẩy để đặt nhiều nền tảng.
- Discovery: xác định các truy vấn khám phá, truy vấn khám phá là các truy vấn được thực hiện trước các truy vấn chính và nếu tất cả các truy vấn khám phá trả về kết quả thì các truy vấn trong gói sẽ được thực hiện và ngược lại.

Ngoài ra ta còn có thể xác định một gói bằng cách chỉ định đường dẫn tới file json chứa các cấu hình cho một gói. Dưới đây là một ví dụ về khai báo một gói trong osquery:

```
{
    "packs": {
        "pack_name_1": "/path/to/pack.json",
        "pack_name_2": {
            "queries": {},
            "shard": 10,
            "version": "1.7.0",
            "platform": "linux",
            "discovery": [
                "SELECT * FROM processes WHERE name = 'osqueryi';"
            ]
        }
    }
}
```



## Decorators
Từ phiên bản osquery 1.7.3 trở đi ta có thêm một thành phần nữa trong file cấu hình gọi là “decorators”, decorators nhằm khai báo các truy vấn như những truy vấn thông thường nhưng kết quả của nó không được ghi riêng lẻ mà sẽ được thêm vào kết quả của mỗi truy vấn thông thường. Có ba loại truy vấn decorators, dưới đây là ví dụ về cách khai báo một decorators:

```
{
    "decorators": {
        "load": [
            "SELECT version FROM osquery_info;",
            "SELECT uuid AS host_uuid FROM system_info;"
        ],
        "always": [
            "SELECT user AS username FROM logged_in_users WHERE user <> '' ORDER BY time LIMIT 1;"
        ],
        "interval": {
            "3600": [
                "SELECT total_seconds AS uptime FROM uptime;"
            ]
        }
    }
}
```

Như trong ví dụ trên ta có ba thành phần khác nhau trong decorators:
- load: các truy vấn ở đây sẽ được tải khi cấu hình được tải hoặc khi restart
- always: Các truy vấn trong này sẽ được chạy trước mỗi truy vấn shedule
- interval: Các truy vấn này sẽ được thực hiện và thêm kết quả vào các truy vấn được lập lịch cứ sau mỗi 3600 giây



## File Path
Khóa file_paths để xác định các file và thư mục nhằm theo dõi sự toàn vẹn (FIM), dưới đây là ví dụ về file_paths:

```
{
    "file_paths": {
        "custom_category": [
            "/etc/**",
            "/tmp/.*"
        ],
        "device_nodes": [
            "/dev/*"
        ]
    }
}
```