Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4301fd2
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 10:20:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9ca18b6
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 10:20:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2ff7bc11
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 10:20:51 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id t196so109637907lff.3
 for <wireguard@lists.zx2c4.com>; Mon, 07 Nov 2016 02:22:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161107083724.GA13777@tuxmachine.polynome.dn42>
References: <25241985.20161106100258@vodka.home.kg>
 <1289478110.20161106110707@vodka.home.kg>
 <CAHmME9rjEeuodHMM4Quo1NVXT2A2DYUj=3FPgep-f4hNXeCh5g@mail.gmail.com>
 <20161107083724.GA13777@tuxmachine.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 7 Nov 2016 11:22:32 +0100
Message-ID: <CAHmME9oLj2Dq8aAyf4sUUD+BekE1q9peRa2JJq8RY+UH2WtsZA@mail.gmail.com>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] mips32 crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Baptiste,

This was not at all intended as a swipe at you! You've done a great
job packaging it, fear not. I merely meant that seeing how many people
want WireGuard to run well on LEDE and the current state it's in, I
should devote some resources to that myself.

Indeed it looks like a lot of k's messages were flagged by spam
filters. I'll repost the conversation below in this message.

Jason

~=3D~=3D~=3D~=3D

Forwarded conversation
Subject: [WireGuard] mips32 crash
------------------------

From: <k@vodka.home.kg>
Date: Sun, Nov 6, 2016 at 9:07 AM
To: WireGuard mailing list <wireguard@lists.zx2c4.com>

Hi !

I'm  experimenting  with  wireguard  tunnel  between 2 devices running
openwrt/lede.

R1 - banana PI  kernel 4.1.16  ARM 2 core SMP PREEMPT
R2  -  Dlink  DIR-825b1   kernel  4.4.30   MIPS32r2 Big_Endian  1 core
PREEMPT

W1-R1 (mtu 1500) - inet - (mtu 1456) R2-W2
Wireguard MTU 1370
Wireguard ver 20161103, 20161105

I  try  to  copy  files  using SMB from Windows connected to R1 to
Windows  connected to R2. As further experiments show no matter if it
windows or linux - iperf uploading from W1 to W2 is enough

While ARM device has never crashed, MIPS crashes constantly.
It takes from 5 mins to 2 hours to crash.
I have crash logs.
I enabled dbgprint in wireguard module : echo "module wireguard +p"
>/sys/kernel/debug/dynamic_debug/control

Typical crash log :

---------------------
<7>[13785.407900] wireguard: Sending handshake initiation to peer 1 (x.x.x.=
x:16)
<7>[13785.514312] wireguard: Receiving handshake response from peer 1
((invalid address))
<7>[13785.532044] wireguard: Keypair 106 created for peer 1
<7>[13785.537164] wireguard: Sending keepalive packet to peer 1 (x.x.x.x:16=
)
<7>[13785.550835] wireguard: Keypair 104 destroyed for peer 1
<7>[13905.531148] wireguard: Sending handshake initiation to peer 1 (x.x.x.=
x:16)
<4>[13905.629622] ------------[ cut here ]------------
<1>[13905.634339] CPU 0 Unable to handle kernel paging request at
virtual address 000100d7, epc =3D=3D 800a6a40, ra =3D=3D 800c0470
<4>[13905.634349] Oops[#1]:
<4>[13905.634360] CPU: 0 PID: 41189632 Comm:  Not tainted 4.4.30 #0
<4>[13905.634369] task: 810000ce ti: 82bca000 task.ti: 00018100
<4>[13905.634381] $ 0   : 00000000 00000001 02f40000 00000003
<4>[13905.634392] $ 4   : 810000ce 00010000 0000ffff 02f40001
<4>[13905.634402] $ 8   : 810000ce fffe6d57 00000002 00000001
<4>[13905.634412] $12   : 003d08ff c781e3dc 00000000 00000000
<4>[13905.634423] $16   : 00000001 810000ce 00000002 8049f4f0
<4>[13905.634434] $20   : ad4f6c42 00000ca5 804a01e0 82bcbd90
<4>[13905.634444] $24   : 00000000 8023b14c
<4>[13905.634455] $28   : 82bca000 82bcbb88 003d0900 800c0470
<4>[13905.634457] Hi    : 00000ca5
<4>[13905.634460] Lo    : 8295ea00
<4>[13905.634487] epc   : 800a6a40 account_system_time+0x158/0x1e0
<4>[13905.634497] ra    : 800c0470 update_process_times+0x24/0x70
<4>[13905.634504] Status: 10007c02      KERNEL EXL
<4>[13905.634507] Cause : 00800008 (ExcCode 02)
<4>[13905.634510] BadVA : 000100d7
<4>[13905.634514] PrId  : 00019374 (MIPS 24Kc)
<4>[13905.634666] Modules linked in: ath9k ath9k_common pppoe
ppp_async l2tp_ppp iptable_nat ath9k_hw ath pptp pppox ppp_mppe
ppp_generic nf_nat_pptp nf_nat_ipv4 nf_nat_amanda nf_conntrack_pptp
nf_conntrack_ipv6 nf_conntrack_ipv4 nf_conntrack_amanda mac80211
ipt_REJECT ipt_MASQUERADE cfg80211 xt_u32 xt_time xt_tcpudp xt_tcpmss
xt_string xt_statistic xt_state xt_recent xt_quota xt_pkttype
xt_physdev xt_owner xt_nat xt_multiport xt_mark xt_mac xt_limit
xt_length xt_id xt_hl xt_helper xt_hashlimit xt_ecn xt_dscp
xt_conntrack xt_connmark xt_connlimit xt_connbytes xt_comment
xt_addrtype xt_TCPMSS xt_REDIRECT xt_NFQUEUE xt_NFLOG xt_NETMAP xt_LOG
xt_IPMARK xt_HL xt_DSCP xt_CT xt_CLASSIFY ts_kmp ts_fsm ts_bm slhc
nfnetlink_queue nfnetlink_log nf_reject_ipv4 nf_nat_tftp
nf_nat_snmp_basic nf_nat_sip nf_nat_redirect nf_nat_proto_gre
nf_nat_masquerade_ipv4 nf_nat_irc nf_nat_h323 nf_nat_ftp nf_nat
nf_log_ipv4 nf_defrag_ipv6 nf_defrag_ipv4 nf_conntrack_tftp
nf_conntrack_snmp nf_conntrack_sip nf_conntrack_rtcache
nf_conntrack_proto_gre nf_conntrack_netlink nf_conntrack_irc
nf_conntrack_h323 nf_conntrack_ftp nf_conntrack_broadcast iptable_raw
iptable_mangle iptable_filter ipt_ECN ip_tables crc_ccitt
compat_xtables compat br_netfilter em_cmp sch_teql em_nbyte sch_dsmark
sch_pie act_ipt sch_codel sch_gred sch_htb cls_basic sch_prio em_text
em_meta act_police sch_red sch_tbf sch_sfq sch_fq act_connmark
nf_conntrack act_skbedit act_mirred em_u32 cls_u32 cls_tcindex
cls_flow cls_route cls_fw sch_hfsc sch_ingress sg ledtrig_usbport
xt_set ip_set_list_set ip_set_hash_netiface ip_set_hash_netport
ip_set_hash_netnet ip_set_hash_net ip_set_hash_netportnet
ip_set_hash_mac ip_set_hash_ipportnet ip_set_hash_ipportip
ip_set_hash_ipport ip_set_hash_ipmark ip_set_hash_ip
ip_set_bitmap_port ip_set_bitmap_ipmac ip_set_bitmap_ip ip_set
nfnetlink ip6t_REJECT nf_reject_ipv6 nf_log_ipv6 nf_log_common
ip6table_raw ip6table_mangle ip6table_filter ip6_tables ip_gre gre ifb
wireguard x_tables l2tp_ip6 l2tp_ip sit l2tp_netlink l2tp_core
udp_tunnel ip6_udp_tunnel tunnel4 ip_tunnel tun nls_utf8 sha1_generic
ecb usb_storage ehci_platform ehci_hcd sd_mod scsi_mod rndis_host
cdc_ether usbnet gpio_button_hotplug ext4 jbd2 mbcache usbcore
nls_base usb_common crc16 mii cryptomgr aead crypto_null
crc32c_generic crypto_hash
<4>[13905.634933] Process  (pid: 41189632, threadinfo=3D82bca000,
task=3D810000ce, tls=3D8100cea5)
<4>[13905.635014] Stack : 00000244 000001b1 000001b2 00000245 00000000
810000ce 00000000 80530000
<4>[13905.635014]         80530000 800c0470 80530000 80530000 ad4f6c42
00000ca5 804a01e0 80530000
<4>[13905.635014]         00000000 800cef5c 00000000 00000000 0000a7b2
0000a7b0 804a0080 804a0040
<4>[13905.635014]         00000ca5 ad4f6c42 804a0080 804a0000 804a01e0
804a0040 00000001 00000ca5
<4>[13905.635014]         ad4f61a1 ad4f61a1 804a0000 800c1300 00000000
00000000 00000000 00000000
<4>[13905.635014]         ...
<4>[13905.635017] Call Trace:
<4>[13905.635030] [<800a6a40>] account_system_time+0x158/0x1e0
<4>[13905.635034]
<4>[13905.635059]
<4>[13905.635059] Code: 8e22022c  00473821  ae27022c <90c200d8>
304200ff  10400005  001210c0  8e2202c0  14400010
<4>[13905.635064] ---[ end trace d0d8153e9e58d19b ]---
---------------------

What  is  100%  common in crash log is that crash happens exactly ~100
msec after message " wireguard: Sending handshake initiation to peer 1
(x.x.x.x:16)"

In  normal circumstances after ~100 msec happens "wireguard: Receiving
handshake response from peer 1 ((invalid address))".

So  I  can  suppose  its  somehow  connected  to  receiving  handshake
response.
Crash  most  likely  occurs  in  "account_system_time"  and related to
accessing bad memory location. But sometimes stack points to :
<4>[ 4511.098305] [<8007a018>] __do_page_fault+0x5c/0x518
OR
<4>[ 1138.193952] [<800be79c>] profile_tick+0x8/0x48
Sometimes another exception triggered :
<4>[  309.518201] Unhandled kernel unaligned access[#1]:


Likely caused by memory corruption.


> <4>[13905.634933] Process  (pid: 41189632, threadinfo=3D82bca000, task=3D=
810000ce, tls=3D8100cea5)


Look  at  pid  value.  Its defenitly not valid pid. Task structure was
corrupted.

----------
From: Jason A. Donenfeld <Jason@zx2c4.com>
Date: Sun, Nov 6, 2016 at 12:20 PM
To: k@vodka.home.kg
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>


> <7>[13905.531148] wireguard: Sending handshake initiation to peer 1 (x.x.=
x.x:16)
> <4>[13905.629622] ------------[ cut here ]------------

So you said the crash 100% occurs 100ms after sending handshake
initiation. If related this could be because:

a) The scheduler ticks come in 100ms intervals. In this case, the
crash would be caused by something in sending the initiation.
or
b) The ping latency is 100ms. In this case, the crash would be caused
by something in receiving the response.
or
c) Something else.

I'm curious: when the crash happens, does the ARM box receive the
handshake initiation message?


> Wireguard ver 20161103, 20161105

If I understand this right, the one that's crashing is on 1105? In
which case, could you tell me if 1103 crashes, or if it's only 1105?

> Look  at  pid  value.  Its defenitly not valid pid. Task structure was
> corrupted.

Indeed. In hex, the bottom part is 0x8100, which is an address...

----------
From: <k@vodka.home.kg>
Date: Sun, Nov 6, 2016 at 1:31 PM
To: "Jason A. Donenfeld" <Jason@zx2c4.com>


>Think you could "instrument" where you think the crash happens with a bunc=
h of printks?

I can change and compile source for both ends. Unfortunately on ARM
box kernel lacks dynamic_debug option. I cant change kernel there now
because it will require rebuilding all the openwrt system and i'm not
physically there.
Mips side is at my physical location. Here runs LEDE I built from
source several days ago. Kernel has dynamic_debug.
I can test modified source with printk's.
But  as  I  see  crash does not happens in wireguard module. Wireguard
corrupts  memory or forces OS to corrupt it. Crash happens afterwards.
So printks will not help.

>I'm curious: when the crash happens, does the ARM box receive the
>handshake initiation message?

Cant enable debug message there thru dynamic_debug.
But I can add there another printk and recompile. Will do it soon.

>If I understand this right, the one that's crashing is on 1105? In
>which case, could you tell me if 1103 crashes, or if it's only 1105?

Both crash the same way.


----------
From: Jason A. Donenfeld <Jason@zx2c4.com>
Date: Sun, Nov 6, 2016 at 3:25 PM
To: k@vodka.home.kg


On Sun, Nov 6, 2016 at 1:31 PM,  <k@vodka.home.kg> wrote:
> Cant enable debug message there thru dynamic_debug.
> But I can add there another printk and recompile. Will do it soon.

If you compile with `make debug`, then the debug messages will happen
unconditionally, even on non dynamic_debug kernels.

I've got `qemu-system-mips -kernel lede-malta-be
-vmlinux-initramfs.elf -nographic -m 256` running, trying to trigger
the corruption. So far nothing, but hopefully I can reproduce...

----------
From: <k@vodka.home.kg>
Date: Sun, Nov 6, 2016 at 4:10 PM
To: "Jason A. Donenfeld" <Jason@zx2c4.com>


=D0=97=D0=B4=D1=80=D0=B0=D0=B2=D1=81=D1=82=D0=B2=D1=83=D0=B9=D1=82=D0=B5, J=
ason.

=D0=92=D1=8B =D0=BF=D0=B8=D1=81=D0=B0=D0=BB=D0=B8 6 =D0=BD=D0=BE=D1=8F=D0=
=B1=D1=80=D1=8F 2016 =D0=B3., 17:25:23:
OK. here it is.
I marked critical lines based on time shift between systems.
This   time   MIPS   sent hanshake response, not handshake initiation.
Looks like it crashes after sending something, not receiving.
ARM   did  not  receive  handshake  response, then ARM retried sending
initiation and failed several times becase mips was already dead.

----------------------

TIMESHIFT : 161715


[ 6198.089011] wireguard: Receiving handshake initiation from peer 1
(x.x.x.x:16)
[ 6198.111760] wireguard: Sending handshake response to peer 1 (x.x.x.x:16)
[ 6198.150849] wireguard: Keypair 53 created for peer 1
[ 6198.181554] wireguard: Keypair 51 destroyed for peer 1
[ 6198.225660] wireguard: Receiving keepalive packet from peer 1 (x.x.x.x:1=
6)
[ 6318.239370] wireguard: Receiving handshake initiation from peer 1
(x.x.x.x:16)
[ 6318.254466] wireguard: Sending handshake response to peer 1 (x.x.x.x:16)
[ 6318.311185] wireguard: Keypair 54 created for peer 1
[ 6318.326968] wireguard: Keypair 52 destroyed for peer 1
[ 6318.382643] wireguard: Receiving keepalive packet from peer 1 (x.x.x.x:1=
6)
[ 6438.414249] wireguard: Receiving handshake initiation from peer 1
(x.x.x.x:16)
>[ 6438.432367] wireguard: Sending handshake response to peer 1 (x.x.x.x:16=
)
[ 6438.448895] CPU 0 Unable to handle kernel paging request at virtual
address 00000140, epc =3D=3D 8007a018, ra =3D=3D 80060824
[ 6438.459499] Oops[#1]:
[ 6438.461776] CPU: 0 PID: 0 Comm:  Not tainted 4.4.30 #0
[ 6438.466908] task: 830e6c00 ti: 830e6000 task.ti:   (null)
[ 6438.472289] $ 0   : 00000000 00000001 00000000 40000140
[ 6438.477535] $ 4   : 830e8088 00030000 00000140 a5c5fcec
[ 6438.482782] $ 8   : 10007c00 1000001e 00000000 00000000
[ 6438.488030] $12   : 003d08ff b2a242d4 00000000 00000000
[ 6438.493277] $16   : 830e8088 00000140 000019c6 00000000
[ 6438.498524] $20   : 00000000 800cef64 804a01e0 830ec2c0
[ 6438.503772] $24   : 00000000 80304854
[ 6438.509019] $28   : 830e8000 830e7fb8 00000000 80060824
[ 6438.514266] Hi    : 00111dbd
[ 6438.517142] Lo    : c576c8b0
[ 6438.520040] epc   : 8007a018 __do_page_fault+0x5c/0x518
[ 6438.525251] ra    : 80060824 resume_userspace_check+0x0/0x10
[ 6438.530891] Status: 10007c02      KERNEL EXL
[ 6438.534823] Cause : 80800008 (ExcCode 02)
[ 6438.538823] BadVA : 00000140
[ 6438.541699] PrId  : 00019374 (MIPS 24Kc)
[ 6438.545610] Modules linked in: ath9k ath9k_common pppoe ppp_async
l2tp_ppp iptable_nat ath9k_hw ath pptp pppox ppp_mppe ppp_generic
nf_nat_pptp nf_nat_ipv4 nf_nat_amanda nf_conntrack_pptp
nf_conntrack_ipv6 nf_conntrack_ipv4 nf_conntrack_amanda mac80211
ipt_REJECT ipt_MASQUERADE cfg80211 xt_u32 xt_time xt_tcpudp xt_tcpmss
xt_string xt_statistic xt_state xt_recent xt_quota xt_pkttype
xt_physdev xt_owner xt_nat xt_multiport xt_mark xt_mac xt_limit
xt_length xt_id xt_hl xt_helper xt_hashlimit xt_ecn xt_dscp
xt_conntrack xt_connmark xt_connlimit xt_connbytes xt_comment
xt_addrtype xt_TCPMSS xt_REDIRECT xt_NFQUEUE xt_NFLOG xt_NETMAP xt_LOG
xt_IPMARK xt_HL xt_DSCP xt_CT xt_CLASSIFY ts_kmp ts_fsm ts_bm slhc
nfnetlink_queue nfnetlink_log nf_reject_ipv4 nf_nat_tftp
nf_nat_snmp_basic nf_nat_sip nf_nat_redirect nf_nat_proto_gre
nf_nat_masquerade_ipv4 nf_nat_irc nf_nat_h323 nf_nat_ftp nf_nat
nf_log_ipv4 nf_defrag_ipv6 nf_defrag_ipv4 nf_conntrack_tftp
nf_conntrack_snmp nf_conntrack_sip nf_conntrack_rtcache
nf_conntrack_proto_gre nf_conntrack_netlink nf_conntrack_irc
nf_conntrack_h323 nf_conntrack_ftp nf_conntrack_broadcast iptable_raw
iptable_mangle iptable_filter ipt_ECN ip_tables crc_ccitt
compat_xtables compat br_netfilter em_cmp sch_teql em_nbyte sch_dsmark
sch_pie act_ipt sch_codel sch_gred sch_htb cls_basic sch_prio em_text
em_meta act_police sch_red sch_tbf sch_sfq sch_fq act_connmark
nf_conntrack act_skbedit act_mirred em_u32 cls_u32 cls_tcindex
cls_flow cls_route cls_fw sch_hfsc sch_ingress sg ledtrig_usbport
xt_set ip_set_list_set ip_set_hash_netiface ip_set_hash_netport
ip_set_hash_netnet ip_set_hash_net ip_set_hash_netportnet
ip_set_hash_mac ip_set_hash_ipportnet ip_set_hash_ipportip
ip_set_hash_ipport ip_set_hash_ipmark ip_set_hash_ip
ip_set_bitmap_port ip_set_bitmap_ipmac ip_set_bitmap_ip ip_set
nfnetlink ip6t_REJECT nf_reject_ipv6 nf_log_ipv6 nf_log_common
ip6table_raw ip6table_mangle ip6table_filter ip6_tables ip_gre gre ifb
wireguard x_tables l2tp_ip6 l2tp_ip sit l2tp_netlink l2tp_core
udp_tunnel ip6_udp_tunnel tunnel4 ip_tunnel tun nls_utf8 sha1_generic
ecb usb_storage ehci_platform ehci_hcd sd_mod scsi_mod rndis_host
cdc_ether usbnet gpio_button_hotplug ext4 jbd2 mbcache usbcore
nls_base usb_common crc16 mii cryptomgr aead crypto_null
crc32c_generic crypto_hash
[ 6438.747480] Process  (pid: 0, threadinfo=3D830e6000, task=3D830e6c00,
tls=3D00000000)
[ 6438.754764] Stack : 00000006 805165a2 00000004 00000000 00000000
ffffff00 00000000 800b0b4c
[ 6438.754764]         00000000 00000004 00000006 00030001 00000000
00000000 00000000 00000000
[ 6438.754764]         805165a2 00000024
[ 6438.771754] Call Trace:
[ 6438.774206] [<8007a018>] __do_page_fault+0x5c/0x518
[ 6438.779069]
[ 6438.780550]
[ 6438.780550] Code: 0062102b  00808021  00c08821 <144000b3> 8e770140
8f820000  8c4203a8  1440006e  00000000
[ 6438.790527] ---[ end trace a416682485073e59 ]---


[168033.627860] wireguard: Receiving handshake response from peer 2 (y.y.y.=
y:16)
[168033.644247] wireguard: Keypair 67 created for peer 2
[168033.650212] wireguard: Sending keepalive packet to peer 2 (y.y.y.y:16)
[168033.663979] wireguard: Keypair 65 destroyed for peer 2
>[168153.652089] wireguard: Sending handshake initiation to peer 2 (y.y.y.y=
:16)
[168158.778742] wireguard: Handshake for peer 2 (y.y.y.y:16) did not
complete after 5 seconds, retrying
[168158.788417] wireguard: Sending handshake initiation to peer 2 (y.y.y.y:=
16)
[168163.898848] wireguard: Handshake for peer 2 (y.y.y.y:16) did not
complete after 5 seconds, retrying
[168163.908536] wireguard: Sending handshake initiation to peer 2 (y.y.y.y:=
16)
[168168.778964] wireguard: Retrying handshake with peer 2 (y.y.y.y:16)
because we stopped hearing back after 15 seconds
[168168.790283] wireguard: Sending handshake initiation to peer 2 (y.y.y.y:=
16)
[168173.883138] wireguard: Handshake for peer 2 (y.y.y.y:16) did not
complete after 5 seconds, retrying

----------------------


----------
From: Jason A. Donenfeld <Jason@zx2c4.com>
Date: Sun, Nov 6, 2016 at 4:12 PM
To: k@vodka.home.kg


Hey k,

Excellent investigative work. Thanks. I'll look into the handshake
send path for clues...

Right now I'm running this on the qemu MIPS machine, to try to trigger
it, with no success so far:

opkg update && opkg install kmod-wireguard wireguard-tools iperf3 &&
echo iMsBE5up/jSCaZY0Rvdw9vPHYbzyp
gD2u/pOJaicyn8=3D > file && ip link add wg0 type wireguard && ip addr
add 192.168.0.2/24 dev wg0 && wg set wg0 private-key f
ile peer oFGt36VBz7DbtO7/9hN3XOMkDZ4N3cjq/bF4+DU40Cs=3D allowed-ips
192.168.0.0/24 endpoint 10.10.10.101:51820 && ip link se
t wg0 up && ping -c 2 192.168.0.1 && iperf3 -i 1 -n 40000G -c 192.168.0.1

Talk soon,
Jason
--
Jason A. Donenfeld
Deep Space Explorer
fr: +33 6 51 90 82 66
us: +1 513 476 1200
www.jasondonenfeld.com
www.zx2c4.com
zx2c4.com/keys/AB9942E6D4A4CFC3412620A749FC7012A5DE03AE.asc

----------
From: <k@vodka.home.kg>
Date: Sun, Nov 6, 2016 at 4:18 PM
To: "Jason A. Donenfeld" <Jason@zx2c4.com>


> Right now I'm running this on the qemu MIPS machine, to try to trigger
> it, with no success so far:

My  observation  crash  happened more reliably if mtu is odd. Something
like  1383,  1367.  Copying files between windows systems produce more
crashes  then  bare  iperf.  Tried iperf on routers for ~3-4 hours and
nothing.


----------
From: Jason A. Donenfeld <Jason@zx2c4.com>
Date: Sun, Nov 6, 2016 at 5:12 PM
To: k@vodka.home.kg


Are you on IRC? If so, find me (zx2c4) in #wireguard?

----------
From: <k@vodka.home.kg>
Date: Mon, Nov 7, 2016 at 7:54 AM
To: "Jason A. Donenfeld" <Jason@zx2c4.com>


After 10 hours of testing it crashed but another way.
I did mistake. It did not shutdown arm<>mips connection. It was almost
idle but still on.
Today i'm going to add l2tp.

<7>[56169.503264]  wireguard:  Receiving  keepalive packet from peer
5(x.x.x.x:16)
<4>[56173.372583] ------------[ cut here ]------------
<4>[56173.377275] Unhandled kernel unaligned access[#1]:
<4>[56173.377286] CPU: 0 PID: 1962 Comm: smbd Not tainted 4.4.30 #0
<4>[56173.377295] task: 8168eeb0 ti: 830a8000 task.ti: 830a8000
<4>[56173.377307] $ 0   : 00000000 00000001 800b2278 e06a4701
<4>[56173.377318] $ 4   : a6389f66 00d52449 804a0000 00003316
<4>[56173.377329] $ 8   : a6389f61 3c47c46e bc3c9c3d 09c81588
<4>[56173.377340] $12   : 0000115a c0a8042a 00000000 68657265
<4>[56173.377350] $16   : 804a08a0 00000001 804b3d48 00000007
<4>[56173.377361] $20   : 00014680 8042ea14 8042ea3c 00000001
<4>[56173.377371] $24   : 00000003 8023b14c
<4>[56173.377382] $28   : 830aa000 830aa078 804a0000 800b2278
<4>[56173.377385] Hi    : 0a137baf
<4>[56173.377388] Lo    : 76305663
<4>[56173.377410] epc   : 80241948 add_interrupt_randomness+0xa8/0x208
<4>[56173.377432] ra    : 800b2278 handle_irq_event_percpu+0x138/0x188
<4>[56173.377439] Status: 10007c02      KERNEL EXL
<4>[56173.377442] Cause : 80800010 (ExcCode 04)
<4>[56173.377445] BadVA : 000033ca
<4>[56173.377449] PrId  : 00019374 (MIPS 24Kc)
<4>[56173.377602] Modules linked in: ath9k ath9k_common pppoe
ppp_async l2tp_ppp iptable_nat ath9k_hw ath pptp pppox ppp_mppe
ppp_generic nf_nat_pptp nf_nat_ipv4 nf_nat_amanda nf_conntrack_pptp
nf_conntrack_ipv6 nf_conntrack_ipv4 nf_conntrack_amanda mac80211
ipt_REJECT ipt_MASQUERADE cfg80211 xt_u32 xt_time xt_tcpudp xt_tcpmss
xt_string xt_statistic xt_state xt_recent xt_quota xt_pkttype
xt_physdev xt_owner xt_nat xt_multiport xt_mark xt_mac xt_limit
xt_length xt_id xt_hl xt_helper xt_hashlimit xt_ecn xt_dscp
xt_conntrack xt_connmark xt_connlimit xt_connbytes xt_comment
xt_addrtype xt_TCPMSS xt_REDIRECT xt_NFQUEUE xt_NFLOG xt_NETMAP xt_LOG
xt_IPMARK xt_HL xt_DSCP xt_CT xt_CLASSIFY ts_kmp ts_fsm ts_bm slhc
nfnetlink_queue nfnetlink_log nf_reject_ipv4 nf_nat_tftp
nf_nat_snmp_basic nf_nat_sip nf_nat_redirect nf_nat_proto_gre
nf_nat_masquerade_ipv4 nf_nat_irc nf_nat_h323 nf_nat_ftp nf_nat
nf_log_ipv4 nf_defrag_ipv6 nf_defrag_ipv4 nf_conntrack_tftp
nf_conntrack_snmp nf_conntrack_sip nf_conntrack_rtcache
nf_conntrack_proto_gre nf_conntrack_netlink nf_conntrack_irc
nf_conntrack_h323 nf_conntrack_ftp nf_conntrack_broadcast iptable_raw
iptable_mangle iptable_filter ipt_ECN ip_tables crc_ccitt
compat_xtables compat br_netfilter em_cmp sch_teql em_nbyte sch_dsmark
sch_pie act_ipt sch_codel sch_gred sch_htb cls_basic sch_prio em_text
em_meta act_police sch_red sch_tbf sch_sfq sch_fq act_connmark
nf_conntrack act_skbedit act_mirred em_u32 cls_u32 cls_tcindex
cls_flow cls_route cls_fw sch_hfsc sch_ingress sg ledtrig_usbport
xt_set ip_set_list_set ip_set_hash_netiface ip_set_hash_netport
ip_set_hash_netnet ip_set_hash_net ip_set_hash_netportnet
ip_set_hash_mac ip_set_hash_ipportnet ip_set_hash_ipportip
ip_set_hash_ipport ip_set_hash_ipmark ip_set_hash_ip
ip_set_bitmap_port ip_set_bitmap_ipmac ip_set_bitmap_ip ip_set
nfnetlink ip6t_REJECT nf_reject_ipv6 nf_log_ipv6 nf_log_common
ip6table_raw ip6table_mangle ip6table_filter ip6_tables ip_gre gre ifb
wireguard x_tables l2tp_ip6 l2tp_ip sit l2tp_netlink l2tp_core
udp_tunnel ip6_udp_tunnel tunnel4 ip_tunnel tun nls_utf8 sha1_generic
ecb usb_storage ehci_platform ehci_hcd sd_mod scsi_mod rndis_host
cdc_ether usbnet gpio_button_hotplug ext4 jbd2 mbcache usbcore
nls_base usb_common crc16 mii cryptomgr aead crypto_null
crc32c_generic crypto_hash
<4>[56173.377872] Process smbd (pid: 1962, threadinfo=3D830a8000,
task=3D8168eeb0, tls=3D77e8ee50)
<4>[56173.377956] Stack : 804a0000 80075e74 80530000 800a8060 fd1072db
00000000 00000001 800b2278
<4>[56173.377956]         80537ba0 8049f0a0 00000000 80530000 80537ba0
00000000 804b3d48 804b8b64
<4>[56173.377956]         804a6c60 f0000000 c0000000 ffffffff 80510000
80530000 00000034 800b5ad0
<4>[56173.377956]         00000000 33383532 37330000 fd1072db 00003316
00000007 00000007 800b1a9c
<4>[56173.377956]         830aa1a8 8051619f ffffffff 80516198 8042e526
8006fe34 8053d49c 0000000a
<4>[56173.377956]         ...
<4>[56173.377959] Call Trace:
<4>[56173.377970] [<80241948>] add_interrupt_randomness+0xa8/0x208
<4>[56173.377974]
<4>[56173.377999]
<4>[56173.377999] Code: 10e00003  ae030004  10000002 <8ce400b4>
00402021  8e080008  8e03000c  8e020004  8cc708a0
<4>[56173.378005] ---[ end trace c97c3d3ad4123a9a ]---


----------
From: <k@vodka.home.kg>
Date: Mon, Nov 7, 2016 at 11:02 AM
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>


So , guys, I found where shit lies !
Crash happens only when l2tp is involved.
I reproduced crash in the following scenario :

Windows ETH -> ETH Dlink ETH L2TP WG -> WG L2TP ETH Ubuntu

I  setup  xl2tpd  interface  on  dlink and l2tp server on ubuntu. They
connected.  On top of l2tp i created wg tunnel. Then I started copying
files  from  windows  thru  SMB  CIFS  to /dev/null. And after hour it
crashed. Crash looks absolutely identical to the crashes that happened
on real MIPS<>ARM link.

Now i'm not sure problem is MIPS related. Probably its l2tp related.

<7>[ 3707.725497] wireguard: Sending handshake initiation to peer 3
(192.168.11.1:51820)
<7>[ 3707.867389] wireguard: Receiving handshake response from peer 3
(192.168.11.1:51820)
<7>[ 3707.875227] wireguard: Keypair 32 created for peer 3
<7>[ 3707.883725] wireguard: Sending keepalive packet to peer 3
(192.168.11.1:51820)
<7>[ 3707.917393] wireguard: Keypair 30 destroyed for peer 3
<7>[ 3827.891019] wireguard: Sending handshake initiation to peer 3
(192.168.11.1:51820)
<7>[ 3828.033812] wireguard: Receiving handshake response from peer 3
(192.168.11.1:51820)
<7>[ 3828.041650] wireguard: Keypair 33 created for peer 3
<7>[ 3828.046879] wireguard: Sending keepalive packet to peer 3
(192.168.11.1:51820)
<7>[ 3828.094491] wireguard: Keypair 31 destroyed for peer 3
<7>[ 3948.047679] wireguard: Sending handshake initiation to peer 3
(192.168.11.1:51820)
<1>[ 3948.151546] CPU 0 Unable to handle kernel paging request at
virtual address 000000d8, epc =3D=3D 800a6a40, ra =3D=3D 800c0470
<4>[ 3948.162149] Oops[#1]:
<4>[ 3948.164425] CPU: 0 PID: 0 Comm:  Not tainted 4.4.30 #0
<4>[ 3948.169549] task: 830e6c00 ti: 830e6000 task.ti:   (null)
<4>[ 3948.174930] $ 0   : 00000000 00000001 00000000 00000003
<4>[ 3948.180176] $ 4   : 830e6c00 00010000 00000000 00000001
<4>[ 3948.185424] $ 8   : 830e6c00 00466f92 00000002 00000001
<4>[ 3948.190671] $12   : 003d08ff c0a80b01 00000000 00000000
<4>[ 3948.195918] $16   : 00000001 830e6c00 00000002 8049f4f0
<4>[ 3948.201166] $20   : 3cdc49e0 00000397 804a01e0 830e7fb8
<4>[ 3948.206413] $24   : 00000000 800817ac
<4>[ 3948.211660] $28   : 830e6000 830e7db0 003d0900 800c0470
<4>[ 3948.216908] Hi    : 00000397
<4>[ 3948.219783] Lo    : 37233800
<4>[ 3948.222681] epc   : 800a6a40 account_system_time+0x158/0x1e0
<4>[ 3948.228327] ra    : 800c0470 update_process_times+0x24/0x70
<4>[ 3948.233878] Status: 10007c02      KERNEL EXL
<4>[ 3948.237811] Cause : 00800008 (ExcCode 02)
<4>[ 3948.241810] BadVA : 000000d8
<4>[ 3948.244686] PrId  : 00019374 (MIPS 24Kc)
<4>[ 3948.248598] Modules linked in: ath9k ath9k_common pppoe
ppp_async l2tp_ppp iptable_nat ath9k_hw ath pptp pppox ppp_mppe
ppp_generic nf_nat_pptp nf_nat_ipv4 nf_nat_amanda nf_conntrack_pptp
nf_conntrack_ipv6 nf_conntrack_ipv4 nf_conntrack_amanda mac80211
ipt_REJECT ipt_MASQUERADE cfg80211 xt_u32 xt_time xt_tcpudp xt_tcpmss
xt_string xt_statistic xt_state xt_recent xt_quota xt_pkttype
xt_physdev xt_owner xt_nat xt_multiport xt_mark xt_mac xt_limit
xt_length xt_id xt_hl xt_helper xt_hashlimit xt_ecn xt_dscp
xt_conntrack xt_connmark xt_connlimit xt_connbytes xt_comment
xt_addrtype xt_TCPMSS xt_REDIRECT xt_NFQUEUE xt_NFLOG xt_NETMAP xt_LOG
xt_IPMARK xt_HL xt_DSCP xt_CT xt_CLASSIFY ts_kmp ts_fsm ts_bm slhc
nfnetlink_queue nfnetlink_log nf_reject_ipv4 nf_nat_tftp
nf_nat_snmp_basic nf_nat_sip nf_nat_redirect nf_nat_proto_gre
nf_nat_masquerade_ipv4 nf_nat_irc nf_nat_h323 nf_nat_ftp nf_nat
nf_log_ipv4 nf_defrag_ipv6 nf_defrag_ipv4 nf_conntrack_tftp
nf_conntrack_snmp nf_conntrack_sip nf_conntrack_rtcache
nf_conntrack_proto_gre nf_conntrack_netlink nf_conntrack_irc
nf_conntrack_h323 nf_conntrack_ftp nf_conntrack_broadcast iptable_raw
iptable_mangle iptable_filter ipt_ECN ip_tables crc_ccitt
compat_xtables compat br_netfilter em_cmp sch_teql em_nbyte sch_dsmark
sch_pie act_ipt sch_codel sch_gred sch_htb cls_basic sch_prio em_text
em_meta act_police sch_red sch_tbf sch_sfq sch_fq act_connmark
nf_conntrack act_skbedit act_mirred em_u32 cls_u32 cls_tcindex
cls_flow cls_route cls_fw sch_hfsc sch_ingress sg ledtrig_usbport
xt_set ip_set_list_set ip_set_hash_netiface ip_set_hash_netport
ip_set_hash_netnet ip_set_hash_net ip_set_hash_netportnet
ip_set_hash_mac ip_set_hash_ipportnet ip_set_hash_ipportip
ip_set_hash_ipport ip_set_hash_ipmark ip_set_hash_ip
ip_set_bitmap_port ip_set_bitmap_ipmac ip_set_bitmap_ip ip_set
nfnetlink ip6t_REJECT nf_reject_ipv6 nf_log_ipv6 nf_log_common
ip6table_raw ip6table_mangle ip6table_filter ip6_tables ip_gre gre ifb
wireguard x_tables l2tp_ip6 l2tp_ip sit l2tp_netlink l2tp_core
udp_tunnel ip6_udp_tunnel tunnel4 ip_tunnel tun nls_utf8 sha1_generic
ecb usb_storage ehci_platform ehci_hcd sd_mod scsi_mod rndis_host
cdc_ether usbnet gpio_button_hotplug ext4 jbd2 mbcache usbcore
nls_base usb_common crc16 mii cryptomgr aead crypto_null
crc32c_generic crypto_hash
<4>[ 3948.450467] Process  (pid: 0, threadinfo=3D830e6000,
task=3D830e6c00, tls=3D00000000)
<4>[ 3948.457752] Stack : 00000000 00000000 00000000 00000000 00000000
830e6c00 00000000 80530000
<4>[ 3948.457752]         80530000 800c0470 80530000 80530000 3cdc49e0
00000397 804a01e0 80530000
<4>[ 3948.457752]         00000000 800cef5c 00000000 00000000 00000000
00000000 804a0080 804a0040
<4>[ 3948.457752]         00000397 3cdc49e0 804a0080 804a0000 804a01e0
804a0040 00000001 00000397
<4>[ 3948.457752]         3cdc33f4 3cdc33f4 804a0000 800c1300 00000000
00000000 00000000 00000000
<4>[ 3948.457752]         ...
<4>[ 3948.493496] Call Trace:
<4>[ 3948.495949] [<800a6a40>] account_system_time+0x158/0x1e0
<4>[ 3948.501245]
<4>[ 3948.502726]
<4>[ 3948.502726] Code: 8e22022c  00473821  ae27022c <90c200d8>
304200ff  10400005  001210c0  8e2202c0  14400010
<4>[ 3948.512703] ---[ end trace c97c3d3ad4123a9a ]---
