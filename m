Return-Path: opensource@vdorst.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a99f27af
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 12:19:46 +0000 (UTC)
Received: from smtp01.bhosted.nl (smtp01.bhosted.nl [94.124.121.11])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ffdfa162
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 12:19:46 +0000 (UTC)
Date: Wed, 11 Oct 2017 12:49:35 +0000
Message-ID: <20171011124935.Horde.WT_JO7z6wRK6_tlxjtJxnSr@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: possible irq lock inversion dependency detected
References: <20171010185133.Horde.g9yJlkVpxW5Gk-qJumftGF_@www.vdorst.com>
 <CAHmME9rtGod=Jw-vGKnUfPwDh+16zP1MjNr57+8k5PUVMhxtYA@mail.gmail.com>
In-Reply-To: <CAHmME9rtGod=Jw-vGKnUfPwDh+16zP1MjNr57+8k5PUVMhxtYA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Quoting "Jason A. Donenfeld" <Jason@zx2c4.com>:

> Hi René,
>
> Are you able to reliably reproduce this? If so, could you let me know
> if this patch fixes it?
>
> https://git.zx2c4.com/WireGuard/patch/?id=940317ee52d020fc3e19e3a9f615acbc715985d5
>
> Jason

Hi Jason,

I am not able to reproduce it but it found a other one, hit it 3 times.
Occurs also while closing a tunnel.

Last bug was 3x reproduce after every reboot and running 'wg-quick up  
wg0 && iperf3 -Z -c 10.0.0.1 && wg-quick down wg0'.

So I am not sure if you patch works or not.
Because it was not that easy to reproduce the last one.



DMESG first:



[Wed Oct 11 09:48:35 2017] wireguard: wg0: Peer 1  
(192.168.2.222:36464) destroyed

[Wed Oct 11 09:48:35 2017]  
========================================================
[Wed Oct 11 09:48:35 2017] WARNING: possible irq lock inversion  
dependency detected
[Wed Oct 11 09:48:35 2017] 4.13.5-dirty #16 Tainted: G           O
[Wed Oct 11 09:48:35 2017]  
--------------------------------------------------------
[Wed Oct 11 09:48:35 2017] swapper/3/0 just changed the state of lock:
[Wed Oct 11 09:48:35 2017]  (&(&r->consumer_lock)->rlock){+.-...}, at:  
[<bf1350ac>] packet_queue_free+0x24/0x84 [wireguard]
[Wed Oct 11 09:48:35 2017] but this lock took another, SOFTIRQ-unsafe  
lock in the past:
[Wed Oct 11 09:48:35 2017]  (&syncp->seq#7){+.+...}
[Wed Oct 11 09:48:35 2017]

                             and interrupts could create inverse lock  
ordering between them.

[Wed Oct 11 09:48:35 2017]
                             other info that might help us debug this:
[Wed Oct 11 09:48:35 2017]  Possible interrupt unsafe locking scenario:

[Wed Oct 11 09:48:35 2017]        CPU0                    CPU1
[Wed Oct 11 09:48:35 2017]        ----                    ----
[Wed Oct 11 09:48:35 2017]   lock(&syncp->seq#7);
[Wed Oct 11 09:48:35 2017]                                local_irq_disable();
[Wed Oct 11 09:48:35 2017]                                 
lock(&(&r->consumer_lock)->rlock);
[Wed Oct 11 09:48:35 2017]                                lock(&syncp->seq#7);
[Wed Oct 11 09:48:35 2017]   <Interrupt>
[Wed Oct 11 09:48:35 2017]     lock(&(&r->consumer_lock)->rlock);
[Wed Oct 11 09:48:35 2017]
                              *** DEADLOCK ***

[Wed Oct 11 09:48:35 2017] 1 lock held by swapper/3/0:
[Wed Oct 11 09:48:35 2017]  #0:  (rcu_callback){......}, at:  
[<c0188e90>] rcu_process_callbacks+0x2fc/0x5d0
[Wed Oct 11 09:48:35 2017]
                             the shortest dependencies between 2nd  
lock and 1st lock:
[Wed Oct 11 09:48:35 2017]  -> (&syncp->seq#7){+.+...} ops: 419515 {
[Wed Oct 11 09:48:35 2017]     HARDIRQ-ON-W at:
[Wed Oct 11 09:48:35 2017]                       lock_acquire+0x70/0x90
[Wed Oct 11 09:48:35 2017]                       iptunnel_xmit+0x174/0x1e0
[Wed Oct 11 09:48:35 2017]                       udp_tunnel_xmit_skb+0xe8/0xf0
[Wed Oct 11 09:48:35 2017]                        
socket_send_skb_to_peer+0x400/0x830 [wireguard]
[Wed Oct 11 09:48:35 2017]                        
socket_send_buffer_to_peer+0x74/0x84 [wireguard]
[Wed Oct 11 09:48:35 2017]                        
packet_send_handshake_initiation+0xb8/0xf8 [wireguard]
[Wed Oct 11 09:48:35 2017]                        
packet_handshake_send_worker+0x18/0x24 [wireguard]
[Wed Oct 11 09:48:35 2017]                       process_one_work+0x24c/0x4e8
[Wed Oct 11 09:48:35 2017]                       worker_thread+0x40/0x574
[Wed Oct 11 09:48:35 2017]                       kthread+0x120/0x160
[Wed Oct 11 09:48:35 2017]                       ret_from_fork+0x14/0x24
[Wed Oct 11 09:48:35 2017]     SOFTIRQ-ON-W at:
[Wed Oct 11 09:48:35 2017]                       lock_acquire+0x70/0x90
[Wed Oct 11 09:48:35 2017]                        
receive_handshake_packet+0x114/0x3f0 [wireguard]
[Wed Oct 11 09:48:35 2017]                        
packet_handshake_receive_worker+0x1c/0x44 [wireguard]
[Wed Oct 11 09:48:35 2017]                       process_one_work+0x24c/0x4e8
[Wed Oct 11 09:48:35 2017]                       worker_thread+0x40/0x574
[Wed Oct 11 09:48:35 2017]                       kthread+0x120/0x160
[Wed Oct 11 09:48:35 2017]                       ret_from_fork+0x14/0x24
[Wed Oct 11 09:48:35 2017]     INITIAL USE at:
[Wed Oct 11 09:48:35 2017]                      lock_acquire+0x70/0x90
[Wed Oct 11 09:48:35 2017]                       
ip_tunnel_get_stats64+0x148/0x190
[Wed Oct 11 09:48:35 2017]                      dev_get_stats+0x40/0xb4
[Wed Oct 11 09:48:35 2017]                      rtnl_fill_stats+0x38/0x120
[Wed Oct 11 09:48:35 2017]                      rtnl_fill_ifinfo+0x508/0xe00
[Wed Oct 11 09:48:35 2017]                       
rtmsg_ifinfo_build_skb+0x70/0xe0
[Wed Oct 11 09:48:35 2017]                       
rtmsg_ifinfo_event.part.7+0x1c/0x4c
[Wed Oct 11 09:48:35 2017]                      rtmsg_ifinfo+0x30/0x38
[Wed Oct 11 09:48:35 2017]                      __dev_notify_flags+0x94/0xa4
[Wed Oct 11 09:48:35 2017]                      rtnl_configure_link+0x80/0xa4
[Wed Oct 11 09:48:35 2017]                      rtnl_newlink+0x64c/0x748
[Wed Oct 11 09:48:35 2017]                      rtnetlink_rcv_msg+0x94/0x1f4
[Wed Oct 11 09:48:35 2017]                      netlink_rcv_skb+0xe0/0x100
[Wed Oct 11 09:48:35 2017]                      rtnetlink_rcv+0x28/0x38
[Wed Oct 11 09:48:35 2017]                      netlink_unicast+0x184/0x26c
[Wed Oct 11 09:48:35 2017]                      netlink_sendmsg+0x29c/0x378
[Wed Oct 11 09:48:35 2017]                      sock_sendmsg+0x1c/0x2c
[Wed Oct 11 09:48:35 2017]                      ___sys_sendmsg+0x214/0x22c
[Wed Oct 11 09:48:35 2017]                      __sys_sendmsg+0x48/0x74
[Wed Oct 11 09:48:35 2017]                      SyS_sendmsg+0x10/0x14
[Wed Oct 11 09:48:35 2017]                      ret_fast_syscall+0x0/0x1c
[Wed Oct 11 09:48:35 2017]   }
[Wed Oct 11 09:48:35 2017]   ... key      at: [<bf1535b8>]  
__key.33453+0x0/0xffffba48 [wireguard]
[Wed Oct 11 09:48:35 2017]   ... acquired at:
[Wed Oct 11 09:48:35 2017]    iptunnel_xmit+0x174/0x1e0
[Wed Oct 11 09:48:35 2017]    udp_tunnel_xmit_skb+0xe8/0xf0
[Wed Oct 11 09:48:35 2017]    socket_send_skb_to_peer+0x400/0x830 [wireguard]
[Wed Oct 11 09:48:35 2017]    packet_tx_worker+0xc8/0x3e4 [wireguard]
[Wed Oct 11 09:48:35 2017]    process_one_work+0x24c/0x4e8
[Wed Oct 11 09:48:35 2017]    worker_thread+0x40/0x574
[Wed Oct 11 09:48:35 2017]    kthread+0x120/0x160
[Wed Oct 11 09:48:35 2017]    ret_from_fork+0x14/0x24

[Wed Oct 11 09:48:35 2017] -> (&(&r->consumer_lock)->rlock){+.-...}  
ops: 134865 {
[Wed Oct 11 09:48:35 2017]    HARDIRQ-ON-W at:
[Wed Oct 11 09:48:35 2017]                     lock_acquire+0x70/0x90
[Wed Oct 11 09:48:35 2017]                     _raw_spin_lock_bh+0x4c/0x5c
[Wed Oct 11 09:48:35 2017]                      
packet_encrypt_worker+0x2c/0x574 [wireguard]
[Wed Oct 11 09:48:35 2017]                     process_one_work+0x24c/0x4e8
[Wed Oct 11 09:48:35 2017]                     worker_thread+0x40/0x574
[Wed Oct 11 09:48:35 2017]                     kthread+0x120/0x160
[Wed Oct 11 09:48:35 2017]                     ret_from_fork+0x14/0x24
[Wed Oct 11 09:48:35 2017]    IN-SOFTIRQ-W at:
[Wed Oct 11 09:48:35 2017]                     lock_acquire+0x70/0x90
[Wed Oct 11 09:48:35 2017]                     _raw_spin_lock_bh+0x4c/0x5c
[Wed Oct 11 09:48:35 2017]                      
packet_queue_free+0x24/0x84 [wireguard]
[Wed Oct 11 09:48:35 2017]                     rcu_release+0x48/0x6c  
[wireguard]
[Wed Oct 11 09:48:35 2017]                      
rcu_process_callbacks+0x338/0x5d0
[Wed Oct 11 09:48:35 2017]                     __do_softirq+0xf0/0x2a0
[Wed Oct 11 09:48:35 2017]                     irq_exit+0xe8/0x160
[Wed Oct 11 09:48:35 2017]                     __handle_domain_irq+0x60/0xc0
[Wed Oct 11 09:48:35 2017]                     gic_handle_irq+0x64/0xc4
[Wed Oct 11 09:48:35 2017]                     __irq_svc+0x70/0x98
[Wed Oct 11 09:48:35 2017]                     cpuidle_enter_state+0x188/0x2b0
[Wed Oct 11 09:48:35 2017]                     cpuidle_enter+0x1c/0x20
[Wed Oct 11 09:48:35 2017]                     call_cpuidle+0x28/0x44
[Wed Oct 11 09:48:35 2017]                     do_idle+0x10c/0x1e0
[Wed Oct 11 09:48:35 2017]                     cpu_startup_entry+0x20/0x24
[Wed Oct 11 09:48:35 2017]                      
secondary_start_kernel+0x148/0x174
[Wed Oct 11 09:48:35 2017]                     0x801015ec
[Wed Oct 11 09:48:35 2017]    INITIAL USE at:
[Wed Oct 11 09:48:35 2017]                    lock_acquire+0x70/0x90
[Wed Oct 11 09:48:35 2017]                    _raw_spin_lock_bh+0x4c/0x5c
[Wed Oct 11 09:48:35 2017]                     
packet_encrypt_worker+0x2c/0x574 [wireguard]
[Wed Oct 11 09:48:35 2017]                    process_one_work+0x24c/0x4e8
[Wed Oct 11 09:48:35 2017]                    worker_thread+0x40/0x574
[Wed Oct 11 09:48:35 2017]                    kthread+0x120/0x160
[Wed Oct 11 09:48:35 2017]                    ret_from_fork+0x14/0x24
[Wed Oct 11 09:48:35 2017]  }
[Wed Oct 11 09:48:35 2017]  ... key      at: [<bf153640>]  
__key.48712+0x0/0xffffb9c0 [wireguard]
[Wed Oct 11 09:48:35 2017]  ... acquired at:
[Wed Oct 11 09:48:35 2017]    mark_lock+0x2f8/0x6f0
[Wed Oct 11 09:48:35 2017]    __lock_acquire+0x590/0x18e0
[Wed Oct 11 09:48:35 2017]    lock_acquire+0x70/0x90
[Wed Oct 11 09:48:35 2017]    _raw_spin_lock_bh+0x4c/0x5c
[Wed Oct 11 09:48:35 2017]    packet_queue_free+0x24/0x84 [wireguard]
[Wed Oct 11 09:48:35 2017]    rcu_release+0x48/0x6c [wireguard]
[Wed Oct 11 09:48:35 2017]    rcu_process_callbacks+0x338/0x5d0
[Wed Oct 11 09:48:35 2017]    __do_softirq+0xf0/0x2a0
[Wed Oct 11 09:48:35 2017]    irq_exit+0xe8/0x160
[Wed Oct 11 09:48:35 2017]    __handle_domain_irq+0x60/0xc0
[Wed Oct 11 09:48:35 2017]    gic_handle_irq+0x64/0xc4
[Wed Oct 11 09:48:35 2017]    __irq_svc+0x70/0x98
[Wed Oct 11 09:48:35 2017]    cpuidle_enter_state+0x188/0x2b0
[Wed Oct 11 09:48:35 2017]    cpuidle_enter+0x1c/0x20
[Wed Oct 11 09:48:35 2017]    call_cpuidle+0x28/0x44
[Wed Oct 11 09:48:35 2017]    do_idle+0x10c/0x1e0
[Wed Oct 11 09:48:35 2017]    cpu_startup_entry+0x20/0x24
[Wed Oct 11 09:48:35 2017]    secondary_start_kernel+0x148/0x174
[Wed Oct 11 09:48:35 2017]    0x801015ec

[Wed Oct 11 09:48:35 2017]
                             stack backtrace:
[Wed Oct 11 09:48:35 2017] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G     
        O    4.13.5-dirty #16
[Wed Oct 11 09:48:35 2017] Hardware name: Freescale i.MX6  
Quad/DualLite (Device Tree)
[Wed Oct 11 09:48:35 2017] Backtrace:
[Wed Oct 11 09:48:35 2017] [<c010c3b8>] (dump_backtrace) from  
[<c010c664>] (show_stack+0x18/0x1c)
[Wed Oct 11 09:48:35 2017]  r7:00000000 r6:60010193 r5:00000000 r4:c0e69be0
[Wed Oct 11 09:48:35 2017] [<c010c64c>] (show_stack) from [<c090c8d8>]  
(dump_stack+0xb4/0xe8)
[Wed Oct 11 09:48:35 2017] [<c090c824>] (dump_stack) from [<c016c874>]  
(print_irq_inversion_bug+0x1a0/0x214)
[Wed Oct 11 09:48:35 2017]  r9:00000004 r8:00000000 r7:c0ea3464  
r6:cb879980 r5:c0ea3464 r4:cb885c34
[Wed Oct 11 09:48:35 2017] [<c016c6d4>] (print_irq_inversion_bug) from  
[<c016c998>] (check_usage_forwards+0xb0/0x120)
[Wed Oct 11 09:48:35 2017]  r9:00000004 r8:00000001 r7:c0bbc72c  
r6:cb879980 r5:00000006 r4:cb879ea0
[Wed Oct 11 09:48:35 2017] [<c016c8e8>] (check_usage_forwards) from  
[<c016d86c>] (mark_lock+0x2f8/0x6f0)
[Wed Oct 11 09:48:35 2017]  r8:c0a028e8 r7:c016c8e8 r6:cb879980  
r5:00000004 r4:cb879ea0
[Wed Oct 11 09:48:35 2017] [<c016d574>] (mark_lock) from [<c016e7d8>]  
(__lock_acquire+0x590/0x18e0)
[Wed Oct 11 09:48:35 2017]  r10:cb879980 r9:c0e1de7c r8:00000024  
r7:c163a298 r6:00000001 r5:cb879ea0
[Wed Oct 11 09:48:35 2017]  r4:0000042e
[Wed Oct 11 09:48:35 2017] [<c016e248>] (__lock_acquire) from  
[<c01702d8>] (lock_acquire+0x70/0x90)
[Wed Oct 11 09:48:35 2017]  r10:0000000a r9:c0e1325c r8:00000001  
r7:00000001 r6:60010113 r5:00000000
[Wed Oct 11 09:48:35 2017]  r4:ffffe000
[Wed Oct 11 09:48:35 2017] [<c0170268>] (lock_acquire) from  
[<c09280bc>] (_raw_spin_lock_bh+0x4c/0x5c)
[Wed Oct 11 09:48:35 2017]  r8:bf133cc8 r7:cb885e00 r6:cbdab920  
r5:bf1350ac r4:cb3a2188
[Wed Oct 11 09:48:35 2017] [<c0928070>] (_raw_spin_lock_bh) from  
[<bf1350ac>] (packet_queue_free+0x24/0x84 [wireguard])
[Wed Oct 11 09:48:35 2017]  r5:cb3a2188 r4:cb3a2140
[Wed Oct 11 09:48:35 2017] [<bf135088>] (packet_queue_free  
[wireguard]) from [<bf133d10>] (rcu_release+0x48/0x6c [wireguard])
[Wed Oct 11 09:48:35 2017]  r5:cb3a2008 r4:cb3a2638
[Wed Oct 11 09:48:35 2017] [<bf133cc8>] (rcu_release [wireguard]) from  
[<c0188ecc>] (rcu_process_callbacks+0x338/0x5d0)
[Wed Oct 11 09:48:35 2017]  r5:cb3a2638 r4:cbdab900
[Wed Oct 11 09:48:35 2017] [<c0188b94>] (rcu_process_callbacks) from  
[<c012a080>] (__do_softirq+0xf0/0x2a0)
[Wed Oct 11 09:48:35 2017]  r10:00000100 r9:c0e020a0 r8:c0e020a4  
r7:00000009 r6:cb884000 r5:40000001
[Wed Oct 11 09:48:35 2017]  r4:00000000
[Wed Oct 11 09:48:35 2017] [<c0129f90>] (__do_softirq) from  
[<c012a5dc>] (irq_exit+0xe8/0x160)
[Wed Oct 11 09:48:35 2017]  r10:f4000100 r9:c0e1e0e4 r8:cb808400  
r7:00000001 r6:00000000 r5:00000000
[Wed Oct 11 09:48:35 2017]  r4:c0d53c18
[Wed Oct 11 09:48:35 2017] [<c012a4f4>] (irq_exit) from [<c0179694>]  
(__handle_domain_irq+0x60/0xc0)
[Wed Oct 11 09:48:35 2017] [<c0179634>] (__handle_domain_irq) from  
[<c01014fc>] (gic_handle_irq+0x64/0xc4)
[Wed Oct 11 09:48:35 2017]  r9:c0e1e0e4 r8:cb885f00 r7:00000000  
r6:000003ff r5:000003eb r4:f400010c
[Wed Oct 11 09:48:35 2017] [<c0101498>] (gic_handle_irq) from  
[<c010d230>] (__irq_svc+0x70/0x98)
[Wed Oct 11 09:48:36 2017] Exception stack(0xcb885f00 to 0xcb885f48)
[Wed Oct 11 09:48:36 2017] 5f00: 00000001 00000001 00000000 cb879980  
00000000 cbdaa4e0 173a2208 000026ee
[Wed Oct 11 09:48:36 2017] 5f20: 16a377b8 000026ee 00000000 cb885f7c  
cb885f20 cb885f50 c016de00 c064d0c8
[Wed Oct 11 09:48:36 2017] 5f40: 20010013 ffffffff
[Wed Oct 11 09:48:36 2017]  r10:00000000 r9:cb884000 r8:16a377b8  
r7:cb885f34 r6:ffffffff r5:20010013
[Wed Oct 11 09:48:36 2017]  r4:c064d0c8
[Wed Oct 11 09:48:36 2017] [<c064cf40>] (cpuidle_enter_state) from  
[<c064d230>] (cpuidle_enter+0x1c/0x20)
[Wed Oct 11 09:48:36 2017]  r10:cb885fa0 r9:c0e0d1fc r8:c0d534d8  
r7:cbdaa4e0 r6:c0e0756c r5:c0e075b8
[Wed Oct 11 09:48:36 2017]  r4:cb884000 r3:cbdaa4e0
[Wed Oct 11 09:48:36 2017] [<c064d214>] (cpuidle_enter) from  
[<c0165ce8>] (call_cpuidle+0x28/0x44)
[Wed Oct 11 09:48:36 2017] [<c0165cc0>] (call_cpuidle) from  
[<c0165f08>] (do_idle+0x10c/0x1e0)
[Wed Oct 11 09:48:36 2017] [<c0165dfc>] (do_idle) from [<c0166364>]  
(cpu_startup_entry+0x20/0x24)
[Wed Oct 11 09:48:36 2017]  r10:00000000 r9:412fc09a r8:8000406a  
r7:c0e6d2d0 r6:10c0387d r5:00000003
[Wed Oct 11 09:48:36 2017]  r4:00000084 r3:cb879980
[Wed Oct 11 09:48:36 2017] [<c0166344>] (cpu_startup_entry) from  
[<c010f4e8>] (secondary_start_kernel+0x148/0x174)
[Wed Oct 11 09:48:36 2017] [<c010f3a0>] (secondary_start_kernel) from  
[<801015ec>] (0x801015ec)
[Wed Oct 11 09:48:36 2017]  r5:00000051 r4:8b86c06a
[Wed Oct 11 09:48:36 2017] wireguard: wg0: Interface deleted



DMESG second:


[   72.876333] ========================================================
[   72.882714] WARNING: possible irq lock inversion dependency detected
[   72.889097] 4.13.5-dirty #16 Tainted: G           O
[   72.894256] --------------------------------------------------------
[   72.900634] swapper/2/0 just changed the state of lock:
[   72.905878]  (&(&r->consumer_lock)->rlock){+.-...}, at:  
[<bf0400ac>] packet_queue_free+0x24/0x84 [wireguard]
[   72.915824] but this lock took another, SOFTIRQ-unsafe lock in the past:
[   72.922549]  (&syncp->seq#7){+.+...}
[   72.922570]

                 and interrupts could create inverse lock ordering  
between them.

[   72.937601]
                 other info that might help us debug this:
[   72.944166]  Possible interrupt unsafe locking scenario:

[   72.950990]        CPU0                    CPU1
[   72.955544]        ----                    ----
[   72.960097]   lock(&syncp->seq#7);
[   72.963531]                                local_irq_disable();
[   72.969477]                                 
lock(&(&r->consumer_lock)->rlock);
[   72.976647]                                lock(&syncp->seq#7);
[   72.982604]   <Interrupt>
[   72.985242]     lock(&(&r->consumer_lock)->rlock);
[   72.990064]
                  *** DEADLOCK ***

[   72.996029] 1 lock held by swapper/2/0:
[   72.999886]  #0:  (rcu_callback){......}, at: [<c0188e90>]  
rcu_process_callbacks+0x2fc/0x5d0
[   73.008394]
                 the shortest dependencies between 2nd lock and 1st lock:
[   73.016265]  -> (&syncp->seq#7){+.+...} ops: 218091 {
[   73.021368]     HARDIRQ-ON-W at:
[   73.024637]                       lock_acquire+0x70/0x90
[   73.029988]                       iptunnel_xmit+0x174/0x1e0
[   73.035597]                       udp_tunnel_xmit_skb+0xe8/0xf0
[   73.041588]                        
socket_send_skb_to_peer+0x400/0x830 [wireguard]
[   73.049147]                        
socket_send_buffer_to_peer+0x74/0x84 [wireguard]
[   73.056789]                        
packet_send_handshake_initiation+0xb8/0xf8 [wireguard]
[   73.064949]                        
packet_handshake_send_worker+0x18/0x24 [wireguard]
[   73.072740]                       process_one_work+0x24c/0x4e8
[   73.078607]                       worker_thread+0x40/0x574
[   73.084124]                       kthread+0x120/0x160
[   73.089211]                       ret_from_fork+0x14/0x24
[   73.094638]     SOFTIRQ-ON-W at:
[   73.097901]                       lock_acquire+0x70/0x90
[   73.103278]                        
receive_handshake_packet+0x114/0x3f0 [wireguard]
[   73.110920]                        
packet_handshake_receive_worker+0x1c/0x44 [wireguard]
[   73.118973]                       process_one_work+0x24c/0x4e8
[   73.124838]                       worker_thread+0x40/0x574
[   73.130351]                       kthread+0x120/0x160
[   73.135436]                       ret_from_fork+0x14/0x24
[   73.140862]     INITIAL USE at:
[   73.144037]                      lock_acquire+0x70/0x90
[   73.149296]                      ip_tunnel_get_stats64+0x148/0x190
[   73.155513]                      dev_get_stats+0x40/0xb4
[   73.160862]                      rtnl_fill_stats+0x38/0x120
[   73.166468]                      rtnl_fill_ifinfo+0x508/0xe00
[   73.172248]                      rtmsg_ifinfo_build_skb+0x70/0xe0
[   73.178376]                      rtmsg_ifinfo_event.part.7+0x1c/0x4c
[   73.184764]                      rtmsg_ifinfo+0x30/0x38
[   73.190022]                      __dev_notify_flags+0x94/0xa4
[   73.195800]                      rtnl_configure_link+0x80/0xa4
[   73.201662]                      rtnl_newlink+0x64c/0x748
[   73.207091]                      rtnetlink_rcv_msg+0x94/0x1f4
[   73.212871]                      netlink_rcv_skb+0xe0/0x100
[   73.218475]                      rtnetlink_rcv+0x28/0x38
[   73.223816]                      netlink_unicast+0x184/0x26c
[   73.229505]                      netlink_sendmsg+0x29c/0x378
[   73.235200]                      sock_sendmsg+0x1c/0x2c
[   73.240454]                      ___sys_sendmsg+0x214/0x22c
[   73.246057]                      __sys_sendmsg+0x48/0x74
[   73.251399]                      SyS_sendmsg+0x10/0x14
[   73.256568]                      ret_fast_syscall+0x0/0x1c
[   73.262080]   }
[   73.263896]   ... key      at: [<bf05e5b8>]  
__key.33453+0x0/0xffffba48 [wireguard]
[   73.271509]   ... acquired at:
[   73.274590]    iptunnel_xmit+0x174/0x1e0
[   73.278541]    udp_tunnel_xmit_skb+0xe8/0xf0
[   73.282870]    socket_send_skb_to_peer+0x400/0x830 [wireguard]
[   73.288764]    packet_tx_worker+0xc8/0x3e4 [wireguard]
[   73.293935]    process_one_work+0x24c/0x4e8
[   73.298146]    worker_thread+0x40/0x574
[   73.302006]    kthread+0x120/0x160
[   73.305435]    ret_from_fork+0x14/0x24

[   73.310714] -> (&(&r->consumer_lock)->rlock){+.-...} ops: 82639 {
[   73.316857]    HARDIRQ-ON-W at:
[   73.320032]                     lock_acquire+0x70/0x90
[   73.325209]                     _raw_spin_lock_bh+0x4c/0x5c
[   73.330848]                     packet_encrypt_worker+0x2c/0x574  
[wireguard]
[   73.337934]                     process_one_work+0x24c/0x4e8
[   73.343624]                     worker_thread+0x40/0x574
[   73.348965]                     kthread+0x120/0x160
[   73.353874]                     ret_from_fork+0x14/0x24
[   73.359126]    IN-SOFTIRQ-W at:
[   73.362298]                     lock_acquire+0x70/0x90
[   73.367469]                     _raw_spin_lock_bh+0x4c/0x5c
[   73.373107]                     packet_queue_free+0x24/0x84 [wireguard]
[   73.379786]                     rcu_release+0x48/0x6c [wireguard]
[   73.385915]                     rcu_process_callbacks+0x338/0x5d0
[   73.392049]                     __do_softirq+0xf0/0x2a0
[   73.397302]                     irq_exit+0xe8/0x160
[   73.402215]                     __handle_domain_irq+0x60/0xc0
[   73.407994]                     gic_handle_irq+0x64/0xc4
[   73.413336]                     __irq_svc+0x70/0x98
[   73.418247]                     cpuidle_enter_state+0x188/0x2b0
[   73.424195]                     cpuidle_enter+0x1c/0x20
[   73.429450]                     call_cpuidle+0x28/0x44
[   73.434616]                     do_idle+0x10c/0x1e0
[   73.439520]                     cpu_startup_entry+0x20/0x24
[   73.445124]                     secondary_start_kernel+0x148/0x174
[   73.451337]                     0x801015ec
[   73.455457]    INITIAL USE at:
[   73.458543]                    lock_acquire+0x70/0x90
[   73.463627]                    _raw_spin_lock_bh+0x4c/0x5c
[   73.469183]                    packet_encrypt_worker+0x2c/0x574 [wireguard]
[   73.476182]                    process_one_work+0x24c/0x4e8
[   73.481785]                    worker_thread+0x40/0x574
[   73.487039]                    kthread+0x120/0x160
[   73.491861]                    ret_from_fork+0x14/0x24
[   73.497024]  }
[   73.498745]  ... key      at: [<bf05e640>]  
__key.48712+0x0/0xffffb9c0 [wireguard]
[   73.506268]  ... acquired at:
[   73.509263]    mark_lock+0x2f8/0x6f0
[   73.512865]    __lock_acquire+0x590/0x18e0
[   73.516989]    lock_acquire+0x70/0x90
[   73.520678]    _raw_spin_lock_bh+0x4c/0x5c
[   73.524832]    packet_queue_free+0x24/0x84 [wireguard]
[   73.530029]    rcu_release+0x48/0x6c [wireguard]
[   73.534676]    rcu_process_callbacks+0x338/0x5d0
[   73.539325]    __do_softirq+0xf0/0x2a0
[   73.543099]    irq_exit+0xe8/0x160
[   73.546529]    __handle_domain_irq+0x60/0xc0
[   73.550826]    gic_handle_irq+0x64/0xc4
[   73.554687]    __irq_svc+0x70/0x98
[   73.558113]    cpuidle_enter_state+0x188/0x2b0
[   73.562583]    cpuidle_enter+0x1c/0x20
[   73.566358]    call_cpuidle+0x28/0x44
[   73.570044]    do_idle+0x10c/0x1e0
[   73.573470]    cpu_startup_entry+0x20/0x24
[   73.577592]    secondary_start_kernel+0x148/0x174
[   73.582324]    0x801015ec

[   73.586471]
                 stack backtrace:
[   73.590865] CPU: 2 PID: 0 Comm: swapper/2 Tainted: G           O     
4.13.5-dirty #16
[   73.598647] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[   73.605207] Backtrace:
[   73.607692] [<c010c3b8>] (dump_backtrace) from [<c010c664>]  
(show_stack+0x18/0x1c)
[   73.615307]  r7:00000000 r6:60070193 r5:00000000 r4:c0e69be0
[   73.621007] [<c010c64c>] (show_stack) from [<c090c8d8>]  
(dump_stack+0xb4/0xe8)
[   73.628281] [<c090c824>] (dump_stack) from [<c016c874>]  
(print_irq_inversion_bug+0x1a0/0x214)
[   73.636852]  r9:00000004 r8:00000000 r7:c0e9c42c r6:cb878cc0  
r5:c0e9c42c r4:cb883c34
[   73.644642] [<c016c6d4>] (print_irq_inversion_bug) from  
[<c016c998>] (check_usage_forwards+0xb0/0x120)
[   73.653996]  r9:00000004 r8:00000001 r7:c0bbc72c r6:cb878cc0  
r5:00000006 r4:cb8791e0
[   73.661785] [<c016c8e8>] (check_usage_forwards) from [<c016d86c>]  
(mark_lock+0x2f8/0x6f0)
[   73.670005]  r8:c0a028e8 r7:c016c8e8 r6:cb878cc0 r5:00000004 r4:cb8791e0
[   73.676743] [<c016d574>] (mark_lock) from [<c016e7d8>]  
(__lock_acquire+0x590/0x18e0)
[   73.684528]  r10:cb878cc0 r9:c0e1de7c r8:00000024 r7:c163a298  
r6:00000001 r5:cb8791e0
[   73.692398]  r4:0000040c
[   73.694959] [<c016e248>] (__lock_acquire) from [<c01702d8>]  
(lock_acquire+0x70/0x90)
[   73.702746]  r10:0000000a r9:c0e1325c r8:00000001 r7:00000001  
r6:60070113 r5:00000000
[   73.710614]  r4:ffffe000
[   73.713178] [<c0170268>] (lock_acquire) from [<c09280bc>]  
(_raw_spin_lock_bh+0x4c/0x5c)
[   73.721225]  r8:bf03ecc8 r7:cb883e00 r6:cbd9b920 r5:bf0400ac r4:cb3da188
[   73.728004] [<c0928070>] (_raw_spin_lock_bh) from [<bf0400ac>]  
(packet_queue_free+0x24/0x84 [wireguard])
[   73.737534]  r5:cb3da188 r4:cb3da140
[   73.741196] [<bf040088>] (packet_queue_free [wireguard]) from  
[<bf03ed10>] (rcu_release+0x48/0x6c [wireguard])
[   73.751244]  r5:cb3da008 r4:cb3da638
[   73.754878] [<bf03ecc8>] (rcu_release [wireguard]) from  
[<c0188ecc>] (rcu_process_callbacks+0x338/0x5d0)
[   73.764404]  r5:cb3da638 r4:cbd9b900
[   73.768016] [<c0188b94>] (rcu_process_callbacks) from [<c012a080>]  
(__do_softirq+0xf0/0x2a0)
[   73.776503]  r10:00000100 r9:c0e020a0 r8:c0e020a4 r7:00000009  
r6:cb882000 r5:40000001
[   73.784371]  r4:00000000
[   73.786931] [<c0129f90>] (__do_softirq) from [<c012a5dc>]  
(irq_exit+0xe8/0x160)
[   73.794283]  r10:f4000100 r9:c0e1e0e4 r8:cb808400 r7:00000001  
r6:00000000 r5:00000000
[   73.802150]  r4:c0d53c18
[   73.804713] [<c012a4f4>] (irq_exit) from [<c0179694>]  
(__handle_domain_irq+0x60/0xc0)
[   73.812589] [<c0179634>] (__handle_domain_irq) from [<c01014fc>]  
(gic_handle_irq+0x64/0xc4)
[   73.820986]  r9:c0e1e0e4 r8:cb883f00 r7:00000000 r6:000003ff  
r5:000003eb r4:f400010c
[   73.828773] [<c0101498>] (gic_handle_irq) from [<c010d230>]  
(__irq_svc+0x70/0x98)
[   73.836296] Exception stack(0xcb883f00 to 0xcb883f48)
[   73.841380] 3f00: 00000001 00000001 00000000 cb878cc0 00000000  
cbd9a4e0 f7ab2062 00000010
[   73.849603] 3f20: f7154280 00000010 00000000 cb883f7c cb883f20  
cb883f50 c016de00 c064d0c8
[   73.857820] 3f40: 20070013 ffffffff
[   73.861337]  r10:00000000 r9:cb882000 r8:f7154280 r7:cb883f34  
r6:ffffffff r5:20070013
[   73.869206]  r4:c064d0c8
[   73.871766] [<c064cf40>] (cpuidle_enter_state) from [<c064d230>]  
(cpuidle_enter+0x1c/0x20)
[   73.880074]  r10:cb883fa0 r9:c0e0d1fc r8:c0d534d8 r7:cbd9a4e0  
r6:c0e0756c r5:c0e075b8
[   73.887943]  r4:cb882000 r3:cbd9a4e0
[   73.891550] [<c064d214>] (cpuidle_enter) from [<c0165ce8>]  
(call_cpuidle+0x28/0x44)
[   73.899250] [<c0165cc0>] (call_cpuidle) from [<c0165f08>]  
(do_idle+0x10c/0x1e0)
[   73.906602] [<c0165dfc>] (do_idle) from [<c0166364>]  
(cpu_startup_entry+0x20/0x24)
[   73.914216]  r10:00000000 r9:412fc09a r8:8000406a r7:c0e6d2d0  
r6:10c0387d r5:00000002
[   73.922085]  r4:00000084 r3:cb878cc0
[   73.925691] [<c0166344>] (cpu_startup_entry) from [<c010f4e8>]  
(secondary_start_kernel+0x148/0x174)
[   73.934785] [<c010f3a0>] (secondary_start_kernel) from [<801015ec>]  
(0x801015ec)
[   73.942219]  r5:00000051 r4:8b86c06a
[   74.025137] wireguard: wg0: Interface deleted
root@utilite:~#


DMESG third:

[   83.786457] ========================================================
[   83.792863] WARNING: possible irq lock inversion dependency detected
[   83.799272] 4.13.5-dirty #16 Tainted: G           O
[   83.804455] --------------------------------------------------------
[   83.810862] swapper/0/0 just changed the state of lock:
[   83.816130]  (&(&r->consumer_lock)->rlock){+.-...}, at:  
[<bf0400ac>] packet_queue_free+0x24/0x84 [wireguard]
[   83.826179] but this lock took another, SOFTIRQ-unsafe lock in the past:
[   83.832930]  (&syncp->seq#7){+.+...}
[   83.832966]

                 and interrupts could create inverse lock ordering  
between them.

[   83.848067]
                 other info that might help us debug this:
[   83.854674]  Possible interrupt unsafe locking scenario:

[   83.861540]        CPU0                    CPU1
[   83.866118]        ----                    ----
[   83.870672]   lock(&syncp->seq#7);
[   83.874107]                                local_irq_disable();
[   83.880054]                                 
lock(&(&r->consumer_lock)->rlock);
[   83.887227]                                lock(&syncp->seq#7);
[   83.893185]   <Interrupt>
[   83.895823]     lock(&(&r->consumer_lock)->rlock);
[   83.900645]
                  *** DEADLOCK ***

[   83.906610] 1 lock held by swapper/0/0:
[   83.910467]  #0:  (rcu_callback){......}, at: [<c0188e90>]  
rcu_process_callbacks+0x2fc/0x5d0
[   83.918980]
                 the shortest dependencies between 2nd lock and 1st lock:
[   83.926852]  -> (&syncp->seq#7){+.+...} ops: 221546 {
[   83.931957]     HARDIRQ-ON-W at:
[   83.935225]                       lock_acquire+0x70/0x90
[   83.940577]                       iptunnel_xmit+0x174/0x1e0
[   83.946183]                       udp_tunnel_xmit_skb+0xe8/0xf0
[   83.952178]                        
socket_send_skb_to_peer+0x400/0x830 [wireguard]
[   83.959739]                        
socket_send_buffer_to_peer+0x74/0x84 [wireguard]
[   83.967384]                        
packet_send_handshake_initiation+0xb8/0xf8 [wireguard]
[   83.975544]                        
packet_handshake_send_worker+0x18/0x24 [wireguard]
[   83.983337]                       process_one_work+0x24c/0x4e8
[   83.989202]                       worker_thread+0x40/0x574
[   83.994717]                       kthread+0x120/0x160
[   83.999802]                       ret_from_fork+0x14/0x24
[   84.005229]     SOFTIRQ-ON-W at:
[   84.008492]                       lock_acquire+0x70/0x90
[   84.013869]                        
receive_handshake_packet+0x114/0x3f0 [wireguard]
[   84.021512]                        
packet_handshake_receive_worker+0x1c/0x44 [wireguard]
[   84.029561]                       process_one_work+0x24c/0x4e8
[   84.035426]                       worker_thread+0x40/0x574
[   84.040943]                       kthread+0x120/0x160
[   84.046026]                       ret_from_fork+0x14/0x24
[   84.051452]     INITIAL USE at:
[   84.054625]                      lock_acquire+0x70/0x90
[   84.059882]                      ip_tunnel_get_stats64+0x148/0x190
[   84.066097]                      dev_get_stats+0x40/0xb4
[   84.071447]                      rtnl_fill_stats+0x38/0x120
[   84.077050]                      rtnl_fill_ifinfo+0x508/0xe00
[   84.082830]                      rtmsg_ifinfo_build_skb+0x70/0xe0
[   84.088957]                      rtmsg_ifinfo_event.part.7+0x1c/0x4c
[   84.095344]                      rtmsg_ifinfo+0x30/0x38
[   84.100603]                      __dev_notify_flags+0x94/0xa4
[   84.106383]                      rtnl_configure_link+0x80/0xa4
[   84.112247]                      rtnl_newlink+0x64c/0x748
[   84.117675]                      rtnetlink_rcv_msg+0x94/0x1f4
[   84.123456]                      netlink_rcv_skb+0xe0/0x100
[   84.129059]                      rtnetlink_rcv+0x28/0x38
[   84.134401]                      netlink_unicast+0x184/0x26c
[   84.140090]                      netlink_sendmsg+0x29c/0x378
[   84.145785]                      sock_sendmsg+0x1c/0x2c
[   84.151041]                      ___sys_sendmsg+0x214/0x22c
[   84.156644]                      __sys_sendmsg+0x48/0x74
[   84.161986]                      SyS_sendmsg+0x10/0x14
[   84.167156]                      ret_fast_syscall+0x0/0x1c
[   84.172668]   }
[   84.174484]   ... key      at: [<bf05e5b8>]  
__key.33453+0x0/0xffffba48 [wireguard]
[   84.182096]   ... acquired at:
[   84.185176]    iptunnel_xmit+0x174/0x1e0
[   84.189127]    udp_tunnel_xmit_skb+0xe8/0xf0
[   84.193457]    socket_send_skb_to_peer+0x400/0x830 [wireguard]
[   84.199351]    packet_tx_worker+0xc8/0x3e4 [wireguard]
[   84.204521]    process_one_work+0x24c/0x4e8
[   84.208731]    worker_thread+0x40/0x574
[   84.212591]    kthread+0x120/0x160
[   84.216020]    ret_from_fork+0x14/0x24

[   84.221300] -> (&(&r->consumer_lock)->rlock){+.-...} ops: 71666 {
[   84.227443]    HARDIRQ-ON-W at:
[   84.230620]                     lock_acquire+0x70/0x90
[   84.235797]                     _raw_spin_lock_bh+0x4c/0x5c
[   84.241438]                     packet_encrypt_worker+0x2c/0x574  
[wireguard]
[   84.248524]                     process_one_work+0x24c/0x4e8
[   84.254214]                     worker_thread+0x40/0x574
[   84.259554]                     kthread+0x120/0x160
[   84.264464]                     ret_from_fork+0x14/0x24
[   84.269716]    IN-SOFTIRQ-W at:
[   84.272888]                     lock_acquire+0x70/0x90
[   84.278060]                     _raw_spin_lock_bh+0x4c/0x5c
[   84.283695]                     packet_queue_free+0x24/0x84 [wireguard]
[   84.290371]                     rcu_release+0x48/0x6c [wireguard]
[   84.296500]                     rcu_process_callbacks+0x338/0x5d0
[   84.302634]                     __do_softirq+0xf0/0x2a0
[   84.307889]                     irq_exit+0xe8/0x160
[   84.312802]                     __handle_domain_irq+0x60/0xc0
[   84.318582]                     gic_handle_irq+0x64/0xc4
[   84.323925]                     __irq_svc+0x70/0x98
[   84.328835]                     cpuidle_enter_state+0x188/0x2b0
[   84.334785]                     cpuidle_enter+0x1c/0x20
[   84.340040]                     call_cpuidle+0x28/0x44
[   84.345206]                     do_idle+0x10c/0x1e0
[   84.350112]                     cpu_startup_entry+0x20/0x24
[   84.355714]                     rest_init+0x228/0x278
[   84.360800]                     start_kernel+0x32c/0x3a0
[   84.366141]                     0x8000807c
[   84.370261]    INITIAL USE at:
[   84.373348]                    lock_acquire+0x70/0x90
[   84.378430]                    _raw_spin_lock_bh+0x4c/0x5c
[   84.383984]                    packet_encrypt_worker+0x2c/0x574 [wireguard]
[   84.390985]                    process_one_work+0x24c/0x4e8
[   84.396589]                    worker_thread+0x40/0x574
[   84.401843]                    kthread+0x120/0x160
[   84.406666]                    ret_from_fork+0x14/0x24
[   84.411829]  }
[   84.413550]  ... key      at: [<bf05e640>]  
__key.48712+0x0/0xffffb9c0 [wireguard]
[   84.421071]  ... acquired at:
[   84.424067]    mark_lock+0x2f8/0x6f0
[   84.427669]    __lock_acquire+0x590/0x18e0
[   84.431793]    lock_acquire+0x70/0x90
[   84.435482]    _raw_spin_lock_bh+0x4c/0x5c
[   84.439637]    packet_queue_free+0x24/0x84 [wireguard]
[   84.444836]    rcu_release+0x48/0x6c [wireguard]
[   84.449483]    rcu_process_callbacks+0x338/0x5d0
[   84.454132]    __do_softirq+0xf0/0x2a0
[   84.457908]    irq_exit+0xe8/0x160
[   84.461338]    __handle_domain_irq+0x60/0xc0
[   84.465634]    gic_handle_irq+0x64/0xc4
[   84.469494]    __irq_svc+0x70/0x98
[   84.472921]    cpuidle_enter_state+0x188/0x2b0
[   84.477390]    cpuidle_enter+0x1c/0x20
[   84.481165]    call_cpuidle+0x28/0x44
[   84.484852]    do_idle+0x10c/0x1e0
[   84.488278]    cpu_startup_entry+0x20/0x24
[   84.492401]    rest_init+0x228/0x278
[   84.496004]    start_kernel+0x32c/0x3a0
[   84.499864]    0x8000807c

[   84.504013]
                 stack backtrace:
[   84.508408] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G           O     
4.13.5-dirty #16
[   84.516191] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[   84.522748] Backtrace:
[   84.525234] [<c010c3b8>] (dump_backtrace) from [<c010c664>]  
(show_stack+0x18/0x1c)
[   84.532849]  r7:00000000 r6:60080193 r5:00000000 r4:c0e69be0
[   84.538549] [<c010c64c>] (show_stack) from [<c090c8d8>]  
(dump_stack+0xb4/0xe8)
[   84.545821] [<c090c824>] (dump_stack) from [<c016c874>]  
(print_irq_inversion_bug+0x1a0/0x214)
[   84.554393]  r9:00000004 r8:00000000 r7:c0e9c2c4 r6:c0e0a840  
r5:c0e9c2c4 r4:c0e01bdc
[   84.562184] [<c016c6d4>] (print_irq_inversion_bug) from  
[<c016c998>] (check_usage_forwards+0xb0/0x120)
[   84.571538]  r9:00000004 r8:00000001 r7:c0bbc72c r6:c0e0a840  
r5:00000006 r4:c0e0ad60
[   84.579328] [<c016c8e8>] (check_usage_forwards) from [<c016d86c>]  
(mark_lock+0x2f8/0x6f0)
[   84.587549]  r8:c0a028e8 r7:c016c8e8 r6:c0e0a840 r5:00000004 r4:c0e0ad60
[   84.594287] [<c016d574>] (mark_lock) from [<c016e7d8>]  
(__lock_acquire+0x590/0x18e0)
[   84.602075]  r10:c0e0a840 r9:c0e1de7c r8:00000024 r7:c163a298  
r6:00000001 r5:c0e0ad60
[   84.609943]  r4:00000405
[   84.612505] [<c016e248>] (__lock_acquire) from [<c01702d8>]  
(lock_acquire+0x70/0x90)
[   84.620291]  r10:0000000a r9:c0e1325c r8:00000001 r7:00000001  
r6:60080113 r5:00000000
[   84.628160]  r4:ffffe000
[   84.630723] [<c0170268>] (lock_acquire) from [<c09280bc>]  
(_raw_spin_lock_bh+0x4c/0x5c)
[   84.638770]  r8:bf03ecc8 r7:c0e01da8 r6:cbd7b920 r5:bf0400ac r4:ca564188
[   84.645550] [<c0928070>] (_raw_spin_lock_bh) from [<bf0400ac>]  
(packet_queue_free+0x24/0x84 [wireguard])
[   84.655079]  r5:ca564188 r4:ca564140
[   84.658742] [<bf040088>] (packet_queue_free [wireguard]) from  
[<bf03ed10>] (rcu_release+0x48/0x6c [wireguard])
[   84.668790]  r5:ca564008 r4:ca564638
[   84.672422] [<bf03ecc8>] (rcu_release [wireguard]) from  
[<c0188ecc>] (rcu_process_callbacks+0x338/0x5d0)
[   84.681948]  r5:ca564638 r4:cbd7b900
[   84.685557] [<c0188b94>] (rcu_process_callbacks) from [<c012a080>]  
(__do_softirq+0xf0/0x2a0)
[   84.694042]  r10:00000100 r9:c0e020a0 r8:c0e020a4 r7:00000009  
r6:c0e00000 r5:40000001
[   84.701911]  r4:00000000
[   84.704470] [<c0129f90>] (__do_softirq) from [<c012a5dc>]  
(irq_exit+0xe8/0x160)
[   84.711821]  r10:f4000100 r9:c0e1e0e4 r8:cb808400 r7:00000001  
r6:00000000 r5:00000000
[   84.719690]  r4:c0d53c18
[   84.722253] [<c012a4f4>] (irq_exit) from [<c0179694>]  
(__handle_domain_irq+0x60/0xc0)
[   84.730129] [<c0179634>] (__handle_domain_irq) from [<c01014fc>]  
(gic_handle_irq+0x64/0xc4)
[   84.738526]  r9:c0e1e0e4 r8:c0e01ea8 r7:00000000 r6:000003ff  
r5:000003eb r4:f400010c
[   84.746313] [<c0101498>] (gic_handle_irq) from [<c010d230>]  
(__irq_svc+0x70/0x98)
[   84.753837] Exception stack(0xc0e01ea8 to 0xc0e01ef0)
[   84.758920] 1ea0:                   00000001 00000001 00000000  
c0e0a840 00000000 cbd7a4e0
[   84.767142] 1ec0: 81f5899f 00000013 815e6b6d 00000013 00000000  
c0e01f24 c0e01ec8 c0e01ef8
[   84.775360] 1ee0: c016de00 c064d0c8 20080013 ffffffff
[   84.780443]  r10:00000000 r9:c0e00000 r8:815e6b6d r7:c0e01edc  
r6:ffffffff r5:20080013
[   84.788312]  r4:c064d0c8
[   84.790872] [<c064cf40>] (cpuidle_enter_state) from [<c064d230>]  
(cpuidle_enter+0x1c/0x20)
[   84.799182]  r10:c0e01f48 r9:c0e0d1fc r8:c0d534d8 r7:cbd7a4e0  
r6:c0e0756c r5:c0e075b8
[   84.807051]  r4:c0e00000 r3:cbd7a4e0
[   84.810654] [<c064d214>] (cpuidle_enter) from [<c0165ce8>]  
(call_cpuidle+0x28/0x44)
[   84.818354] [<c0165cc0>] (call_cpuidle) from [<c0165f08>]  
(do_idle+0x10c/0x1e0)
[   84.825706] [<c0165dfc>] (do_idle) from [<c0166364>]  
(cpu_startup_entry+0x20/0x24)
[   84.833319]  r10:c0d3da48 r9:cbfff980 r8:c0e6d000 r7:c0e07540  
r6:c0e6d000 r5:00000002
[   84.841187]  r4:000000bb r3:c0d4c31c
[   84.844791] [<c0166344>] (cpu_startup_entry) from [<c09205e4>]  
(rest_init+0x228/0x278)
[   84.852757] [<c09203bc>] (rest_init) from [<c0d00cd4>]  
(start_kernel+0x32c/0x3a0)
[   84.860280]  r5:ffffffff r4:c0e6d04c
[   84.863885] [<c0d009a8>] (start_kernel) from [<8000807c>] (0x8000807c)
[   84.954784] wireguard: wg0: Interface deleted

Greats,

René
