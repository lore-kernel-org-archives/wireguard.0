Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57721C77B75
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 May 2023 17:08:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb07bd66;
	Tue, 23 May 2023 17:05:41 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cb69d1ef
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 May 2023 17:05:39 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f5dbd8f677so2725e9.1
 for <wireguard@lists.zx2c4.com>; Tue, 23 May 2023 10:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684861539; x=1687453539;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rIR5dBTy4LAOVVbHQuz2WZ9012ZJ29GqkZ6Duz5IJ1o=;
 b=0ph8Fiwykgc2GiwRw+3NbsZHDpATEbqZdsCFqEUKNhnPhmdDYoJ4qb8MZ7WI1hfU5m
 WV/7wqMXZsumFezN//QAqQsPeyI6LpF0C2suuwfgHDEJyttsA+OfdEVIz6kR6QUncdG6
 ZZYBnUNg1apIvfMHVFg/sFZHmt+SgZMlE0kXBcXmq3M9TA/Ay7nmsxKumWKZa3JUvYRr
 NEnmT4H5+eqw/tKZ56n0lJ5mL1En05RX9pKHC568xPvDkVfbOoROgnPrSO5PRe2DM9UO
 C/bGtXt9qkZJhM4wEhkqkUr42S1FFtoS9oWiwH3Geq5KVx9oy5OcBr1ljnVtcJNWProg
 1WVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684861539; x=1687453539;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rIR5dBTy4LAOVVbHQuz2WZ9012ZJ29GqkZ6Duz5IJ1o=;
 b=GwENcc7FtdWo1e6JbpqiVK1rHWqiZRB/9WqnUb7h/qrsRViNUlBMF9Tr5Joju9Fvei
 fstUnpwgRhJz+CVLFLEhA8RBYzx0ylJ1prnQSAZza+bYKzg3WOoKtAyMgaJLw4rDrq/l
 zvcRow8x2y/q5l+SKt73xtL6lwQEE3pTZpbKZSzvtVtKngy6Aq10gQ61IxAsMSU71fiR
 9OFEwwTDOosZN765VP92oj7ivTNdVhw9z5z06aa2H37KYzh26/nBCJP3bdHNCV3B2by7
 Z9L/A7XCQ0jETuGmL33jqD3BQzKzbldJt2Q5Y27+jIQrD9Of0LAcCYOAjrfyID/U53wf
 bNYg==
X-Gm-Message-State: AC+VfDwISnG8MA7X9Z6zdKGRDxGm4rRF4fvvfhHay8VpYM6j3DVAiBM6
 hqKjpMJMYUiBsFq2JDSinxIxc5bpovCicXogMmjTMA==
X-Google-Smtp-Source: ACHHUZ4JrYStaHVNsIxq+qlNQuKOS/DwLStXtaCqL3kzj1eOBBKVWiuPzynxEqHX5UHiWs6n9l9i8AGRpPPNyk+1xPs=
X-Received: by 2002:a05:600c:3b8c:b0:3f4:2736:b5eb with SMTP id
 n12-20020a05600c3b8c00b003f42736b5ebmr5437wms.1.1684861538921; Tue, 23 May
 2023 10:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000c0b11d05fa917fe3@google.com>
 <ZGzfzEs-vJcZAySI@zx2c4.com> <20230523090512.19ca60b6@kernel.org>
 <CANn89iLVSiO1o1C-P30_3i19Ci8W1jQk9mr-_OMsQ4tS8Nq2dg@mail.gmail.com>
 <20230523094108.0c624d47@kernel.org>
 <CAHmME9obRJPrjiJE95JZug0r6NUwrwwWib+=LO4jiQf-y2m+Vg@mail.gmail.com>
 <20230523094736.3a9f6f8c@kernel.org> <ZGzxa18w-v8Dsy5D@zx2c4.com>
In-Reply-To: <ZGzxa18w-v8Dsy5D@zx2c4.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 23 May 2023 19:05:27 +0200
Message-ID: <CANn89iLrP7-NbE1yU_okruVKqbuUc3gxPABq4-vQ4SKrUhEdtA@mail.gmail.com>
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

On Tue, May 23, 2023 at 7:01=E2=80=AFPM Jason A. Donenfeld <Jason@zx2c4.com=
> wrote:
>
> On Tue, May 23, 2023 at 09:47:36AM -0700, Jakub Kicinski wrote:
> > On Tue, 23 May 2023 18:42:53 +0200 Jason A. Donenfeld wrote:
> > > > It should, no idea why it isn't. Looking thru the code now I don't =
see
> > > > any obvious gaps where timer object is on a list but not active :S
> > > > There's no way to get a vmcore from syzbot, right? :)
> > > >
> > > > Also I thought the shutdown leads to a warning when someone tries t=
o
> > > > schedule the dead timer but in fact add_timer() just exits cleanly.
> > > > So the shutdown won't help us find the culprit :(
> > >
> > > Worth noting that it could also be caused by adding to a dead timer
> > > anywhere in priv_data of another netdev, not just the sole timer_list
> > > in net_device.
> >
> > Oh, I thought you zero'ed in on the watchdog based on offsets.
> > Still, object debug should track all timers in the slab and complain
> > on the free path.
>
> No, I mentioned watchdog because it's the only timer_list in struct
> net_device.
>
> Offset analysis is an interesting idea though. Look at this:
>
> > The buggy address belongs to the object at ffff88801ecc0000
> >  which belongs to the cache kmalloc-cg-8k of size 8192
> > The buggy address is located 5376 bytes inside of
> >  freed 8192-byte region [ffff88801ecc0000, ffff88801ecc2000)
>
> IDA says that for syzkaller's vmlinux, net_device has a size of 0xc80
> and wg_device has a size of 0x880. 0xc80+0x880=3D5376. Coincidence that
> the address offset is just after what wg uses?


Note that the syzkaller report mentioned:

alloc_netdev_mqs+0x89/0xf30 net/core/dev.c:10626
 usbnet_probe+0x196/0x2770 drivers/net/usb/usbnet.c:1698
 usb_probe_interface+0x5c4/0xb00 drivers/usb/core/driver.c:396
 really_probe+0x294/0xc30 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x3d0 drivers/base/dd.c:800
 driver_probe_device+0x50/0x420 drivers/base/dd.c:830
 __device_attach_driver+0x2d3/0x520 drivers/base/dd.c:958

So maybe an usbnet driver has a timer_list in its priv_data.
