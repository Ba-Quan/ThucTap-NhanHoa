# MANAGING MYSQL DATABASES AND TABLES



## Lựa chọn databses
Để lựa chọn một database cụ thể để làm việc ta sử dụng lệnh `USE` với cấu trúc như sau:

```SQL
USE database_name;
```

trong đó theo sau `USE` là tên cơ sở dữ liệu mà ta muốn làm việc.

### Chọn cơ sở dữ liệu MySQL thông qua dòng lệnh
Sau đây trình bày cách đăng nhập vào MySQL và lữa chọn cơ sở dữ liệu để làm việc:

đầu tiên ta đăng nhập vào MySQL bằng một người dùng cụ thể ví dụ như `root`:

```bash
mysql -u root -p
```

Trong đó:
- `-u` chỉ định tên người dùng mà ta muốn đăng nhập ngay sau đó
- `-p` là cần thiết nếu người dùng này có mật khẩu

Sau đó nếu được nhắc nhập mật khẩu ta cần nhập mật khẩu để đăng nhập

Tiếp theo ta lữa chọn cơ sở dữ liệu để làm việc, ví dụ ta sử dụng `classicmodels` như sau:

```SQL
mysql> use classicmodels;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> 
```

Ta có thể lấy tên của cơ sở dữ liệu hiện được kết nối bằng cách sử dụng lệnh sau:

```SQL
mysql> select database();
+---------------+
| database()    |
+---------------+
| classicmodels |
+---------------+
1 row in set (0.00 sec)

mysql> 
```


### Chọn cơ sỡ dữ liệu khi ta đăng nhập
Nếu ta biết cơ sở dữ liệu nào ta muốn làm việc trước khi đăng nhập, ta có thể sử dụng cờ -D để chỉ định cơ sở dữ liệu như sau:

```SQL
mysql -u root -D classicmodels -p
```

```SQL
$ mysql -u root -p -D classicmodels
Enter password: 
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.0.18 MySQL Community Server - GPL

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> select database();
+---------------+
| database()    |
+---------------+
| classicmodels |
+---------------+
1 row in set (0.00 sec)

mysql> 
```



## Tạo cơ sở dữ liệu
Trước khi làm bất cứ điều gì khác với dữ liệu, ta cần tạo một cơ sở dữ liệu. Một cơ sở dữ liệu là một thùng chứa dữ liệu. Nó lưu trữ danh bạ, nhà cung cấp, khách hàng hoặc bất kỳ loại dữ liệu nào bạn có thể nghĩ đến.

Trong MySQL, cơ sở dữ liệu là tập hợp các đối tượng được sử dụng để lưu trữ và thao tác dữ liệu như bảng.

Để tạo cơ sở dữ liệu trong MySQL, ta sử dụng câu lệnh `CREATE DATABASE` như sau:

```SQL
CREATE DATABASE [IF NOT EXISTS] database_name;
```

Hãy xem xét `CREATE DATABASE` chi tiết hơn:

- Ngay sau `CREATE DATABASE` là tên cơ sở dữ liệu mà bạn muốn tạo. Tên cơ sở dữ liệu nên có ý nghĩa và mô tả càng tốt.
- `IF NOT EXISTS` là một mệnh đề tùy chọn của lệnh. Các `IF NOT EXISTS` điều khoản ngăn cản một lỗi của việc tạo ra một cơ sở dữ liệu mới mà đã tồn tại trong cơ sở dữ liệu máy chủ. Bạn không thể có 2 cơ sở dữ liệu có cùng tên trong máy chủ cơ sở dữ liệu MySQL.

Ví dụ: để tạo cơ sở dữ liệu `classicmodels`, bạn có thể thực hiện câu lệnh `CREATE DATABASE` như sau:

```SQL
CREATE DATABASE classicmodels;
```

Sau khi thực hiện lệnh này, MySQL trả về một thông báo như sau:

<img src="https://i.imgur.com/yrOhmMD.png">



## Hiển thị cơ sở dữ liệu

Lệnh `SHOW DATABASES` liệt kê tất cả các cơ sở dữ liệu trong database server, Bạn có thể sử dụng câu lệnh `SHOW DATABASES` để kiểm tra cơ sở dữ liệu mà bạn đã tạo hoặc để xem tất cả các cơ sở dữ liệu trên máy chủ cơ sở dữ liệu trước khi bạn tạo cơ sở dữ liệu mới, ví dụ:

```SQL
SHOW DATABASES;
```

Kết quả:

<img src="https://i.imgur.com/kJam6zD.png">



## Xóa cơ sở dữ liệu
Để xóa cơ sở dữ liệu ta sử dụng lệnh `DROP DATABASE` với cú pháp như sau:

```SQL
DROP DATABASE [IF EXISTS] database_name;
```

Trong đó:
- Theo sau `DROP DATABASE` là tên cơ sở dữ liệu mà ta muốn xóa
- `IF NOT EXISTS` nhằm ngăn chặn bạn xóa một cơ sở dữ liệu không có trong cơ sở dữ liệu vì nó sẽ gây ra thông báo lỗi.

Để thực hành với việc xóa cơ sở dữ liệu ta có thể tạo một cơ sở dữ liệu và xóa chúng đi như sau:

```SQL
CREATE DATABASE IF NOT EXISTS tempdb;
SHOW DATABASES;
DROP DATABASE IF EXISTS temp_database;
```

Kết quả sẽ như sau:

```
mysql> CREATE DATABASE IF NOT EXISTS tempdb;
Query OK, 1 row affected (0.01 sec)

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| classicmodels      |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| tempdb             |
+--------------------+
6 rows in set (0.00 sec)

mysql> DROP DATABASE IF EXISTS temp_database;
Query OK, 0 rows affected, 1 warning (0.02 sec)

mysql> 
```

Trình tự của ba câu lệnh như sau:

- Đầu tiên, chúng tôi tạo ra một cơ sở dữ liệu có tên `tempdb` bằng cách sử dụng `CREATE DATABASE` câu lệnh.
- Thứ hai, chúng tôi đã hiển thị tất cả các cơ sở dữ liệu bằng cách sử dụng câu lệnh `SHOW DATABASES`.
- Thứ ba, chúng tôi loại bỏ việc `tempdb` sử dụng `DROP DATABASE`.




## MySQL Storage engines
Trong phần này, bạn sẽ tìm hiểu các loại công cụ lưu trữ MySQL hoặc các loại bảng khác nhau. Điều cần thiết là phải hiểu các tính năng của từng công cụ lưu trữ trong MySQL để bạn có thể sử dụng chúng một cách hiệu quả để tối đa hóa hiệu suất của cơ sở dữ liệu của bạn.

MySQL cung cấp các công cụ lưu trữ khác nhau cho các bảng của nó như sau:

- MyISAM
- InnoDB
- MERGE
- MEMORY (HEAP)
- ARCHIVE
- CSV
- FEDERATED

Mỗi công cụ lưu trữ có ưu điểm và nhược điểm riêng. Điều cốt yếu là phải hiểu từng tính năng của công cụ lưu trữ và chọn một tính năng phù hợp nhất cho các bảng của bạn để tối đa hóa hiệu suất của cơ sở dữ liệu. Trong các phần sau, chúng tôi sẽ thảo luận về từng công cụ lưu trữ và các tính năng của nó để bạn có thể quyết định sử dụng công cụ nào.



### MyISAM
`MyISAM` mở rộng công cụ lưu trữ `ISAM` trước đây. Các bảng `MyISAM` được tối ưu hóa cho nén và tốc độ. Các bảng `MyISAM` cũng có thể di động giữa các nền tảng và hệ điều hành.

Kích thước của bảng `MyISAM` có thể lên tới 256TB, rất lớn. Ngoài ra, các bảng `MyISAM` có thể được nén thành các bảng chỉ đọc để tiết kiệm không gian. Khi khởi động, MySQL kiểm tra các bảng MyISAM xem có bị hỏng không và thậm chí sửa chữa chúng trong trường hợp có lỗi.

Trước MySQL phiên bản 5.5, `MyISAM` là công cụ lưu trữ mặc định khi bạn tạo bảng mà không chỉ định rõ ràng công cụ lưu trữ. Từ phiên bản 5.5, MySQL sử dụng `InnoDB` làm công cụ lưu trữ mặc định.



### InnoDB
Các bảng `InnoDB` hỗ trợ đầy đủ các giao dịch và tuân thủ ACID . Họ cũng là tối ưu cho hiệu suất. Bảng InnoDB hỗ trợ các khóa ngoại, cam kết, khôi phục, thao tác cuộn tiến. Kích thước của bảng `InnoDB` có thể lên tới 64TB.

Giống như `MyISAM`, các bảng `InnoDB` có thể di động giữa các nền tảng và hệ điều hành khác nhau. MySQL cũng kiểm tra và sửa chữa các bảng `InnoDB`, nếu cần, khi khởi động.



### MERGE
Bảng `MERGE` là một bảng ảo kết hợp nhiều bảng `MyISAM` có cấu trúc tương tự như một bảng. Công cụ lưu trữ `MERGE` còn được gọi là `MRG_MyISAM` công cụ. Các `MERGE` bảng không có index riêng của mình; thay vào đó, nó sử dụng các chỉ mục của các bảng thành phần.

Sử dụng bảng `MERGE`, bạn có thể tăng tốc hiệu suất khi  tham gia nhiều bảng . MySQL chỉ cho phép bạn thực hiện các thao tác `SELECT` , `DELETE` , `UPDATE` và `INSERT` trên các bảng MERGE. Nếu bạn sử dụng câu lệnh `DROP TABLE` trên một bảng `MERGE`, chỉ có `MERGE` đặc điểm kỹ thuật được loại bỏ. Các bảng bên dưới sẽ không bị ảnh hưởng.



### MEMORY
Các bảng `MEMORY` được lưu trữ trong bộ nhớ và sử dụng các chỉ mục băm để chúng nhanh hơn các bảng `MyISAM`. Tuổi thọ của dữ liệu của các bảng bộ nhớ phụ thuộc vào thời gian hoạt động của máy chủ cơ sở dữ liệu. Công cụ lưu trữ bộ nhớ trước đây được gọi là `HEAP`.



### ARCHIVE
Công cụ lưu trữ `ARCHIVE` cho phép bạn lưu trữ một số lượng lớn các bản ghi, nhằm mục đích lưu trữ, thành một định dạng nén để tiết kiệm dung lượng đĩa. Công cụ lưu trữ `ARCHIVE` nén một bản ghi khi nó được chèn và giải nén nó bằng thư viện zlib khi nó được đọc.

Các bảng lưu trữ chỉ cho phép các câu lệnh `INSERT` và `SELECT` . Các bảng `ARCHIVE` không hỗ trợ lập chỉ mục, do đó cần phải quét toàn bộ bảng để đọc các hàng.



### CSV
Công cụ lưu trữ CSV lưu trữ dữ liệu ở định dạng tệp giá trị được phân tách bằng dấu phẩy (CSV). Bảng CSV mang đến một cách thuận tiện để di chuyển dữ liệu vào các ứng dụng không phải là SQL như phần mềm bảng tính.

Bảng CSV không hỗ trợ kiểu dữ liệu `NULL`. Ngoài ra, thao tác đọc yêu cầu quét toàn bộ bảng.



### FEDERATED
Công cụ `FEDERATED` lưu trữ cho phép bạn quản lý dữ liệu từ máy chủ MySQL từ xa mà không cần sử dụng công nghệ sao chép hoặc cụm. Bảng liên kết cục bộ không lưu trữ dữ liệu. Khi bạn truy vấn dữ liệu từ một bảng được liên kết cục bộ, dữ liệu sẽ được kéo tự động từ các bảng được liên kết từ xa.



## MySQL Sequence
Trong MySQL, một sequence là danh sách các số nguyên được tạo theo thứ tự tăng dần, tức là 1,2,3, Nhiều ứng dụng cần các chuỗi để tạo số duy nhất chủ yếu để nhận dạng.

Để từ động tạo một chuỗi trong MySQL ta đặt `AOTU_INCREMENT` thuộc tính trong một cột, thường là cột khóa chính.

Các quy tắc sau được áp dụng khi bạn sử dụng `AUTO_INCREMENT` thuộc tính:

- Mỗi bảng chỉ có một cột `AUTO_INCREMENT` có kiểu dữ liệu thường là số nguyên .
- Các cột `AUTO_INCREMENT` phải được lập chỉ mục, có nghĩa là nó có thể là một trong hai `PRIMARY KEY` hoặc `UNIQUE` chỉ mục.
- Các cột `AUTO_INCREMENT` phải có một  `NOT NULL`. Khi bạn đặt  `AUTO_INCREMENT` thuộc tính thành một cột, MySQL sẽ tự động thêm `NOT NULL` ràng buộc vào cột.

Dưới đây là ví dụ tạo bảng với thuộc tính `AUTO_INCREMENT`:

```SQL
CREATE TABLE employees (
    emp_no INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
```


Các cột `AUTO_INCREMENT` có các thuộc tính sau:

- Giá trị bắt đầu của một `AUTO_INCREMENT` cột là 1 và nó tăng thêm 1 khi bạn chèn một  `NULL` giá trị vào cột hoặc khi bạn bỏ qua giá trị của nó trong câu lệnh `INSERT`.
- Để có được số thứ tự được tạo cuối cùng, bạn sử dụng hàm `LAST_INSERT_ID()`. Chúng tôi thường sử dụng ID chèn cuối cùng cho các câu lệnh tiếp theo, ví dụ: chèn dữ liệu vào các bảng. Chuỗi được tạo cuối cùng là duy nhất trong các phiên. Nói cách khác, nếu một kết nối khác tạo ra một số thứ tự, từ kết nối của bạn, bạn có thể có được nó bằng cách sử dụng `LAST_INSERT_ID()`.
- Nếu bạn chèn một hàng mới vào một bảng và chỉ định một giá trị cho cột chuỗi, MySQL sẽ chèn số thứ tự nếu số thứ tự không tồn tại trong cột hoặc gây ra lỗi nếu nó đã tồn tại. Nếu bạn chèn một giá trị mới lớn hơn số thứ tự tiếp theo, MySQL sẽ sử dụng giá trị mới làm số thứ tự bắt đầu và tạo số thứ tự duy nhất lớn hơn số thứ tự hiện tại cho lần sử dụng tiếp theo. Điều này tạo ra những khoảng trống trong chuỗi.
- Nếu bạn sử dụng câu lệnh `UPDATE` để cập nhật giá trị trong cột `AUTO_INCREMENT` thành giá trị đã tồn tại, MySQL sẽ phát sinh lỗi khóa trùng lặp nếu cột có chỉ mục duy nhất. Nếu bạn cập nhật một `AUTO_INCREMENT` cột thành một giá trị lớn hơn các giá trị hiện có trong cột, MySQL sẽ sử dụng số tiếp theo của số thứ tự chèn cuối cùng cho hàng tiếp theo. Ví dụ: nếu số thứ tự chèn cuối cùng là 3, bạn cập nhật nó thành 10, số thứ tự cho hàng mới là 4.
- Nếu bạn sử dụng `DELETE` câu lệnh để xóa hàng được chèn cuối cùng, MySQL có thể hoặc không thể sử dụng lại số thứ tự đã xóa tùy thuộc vào công cụ lưu trữ của bảng. Bảng `MyISAM` không sử dụng lại các số thứ tự đã xóa nếu bạn xóa một hàng, ví dụ: id chèn cuối cùng trong bảng là 10, nếu bạn xóa nó, MySQL vẫn tạo số thứ tự tiếp theo là 11 cho hàng mới. Tương tự như các bảng MyISAM, các bảng InnoDB không sử dụng lại số thứ tự khi các hàng bị xóa.



Khi bạn đặt  thuộc tính `AUTO_INCREMENT` cho một cột, bạn có thể đặt lại giá trị tăng tự động theo nhiều cách khác nhau, ví dụ: bằng cách sử dụng câu lệnh `ALTER TABLE`.

Chúng ta hãy xem một số ví dụ để hiểu rõ hơn về trình tự MySQL.

Đầu tiên, chèn hai hàng mới vào employees bảng:

```SQL
INSERT INTO employees(first_name,last_name)
VALUES('John','Doe'),
      ('Mary','Jane');
```

Tiếp theo, `SELECT` dữ liệu từ `employees`:

```SQL
SELECT * FROM employees;
```

Kết quả:

<img src="https://i.imgur.com/J03Pi3i.png">

Tiếp theo ta xóa nhân viên thứ hai có `emp_no` bằng 2:

```SQL
DELETE FROM employees 
WHERE
    emp_no = 2;
```

Kết quả select sẽ như sau:

<img src="https://i.imgur.com/syTBq6A.png">

Tiếp theo ta chèn một nhận viến mới:

```SQL
INSERT INTO employees(first_name,last_name)
VALUES('Jack','Lee');
```

<img src="https://i.imgur.com/2mP31Tp.png">

Vì công cụ lưu trữ của bảng `employees` là InnoDB, nên nó không sử dụng lại số thứ tự đã xóa. Hàng mới có emp_no  3.

Thứ năm, cập nhật một nhân viên hiện có với `emp_no` 3 thành 1:

```SQL
UPDATE employees 
SET 
    first_name = 'Joe',
    emp_no = 1
WHERE
    emp_no = 3;
```

MySQL sẽ trả lại thông báo lỗi trung lặp cho khóa chính:

<img src="https://i.imgur.com/scHpFvL.png">

```SQL
UPDATE employees 
SET 
    first_name = 'Joe',
    emp_no = 10
WHERE
    emp_no = 3;
```

Thứ sáu chèn một nhân viên mới sau khi đã cập nhật số thứ tự thành 10:

```SQL
INSERT INTO employees(first_name,last_name)
VALUES('Wang','Lee');
```

<img src="https://i.imgur.com/LkraozE.png">

Số thứ tự tiếp theo của lần chèn cuối cùng là số 4, do đó, MySQL sử dụng số 4 cho hàng mới thay vì 11.


## ALTER TABLE
Trong phần này, bạn sẽ tìm hiểu cách sử dụng câu lệnh `ALTER TABLE` để thêm một cột, thay đổi một cột, đổi tên một cột, xóa một cột và đổi tên một bảng.


### Thiết lập bảng mẫu
Hãy tạo một bảng có tên vehicles để thực hành:

```SQL
CREATE TABLE vehicles (
    vehicleId INT,
    year INT NOT NULL,
    make VARCHAR(100) NOT NULL,
    PRIMARY KEY(vehicleId)
);
```


### MySQL ALTER TABLE - Thêm cột vào bảng

#### Thêm một cột vào bảng
Để thêm một cột vào bảng, bạn sử dụng ALTER TABLE ADD cú pháp:
```SQL
ALTER TABLE table_name
ADD 
    new_column_name column_definition
    [FIRST | AFTER column_name]
```

Trong cú pháp này:
- `table_name` - chỉ định tên của bảng mà bạn muốn thêm một cột hoặc cột mới sau các `ALTER TABLE` từ khóa.
- `new_column_name` - chỉ định tên của cột mới.
- `column_definition` - chỉ định kiểu dữ liệu, kích thước tối đa và ràng buộc cột của cột mới
- `FIRST | AFTER column_name` chỉ định vị trí của cột mới trong bảng. Bạn có thể thêm một cột sau một cột hiện có ( `ATER column_name`) hoặc làm cột đầu tiên ( FIRST). Nếu bạn bỏ qua mệnh đề này, cột sẽ được thêm vào cuối danh sách cột của bảng.

Ví dụ sau sử dụng câu lệnh `ALTER TABLE ADD` để thêm một cột ở cuối vehicles:
```SQL
ALTER TABLE vehicles
ADD model VARCHAR(100) NOT NULL;
```

Câu lệnh này hiển thị danh sách cột của `vehicles`:

```SQL
DESCRIBE vehicles;
```

<img src="https://i.imgur.com/JDAYjYt.png">


### MySQL ALTER TABLE - Đổi tên một cột trong bảng
Để đổi tên một cột, bạn sử dụng câu lệnh sau:

```SQL
ALTER TABLE table_name
    CHANGE COLUMN original_name new_name column_definition
    [FIRST | AFTER column_name];
```

Trong cú pháp này:

- Đầu tiên, chỉ định tên của bảng mà cột thuộc về.
- Thứ hai, chỉ định tên cột và tên mới theo sau là định nghĩa cột sau các `CHANGE COLUMN` từ khóa.
Thứ ba, sử dụng `FIRST` hoặc `AFTER` `column_name` tùy chọn để xác định vị trí mới của cột.

Ví dụ sau sử dụng `ALTER TABLE CHANGE COLUMN` câu lệnh để đổi tên cột note thành vehicleCondition:

```SQL
ALTER TABLE vehicles 
CHANGE COLUMN model vehicleCondition VARCHAR(100) NOT NULL;
```

Hãy xem lại danh sách cột của vehicles:

```SQL
DESCRIBE vehicles;
```

<img src="https://i.imgur.com/BYhOYhy.png">



### MySQL ALTER TABLE - DROP một cột
Để xóa một cột trong bảng, bạn sử dụng `ALTER TABLE DROP COLUMNc` âu lệnh:

```SQL
ALTER TABLE table_name
DROP COLUMN column_name;
```

Trong cú pháp này:

- Đầu tiên, chỉ định tên của bảng mà bạn muốn thả một cột sau từ khóa `ALTER TABLE`.
- Thứ hai, chỉ định tên của cột mà bạn muốn thả sau các `DROP COLUMN` từ khóa.

Ví dụ này cho thấy cách loại bỏ cột `vehicleCondition` khỏi `vehicles`:

```SQL
ALTER TABLE vehicles
DROP COLUMN vehicleCondition;
```
### MySQL ALTER TABLE- Đổi tên bảng

Để đổi tên bảng, bạn sử dụng câu lệnh `ALTER TABLE RENAME TO`:

```SQL
ALTER TABLE table_name
RENAME TO new_table_name;
```

Trong cú pháp này:

- Đầu tiên, chỉ định tên của bảng mà bạn muốn đổi tên sau từ khóa `ALTER TABLE`.
- Thứ hai, chỉ định tên mới cho bảng sau từ khóa `RENAME TO`.

Ví dụ này đổi tên bảng `vehicles` thành `cars`:

```SQL
ALTER TABLE vehicles 
RENAME TO cars; 
```

## Temporary table
Trong MySQL, một bảng tạm thời là một loại bảng đặc biệt cho phép bạn lưu trữ một tập kết quả tạm thời, bạn có thể sử dụng lại nhiều lần trong một phiên duy nhất.

Một bảng tạm thời rất tiện dụng khi không thể hoặc tốn kém để truy vấn dữ liệu yêu cầu một `SELECT` câu lệnh với các JOIN` mệnh đề. Trong trường hợp này, bạn có thể sử dụng bảng tạm thời để lưu trữ kết quả ngay lập tức và sử dụng truy vấn khác để xử lý nó.

Bảng tạm thời của MySQL có các tính năng sau:

- Một bảng tạm thời được tạo bằng cách sử dụng câu lệnh `CREATE TEMPORARY TABLE`.
- MySQL tự động xóa bảng tạm thời khi phiên kết thúc hoặc kết nối bị chấm dứt. Tất nhiên, bạn có thể sử dụng câu lệnh `DROP TABLE` để xóa một bảng tạm thời một cách rõ ràng khi bạn không còn sử dụng nó.
- Một bảng tạm thời chỉ có sẵn và có thể truy cập được cho khách hàng tạo ra nó. Các máy khách khác nhau có thể tạo các bảng tạm thời có cùng tên mà không gây ra lỗi vì chỉ có máy khách tạo bảng tạm thời mới có thể nhìn thấy nó. Tuy nhiên, trong cùng một phiên, hai bảng tạm thời không thể chia sẻ cùng một tên.
- Một bảng tạm thời có thể có cùng tên với một bảng bình thường trong cơ sở dữ liệu.

Để tạo một bảng tạm thời ta sử dụng câu lệnh `CREATE TEMPORARY TABLET` cú pháp như sau:

```SQL
CREATE TEMPORARY TABLE table_name(
   column_1_definition,
   column_2_definition,
   ...,
   table_constraints
);
```

### Ví dụ tạo một bảng tạm thời:
Đầu tiên, tạo một bảng tạm thời mới được gọi là `credits` lưu trữ tín dụng của khách hàng:

```SQL
CREATE TEMPORARY TABLE credits(
    customerNumber INT PRIMARY KEY,
    creditLimit DEC(10,2)
);
```

Sau đó, chèn các hàng từ bảng `customers` vào bảng tạm thời `credits`:

```SQL
INSERT INTO credits(customerNumber,creditLimit)
SELECT customerNumber, creditLimit
FROM customers
WHERE creditLimit > 0;
```

Cuối cùng ta `SELECT` từ bảng tạm thời vừa tạo ra kết quả như sau:

<img src="https://i.imgur.com/yA0qTbO.png">



### Xóa bỏ một bảng tạm thời
Để xóa bỏ một bảng tạm thời ta sử dụng cú pháp sau:

```SQL
DROP TEMPORARY TABLE table_name;
```


## TRUNCATE TABLE
Trong phần này, bạn sẽ tìm hiểu cách sử dụng câu lệnh `TRUNCATE TABLE` MySQL để xóa tất cả dữ liệu trong một bảng.

Một cách logic, các `TRUNCATE TABLE` giống như `DELETE` không có một `WHERE` điều kiện. Tuy nhiên, câu lệnh `TRUNCATE TABLE` hiệu quả hơn `DELETE` câu lệnh vì nó xóa và tạo lại bảng thay vì xóa từng hàng một.

Đây là cú pháp cơ bản của TRUNCATE TABLEcâu lệnh:

```SQL
TRUNCATE [TABLE] table_name;
```

Trong cú pháp này, bạn chỉ định tên của bảng mà bạn muốn xóa tất cả dữ liệu sau từ khóa `TRUNCATE TABLE`.

Từ khóa `TABLE` là tùy chọn. Tuy nhiên, nên sử dụng `TABLE` từ khóa để phân biệt giữa `TRUNCATE TABLE` câu lệnh và hàm `TRUNCATE()`.

Nếu có bất kỳ `FOREIGN KEY` ràng buộc nào từ các bảng khác tham chiếu bảng mà bạn xóa, câu lệnh sẽ thất bại.

Do một thao tác cắt ngắn gây ra một cam kết ngầm, do đó, nó không thể được khôi phục.

`TRUNCATE TABLE` lệnh đặt lại giá trị trong cột `AUTO_INCREMENT` thành giá trị bắt đầu của nó nếu bảng có một cột `AUTO_INCREMENT`.


### Ví dụ về TRUNCATE TABLE
Hãy lấy một ví dụ về việc sử dụng câu lệnh `TRUNCATE TABLE`.

Đầu tiên, tạo một bảng mới có tên bo`oks để demo;

```SQL
CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL
)  ENGINE=INNODB;
```

Tiếp theo, chèn dữ liệu giả vào `books` bảng bằng cách sử dụng quy trình được lưu trữ sau đây :

```SQL
DELIMITER $$
CREATE PROCEDURE load_book_data(IN num INT(4))
BEGIN
    DECLARE counter INT(4) DEFAULT 0;
    DECLARE book_title VARCHAR(255) DEFAULT '';
 
    WHILE counter < num DO
      SET book_title = CONCAT('Book title #',counter);
      SET counter = counter + 1;
 
      INSERT INTO books(title)
      VALUES(book_title);
    END WHILE;
END$$
 
DELIMITER;
```

Sau đó, tải 10.000 hàng vào `books` bảng. Nó sẽ tốn một chút thời gian.

```SQL
CALL load_book_data(10000);
```

Sau đó, kiểm tra dữ liệu trong bảng `books`:

```SQL
SELECT * FROM books;
```

Cuối cùng, sử dụng câu lệnh `TRUNCATE TABLE` để xóa tất cả các hàng khỏi bảng `books`:

```SQL
TRUNCATE TABLE books;
```

Cuối cùng ta có thể  kiểm tra bằng lệnh sau:

```SQL
SELECT * FROM books;
```


## MySQL Generated Columns
Khi bạn tạo một bảng mới, bạn chỉ định các cột bảng bằng câu lệnh`CREATE TABLE`. Sau đó, bạn sử dụng `INSERT`, `UPDATE` và `DELETE` để thay đổi trực tiếp các dữ liệu trong các cột trong bảng.

MySQL 5.7 đã giới thiệu một tính năng mới gọi là `generated column`. Các cột được tạo vì dữ liệu trong các cột này được tính dựa trên các biểu thức được xác định trước.

Ví dụ: bạn có `contacts` cấu trúc sau:

```SQL
DROP TABLE IF EXISTS contacts;
 
CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);
```

Để có được tên đầy đủ của một liên hệ, bạn sử dụng hàm `CONCAT()` như sau:

```SQL
SELECT 
    id, 
    CONCAT(first_name, ' ', last_name), 
    email
FROM
    contacts;
```

Đây không phải là truy vấn đẹp nhất.

Bằng cách sử dụng MySQL `generated column`, bạn có thể tạo lại contacts bảng như sau:

```SQL
DROP TABLE IF EXISTS contacts;
 
CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    fullname varchar(101) GENERATED ALWAYS AS (CONCAT(first_name,' ',last_name)),
    email VARCHAR(100) NOT NULL
);
```

`GENERATED ALWAYS as (expression)` là cú pháp để tạo một `generated column`

Để kiểm tra fullname bạn chèn một hàng vào contacts như sau:

```SQL
INSERT INTO contacts(first_name,last_name, email)
VALUES('john','doe','john.doe@mysqltutorial.org');
```

Bây giờ, bạn có thể truy vấn dữ liệu từ `contacts`.

```SQL
SELECT 
    *
FROM
    contacts;
```

### Cú pháp `generated column`
Cú pháp để xác định `generated column` như sau:

```SQL
column_name data_type [GENERATED ALWAYS] AS (expression)
   [VIRTUAL | STORED] [UNIQUE [KEY]]
```

Đầu tiên, chỉ định tên cột và kiểu dữ liệu của nó.

Tiếp theo, thêm `GENERATED ALWAYS` mệnh đề để chỉ ra rằng cột là cột được tạo.

Sau đó, cho biết loại cột được tạo bằng cách sử dụng tùy chọn tương ứng: `VIRTUAL` hoặc `STORED`. Theo mặc định, MySQL sử dụng `VIRTUAL` nếu bạn không chỉ định rõ ràng loại cột được tạo.

Sau đó, chỉ định biểu thức trong dấu ngoặc nhọn sau từ khóa `AS`. Biểu thức có thể chứa các chữ, các hàm dựng sẵn không có tham số, toán tử hoặc tham chiếu đến bất kỳ cột nào trong cùng một bảng. Nếu  bạn sử dụng một hàm, nó phải là vô hướng và xác định.

Cuối cùng, nếu cột được tạo được lưu trữ, bạn có thể xác định một ràng buộc duy nhất cho nó.