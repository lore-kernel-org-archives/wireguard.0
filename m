Return-Path: <SRS0=HyV5=TM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC071C04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 May 2019 13:44:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03D732133D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 May 2019 13:44:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlBfW2Zj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03D732133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d4ff8d9;
	Sun, 12 May 2019 13:44:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 164ab112
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 May 2019 13:44:38 +0000 (UTC)
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92f7e72a
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 May 2019 13:44:38 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id o7so11922465qtp.4
 for <wireguard@lists.zx2c4.com>; Sun, 12 May 2019 06:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8/ZqEjKy3BWYsxprB9gUYJ7H4Map2H6y5Fk3dXfd1Ms=;
 b=dlBfW2ZjfLeDzPFORGg5UJLY/zRP3x1z47ka6ne/kmT2MK8yGZNMyItlb+zC3otCUN
 l88aojXNiRohJ6Hru6JNZcZktldbyrtH3/uaFjesv79scWvc2LBgxHvnSrra1TUib6VR
 tUGqLjwy0SDqJeZUj/SZUAl3lLwTDi/VkP8YxLRY+aaxhQMGCcw3z5YEI3uJPKxIZQde
 vobuq7lspQ+wibJAcvCyBS80ylXlMmIew6xcMwdlo+MQ0MlAjCcASszF0oblxD30auiZ
 zx/qQ6UqDg/r2CLeDrx4ygLetzkR9LxR1khe/fuYNQoQsWmhctj7jnsae1lURkt5Sko3
 Ahlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8/ZqEjKy3BWYsxprB9gUYJ7H4Map2H6y5Fk3dXfd1Ms=;
 b=bNFnzs+Q2lBCPWgeAcNRNq4GpisEKYuRPZnLJ6MgFTYZqyU/5JGpDbVrM5IIJhP0jh
 qcG/21yB2mcr2sSLrKF1jRhl6TpTeeMlc96XA2dvOj0gk0xM2eTaLybxLbGUA5VTsgPz
 pYM0dIemTifpKC0Rc5LBR/D9lBDDhGHkiwLmKEUqTyABOifEHgUYR0/T/VcFimpociAL
 lyFJ7e7+V9/dMVxwMMTfODITuPy1viwZXwweZbFKXgD1rS8L6OVMLZDaNKaIdOGpU6Uv
 ggCkwbnnSEsNPON2NgmvXKNBhqFru25/oABqfjKt0EgZrCCMkH+ckowp484NPO4eknRR
 Qz4A==
X-Gm-Message-State: APjAAAVTTamIsSshUPdqojPnDwEBbPX74vRG/k5mOhKrV9fNj/MUodML
 FOnhUImy6Pbc01zEl3iyT4bZqsnyIgWiQ+jwXdxBVA==
X-Google-Smtp-Source: APXvYqztFifGV2UKOprxI/bsqWHeaUdRni0t/bD1lwrVLR9W+eiIo+sBqMs/NElB/fElNTJBywVEON9D5QkjZZpvlNY=
X-Received: by 2002:ac8:26c5:: with SMTP id 5mr17230479qtp.310.1557668677684; 
 Sun, 12 May 2019 06:44:37 -0700 (PDT)
MIME-Version: 1.0
From: Ryan Whelan <rcwhelan@gmail.com>
Date: Sun, 12 May 2019 09:44:26 -0400
Message-ID: <CAM3m09Q3LCCFRJEe6J1UO0mtTiuVOYEiiyhEJJppDnuDnZZTwA@mail.gmail.com>
Subject: Wireguard Bug?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============1042740760605135359=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1042740760605135359==
Content-Type: multipart/alternative; boundary="0000000000003611050588b10083"

--0000000000003611050588b10083
Content-Type: text/plain; charset="UTF-8"

I am building a system which coordinates the meshing of wireguard devices.
Currently, all the devices are running on an embedded platform (AMD Geode
LX500) and works as expected.  However, when introducing a 64bit KVM host
for testing, all the 32bit hosts running on the Geode platform, report the
following warning and drop offline temporarily.  The CPU usage on KVM host
spikes and all the CPU time is spent on the kernel threads servicing the WG
interfaces.

I'm using kernel 4.19.41 and have seen the issue with both the last WG
snapshot as well building from master.

Is this a bug in WG?

May 10 18:36:25 buildroot kern.warn kernel: WARNING: CPU: 0 PID: 9 at
kernel/workqueue.c:1442 __queue_work+0x1d4/0x2aa
May 10 18:36:25 buildroot kern.warn kernel: CPU: 0 PID: 9 Comm: ksoftirqd/0
Tainted: G        W         4.19.41-banana #1
May 10 18:36:25 buildroot kern.warn kernel: EIP: __queue_work+0x1d4/0x2aa
May 10 18:36:25 buildroot kern.warn kernel: Code: c1 e8 4e 09 1d 00 c7 05
30 d3 5f c1 00 00 00 00 c7 45 e4 00 00 00 00 e9 76 fe ff ff 8b 3d 80 3c 60
c1 89 78 10 e9 32 ff ff ff <0f> 0b b8 01 00 00 00 e8 1c 82 00 00 a1 a8 9e
5f c1 85 c0 0f 85 3b
May 10 18:36:25 buildroot kern.warn kernel: EAX: 00000000 EBX: cfb63044
ECX: 00000003 EDX: cfb63048
May 10 18:36:25 buildroot kern.warn kernel: ESI: cfdfbb00 EDI: cfab29c0
EBP: cf847d38 ESP: cf847d1c
May 10 18:36:25 buildroot kern.warn kernel: DS: 007b ES: 007b FS: 0000 GS:
00e0 SS: 0068 EFLAGS: 00010086
May 10 18:36:25 buildroot kern.warn kernel: CR0: 80050033 CR2: a7bb5058
CR3: 0eebe000 CR4: 00000090
May 10 18:36:25 buildroot kern.warn kernel: Call Trace:
May 10 18:36:25 buildroot kern.warn kernel:  queue_work_on+0x19/0x1d
May 10 18:36:25 buildroot kern.warn kernel:  wg_packet_receive+0x4a5/0x557
May 10 18:36:25 buildroot kern.warn kernel:  ? send6+0x1fc/0x1fc
May 10 18:36:25 buildroot kern.warn kernel:  wg_receive+0x16/0x25
May 10 18:36:25 buildroot kern.warn kernel:  udp_queue_rcv_skb+0x254/0x324
May 10 18:36:25 buildroot kern.warn kernel:
udp_unicast_rcv_skb.isra.12+0x68/0x7a
May 10 18:36:25 buildroot kern.warn kernel:  __udp4_lib_rcv+0x413/0x88b
May 10 18:36:25 buildroot kern.warn kernel:  udp_rcv+0x12/0x14
May 10 18:36:25 buildroot kern.warn kernel:
ip_local_deliver_finish+0x82/0x1ff
May 10 18:36:25 buildroot kern.warn kernel:  ip_local_deliver+0xc0/0xcb
May 10 18:36:25 buildroot kern.warn kernel:  ?
ip_sublist_rcv_finish+0x41/0x41
May 10 18:36:25 buildroot kern.warn kernel:  ip_rcv_finish+0x24/0x2a
May 10 18:36:25 buildroot kern.warn kernel:  ip_rcv+0xa1/0xaf
May 10 18:36:25 buildroot kern.warn kernel:  ?
ip_rcv_finish_core.isra.0+0x331/0x331
May 10 18:36:25 buildroot kern.warn kernel:
__netif_receive_skb_one_core+0x3f/0x59
May 10 18:36:25 buildroot kern.warn kernel:  __netif_receive_skb+0x16/0x4f
May 10 18:36:25 buildroot kern.warn kernel:
netif_receive_skb_internal+0x26/0xaf
May 10 18:36:25 buildroot kern.warn kernel:  netif_receive_skb+0x8/0xa
May 10 18:36:25 buildroot kern.warn kernel:  rhine_napipoll+0x5ef/0x9c6
May 10 18:36:25 buildroot kern.warn kernel:  net_rx_action+0x197/0x24d
May 10 18:36:25 buildroot kern.warn kernel:  __do_softirq+0xd6/0x1ae
May 10 18:36:25 buildroot kern.warn kernel:  run_ksoftirqd+0x21/0x24
May 10 18:36:25 buildroot kern.warn kernel:  smpboot_thread_fn+0x137/0x1ea
May 10 18:36:25 buildroot kern.warn kernel:  kthread+0xbe/0xea
May 10 18:36:25 buildroot kern.warn kernel:  ? sort_range+0x18/0x18
May 10 18:36:25 buildroot kern.warn kernel:  ?
__kthread_create_on_node+0x13e/0x13e
May 10 18:36:25 buildroot kern.warn kernel:  ret_from_fork+0x19/0x24
May 10 18:36:25 buildroot kern.warn kernel: ---[ end trace c200a14cd22c0ee1
]---
May 10 18:36:25 buildroot kern.warn kernel: WARNING: CPU: 0 PID: 9 at
kernel/workqueue.c:1442 __queue_work+0x1d4/0x2aa
May 10 18:36:25 buildroot kern.warn kernel: CPU: 0 PID: 9 Comm: ksoftirqd/0
Tainted: G        W         4.19.41-banana #1
May 10 18:36:25 buildroot kern.warn kernel: EIP: __queue_work+0x1d4/0x2aa
May 10 18:36:25 buildroot kern.warn kernel: Code: c1 e8 4e 09 1d 00 c7 05
30 d3 5f c1 00 00 00 00 c7 45 e4 00 00 00 00 e9 76 fe ff ff 8b 3d 80 3c 60
c1 89 78 10 e9 32 ff ff ff <0f> 0b b8 01 00 00 00 e8 1c 82 00 00 a1 a8 9e
5f c1 85 c0 0f 85 3b
May 10 18:36:25 buildroot kern.warn kernel: EAX: 00000000 EBX: cfb62044
ECX: 00000003 EDX: cfb62048
May 10 18:36:25 buildroot kern.warn kernel: ESI: cfdfbb00 EDI: cfab29c0
EBP: cf847d38 ESP: cf847d1c
May 10 18:36:25 buildroot kern.warn kernel: DS: 007b ES: 007b FS: 0000 GS:
00e0 SS: 0068 EFLAGS: 00010086
May 10 18:36:25 buildroot kern.warn kernel: CR0: 80050033 CR2: a7bb5058
CR3: 0eebe000 CR4: 00000090
May 10 18:36:25 buildroot kern.warn kernel: Call Trace:
May 10 18:36:25 buildroot kern.warn kernel:  queue_work_on+0x19/0x1d
May 10 18:36:25 buildroot kern.warn kernel:  wg_packet_receive+0x4a5/0x557
May 10 18:36:25 buildroot kern.warn kernel:  ? send6+0x1fc/0x1fc
May 10 18:36:25 buildroot kern.warn kernel:  wg_receive+0x16/0x25
May 10 18:36:25 buildroot kern.warn kernel:  udp_queue_rcv_skb+0x254/0x324
May 10 18:36:25 buildroot kern.warn kernel:
udp_unicast_rcv_skb.isra.12+0x68/0x7a
May 10 18:36:25 buildroot kern.warn kernel:  __udp4_lib_rcv+0x413/0x88b
May 10 18:36:25 buildroot kern.warn kernel:  udp_rcv+0x12/0x14
May 10 18:36:25 buildroot kern.warn kernel:
ip_local_deliver_finish+0x82/0x1ff
May 10 18:36:25 buildroot kern.warn kernel:  ip_local_deliver+0xc0/0xcb
May 10 18:36:25 buildroot kern.warn kernel:  ?
ip_sublist_rcv_finish+0x41/0x41
May 10 18:36:25 buildroot kern.warn kernel:  ip_rcv_finish+0x24/0x2a
May 10 18:36:25 buildroot kern.warn kernel:  ip_rcv+0xa1/0xaf
May 10 18:36:25 buildroot kern.warn kernel:  ?
ip_rcv_finish_core.isra.0+0x331/0x331
May 10 18:36:25 buildroot kern.warn kernel:
__netif_receive_skb_one_core+0x3f/0x59
May 10 18:36:25 buildroot kern.warn kernel:  __netif_receive_skb+0x16/0x4f
May 10 18:36:25 buildroot kern.warn kernel:
netif_receive_skb_internal+0x26/0xaf
May 10 18:36:25 buildroot kern.warn kernel:  netif_receive_skb+0x8/0xa
May 10 18:36:25 buildroot kern.warn kernel:  rhine_napipoll+0x5ef/0x9c6
May 10 18:36:25 buildroot kern.warn kernel:  net_rx_action+0x197/0x24d
May 10 18:36:25 buildroot kern.warn kernel:  __do_softirq+0xd6/0x1ae
May 10 18:36:25 buildroot kern.warn kernel:  run_ksoftirqd+0x21/0x24
May 10 18:36:25 buildroot kern.warn kernel:  smpboot_thread_fn+0x137/0x1ea
May 10 18:36:25 buildroot kern.warn kernel:  kthread+0xbe/0xea
May 10 18:36:25 buildroot kern.warn kernel:  ? sort_range+0x18/0x18
May 10 18:36:25 buildroot kern.warn kernel:  ?
__kthread_create_on_node+0x13e/0x13e
May 10 18:36:25 buildroot kern.warn kernel:  ret_from_fork+0x19/0x24
May 10 18:36:25 buildroot kern.warn kernel: ---[ end trace c200a14cd22c0ee2
]---

--0000000000003611050588b10083
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>I am building a system which coordin=
ates the meshing of wireguard devices.=C2=A0 Currently, all the devices are=
 running on an embedded platform (AMD Geode LX500) and works as expected.=
=C2=A0 However, when introducing a 64bit KVM host for testing, all the 32bi=
t hosts running on the Geode platform, report the following warning and dro=
p offline temporarily.=C2=A0 The CPU usage on KVM host spikes and all the C=
PU time is spent on the kernel threads servicing the WG interfaces.</div><d=
iv><br></div><div>I&#39;m using kernel 4.19.41 and have seen the issue with=
 both the last WG snapshot as well building from master.</div><div><br></di=
v><div>Is this a bug in WG?=C2=A0=C2=A0</div><div><br></div><div>May 10 18:=
36:25 buildroot kern.warn kernel: WARNING: CPU: 0 PID: 9 at kernel/workqueu=
e.c:1442 __queue_work+0x1d4/0x2aa</div><div>May 10 18:36:25 buildroot kern.=
warn kernel: CPU: 0 PID: 9 Comm: ksoftirqd/0 Tainted: G=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 W=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04.19.41-banana #1</div><div>May =
10 18:36:25 buildroot kern.warn kernel: EIP: __queue_work+0x1d4/0x2aa</div>=
<div>May 10 18:36:25 buildroot kern.warn kernel: Code: c1 e8 4e 09 1d 00 c7=
 05 30 d3 5f c1 00 00 00 00 c7 45 e4 00 00 00 00 e9 76 fe ff ff 8b 3d 80 3c=
 60 c1 89 78 10 e9 32 ff ff ff &lt;0f&gt; 0b b8 01 00 00 00 e8 1c 82 00 00 =
a1 a8 9e 5f c1 85 c0 0f 85 3b</div><div>May 10 18:36:25 buildroot kern.warn=
 kernel: EAX: 00000000 EBX: cfb63044 ECX: 00000003 EDX: cfb63048</div><div>=
May 10 18:36:25 buildroot kern.warn kernel: ESI: cfdfbb00 EDI: cfab29c0 EBP=
: cf847d38 ESP: cf847d1c</div><div>May 10 18:36:25 buildroot kern.warn kern=
el: DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068 EFLAGS: 00010086</div><div=
>May 10 18:36:25 buildroot kern.warn kernel: CR0: 80050033 CR2: a7bb5058 CR=
3: 0eebe000 CR4: 00000090</div><div>May 10 18:36:25 buildroot kern.warn ker=
nel: Call Trace:</div><div>May 10 18:36:25 buildroot kern.warn kernel:=C2=
=A0 queue_work_on+0x19/0x1d</div><div>May 10 18:36:25 buildroot kern.warn k=
ernel:=C2=A0 wg_packet_receive+0x4a5/0x557</div><div>May 10 18:36:25 buildr=
oot kern.warn kernel:=C2=A0 ? send6+0x1fc/0x1fc</div><div>May 10 18:36:25 b=
uildroot kern.warn kernel:=C2=A0 wg_receive+0x16/0x25</div><div>May 10 18:3=
6:25 buildroot kern.warn kernel:=C2=A0 udp_queue_rcv_skb+0x254/0x324</div><=
div>May 10 18:36:25 buildroot kern.warn kernel:=C2=A0 udp_unicast_rcv_skb.i=
sra.12+0x68/0x7a</div><div>May 10 18:36:25 buildroot kern.warn kernel:=C2=
=A0 __udp4_lib_rcv+0x413/0x88b</div><div>May 10 18:36:25 buildroot kern.war=
n kernel:=C2=A0 udp_rcv+0x12/0x14</div><div>May 10 18:36:25 buildroot kern.=
warn kernel:=C2=A0 ip_local_deliver_finish+0x82/0x1ff</div><div>May 10 18:3=
6:25 buildroot kern.warn kernel:=C2=A0 ip_local_deliver+0xc0/0xcb</div><div=
>May 10 18:36:25 buildroot kern.warn kernel:=C2=A0 ? ip_sublist_rcv_finish+=
0x41/0x41</div><div>May 10 18:36:25 buildroot kern.warn kernel:=C2=A0 ip_rc=
v_finish+0x24/0x2a</div><div>May 10 18:36:25 buildroot kern.warn kernel:=C2=
=A0 ip_rcv+0xa1/0xaf</div><div>May 10 18:36:25 buildroot kern.warn kernel:=
=C2=A0 ? ip_rcv_finish_core.isra.0+0x331/0x331</div><div>May 10 18:36:25 bu=
ildroot kern.warn kernel:=C2=A0 __netif_receive_skb_one_core+0x3f/0x59</div=
><div>May 10 18:36:25 buildroot kern.warn kernel:=C2=A0 __netif_receive_skb=
+0x16/0x4f</div><div>May 10 18:36:25 buildroot kern.warn kernel:=C2=A0 neti=
f_receive_skb_internal+0x26/0xaf</div><div>May 10 18:36:25 buildroot kern.w=
arn kernel:=C2=A0 netif_receive_skb+0x8/0xa</div><div>May 10 18:36:25 build=
root kern.warn kernel:=C2=A0 rhine_napipoll+0x5ef/0x9c6</div><div>May 10 18=
:36:25 buildroot kern.warn kernel:=C2=A0 net_rx_action+0x197/0x24d</div><di=
v>May 10 18:36:25 buildroot kern.warn kernel:=C2=A0 __do_softirq+0xd6/0x1ae=
</div><div>May 10 18:36:25 buildroot kern.warn kernel:=C2=A0 run_ksoftirqd+=
0x21/0x24</div><div>May 10 18:36:25 buildroot kern.warn kernel:=C2=A0 smpbo=
ot_thread_fn+0x137/0x1ea</div><div>May 10 18:36:25 buildroot kern.warn kern=
el:=C2=A0 kthread+0xbe/0xea</div><div>May 10 18:36:25 buildroot kern.warn k=
ernel:=C2=A0 ? sort_range+0x18/0x18</div><div>May 10 18:36:25 buildroot ker=
n.warn kernel:=C2=A0 ? __kthread_create_on_node+0x13e/0x13e</div><div>May 1=
0 18:36:25 buildroot kern.warn kernel:=C2=A0 ret_from_fork+0x19/0x24</div><=
div>May 10 18:36:25 buildroot kern.warn kernel: ---[ end trace c200a14cd22c=
0ee1 ]---</div><div>May 10 18:36:25 buildroot kern.warn kernel: WARNING: CP=
U: 0 PID: 9 at kernel/workqueue.c:1442 __queue_work+0x1d4/0x2aa</div><div>M=
ay 10 18:36:25 buildroot kern.warn kernel: CPU: 0 PID: 9 Comm: ksoftirqd/0 =
Tainted: G=C2=A0 =C2=A0 =C2=A0 =C2=A0 W=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04.=
19.41-banana #1</div><div>May 10 18:36:25 buildroot kern.warn kernel: EIP: =
__queue_work+0x1d4/0x2aa</div><div>May 10 18:36:25 buildroot kern.warn kern=
el: Code: c1 e8 4e 09 1d 00 c7 05 30 d3 5f c1 00 00 00 00 c7 45 e4 00 00 00=
 00 e9 76 fe ff ff 8b 3d 80 3c 60 c1 89 78 10 e9 32 ff ff ff &lt;0f&gt; 0b =
b8 01 00 00 00 e8 1c 82 00 00 a1 a8 9e 5f c1 85 c0 0f 85 3b</div><div>May 1=
0 18:36:25 buildroot kern.warn kernel: EAX: 00000000 EBX: cfb62044 ECX: 000=
00003 EDX: cfb62048</div><div>May 10 18:36:25 buildroot kern.warn kernel: E=
SI: cfdfbb00 EDI: cfab29c0 EBP: cf847d38 ESP: cf847d1c</div><div>May 10 18:=
36:25 buildroot kern.warn kernel: DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0=
068 EFLAGS: 00010086</div><div>May 10 18:36:25 buildroot kern.warn kernel: =
CR0: 80050033 CR2: a7bb5058 CR3: 0eebe000 CR4: 00000090</div><div>May 10 18=
:36:25 buildroot kern.warn kernel: Call Trace:</div><div>May 10 18:36:25 bu=
ildroot kern.warn kernel:=C2=A0 queue_work_on+0x19/0x1d</div><div>May 10 18=
:36:25 buildroot kern.warn kernel:=C2=A0 wg_packet_receive+0x4a5/0x557</div=
><div>May 10 18:36:25 buildroot kern.warn kernel:=C2=A0 ? send6+0x1fc/0x1fc=
</div><div>May 10 18:36:25 buildroot kern.warn kernel:=C2=A0 wg_receive+0x1=
6/0x25</div><div>May 10 18:36:25 buildroot kern.warn kernel:=C2=A0 udp_queu=
e_rcv_skb+0x254/0x324</div><div>May 10 18:36:25 buildroot kern.warn kernel:=
=C2=A0 udp_unicast_rcv_skb.isra.12+0x68/0x7a</div><div>May 10 18:36:25 buil=
droot kern.warn kernel:=C2=A0 __udp4_lib_rcv+0x413/0x88b</div><div>May 10 1=
8:36:25 buildroot kern.warn kernel:=C2=A0 udp_rcv+0x12/0x14</div><div>May 1=
0 18:36:25 buildroot kern.warn kernel:=C2=A0 ip_local_deliver_finish+0x82/0=
x1ff</div><div>May 10 18:36:25 buildroot kern.warn kernel:=C2=A0 ip_local_d=
eliver+0xc0/0xcb</div><div>May 10 18:36:25 buildroot kern.warn kernel:=C2=
=A0 ? ip_sublist_rcv_finish+0x41/0x41</div><div>May 10 18:36:25 buildroot k=
ern.warn kernel:=C2=A0 ip_rcv_finish+0x24/0x2a</div><div>May 10 18:36:25 bu=
ildroot kern.warn kernel:=C2=A0 ip_rcv+0xa1/0xaf</div><div>May 10 18:36:25 =
buildroot kern.warn kernel:=C2=A0 ? ip_rcv_finish_core.isra.0+0x331/0x331</=
div><div>May 10 18:36:25 buildroot kern.warn kernel:=C2=A0 __netif_receive_=
skb_one_core+0x3f/0x59</div><div>May 10 18:36:25 buildroot kern.warn kernel=
:=C2=A0 __netif_receive_skb+0x16/0x4f</div><div>May 10 18:36:25 buildroot k=
ern.warn kernel:=C2=A0 netif_receive_skb_internal+0x26/0xaf</div><div>May 1=
0 18:36:25 buildroot kern.warn kernel:=C2=A0 netif_receive_skb+0x8/0xa</div=
><div>May 10 18:36:25 buildroot kern.warn kernel:=C2=A0 rhine_napipoll+0x5e=
f/0x9c6</div><div>May 10 18:36:25 buildroot kern.warn kernel:=C2=A0 net_rx_=
action+0x197/0x24d</div><div>May 10 18:36:25 buildroot kern.warn kernel:=C2=
=A0 __do_softirq+0xd6/0x1ae</div><div>May 10 18:36:25 buildroot kern.warn k=
ernel:=C2=A0 run_ksoftirqd+0x21/0x24</div><div>May 10 18:36:25 buildroot ke=
rn.warn kernel:=C2=A0 smpboot_thread_fn+0x137/0x1ea</div><div>May 10 18:36:=
25 buildroot kern.warn kernel:=C2=A0 kthread+0xbe/0xea</div><div>May 10 18:=
36:25 buildroot kern.warn kernel:=C2=A0 ? sort_range+0x18/0x18</div><div>Ma=
y 10 18:36:25 buildroot kern.warn kernel:=C2=A0 ? __kthread_create_on_node+=
0x13e/0x13e</div><div>May 10 18:36:25 buildroot kern.warn kernel:=C2=A0 ret=
_from_fork+0x19/0x24</div><div>May 10 18:36:25 buildroot kern.warn kernel: =
---[ end trace c200a14cd22c0ee2 ]---</div><div><br></div></div></div>

--0000000000003611050588b10083--

--===============1042740760605135359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1042740760605135359==--
