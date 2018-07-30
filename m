Return-Path: yszhou4tech@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a6dc06a
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jul 2018 03:17:53 +0000 (UTC)
Received: from mail-yw0-x230.google.com (mail-yw0-x230.google.com
 [IPv6:2607:f8b0:4002:c05::230])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88ea8ce6
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jul 2018 03:17:53 +0000 (UTC)
Received: by mail-yw0-x230.google.com with SMTP id v197-v6so3873664ywg.3
 for <wireguard@lists.zx2c4.com>; Sun, 29 Jul 2018 20:27:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAECwjAjdHujDmgKURVf1jG=Pg4vu3XLje619GvtH2G5kGWLm3A@mail.gmail.com>
In-Reply-To: <CAECwjAjdHujDmgKURVf1jG=Pg4vu3XLje619GvtH2G5kGWLm3A@mail.gmail.com>
From: Yousong Zhou <yszhou4tech@gmail.com>
Date: Mon, 30 Jul 2018 11:27:34 +0800
Message-ID: <CAECwjAi9rrcqb6+kJcWChVGxnk1Ro68nJS7wh2b7F791RWSHvg@mail.gmail.com>
Subject: Re: compilation error on centos 7 kernels
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

On Mon, 30 Jul 2018 at 11:26, Yousong Zhou <yszhou4tech@gmail.com> wrote:
>
> Yesterday I tried compiling openvswitch-dkms on 2 centos 7 systems,
> both failed out of box because of the compat conditional compilation
> code
>

Forgot to mention that the openvswitch-dkms version in use is 0.0.20180718

                yousong

> Both system has LINUX_VERSION_CODE 199168, i.e. 3.10.0.  The 1st runs
> kernel 3.10.0-514.26.2.el7.x86_64, and the second runs
> 3.10.0-693.2.2.el7.x86_64.  They both lacks skb_reset_tc,
> our_pskb_put(), genl_family_attrbuf(), skb_put_data().  And the
> 3.10.0-514 kernel also lacks ipv6_mod_enabled() so I had to prepare
> different dkms patches for them ;( . The bright side is that currently
> both systems work fine ;)
>
> It's partially caused by commit 401453 ("compat: handle RHEL 7.5's
> recent backports"), but I think the code will be very hard to read and
> maintain if we continue to use the current macro detection logic.  I
> remembered openvswitch linux kernel datapath module was already in
> such an state.  Maybe compile test will do better.
>
>                 yousong
