Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A30C433E4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 09:30:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BFC82065D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 09:30:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="zQpGq5g+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BFC82065D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06bdb477;
	Fri, 24 Jul 2020 09:06:55 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 68c23604
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 09:06:53 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f10a843
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 09:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=FF1KzM2BeKhxS339XsUPDPD+WkQ=; b=zQpGq5
 g+2Vsj5MD/AtvXppKwpq06IXttBUVHQ6bxjdkPLEWUZiFrlbZC06MVs4AOug9dyy
 G6KNrbY7WEmbIkdvDDuV4qim03hng1uly8mxprTQPDT8GxNvseZoMiMPsJjOy8rl
 viJNmOa3xtY+6LdguZS4KKQXcqfoIFSQxRqNzoi7meSzAvMP0VWZEaW+TLdfxEnY
 v7Gl3Kn4W7+eW/pBKmfKzhriWo6ecp8Gxu/WPFUGwb2TcTtLBqVRvIaMRoSduU3J
 RomUUhvjEZ9HExQXDsTR834HiBNhHW0vibu+7/Fn+RpgfeZ2tnYCB+WonLK4IQTo
 7aUgoXhH6ooH3etw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7384c766
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 09:06:52 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id k23so9113602iom.10
 for <wireguard@lists.zx2c4.com>; Fri, 24 Jul 2020 02:29:46 -0700 (PDT)
X-Gm-Message-State: AOAM533VHAWIQcm0BSTlTRZSAPtYR17eddd0z2O5F/HWuQh/7DLylXFc
 FvnHakcIEhaqBD/y46cUsJ9ufRpNMGRn45J8LYE=
X-Google-Smtp-Source: ABdhPJz0X96bKg8S8QEU8E5MTeqgye7QIlHRq4s3fXT+PtIASkMSg2Y5CbSzaqrr8HrbUUUN18QKILz5hrmAA4Td/Pc=
X-Received: by 2002:a02:a78f:: with SMTP id e15mr9434216jaj.36.1595582986144; 
 Fri, 24 Jul 2020 02:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR02MB52169D6F055314DCD03746EDE6760@VI1PR02MB5216.eurprd02.prod.outlook.com>
 <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
 <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
 <20200724092536.m2bsg2cxo2ga6vwc@CKC-BS-N0240>
In-Reply-To: <20200724092536.m2bsg2cxo2ga6vwc@CKC-BS-N0240>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Jul 2020 11:29:34 +0200
X-Gmail-Original-Message-ID: <CAHmME9p=i5uPJH3KRisrW6ZojnukYrWS9rjh6mVVnu42i-0Tkw@mail.gmail.com>
Message-ID: <CAHmME9p=i5uPJH3KRisrW6ZojnukYrWS9rjh6mVVnu42i-0Tkw@mail.gmail.com>
Subject: Re: [PATCH] Adding support for reloading configuration via systemd
To: Garrit Franke <garritfranke@gmail.com>
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

On Fri, Jul 24, 2020 at 11:25 AM Garrit Franke <garritfranke@gmail.com> wrote:
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

Right, I recall this conversation, and this patch seems to be what we
all had in mind there. So I'm just wondering about the "not the
cleanest" part in the original patch -- if there are other systemd
tricks or something to consider.
