# Osquery Remote Settings


Osquery cho phép sử dụng các file cấu hình từ xa và đẩy kết quả truy vấn đến một máy chủ từ xa qua `tls`. Nó hoạt động bằng cách đọc các file cấu hình từ một điểm cuối `https://`, điểm cuối này có nhiệm vụ cung cung cấp các file cấu hình và nhận lại kết quả từ các truy vấn, để quản lý và phân biệt các endpoint điểm cuối này cần có các chức năng xác thực (authentication) và định danh (identification) hay được gọi là `enrollment`.

## Remote authentication (Xác thực từ xa)
Sự khác biện quan trọng nhất giữa sử dụng remote setting so với sử dụng plugin `filesystem` là bước xác thực (authentication) và đăng ký (enrollment). Các máy chạy osqueryd tại các endpoint được gọi là các `node` và các node này cần đăng ký với máy chủ từ xa để có thể truy xuất các cấu hình do máy chủ cung cấp cung như gửi các kết quả truy vấn (logs) đến máy chủ từ xa, mỗi yêu cầu (request) tới máy chủ từ xa đều phải được xác thực bởi máy chủ từ xa thông qua một chuỗi định danh duy nhất được gọi `node_key`

Có 2 cách để đăng ký (enrollment) một node:
- Simple shared secret enrollment
- TLS client-auth enrollment


## Remote server API
...