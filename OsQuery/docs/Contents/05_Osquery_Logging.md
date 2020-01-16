# Osquery Logging
Theo mặc định trình nền `osqueryd` sử dụng plugin logger là `filesystem` và đầu ra của plugin logger `filesystem` được ghi vào file theo định dang `json` tại đường dẫn `/var/log/osquery/`

Có hai loại logs trong Osquery:
- `Status logs`: Ghi các thông tin trạng thái của osqueryd (`INFO`, `WARNING`, `ERROR`).
- `Results logs`: Ghi kết quả của các truy vấn lên lịch, results logs bao gồm 2 file:
    - `osqueryd.results.log`: Ghi kết quả của các truy vấn được lên lịch thông thường theo mặc định (`Differential logs`)
    - `osqueryd.snapshots.log`: Ghi kết quả của các truy vấn được lên lịch có tùy chọn đầu ra dạng ảnh chụp (`Snapshot logs
`).



## Plugin logger
Osquery hỗ trợ nhiều plugin logger khác nhau như:
- `filesystem`: Mặc định trên tất cả các nền tảng
- `tls`, `syslog`: Cho POSIX
- `windows_event_log`: Cho Windows
- `kinesis`, `firehose` và `kafka_producer`: Đẩy log sang các hệ thống khác.

Ta có thể sử dụng nhiều plugin logger đồng thời cho nhiều giao diện. Để bật nhiều plugin logger ta sử dụng `--logger_plugin` với một danh sách và được phân tách nhau bởi dấu phẩy (`,`) không bao gồm khoảng trắng.


## Status logs
Status logs được tạo bởi [Glog logging framework](https://github.com/google/glog/). Theo mặc định plugin logger `filesystem` sẽ ghi những log này vào đĩa giống như `Glog`. Các plugin logger cũng có thể chặn các status log này và ghi chúng vào hệ thống hoặc làm gì khác với nó.

`osqueryd.INFO` là một liên kết tượng trưng đến INFO log của lần thực hiện gần đây nhất. Điều này cũng tương tự đối với các bản ghi `WARNING`, `ERROR` và `FATAL`.

**Chú ý:** `osqueryi` chỉ hiển thị `WARNING` và `ERROR` của nhật ký trạng thái, `INFO` nhật ký được im lặng để có trải nghiệm giống như vỏ tốt hơn.

Theo mặc định, `osqueryd` daemon gửi các bản ghi `INFO`, `WARNING` và `ERROR` để các plugin logger cấu hình và của quá trình `stderr`. Ta có thể định cấu hình hành vi này bằng cách sử dụng một số cờ được ghi trong các [Cờ CLI](https://osquery.readthedocs.io/en/latest/installation/cli-flags/):
- Để vô hiệu hóa status log để sử dụng `stderr`: `--logger_stderr=false`
- Để đặt mức độ nghiêm trọng (`severity`) của nhật ký trạng thái (INFO=0) được ghi thành `stderr` sử dụng: `--logger_min_stderr=0`
- Để đặt nhật ký trạng thái tối thiểu được ghi vào các trình cắm stderr và logger, hãy sử dụng: `--logger_min_status=0`



**Lưu ý:** Trong `LaunchDaemon`, `systemd` và `initscript` được cung cấp trong các gói osquery, báo cáo ``stderr`` tối thiểu được giới hạn `WARNING` để giúp thu nhỏ nội dung được sao chép vào syslog.


## Results logs
### Differential logs
Kết quả của các truy vấn theo lịch trình được ghi vào `osqueryd.results.log`. Đây là những thay đổi khác biệt giữa kết quả thực hiện truy vấn cuối cùng (most recent) và kết quả thực hiện hiện tại. Mỗi dòng nhật ký là một chuỗi `JSON` cho biết dữ liệu nào đã được thêm/xóa (added/removed) sau mỗi lần thực hiện truy vấn. Lần đầu tiên truy vấn được thực hiện (không có lần chạy "cuối cùng" - there is no "last" run), lần chạy cuối cùng được coi là có kết quả `null`, do đó differential logs bao gồm  entirely added được thêm vào. Có hai tùy chọn định dạng, đơn (single) hoặc sự kiện (event) và theo đợt (batched).

**Chú ý:** Đôí với truy vấn mà kết quả không có sự thay đổi thì sẽ không được ghi log. Nó chỉ ghi khi ta sử dụng `snapshot`.

Một số trường hợp các truy vấn không đáng để ghi log ví dụ như sau:

```SQL
SELECT i.*, p.resident_size, p.user_time, p.system_time, t.minutes AS c
FROM osquery_info i, processes p, time t
WHERE p.pid = i.pid;
```
Trong truy vấn trên có sử dụng join bảng time sử dụng `time.minutes` và thời gian thì luôn thay đổi vì vậy kết quả sẽ luôn luôn có 2 dòng với các hành động là `added` và `removed`. Mục đích là để tạo ra các kết quả liên tục cho phép theo dõi chính xác dòng dữ liệu thay đổi, tuy nhiên trong trường hợp này nó sẽ không hoạt động tốt. Đối với trường hợp này ta sử dụng tùy chon `"removed": false`:

```JSON
{
  "schedule": {
    "osquery_monitor": {
      "query": "SELECT ... t.minutes AS c FROM time t WHERE ...",
      "interval": 60,
      "removed": false
    }
  }
}
```



### Snapshot logs
Snapshot logs là một hình thức thay thế của ghi nhật ký kết quả truy vấn. Snapshot là tập hợp kết quả chính xác của mỗi lần thực hiện truy vấn, nếu ta muốn có một danh sách các kết quả chính xác sau mỗi truy vấn ta sẽ sử dụng snapshot, ngược lại nếu ta muốn có các kết quả thể hiện được dòng thay đổi ta sẽ sử dụng differential.

Các truy vấn snapshot có thể tạo ra một lượng kết quả rất lớn. Để đảm bảo an toàn, không bị rối và dễ dàng sử lý file nhật ký, kết quả của các truy vấn snapshot được ghi vào một file riêng biệt nằm tại `/var/log/osquery/osqueryd.snapshots.log`

Dưới đây là một ví dụ về lên lịch truy vấn snapshot:

```JSON
{
  "schedule": {
    "mounts": {
      "query": "SELECT * FROM mounts;",
      "interval": 3600,
      "snapshot": true
    }
  }
}
```




## Logging as a Kafka producer.
...
## Schedule results (types)
...
## Special top-level fields
...