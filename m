Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a37fe947
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Oct 2017 18:21:49 +0000 (UTC)
Received: from smtp21.bhosted.nl (smtp21.bhosted.nl [94.124.121.33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ac31318
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Oct 2017 18:21:49 +0000 (UTC)
Received: from www (www.lan.vdorst.com [172.16.2.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.vdorst.com (Postfix) with ESMTPSA id 85F181333EFE
 for <wireguard@lists.zx2c4.com>; Tue, 10 Oct 2017 20:51:33 +0200 (CEST)
Date: Tue, 10 Oct 2017 18:51:33 +0000
Message-ID: <20171010185133.Horde.g9yJlkVpxW5Gk-qJumftGF_@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: wireguard@lists.zx2c4.com
Subject: possible irq lock inversion dependency detected
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

I got a "possible irq lock inversion dependency detected" while  
shutdown a active tunnel with "wg-quick down wg0".

Linux utilite 4.13.5 #15 SMP Tue Oct 10 12:22:12 CEST 2017 armv7l GNU/Linux
WireGuard 0.0.20171005-4-g5101cb7
Distro: Debian 9.2 stretch armhf.

The kernel and wireguard compiled from source on the device.
Device: IMX6q Utilite Pro.



Dmesg log:


[12352.549306] wireguard: wg0: Peer 1 (192.168.2.222:36464) destroyed

[12352.550905] ========================================================
[12352.557311] WARNING: possible irq lock inversion dependency detected
[12352.563721] 4.13.5 #15 Tainted: G           O
[12352.568380] --------------------------------------------------------
[12352.574785] swapper/0/0 just changed the state of lock:
[12352.580054]  (&(&r->consumer_lock)->rlock){+.-...}, at:  
[<bf0400ac>] packet_queue_free+0x24/0x84 [wireguard]
[12352.590096] but this lock took another, SOFTIRQ-unsafe lock in the past:
[12352.596851]  (&syncp->seq#7){+.+...}
[12352.596888]

                and interrupts could create inverse lock ordering between them.

[12352.611967]
                other info that might help us debug this:
[12352.618591]  Possible interrupt unsafe locking scenario:

[12352.625461]        CPU0                    CPU1
[12352.630043]        ----                    ----
[12352.634623]   lock(&syncp->seq#7);
[12352.638095]                                local_irq_disable();
[12352.644073]                                 
lock(&(&r->consumer_lock)->rlock);
[12352.651286]                                lock(&syncp->seq#7);
[12352.657238]   <Interrupt>
[12352.659873]     lock(&(&r->consumer_lock)->rlock);
[12352.664688]
                 *** DEADLOCK ***

[12352.670643] 1 lock held by swapper/0/0:
[12352.674496]  #0:  (rcu_callback){......}, at: [<c0188f90>]  
rcu_process_callbacks+0x2fc/0x5d0
[12352.682991]
                the shortest dependencies between 2nd lock and 1st lock:
[12352.690854]  -> (&syncp->seq#7){+.+...} ops: 427590 {
[12352.695944]     HARDIRQ-ON-W at:
[12352.699200]                       lock_acquire+0x70/0x90
[12352.704541]                       iptunnel_xmit+0x174/0x1e0
[12352.710140]                       udp_tunnel_xmit_skb+0xe8/0xf0
[12352.716121]                        
socket_send_skb_to_peer+0x400/0x830 [wireguard]
[12352.723665]                        
socket_send_buffer_to_peer+0x74/0x84 [wireguard]
[12352.731292]                        
packet_send_handshake_initiation+0xb8/0xf8 [wireguard]
[12352.739437]                        
packet_handshake_send_worker+0x18/0x24 [wireguard]
[12352.747217]                       process_one_work+0x24c/0x4e8
[12352.753074]                       worker_thread+0x40/0x574
[12352.758583]                       kthread+0x120/0x160
[12352.763659]                       ret_from_fork+0x14/0x24
[12352.769079]     SOFTIRQ-ON-W at:
[12352.772333]                       lock_acquire+0x70/0x90
[12352.777699]                        
receive_handshake_packet+0x114/0x3f0 [wireguard]
[12352.785325]                        
packet_handshake_receive_worker+0x1c/0x44 [wireguard]
[12352.793364]                       process_one_work+0x24c/0x4e8
[12352.799220]                       worker_thread+0x40/0x574
[12352.804728]                       kthread+0x120/0x160
[12352.809802]                       ret_from_fork+0x14/0x24
[12352.815223]     INITIAL USE at:
[12352.818388]                      lock_acquire+0x70/0x90
[12352.823638]                      ip_tunnel_get_stats64+0x148/0x190
[12352.829848]                      dev_get_stats+0x40/0xb4
[12352.835188]                      rtnl_fill_stats+0x38/0x120
[12352.840784]                      rtnl_fill_ifinfo+0x508/0xe00
[12352.846555]                      rtmsg_ifinfo_build_skb+0x70/0xe0
[12352.852673]                      rtmsg_ifinfo_event.part.7+0x1c/0x4c
[12352.859052]                      rtmsg_ifinfo+0x30/0x38
[12352.864302]                      __dev_notify_flags+0x94/0xa4
[12352.870071]                      rtnl_configure_link+0x80/0xa4
[12352.875928]                      rtnl_newlink+0x64c/0x748
[12352.881349]                      rtnetlink_rcv_msg+0x94/0x1f4
[12352.887122]                      netlink_rcv_skb+0xe0/0x100
[12352.892716]                      rtnetlink_rcv+0x28/0x38
[12352.898049]                      netlink_unicast+0x184/0x26c
[12352.903730]                      netlink_sendmsg+0x29c/0x378
[12352.909417]                      sock_sendmsg+0x1c/0x2c
[12352.914664]                      ___sys_sendmsg+0x214/0x22c
[12352.920260]                      __sys_sendmsg+0x48/0x74
[12352.925594]                      SyS_sendmsg+0x10/0x14
[12352.930757]                      ret_fast_syscall+0x0/0x1c
[12352.936262]   }
[12352.938062]   ... key      at: [<bf05e5b8>]  
__key.33453+0x0/0xffffba48 [wireguard]
[12352.945664]   ... acquired at:
[12352.948738]    iptunnel_xmit+0x174/0x1e0
[12352.952683]    udp_tunnel_xmit_skb+0xe8/0xf0
[12352.957000]    socket_send_skb_to_peer+0x400/0x830 [wireguard]
[12352.962880]    packet_tx_worker+0xc8/0x3e4 [wireguard]
[12352.968043]    process_one_work+0x24c/0x4e8
[12352.972248]    worker_thread+0x40/0x574
[12352.976101]    kthread+0x120/0x160
[12352.979522]    ret_from_fork+0x14/0x24

[12352.984790] -> (&(&r->consumer_lock)->rlock){+.-...} ops: 139059 {
[12352.991012]    HARDIRQ-ON-W at:
[12352.994180]                     lock_acquire+0x70/0x90
[12352.999351]                     _raw_spin_lock_bh+0x4c/0x5c
[12353.004976]                     packet_encrypt_worker+0x2c/0x574  
[wireguard]
[12353.012054]                     process_one_work+0x24c/0x4e8
[12353.017736]                     worker_thread+0x40/0x574
[12353.023069]                     kthread+0x120/0x160
[12353.027971]                     ret_from_fork+0x14/0x24
[12353.033215]    IN-SOFTIRQ-W at:
[12353.036380]                     lock_acquire+0x70/0x90
[12353.041542]                     _raw_spin_lock_bh+0x4c/0x5c
[12353.047166]                     packet_queue_free+0x24/0x84 [wireguard]
[12353.053830]                     rcu_release+0x48/0x6c [wireguard]
[12353.059949]                     rcu_process_callbacks+0x338/0x5d0
[12353.066072]                     __do_softirq+0xf0/0x2a0
[12353.071318]                     irq_exit+0xe8/0x160
[12353.076222]                     __handle_domain_irq+0x60/0xc0
[12353.081991]                     gic_handle_irq+0x64/0xc4
[12353.087326]                     __irq_svc+0x70/0x98
[12353.092227]                     cpuidle_enter_state+0x188/0x2b0
[12353.098169]                     cpuidle_enter+0x1c/0x20
[12353.103418]                     call_cpuidle+0x28/0x44
[12353.108578]                     do_idle+0x10c/0x1e0
[12353.113476]                     cpu_startup_entry+0x20/0x24
[12353.119072]                     rest_init+0x228/0x278
[12353.124151]                     start_kernel+0x32c/0x3a0
[12353.129485]                     0x8000807c
[12353.133597]    INITIAL USE at:
[12353.136676]                    lock_acquire+0x70/0x90
[12353.141751]                    _raw_spin_lock_bh+0x4c/0x5c
[12353.147289]                    packet_encrypt_worker+0x2c/0x574 [wireguard]
[12353.154280]                    process_one_work+0x24c/0x4e8
[12353.159876]                    worker_thread+0x40/0x574
[12353.165122]                    kthread+0x120/0x160
[12353.169935]                    ret_from_fork+0x14/0x24
[12353.175092]  }
[12353.176800]  ... key      at: [<bf05e640>]  
__key.48712+0x0/0xffffb9c0 [wireguard]
[12353.184311]  ... acquired at:
[12353.187301]    mark_lock+0x2f8/0x6f0
[12353.190897]    __lock_acquire+0x590/0x18e0
[12353.195013]    lock_acquire+0x70/0x90
[12353.198696]    _raw_spin_lock_bh+0x4c/0x5c
[12353.202837]    packet_queue_free+0x24/0x84 [wireguard]
[12353.208020]    rcu_release+0x48/0x6c [wireguard]
[12353.212660]    rcu_process_callbacks+0x338/0x5d0
[12353.217302]    __do_softirq+0xf0/0x2a0
[12353.221069]    irq_exit+0xe8/0x160
[12353.224491]    __handle_domain_irq+0x60/0xc0
[12353.228779]    gic_handle_irq+0x64/0xc4
[12353.232633]    __irq_svc+0x70/0x98
[12353.236053]    cpuidle_enter_state+0x188/0x2b0
[12353.240515]    cpuidle_enter+0x1c/0x20
[12353.244283]    call_cpuidle+0x28/0x44
[12353.247963]    do_idle+0x10c/0x1e0
[12353.251382]    cpu_startup_entry+0x20/0x24
[12353.255496]    rest_init+0x228/0x278
[12353.259092]    start_kernel+0x32c/0x3a0
[12353.262947]    0x8000807c

[12353.267082]
                stack backtrace:
[12353.271468] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O     
4.13.5 #15
[12353.278719] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[12353.285270] Backtrace:
[12353.287749] [<c010c3b8>] (dump_backtrace) from [<c010c664>]  
(show_stack+0x18/0x1c)
[12353.295353]  r7:00000000 r6:600f0193 r5:00000000 r4:c0e69ce0
[12353.301047] [<c010c64c>] (show_stack) from [<c090f858>]  
(dump_stack+0xb4/0xe8)
[12353.308307] [<c090f7a4>] (dump_stack) from [<c016c974>]  
(print_irq_inversion_bug+0x1a0/0x214)
[12353.316868]  r9:00000004 r8:00000000 r7:c0e9cc9c r6:c0e0a840  
r5:c0e9cc9c r4:c0e01bdc
[12353.324649] [<c016c7d4>] (print_irq_inversion_bug) from  
[<c016ca98>] (check_usage_forwards+0xb0/0x120)
[12353.333992]  r9:00000004 r8:00000001 r7:c0bbca14 r6:c0e0a840  
r5:00000006 r4:c0e0ad60
[12353.341771] [<c016c9e8>] (check_usage_forwards) from [<c016d96c>]  
(mark_lock+0x2f8/0x6f0)
[12353.349981]  r8:c0a028e4 r7:c016c9e8 r6:c0e0a840 r5:00000004 r4:c0e0ad60
[12353.356713] [<c016d674>] (mark_lock) from [<c016e8d8>]  
(__lock_acquire+0x590/0x18e0)
[12353.364490]  r10:c0e0a840 r9:c0e1df7c r8:00000024 r7:c163a298  
r6:00000001 r5:c0e0ad60
[12353.372352]  r4:00000411
[12353.374906] [<c016e348>] (__lock_acquire) from [<c01703d8>]  
(lock_acquire+0x70/0x90)
[12353.382683]  r10:0000000a r9:c0e132dc r8:00000001 r7:00000001  
r6:600f0113 r5:00000000
[12353.390543]  r4:ffffe000
[12353.393100] [<c0170368>] (lock_acquire) from [<c092b03c>]  
(_raw_spin_lock_bh+0x4c/0x5c)
[12353.401138]  r8:bf03ecc8 r7:c0e01da8 r6:cbd7b920 r5:bf0400ac r4:caf14988
[12353.407903] [<c092aff0>] (_raw_spin_lock_bh) from [<bf0400ac>]  
(packet_queue_free+0x24/0x84 [wireguard])
[12353.417419]  r5:caf14988 r4:caf14940
[12353.421064] [<bf040088>] (packet_queue_free [wireguard]) from  
[<bf03ed10>] (rcu_release+0x48/0x6c [wireguard])
[12353.431101]  r5:caf14808 r4:caf14e38
[12353.434722] [<bf03ecc8>] (rcu_release [wireguard]) from  
[<c0188fcc>] (rcu_process_callbacks+0x338/0x5d0)
[12353.444239]  r5:caf14e38 r4:cbd7b900
[12353.447841] [<c0188c94>] (rcu_process_callbacks) from [<c012a080>]  
(__do_softirq+0xf0/0x2a0)
[12353.456315]  r10:00000100 r9:c0e020a0 r8:c0e020a4 r7:00000009  
r6:c0e00000 r5:40000001
[12353.464175]  r4:00000000
[12353.466729] [<c0129f90>] (__do_softirq) from [<c012a5dc>]  
(irq_exit+0xe8/0x160)
[12353.474070]  r10:f4000100 r9:c0e1e1e4 r8:cb808400 r7:00000001  
r6:00000000 r5:00000000
[12353.481930]  r4:c0d53c18
[12353.484484] [<c012a4f4>] (irq_exit) from [<c0179794>]  
(__handle_domain_irq+0x60/0xc0)
[12353.492351] [<c0179734>] (__handle_domain_irq) from [<c01014fc>]  
(gic_handle_irq+0x64/0xc4)
[12353.500736]  r9:c0e1e1e4 r8:c0e01ea8 r7:00000000 r6:000003ff  
r5:000003eb r4:f400010c
[12353.508512] [<c0101498>] (gic_handle_irq) from [<c010d230>]  
(__irq_svc+0x70/0x98)
[12353.516025] Exception stack(0xc0e01ea8 to 0xc0e01ef0)
[12353.521101] 1ea0:                   00000001 00000001 00000000  
c0e0a840 00000000 cbd7a4e0
[12353.529313] 1ec0: 0d4e4248 00000b3c 0cba1c80 00000b3c 00000000  
c0e01f24 c0e01ec8 c0e01ef8
[12353.537521] 1ee0: c016df00 c0650398 200f0013 ffffffff
[12353.542597]  r10:00000000 r9:c0e00000 r8:0cba1c80 r7:c0e01edc  
r6:ffffffff r5:200f0013
[12353.550457]  r4:c0650398
[12353.553012] [<c0650210>] (cpuidle_enter_state) from [<c0650500>]  
(cpuidle_enter+0x1c/0x20)
[12353.561309]  r10:c0e01f48 r9:c0e0d1fc r8:c0d534d8 r7:cbd7a4e0  
r6:c0e0756c r5:c0e075b8
[12353.569170]  r4:c0e00000 r3:cbd7a4e0
[12353.572768] [<c06504e4>] (cpuidle_enter) from [<c0165de8>]  
(call_cpuidle+0x28/0x44)
[12353.580460] [<c0165dc0>] (call_cpuidle) from [<c0166008>]  
(do_idle+0x10c/0x1e0)
[12353.587803] [<c0165efc>] (do_idle) from [<c0166464>]  
(cpu_startup_entry+0x20/0x24)
[12353.595406]  r10:c0d3da48 r9:cbfff980 r8:c0e6d000 r7:c0e07540  
r6:c0e6d000 r5:00000002
[12353.603266]  r4:000000bb r3:c0d4c31c
[12353.606864] [<c0166444>] (cpu_startup_entry) from [<c0923564>]  
(rest_init+0x228/0x278)
[12353.614821] [<c092333c>] (rest_init) from [<c0d00cd4>]  
(start_kernel+0x32c/0x3a0)
[12353.622336]  r5:ffffffff r4:c0e6d04c
[12353.625934] [<c0d009a8>] (start_kernel) from [<8000807c>] (0x8000807c)
[12353.769106] wireguard: wg0: Interface deleted




root@utilite:/usr/src/WireGuard# gcc -v
Using built-in specs.
COLLECT_GCC=gcc
COLLECT_LTO_WRAPPER=/usr/lib/gcc/arm-linux-gnueabihf/6/lto-wrapper
Target: arm-linux-gnueabihf
Configured with: ../src/configure -v --with-pkgversion='Debian  
6.3.0-18' --with-bugurl=file:///usr/share/doc/gcc-6/README.Bugs  
--enable-languages=c,ada,c++,java,go,d,fortran,objc,obj-c++  
--prefix=/usr --program-suffix=-6  
--program-prefix=arm-linux-gnueabihf- --enable-shared  
--enable-linker-build-id --libexecdir=/usr/lib  
--without-included-gettext --enable-threads=posix --libdir=/usr/lib  
--enable-nls --with-sysroot=/ --enable-clocale=gnu  
--enable-libstdcxx-debug --enable-libstdcxx-time=yes  
--with-default-libstdcxx-abi=new --enable-gnu-unique-object  
--disable-libitm --disable-libquadmath --enable-plugin  
--enable-default-pie --with-system-zlib --disable-browser-plugin  
--enable-java-awt=gtk --enable-gtk-cairo  
--with-java-home=/usr/lib/jvm/java-1.5.0-gcj-6-armhf/jre  
--enable-java-home  
--with-jvm-root-dir=/usr/lib/jvm/java-1.5.0-gcj-6-armhf  
--with-jvm-jar-dir=/usr/lib/jvm-exports/java-1.5.0-gcj-6-armhf  
--with-arch-directory=arm  
--with-ecj-jar=/usr/share/java/eclipse-ecj.jar  
--with-target-system-zlib --enable-objc-gc=auto --enable-multiarch  
--disable-sjlj-exceptions --with-arch=armv7-a --with-fpu=vfpv3-d16  
--with-float=hard --with-mode=thumb --enable-checking=release  
--build=arm-linux-gnueabihf --host=arm-linux-gnueabihf  
--target=arm-linux-gnueabihf
Thread model: posix
gcc version 6.3.0 20170516 (Debian 6.3.0-18)


root@utilite:/usr/src/WireGuard# lscpu
Architecture:          armv7l
Byte Order:            Little Endian
CPU(s):                4
On-line CPU(s) list:   0-3
Thread(s) per core:    1
Core(s) per socket:    4
Socket(s):             1
Model:                 10
Model name:            ARMv7 Processor rev 10 (v7l)
CPU max MHz:           996.0000
CPU min MHz:           396.0000
BogoMIPS:              3.00
Flags:                 half thumb fastmult vfp edsp neon vfpv3 tls vfpd32


Greats,


René van Dorst.
