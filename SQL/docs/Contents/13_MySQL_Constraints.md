# MYSQL CONSTRAINTS



## NOT NULL Constraint
`NOT NULL` dàng buộc là một hạn chế cột để đảm bảo giá trị được lưu trữ trong một cột không `NULL`.

Cú pháp xác định một NOT NULLràng buộc như sau:

```SQL
column_name data_type NOT NULL;
```

Ví dụ về tạo bảng với ràng buộc `NOT NULL`:

```SQL
CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE
);
```


### Thêm `NOT NULL` và cột
Để sửa một cột tồn tại thành `NOT NULL` ta cần xác định chính xác cột đó không chứa các giá trị `NULL`, sau đây là ví dụ:

```SQL
ALTER TABLE tasks 
CHANGE 
    end_date 
    end_date DATE NOT NULL;
```



## Primary Key Constraint
Khóa chính là một cột hoặc một tập hợp các cột xác định duy nhất mỗi hàng trong bảng. Khóa chính tuân theo các quy tắc sau:

- Khóa chính phải chứa các giá trị duy nhất. Nếu khóa chính bao gồm nhiều cột, sự kết hợp các giá trị trong các cột này phải là duy nhất.
- Một cột khóa chính không thể có giá trị `NULL`. Mọi nỗ lực chèn hoặc cập nhật `NULL` vào các cột khóa chính sẽ dẫn đến lỗi. Lưu ý rằng MySQL ngầm thêm một `NOT NULL` ràng buộc cho các cột khóa chính.
- Một bảng có thể chỉ có một khóa chính.

Một cột khóa chính thường có thuộc tính `AUTO_INCREMENT` tự động tạo một số nguyên liên tiếp bất cứ khi nào bạn chèn một hàng mới vào bảng.
Khi bạn xác định khóa chính cho bảng, MySQL sẽ tự động tạo một chỉ mục được gọi PRIMARY.

Dưới đây là ví dụ về đặt một cột làm khóa chính khi ta tạo bảng:

```SQL
CREATE TABLE users(
   user_id INT AUTO_INCREMENT PRIMARY KEY,
   username VARCHAR(40),
   password VARCHAR(255),
   email VARCHAR(255)
);
```

Hoặc

```SQL
CREATE TABLE table_name(
    primary_key_column1 datatype,
    primary_key_column2 datatype,
    ...,
    PRIMARY KEY(column_list)
);
```

Nếu một bảng, vì một số lý do, không có khóa chính, bạn có thể sử dụng câu lệnh `ALTER TABLE` để thêm khóa chính vào bảng như sau:

```SQL
ALTER TABLE table_name
ADD PRIMARY KEY(column_list);
```



## FOREING KEY
Khóa ngoại là một cột hoặc nhóm cột trong bảng liên kết với một cột hoặc nhóm cột trong bảng khác. Khóa ngoại đặt các ràng buộc về dữ liệu trong các bảng liên quan, cho phép MySQL duy trì tính toàn vẹn tham chiếu.

Self-referencing foreign key: Đôi khi, các bảng con và cha mẹ có thể tham chiếu đến cùng một bảng. Trong trường hợp này, khóa ngoại tham chiếu lại khóa chính trong cùng một bảng.

Sau đây là cú pháp để xác định `FOREING KEY`:

```SQL
[CONSTRAINT constraint_name]
FOREIGN KEY [foreign_key_name] (column_name, ...)
REFERENCES parent_table(colunm_name,...)
[ON DELETE reference_option]
[ON UPDATE reference_option]
```

Trong cú pháp này:

- Đầu tiên, chỉ định tên của ràng buộc khóa ngoài mà bạn muốn tạo sau `CONSTRAINT`. Nếu bạn bỏ qua tên ràng buộc, MySQL sẽ tự động tạo tên cho ràng buộc khóa ngoài.

- Thứ hai, chỉ định danh sách các cột khóa ngoài được phân tách bằng dấu phẩy sau các `FOREIGN KEY` từ khóa. Tên khóa ngoại cũng là tùy chọn và được tạo tự động nếu bạn bỏ qua nó.

- Thứ ba, chỉ định bảng cha theo sau là danh sách các cột được phân tách bằng dấu phẩy mà tham chiếu các cột khóa ngoài.

Cuối cùng, xác định cách khóa ngoại duy trì tính toàn vẹn tham chiếu giữa các bảng con và bảng cha bằng cách sử dụng các mệnh đề `ON DELETE` và `ON UPDATE` mệnh đề. `reference_option` quyết định hành động mà MySQL sẽ thực hiện khi giá trị trong các phụ huynh cột chủ chốt sẽ bị xóa ( ON DELETE) hoặc cập nhật ( ON UPDATE).

MySQL có năm tùy chọn tài liệu tham khảo: `CASCADE`, `SET NULL`, `NO ACTION`, `RESTRICT`, và `SET DEFAULT`:

- `CASCADE`: nếu một hàng từ bảng cha bị xóa hoặc cập nhật, các giá trị của các hàng khớp trong bảng con sẽ tự động bị xóa hoặc cập nhật.
- `SET NULL`: nếu một hàng từ bảng cha bị xóa hoặc cập nhật, các giá trị của cột khóa ngoài (hoặc cột) trong bảng con được đặt thành NULL.
- `RESTRICT`: nếu một hàng từ bảng cha có một hàng khớp trong bảng con, MySQL sẽ từ chối xóa hoặc cập nhật các hàng trong bảng cha.
- `NO ACTION`: giống như `RESTRICT`.
- `SET DEFAULT`: được công nhận bởi trình phân tích cú pháp MySQL. Tuy nhiên, hành động này bị từ chối bởi cả hai bảng InnoDB và NDB.

Trong thực tế, MySQL hỗ trợ đầy đủ ba hành động: `RESTRICT`, `CASCADE` và `SET NULL`.

Nếu bạn không chỉ định mệnh đề `ON DELETE` và `ON UPDATE`, thì hành động mặc định là `RESTRICT`.

Sau đây là ví dụ về cách tạo khóa ngoài:

```SQL
CREATE TABLE categories(
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(100) NOT NULL
) ENGINE=INNODB;
 
CREATE TABLE products(
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName varchar(100) not null,
    categoryId INT,
    CONSTRAINT fk_category
    FOREIGN KEY (categoryId) 
        REFERENCES categories(categoryId)
) ENGINE=INNODB;
```



## Disable foreign key checks
Đôi khi, rất hữu ích để vô hiệu hóa kiểm tra khóa ngoại. Ví dụ: bạn có thể tải dữ liệu vào bảng cha và con theo bất kỳ thứ tự nào khi kiểm tra ràng buộc khóa ngoài bị vô hiệu hóa. Nếu bạn không tắt kiểm tra khóa ngoại, trước tiên bạn phải tải dữ liệu vào các bảng cha và sau đó là các bảng con theo trình tự.

Để tắt kiểm tra khóa ngoại ta sử dụng:

```SQL
SET foreign_key_checks = 0;
```

Và để bật lại kiểm tra khóa ngoại ta sử dụng:

```SQL
SET foreign_key_checks = 1;
```

Lưu ý: rằng cài đặt foreign_key_checks thành 1 không kích hoạt bất kỳ xác nhận dữ liệu bảng hiện có nào. Nói cách khác, MySQL sẽ không xác minh tính nhất quán của dữ liệu đã được thêm trong quá trình kiểm tra khóa ngoại bị vô hiệu hóa.



## UNIQUE
Đôi khi, bạn muốn đảm bảo các giá trị trong một cột hoặc một nhóm các cột là duy nhất. Ví dụ: địa chỉ email của người dùng trong bảng `users` hoặc số điện thoại của khách hàng trong bảng `customers` phải là duy nhất. Để thực thi quy tắc này, bạn sử dụng một `UNIQUE` ràng buộc.

Một `UNIQUE` dàng buộc đảm bảo giá trị trong một cột hoặc một nhóm cột là duy nhất. Một `UNIQUE` ràng buộc có thể là ràng buộc cột hoặc ràng buộc bảng.

Để xác định `UNIQUE` ràng buộc cho một cột khi bạn tạo bảng , bạn sử dụng cú pháp sau:

```SQL
CREATE TABLE table_name(
    ...,
    column_name data_type UNIQUE,
    ...
);
```

### Ví dụ về `UNIQUE` ràng buộc của MySQL:
Đầu tiên, tạo một bảng mới có tên `suppliers` với hai `UNIQUEr` àng buộc:

```SQL
CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (supplier_id),
    CONSTRAINT uc_name_address UNIQUE (name , address)
);
```

Trong ví dụ này, `UNIQUE` ràng buộc đầu tiên được xác định cho cột `phone`:
```SQL
phone VARCHAR(12) NOT NULL UNIQUE
```

Và ràng buộc thứ hai là cho tên `both` và  cột `address` :

```SQL
CONSTRAINT uc_name_address UNIQUE (name , address)
```

Thứ hai, chèn một hàng vào `suppliers` bảng.

```SQL
INSERT INTO suppliers(name, phone, address) 
VALUES( 'ABC Inc', 
       '(408)-908-2476',
       '4000 North 1st Street');
```

Thứ ba, cố gắng chèn một nhà cung cấp khác nhưng có số điện thoại đã tồn tại trong `suppliers` bảng.

```SQL
INSERT INTO suppliers(name, phone, address) 
VALUES( 'XYZ Corporation','(408)-908-2476','3000 North 1st Street');
```

Khi thực hiện MySQL đã trả về lỗi.

Thứ tư, thay đổi số điện thoại thành một số khác và thực hiện lại câu lệnh chèn.

```SQL
INSERT INTO suppliers(name, phone, address) 
VALUES( 'XYZ Corporation','(408)-908-3333','3000 North 1st Street');
```

Thứ năm, chèn một hàng vào bảng `suppliers` với các giá trị đã tồn tại trong các cột `name` và `address`:

```SQL
INSERT INTO suppliers(name, phone, address) 
VALUES( 'ABC Inc', 
       '(408)-908-1111',
       '4000 North 1st Street');
```

MySQL đã ban hành một lỗi vì các `UNIQUE` ràng buộc `uc_name_address` đã bị vi phạm.



## MySQL check constraint
Trước `MySQL 8.0.16`, `CREATE TABLE` cho phép ta bao gồm một ràng buộc `CHECK`. Tuy nhiên, `CHECK` ràng buộc chỉ được phân tích cú pháp và bỏ qua:

```SQL
CHECK(expression)
```

Kể từ `MySQL 8.0.16`, các `CREATE TABLE` tính năng thiết yếu được hỗ trợ của `CHECK` ràng buộc bảng và cột cho tất cả các công cụ lưu trữ .

Đây là cú pháp:

```SQL
[CONSTRAINT [constraint_name]] CHECK (expression) [[NOT] ENFORCED]
```

Trong cú pháp này:

Đầu tiên, chỉ định tên cho ràng buộc kiểm tra mà bạn muốn tạo. Nếu bạn bỏ qua tên ràng buộc, MySQL sẽ tự động tạo một tên theo quy ước sau:

```SQL
table_name_chk_n
```

Thứ hai, chỉ định Boolean `expression` phải ước tính `TRUE` hoặc `UNKNOWN` cho từng hàng của bảng. Nếu biểu thức ước lượng `FALSE`, các giá trị vi phạm ràng buộc hoặc vi phạm ràng buộc xảy ra.

Thứ ba, tùy chọn chỉ định điều khoản thi hành để cho biết liệu ràng buộc kiểm tra có được thi hành hay không:

Sử dụng `ENFORCED` hoặc chỉ bỏ qua `ENFORCED` mệnh đề để tạo và thực thi các ràng buộc.
Sử dụng `NOT ENFORCED` để tạo các ràng buộc nhưng không thực thi nó.
Như đã đề cập trước đó, bạn có thể chỉ định một ràng buộc `CHECK` là ràng buộc bảng hoặc ràng buộc cột.

Sau đây là ví dụ về dàng buộc `CHECK`:

```SQL
CREATE TABLE parts (
    part_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(40),
    cost DECIMAL(10,2 ) NOT NULL CHECK (cost >= 0),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0)
);
```

Ở đây ta sử dụng ràng buộc cho `cost` và `price`.