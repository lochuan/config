键盘映射:
Alt_L -> Meta_L
Meta_L -> Alt_L

/etc/udev/hwdb.d/
cat /proc/bus/input/devices | less -> 查看键盘设备码
sudo showkeys -s 查看scancode
/usr/include/linux/input-event-codes.h -> 查看keycode


锁屏模糊:
修改/usr/bin/blurlock


自动根据外接显示器类型进行工作区映射:
/etc/X11/xinit/xinitrc.d/verify_ext_type.sh


Dmenu中需要以来terminal的应用:
更改/usr/bin/terminal

