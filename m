Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD21C7EE2D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 May 2023 17:08:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fcd3ef74;
	Tue, 23 May 2023 17:07:19 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 78cf7aab
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 May 2023 17:07:18 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f5dbd8f677so2855e9.1
 for <wireguard@lists.zx2c4.com>; Tue, 23 May 2023 10:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684861638; x=1687453638;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GHdfMZv0cy22FLane8ijEboUT+kVjbL/DCDppADKX+k=;
 b=0grIKoLCQ1KOkzxXNQQcTiRdILG1UZHFa44FWGwoPciSkfblNsR9BngCSr/4SsspVN
 Ow5Na28xe6jkBR4eQUWliJUf4ayw2x+wKW4jUydglJ0ybRUK0UVJsOfm8ai0XpG56eaJ
 adC7VuahPtsUuh668ZqeL96i42QjQ5YY8wtlvocUrs2eqAuE5O/ZIXdfJbmXpfyVzXTQ
 REwGx1vCgYxWf8o2Uf+C+eurWXc0401I8BY1u9X9c/SkwcP2NHPhVBnROt11OXWK/RuB
 4VDOfv4Mz82SJLwDg6AfcPDU+u648WMpG9F1z6lnxpd4g8OPmqdMhEAoxvjNJo759r+G
 XPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684861638; x=1687453638;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GHdfMZv0cy22FLane8ijEboUT+kVjbL/DCDppADKX+k=;
 b=VSxqVN17B8AIj8v/pZ9bpyn++ljL1GqnYY0vgpPGcApf9lKynvMaUtpATFhZu/9V5T
 F89gxXkB8Ze6eMuYcWKW+Uey36k7ebyM4DTqH/JDB1CdwFtrvzOD7Vk42QctIHHTw5cp
 +74S/37D4fN367E7sb/rlolB+VUbZo6ERg3YaeJRrgaynaZaJ7qliXpXf12IkLFtrjhX
 buf4rZfZiiXOlE6Gr6nEYUORoAEmYGyuuhgBSOS56pLUFBNhchRs40Y9pgDLbwE61rkP
 l6lZ3ZI5SDBrhh18jkXPBYRIg2MEWHEYSJXvwhLcq7zaid1PLlDPOwW+2suAnyATdY+L
 uLdQ==
X-Gm-Message-State: AC+VfDzT2p3cjtN+dxYnfKWltKouoSvhBEueiPsABPIaa5nswk1JATaj
 gngZb80ekTfpMwZQ1ScEzjgeFfHY+zz83r94GMMEsg==
X-Google-Smtp-Source: ACHHUZ5Js64aJk0ljsRBYPJmgK9djtmA1ZUniVrphpU59gCR5nDmOPv+1UdBUgInscfNur8wGv5eVd5TyYXEDbVbjeM=
X-Received: by 2002:a05:600c:4309:b0:3f1:9396:6fbf with SMTP id
 p9-20020a05600c430900b003f193966fbfmr2569wme.4.1684861637622; Tue, 23 May
 2023 10:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000c0b11d05fa917fe3@google.com>
 <ZGzfzEs-vJcZAySI@zx2c4.com> <20230523090512.19ca60b6@kernel.org>
 <CANn89iLVSiO1o1C-P30_3i19Ci8W1jQk9mr-_OMsQ4tS8Nq2dg@mail.gmail.com>
 <20230523094108.0c624d47@kernel.org>
 <CAHmME9obRJPrjiJE95JZug0r6NUwrwwWib+=LO4jiQf-y2m+Vg@mail.gmail.com>
 <20230523094736.3a9f6f8c@kernel.org> <ZGzxa18w-v8Dsy5D@zx2c4.com>
 <CANn89iLrP7-NbE1yU_okruVKqbuUc3gxPABq4-vQ4SKrUhEdtA@mail.gmail.com>
In-Reply-To: <CANn89iLrP7-NbE1yU_okruVKqbuUc3gxPABq4-vQ4SKrUhEdtA@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 23 May 2023 19:07:05 +0200
Message-ID: <CANn89iKEjb-g1ed2M+VS5avSs=M0gNgH9QWXtOQRM_uDTMCwPw@mail.gmail.com>
Subject: Re: [syzbot] [wireguard?] KASAN: slab-use-after-free Write in
 enqueue_timer
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Jakub Kicinski <kuba@kernel.org>, 
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

On Tue, May 23, 2023 at 7:05=E2=80=AFPM Eric Dumazet <edumazet@google.com> =
wrote:
>
> On Tue, May 23, 2023 at 7:01=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.c=
om> wrote:
> >
> > On Tue, May 23, 2023 at 09:47:36AM -0700, Jakub Kicinski wrote:
> > > On Tue, 23 May 2023 18:42:53 +0200 Jason A. Donenfeld wrote:
> > > > > It should, no idea why it isn't. Looking thru the code now I don'=
t see
> > > > > any obvious gaps where timer object is on a list but not active :=
S
> > > > > There's no way to get a vmcore from syzbot, right? :)
> > > > >
> > > > > Also I thought the shutdown leads to a warning when someone tries=
 to
> > > > > schedule the dead timer but in fact add_timer() just exits cleanl=
y.
> > > > > So the shutdown won't help us find the culprit :(
> > > >
> > > > Worth noting that it could also be caused by adding to a dead timer
> > > > anywhere in priv_data of another netdev, not just the sole timer_li=
st
> > > > in net_device.
> > >
> > > Oh, I thought you zero'ed in on the watchdog based on offsets.
> > > Still, object debug should track all timers in the slab and complain
> > > on the free path.
> >
> > No, I mentioned watchdog because it's the only timer_list in struct
> > net_device.
> >
> > Offset analysis is an interesting idea though. Look at this:
> >
> > > The buggy address belongs to the object at ffff88801ecc0000
> > >  which belongs to the cache kmalloc-cg-8k of size 8192
> > > The buggy address is located 5376 bytes inside of
> > >  freed 8192-byte region [ffff88801ecc0000, ffff88801ecc2000)
> >
> > IDA says that for syzkaller's vmlinux, net_device has a size of 0xc80
> > and wg_device has a size of 0x880. 0xc80+0x880=3D5376. Coincidence that
> > the address offset is just after what wg uses?
>
>
> Note that the syzkaller report mentioned:
>
> alloc_netdev_mqs+0x89/0xf30 net/core/dev.c:10626
>  usbnet_probe+0x196/0x2770 drivers/net/usb/usbnet.c:1698
>  usb_probe_interface+0x5c4/0xb00 drivers/usb/core/driver.c:396
>  really_probe+0x294/0xc30 drivers/base/dd.c:658
>  __driver_probe_device+0x1a2/0x3d0 drivers/base/dd.c:800
>  driver_probe_device+0x50/0x420 drivers/base/dd.c:830
>  __device_attach_driver+0x2d3/0x520 drivers/base/dd.c:958
>
> So maybe an usbnet driver has a timer_list in its priv_data.

struct usbnet {
...
struct timer_list   delay;
