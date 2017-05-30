Return-Path: bassbeat@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 597a5737
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 08:46:15 +0000 (UTC)
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac61ad11
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 May 2017 08:46:15 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id 7so82910744wmo.1
 for <wireguard@lists.zx2c4.com>; Tue, 30 May 2017 01:59:13 -0700 (PDT)
Return-Path: <bassbeat@gmail.com>
Received: from pandora.einet.ad.eivd.ch ([193.134.219.70])
 by smtp.gmail.com with ESMTPSA id t57sm8205528edb.28.2017.05.30.01.59.10
 for <wireguard@lists.zx2c4.com>
 (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 30 May 2017 01:59:10 -0700 (PDT)
From: Alexandre Karlov <bassbeat@gmail.com>
Content-Type: text/plain; charset=us-ascii
Subject: Kernel panic on ARM
Message-Id: <61E1F38E-66AB-4AD1-B3B0-79FB42A3B4C8@gmail.com>
Date: Tue, 30 May 2017 10:59:09 +0200
To: wireguard@lists.zx2c4.com
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,=20

I'm currently evaluting the deployment of wireguard on an ARM-based =
32-bit module (AM335x Cortex-A8). After running for some time (5, 10, 20 =
minutes) with some packets regularly going through wg interface, the =
kernel goes in panic mode. I have tried to compile wg as a module as =
well as a patch to the kernel with the end result being the same. The =
kernel version is 4.4.13.

According to netconsole traces it seems to segfault in different places, =
but related to to some irq stuff. I'm joining two netconsole traces and =
will be happy to provide anything useful for debugging.=20

Thanks for the great work on wireguard BTW.=20

Cheers,
Alex


[ 2571.967115] ------------[ cut here ]------------
[ 2571.972045] WARNING: CPU: -844340024 PID: -870604168 at =
kernel/sched/core.c:2960 preempt_count_sub+0xa4/0x130()
[ 2571.982580] DEBUG_LOCKS_WARN_ON(val > preempt_count())
[ 2571.987774] Modules linked in: wireguard(O) xt_hashlimit udp_tunnel =
ip6_udp_tunnel netconsole
[ 2571.997006] CPU: 0 PID: 1480 Comm: i2_app Tainted: G        W  O    =
4.4.13tdma335x #10
[ 2572.005277] Hardware name: Generic AM33XX (Flattened Device Tree)
[ 2572.011673] ---[ end trace 21fe04c5c6b5534c ]---
[ 2572.016522] Alignment trap: not handling instruction e1921f9f at =
[<c0097630>]
[ 2572.023977] Unhandled fault: alignment exception (0x001) at =
0xc098e3cb
[ 2572.030809] Unable to handle kernel paging request at virtual address =
1b000014
[ 2572.038353] pgd =3D cc150000
[ 2572.041187] [1b000014] *pgd=3D00000000
[ 2572.044950] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[ 2572.050504] Modules linked in: wireguard(O) xt_hashlimit udp_tunnel =
ip6_udp_tunnel netconsole
[ 2572.059533] CPU: 0 PID: 1480 Comm: i2_app Tainted: G        W  O    =
4.4.13tdma335x #10
[ 2572.067798] Hardware name: Generic AM33XX (Flattened Device Tree)
[ 2572.074166] task: cdde9f80 ti: cc1b8000 task.ti: cc1b8000
[ 2572.079818] PC is at show_pte+0x2c/0xfc
[ 2572.083834] LR is at do_DataAbort+0x90/0xc8
[ 2572.088210] pc : [<c0026ab4>]    lr : [<c00092a0>]    psr: 200d0193
[ 2572.088210] sp : cc1ba020  ip : cc1ba040  fp : cc1ba03c
[ 2572.100194] r10: cc1ba1d0  r9 : cd82e000  r8 : cc1ba0f0
[ 2572.105652] r7 : c098e3cb  r6 : c0028b8c  r5 : c098e3cb  r4 : =
1afffff4
[ 2572.112474] r3 : c09c3fb8  r2 : 00000002  r1 : c098e3cb  r0 : =
1afffff4
[ 2572.119295] Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  =
Segment none
[ 2572.126837] Control: 10c5387d  Table: 8c160019  DAC: 00000051
[ 2572.132842] Process i2_app (pid: 1480, stack limit =3D 0xcc1b8218)
[ 2572.139115] Stack: (0xcc1ba020 to 0xcc1ba000)
[ 2572.143691] [<c0026ab4>] (show_pte) from [<c00092a0>] =
(do_DataAbort+0x90/0xc8)
[ 2572.151250] [<c00092a0>] (do_DataAbort) from [<c0664a24>] =
(__dabt_svc+0x44/0x80)
[ 2572.158976] Exception stack(0xcc1ba0f0 to 0xcc1ba138)
[ 2572.164265] a0e0:                                     c07c9578 =
c07da9cc c098e3cb c098e3bf
[ 2572.172810] a100: c098e3c0 a00d0193 00000001 00000000 00000001 =
cd82e000 cc1ba1d0 cc1ba154
[ 2572.181353] a120: cc1ba130 cc1ba140 c0300ad0 c0097634 a00d0193 =
ffffffff
[ 2572.188280] [<c0664a24>] (__dabt_svc) from [<c0097634>] =
(rcu_eqs_exit_common.constprop.24+0x40/0x5c)
[ 2572.197824] [<c0097634>] (rcu_eqs_exit_common.constprop.24) from =
[<c00983f0>] (rcu_irq_enter+0x70/0x78)
[ 2572.207651] [<c00983f0>] (rcu_irq_enter) from [<c00463d0>] =
(irq_enter+0x18/0x90)
[ 2572.215388] [<c00463d0>] (irq_enter) from [<c008a830>] =
(__handle_domain_irq+0x5c/0xfc)
[ 2572.223668] [<c008a830>] (__handle_domain_irq) from [<c00094f4>] =
(omap_intc_handle_irq+0x44/0xa0)
[ 2572.232943] [<c00094f4>] (omap_intc_handle_irq) from [<c0664ab8>] =
(__irq_svc+0x58/0x98)
[ 2572.241301] Exception stack(0xcc1ba1d0 to 0xcc1ba218)
[ 2572.246583] a1c0:                                     cdfebdb0 =
400d0113 00000000 c0998498
[ 2572.255130] a1e0: 400d0113 cc654d00 cdfeb800 0000008a cdfebcc0 =
cdfebdb0 400d0113 cc1ba234
[ 2572.263672] a200: cc1ba220 cc1ba220 c06643a8 c06643ac 400d0113 =
ffffffff
[ 2572.270588] [<c0664ab8>] (__irq_svc) from [<c06643ac>] =
(_raw_spin_unlock_irqrestore+0x7c/0x80)
[ 2572.279593] [<c06643ac>] (_raw_spin_unlock_irqrestore) from =
[<c03fd348>] (usbnet_start_xmit+0x2b0/0x6d4)
[ 2572.289509] [<c03fd348>] (usbnet_start_xmit) from [<c053b270>] =
(dev_hard_start_xmit+0x2b8/0x500)
[ 2572.298709] [<c053b270>] (dev_hard_start_xmit) from [<c055d24c>] =
(sch_direct_xmit+0xd4/0x1fc)
[ 2572.307623] [<c055d24c>] (sch_direct_xmit) from [<c053b7f8>] =
(__dev_queue_xmit+0x1d4/0x598)
[ 2572.316352] [<c053b7f8>] (__dev_queue_xmit) from [<c053bbd8>] =
(dev_queue_xmit+0x1c/0x20)
[ 2572.324822] [<c053bbd8>] (dev_queue_xmit) from [<c057bd68>] =
(ip_finish_output2+0x18c/0x3e0)
[ 2572.333553] [<c057bd68>] (ip_finish_output2) from [<c057d92c>] =
(ip_finish_output+0x170/0x21c)
[ 2572.342465] [<c057d92c>] (ip_finish_output) from [<c057e4c8>] =
(ip_output+0x120/0x130)
[ 2572.350649] [<c057e4c8>] (ip_output) from [<c057db6c>] =
(ip_local_out+0x48/0x4c)
[ 2572.358301] [<c057db6c>] (ip_local_out) from [<c05c3b88>] =
(iptunnel_xmit+0x120/0x134)
[ 2572.366518] [<c05c3b88>] (iptunnel_xmit) from [<bf00923c>] =
(udp_tunnel_xmit_skb+0xf0/0xf8 [udp_tunnel])
[ 2572.376388] [<bf00923c>] (udp_tunnel_xmit_skb [udp_tunnel]) from =
[<bf018d6c>] (socket_send_skb_to_peer+0x2b8/0x684 [wireguard])
[ 2572.388412] [<bf018d6c>] (socket_send_skb_to_peer [wireguard]) from =
[<bf0178a8>] (packet_create_data_done+0x60/0x1bc [wireguard])
[ 2572.400609] [<bf0178a8>] (packet_create_data_done [wireguard]) from =
[<bf016c20>] (packet_create_data+0x15c/0x4d0 [wireguard])
[ 2572.412446] [<bf016c20>] (packet_create_data [wireguard]) from =
[<bf0176dc>] (packet_send_queue+0xa8/0x214 [wireguard])
[ 2572.423645] [<bf0176dc>] (packet_send_queue [wireguard]) from =
[<bf0155b4>] (xmit+0x178/0x2d0 [wireguard])
[ 2572.433657] [<bf0155b4>] (xmit [wireguard]) from [<c053b270>] =
(dev_hard_start_xmit+0x2b8/0x500)
[ 2572.442753] [<c053b270>] (dev_hard_start_xmit) from [<c053bb28>] =
(__dev_queue_xmit+0x504/0x598)
[ 2572.451849] [<c053bb28>] (__dev_queue_xmit) from [<c053bbd8>] =
(dev_queue_xmit+0x1c/0x20)
[ 2572.460308] [<c053bbd8>] (dev_queue_xmit) from [<c0544fe0>] =
(neigh_direct_output+0x1c/0x20)
[ 2572.469038] [<c0544fe0>] (neigh_direct_output) from [<c057bd80>] =
(ip_finish_output2+0x1a4/0x3e0)
[ 2572.478223] [<c057bd80>] (ip_finish_output2) from [<c057d92c>] =
(ip_finish_output+0x170/0x21c)
[ 2572.487128] [<c057d92c>] (ip_finish_output) from [<c057e4c8>] =
(ip_output+0x120/0x130)
[ 2572.495312] [<c057e4c8>] (ip_output) from [<c057db6c>] =
(ip_local_out+0x48/0x4c)
[ 2572.502956] [<c057db6c>] (ip_local_out) from [<c057de7c>] =
(ip_queue_xmit+0x158/0x3d0)
[ 2572.511152] [<c057de7c>] (ip_queue_xmit) from [<c0596c78>] =
(tcp_transmit_skb+0x454/0x8e8)
[ 2572.519708] [<c0596c78>] (tcp_transmit_skb) from [<c0598df0>] =
(tcp_send_ack+0x150/0x1a0)
[ 2572.528170] [<c0598df0>] (tcp_send_ack) from [<c058bfe4>] =
(__tcp_ack_snd_check+0x60/0xbc)
[ 2572.536718] [<c058bfe4>] (__tcp_ack_snd_check) from [<c0593a08>] =
(tcp_rcv_established+0x498/0x760)
[ 2572.546082] [<c0593a08>] (tcp_rcv_established) from [<c059cdf8>] =
(tcp_v4_do_rcv+0x154/0x1b4)
[ 2572.554901] [<c059cdf8>] (tcp_v4_do_rcv) from [<c059efc4>] =
(tcp_v4_rcv+0xb8c/0xbe0)
[ 2572.562908] [<c059efc4>] (tcp_v4_rcv) from [<c0578240>] =
(ip_local_deliver_finish+0xbc/0x284)
[ 2572.571732] [<c0578240>] (ip_local_deliver_finish) from [<c05789bc>] =
(ip_local_deliver+0xe8/0xf4)
[ 2572.581005] [<c05789bc>] (ip_local_deliver) from [<c0578580>] =
(ip_rcv_finish+0x178/0x38c)
[ 2572.589557] [<c0578580>] (ip_rcv_finish) from [<c0578d90>] =
(ip_rcv+0x3c8/0x4ac)
[ 2572.597199] [<c0578d90>] (ip_rcv) from [<c0535624>] =
(__netif_receive_skb_core+0x2f8/0x9a0)
[ 2572.605839] [<c0535624>] (__netif_receive_skb_core) from [<c0537d04>] =
(__netif_receive_skb+0x38/0x94)
[ 2572.615473] [<c0537d04>] (__netif_receive_skb) from [<c0537dfc>] =
(process_backlog+0x9c/0x158)
[ 2572.624384] [<c0537dfc>] (process_backlog) from [<c0538568>] =
(net_rx_action+0x284/0x430)
[ 2572.632844] [<c0538568>] (net_rx_action) from [<c0045ec4>] =
(__do_softirq+0x180/0x438)
[ 2572.641029] [<c0045ec4>] (__do_softirq) from [<c00464f0>] =
(irq_exit+0xa8/0xdc)
[ 2572.648579] [<c00464f0>] (irq_exit) from [<c008a864>] =
(__handle_domain_irq+0x90/0xfc)
[ 2572.656772] [<c008a864>] (__handle_domain_irq) from [<c00094f4>] =
(omap_intc_handle_irq+0x44/0xa0)
[ 2572.666047] [<c00094f4>] (omap_intc_handle_irq) from [<c0664ab8>] =
(__irq_svc+0x58/0x98)
[ 2572.674406] Exception stack(0xcc1baee8 to 0xcc1baf30)
[ 2572.679689] aee0:                   cc1bb220 cc1bb658 cc1bb820 =
00000000 00000000 00000000
[ 2572.688235] af00: 036d5439 00c34f61 0168a24a 00000000 cc1bb788 =
cc1baf5c 00000000 cc1baf38
[ 2572.696776] af20: 036d5439 bf01d7d0 400d0013 ffffffff
[ 2572.702084] [<c0664ab8>] (__irq_svc) from [<bf01d7d0>] =
(fproduct+0x4ec/0x58c [wireguard])
[ 2572.710662] [<bf01d7d0>] (fproduct [wireguard]) from [<bf01f3f8>] =
(fmonty+0x638/0xec8 [wireguard])
[ 2572.720058] [<bf01f3f8>] (fmonty [wireguard]) from [<bf020620>] =
(cmult+0x998/0x10d4 [wireguard])
[ 2572.729265] [<bf020620>] (cmult [wireguard]) from [<bf0216a8>] =
(curve25519+0x688/0xc38 [wireguard])
[ 2572.738741] [<bf0216a8>] (curve25519 [wireguard]) from [<bf01479c>] =
(noise_handshake_consume_response+0x1a8/0x42c [wireguard])
[ 2572.750665] [<bf01479c>] (noise_handshake_consume_response =
[wireguard]) from [<bf017ccc>] (receive_handshake_packet+0x2c8/0x52c =
[wireguard])
[ 2572.763856] [<bf017ccc>] (receive_handshake_packet [wireguard]) from =
[<bf017f70>] (packet_process_queued_handshake_packets+0x40/0x68 =
[wireguard])
[ 2572.777496] [<bf017f70>] (packet_process_queued_handshake_packets =
[wireguard]) from [<c005a028>] (process_one_work+0x1fc/0x578)
[ 2572.789487] [<c005a028>] (process_one_work) from [<c005aed8>] =
(worker_thread+0x54/0x52c)
[ 2572.797949] [<c005aed8>] (worker_thread) from [<c00606b4>] =
(kthread+0xec/0x104)
[ 2572.805613] [<c00606b4>] (kthread) from [<c0016850>] =
(ret_from_fork+0x14/0x24)
[ 2572.813168] Code: e34c309c e1a05001 11a04000 01a04003 (e5941020)=20
[ 2572.819555] ---[ end trace 21fe04c5c6b5534d ]---



  836.681511] ------------[ cut here ]------------
[  836.686699] Unable to handle kernel NULL pointer dereference at =
virtual address 000001c8
[  836.695164] Unable to handle kernel NULL pointer dereference at =
virtual address 00000025
[  836.703617] Unable to handle kernel NULL pointer dereference at =
virtual address 00000025
[  836.712078] Unable to handle kernel NULL pointer dereference at =
virtual address 00000025
[  836.720527] Unable to handle kernel NULL pointer dereference at =
virtual address 00000025
[  836.728975] Unable to handle kernel NULL pointer dereference at =
virtual address 00000025
[  836.737424] Unable to handle kernel NULL pointer dereference at =
virtual address 00000025
[  836.745873] Unable to handle kernel NULL pointer dereference at =
virtual address 00000025
[  836.754322] Unable to handle kernel NULL pointer dereference at =
virtual address 00000025
[  836.762774] Unable to handle kernel NULL pointer dereference at =
virtual address 00000025
[  836.771224] Unable to handle kernel NULL pointer dereference at =
virtual address 00000025
[  836.779676] Unable to handle kernel NULL pointer dereference at =
virtual address 00000025
[  836.788126] Unable to handle kernel NULL pointer dereference at =
virtual address 00000025
[  836.796575] Unable to handle kernel NULL pointer dereference at =
virtual address 00000025
[  836.805024] Unable to handle kernel NULL pointer dereference at =
virtual address 00000025
[  836.813472] Unable to handle kernel NULL pointer dereference at =
virtual address 00000025
[  836.821921] Unable to handle kernel NULL pointer dereference at =
virtual address 00000025
[  836.830369] Unable to handle kernel NULL pointer dereference at =
virtual address 00000025
[  836.838820] Unable to handle kernel NULL pointer dereference at =
virtual address 00000025
[  836.847325] Unable to handle kernel NULL pointer dereference at =
virtual address 000001c8
[  836.855777] pgd =3D cb928000
[  836.858610] [000001c8] *pgd=3D8b9c9831, *pte=3D00000000, =
*ppte=3D00000000
[  836.865252] Internal error: Oops: 17 [#1] PREEMPT SMP ARM
[  836.870896] Modules linked in: wireguard(O) xt_hashlimit udp_tunnel =
ip6_udp_tunnel netconsole
[  836.879932] CPU: 0 PID: 3898 Comm: i2_app Tainted: G        W  O    =
4.4.13tdma335x #10
[  836.888198] Hardware name: Generic AM33XX (Flattened Device Tree)
[  836.894566] task: cb983480 ti: cbe68000 task.ti: cbe68000
[  836.900224] PC is at do_page_fault+0x48/0x44c
[  836.904782] LR is at do_page_fault+0x1f8/0x44c
[  836.909429] pc : [<c0665230>]    lr : [<c06653e0>]    psr: 20010193
[  836.909429] sp : cbe6a108  ip : cbe6a108  fp : cbe6a15c
[  836.921416] r10: cbe7c000  r9 : ffffe000  r8 : cbe6a210
[  836.926875] r7 : 000001c8  r6 : 00000017  r5 : 00000000  r4 : =
cbe6a210
[  836.933693] r3 : 20010193  r2 : cbe6a000  r1 : c07db0b4  r0 : =
00000001
[  836.940511] Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  =
Segment none
[  836.948053] Control: 10c5387d  Table: 8bd88019  DAC: 00000051
[  836.954054] Process i2_app (pid: 3898, stack limit =3D 0xcbe68218)
[  836.960326] Stack: (0xcbe6a108 to 0xcbe6a000)
[  836.964906] [<c0665230>] (do_page_fault) from [<c000925c>] =
(do_DataAbort+0x4c/0xc8)
[  836.972933] [<c000925c>] (do_DataAbort) from [<c0664a24>] =
(__dabt_svc+0x44/0x80)
[  836.980658] Exception stack(0xcbe6a210 to 0xcbe6a258)
[  836.985939] a200:                                     00000001 =
c07db0b4 cbe6a000 20010193
[  836.994486] a220: cbe6a368 00000000 00000017 000001c8 cbe6a368 =
ffffe000 cbe7c000 cbe6a2b4
[  837.003029] a240: cbe6a260 cbe6a260 c06653e0 c0665230 20010193 =
ffffffff
[  837.009944] [<c0664a24>] (__dabt_svc) from [<c0665230>] =
(do_page_fault+0x48/0x44c)
[  837.017860] [<c0665230>] (do_page_fault) from [<c000925c>] =
(do_DataAbort+0x4c/0xc8)
[  837.025865] [<c000925c>] (do_DataAbort) from [<c0664a24>] =
(__dabt_svc+0x44/0x80)
[  837.033592] Exception stack(0xcbe6a368 to 0xcbe6a3b0)
[  837.038875] a360:                   00000001 c07db0b4 cbe6a000 =
20010193 cbe6a4c0 00000000
[  837.047420] a380: 00000017 000001c8 cbe6a4c0 ffffe000 cbe7c000 =
cbe6a40c cbe6a3b8 cbe6a3b8
[  837.055958] a3a0: c06653e0 c0665230 20010193 ffffffff
[  837.061243] [<c0664a24>] (__dabt_svc) from [<c0665230>] =
(do_page_fault+0x48/0x44c)
[  837.069155] [<c0665230>] (do_page_fault) from [<c000925c>] =
(do_DataAbort+0x4c/0xc8)
[  837.077158] [<c000925c>] (do_DataAbort) from [<c0664a24>] =
(__dabt_svc+0x44/0x80)
[  837.084879] Exception stack(0xcbe6a4c0 to 0xcbe6a508)
[  837.090168] a4c0: 00000001 c07db0b4 cbe6a000 20010193 cbe6a618 =
00000000 00000017 000001c8
[  837.098713] a4e0: cbe6a618 ffffe000 cbe7c000 cbe6a564 cbe6a510 =
cbe6a510 c06653e0 c0665230
[  837.107253] a500: 20010193 ffffffff
[  837.110908] [<c0664a24>] (__dabt_svc) from [<c0665230>] =
(do_page_fault+0x48/0x44c)
[  837.118818] [<c0665230>] (do_page_fault) from [<c000925c>] =
(do_DataAbort+0x4c/0xc8)
[  837.126820] [<c000925c>] (do_DataAbort) from [<c0664a24>] =
(__dabt_svc+0x44/0x80)
[  837.134543] Exception stack(0xcbe6a618 to 0xcbe6a660)
[  837.139822] a600:                                                     =
  00000001 c07db0b4
[  837.148369] a620: cbe6a000 20010193 cbe6a770 00000000 00000017 =
000001c8 cbe6a770 ffffe000
[  837.156916] a640: cbe7c000 cbe6a6bc cbe6a668 cbe6a668 c06653e0 =
c0665230 20010193 ffffffff
[  837.165461] [<c0664a24>] (__dabt_svc) from [<c0665230>] =
(do_page_fault+0x48/0x44c)
[  837.173375] [<c0665230>] (do_page_fault) from [<c000925c>] =
(do_DataAbort+0x4c/0xc8)
[  837.181376] [<c000925c>] (do_DataAbort) from [<c0664a24>] =
(__dabt_svc+0x44/0x80)
[  837.189098] Exception stack(0xcbe6a770 to 0xcbe6a7b8)
[  837.194380] a760:                                     00000001 =
c07db0b4 cbe6a000 20010193
[  837.202926] a780: cbe6a8c8 00000000 00000017 000001c8 cbe6a8c8 =
ffffe000 cbe7c000 cbe6a814
[  837.211474] a7a0: cbe6a7c0 cbe6a7c0 c06653e0 c0665230 20010193 =
ffffffff
[  837.218392] [<c0664a24>] (__dabt_svc) from [<c0665230>] =
(do_page_fault+0x48/0x44c)
[  837.226307] [<c0665230>] (do_page_fault) from [<c000925c>] =
(do_DataAbort+0x4c/0xc8)
[  837.234310] [<c000925c>] (do_DataAbort) from [<c0664a24>] =
(__dabt_svc+0x44/0x80)
[  837.242033] Exception stack(0xcbe6a8c8 to 0xcbe6a910)
[  837.247316] a8c0:                   00000001 c07db0b4 cbe6a000 =
20010193 cbe6aa20 00000000
[  837.255862] a8e0: 00000017 000001c8 cbe6aa20 ffffe000 cbe7c000 =
cbe6a96c cbe6a918 cbe6a918
[  837.264402] a900: c06653e0 c0665230 20010193 ffffffff
[  837.269692] [<c0664a24>] (__dabt_svc) from [<c0665230>] =
(do_page_fault+0x48/0x44c)
[  837.277606] [<c0665230>] (do_page_fault) from [<c000925c>] =
(do_DataAbort+0x4c/0xc8)
[  837.285611] [<c000925c>] (do_DataAbort) from [<c0664a24>] =
(__dabt_svc+0x44/0x80)
[  837.293336] Exception stack(0xcbe6aa20 to 0xcbe6aa68)
[  837.298623] aa20: 00000001 c07db0b4 cbe6a000 20010193 cbe6ab78 =
00000000 00000017 000001c8
[  837.307166] aa40: cbe6ab78 ffffe000 cbe7c000 cbe6aac4 cbe6aa70 =
cbe6aa70 c06653e0 c0665230
[  837.315703] aa60: 20010193 ffffffff
[  837.319364] [<c0664a24>] (__dabt_svc) from [<c0665230>] =
(do_page_fault+0x48/0x44c)
[  837.327281] [<c0665230>] (do_page_fault) from [<c000925c>] =
(do_DataAbort+0x4c/0xc8)
[  837.335282] [<c000925c>] (do_DataAbort) from [<c0664a24>] =
(__dabt_svc+0x44/0x80)
[  837.343004] Exception stack(0xcbe6ab78 to 0xcbe6abc0)
[  837.348281] ab60:                                                     =
  00000001 c07db0b4
[  837.356826] ab80: cbe6a000 20010193 cbe6acd0 00000000 00000017 =
000001c8 cbe6acd0 ffffe000
[  837.365368] aba0: cbe7c000 cbe6ac1c cbe6abc8 cbe6abc8 c06653e0 =
c0665230 20010193 ffffffff
[  837.373911] [<c0664a24>] (__dabt_svc) from [<c0665230>] =
(do_page_fault+0x48/0x44c)
[  837.381822] Code: e1a0200d e0022009 e3130080 e592500c (e59581c8)=20
[  837.388213] ---[ end trace 21fe04c5c6b5534c ]---=
