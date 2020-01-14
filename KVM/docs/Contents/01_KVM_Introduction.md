# KVM Introduction

## KVM là gì?
KVM (Kernel-based Virtual Machine) là một giải pháp ảo hóa toàn phần cho Linux trên phần cứng x86 có chứa các phần mở rộng ảo hóa (Intel VT hoặc AMD-V). Nó bao gồm một mô-đun hạt nhân có thể tải, kvm.ko, cung cấp cơ sở hạ tầng ảo hóa lõi (Core Virtualization) và một mô-đun cụ thể của bộ xử lý, kvm-intel.ko hoặc kvm-amd.ko.

KVM ra đời với phiên bản đầu tiên vào năm 2007 bởi công ty Qumranet tại Isarel, sau đó năm 2008 RedHat đã mua lại Qumranet và bắt đầu phát triển, phổ biến KVM Hypervisor.


KVM cho phép bạn biến Linux thành một trình ảo hóa cho phép máy chủ chạy nhiều môi trường ảo bị cô lập gọi là máy khách (guest) hoặc máy ảo (VM). Nghĩa là OS (hệ điều hành) chính mô phỏng phần cứng cho các OS khác để chạy trên đó.

Một số loại KVM được nhiều người sử dụng là CL1008M, CL1016M, CL1000M, CL5708M, CL5716M, .v.v.

Sử dụng KVM, ta có thể chạy nhiều máy ảo chạy các Linux image hoặc Windows chưa sửa đổi. Mỗi máy ảo có phần cứng ảo hóa riêng bảo gồm: card mạng (network card), đĩa (disk), bộ điều hợp đồ họa (graphics adapter), .v.v.


Về bản chất, KVM không thực sự là một hypervisor có chức năng giải lập phần cứng để chạy các máy ảo. Chính xác KVM chỉ là một module của kernel linux hỗ trợ cơ chế mapping các chỉ dẫn trên CPU ảo (của guest VM) sang chỉ dẫn trên CPU vật lý (của máy chủ chứa VM). Hoặc có thể hình dung KVM giống như một driver cho hypervisor để sử dụng được tính năng ảo hóa của các vi xử lý như Intel VT-x hay AMD-V, mục tiêu là tăng hiệu suất cho guest VM.

KVM hiện nay được thiết kế để giao tiếp với các hạt nhân thông qua một kernel module có thể nạp được. Hỗ trợ một loạt các hệ điều hành máy guest như: Linux, BSD, Solaris, Windows, Haiku, ReactOS và hệ điều hành nghiên cứu AROS. Sử dụng kết hợp với QEMU, KVM có thể chạy Mac OS X.

Trong kiến trúc của KVM, Virtual machine được thực hiện như là quy trình xử lý thông thường của Linux, được lập lịch hoạt động như các scheduler tiểu chuẩn của Linux. Trên thực tế, mỗi CPU ảo hoạt động như một tiến trình xử lý của Linux. Điều này cho phép KVM được hưởng lợi từ tất cả các tính năng của nhân Linux.



## Cách hoạt động của KVM
KVM chuyển đổi Linux thành một trình ảo hóa loại 1 (`Native` hay `bare-metal`). Tất cả các trình ảo hóa cần một số thành phần cấp hệ điều hành, chẳng hạn như trình quản lý bộ nhớ, bộ lập lịch xử lý, ngăn xếp đầu vào/đầu ra (I/O), trình điều khiển thiết bị, trình quản lý bảo mật, ngăn xếp mạng và nhiều hơn nữa để chạy VM. KVM có tất cả các thành phần này vì nó là một phần của nhân Linux. Mọi VM được triển khai như một quy trình Linux thông thường, được lên lịch bởi bộ lập lịch Linux tiêu chuẩn, với phần cứng ảo chuyên dụng như card mạng, bộ điều hợp đồ họa, CPU, bộ nhớ và đĩa.



## Tính năng của KVM
KVM là một phần của Linux. Linux là một phần của KVM. Mọi thứ Linux có, KVM cũng có. Nhưng có những tính năng cụ thể làm cho KVM trở thành một trình ảo hóa ưa thích của doanh nghiệp.

### Bảo mật (Security)
KVM sử dụng kết hợp Linux tăng cường bảo mật (Security-Enhanced Linux - SELinux) và ảo hóa bảo mật (SecureSELinux - sVirt) để tăng cường bảo mật và bảo mật VM. SELinux thiết lập ranh giới bảo mật xung quanh máy ảo. sVirt mở rộng khả năng của SELinux, cho phép bảo mật Kiểm soát truy cập bắt buộc (MAC) được áp dụng cho máy ảo khách và ngăn ngừa lỗi ghi nhãn thủ công.


### Lưu trữ (Storage)
KVM có thể sử dụng bất kỳ bộ lưu trữ nào được Linux hỗ trợ, bao gồm một số đĩa cục bộ và bộ lưu trữ gắn mạng (Network-Attached Storage - NAS). Đa input/output (I/O) có thể được sử dụng để cải thiện việc lưu trữ và cung cấp dự phòng. KVM cũng hỗ trợ các hệ thống tệp được chia sẻ để hình ảnh VM có thể được chia sẻ bởi nhiều máy chủ. Hình ảnh đĩa hỗ trợ cung cấp mỏng, phân bổ lưu trữ theo yêu cầu chứ không phải tất cả lên phía trước.



### Hỗ trợ phần cứng (Hardware support)
KVM có thể sử dụng nhiều nền tảng phần cứng được chứng nhận hỗ trợ Linux. Do các nhà cung cấp phần cứng thường xuyên đóng góp cho sự phát triển hạt nhân, các tính năng phần cứng mới nhất thường nhanh chóng được áp dụng trong nhân Linux.



### Quản lý bộ nhớ (Memory management)
KVM kế thừa các tính năng quản lý bộ nhớ của Linux, bao gồm truy cập bộ nhớ không đồng nhất và hợp nhất kernel cùng trang. Bộ nhớ của VM có thể được hoán đổi, được hỗ trợ bởi khối lượng lớn để có hiệu suất tốt hơn và được chia sẻ hoặc sao lưu bởi một tệp đĩa.



### Di chuyển trực tiếp (Live migration)
KVM hỗ trợ di chuyển trực tiếp, đó là khả năng di chuyển một VM đang chạy giữa các máy chủ vật lý mà không bị gián đoạn dịch vụ. VM vẫn được bật, các kết nối mạng vẫn hoạt động và các ứng dụng tiếp tục chạy trong khi VM được di chuyển. KVM cũng lưu trạng thái hiện tại của VM để có thể lưu trữ và tiếp tục lại sau này.



### Hiệu suất và khả năng mở rộng (Performance and scalability)
KVM kế thừa hiệu năng của Linux, mở rộng để phù hợp với tải nhu cầu nếu số lượng máy khách và yêu cầu tăng lên. KVM cho phép khối lượng công việc ứng dụng đòi hỏi khắt khe nhất được ảo hóa và là cơ sở cho nhiều thiết lập ảo hóa doanh nghiệp, chẳng hạn như trung tâm dữ liệu và đám mây riêng (thông qua OpenStack).



### Lập kế hoạch và kiểm soát tài nguyên (Scheduling and resource control)
Trong mô hình KVM, VM là một quy trình Linux, được lên lịch và quản lý bởi kernel. Bộ lập lịch Linux cho phép kiểm soát chi tiết các tài nguyên được phân bổ cho một quy trình Linux và đảm bảo chất lượng dịch vụ cho một quy trình cụ thể. Trong KVM, điều này bao gồm bộ lập lịch hoàn toàn công bằng, các nhóm kiểm soát, không gian tên mạng và tiện ích mở rộng thời gian thực.



### Độ trễ thấp hơn và mức độ ưu tiên cao hơn (Lower latency and higher prioritization)
Nhân Linux có các phần mở rộng thời gian thực cho phép các ứng dụng dựa trên VM chạy ở độ trễ thấp hơn với mức độ ưu tiên tốt hơn (so với kim loại trần). Hạt nhân cũng phân chia các quá trình đòi hỏi thời gian tính toán dài thành các thành phần nhỏ hơn, sau đó được lên lịch và xử lý tương ứng.