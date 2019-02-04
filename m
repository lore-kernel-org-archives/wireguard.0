Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB9FC10F00
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:30:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B14C21B69
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B14C21B69
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anatoli.ws
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dccf4ecb;
	Sun, 17 Feb 2019 01:22:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8218edbb
 for <wireguard@lists.zx2c4.com>; Mon, 4 Feb 2019 16:44:15 +0000 (UTC)
Received: from p3plsmtpa09-07.prod.phx3.secureserver.net
 (p3plsmtpa09-07.prod.phx3.secureserver.net [173.201.193.236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8f75330
 for <wireguard@lists.zx2c4.com>; Mon, 4 Feb 2019 16:44:14 +0000 (UTC)
Received: from [10.101.10.10] ([177.54.157.114]) by :SMTPAUTH: with ESMTPSA
 id qhSJgUYKwod8qqhSNgffdF; Mon, 04 Feb 2019 09:50:52 -0700
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Anatoli <me@anatoli.ws>
Subject: BUG: unable to handle kernel NULL pointer dereference at .. (linux
 3.13)
Message-ID: <71ef4a71-19fe-8d4e-c3a2-f704ad8e8b67@anatoli.ws>
Date: Mon, 4 Feb 2019 13:50:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Language: es-AR
X-CMAE-Envelope: MS4wfLGhZ5E307q+PlHEWnaZowQ5/rLGw1KA5lHCqqvuobkTO9mIz5LO2qhxPJHZEgbDLcWPlUabds13zba/FaXEsArrVTVcyUrh7qmik8zIHaylyyxO5uBO
 GV/fyr6S8xfz3D5XURZAFmKGWkvnvo8LXdoNLjijEUrbQpL28K8TX0Z+
X-Mailman-Approved-At: Sun, 17 Feb 2019 02:22:13 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7009716939091652763=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============7009716939091652763==
Content-Type: multipart/alternative;
 boundary="------------9033E3AE737DBA50F91A88AA"
Content-Language: es-AR

This is a multi-part message in MIME format.
--------------9033E3AE737DBA50F91A88AA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I'm trying to make WG work on Ubuntu 14.04.5, but got a driver bug 
apparently.

WG was installed this way: sudo add-apt-repository 
ppa:wireguard/wireguard && sudo apt update && sudo apt install wireguard

Then, the following commands were executed (mixed with syslog output):

$ lsb_release -a
Distributor ID:    Ubuntu
Description:    Ubuntu 14.04.5 LTS
Release:    14.04
Codename:    trusty

$ uname -a
Linux l 3.13.0-165-generic #215-Ubuntu SMP Wed Jan 16 11:46:47 UTC 2019 
x86_64 x86_64 x86_64 GNU/Linux

$ apt search wireguard
wireguard/trusty,now 0.0.20190123-wg1~trusty all [installed]
wireguard-dkms/trusty,now 0.0.20190123-wg1~trusty all [installed,automatic]
wireguard-tools/trusty,now 0.0.20190123-wg1~trusty amd64 
[installed,automatic]



$ wg genkey | tee privatekey | wg pubkey > publickey

$ sudo ip link add dev wg0 type wireguard

Feb  4 13:20:37 l kernel: [  248.082139] wireguard: module verification 
failed: signature and/or  required key missing - tainting kernel
Feb  4 13:20:37 l kernel: [  248.082815] wireguard: WireGuard 
0.0.20190123 loaded. See www.wireguard.com for information.
Feb  4 13:20:37 l kernel: [  248.082816] wireguard: Copyright (C) 
2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.


$ sudo ip addr add 10.0.0.1/24 dev wg0
$ sudo wg set wg0 listen-port 500 private-key ./privatekey
$ sudo ip link set wg0 up

Feb  4 13:22:12 l kernel: [  342.791370] BUG: unable to handle kernel 
NULL pointer dereference at 0000000000000018
Feb  4 13:22:12 l kernel: [  342.791635] IP: [<ffffffffa036d7ec>] 
wg_socket_init+0x13c/0x3f0 [wireguard]
Feb  4 13:22:12 l kernel: [  342.791861] PGD 80000000b2899067 PUD 
b2a0d067 PMD 0
Feb  4 13:22:12 l kernel: [  342.792043] Oops: 0000 [#1] SMP
Feb  4 13:22:12 l kernel: [  342.792162] Modules linked in: 
wireguard(OX) ip_tunnel iptable_mangle xt_nat iptable_nat nf_nat_ipv4 
ipt_REJECT xt_tcpmss xt_tcpudp xt_LOG xt_limit nf_conntrack_ipv4 
nf_defrag_ipv4 xt_owner xt_recent xt_set xt_conntrack iptable_filter 
ip_tables ip_set_hash_ip ip_set nfnetlink bridge stp llc intel_rapl 
e1000e x86_pkg_temp_thermal intel_powerclamp r8169 mii kvm_intel ptp 
gpio_ich ipmi_devintf lpc_ich pps_core joydev shpchp kvm 
crct10dif_pclmul ipmi_si crc32_pclmul ghash_clmulni_intel 
nf_conntrack_sip nf_conntrack_tftp xt_multiport x_tables nf_nat_ftp 
nf_nat nf_conntrack_ftp nf_conntrack coretemp lp nls_iso8859_1 parport 
dm_crypt raid10 raid456 async_raid6_recov async_memcpy async_pq 
async_xor xor async_tx raid6_pq raid0 multipath linear raid1 hid_generic 
aesni_intel snd_pcsp aes_x86_64 glue_helper snd_pcm lrw snd_page_alloc 
gf128mul snd_timer ablk_helper usbhid ahci snd cryptd soundcore libahci 
hid wmi mac_hid
Feb  4 13:22:12 l kernel: [  342.795383] CPU: 6 PID: 3154 Comm: ip 
Tainted: G           OX 3.13.0-165-generic #215-Ubuntu
Feb  4 13:22:12 l kernel: [  342.795650] Hardware name: IBM IBM System 
x3100 M4
Feb  4 13:22:12 l kernel: [  342.795957] task: ffff88021cb0b000 ti: 
ffff8800af964000 task.ti: ffff8800af964000
Feb  4 13:22:12 l kernel: [  342.796192] RIP: 0010:[<ffffffffa036d7ec>]  
[<ffffffffa036d7ec>] wg_socket_init+0x13c/0x3f0 [wireguard]
Feb  4 13:22:12 l kernel: [  342.796497] RSP: 0018:ffff8800af9656e0  
EFLAGS: 00010202
Feb  4 13:22:12 l kernel: [  342.796665] RAX: 0000000000000000 RBX: 
ffff88021b300880 RCX: 000000007fbae3ff
Feb  4 13:22:12 l kernel: [  342.796894] RDX: ffff88021b300880 RSI: 
ffff880221d7f980 RDI: ffffffff81cded00
Feb  4 13:22:12 l kernel: [  342.797120] RBP: ffff8800af965798 R08: 
ffff88023fd94690 R09: 0000000000000004
Feb  4 13:22:12 l kernel: [  342.797344] R10: ffff88023fd94688 R11: 
ffffc90004e0ca8c R12: 0000000000000065
Feb  4 13:22:12 l kernel: [  342.797568] R13: 0000000000000000 R14: 
ffff8800af96573c R15: 00000000000001f4
Feb  4 13:22:12 l kernel: [  342.797794] FS: 00007f34c4d92740(0000) 
GS:ffff88023fd80000(0000) knlGS:0000000000000000
Feb  4 13:22:12 l kernel: [  342.798050] CS:  0010 DS: 0000 ES: 0000 
CR0: 0000000080050033
Feb  4 13:22:12 l kernel: [  342.798230] CR2: 0000000000000018 CR3: 
00000000af87a000 CR4: 0000000000160770
Feb  4 13:22:12 l kernel: [  342.798455] Stack:
Feb  4 13:22:12 l kernel: [  342.798520]  ffff8800af965750 
ffff880221d7f980 0000000000000000 ffff88021b300880
Feb  4 13:22:12 l kernel: [  342.798784]  ffffffff8162bd01 
ffffffffa036c340 0000000000000002 0000000000000000
Feb  4 13:22:12 l kernel: [  342.799046]  0000000000000000 
0000000000000000 0000f40100000000 0000000a00000001
Feb  4 13:22:12 l kernel: [  342.799309] Call Trace:
Feb  4 13:22:12 l kernel: [  342.806648] [<ffffffff8162bd01>] ? 
skb_copy_and_csum_dev+0xb1/0xc0
Feb  4 13:22:12 l kernel: [  342.814226] [<ffffffffa036c340>] ? 
send6+0x340/0x340 [wireguard]
Feb  4 13:22:12 l kernel: [  342.821781] [<ffffffffa0367a2a>] 
wg_open+0x5a/0xe0 [wireguard]
Feb  4 13:22:12 l kernel: [  342.829201] [<ffffffff8163f942>] 
__dev_open+0xc2/0x140
Feb  4 13:22:12 l kernel: [  342.836477] [<ffffffff8163fc53>] 
__dev_change_flags+0xa3/0x180
Feb  4 13:22:12 l kernel: [  342.843676] [<ffffffff8163fd59>] 
dev_change_flags+0x29/0x60
Feb  4 13:22:12 l kernel: [  342.850884] [<ffffffff8164f176>] 
do_setlink+0x2f6/0x9a0
Feb  4 13:22:12 l kernel: [  342.857911] [<ffffffff8139c442>] ? 
nla_parse+0x32/0x120
Feb  4 13:22:12 l kernel: [  342.864767] [<ffffffff8164fd1a>] 
rtnl_newlink+0x3ba/0x620
Feb  4 13:22:12 l kernel: [  342.871445] [<ffffffff81161923>] ? 
__alloc_pages_nodemask+0x1a3/0xb90
Feb  4 13:22:12 l kernel: [  342.878020] [<ffffffff812e5f7e>] ? 
security_capable+0x1e/0x20
Feb  4 13:22:12 l kernel: [  342.884415] [<ffffffff81077e29>] ? 
ns_capable+0x29/0x50
Feb  4 13:22:12 l kernel: [  342.890633] [<ffffffff8164c718>] 
rtnetlink_rcv_msg+0x98/0x250
Feb  4 13:22:12 l kernel: [  342.896710] [<ffffffff811afc88>] ? 
__kmalloc_node_track_caller+0x58/0x2b0
Feb  4 13:22:12 l kernel: [  342.902695] [<ffffffff8162c98e>] ? 
__alloc_skb+0x7e/0x2b0
Feb  4 13:22:12 l kernel: [  342.908496] [<ffffffff8164c680>] ? 
rtnetlink_rcv+0x30/0x30
Feb  4 13:22:12 l kernel: [  342.914122] [<ffffffff8166b0ab>] 
netlink_rcv_skb+0xab/0xc0
Feb  4 13:22:12 l kernel: [  342.919616] [<ffffffff8164c678>] 
rtnetlink_rcv+0x28/0x30
Feb  4 13:22:12 l kernel: [  342.924963] [<ffffffff8166a7a0>] 
netlink_unicast+0xe0/0x1b0
Feb  4 13:22:12 l kernel: [  342.930172] [<ffffffff8166ab7e>] 
netlink_sendmsg+0x30e/0x680
Feb  4 13:22:12 l kernel: [  342.935225] [<ffffffff81623251>] 
sock_sendmsg+0x91/0xc0
Feb  4 13:22:12 l kernel: [  342.940134] [<ffffffff811bd526>] ? 
__mem_cgroup_commit_charge+0x156/0x3d0
Feb  4 13:22:12 l kernel: [  342.944970] [<ffffffff81622f2e>] ? 
move_addr_to_kernel.part.14+0x1e/0x60
Feb  4 13:22:12 l kernel: [  342.949771] [<ffffffff81623d81>] ? 
move_addr_to_kernel+0x21/0x30
Feb  4 13:22:12 l kernel: [  342.954457] [<ffffffff81623659>] 
___sys_sendmsg+0x389/0x3a0
Feb  4 13:22:12 l kernel: [  342.959123] [<ffffffff81621ecf>] ? 
sock_destroy_inode+0x2f/0x40
Feb  4 13:22:12 l kernel: [  342.963784] [<ffffffff817487d4>] ? 
__do_page_fault+0x214/0x570
Feb  4 13:22:12 l kernel: [  342.968464] [<ffffffff811dffdd>] ? 
dput+0xad/0x190
Feb  4 13:22:12 l kernel: [  342.973110] [<ffffffff811e94e4>] ? 
mntput+0x24/0x40
Feb  4 13:22:12 l kernel: [  342.977642] [<ffffffff811cab81>] ? 
__fput+0x181/0x260
Feb  4 13:22:12 l kernel: [  342.982066] [<ffffffff81624462>] 
__sys_sendmsg+0x42/0x80
Feb  4 13:22:12 l kernel: [  342.986430] [<ffffffff816244b2>] 
SyS_sendmsg+0x12/0x20
Feb  4 13:22:12 l kernel: [  342.990694] [<ffffffff8174d3bc>] 
system_call_fastpath+0x26/0x2b
Feb  4 13:22:12 l kernel: [  342.994897] Code: 7f 48 8b 78 20 e8 65 7e 
2b e1 48 8b bb 50 02 00 00 48 8b b5 50 ff ff ff 48 8d 95 60 ff ff ff e8 
8b dd 01 00 48 8b 05 9c 44 9b e1 <48> 83 78 18 00 0f 84 87 01 00 00 48 
8b 95 50 ff ff ff 48 8b bb
Feb  4 13:22:12 l kernel: [  343.008678] RIP [<ffffffffa036d7ec>] 
wg_socket_init+0x13c/0x3f0 [wireguard]
Feb  4 13:22:12 l kernel: [  343.013245]  RSP <ffff8800af9656e0>
Feb  4 13:22:12 l kernel: [  343.017746] CR2: 0000000000000018
Feb  4 13:22:12 l kernel: [  343.022234] ---[ end trace 7a6ac50ecd32399e 
]---


Any idea what could be the problem?

Regards,
Anatoli

--------------9033E3AE737DBA50F91A88AA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body smarttemplateinserted="true">
    <div id="smartTemplate4-template">
      <div style="font-size:10.0pt;font-family:Verdana,Arial"> Hi,<br>
        <br>
        I'm trying to make WG work on Ubuntu 14.04.5, but got a driver
        bug apparently.<br>
        <br>
        WG was installed this way: <font face="Courier New">sudo
          add-apt-repository ppa:wireguard/wireguard &amp;&amp; sudo apt
          update &amp;&amp; sudo apt install wireguard<br>
        </font><br>
        Then, the following commands were executed (mixed with syslog
        output):<br>
        <br>
        <font face="Courier New">$ lsb_release -a<br>
          Distributor ID:    Ubuntu<br>
          Description:    Ubuntu 14.04.5 LTS<br>
          Release:    14.04<br>
          Codename:    trusty<br>
          <br>
          $ uname -a<br>
          Linux l 3.13.0-165-generic #215-Ubuntu SMP Wed Jan 16 11:46:47
          UTC 2019 x86_64 x86_64 x86_64 GNU/Linux<br>
          <br>
          $ apt search wireguard<br>
          wireguard/trusty,now 0.0.20190123-wg1~trusty all [installed]<br>
          wireguard-dkms/trusty,now 0.0.20190123-wg1~trusty all
          [installed,automatic]<br>
          wireguard-tools/trusty,now 0.0.20190123-wg1~trusty amd64
          [installed,automatic]<br>
          <br>
          <br>
          <br>
          $ wg genkey | tee privatekey | wg pubkey &gt; publickey<br>
          <br>
          $ sudo ip link add dev wg0 type wireguard<br>
          <br>
          Feb  4 13:20:37 l kernel: [  248.082139] wireguard: module
          verification failed: signature and/or  required key missing -
          tainting kernel<br>
          Feb  4 13:20:37 l kernel: [  248.082815] wireguard: WireGuard
          0.0.20190123 loaded. See <a class="moz-txt-link-abbreviated" href="http://www.wireguard.com">www.wireguard.com</a> for information.<br>
          Feb  4 13:20:37 l kernel: [  248.082816] wireguard: Copyright
          (C) 2015-2019 Jason A. Donenfeld <a class="moz-txt-link-rfc2396E" href="mailto:Jason@zx2c4.com">&lt;Jason@zx2c4.com&gt;</a>. All
          Rights Reserved.<br>
          <br>
          <br>
          $ sudo ip addr add 10.0.0.1/24 dev wg0<br>
          $ sudo wg set wg0 listen-port 500 private-key ./privatekey<br>
          $ sudo ip link set wg0 up<br>
          <br>
          Feb  4 13:22:12 l kernel: [  342.791370] BUG: unable to handle
          kernel NULL pointer dereference at 0000000000000018<br>
          Feb  4 13:22:12 l kernel: [  342.791635] IP:
          [&lt;ffffffffa036d7ec&gt;] wg_socket_init+0x13c/0x3f0
          [wireguard]<br>
          Feb  4 13:22:12 l kernel: [  342.791861] PGD 80000000b2899067
          PUD b2a0d067 PMD 0<br>
          Feb  4 13:22:12 l kernel: [  342.792043] Oops: 0000 [#1] SMP<br>
          Feb  4 13:22:12 l kernel: [  342.792162] Modules linked in:
          wireguard(OX) ip_tunnel iptable_mangle xt_nat iptable_nat
          nf_nat_ipv4 ipt_REJECT xt_tcpmss xt_tcpudp xt_LOG xt_limit
          nf_conntrack_ipv4 nf_defrag_ipv4 xt_owner xt_recent xt_set
          xt_conntrack iptable_filter ip_tables ip_set_hash_ip ip_set
          nfnetlink bridge stp llc intel_rapl e1000e
          x86_pkg_temp_thermal intel_powerclamp r8169 mii kvm_intel ptp
          gpio_ich ipmi_devintf lpc_ich pps_core joydev shpchp kvm
          crct10dif_pclmul ipmi_si crc32_pclmul ghash_clmulni_intel
          nf_conntrack_sip nf_conntrack_tftp xt_multiport x_tables
          nf_nat_ftp nf_nat nf_conntrack_ftp nf_conntrack coretemp lp
          nls_iso8859_1 parport dm_crypt raid10 raid456
          async_raid6_recov async_memcpy async_pq async_xor xor async_tx
          raid6_pq raid0 multipath linear raid1 hid_generic aesni_intel
          snd_pcsp aes_x86_64 glue_helper snd_pcm lrw snd_page_alloc
          gf128mul snd_timer ablk_helper usbhid ahci snd cryptd
          soundcore libahci hid wmi mac_hid<br>
          Feb  4 13:22:12 l kernel: [  342.795383] CPU: 6 PID: 3154
          Comm: ip Tainted: G           OX 3.13.0-165-generic
          #215-Ubuntu<br>
          Feb  4 13:22:12 l kernel: [  342.795650] Hardware name: IBM
          IBM System x3100 M4<br>
          Feb  4 13:22:12 l kernel: [  342.795957] task:
          ffff88021cb0b000 ti: ffff8800af964000 task.ti:
          ffff8800af964000<br>
          Feb  4 13:22:12 l kernel: [  342.796192] RIP:
          0010:[&lt;ffffffffa036d7ec&gt;]  [&lt;ffffffffa036d7ec&gt;]
          wg_socket_init+0x13c/0x3f0 [wireguard]<br>
          Feb  4 13:22:12 l kernel: [  342.796497] RSP:
          0018:ffff8800af9656e0  EFLAGS: 00010202<br>
          Feb  4 13:22:12 l kernel: [  342.796665] RAX: 0000000000000000
          RBX: ffff88021b300880 RCX: 000000007fbae3ff<br>
          Feb  4 13:22:12 l kernel: [  342.796894] RDX: ffff88021b300880
          RSI: ffff880221d7f980 RDI: ffffffff81cded00<br>
          Feb  4 13:22:12 l kernel: [  342.797120] RBP: ffff8800af965798
          R08: ffff88023fd94690 R09: 0000000000000004<br>
          Feb  4 13:22:12 l kernel: [  342.797344] R10: ffff88023fd94688
          R11: ffffc90004e0ca8c R12: 0000000000000065<br>
          Feb  4 13:22:12 l kernel: [  342.797568] R13: 0000000000000000
          R14: ffff8800af96573c R15: 00000000000001f4<br>
          Feb  4 13:22:12 l kernel: [  342.797794] FS: 
          00007f34c4d92740(0000) GS:ffff88023fd80000(0000)
          knlGS:0000000000000000<br>
          Feb  4 13:22:12 l kernel: [  342.798050] CS:  0010 DS: 0000
          ES: 0000 CR0: 0000000080050033<br>
          Feb  4 13:22:12 l kernel: [  342.798230] CR2: 0000000000000018
          CR3: 00000000af87a000 CR4: 0000000000160770<br>
          Feb  4 13:22:12 l kernel: [  342.798455] Stack:<br>
          Feb  4 13:22:12 l kernel: [  342.798520]  ffff8800af965750
          ffff880221d7f980 0000000000000000 ffff88021b300880<br>
          Feb  4 13:22:12 l kernel: [  342.798784]  ffffffff8162bd01
          ffffffffa036c340 0000000000000002 0000000000000000<br>
          Feb  4 13:22:12 l kernel: [  342.799046]  0000000000000000
          0000000000000000 0000f40100000000 0000000a00000001<br>
          Feb  4 13:22:12 l kernel: [  342.799309] Call Trace:<br>
          Feb  4 13:22:12 l kernel: [  342.806648] 
          [&lt;ffffffff8162bd01&gt;] ? skb_copy_and_csum_dev+0xb1/0xc0<br>
          Feb  4 13:22:12 l kernel: [  342.814226] 
          [&lt;ffffffffa036c340&gt;] ? send6+0x340/0x340 [wireguard]<br>
          Feb  4 13:22:12 l kernel: [  342.821781] 
          [&lt;ffffffffa0367a2a&gt;] wg_open+0x5a/0xe0 [wireguard]<br>
          Feb  4 13:22:12 l kernel: [  342.829201] 
          [&lt;ffffffff8163f942&gt;] __dev_open+0xc2/0x140<br>
          Feb  4 13:22:12 l kernel: [  342.836477] 
          [&lt;ffffffff8163fc53&gt;] __dev_change_flags+0xa3/0x180<br>
          Feb  4 13:22:12 l kernel: [  342.843676] 
          [&lt;ffffffff8163fd59&gt;] dev_change_flags+0x29/0x60<br>
          Feb  4 13:22:12 l kernel: [  342.850884] 
          [&lt;ffffffff8164f176&gt;] do_setlink+0x2f6/0x9a0<br>
          Feb  4 13:22:12 l kernel: [  342.857911] 
          [&lt;ffffffff8139c442&gt;] ? nla_parse+0x32/0x120<br>
          Feb  4 13:22:12 l kernel: [  342.864767] 
          [&lt;ffffffff8164fd1a&gt;] rtnl_newlink+0x3ba/0x620<br>
          Feb  4 13:22:12 l kernel: [  342.871445] 
          [&lt;ffffffff81161923&gt;] ?
          __alloc_pages_nodemask+0x1a3/0xb90<br>
          Feb  4 13:22:12 l kernel: [  342.878020] 
          [&lt;ffffffff812e5f7e&gt;] ? security_capable+0x1e/0x20<br>
          Feb  4 13:22:12 l kernel: [  342.884415] 
          [&lt;ffffffff81077e29&gt;] ? ns_capable+0x29/0x50<br>
          Feb  4 13:22:12 l kernel: [  342.890633] 
          [&lt;ffffffff8164c718&gt;] rtnetlink_rcv_msg+0x98/0x250<br>
          Feb  4 13:22:12 l kernel: [  342.896710] 
          [&lt;ffffffff811afc88&gt;] ?
          __kmalloc_node_track_caller+0x58/0x2b0<br>
          Feb  4 13:22:12 l kernel: [  342.902695] 
          [&lt;ffffffff8162c98e&gt;] ? __alloc_skb+0x7e/0x2b0<br>
          Feb  4 13:22:12 l kernel: [  342.908496] 
          [&lt;ffffffff8164c680&gt;] ? rtnetlink_rcv+0x30/0x30<br>
          Feb  4 13:22:12 l kernel: [  342.914122] 
          [&lt;ffffffff8166b0ab&gt;] netlink_rcv_skb+0xab/0xc0<br>
          Feb  4 13:22:12 l kernel: [  342.919616] 
          [&lt;ffffffff8164c678&gt;] rtnetlink_rcv+0x28/0x30<br>
          Feb  4 13:22:12 l kernel: [  342.924963] 
          [&lt;ffffffff8166a7a0&gt;] netlink_unicast+0xe0/0x1b0<br>
          Feb  4 13:22:12 l kernel: [  342.930172] 
          [&lt;ffffffff8166ab7e&gt;] netlink_sendmsg+0x30e/0x680<br>
          Feb  4 13:22:12 l kernel: [  342.935225] 
          [&lt;ffffffff81623251&gt;] sock_sendmsg+0x91/0xc0<br>
          Feb  4 13:22:12 l kernel: [  342.940134] 
          [&lt;ffffffff811bd526&gt;] ?
          __mem_cgroup_commit_charge+0x156/0x3d0<br>
          Feb  4 13:22:12 l kernel: [  342.944970] 
          [&lt;ffffffff81622f2e&gt;] ?
          move_addr_to_kernel.part.14+0x1e/0x60<br>
          Feb  4 13:22:12 l kernel: [  342.949771] 
          [&lt;ffffffff81623d81&gt;] ? move_addr_to_kernel+0x21/0x30<br>
          Feb  4 13:22:12 l kernel: [  342.954457] 
          [&lt;ffffffff81623659&gt;] ___sys_sendmsg+0x389/0x3a0<br>
          Feb  4 13:22:12 l kernel: [  342.959123] 
          [&lt;ffffffff81621ecf&gt;] ? sock_destroy_inode+0x2f/0x40<br>
          Feb  4 13:22:12 l kernel: [  342.963784] 
          [&lt;ffffffff817487d4&gt;] ? __do_page_fault+0x214/0x570<br>
          Feb  4 13:22:12 l kernel: [  342.968464] 
          [&lt;ffffffff811dffdd&gt;] ? dput+0xad/0x190<br>
          Feb  4 13:22:12 l kernel: [  342.973110] 
          [&lt;ffffffff811e94e4&gt;] ? mntput+0x24/0x40<br>
          Feb  4 13:22:12 l kernel: [  342.977642] 
          [&lt;ffffffff811cab81&gt;] ? __fput+0x181/0x260<br>
          Feb  4 13:22:12 l kernel: [  342.982066] 
          [&lt;ffffffff81624462&gt;] __sys_sendmsg+0x42/0x80<br>
          Feb  4 13:22:12 l kernel: [  342.986430] 
          [&lt;ffffffff816244b2&gt;] SyS_sendmsg+0x12/0x20<br>
          Feb  4 13:22:12 l kernel: [  342.990694] 
          [&lt;ffffffff8174d3bc&gt;] system_call_fastpath+0x26/0x2b<br>
          Feb  4 13:22:12 l kernel: [  342.994897] Code: 7f 48 8b 78 20
          e8 65 7e 2b e1 48 8b bb 50 02 00 00 48 8b b5 50 ff ff ff 48 8d
          95 60 ff ff ff e8 8b dd 01 00 48 8b 05 9c 44 9b e1 &lt;48&gt;
          83 78 18 00 0f 84 87 01 00 00 48 8b 95 50 ff ff ff 48 8b bb<br>
          Feb  4 13:22:12 l kernel: [  343.008678] RIP 
          [&lt;ffffffffa036d7ec&gt;] wg_socket_init+0x13c/0x3f0
          [wireguard]<br>
          Feb  4 13:22:12 l kernel: [  343.013245]  RSP
          &lt;ffff8800af9656e0&gt;<br>
          Feb  4 13:22:12 l kernel: [  343.017746] CR2: 0000000000000018<br>
          Feb  4 13:22:12 l kernel: [  343.022234] ---[ end trace
          7a6ac50ecd32399e ]---<br>
        </font><br>
        <br>
        Any idea what could be the problem?<br>
        <br>
        Regards,<br>
        Anatoli<br>
      </div>
    </div>
  </body>
</html>

--------------9033E3AE737DBA50F91A88AA--

--===============7009716939091652763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7009716939091652763==--
