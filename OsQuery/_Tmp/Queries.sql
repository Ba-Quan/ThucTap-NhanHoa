/*
Ý tưởng xây dựng query:
- Xmrig (Một trương trình đào coin)
    + Truy vấn tiến trình sử dụng CPU, GPU cao
    + Truy vấn các process có tên `girmx` và có kết nối ra ngoài internet
    + Truy vấn có tồn tại chương trình có tên `girmx` trong `/tmp/.tmp/`


- Merlin Agent để kết nối tới c2 (c2 là Merlin Server từ xa):
    + Truy vấn các process có tên `linmer` và có kết nối ra ngoài internet (IP bootnet)
    + Truy vấn có tồn tại chương trình có tên `linmer` trong `/tmp/.tmp/`


- nc để tạo back connect: (Chương trình netcat giả mạo)
    + Truy vấn chương trình đang lắng nghe trên cổng lạ
    + Truy vấn có tồn tại chương trình có tên `cn` trong `/tmp/.tmp/`


- WRAP (bash shell chiếm mật khẩu người dùng (sudo) nhằm leo thang đặc quyền)
    + Truy vấn có tồn tại bash shell có tên `wrap` trong `/tmp/.tmp/`


- SSHKEY:
    + Truy vấn các khóa SSH có trên hệ thống


- ORTHER
    + Truy vấn các cronjob đang hoạt động có tồn tại job mà mã độc đã thêm?


- CÁC TRUY VẤN PHÁT HIỆN NHỮNG THAY ĐỔI QUAN TRỌNG TRÊN HỆ THỐNG
*/



/* XMRIG
*/
-- Truy vấn process có kết nối ra internet có tên girmx
SELECT processes.name, processes.path, processes.cmdline, processes.parent, process_open_sockets.remote_address, process_open_sockets.remote_port, etc_protocols.name AS protocol
FROM process_open_sockets
LEFT JOIN processes USING(pid)
JOIN etc_protocols ON process_open_sockets.protocol = etc_protocols.number
WHERE processes.name = 'girmx' AND process_open_sockets.remote_port != 0;

-- Truy vấn file có tên girmx trong thư mục ẩn /tmp/
SELECT * FROM file WHERE directory = '/tmp/.tmp/' AND filename = 'girmx';



/* MERLIN
*/
-- Truy vấn process có kết nối ra internet có tên linmer
SELECT processes.name, processes.path, processes.cmdline, processes.parent, process_open_sockets.remote_address, process_open_sockets.remote_port, etc_protocols.name AS protocol
FROM process_open_sockets
LEFT JOIN processes USING(pid)
JOIN etc_protocols ON process_open_sockets.protocol = etc_protocols.number
WHERE processes.name = 'linmer' AND process_open_sockets.remote_port != 0;

-- Truy vấn file có tên linmer trong thư mục ẩn /tmp/
SELECT * FROM file WHERE directory = '/tmp/.tmp/' AND filename = 'linmer';



/* NC (netcat)
*/
-- Truy vấn process có mở kết nối socket và có tên cn
SELECT processes.name, processes.pid, processes.path, processes.cmdline, processes.parent, process_open_sockets.remote_address, process_open_sockets.remote_port
FROM process_open_sockets
LEFT JOIN processes USING(pid)
WHERE processes.name = 'cn';

-- Truy vấn process đang lắng nghe trên port ? và có tên cn
-- DISTINCT -- Chú ý
SELECT processes.name, processes.pid, processes.path, processes.cmdline, processes.parent, listening_ports.port, etc_protocols.name, listening_ports.address
FROM listening_ports
LEFT JOIN processes USING(pid)
JOIN etc_protocols ON listening_ports.protocol = etc_protocols.number
WHERE processes.name = 'cn' AND listening_ports.port != 0;

-- Truy vấn file có tên cn trong thư mục ẩn /tmp/
SELECT * FROM file WHERE directory = '/tmp/.tmp/' AND filename = 'cn';



-- ESTABLISHED: Vì sau khi kết nối nc sẽ thoát khỏi chế độ lắng nghe và các lệnh được thực thi bây giờ là bash có cổng trùng với cổng nc đã lắng nghe.
SELECT * FROM process_open_sockets WHERE local_port = 1997



/* SSHKEY
*/
-- Truy vấn các khóa ủy quyền ssh (Ap dụng khi có một bộ lọc, kiểm tra điều kiện, cảnh báo hoặc action)
SELECT users.uid, users.gid, users.username, users.directory, users.shell, authorized_keys.algorithm, authorized_keys.key, authorized_keys.key_file
FROM users JOIN authorized_keys USING(uid);



/* WRAP
*/
-- Truy vấn tồn tại file có tên wrap
SELECT * FROM file WHERE directory = '/tmp/.tmp/' AND filename = 'wrap';



/* NUR
*/
-- Truy vấn tồn tại file có tên nur
SELECT * FROM file WHERE directory = '/tmp/.tmp/' AND filename = 'nur';



/* CRONTAB
*/
-- Truy vấn các job trong crontab có tồn tại các job của mã độc?
SELECT * FROM crontab WHERE command = 'pgrep Malw > /dev/null || /home/toor/_/Malw.sh';
SELECT * FROM crontab WHERE command = '/tmp/.tmp/nur';



/* DETECT FILE
*/
SELECT * FROM file WHERE directory = '/tmp/.tmp/' AND filename = 'girmx';
SELECT * FROM file WHERE directory = '/tmp/.tmp/' AND filename = 'linmer';
SELECT * FROM file WHERE directory = '/tmp/.tmp/' AND filename = 'cn';
SELECT * FROM file WHERE directory = '/tmp/.tmp/' AND filename = 'wrap';
SELECT * FROM file WHERE directory = '/tmp/.tmp/' AND filename = 'nur';



/* CÁC TRUY VẤN PHÁT HIỆN NHỮNG THAY ĐỔI QUAN TRỌNG TRÊN HỆ THỐNG
*/
SELECT * FROM users;
SELECT * FROM last;
SELECT * FROM yum_sources;
SELECT * FROM rpm_packages;
SELECT * FROM load_average;
SELECT * FROM memory_info;
SELECT * FROM process_open_sockets;