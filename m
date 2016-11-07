Return-Path: k@vodka.home.kg
Received: from mail.kotidze.in (mail.kotidze.in [91.92.66.82])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 684e7318
 for <wireguard@lists.zx2c4.com>; Mon, 7 Nov 2016 10:01:16 +0000 (UTC)
Received: from private.domain by mail.kotidze.in with [XMail 1.27 ESMTP Server]
 id <S19E9> for <wireguard@lists.zx2c4.com> from <k@vodka.home.kg>;
 Mon, 7 Nov 2016 13:02:57 +0300
Date: Mon, 7 Nov 2016 13:02:56 +0300
From: k@vodka.home.kg
Message-ID: <1522436030.20161107130256@vodka.home.kg>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <CAHmME9rjEeuodHMM4Quo1NVXT2A2DYUj=3FPgep-f4hNXeCh5g@mail.gmail.com>
References: <25241985.20161106100258@vodka.home.kg>
 <1289478110.20161106110707@vodka.home.kg>
 <CAHmME9rjEeuodHMM4Quo1NVXT2A2DYUj=3FPgep-f4hNXeCh5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

> Not a lot of participation from the LEDE package maintainer, so I just
> ordered a TL-WR841N for =E2=82=AC10, which should arrive on Tuesday, and =
then
> I'll try to reproduce on actual hardware, and in general keep things
> rolling well on this platform.

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

<7>[ 3707.725497] wireguard: Sending handshake initiation to peer 3 (192.16=
8.11.1:51820)
<7>[ 3707.867389] wireguard: Receiving handshake response from peer 3 (192.=
168.11.1:51820)
<7>[ 3707.875227] wireguard: Keypair 32 created for peer 3
<7>[ 3707.883725] wireguard: Sending keepalive packet to peer 3 (192.168.11=
.1:51820)
<7>[ 3707.917393] wireguard: Keypair 30 destroyed for peer 3
<7>[ 3827.891019] wireguard: Sending handshake initiation to peer 3 (192.16=
8.11.1:51820)
<7>[ 3828.033812] wireguard: Receiving handshake response from peer 3 (192.=
168.11.1:51820)
<7>[ 3828.041650] wireguard: Keypair 33 created for peer 3
<7>[ 3828.046879] wireguard: Sending keepalive packet to peer 3 (192.168.11=
.1:51820)
<7>[ 3828.094491] wireguard: Keypair 31 destroyed for peer 3
<7>[ 3948.047679] wireguard: Sending handshake initiation to peer 3 (192.16=
8.11.1:51820)
<1>[ 3948.151546] CPU 0 Unable to handle kernel paging request at virtual a=
ddress 000000d8, epc =3D=3D 800a6a40, ra =3D=3D 800c0470
<4>[ 3948.162149] Oops[#1]:
<4>[ 3948.164425] CPU: 0 PID: 0 Comm:  Not tainted 4.4.30 #0
<4>[ 3948.169549] task: 830e6c00 ti: 830e6000 task.ti:   (null)
<4>[ 3948.174930] $ 0   : 00000000 00000001 00000000 00000003
<4>[ 3948.180176] $ 4   : 830e6c00 00010000 00000000 00000001
<4>[ 3948.185424] $ 8   : 830e6c00 00466f92 00000002 00000001
<4>[ 3948.190671] $12   : 003d08ff c0a80b01 00000000 00000000
<4>[ 3948.195918] $16   : 00000001 830e6c00 00000002 8049f4f0
<4>[ 3948.201166] $20   : 3cdc49e0 00000397 804a01e0 830e7fb8
<4>[ 3948.206413] $24   : 00000000 800817ac                 =20
<4>[ 3948.211660] $28   : 830e6000 830e7db0 003d0900 800c0470
<4>[ 3948.216908] Hi    : 00000397
<4>[ 3948.219783] Lo    : 37233800
<4>[ 3948.222681] epc   : 800a6a40 account_system_time+0x158/0x1e0
<4>[ 3948.228327] ra    : 800c0470 update_process_times+0x24/0x70
<4>[ 3948.233878] Status: 10007c02      KERNEL EXL=20
<4>[ 3948.237811] Cause : 00800008 (ExcCode 02)
<4>[ 3948.241810] BadVA : 000000d8
<4>[ 3948.244686] PrId  : 00019374 (MIPS 24Kc)
<4>[ 3948.248598] Modules linked in: ath9k ath9k_common pppoe ppp_async l2t=
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
<4>[ 3948.450467] Process  (pid: 0, threadinfo=3D830e6000, task=3D830e6c00,=
 tls=3D00000000)
<4>[ 3948.457752] Stack : 00000000 00000000 00000000 00000000 00000000 830e=
6c00 00000000 80530000
<4>[ 3948.457752]         80530000 800c0470 80530000 80530000 3cdc49e0 0000=
0397 804a01e0 80530000
<4>[ 3948.457752]         00000000 800cef5c 00000000 00000000 00000000 0000=
0000 804a0080 804a0040
<4>[ 3948.457752]         00000397 3cdc49e0 804a0080 804a0000 804a01e0 804a=
0040 00000001 00000397
<4>[ 3948.457752]         3cdc33f4 3cdc33f4 804a0000 800c1300 00000000 0000=
0000 00000000 00000000
<4>[ 3948.457752]         ...
<4>[ 3948.493496] Call Trace:
<4>[ 3948.495949] [<800a6a40>] account_system_time+0x158/0x1e0
<4>[ 3948.501245]=20
<4>[ 3948.502726]=20
<4>[ 3948.502726] Code: 8e22022c  00473821  ae27022c <90c200d8> 304200ff  1=
0400005  001210c0  8e2202c0  14400010=20
<4>[ 3948.512703] ---[ end trace c97c3d3ad4123a9a ]---


--=20
=D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=D0=BC,
 K                          mailto:k@vodka.home.kg
