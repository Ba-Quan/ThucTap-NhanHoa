# Install KVM
Dưới đây là các bước để cài đặt KVM trên một số distro linux phổ biến:



## Install KVM on CentOS-7

### Kiểm tra hỗ trợ ảo hóa CPU?
KVM chỉ làm việc trên hệ thống mà CPU có hỗ trợ ảo hóa phần cứng mở rộng (Intel VT[-x] hoặc AMD-V). Để kiểm tra xem CPU có hỗ trợ tính năng ảo hóa mở rộng này hay không ta sử dụng một trong các lệnh sau:

```
$ grep -E '(svm|vmx)' /proc/cpuinfo
# OR
$ egrep '(svm|vmx)' /proc/cpuinfo
# OR
$ egrep -c '(svm|vmx)' /proc/cpuinfo
```

Nếu kết quả đầu ra có `vmx` hoặc `svm` nghĩa là có hỗ trợ ảo hóa và ngược lại. Đối với cấu lệnh cuối cùng nếu kết quả đầu ra là `1` là có hỗ trợ và `0` là không hỗ trợ.

Chú ý: Khi cài đặt KVM trên máy ảo như VMWare hay VirtualBox ta cần cấu hình máy ảo để hỗ trợ ảo hóa để có thể cài đặt KVM.

### Cài đặt KVM
Sau khi kiểm tra hỗ trợ ảo hóa ta tiến hành cài đặt KVM bằng lệnh sau:

``` 
$ sudo yum install -y qemu-kvm libvirt virt-install virt-manager bridge-utils
```

Trong đó:
- `qemu-kvm`: phần phụ trợ cho KVM
- `libvirt`: cung cấp các thư viện cần thiết để sử dụng KVM
- `virt-install`: tiện ích dòng lệnh để tạo VM
- `virt-manager`: cung cấp giao diện đồ họa để quản lí máy ảo
- `bridge-utils`: chứa một tiện ích cần thiết để tạo và quản lý các thiết bị bridge.


**Chú ý:** Đối với CentOS bản minimal để dùng được công cụ đồ họa virt-manager người dùng phải cài đặt gói x-window bằng câu lệnh sau:

```
$ sudo yum install -y '@X Window System' xorg-x11-xauth xorg-x11-fonts-* xorg-x11-utils
```
## Install KVM on CentOS-8
## Install KVM on Ubuntu-18.04