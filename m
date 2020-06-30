Return-Path: <SRS0=5l8i=AL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B48C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Jun 2020 04:00:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1CFF206BE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Jun 2020 04:00:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kTIZrS2b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1CFF206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6277fe94;
	Tue, 30 Jun 2020 03:40:32 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [2607:f8b0:4864:20::134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 110b7939
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Jun 2020 03:14:16 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id r12so9210342ilh.4
 for <wireguard@lists.zx2c4.com>; Mon, 29 Jun 2020 20:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gft05NxUENPXKFTcU3ULPY4HOvG0ZoW35LjzI7t7EsQ=;
 b=kTIZrS2bbkCQ7MC1Ioc4nlAADj9SYiWwivDlq+RB9twRHHGlKmStcPpftWwWfKDgkW
 qehPwSB7++lnbpHwmWjCwq8j+4rRGMXKWs/ecVJnrN+/Jzk2iD/DhYlC31M3uVYfF+4m
 ZZ+mSTpTWV/e56wJ/Z6LsuAwinf8vUBo34Z5Bfmwym0/tKElIpzxXGju1TQtUZce8i7b
 4K3oaXAEaQ5hZvjfcR/BoPVAx28M1K25LJtQPvgQHCcIh3gEzKnECQ+1tyhHlRkn7yus
 DN/YOyHoxRE+2Isv02nB7xMYrxYxGs68Cjwr00Qd9IkCmEwNqpTKiCIfUf6/Phed+XHE
 nm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gft05NxUENPXKFTcU3ULPY4HOvG0ZoW35LjzI7t7EsQ=;
 b=NNaInVTSHoPlBfAWvPVPHFX7bbbQHAtRn/z6DDuLdT73qaXIsPtW9OIZhVBwzStC8o
 48hyQIeNSe8+qKqIhdMf13pswKXFOs2TXHgN1jVvPcv2Fh6U6VS8MaIfJN+2fT19SC8S
 FUuwbTXyeL+OraMEe6uOXYbJ3C8qOoRph8xXfAwiXFh2amKW33JEgpfJ2HVD+BgML7GV
 EI2OrsTtMkAecoWmnkZOGyZIRCkDLYevH4WKTmvAqJ8j3Lil/dCG5yVOj3FCEuDlIRgc
 1IdvTe/J40mcQcFbfjlQ0wNvMM3EBG4fEvDIi15FdS61slvSYPpJXx+llItrwkUW9kim
 G74g==
X-Gm-Message-State: AOAM532NWZKzIgnISf+Yfo4I5rdv2lwqYFaeU/Wrj8u3urW67Kp237pv
 FqqCZDB1CaGBw/Ezv3kupj8vfAF/0aOGtxa3Pvc=
X-Google-Smtp-Source: ABdhPJyNp5+HJ0f+g9oh5UeEYmKAPB5B8NvhjqDCBPZP8YaYPdsIM43A+IrZRf4hWcPMLl/aAlqnUN7pmuqqW5P2zI4=
X-Received: by 2002:a05:6e02:147:: with SMTP id j7mr724676ilr.22.1593488039570; 
 Mon, 29 Jun 2020 20:33:59 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000006eb8b705a9426b8b@google.com>
 <CAHmME9qOR4h7hsQ4_QuztPN+6w4KcoaYNs75yJn=L3S2Mhq9rA@mail.gmail.com>
In-Reply-To: <CAHmME9qOR4h7hsQ4_QuztPN+6w4KcoaYNs75yJn=L3S2Mhq9rA@mail.gmail.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Mon, 29 Jun 2020 20:33:48 -0700
Message-ID: <CAM_iQpVxrUinOBjqaw4U5u9PZZSTDY=FgSAsBxMju8uu=F5jfQ@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in netdev_name_node_lookup_rcu
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: syzbot <syzbot+a82be85e09cd5df398fe@syzkaller.appspotmail.com>, 
 Johannes Berg <johannes@sipsolutions.net>, David Miller <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 Netdev <netdev@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 30 Jun 2020 05:40:31 +0200
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

On Mon, Jun 29, 2020 at 6:17 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hey Cong,

Hi, Jason

>
> I'm wondering if the below error is related to what you've been
> looking at yesterday. AFAICT, there's a simple UaF on the attrbuf
> passed to the start method. I recall recently you were working on the
> locking in genetlink's family buffers and wound up mallocing some
> things, so it seems like this might be related. See below.

Yeah, very likely it is the same bug I have fixed. I will close
this together with others.

Thanks.
