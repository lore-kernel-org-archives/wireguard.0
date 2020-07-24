Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195FCC433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 13:10:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71DBB20714
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 13:10:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=tomcsanyi-net.20150623.gappssmtp.com header.i=@tomcsanyi-net.20150623.gappssmtp.com header.b="XX33RA2J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71DBB20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tomcsanyi.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 392d2691;
	Fri, 24 Jul 2020 12:46:51 +0000 (UTC)
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [2607:f8b0:4864:20::244])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9757946e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 12:46:49 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id k22so7979693oib.0
 for <wireguard@lists.zx2c4.com>; Fri, 24 Jul 2020 06:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomcsanyi-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hV+5iIEclYAbKaOS5VxvbGPzl6Axlkn/BImFfNZyjN0=;
 b=XX33RA2JwmCb84+q6Pt/Fxko40NAPHLYh0kN3diOwf7p0kua4a0BPwj3oeJaZXggUi
 KPGSW70TtNFFWqXiTepCSHLEF6ZI2xkPbEvxxB/Xs643zA0eaLh0x3wfgdXKFTWiSRg9
 xfvfuLHP2sDP9rnjPJXa7GLyqrvvt8qZ3YaL6H+a0LKPlVCc8Iyry7po6dIeXB7Vt8yE
 0hVbzvmamuISyyyLpQ7udBkoWS7j1o34jy3ZwnMUR08rafG+Sh+VuHPllhwKByxK6HvN
 t+WZpkhU6ofeEuZcrkP+w2GQyopINEZtNClCbWaWjVL29VcvsGuV8islg1Q27BzNnnVH
 6JOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hV+5iIEclYAbKaOS5VxvbGPzl6Axlkn/BImFfNZyjN0=;
 b=Kcy0b4pdmfCMLL1YhzPxNDLKf/dH0d88H1AslqGfforO3mBYddeYauRmkYqkX9bpKx
 I5qe8iD9TvffUXjcyOGFXd4+bqtjZM4wyrHoQ4O3BH5w4Ib21OBSB9udK2H+1AOSWPmj
 aKNdPwqH6JcU/cs5/ZgGpLh5loI7i6SNFcW3scm+LrjeyNElEw3ckrEuHmPiXEESdZxm
 V4oX0/1kjK9UFP+dx6IUo/4i6hu7oz+lMfQcqDBe0iBRGFblsfX5YT1odB/RtmpNMcCv
 goDSm1laNLKnj1c7g4B39p9GtVt4CTc+NvQX4S8NnO5eE/929iwx/3fkvD+tknkur/NR
 Wz8g==
X-Gm-Message-State: AOAM530uh3fNmKy5GM4tmFqa86iaEfuJH8TwchIF2y47bISvro6OifaV
 pUjr2OhrCVx9nur2yxgHolJ2HfD+CEfauom6Dgb2Og==
X-Google-Smtp-Source: ABdhPJxiaZ5rTFroDdLjOBBZL4hjoY7LWlqM22UTjPXAVyt7+g800zuYFkCdM+sRrz7KnD+0Dq+LjJO21ZqjCtdrkP4=
X-Received: by 2002:aca:1016:: with SMTP id 22mr7627344oiq.66.1595596184140;
 Fri, 24 Jul 2020 06:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR02MB52169D6F055314DCD03746EDE6760@VI1PR02MB5216.eurprd02.prod.outlook.com>
 <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
 <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
 <20200724092536.m2bsg2cxo2ga6vwc@CKC-BS-N0240>
 <CAHmME9p=i5uPJH3KRisrW6ZojnukYrWS9rjh6mVVnu42i-0Tkw@mail.gmail.com>
In-Reply-To: <CAHmME9p=i5uPJH3KRisrW6ZojnukYrWS9rjh6mVVnu42i-0Tkw@mail.gmail.com>
From: =?UTF-8?Q?Tomcs=C3=A1nyi=2C_Domonkos?= <domi@tomcsanyi.net>
Date: Fri, 24 Jul 2020 15:09:33 +0200
Message-ID: <CABZXeoBN-0fBVpXnu4=J-ovxxNCXV5FAQ4rGsuaTe2Jecf060g@mail.gmail.com>
Subject: Re: [PATCH] Adding support for reloading configuration via systemd
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Garrit Franke <garritfranke@gmail.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Jul 24, 2020 at 11:29 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Fri, Jul 24, 2020 at 11:25 AM Garrit Franke <garritfranke@gmail.com> wrote:
> >
> > On Fri, Jul 24, 2020 at 11:14:52AM +0200, Jason A. Donenfeld wrote:
> > > On Fri, Jul 24, 2020 at 10:30 AM Tomcsanyi, Domonkos <domi@tomcsanyi.net> wrote:
> > > >
> > > > Signed-off-by: Domonkos P. Tomcsanyi <domi@tomcsanyi.net>
> > > > ---
> > > > src/systemd/wg-quick@.service | 1 +
> > > > 1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/src/systemd/wg-quick@.service b/src/systemd/wg-quick@.service
> > > > index a9cbb58..8eb040b 100644
> > > > --- a/src/systemd/wg-quick@.service
> > > > +++ b/src/systemd/wg-quick@.service
> > > > @@ -15,6 +15,7 @@ Type=oneshot
> > > > RemainAfterExit=yes
> > > > ExecStart=/usr/bin/wg-quick up %i
> > > > ExecStop=/usr/bin/wg-quick down %i
> > > > +ExecReload=/bin/bash -c '/usr/bin/wg syncconf %i <(/usr/bin/wg-quick strip
> > > > %i)'
> > > > Environment=WG_ENDPOINT_RESOLUTION_RETRIES=infinity
> > > >
> > > > [Install]
> > > > --
> > > > 2.17.1
> > > >
> > > > Not the cleanest solution, but I think it might help a lot of people, so I'm
> > > > submitting it.
> > >
> > > This actually doesn't seem too bad to me. Are there cleaner solutions
> > > that I'm not thinking of that I should consider before applying this
> > > patch?
> >
> > I think it doesn't get cleaner than this one-liner.
> > Some time back I submitted a patch that added a restart command to wg-tools.
> > We settled on the conclusion that a systemd approach would be much cleaner.
>
> Right, I recall this conversation, and this patch seems to be what we
> all had in mind there. So I'm just wondering about the "not the
> cleanest" part in the original patch -- if there are other systemd
> tricks or something to consider.


Thanks for the positive feedback guys. I'm not very much experienced
with systemd and frankly this one liner was the first hit from a
simple Google search, hence my comment about it not being the
best/cleanest solution. It suited my needs and it worked, so I decided
to send it in, because the functionality seemed like something other
sysadmins would appreciate.
If you like it and there is currently no other solution suggested by
the list I'd be very happy and proud to have it merged :).
