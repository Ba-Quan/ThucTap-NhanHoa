# MYSQL DATA TYPES



<img src="http://www.mysqltutorial.org/wp-content/uploads/0211/03/MySQL-Data-Types.jpg">

Một bảng cơ sở dữ liệu chứa nhiều cột với các kiểu dữ liệu cụ thể như số hoặc chuỗi. MySQL cung cấp nhiều loại dữ liệu khác ngoài số hoặc chuỗi. Mỗi loại dữ liệu trong MySQL có thể được xác định bởi các đặc điểm sau:

- Các loại giá trị mà nó đại diện.
- Không gian chiếm và cho dù các giá trị là chiều dài cố định hoặc chiều dài thay đổi.
- Các giá trị của kiểu dữ liệu có thể được lập chỉ mục hoặc không.
- Làm thế nào MySQL so sánh các giá trị của một loại dữ liệu cụ thể.

## Kiểu dữ liệu số trong MySQL

|Numeric|Types	Description|
|-------|------------------|
|TINYINT|Số nguyên rất nhỏ|
|SMALLINT|Số nguyên nhỏ|
|MEDIUMINT|Số nguyên trung bình|
|INT|Số nguyên tiêu chuẩn|
|BIGINT|Số nguyên lớn|
|DECIMAL|Điểm cố định|
|FLOAT|Số dấu phẩy động|
|DOUBLE|Số dấu phẩy động kép|
|BIT|Chứa Bit|

## Kiểu dữ liệu Boolean trong MySQL
MySQL không có kiểu dữ liệu `BOOLEAN`. Để biểu diễn các giá trị `Boolean`, MySQL sử dụng loại số nguyên nhỏ nhất `TINYINT`


## Kiểu dữ liệu chuỗi trong MySQL
|String Types|Description|
|------------|-----------|
|CHAR|Ký tự|
|VARCHAR|Một chuỗi không có độ dài thay đổi|
|BINARY|Chuỗi nhị phân có độ dài cố định|
|VARBINARY|Chuỗi nhị phân có độ dài thay đổi|
|TINYBLOB|Một BLOB rất nhỏ (đối tượng lớn nhị phân)|
|BLOB|Một BLOB nhỏ|
|MEDIUMBLOB|Một BLOB cỡ trung|
|LONGBLOB|Một BLOB lớn|
|TINYTEXT|Một chuỗi không nhị phân rất nhỏ|
|TEXT|Một chuỗi không nhị phân nhỏ|
|MEDIUMTEXT|Một chuỗi không nhị phân cỡ trung bình|
|LONGTEXT|Một chuỗi không nhị phân lớn|
|ENUM|Một bảng liệt kê; mỗi giá trị cột có thể được chỉ định một thành viên liệt kê|
|SET|Mỗi giá trị cột có thể được chỉ định bằng 0 hoặc nhiều SET|

## Kiểu dữ liệu ngày và giờ trong MySQL
|Date and Time Types|Description|
|-------------------|-----------|
DATE|Một giá trị ngày ở định dạng CCYY-MM-DD|
TIME|Giá trị thời gian ở định dạng hh:mm:ss|
DATETIME|Giá trị ngày và giờ ở định dạng CCYY-MM-DD hh:mm:ss|
TIMESTAMP|Giá trị dấu thời gian ở định dạng CCYY-MM-DD hh:mm:ss|
YEAR|Giá trị năm theo định dạng CCYY hoặc YY|

## Kiểu dữ liệu không gian trong MySQL
MySQL hỗ trợ nhiều loại dữ liệu không gian chứa các loại giá trị hình học và địa lý khác nhau như trong bảng sau:

|Spatial Data Types|Description|
|------------------|-----------|
|GEOMETRY|Một giá trị không gian của bất kỳ loại nào|
|POINT|Một điểm (một cặp tọa độ XY)|
|LINESTRING|Đường cong (một hoặc nhiều POINT giá trị)|
|POLYGON|Một đa giác|
|GEOMETRYCOLLECTION|Tập hợp các giá trị GEOMETRY|
|MULTILINESTRING|Tập hợp các giá trị LINESTRING|
|MULTIPOINT|Tập hợp các giá trị POINT|
|MULTIPOLYGON|Tập hợp các giá trị POLYGON|

## Kiểu dữ liệu Json trong MySQL
MySQL hỗ trợ kiểu dữ liệu `JSON` gốc kể từ phiên bản 5.7.8 cho phép bạn lưu trữ và quản lý các tài liệu `JSON` hiệu quả hơn. Kiểu dữ liệu `JSON` gốc cung cấp xác thực tự động các tài liệu `JSON` và định dạng lưu trữ tối ưu.










## INT
Dưới đây là danh dách các kiểu số nguyên và độ lớn của nó:

<img src="https://i.imgur.com/1uy9C2P.png">

### SỬ dụng kiểu INT cho một cột
Khi ta tạo bảng ta sẽ xác định kiểu dữ liệu cho các cột trong bảng ví du như dưới đây:

```SQL
CREATE TABLE items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_text VARCHAR(255)
);
```

Ta có thể sử dụng `INT` hoặc `INTEGER` trong khi tạo bảng.



### Sử dụng kiểu INT UNSIGNED
`UNSIGNED` xác định kiểu số nguyên không dấú, sau đây là ví dụ tạo bảng với kiểu `INT UNSIGNED`:

```SQL
CREATE TABLE classes (
    class_id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    total_member INT UNSIGNED,
    PRIMARY KEY (class_id)
);
```

Sau đó khi ta chèn dữ liệu vào bảng phải là các số dương cho cột `total_member`, nếu ta truyền các số âm sẽ xảy ra lỗi.



### INT với độ rộng xác định
MySQL hỗ trợ ta xác định chiều rộng của `INT`, để xác định chiều rộng ta chỉ cần điền giá trị vào dấu ngoặc sau từ khóa INT, ví dụ: INT(5)


Ngoài ra MySQL còn hỗ trợ `ZEROFILL`, khi ta xác định kiểu INT với độ rộng xác định và dữ liệu không bằng độ rộng đó nó sẽ từ thêm các số 0 vào.

Ví dụ như sau:

<img src="https://i.imgur.com/V9vul2J.png">





## DECIMAL
Kiểu `DECIMAL` là kiểu dữ liệu số thực, ta thường hay sử dụng để lưu trữ các dữ liệu chính xác ví dụ như tiền trong hệ thống kế toán, để xác định kiể `DECIMAL` ta sử dụng cú pháp sau:

```SQL
column_name  DECIMAL(P,D);
```

Trong đó:
- `P` là là độ chính xác đại diện cho số chữ số phần nguyên. Phạm vi của P là 1 đến 65.
- `D` là là thang đo đại diện cho số chữ số sau dấu thập phân. Phạm vi của D là 0 và 30. MySQL yêu cầu D nhỏ hơn hoặc bằng (<=) P.

Ví dụ về tạo bảng xác định cột có kiểu `DECIMAL`:

```SQL
CREATE TABLE materials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255),
    cost DECIMAL(19 , 4 ) NOT NULL
);
```

Các `BIT` cho phép bạn lưu trữ các giá trị bit. Đây là cú pháp:

```SQL
BIT(n)
```

`BIT(n)` Có thể lưu trữ giá trị n-bit. n có thể giao động từ 1-64.

Ví dụ về tạo bảng với kiểu `BIT`:

```SQL
CREATE TABLE working_calendars(
    y INT
    w INT,
    days BIT(7),
    PRIMARY KEY(y,w)
);
```



## CHAR
Kiểu dữ liệu `CHAR` để lưu trữ các ký tự và nó co độ dài xác định, sau đây là ví dụ về kiểu `CHAR` khi ta tạo bảng:

```SQL
CREATE TABLE mysql_char_test (
    status CHAR(3)
);
```

Như trong ví dụ trên 3 là độ dài được xác định cho cột, độ dài của `CHAR` có thể xác định trong khoảng từ 0-255.



## VARCHAR
Đây là kiểu dữ liệu tương tự như `CHAR`, tuy nhiên nó có độ lớn hơn rất nhiều so với `CHAR`, kiểu dữ liệu này có độ lớn lên tới 65.535. để xác định kiểu dữ liệu này ta sử dụng cú pháp sau:

```SQL
column_name VARCHAR(n)
```

Với `n` là độ lớn xác định.

Ví dụ về tạo bảng với kiểu dữ liệu `VARCHAR`:

```SQL
CREATE TABLE IF NOT EXISTS varchar_test (
    s1 VARCHAR(32765) NOT NULL,
    s2 VARCHAR(32766) NOT NULL
)  CHARACTER SET 'latin1' COLLATE LATIN1_DANISH_CI;
```



## TEXT
Ngoài `CHAR` và `VARCHAR` MySQL còn hỗ trợ một kiểu dữ liệu là `TEXT` để lưu trữ các giá trị chuỗi, không giống như `CHAR` và `VARCHAR`, `TEXT` có thể lưu các giá trị rất lớn từ 1 byte đến 4GB, ta thường thấy kiểu dữ liệu này sử dụng để lưu trữ các bài viết hay thông tin về sản phẩm trên các trang web.

MySQL cung cấp bốn loại `TEXT`: `TINYTEXT`, `TEXT`, `MEDIUMTEXT`, và `LONGTEXT`.


### TINYTEXT – 255 Bytes (255 characters)
Ví dụ:

```SQL
CREATE TABLE articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    summary TINYTEXT
);
```

### TEXT – 64KB (65,535 characters)
Ví dụ:

```SQL
ALTER TABLE articles 
ADD COLUMN body TEXT NOT NULL
AFTER summary;
```

### MEDIUMTEXT – 16MB (16,777,215 characters)
Ví dụ:

```SQL
CREATE TABLE whitepapers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    body MEDIUMTEXT NOT NULL,
    published_on DATE NOT NULL
); 
```

### LONGTEXT – 4GB (4,294,967,295 characters)
`LONGTEXT` là kiểu dữ liệu cực lớn, nó có thể lưu trữ dữ liệu lên tới 4GB



## DATE
MySQL lưu trữ năm của giá trị ngày bằng bốn chữ số. Trong trường hợp bạn sử dụng các giá trị năm có hai chữ số, MySQL vẫn chấp nhận chúng với các quy tắc sau:

- Giá trị năm trong phạm vi 00-69 được chuyển đổi thành 2000 - 2069.
- Giá trị năm trong phạm vi 70-99 được chuyển đổi thành 1970 - 1999.

Ví dụ tạo bảng với kiểu dữ liệu `DATE`:

```SQL
CREATE TABLE people (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL
);
```

Sau đó ta chèn dữ liệu vào bảng như sau:

```SQL
INSERT INTO people(first_name,last_name,birth_date)
VALUES('John','Doe','1990-09-01');
```

Ngoài ra ta có thể sử dụng năm có 2 chữ số đề chèn dữ liệu vào bảng như sau:

```SQL
INSERT INTO people(first_name,last_name,birth_date)
VALUES('Jack','Daniel','01-09-01'),
      ('Lily','Bush','80-09-01');
```


### Hàm DATE

Để lấy ngày giờ hiện tại ta sử dụng như sau:

```SQL
SELECT NOW();
```

Kết quả:

```SQL
+---------------------+
| NOW()               |
+---------------------+
| 2019-12-03 09:31:59 |
+---------------------+
1 row in set (0.02 sec)
```

Để lấy nguyên ngày:

```SQL
SELECT DATE(NOW());
```

Kết quả:

```SQL
+-------------+
| DATE(NOW()) |
+-------------+
| 2019-12-03  |
+-------------+
1 row in set (0.01 sec)
```

Để lấy ngày giờ hệ thống tại thời điểm hiện tại ta sử dụng:

```SQL
SELECT CURDATE();
```

```SQL
+------------+
| CURDATE()  |
+------------+
| 2019-12-03 |
+------------+
1 row in set (0.02 sec)
```

Để định dạng một giá trị ngày, bạn sử dụng `DATE_FORMAT`. Câu lệnh sau định dạng ngày như mm/dd/yyyy sử dụng mẫu định dạng ngày `%m/%d/%Y`:

```SQL
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y') today;
```

```SQL
+------------+
| today      |
+------------+
| 07/13/2015 |
+------------+
1 row in set (0.02 sec)
```



## TIME
MySQL sử dụng `'HH:MM:SS'`định dạng để truy vấn và hiển thị giá trị thời gian biểu thị thời gian trong ngày, trong vòng 24 giờ.

Để xác định một cột `TIME` ta sử dụng cú pháp dưới đây:

```SQL
column_name TIME;
```

Ví dụ tạo bảng với cột `TIME`:

```SQL
CREATE TABLE tests (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    start_at TIME,
    end_at TIME
);
```

sau đó ta có thể `INSERT` dữ liệu vào bảng như sau:

```SQL
INSERT INTO tests(name,start_at,end_at)
VALUES('Test 1', '08:00:00','10:00:00');
```



## DATETIME
Ta sử dụng MySQL `DATETIME` để lưu trữ một giá trị chứa cả ngày và thời gian. Khi ta truy vấn dữ liệu từ một cột `DATETIME`, MySQL sẽ hiển thị `DATETIME` giá trị theo định dạng sau:

```SQL
YYYY-MM-DD HH:MM:SS
```

Theo mặc định, `DATETIME` giá trị dao động từ `1000-01-01 00:00:00` đến `9999-12-31 23:59:59`.

Ví dụ sau đây là cách tạo bảng với cột có kiểu dữ liệu `DATETIME`:

```SQL
CREATE TABLE timestamp_n_datetime (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ts TIMESTAMP,
    dt DATETIME
);
```



## TIMESTAMP
MySQL `TIMESTAMP` là một kiểu dữ liệu tạm thời chứa sự kết hợp giữa ngày và thời gian. Các định dạng của một `TIMESTAMP` là `YYYY-MM-DD HH:MM:SS` được cố định ở mức 19 ký tự.

Các `TIMESTAMP` giá trị có tầm từ `1970-01-01 00:00:01` UTC đến `2038-01-19 03:14:07` UTC.

Khi bạn chèn một `TIMESTAMP` giá trị vào bảng, MySQL sẽ chuyển đổi nó từ múi giờ kết nối của bạn thành UTC để lưu trữ.

Khi bạn truy vấn một `TIMESTAMP` giá trị, MySQL sẽ chuyển đổi giá trị UTC trở lại múi giờ của kết nối của bạn. Lưu ý rằng chuyển đổi này không diễn ra đối với các loại dữ liệu tạm thời khác, chẳng hạn như `DATETIME`.

Sau đây là ví dụ về sử dụng `TIMESTAMP`:

```SQL
CREATE TABLE test_timestamp (
    t1  TIMESTAMP
);
```

Và ta có thể chèn các giá trị vào như sau:

```SQL
INSERT INTO test_timestamp(t1)
VALUES('2008-01-01 00:00:01');
```

### MySQL DatETIME so với TIMESTAMP
MySQL cung cấp một kiểu dữ liệu tạm thời khác tương tự như `DATETIME` được gọi `TIMESTAMP`.

Yêu `TIMESTAMP` cầu 4 byte trong khi `DATETIME` yêu cầu 5 byte. Cả hai `TIMESTAMP` và `DATETIME` yêu cầu thêm byte cho độ chính xác giây.

`TIMESTAMP` giá trị dao động từ `1970-01-01 00:00:01` UTC đến `2038-01-19 03:14:07` UTC. Nếu bạn muốn lưu trữ các giá trị tạm thời vượt quá 2038, bạn nên sử dụng `DATETIME` thay vì `TIMESTAMP`.

`TIMESTAMP` lưu trữ giá trị UTC. Tuy nhiên `DATETIME` giá trị như không có múi giờ.



## JSON
MySQL hỗ trợ kiểu dữ liệu `JSON` gốc kể từ phiên bản 5.7.8. Kiểu dữ liệu `JSON` gốc cho phép bạn lưu trữ các tài liệu `JSON` hiệu quả hơn định dạng văn bản `JSON` trong các phiên bản trước.

Việc lưu trữ tài liệu `JSON` gần giống như việc lưu trữ `LONGBLOB` hoặc `LONGTEXT` dữ liệu.

Để xác định một cột có kiểu dữ liệu là `JSON`, bạn sử dụng cú pháp sau:

```SQL
CREATE TABLE table_name (
    ...
    json_column_name JSON,
    ... 
);
```

Ví dụ:

```SQL
CREATE TABLE events( 
  id int auto_increment primary key, 
  event_name varchar(255), 
  visitor varchar(255), 
  properties json, 
  browser json
);
```



## ENUM
Trong MySQL, một `ENUM` là đối tượng chuỗi có giá trị được chọn từ danh sách các giá trị được phép được xác định tại thời điểm tạo cột.

Kiểu dữ liệu `ENUM` cung cấp các lợi thế sau:

- Lưu trữ dữ liệu nhỏ gọn. MySQL `ENUM` sử dụng các chỉ mục số (1, 2, 3) để biểu thị các giá trị chuỗi.
- Truy vấn và đầu ra có thể đọc được.

Để xác định một `ENUM` cột, bạn sử dụng cú pháp sau:

```SQL
CREATE TABLE table_name (
    ...
    col ENUM ('value1','value2','value3'),
    ...
);
```

Sau đó để chèn giá trị vào cột ta làm như sau:

```SQL
INSERT INTO tickets(title, priority)
VALUES('Scan virus for computer A', 'High');
```

### Nhược điểm của MySQL ENUM
MySQL ENUMcó những nhược điểm sau:
- Thay đổi giá trị liệt kê yêu cầu xây dựng lại toàn bộ bảng bằng cách sử dụng `ALTER TABLE`, rất tốn kém về tài nguyên và thời gian.
- Lấy danh sách liệt kê đầy đủ là phức tạp vì bạn cần truy cập information_schemacơ sở dữ liệu:
- Việc chuyển sang `RDBMS` khác có thể là một vấn đề vì `ENUM` không phải là tiêu chuẩn SQL và không có nhiều hệ thống cơ sở dữ liệu hỗ trợ nó.
- Thêm nhiều thuộc tính vào danh sách liệt kê là không thể.