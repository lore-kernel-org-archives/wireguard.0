Return-Path: k@vodka.home.kg
Received: from mail.kotidze.in (mail.kotidze.in [91.92.66.82])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29a78e97
 for <wireguard@lists.zx2c4.com>; Wed, 9 Nov 2016 09:54:08 +0000 (UTC)
Received: from private.domain by mail.kotidze.in with [XMail 1.27 ESMTP Server]
 id <S1A4C> for <wireguard@lists.zx2c4.com> from <k@vodka.home.kg>;
 Wed, 9 Nov 2016 12:56:03 +0300
Date: Wed, 9 Nov 2016 12:56:01 +0300
From: k@vodka.home.kg
Message-ID: <1491967395.20161109125601@vodka.home.kg>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <1522436030.20161107130256@vodka.home.kg>
References: <25241985.20161106100258@vodka.home.kg>  
 <1289478110.20161106110707@vodka.home.kg>
 <CAHmME9rjEeuodHMM4Quo1NVXT2A2DYUj=3FPgep-f4hNXeCh5g@mail.gmail.com>
 <1522436030.20161107130256@vodka.home.kg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

I recompiled kernel with CONFIG_DEBUG_STACKOVERFLOW.
Can confirm that crash is caused by kernel stack overflow.
Wireguard   uses  different  implementations  of  crypto  routines  for
different CPUs. Suprisingly MIPS32 uses more stack than X64.
Kernel stack size is only 8kb and it cant be changed.
Also  it  contains  task  struct  at  the  stack  bottom  and  it gets
overwritten. I was extremely surprised when I knew about task struct.
Very very stupid decision.
I  also  understand  why  only l2tp causes crash. L2tp uses additional
stack space. Without l2tp stack has enough size.
Anyway, look at the crash and take measures.


<7>[  176.817848] wireguard: Receiving handshake response from peer 1 (:16)
<7>[  176.838476] wireguard: Keypair 2 created for peer 1
<7>[  176.844450] wireguard: Sending keepalive packet to peer 1 (:16)
<7>[  296.851870] wireguard: Sending handshake initiation to peer 1 (:16)
><4>[  296.972466] do_IRQ: stack overflow: 924
<4>[  296.976321] CPU: 0 PID: 6 Comm: kworker/u2:0 Tainted: G        W     =
  4.4.30 #0
<4>[  296.983747] Workqueue: wireguard-wg-wgkk packet_process_queued_handsh=
ake_packets [wireguard]
<4>[  296.992168] Stack : 00000000 800b1108 800b10e4 80430de4 8042bb60 0000=
0006 80461db0 83848344
<4>[  296.992168]         000d56d1 800aebec 804a0000 8009fbc0 00000000 801f=
3890 00000000 83848344
<4>[  296.992168]         80430de4 8381dd00 804a0000 8009c1f8 00000000 8384=
837c 00000000 8023df54
<4>[  296.992168]         804a42b0 83848300 83146c58 80b0b600 80a8c000 7769=
7265 67756172 642d7767
<4>[  296.992168]         2d77676b 6b000000 00000000 00000000 00000000 0000=
0000 00000000 00000000
<4>[  296.992168]         ...
<4>[  297.027911] Call Trace:
<4>[  297.030366] [<800732bc>] show_stack+0x50/0x84
<4>[  297.034717] [<8006fed0>] do_IRQ+0x3c/0x54
<4>[  297.038735] [<8006b870>] plat_irq_dispatch+0xd4/0x10c
<4>[  297.043780] [<80060820>] ret_from_irq+0x0/0x4
<4>[  297.048141] [<831507a0>] poly1305_generic_blocks+0x80/0x298 [wireguar=
d]
<4>[  297.054768] [<83150a58>] poly1305_update+0xa0/0x118 [wireguard]
<4>[  297.060699] [<8315109c>] chacha20poly1305_encrypt_sg+0x1d0/0x2e4 [wir=
eguard]
<4>[  297.067737]=20
<1>[  297.069318] CPU 0 Unable to handle kernel paging request at virtual a=
ddress 00000140, epc =3D=3D 8007a0bc, ra =3D=3D 80060824
<4>[  297.079903] Oops[#1]:
<4>[  297.082175] CPU: 0 PID: 5 Comm: kworker/0:0H Tainted: G        W     =
  4.4.30 #0
<4>[  297.089560] task: 8382d4c0 ti: 83842000 task.ti: 83842000
<4>[  297.094939] $ 0   : 00000000 00000000 00000000 40000140
<4>[  297.100185] $ 4   : 83844118 00030000 00000140 01000000
<4>[  297.105433] $ 8   : 1000fc00 1000001e b4dd4aa9 83848580
<4>[  297.110680] $12   : 83848498 00000000 00000000 00000000
<4>[  297.115928] $16   : 83844118 00000140 804aac98 00000000
<4>[  297.121175] $20   : c0000000 ffffffff 000d56d1 12685800
<4>[  297.126422] $24   : 80a0f000 03ae7800                 =20
<4>[  297.131669] $28   : 83844000 83844048 00000000 80060824
<4>[  297.136917] Hi    : 00000028
<4>[  297.139791] Lo    : 00000000
<4>[  297.142675] epc   : 8007a0bc __do_page_fault+0x5c/0x518
<4>[  297.147893] ra    : 80060824 resume_userspace_check+0x0/0x10
<4>[  297.153533] Status: 1000fc02      KERNEL EXL=20
<4>[  297.157466] Cause : c0808008 (ExcCode 02)
<4>[  297.161465] BadVA : 00000140
<4>[  297.164332] PrId  : 00019374 (MIPS 24Kc)
<4>[  297.168244] Modules linked in: ath9k ath9k_common pppoe ppp_async l2t=
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
<4>[  297.370113] Process kworker/0:0H (pid: 5, threadinfo=3D83842000, task=
=3D8382d4c0, tls=3D00000000)
<4>[  297.378437] Stack : 00000000 00000000 00000000 00000000 00000000 0000=
0000 00000000 00000000
<4>[  297.378437]         00000000 00000000 00000000 00030001 00000000 0000=
0000 00000000 00000000
<4>[  297.378437]         00000000 00000000 00000000 00000000 00000000 0000=
0000 00000000 00000000
<4>[  297.378437]         00000000 00000000 00000000 00000000 00000000 0000=
0000 00000000 00000000
<4>[  297.378437]         00000000 00000000 00000000 00000000 00000000 0000=
0000 00000000 00000000
<4>[  297.378437]         ...
<4>[  297.414181] Call Trace:
<4>[  297.416626] [<8007a0bc>] __do_page_fault+0x5c/0x518
<4>[  297.421489]=20
<4>[  297.422969]=20
<4>[  297.422969] Code: 0062102b  00808021  00c08821 <144000b3> 8e770140  8=
f820000  8c4203a8  1440006e  00000000=20
<4>[  297.441809] ---[ end trace 664b494d95ff5fb2 ]---
