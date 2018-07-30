Return-Path: yszhou4tech@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5819059f
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jul 2018 03:17:05 +0000 (UTC)
Received: from mail-yw0-x235.google.com (mail-yw0-x235.google.com
 [IPv6:2607:f8b0:4002:c05::235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e78613e
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jul 2018 03:17:05 +0000 (UTC)
Received: by mail-yw0-x235.google.com with SMTP id q129-v6so3872934ywg.8
 for <wireguard@lists.zx2c4.com>; Sun, 29 Jul 2018 20:26:58 -0700 (PDT)
MIME-Version: 1.0
From: Yousong Zhou <yszhou4tech@gmail.com>
Date: Mon, 30 Jul 2018 11:26:46 +0800
Message-ID: <CAECwjAjdHujDmgKURVf1jG=Pg4vu3XLje619GvtH2G5kGWLm3A@mail.gmail.com>
Subject: compilation error on centos 7 kernels
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Yesterday I tried compiling openvswitch-dkms on 2 centos 7 systems,
both failed out of box because of the compat conditional compilation
code

Both system has LINUX_VERSION_CODE 199168, i.e. 3.10.0.  The 1st runs
kernel 3.10.0-514.26.2.el7.x86_64, and the second runs
3.10.0-693.2.2.el7.x86_64.  They both lacks skb_reset_tc,
our_pskb_put(), genl_family_attrbuf(), skb_put_data().  And the
3.10.0-514 kernel also lacks ipv6_mod_enabled() so I had to prepare
different dkms patches for them ;( . The bright side is that currently
both systems work fine ;)

It's partially caused by commit 401453 ("compat: handle RHEL 7.5's
recent backports"), but I think the code will be very hard to read and
maintain if we continue to use the current macro detection logic.  I
remembered openvswitch linux kernel datapath module was already in
such an state.  Maybe compile test will do better.

                yousong
