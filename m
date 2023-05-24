Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2694C77B7C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 24 May 2023 08:24:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28988034;
	Wed, 24 May 2023 08:24:46 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d2dbc82b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 May 2023 08:24:45 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f37884956bso1182e87.1
 for <wireguard@lists.zx2c4.com>; Wed, 24 May 2023 01:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684916684; x=1687508684;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8RtszprC6DzRLbG0ispzYFYS8wzl447D3eL8AdqyasE=;
 b=R1Ngd5KfBHhoR+GO+dvWzGuur8Vrd6c4NYVGe7aruFtF47hE+4EHPplsEx9Ggh5wwm
 7QLP9lURwE6Tbvkus/tYEPxzKjzisveZlORA6QtKKz0hRwrn5AGjU4RLB8hlW5rm90p1
 ljUqXRRd5Cz+V2wXIKvhr99niFRkauTOBvOBkn3oiLWyphNqFjF5AWZ9Oq8PzGMRwpb/
 FaxJX63CqnWtV48RD4LilzOQC516Waq48onYtDAwr5Zb5EU50NMomkZgyXZAs96xhRGD
 VqIwPbDzoA7ho/XgYwPaRzSCGSUgRk7TV9/iQOGmniAwDWX8ySyxhxX0GaCswAG5lwSe
 vvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684916684; x=1687508684;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8RtszprC6DzRLbG0ispzYFYS8wzl447D3eL8AdqyasE=;
 b=DxnPa/XP1RMrT6qHfOdKoZTsqa9hqGqXL7sauNsTOKZbIXny+OCYylZppschvyQ5M3
 GujPy5MibJoiEMpS+PednAKGl5FL/iLGsoGH6keNnsm1UwU22okvveYJT44kmDXKu4wb
 jNCD7ne2Vnb4J/FFNrQaf7DJqeMoIOTnGcw3jlMSRHXHKyRXxc4SLyuous/v6GfNYOZn
 XlJn7h0QOr32hc10D3RzSbh78ibVbHJkB460IzXs41ikoK1WXk5X3unfrVgMoPOpCs28
 1tgMdpNWvzoUhNuph4MxtyV+FKaD2yPZyvIAyro1gXEyE5Gf6+yVTtKqp5ZOfAhMoUDl
 RhwQ==
X-Gm-Message-State: AC+VfDwaUBnCKT5DFShLj0ukJH/ZSC7rDHgiGQSbilyr2Y6u+g0uPqaM
 87oQAw+bd0LngBN+3+B49zbWi5v9QhLVZf1VAsmNhA==
X-Google-Smtp-Source: ACHHUZ6tGZ0d+SHBtkkFPVWYkItO9PJtj5bJYjh8QNcwjAwNan5vTxwhzhMX7pQTPHXPZyQIZObczBy/rQ0vasV0OyE=
X-Received: by 2002:a05:6512:799:b0:4f2:5cf0:36fd with SMTP id
 x25-20020a056512079900b004f25cf036fdmr54112lfr.5.1684916684162; Wed, 24 May
 2023 01:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000c0b11d05fa917fe3@google.com>
 <ZGzfzEs-vJcZAySI@zx2c4.com> <20230523090512.19ca60b6@kernel.org>
 <CANn89iLVSiO1o1C-P30_3i19Ci8W1jQk9mr-_OMsQ4tS8Nq2dg@mail.gmail.com>
 <20230523094108.0c624d47@kernel.org>
 <CAHmME9obRJPrjiJE95JZug0r6NUwrwwWib+=LO4jiQf-y2m+Vg@mail.gmail.com>
 <20230523094736.3a9f6f8c@kernel.org> <ZGzxa18w-v8Dsy5D@zx2c4.com>
 <CANn89iLrP7-NbE1yU_okruVKqbuUc3gxPABq4-vQ4SKrUhEdtA@mail.gmail.com>
 <CANn89iKEjb-g1ed2M+VS5avSs=M0gNgH9QWXtOQRM_uDTMCwPw@mail.gmail.com>
In-Reply-To: <CANn89iKEjb-g1ed2M+VS5avSs=M0gNgH9QWXtOQRM_uDTMCwPw@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 24 May 2023 10:24:31 +0200
Message-ID: <CACT4Y+YcNt8rvJRK+XhCZa1Ocw9epHg1oSGc28mntjY3HWZp1g@mail.gmail.com>
Subject: Re: [syzbot] [wireguard?] KASAN: slab-use-after-free Write in
 enqueue_timer
To: Eric Dumazet <edumazet@google.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>, 
 syzbot <syzbot+c2775460db0e1c70018e@syzkaller.appspotmail.com>, 
 netdev@vger.kernel.org, syzkaller-bugs@googlegroups.com, davem@davemloft.net, 
 linux-kernel@vger.kernel.org, pabeni@redhat.com, wireguard@lists.zx2c4.com, 
 jann@thejh.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Tue, 23 May 2023 at 19:07, 'Eric Dumazet' via syzkaller-bugs
<syzkaller-bugs@googlegroups.com> wrote:
>
> On Tue, May 23, 2023 at 7:05=E2=80=AFPM Eric Dumazet <edumazet@google.com=
> wrote:
> >
> > On Tue, May 23, 2023 at 7:01=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4=
.com> wrote:
> > >
> > > On Tue, May 23, 2023 at 09:47:36AM -0700, Jakub Kicinski wrote:
> > > > On Tue, 23 May 2023 18:42:53 +0200 Jason A. Donenfeld wrote:
> > > > > > It should, no idea why it isn't. Looking thru the code now I do=
n't see
> > > > > > any obvious gaps where timer object is on a list but not active=
 :S
> > > > > > There's no way to get a vmcore from syzbot, right? :)
> > > > > >
> > > > > > Also I thought the shutdown leads to a warning when someone tri=
es to
> > > > > > schedule the dead timer but in fact add_timer() just exits clea=
nly.
> > > > > > So the shutdown won't help us find the culprit :(
> > > > >
> > > > > Worth noting that it could also be caused by adding to a dead tim=
er
> > > > > anywhere in priv_data of another netdev, not just the sole timer_=
list
> > > > > in net_device.
> > > >
> > > > Oh, I thought you zero'ed in on the watchdog based on offsets.
> > > > Still, object debug should track all timers in the slab and complai=
n
> > > > on the free path.
> > >
> > > No, I mentioned watchdog because it's the only timer_list in struct
> > > net_device.
> > >
> > > Offset analysis is an interesting idea though. Look at this:
> > >
> > > > The buggy address belongs to the object at ffff88801ecc0000
> > > >  which belongs to the cache kmalloc-cg-8k of size 8192
> > > > The buggy address is located 5376 bytes inside of
> > > >  freed 8192-byte region [ffff88801ecc0000, ffff88801ecc2000)
> > >
> > > IDA says that for syzkaller's vmlinux, net_device has a size of 0xc80
> > > and wg_device has a size of 0x880. 0xc80+0x880=3D5376. Coincidence th=
at
> > > the address offset is just after what wg uses?
> >
> >
> > Note that the syzkaller report mentioned:
> >
> > alloc_netdev_mqs+0x89/0xf30 net/core/dev.c:10626
> >  usbnet_probe+0x196/0x2770 drivers/net/usb/usbnet.c:1698
> >  usb_probe_interface+0x5c4/0xb00 drivers/usb/core/driver.c:396
> >  really_probe+0x294/0xc30 drivers/base/dd.c:658
> >  __driver_probe_device+0x1a2/0x3d0 drivers/base/dd.c:800
> >  driver_probe_device+0x50/0x420 drivers/base/dd.c:830
> >  __device_attach_driver+0x2d3/0x520 drivers/base/dd.c:958
> >
> > So maybe an usbnet driver has a timer_list in its priv_data.
>
> struct usbnet {
> ...
> struct timer_list   delay;

FWIW There are more report examples on the dashboard.
There are some that don't mention wireguard nor usbnet, e.g.:
https://syzkaller.appspot.com/text?tag=3DCrashReport&x=3D17dd2446280000
So that's probably red herring. But they all seem to mention alloc_netdev_m=
qs.
Let's do for now:
#syz set subsystems: net
