Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FDAC433E5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 09:28:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 240C32063A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 09:28:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPi6SzTj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 240C32063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f91f16c6;
	Fri, 24 Jul 2020 09:05:14 +0000 (UTC)
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [2607:f8b0:4864:20::c42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8a32f352
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 09:05:11 +0000 (UTC)
Received: by mail-oo1-xc42.google.com with SMTP id o36so1665088ooi.11
 for <wireguard@lists.zx2c4.com>; Fri, 24 Jul 2020 02:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eh2UmVx6MzS/v4cbfh5fUywLjAz8krQTiJ2uPkFDx7Y=;
 b=SPi6SzTj3jkpBhlw6NRRmywrr7le0hj1q4Db7gDGA/VEJ80zaCC7JO54bbN3laAnIH
 3tlXrhoCzw754HatZZQHLa+BCkdd/LcusiDuS72b49rQqvOTKIYl6X1aclFh7GHtfaC5
 uIN2AkcxoNrhAXc6ZYdcdDPSKtZ0/OyQjTFAdETMcdYFfm/XTDMHxgRtTl9QszcTkc1f
 l+ua1te0MeAZ32jsGeBGPoZqPpZPfz44R+2jOMLgZiDKvqgbdusBIwWMKfAa7HC3/h8A
 mX3tGcW0qVumMIWb9R2T3i15uoSpdM/TbLrVdciA43yHT1TAcrbtALqnqVcVOHoLMN54
 8+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eh2UmVx6MzS/v4cbfh5fUywLjAz8krQTiJ2uPkFDx7Y=;
 b=lfzTzXHE44WHPL1QJwvrzMC0YaGqQfho5ALRs9hTVqW/BLkiLhIbW6NfUxBDrJnI93
 4mNJKUafGuOUjB75r2/YXQLcSPGn44sPXQb89Xm/ltCGuA96DIfEVnrDy5XO1y0vxyT1
 ACCTJmst7xzbC4PvNKMEWl1aT/2v7Mi08Vz1FNckDNCd+CRpftT3ty09wD7YYOolcuzU
 ekIaNfX7m3y9Kit0XH0UjLFgRhjY9RxzC64eAvfPM5XUb3TE9hF+FUfgxMC0PFAkYPCF
 jAkXueUXMWeVYyRhws4iq+d5qeUbKLfX+dk7J+L1jOZC3i6P/NTQPYmVABK60UbNBMUA
 mnFg==
X-Gm-Message-State: AOAM530L9ozE6MsbGCC1Dw00bm1vBX5QHPG8gz5Mqt3P2MCRMhpL4krB
 xGv1t/kRkGetxGxoHpOHhouDORBZUhB6sc4MiDMP8M366rPKoQ==
X-Google-Smtp-Source: ABdhPJykznY+7GEMAGOHqyhecQzG2AWqHQ27CKSv0OCqTP0rJcgzZP+dIbvxxVeOmwtFQM1bY/7+cHjwgxSiNyG/2jo=
X-Received: by 2002:a4a:3504:: with SMTP id l4mr5518448ooa.90.1595582885162;
 Fri, 24 Jul 2020 02:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR02MB52169D6F055314DCD03746EDE6760@VI1PR02MB5216.eurprd02.prod.outlook.com>
 <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
 <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
 <20200724092536.m2bsg2cxo2ga6vwc@CKC-BS-N0240>
In-Reply-To: <20200724092536.m2bsg2cxo2ga6vwc@CKC-BS-N0240>
From: Garrit Franke <garritfranke@gmail.com>
Date: Fri, 24 Jul 2020 11:27:54 +0200
Message-ID: <CAD16O851hMSOVF5VzFJqokxg8V_50sHo6U3meJpE3tuWNokGiA@mail.gmail.com>
Subject: Re: [PATCH] Adding support for reloading configuration via systemd
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>,
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

Am Fr., 24. Juli 2020 um 11:25 Uhr schrieb Garrit Franke
<garritfranke@gmail.com>:
>
> On Fri, Jul 24, 2020 at 11:14:52AM +0200, Jason A. Donenfeld wrote:
> > On Fri, Jul 24, 2020 at 10:30 AM Tomcsanyi, Domonkos <domi@tomcsanyi.net> wrote:
> > >
> > > Signed-off-by: Domonkos P. Tomcsanyi <domi@tomcsanyi.net>
> > > ---
> > > src/systemd/wg-quick@.service | 1 +
> > > 1 file changed, 1 insertion(+)
> > >
> > > diff --git a/src/systemd/wg-quick@.service b/src/systemd/wg-quick@.service
> > > index a9cbb58..8eb040b 100644
> > > --- a/src/systemd/wg-quick@.service
> > > +++ b/src/systemd/wg-quick@.service
> > > @@ -15,6 +15,7 @@ Type=oneshot
> > > RemainAfterExit=yes
> > > ExecStart=/usr/bin/wg-quick up %i
> > > ExecStop=/usr/bin/wg-quick down %i
> > > +ExecReload=/bin/bash -c '/usr/bin/wg syncconf %i <(/usr/bin/wg-quick strip
> > > %i)'
> > > Environment=WG_ENDPOINT_RESOLUTION_RETRIES=infinity
> > >
> > > [Install]
> > > --
> > > 2.17.1
> > >
> > > Not the cleanest solution, but I think it might help a lot of people, so I'm
> > > submitting it.
> >
> > This actually doesn't seem too bad to me. Are there cleaner solutions
> > that I'm not thinking of that I should consider before applying this
> > patch?
>
> I think it doesn't get cleaner than this one-liner.
> Some time back I submitted a patch that added a restart command to wg-tools.
> We settled on the conclusion that a systemd approach would be much cleaner.

Sorry, just a little follow up:
https://lists.zx2c4.com/pipermail/wireguard/2020-June/005549.html
