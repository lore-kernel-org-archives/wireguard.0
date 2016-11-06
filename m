Return-Path: k@vodka.home.kg
Received: from mail.kotidze.in (mail.kotidze.in [91.92.66.82])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f9f69bd
 for <wireguard@lists.zx2c4.com>; Sun, 6 Nov 2016 07:01:33 +0000 (UTC)
Received: from private.domain by mail.kotidze.in with [XMail 1.27 ESMTP Server]
 id <S19CC> for <wireguard@lists.zx2c4.com> from <k@vodka.home.kg>;
 Sun, 6 Nov 2016 10:03:06 +0300
Date: Sun, 6 Nov 2016 10:02:58 +0300
From: k@vodka.home.kg
Message-ID: <25241985.20161106100258@vodka.home.kg>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [WireGuard] mips32 crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

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
I enabled dbgprint in wireguard module : echo "module wireguard +p" >/sys/k=
ernel/debug/dynamic_debug/control

Typical crash log :

---------------------
<7>[13785.407900] wireguard: Sending handshake initiation to peer 1 (x.x.x.=
x:16)
<7>[13785.514312] wireguard: Receiving handshake response from peer 1 ((inv=
alid address))
<7>[13785.532044] wireguard: Keypair 106 created for peer 1
<7>[13785.537164] wireguard: Sending keepalive packet to peer 1 (x.x.x.x:16)
<7>[13785.550835] wireguard: Keypair 104 destroyed for peer 1
<7>[13905.531148] wireguard: Sending handshake initiation to peer 1 (x.x.x.=
x:16)
<4>[13905.629622] ------------[ cut here ]------------
<1>[13905.634339] CPU 0 Unable to handle kernel paging request at virtual a=
ddress 000100d7, epc =3D=3D 800a6a40, ra =3D=3D 800c0470
<4>[13905.634349] Oops[#1]:
<4>[13905.634360] CPU: 0 PID: 41189632 Comm:  Not tainted 4.4.30 #0
<4>[13905.634369] task: 810000ce ti: 82bca000 task.ti: 00018100
<4>[13905.634381] $ 0   : 00000000 00000001 02f40000 00000003
<4>[13905.634392] $ 4   : 810000ce 00010000 0000ffff 02f40001
<4>[13905.634402] $ 8   : 810000ce fffe6d57 00000002 00000001
<4>[13905.634412] $12   : 003d08ff c781e3dc 00000000 00000000
<4>[13905.634423] $16   : 00000001 810000ce 00000002 8049f4f0
<4>[13905.634434] $20   : ad4f6c42 00000ca5 804a01e0 82bcbd90
<4>[13905.634444] $24   : 00000000 8023b14c                 =20
<4>[13905.634455] $28   : 82bca000 82bcbb88 003d0900 800c0470
<4>[13905.634457] Hi    : 00000ca5
<4>[13905.634460] Lo    : 8295ea00
<4>[13905.634487] epc   : 800a6a40 account_system_time+0x158/0x1e0
<4>[13905.634497] ra    : 800c0470 update_process_times+0x24/0x70
<4>[13905.634504] Status: 10007c02      KERNEL EXL=20
<4>[13905.634507] Cause : 00800008 (ExcCode 02)
<4>[13905.634510] BadVA : 000100d7
<4>[13905.634514] PrId  : 00019374 (MIPS 24Kc)
<4>[13905.634666] Modules linked in: ath9k ath9k_common pppoe ppp_async l2t=
p_ppp iptable_nat ath9k_hw ath pptp pppox ppp_mppe ppp_generic nf_nat_pptp =
nf_nat_ipv4 nf_nat_amanda nf_conntrack_pptp nf_conntrack_ipv6 nf_conntrack_=
ipv4 nf_conntrack_amanda mac80211 ipt_REJECT ipt_MASQUERADE cfg80211 xt_u32=
 xt_time xt_tcpudp xt_tcpmss xt_string xt_statistic xt_state xt_recent xt_q=
uota xt_pkttype xt_physdev xt_owner xt_nat xt_multiport xt_mark xt_mac xt_l=
imit xt_length xt_id xt_hl xt_helper xt_hashlimit xt_ecn xt_dscp xt_conntra=
ck xt_connmark xt_connlimit xt_connbytes xt_comment xt_addrtype xt_TCPMSS x=
t_REDIRECT xt_NFQUEUE xt_NFLOG xt_NETMAP xt_LOG xt_IPMARK xt_HL xt_DSCP xt_=
CT xt_CLASSIFY ts_kmp ts_fsm ts_bm slhc nfnetlink_queue nfnetlink_log nf_re=
ject_ipv4 nf_nat_tftp nf_nat_snmp_basic nf_nat_sip nf_nat_redirect nf_nat_p=
roto_gre nf_nat_masquerade_ipv4 nf_nat_irc nf_nat_h323 nf_nat_ftp nf_nat nf=
_log_ipv4 nf_defrag_ipv6 nf_defrag_ipv4 nf_conntrack_tftp nf_conntrack_snmp=
 nf_conntrack_sip nf_conntrack_rtcache nf_conntrack_proto_gre nf_conntrack_=
netlink nf_conntrack_irc nf_conntrack_h323 nf_conntrack_ftp nf_conntrack_br=
oadcast iptable_raw iptable_mangle iptable_filter ipt_ECN ip_tables crc_cci=
tt compat_xtables compat br_netfilter em_cmp sch_teql em_nbyte sch_dsmark s=
ch_pie act_ipt sch_codel sch_gred sch_htb cls_basic sch_prio em_text em_met=
a act_police sch_red sch_tbf sch_sfq sch_fq act_connmark nf_conntrack act_s=
kbedit act_mirred em_u32 cls_u32 cls_tcindex cls_flow cls_route cls_fw sch_=
hfsc sch_ingress sg ledtrig_usbport xt_set ip_set_list_set ip_set_hash_neti=
face ip_set_hash_netport ip_set_hash_netnet ip_set_hash_net ip_set_hash_net=
portnet ip_set_hash_mac ip_set_hash_ipportnet ip_set_hash_ipportip ip_set_h=
ash_ipport ip_set_hash_ipmark ip_set_hash_ip ip_set_bitmap_port ip_set_bitm=
ap_ipmac ip_set_bitmap_ip ip_set nfnetlink ip6t_REJECT nf_reject_ipv6 nf_lo=
g_ipv6 nf_log_common ip6table_raw ip6table_mangle ip6table_filter ip6_table=
s ip_gre gre ifb wireguard x_tables l2tp_ip6 l2tp_ip sit l2tp_netlink l2tp_=
core udp_tunnel ip6_udp_tunnel tunnel4 ip_tunnel tun nls_utf8 sha1_generic =
ecb usb_storage ehci_platform ehci_hcd sd_mod scsi_mod rndis_host cdc_ether=
 usbnet gpio_button_hotplug ext4 jbd2 mbcache usbcore nls_base usb_common c=
rc16 mii cryptomgr aead crypto_null crc32c_generic crypto_hash
<4>[13905.634933] Process  (pid: 41189632, threadinfo=3D82bca000, task=3D81=
0000ce, tls=3D8100cea5)
<4>[13905.635014] Stack : 00000244 000001b1 000001b2 00000245 00000000 8100=
00ce 00000000 80530000
<4>[13905.635014]         80530000 800c0470 80530000 80530000 ad4f6c42 0000=
0ca5 804a01e0 80530000
<4>[13905.635014]         00000000 800cef5c 00000000 00000000 0000a7b2 0000=
a7b0 804a0080 804a0040
<4>[13905.635014]         00000ca5 ad4f6c42 804a0080 804a0000 804a01e0 804a=
0040 00000001 00000ca5
<4>[13905.635014]         ad4f61a1 ad4f61a1 804a0000 800c1300 00000000 0000=
0000 00000000 00000000
<4>[13905.635014]         ...
<4>[13905.635017] Call Trace:
<4>[13905.635030] [<800a6a40>] account_system_time+0x158/0x1e0
<4>[13905.635034]=20
<4>[13905.635059]=20
<4>[13905.635059] Code: 8e22022c  00473821  ae27022c <90c200d8> 304200ff  1=
0400005  001210c0  8e2202c0  14400010=20
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
