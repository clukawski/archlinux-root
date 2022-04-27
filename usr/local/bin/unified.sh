#!/bin/bash

objcopy  --add-section .osrel="/usr/lib/os-release" --change-section-vma .osrel=0x20000  --add-section .cmdline="/etc/kernel/cmdline" --change-section-vma .cmdline=0x30000  --add-section .splash="/usr/share/systemd/bootctl/splash-arch.bmp" --change-section-vma .splash=0x40000  --add-section .linux="/boot/vmlinuz-linux" --change-section-vma .linux=0x2000000  --add-section .initrd="/boot/initramfs-linux.img" --change-section-vma .initrd=3000000  "/usr/lib/systemd/boot/efi/linuxx64.efi.stub" "/boot/EFI/linux.efi"
sbctl sign -s /boot/EFI/linux.efi
