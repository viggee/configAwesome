#!/bin/python


import shutil
import os

src = "/home/viktor/"
dst = "/mnt/Storage/GitHub/configAwesome/home/"

files = []

# awesome
files.append(".config/awesome/rc.lua")
files.append(".config/awesome/themes/colored/theme.lua")
files.append(".config/awesome/themes/colored/floating.png")
files.append(".config/awesome/themes/colored/layouts/dwindle.png")
files.append(".config/awesome/themes/colored/layouts/fairh.png")
files.append(".config/awesome/themes/colored/layouts/fairv.png")
files.append(".config/awesome/themes/colored/layouts/floating.png")
files.append(".config/awesome/themes/colored/layouts/floating_a.png")
files.append(".config/awesome/themes/colored/layouts/fullscreen.png")
files.append(".config/awesome/themes/colored/layouts/magnifier.png")
files.append(".config/awesome/themes/colored/layouts/max.png")
files.append(".config/awesome/themes/colored/layouts/spiral.png")
files.append(".config/awesome/themes/colored/layouts/tile.png")
files.append(".config/awesome/themes/colored/layouts/tilebottom.png")
files.append(".config/awesome/themes/colored/layouts/tileleft.png")
files.append(".config/awesome/themes/colored/layouts/tiletop.png")
files.append(".config/awesome/themes/colored/taglist/bg_focus.png")
files.append(".config/awesome/themes/colored/taglist/bg_prog.png")
files.append(".config/awesome/themes/colored/taglist/square_a.png")
files.append(".config/awesome/themes/colored/taglist/square_b.png")
files.append(".config/awesome/themes/colored/taglist/squarefz.png")
files.append(".config/awesome/themes/colored/taglist/squarez.png")
files.append(".config/awesome/themes/colored/taglist/squaref_a.png")
files.append(".config/awesome/themes/colored/taglist/squaref_b.png")
files.append(".config/awesome/themes/colored/titlebar/close_focus.png")
files.append(".config/awesome/themes/colored/titlebar/close_normal.png")
files.append(".config/awesome/themes/colored/titlebar/floating_focus_active.png")
files.append(".config/awesome/themes/colored/titlebar/floating_focus_inactive.png")
files.append(".config/awesome/themes/colored/titlebar/floating_normal_active.png")
files.append(".config/awesome/themes/colored/titlebar/floating_normal_inactive.png")
files.append(".config/awesome/themes/colored/titlebar/maximized_focus_active.png")
files.append(".config/awesome/themes/colored/titlebar/maximized_focus_inactive.png")
files.append(".config/awesome/themes/colored/titlebar/maximized_normal_active.png")
files.append(".config/awesome/themes/colored/titlebar/maximized_normal_inactive.png")
files.append(".config/awesome/themes/colored/titlebar/ontop_focus_active.png")
files.append(".config/awesome/themes/colored/titlebar/ontop_focus_inactive.png")
files.append(".config/awesome/themes/colored/titlebar/ontop_normal_active.png")
files.append(".config/awesome/themes/colored/titlebar/ontop_normal_inactive.png")
files.append(".config/awesome/themes/colored/titlebar/sticky_focus_active.png")
files.append(".config/awesome/themes/colored/titlebar/sticky_focus_inactive.png")
files.append(".config/awesome/themes/colored/titlebar/sticky_normal_active.png")
files.append(".config/awesome/themes/colored/titlebar/sticky_normal_inactive.png")

files.append(".config/awesome/themes/colored/widgets/black/ac_01.png")
files.append(".config/awesome/themes/colored/widgets/black/ac.png")
files.append(".config/awesome/themes/colored/widgets/black/arch_10x10.png")
files.append(".config/awesome/themes/colored/widgets/black/arch.png")
files.append(".config/awesome/themes/colored/widgets/black/bat_empty_01.png")
files.append(".config/awesome/themes/colored/widgets/black/bat_empty_02.png")
files.append(".config/awesome/themes/colored/widgets/black/bat_full_01.png")
files.append(".config/awesome/themes/colored/widgets/black/bat_full_02.png")
files.append(".config/awesome/themes/colored/widgets/black/bat_low_01.png")
files.append(".config/awesome/themes/colored/widgets/black/bat_low_02.png")
files.append(".config/awesome/themes/colored/widgets/black/bluetooth.png")
files.append(".config/awesome/themes/colored/widgets/black/bug_01.png")
files.append(".config/awesome/themes/colored/widgets/black/bug_02.png")
files.append(".config/awesome/themes/colored/widgets/black/cat.png")
files.append(".config/awesome/themes/colored/widgets/black/clock.png")
files.append(".config/awesome/themes/colored/widgets/black/cpu.png")
files.append(".config/awesome/themes/colored/widgets/black/dish.png")
files.append(".config/awesome/themes/colored/widgets/black/diskette.png")
files.append(".config/awesome/themes/colored/widgets/black/empty.png")
files.append(".config/awesome/themes/colored/widgets/black/eye_l.png")
files.append(".config/awesome/themes/colored/widgets/black/eye_r.png")
files.append(".config/awesome/themes/colored/widgets/black/fox.png")
files.append(".config/awesome/themes/colored/widgets/black/fs_01.png")
files.append(".config/awesome/themes/colored/widgets/black/fs_02.png")
files.append(".config/awesome/themes/colored/widgets/black/full.png")
files.append(".config/awesome/themes/colored/widgets/black/fwd.png")
files.append(".config/awesome/themes/colored/widgets/black/half.png")
files.append(".config/awesome/themes/colored/widgets/black/info_01.png")
files.append(".config/awesome/themes/colored/widgets/black/info_02.png")
files.append(".config/awesome/themes/colored/widgets/black/info_03.png")
files.append(".config/awesome/themes/colored/widgets/black/mail.png")
files.append(".config/awesome/themes/colored/widgets/black/mem.png")
files.append(".config/awesome/themes/colored/widgets/black/mouse_01.png")
files.append(".config/awesome/themes/colored/widgets/black/net_down_01.png")
files.append(".config/awesome/themes/colored/widgets/black/net_down_02.png")
files.append(".config/awesome/themes/colored/widgets/black/net_down_03.png")
files.append(".config/awesome/themes/colored/widgets/black/net_up_01.png")
files.append(".config/awesome/themes/colored/widgets/black/net_up_02.png")
files.append(".config/awesome/themes/colored/widgets/black/net_up_03.png")
files.append(".config/awesome/themes/colored/widgets/black/net_wired.png")
files.append(".config/awesome/themes/colored/widgets/black/next.png")
files.append(".config/awesome/themes/colored/widgets/black/note.png")
files.append(".config/awesome/themes/colored/widgets/black/pacman.png")
files.append(".config/awesome/themes/colored/widgets/black/pause.png")
files.append(".config/awesome/themes/colored/widgets/black/phones.png")
files.append(".config/awesome/themes/colored/widgets/black/play.png")
files.append(".config/awesome/themes/colored/widgets/black/plug.png")
files.append(".config/awesome/themes/colored/widgets/black/prev.png")
files.append(".config/awesome/themes/colored/widgets/black/rwd.png")
files.append(".config/awesome/themes/colored/widgets/black/scorpio.png")
files.append(".config/awesome/themes/colored/widgets/black/shroom.png")
files.append(".config/awesome/themes/colored/widgets/black/spkr_01.png")
files.append(".config/awesome/themes/colored/widgets/black/spkr_02.png")
files.append(".config/awesome/themes/colored/widgets/black/spkr_03.png")
files.append(".config/awesome/themes/colored/widgets/black/stop.png")
files.append(".config/awesome/themes/colored/widgets/black/temp.png")
files.append(".config/awesome/themes/colored/widgets/black/test.png")
files.append(".config/awesome/themes/colored/widgets/black/usb_02.png")
files.append(".config/awesome/themes/colored/widgets/black/usb.png")
files.append(".config/awesome/themes/colored/widgets/black/wifi_01.png")
files.append(".config/awesome/themes/colored/widgets/black/wifi_02.png")

files.append(".config/awesome/themes/colored/widgets/blue/ac_01.png")
files.append(".config/awesome/themes/colored/widgets/blue/ac.png")
files.append(".config/awesome/themes/colored/widgets/blue/arch_10x10.png")
files.append(".config/awesome/themes/colored/widgets/blue/arch.png")
files.append(".config/awesome/themes/colored/widgets/blue/bat_empty_01.png")
files.append(".config/awesome/themes/colored/widgets/blue/bat_empty_02.png")
files.append(".config/awesome/themes/colored/widgets/blue/bat_full_01.png")
files.append(".config/awesome/themes/colored/widgets/blue/bat_full_02.png")
files.append(".config/awesome/themes/colored/widgets/blue/bat_low_01.png")
files.append(".config/awesome/themes/colored/widgets/blue/bat_low_02.png")
files.append(".config/awesome/themes/colored/widgets/blue/bluetooth.png")
files.append(".config/awesome/themes/colored/widgets/blue/bug_01.png")
files.append(".config/awesome/themes/colored/widgets/blue/bug_02.png")
files.append(".config/awesome/themes/colored/widgets/blue/cat.png")
files.append(".config/awesome/themes/colored/widgets/blue/clock.png")
files.append(".config/awesome/themes/colored/widgets/blue/cpu.png")
files.append(".config/awesome/themes/colored/widgets/blue/dish.png")
files.append(".config/awesome/themes/colored/widgets/blue/diskette.png")
files.append(".config/awesome/themes/colored/widgets/blue/empty.png")
files.append(".config/awesome/themes/colored/widgets/blue/eye_l.png")
files.append(".config/awesome/themes/colored/widgets/blue/eye_r.png")
files.append(".config/awesome/themes/colored/widgets/blue/fox.png")
files.append(".config/awesome/themes/colored/widgets/blue/fs_01.png")
files.append(".config/awesome/themes/colored/widgets/blue/fs_02.png")
files.append(".config/awesome/themes/colored/widgets/blue/full.png")
files.append(".config/awesome/themes/colored/widgets/blue/fwd.png")
files.append(".config/awesome/themes/colored/widgets/blue/half.png")
files.append(".config/awesome/themes/colored/widgets/blue/info_01.png")
files.append(".config/awesome/themes/colored/widgets/blue/info_02.png")
files.append(".config/awesome/themes/colored/widgets/blue/info_03.png")
files.append(".config/awesome/themes/colored/widgets/blue/mail.png")
files.append(".config/awesome/themes/colored/widgets/blue/mem.png")
files.append(".config/awesome/themes/colored/widgets/blue/mouse_01.png")
files.append(".config/awesome/themes/colored/widgets/blue/net_down_01.png")
files.append(".config/awesome/themes/colored/widgets/blue/net_down_02.png")
files.append(".config/awesome/themes/colored/widgets/blue/net_down_03.png")
files.append(".config/awesome/themes/colored/widgets/blue/net_up_01.png")
files.append(".config/awesome/themes/colored/widgets/blue/net_up_02.png")
files.append(".config/awesome/themes/colored/widgets/blue/net_up_03.png")
files.append(".config/awesome/themes/colored/widgets/blue/net_wired.png")
files.append(".config/awesome/themes/colored/widgets/blue/next.png")
files.append(".config/awesome/themes/colored/widgets/blue/note.png")
files.append(".config/awesome/themes/colored/widgets/blue/pacman.png")
files.append(".config/awesome/themes/colored/widgets/blue/pause.png")
files.append(".config/awesome/themes/colored/widgets/blue/phones.png")
files.append(".config/awesome/themes/colored/widgets/blue/play.png")
files.append(".config/awesome/themes/colored/widgets/blue/plug.png")
files.append(".config/awesome/themes/colored/widgets/blue/prev.png")
files.append(".config/awesome/themes/colored/widgets/blue/rwd.png")
files.append(".config/awesome/themes/colored/widgets/blue/scorpio.png")
files.append(".config/awesome/themes/colored/widgets/blue/shroom.png")
files.append(".config/awesome/themes/colored/widgets/blue/spkr_01.png")
files.append(".config/awesome/themes/colored/widgets/blue/spkr_02.png")
files.append(".config/awesome/themes/colored/widgets/blue/spkr_03.png")
files.append(".config/awesome/themes/colored/widgets/blue/stop.png")
files.append(".config/awesome/themes/colored/widgets/blue/temp.png")
files.append(".config/awesome/themes/colored/widgets/blue/test.png")
files.append(".config/awesome/themes/colored/widgets/blue/usb_02.png")
files.append(".config/awesome/themes/colored/widgets/blue/usb.png")
files.append(".config/awesome/themes/colored/widgets/blue/wifi_01.png")
files.append(".config/awesome/themes/colored/widgets/blue/wifi_02.png")

files.append(".config/awesome/themes/colored/widgets/cyan/ac_01.png")
files.append(".config/awesome/themes/colored/widgets/cyan/ac.png")
files.append(".config/awesome/themes/colored/widgets/cyan/arch_10x10.png")
files.append(".config/awesome/themes/colored/widgets/cyan/arch.png")
files.append(".config/awesome/themes/colored/widgets/cyan/bat_empty_01.png")
files.append(".config/awesome/themes/colored/widgets/cyan/bat_empty_02.png")
files.append(".config/awesome/themes/colored/widgets/cyan/bat_full_01.png")
files.append(".config/awesome/themes/colored/widgets/cyan/bat_full_02.png")
files.append(".config/awesome/themes/colored/widgets/cyan/bat_low_01.png")
files.append(".config/awesome/themes/colored/widgets/cyan/bat_low_02.png")
files.append(".config/awesome/themes/colored/widgets/cyan/bluetooth.png")
files.append(".config/awesome/themes/colored/widgets/cyan/bug_01.png")
files.append(".config/awesome/themes/colored/widgets/cyan/bug_02.png")
files.append(".config/awesome/themes/colored/widgets/cyan/cat.png")
files.append(".config/awesome/themes/colored/widgets/cyan/clock.png")
files.append(".config/awesome/themes/colored/widgets/cyan/cpu.png")
files.append(".config/awesome/themes/colored/widgets/cyan/dish.png")
files.append(".config/awesome/themes/colored/widgets/cyan/diskette.png")
files.append(".config/awesome/themes/colored/widgets/cyan/empty.png")
files.append(".config/awesome/themes/colored/widgets/cyan/eye_l.png")
files.append(".config/awesome/themes/colored/widgets/cyan/eye_r.png")
files.append(".config/awesome/themes/colored/widgets/cyan/fox.png")
files.append(".config/awesome/themes/colored/widgets/cyan/fs_01.png")
files.append(".config/awesome/themes/colored/widgets/cyan/fs_02.png")
files.append(".config/awesome/themes/colored/widgets/cyan/full.png")
files.append(".config/awesome/themes/colored/widgets/cyan/fwd.png")
files.append(".config/awesome/themes/colored/widgets/cyan/half.png")
files.append(".config/awesome/themes/colored/widgets/cyan/info_01.png")
files.append(".config/awesome/themes/colored/widgets/cyan/info_02.png")
files.append(".config/awesome/themes/colored/widgets/cyan/info_03.png")
files.append(".config/awesome/themes/colored/widgets/cyan/mail.png")
files.append(".config/awesome/themes/colored/widgets/cyan/mem.png")
files.append(".config/awesome/themes/colored/widgets/cyan/mouse_01.png")
files.append(".config/awesome/themes/colored/widgets/cyan/net_down_01.png")
files.append(".config/awesome/themes/colored/widgets/cyan/net_down_02.png")
files.append(".config/awesome/themes/colored/widgets/cyan/net_down_03.png")
files.append(".config/awesome/themes/colored/widgets/cyan/net_up_01.png")
files.append(".config/awesome/themes/colored/widgets/cyan/net_up_02.png")
files.append(".config/awesome/themes/colored/widgets/cyan/net_up_03.png")
files.append(".config/awesome/themes/colored/widgets/cyan/net_wired.png")
files.append(".config/awesome/themes/colored/widgets/cyan/next.png")
files.append(".config/awesome/themes/colored/widgets/cyan/note.png")
files.append(".config/awesome/themes/colored/widgets/cyan/pacman.png")
files.append(".config/awesome/themes/colored/widgets/cyan/pause.png")
files.append(".config/awesome/themes/colored/widgets/cyan/phones.png")
files.append(".config/awesome/themes/colored/widgets/cyan/play.png")
files.append(".config/awesome/themes/colored/widgets/cyan/plug.png")
files.append(".config/awesome/themes/colored/widgets/cyan/prev.png")
files.append(".config/awesome/themes/colored/widgets/cyan/rwd.png")
files.append(".config/awesome/themes/colored/widgets/cyan/scorpio.png")
files.append(".config/awesome/themes/colored/widgets/cyan/shroom.png")
files.append(".config/awesome/themes/colored/widgets/cyan/spkr_01.png")
files.append(".config/awesome/themes/colored/widgets/cyan/spkr_02.png")
files.append(".config/awesome/themes/colored/widgets/cyan/spkr_03.png")
files.append(".config/awesome/themes/colored/widgets/cyan/stop.png")
files.append(".config/awesome/themes/colored/widgets/cyan/temp.png")
files.append(".config/awesome/themes/colored/widgets/cyan/test.png")
files.append(".config/awesome/themes/colored/widgets/cyan/usb_02.png")
files.append(".config/awesome/themes/colored/widgets/cyan/usb.png")
files.append(".config/awesome/themes/colored/widgets/cyan/wifi_01.png")
files.append(".config/awesome/themes/colored/widgets/cyan/wifi_02.png")

files.append(".config/awesome/themes/colored/widgets/green/ac_01.png")
files.append(".config/awesome/themes/colored/widgets/green/ac.png")
files.append(".config/awesome/themes/colored/widgets/green/arch_10x10.png")
files.append(".config/awesome/themes/colored/widgets/green/arch.png")
files.append(".config/awesome/themes/colored/widgets/green/bat_empty_01.png")
files.append(".config/awesome/themes/colored/widgets/green/bat_empty_02.png")
files.append(".config/awesome/themes/colored/widgets/green/bat_full_01.png")
files.append(".config/awesome/themes/colored/widgets/green/bat_full_02.png")
files.append(".config/awesome/themes/colored/widgets/green/bat_low_01.png")
files.append(".config/awesome/themes/colored/widgets/green/bat_low_02.png")
files.append(".config/awesome/themes/colored/widgets/green/bluetooth.png")
files.append(".config/awesome/themes/colored/widgets/green/bug_01.png")
files.append(".config/awesome/themes/colored/widgets/green/bug_02.png")
files.append(".config/awesome/themes/colored/widgets/green/cat.png")
files.append(".config/awesome/themes/colored/widgets/green/clock.png")
files.append(".config/awesome/themes/colored/widgets/green/cpu.png")
files.append(".config/awesome/themes/colored/widgets/green/dish.png")
files.append(".config/awesome/themes/colored/widgets/green/diskette.png")
files.append(".config/awesome/themes/colored/widgets/green/empty.png")
files.append(".config/awesome/themes/colored/widgets/green/eye_l.png")
files.append(".config/awesome/themes/colored/widgets/green/eye_r.png")
files.append(".config/awesome/themes/colored/widgets/green/fox.png")
files.append(".config/awesome/themes/colored/widgets/green/fs_01.png")
files.append(".config/awesome/themes/colored/widgets/green/fs_02.png")
files.append(".config/awesome/themes/colored/widgets/green/full.png")
files.append(".config/awesome/themes/colored/widgets/green/fwd.png")
files.append(".config/awesome/themes/colored/widgets/green/half.png")
files.append(".config/awesome/themes/colored/widgets/green/info_01.png")
files.append(".config/awesome/themes/colored/widgets/green/info_02.png")
files.append(".config/awesome/themes/colored/widgets/green/info_03.png")
files.append(".config/awesome/themes/colored/widgets/green/mail.png")
files.append(".config/awesome/themes/colored/widgets/green/mem.png")
files.append(".config/awesome/themes/colored/widgets/green/mouse_01.png")
files.append(".config/awesome/themes/colored/widgets/green/net_down_01.png")
files.append(".config/awesome/themes/colored/widgets/green/net_down_02.png")
files.append(".config/awesome/themes/colored/widgets/green/net_down_03.png")
files.append(".config/awesome/themes/colored/widgets/green/net_up_01.png")
files.append(".config/awesome/themes/colored/widgets/green/net_up_02.png")
files.append(".config/awesome/themes/colored/widgets/green/net_up_03.png")
files.append(".config/awesome/themes/colored/widgets/green/net_wired.png")
files.append(".config/awesome/themes/colored/widgets/green/next.png")
files.append(".config/awesome/themes/colored/widgets/green/note.png")
files.append(".config/awesome/themes/colored/widgets/green/pacman.png")
files.append(".config/awesome/themes/colored/widgets/green/pause.png")
files.append(".config/awesome/themes/colored/widgets/green/phones.png")
files.append(".config/awesome/themes/colored/widgets/green/play.png")
files.append(".config/awesome/themes/colored/widgets/green/plug.png")
files.append(".config/awesome/themes/colored/widgets/green/prev.png")
files.append(".config/awesome/themes/colored/widgets/green/rwd.png")
files.append(".config/awesome/themes/colored/widgets/green/scorpio.png")
files.append(".config/awesome/themes/colored/widgets/green/shroom.png")
files.append(".config/awesome/themes/colored/widgets/green/spkr_01.png")
files.append(".config/awesome/themes/colored/widgets/green/spkr_02.png")
files.append(".config/awesome/themes/colored/widgets/green/spkr_03.png")
files.append(".config/awesome/themes/colored/widgets/green/stop.png")
files.append(".config/awesome/themes/colored/widgets/green/temp.png")
files.append(".config/awesome/themes/colored/widgets/green/test.png")
files.append(".config/awesome/themes/colored/widgets/green/usb_02.png")
files.append(".config/awesome/themes/colored/widgets/green/usb.png")
files.append(".config/awesome/themes/colored/widgets/green/wifi_01.png")
files.append(".config/awesome/themes/colored/widgets/green/wifi_02.png")

files.append(".config/awesome/themes/colored/widgets/magenta/ac_01.png")
files.append(".config/awesome/themes/colored/widgets/magenta/ac.png")
files.append(".config/awesome/themes/colored/widgets/magenta/arch_10x10.png")
files.append(".config/awesome/themes/colored/widgets/magenta/arch.png")
files.append(".config/awesome/themes/colored/widgets/magenta/bat_empty_01.png")
files.append(".config/awesome/themes/colored/widgets/magenta/bat_empty_02.png")
files.append(".config/awesome/themes/colored/widgets/magenta/bat_full_01.png")
files.append(".config/awesome/themes/colored/widgets/magenta/bat_full_02.png")
files.append(".config/awesome/themes/colored/widgets/magenta/bat_low_01.png")
files.append(".config/awesome/themes/colored/widgets/magenta/bat_low_02.png")
files.append(".config/awesome/themes/colored/widgets/magenta/bluetooth.png")
files.append(".config/awesome/themes/colored/widgets/magenta/bug_01.png")
files.append(".config/awesome/themes/colored/widgets/magenta/bug_02.png")
files.append(".config/awesome/themes/colored/widgets/magenta/cat.png")
files.append(".config/awesome/themes/colored/widgets/magenta/clock.png")
files.append(".config/awesome/themes/colored/widgets/magenta/cpu.png")
files.append(".config/awesome/themes/colored/widgets/magenta/dish.png")
files.append(".config/awesome/themes/colored/widgets/magenta/diskette.png")
files.append(".config/awesome/themes/colored/widgets/magenta/empty.png")
files.append(".config/awesome/themes/colored/widgets/magenta/eye_l.png")
files.append(".config/awesome/themes/colored/widgets/magenta/eye_r.png")
files.append(".config/awesome/themes/colored/widgets/magenta/fox.png")
files.append(".config/awesome/themes/colored/widgets/magenta/fs_01.png")
files.append(".config/awesome/themes/colored/widgets/magenta/fs_02.png")
files.append(".config/awesome/themes/colored/widgets/magenta/full.png")
files.append(".config/awesome/themes/colored/widgets/magenta/fwd.png")
files.append(".config/awesome/themes/colored/widgets/magenta/half.png")
files.append(".config/awesome/themes/colored/widgets/magenta/info_01.png")
files.append(".config/awesome/themes/colored/widgets/magenta/info_02.png")
files.append(".config/awesome/themes/colored/widgets/magenta/info_03.png")
files.append(".config/awesome/themes/colored/widgets/magenta/mail.png")
files.append(".config/awesome/themes/colored/widgets/magenta/mem.png")
files.append(".config/awesome/themes/colored/widgets/magenta/mouse_01.png")
files.append(".config/awesome/themes/colored/widgets/magenta/net_down_01.png")
files.append(".config/awesome/themes/colored/widgets/magenta/net_down_02.png")
files.append(".config/awesome/themes/colored/widgets/magenta/net_down_03.png")
files.append(".config/awesome/themes/colored/widgets/magenta/net_up_01.png")
files.append(".config/awesome/themes/colored/widgets/magenta/net_up_02.png")
files.append(".config/awesome/themes/colored/widgets/magenta/net_up_03.png")
files.append(".config/awesome/themes/colored/widgets/magenta/net_wired.png")
files.append(".config/awesome/themes/colored/widgets/magenta/next.png")
files.append(".config/awesome/themes/colored/widgets/magenta/note.png")
files.append(".config/awesome/themes/colored/widgets/magenta/pacman.png")
files.append(".config/awesome/themes/colored/widgets/magenta/pause.png")
files.append(".config/awesome/themes/colored/widgets/magenta/phones.png")
files.append(".config/awesome/themes/colored/widgets/magenta/play.png")
files.append(".config/awesome/themes/colored/widgets/magenta/plug.png")
files.append(".config/awesome/themes/colored/widgets/magenta/prev.png")
files.append(".config/awesome/themes/colored/widgets/magenta/rwd.png")
files.append(".config/awesome/themes/colored/widgets/magenta/scorpio.png")
files.append(".config/awesome/themes/colored/widgets/magenta/shroom.png")
files.append(".config/awesome/themes/colored/widgets/magenta/spkr_01.png")
files.append(".config/awesome/themes/colored/widgets/magenta/spkr_02.png")
files.append(".config/awesome/themes/colored/widgets/magenta/spkr_03.png")
files.append(".config/awesome/themes/colored/widgets/magenta/stop.png")
files.append(".config/awesome/themes/colored/widgets/magenta/temp.png")
files.append(".config/awesome/themes/colored/widgets/magenta/test.png")
files.append(".config/awesome/themes/colored/widgets/magenta/usb_02.png")
files.append(".config/awesome/themes/colored/widgets/magenta/usb.png")
files.append(".config/awesome/themes/colored/widgets/magenta/wifi_01.png")
files.append(".config/awesome/themes/colored/widgets/magenta/wifi_02.png")

files.append(".config/awesome/themes/colored/widgets/red/ac_01.png")
files.append(".config/awesome/themes/colored/widgets/red/ac.png")
files.append(".config/awesome/themes/colored/widgets/red/arch_10x10.png")
files.append(".config/awesome/themes/colored/widgets/red/arch.png")
files.append(".config/awesome/themes/colored/widgets/red/bat_empty_01.png")
files.append(".config/awesome/themes/colored/widgets/red/bat_empty_02.png")
files.append(".config/awesome/themes/colored/widgets/red/bat_full_01.png")
files.append(".config/awesome/themes/colored/widgets/red/bat_full_02.png")
files.append(".config/awesome/themes/colored/widgets/red/bat_low_01.png")
files.append(".config/awesome/themes/colored/widgets/red/bat_low_02.png")
files.append(".config/awesome/themes/colored/widgets/red/bluetooth.png")
files.append(".config/awesome/themes/colored/widgets/red/bug_01.png")
files.append(".config/awesome/themes/colored/widgets/red/bug_02.png")
files.append(".config/awesome/themes/colored/widgets/red/cat.png")
files.append(".config/awesome/themes/colored/widgets/red/clock.png")
files.append(".config/awesome/themes/colored/widgets/red/cpu.png")
files.append(".config/awesome/themes/colored/widgets/red/dish.png")
files.append(".config/awesome/themes/colored/widgets/red/diskette.png")
files.append(".config/awesome/themes/colored/widgets/red/empty.png")
files.append(".config/awesome/themes/colored/widgets/red/eye_l.png")
files.append(".config/awesome/themes/colored/widgets/red/eye_r.png")
files.append(".config/awesome/themes/colored/widgets/red/fox.png")
files.append(".config/awesome/themes/colored/widgets/red/fs_01.png")
files.append(".config/awesome/themes/colored/widgets/red/fs_02.png")
files.append(".config/awesome/themes/colored/widgets/red/full.png")
files.append(".config/awesome/themes/colored/widgets/red/fwd.png")
files.append(".config/awesome/themes/colored/widgets/red/half.png")
files.append(".config/awesome/themes/colored/widgets/red/info_01.png")
files.append(".config/awesome/themes/colored/widgets/red/info_02.png")
files.append(".config/awesome/themes/colored/widgets/red/info_03.png")
files.append(".config/awesome/themes/colored/widgets/red/mail.png")
files.append(".config/awesome/themes/colored/widgets/red/mem.png")
files.append(".config/awesome/themes/colored/widgets/red/mouse_01.png")
files.append(".config/awesome/themes/colored/widgets/red/net_down_01.png")
files.append(".config/awesome/themes/colored/widgets/red/net_down_02.png")
files.append(".config/awesome/themes/colored/widgets/red/net_down_03.png")
files.append(".config/awesome/themes/colored/widgets/red/net_up_01.png")
files.append(".config/awesome/themes/colored/widgets/red/net_up_02.png")
files.append(".config/awesome/themes/colored/widgets/red/net_up_03.png")
files.append(".config/awesome/themes/colored/widgets/red/net_wired.png")
files.append(".config/awesome/themes/colored/widgets/red/next.png")
files.append(".config/awesome/themes/colored/widgets/red/note.png")
files.append(".config/awesome/themes/colored/widgets/red/pacman.png")
files.append(".config/awesome/themes/colored/widgets/red/pause.png")
files.append(".config/awesome/themes/colored/widgets/red/phones.png")
files.append(".config/awesome/themes/colored/widgets/red/play.png")
files.append(".config/awesome/themes/colored/widgets/red/plug.png")
files.append(".config/awesome/themes/colored/widgets/red/prev.png")
files.append(".config/awesome/themes/colored/widgets/red/rwd.png")
files.append(".config/awesome/themes/colored/widgets/red/scorpio.png")
files.append(".config/awesome/themes/colored/widgets/red/shroom.png")
files.append(".config/awesome/themes/colored/widgets/red/spkr_01.png")
files.append(".config/awesome/themes/colored/widgets/red/spkr_02.png")
files.append(".config/awesome/themes/colored/widgets/red/spkr_03.png")
files.append(".config/awesome/themes/colored/widgets/red/stop.png")
files.append(".config/awesome/themes/colored/widgets/red/temp.png")
files.append(".config/awesome/themes/colored/widgets/red/test.png")
files.append(".config/awesome/themes/colored/widgets/red/usb_02.png")
files.append(".config/awesome/themes/colored/widgets/red/usb.png")
files.append(".config/awesome/themes/colored/widgets/red/wifi_01.png")
files.append(".config/awesome/themes/colored/widgets/red/wifi_02.png")

files.append(".config/awesome/themes/colored/widgets/yellow/ac_01.png")
files.append(".config/awesome/themes/colored/widgets/yellow/ac.png")
files.append(".config/awesome/themes/colored/widgets/yellow/arch_10x10.png")
files.append(".config/awesome/themes/colored/widgets/yellow/arch.png")
files.append(".config/awesome/themes/colored/widgets/yellow/bat_empty_01.png")
files.append(".config/awesome/themes/colored/widgets/yellow/bat_empty_02.png")
files.append(".config/awesome/themes/colored/widgets/yellow/bat_full_01.png")
files.append(".config/awesome/themes/colored/widgets/yellow/bat_full_02.png")
files.append(".config/awesome/themes/colored/widgets/yellow/bat_low_01.png")
files.append(".config/awesome/themes/colored/widgets/yellow/bat_low_02.png")
files.append(".config/awesome/themes/colored/widgets/yellow/bluetooth.png")
files.append(".config/awesome/themes/colored/widgets/yellow/bug_01.png")
files.append(".config/awesome/themes/colored/widgets/yellow/bug_02.png")
files.append(".config/awesome/themes/colored/widgets/yellow/cat.png")
files.append(".config/awesome/themes/colored/widgets/yellow/clock.png")
files.append(".config/awesome/themes/colored/widgets/yellow/cpu.png")
files.append(".config/awesome/themes/colored/widgets/yellow/dish.png")
files.append(".config/awesome/themes/colored/widgets/yellow/diskette.png")
files.append(".config/awesome/themes/colored/widgets/yellow/empty.png")
files.append(".config/awesome/themes/colored/widgets/yellow/eye_l.png")
files.append(".config/awesome/themes/colored/widgets/yellow/eye_r.png")
files.append(".config/awesome/themes/colored/widgets/yellow/fox.png")
files.append(".config/awesome/themes/colored/widgets/yellow/fs_01.png")
files.append(".config/awesome/themes/colored/widgets/yellow/fs_02.png")
files.append(".config/awesome/themes/colored/widgets/yellow/full.png")
files.append(".config/awesome/themes/colored/widgets/yellow/fwd.png")
files.append(".config/awesome/themes/colored/widgets/yellow/half.png")
files.append(".config/awesome/themes/colored/widgets/yellow/info_01.png")
files.append(".config/awesome/themes/colored/widgets/yellow/info_02.png")
files.append(".config/awesome/themes/colored/widgets/yellow/info_03.png")
files.append(".config/awesome/themes/colored/widgets/yellow/mail.png")
files.append(".config/awesome/themes/colored/widgets/yellow/mem.png")
files.append(".config/awesome/themes/colored/widgets/yellow/mouse_01.png")
files.append(".config/awesome/themes/colored/widgets/yellow/net_down_01.png")
files.append(".config/awesome/themes/colored/widgets/yellow/net_down_02.png")
files.append(".config/awesome/themes/colored/widgets/yellow/net_down_03.png")
files.append(".config/awesome/themes/colored/widgets/yellow/net_up_01.png")
files.append(".config/awesome/themes/colored/widgets/yellow/net_up_02.png")
files.append(".config/awesome/themes/colored/widgets/yellow/net_up_03.png")
files.append(".config/awesome/themes/colored/widgets/yellow/net_wired.png")
files.append(".config/awesome/themes/colored/widgets/yellow/next.png")
files.append(".config/awesome/themes/colored/widgets/yellow/note.png")
files.append(".config/awesome/themes/colored/widgets/yellow/pacman.png")
files.append(".config/awesome/themes/colored/widgets/yellow/pause.png")
files.append(".config/awesome/themes/colored/widgets/yellow/phones.png")
files.append(".config/awesome/themes/colored/widgets/yellow/play.png")
files.append(".config/awesome/themes/colored/widgets/yellow/plug.png")
files.append(".config/awesome/themes/colored/widgets/yellow/prev.png")
files.append(".config/awesome/themes/colored/widgets/yellow/rwd.png")
files.append(".config/awesome/themes/colored/widgets/yellow/scorpio.png")
files.append(".config/awesome/themes/colored/widgets/yellow/shroom.png")
files.append(".config/awesome/themes/colored/widgets/yellow/spkr_01.png")
files.append(".config/awesome/themes/colored/widgets/yellow/spkr_02.png")
files.append(".config/awesome/themes/colored/widgets/yellow/spkr_03.png")
files.append(".config/awesome/themes/colored/widgets/yellow/stop.png")
files.append(".config/awesome/themes/colored/widgets/yellow/temp.png")
files.append(".config/awesome/themes/colored/widgets/yellow/test.png")
files.append(".config/awesome/themes/colored/widgets/yellow/usb_02.png")
files.append(".config/awesome/themes/colored/widgets/yellow/usb.png")
files.append(".config/awesome/themes/colored/widgets/yellow/wifi_01.png")
files.append(".config/awesome/themes/colored/widgets/yellow/wifi_02.png")

# gtk3
files.append(".config/gtk-3.0/settings.ini")

# ranger
files.append(".config/ranger/commands.py")
files.append(".config/ranger/rc.conf")
files.append(".config/ranger/rifle.conf")

# home
files.append(".bashrc")
files.append(".gtkrc.mine")
files.append(".vimrc")
files.append(".xprofile")
files.append(".Xresources")

for i in files:
    shutil.copyfile(src + i,dst + i)

for i in files:
    shutil.copyfile(src + i,dst + i)
