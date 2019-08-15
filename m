Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0F8C3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 995792080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=damon-at.20150623.gappssmtp.com header.i=@damon-at.20150623.gappssmtp.com header.b="NvHJHgk9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 995792080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=damon.at
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70ef2a92;
	Sun, 25 Aug 2019 15:41:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b374f642
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Aug 2019 09:41:49 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b32e0338
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Aug 2019 09:41:49 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id t3so1672337ljj.12
 for <wireguard@lists.zx2c4.com>; Thu, 15 Aug 2019 02:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=damon-at.20150623.gappssmtp.com; s=20150623;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=D7E9+ayvj7klIU4OYhog9lvrD08WTXI/lQ+knADv8zA=;
 b=NvHJHgk9qNegOQXHdHI1OP607NPgxxj84KF44wA/+0HqVf+KECQSwtP1yf8xjVWNFB
 rYUfqzYYyK2KM5HZZd5l7xDxrO1VE2C/jHmNGYYevzWOHxosQ5Bblhj1Blo5wNfAJVIg
 j3RhcOgnZSaRswVsb/jiMUPu1IQD4Cezy6vV08RxRecLZSI0xHsm+XCjAsIsunvMhvZG
 WW0fgODilvOIiGi61GUmTFLQL8NxAWO345ntgQh03e9Y+kdolkQtH1a0dpGAUBPmGs1m
 4/6xN2jVOPdzn0uraMiYbzFdZmXL1txYC/EEJbKgHntsQFfL5KWNpjmq0tKkZ8rM1sfe
 TyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=D7E9+ayvj7klIU4OYhog9lvrD08WTXI/lQ+knADv8zA=;
 b=Mn95w7wqQUWiURGiyROnpkBx8wFGyqoz4beuoxdqomOQuWiNo9WSNs8MCyPloV/adD
 IHKTk/hxslLIQ24Zk/x5STesHWWMrIQkC3QNPzy4dKBMiOrnSZS7EwzPsP7rIzCIRJb1
 loAXrSvm84KKCAhAz14/+qNzMO1BtW1HuG5Fl1AyZvSKx1dHin5+rsmLDke0GDs/0io0
 z4Ame2UpORrIlnv91bdtSZtN/F0XBX2NG97sU/zSWZfbkJkuEYsM4rMLQotSxKa+acBf
 5OrZY2JhINwMp4AKiT+4unEvNNiv4KAHzVWZ1p13rzqtIloEuIxzRF9/y4RnFnbz4pQi
 rc7A==
X-Gm-Message-State: APjAAAUj8HhyRtrDqnUruZVLuT8yfkqj80CA82S/dcXQmtYAo8LHDIhg
 sXQFbMt2qxMMx4tPzrFLuuWx/ZBfFFo=
X-Google-Smtp-Source: APXvYqy6LPuGRcpHHvrD3Xzzwqypm7N8nnYzH3t7XepI3pVQkVSAwt99ECma/9JfVktbrgrufuyw4w==
X-Received: by 2002:a2e:968e:: with SMTP id q14mr2053154lji.195.1565862106993; 
 Thu, 15 Aug 2019 02:41:46 -0700 (PDT)
Received: from [192.168.100.169] (x5271796a.dyn.telefonica.de.
 [82.113.121.106])
 by smtp.gmail.com with ESMTPSA id r68sm356806lff.52.2019.08.15.02.41.45
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 02:41:46 -0700 (PDT)
From: Damon <msg@damon.at>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Kernel panic on Linux 5.2.7 using Wireguard 0.0.20190702 on Fedora 30
Message-Id: <CB3F0797-D792-4883-8098-D57AA951715B@damon.at>
Date: Thu, 15 Aug 2019 11:41:44 +0200
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.104.11)
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:41:26 +0200
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hey guys,

I'm using wireguard-dkms 1:0.0.20190702-1.fc30 on Fedora 30. If I send data through the tunnel as part of a long lasting task, I run into a kernel panic. This behavior is reproducible, even though the panic only occurs after some time. The peer is also running Fedora 30 with the same Wireguard version. Both systems are up-to-date.

I've attached the kernel panic log. I'm happy to provide any additional information, if necessary.

Best,
Damon

[ 5094.906244] BUG: unable to handle page fault for address: ffff8f584996c000
[ 5094.913136] #PF: supervisor write access in kernel mode
[ 5094.918373] #PF: error_code(0x0002) - not-present page
[ 5094.923515] PGD ce001067 P4D ce001067 PUD ce005067 PMD 10996b063 PTE 0
[ 5094.930061] Oops: 0002 [#1] SMP NOPTI
[ 5094.933739] CPU: 1 PID: 10041 Comm: kworker/1:1 Tainted: G           OE     5.2.7-200.fc30.x86_64 #1
[ 5094.942882] Hardware name: PC Engines apu2/apu2, BIOS v4.9.0.4 04/03/2019
[ 5094.949698] Workqueue: wg-crypt-wg-i1 wg_packet_tx_worker [wireguard]
[ 5094.956157] RIP: 0010:__memset+0x24/0x30
[ 5094.960091] Code: 90 90 90 90 90 90 0f 1f 44 00 00 49 89 f9 48 89 d1 83 e2 07 48 c1 e9 03 40 0f b6 f6 48 b8 01 01 01 01 01 01 01 01 48 0f af c6 <f3> 48 ab 89 d1 f3 aa 4c 89 c8 c3 90 49 89 f9 40 88 f0 48 89 d1 f3
[ 5094.978841] RSP: 0018:ffffa42d82157a38 EFLAGS: 00010216
[ 5094.984076] RAX: 0000000000000000 RBX: 00000000fffffffe RCX: 000000001ffdf000
[ 5094.991219] RDX: 0000000000000006 RSI: 0000000000000000 RDI: ffff8f584996bffa
[ 5094.998359] RBP: ffff8f586408f000 R08: 0000000000000000 R09: ffff8f5849864002
[ 5095.005501] R10: ffff8f5849860000 R11: 000000000000007c R12: ffff8f585aa563c0
[ 5095.012641] R13: 000000000000000b R14: 0000000000535049 R15: ffff8f5846f33100
[ 5095.019776] FS:  0000000000000000(0000) GS:ffff8f586aa80000(0000) knlGS:0000000000000000
[ 5095.027869] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 5095.033623] CR2: ffff8f584996c000 CR3: 0000000118614000 CR4: 00000000000406e0
[ 5095.040764] Call Trace:
[ 5095.043242]  cdc_ncm_fill_tx_frame+0x597/0x700 [cdc_ncm]
[ 5095.048572]  cdc_mbim_tx_fixup+0x181/0x230 [cdc_mbim]
[ 5095.053642]  usbnet_start_xmit+0x62/0x700 [usbnet]
[ 5095.058450]  dev_hard_start_xmit+0x8d/0x1e0
[ 5095.062658]  sch_direct_xmit+0x140/0x300
[ 5095.066597]  __dev_queue_xmit+0x571/0x980
[ 5095.070621]  ip_finish_output2+0x2c8/0x580
[ 5095.074758]  ? nf_confirm+0xcc/0xf0 [nf_conntrack]
[ 5095.079559]  ? ip_finish_output+0x139/0x270
[ 5095.083755]  ip_output+0x71/0xf0
[ 5095.086998]  ? ip_finish_output2+0x580/0x580
[ 5095.091279]  iptunnel_xmit+0x163/0x210
[ 5095.095056]  send4+0x128/0x3a0 [wireguard]
[ 5095.099182]  wg_socket_send_skb_to_peer+0x98/0xb0 [wireguard]
[ 5095.104957]  wg_packet_tx_worker+0xa3/0x210 [wireguard]
[ 5095.110197]  process_one_work+0x19d/0x380
[ 5095.114219]  worker_thread+0x50/0x3b0
[ 5095.117895]  kthread+0xfb/0x130
[ 5095.121048]  ? process_one_work+0x380/0x380
[ 5095.125240]  ? kthread_park+0x80/0x80
[ 5095.128919]  ret_from_fork+0x22/0x40
[ 5095.132506] Modules linked in: nf_conntrack_netlink xt_addrtype br_netfilter ccm 8021q garp mrp xt_MASQUERADE nf_conntrack_netbios_ns nf_conntrack_broadcast xt_CT bridge stp llc wireguard(OE) ip6_udp_tunnel udp_tunnel ip6t_rpfilter ip6t_REJECT nf_reject_ipv6 ipt_REJECi
[ 5095.132661]  crc32c_intel mmc_core
[ 5095.223417] CR2: ffff8f584996c000
[ 5095.226751] ---[ end trace cbcf3c94fa645e9e ]---
[ 5095.231383] RIP: 0010:__memset+0x24/0x30
[ 5095.235313] Code: 90 90 90 90 90 90 0f 1f 44 00 00 49 89 f9 48 89 d1 83 e2 07 48 c1 e9 03 40 0f b6 f6 48 b8 01 01 01 01 01 01 01 01 48 0f af c6 <f3> 48 ab 89 d1 f3 aa 4c 89 c8 c3 90 49 89 f9 40 88 f0 48 89 d1 f3
[ 5095.254092] RSP: 0018:ffffa42d82157a38 EFLAGS: 00010216
[ 5095.259327] RAX: 0000000000000000 RBX: 00000000fffffffe RCX: 000000001ffdf000
[ 5095.266466] RDX: 0000000000000006 RSI: 0000000000000000 RDI: ffff8f584996bffa
[ 5095.273608] RBP: ffff8f586408f000 R08: 0000000000000000 R09: ffff8f5849864002
[ 5095.280743] R10: ffff8f5849860000 R11: 000000000000007c R12: ffff8f585aa563c0
[ 5095.287882] R13: 000000000000000b R14: 0000000000535049 R15: ffff8f5846f33100
[ 5095.295019] FS:  0000000000000000(0000) GS:ffff8f586aa80000(0000) knlGS:0000000000000000
[ 5095.303111] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 5095.308863] CR2: ffff8f584996c000 CR3: 0000000118614000 CR4: 00000000000406e0
[ 5095.315999] Kernel panic - not syncing: Fatal exception in interrupt
[ 5095.322397] Kernel Offset: 0x2f000000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[ 5095.333183] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
