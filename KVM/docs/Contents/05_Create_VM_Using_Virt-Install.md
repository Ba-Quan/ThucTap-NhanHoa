# Create VM Using Virt-Install
Dưới đây là các bước để tạo VM trong KVM sử dụng virt-install



## SSH vào máy chủ KVM
Để ssh vào máy chủ KVM ta thực hiện lệnh với cú pháp sau:

```
$ ssh user@kvm-ip
```



## Tạo VM mới
Để tạo một VM với virt-install ta sử dụng lênh sau:

```
$ sudo virt-install \
--name Ubuntu_18.04.3 \
--ram 512 \
--disk path=/var/lib/libvirt/images/Ubuntu_18.04.3.qcow2,size=10 \
--vcpus 1 \
--os-type linux \
--os-variant generic \
--network bridge=virbr0 \
--graphics none \
--console pty,target_type=serial \
--location 'http://archive.ubuntu.com/ubuntu/dists/bionic/main/installer-amd64/' \
--extra-args 'console=ttyS0,115200n8 serial'
```

Trong đó:
- `--name`: Chỉ định tên VM sẽ được tạo
- `--ram`: Chỉ định dung lượng RAM cho VM
- `--disk`: Xác định các thông tin về đĩa, `path` xác định vị trí đĩa, `size` xác định dung lượng đĩa.
- `--vcpus`: Chỉ định số lượng CPU cho VM
- `--os-type`: Chỉ định loại OS
- `--os-variant`: Chỉ định loại GuestOS, Ta có thể nhận được một danh sách bằng lệnh `osinfo-query os`
- `--network`: Chỉ định loại network cho VM
- `--graphics`: Chỉ định giao diện đồ họa cho VM. nếu được đặt `none`, nó có nghĩa là nographics
- `--console`: Chỉ định loại bảng điều khiển
- `--location`: Chỉ định vị trí sẽ được sử dụng để cài đặt OS
- `--extra-args`: Chỉ định các tham số của kernel

Ngoài ra còn rất nhiều các tùy chọn khác với virt-install, ta có thể sử dụng lệnh `virt-install -h` để xem thêm.

**Chú ý:** Đối với cài đặt từ file iso ta phải sử dụng `--cdrom` để chỉ định file iso hoặc đĩa để cài đặt và với tùy chọn này ta không thể sự dụng với `--extra-args`.

Ví dụ:

```
$ sudo virt-install \
--name Ubuntu_18.04.3 \
--ram 512 \
--disk path=/var/lib/libvirt/images/Ubuntu_18.04.3.qcow2,size=10 \
--vcpus 1 \
--os-type linux \
--os-variant generic \
--network bridge=virbr0 \
--graphics none \
--console pty,target_type=serial \
--cdrom '/var/lib/libvirt/images/ubuntu-18.04.3-live-server-amd64.iso'
```




# Tài liệu tham khảo
- [access.redhat.com](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-guest_virtual_machine_installation_overview-creating_guests_with_virt_install)
- [raymii.org](https://raymii.org/s/articles/virt-install_introduction_and_copy_paste_distro_install_commands.html)

# Missing
...