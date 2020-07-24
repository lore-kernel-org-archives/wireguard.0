Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A36C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 14:27:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B06542063A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 14:27:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="hvm/XiOl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B06542063A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1da53d4c;
	Fri, 24 Jul 2020 14:04:02 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4545bf9e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 14:04:01 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4107533b
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 14:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=l+JL1OirzqGO
 aATHvyVkVpJJgno=; b=hvm/XiOlNJvJfOaBTiWr2eHfNkcUpgufS3Wkk4qyxi+G
 FXH7NwD1Eas3cD6wxLW7EZNxjMboSm6w284fWissQBnvesXbJfPrqE1e7RW/3iVs
 0X6mKBRiic4b7Wj2hi7zik9PLMp4WcfUfOYw2zVp744YDYy5nT3lGPB7cWoPDkaw
 3qotx4agGSSAncQHJLCpx1ybWCZ+0qEvfjgHUt03V9Cxk3goJGyCt38k/TB5wonw
 hBDZpaFTGyV5V0fR+vomPiH8SSoYhwh9Qgi7uodZHOWwDuccEV7Gkno87KRYCNje
 firB59XHqMRN+TnYVtEaD2iirDZbGgHZTk/q29KDZw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 04061491
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 14:04:00 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id a11so7383003ilk.0
 for <wireguard@lists.zx2c4.com>; Fri, 24 Jul 2020 07:26:56 -0700 (PDT)
X-Gm-Message-State: AOAM5327fPlxOQAfXIfHAOR7k3X9YG6tT3GFOcRVuLu5v2dcG7M7p/jh
 zQKFo1prCTQqHl7H0qo+UZd+00og3SlaJ2lWqA8=
X-Google-Smtp-Source: ABdhPJwY2ZQuEIaYb+p3SsBWuS/Le3WCBJ0tuN6ykeMw60BpG+vfFeJ6BWT+woMhE0I1hyvaYiqWhJx9UsBH/Ax5b+Q=
X-Received: by 2002:a92:50f:: with SMTP id q15mr10825870ile.38.1595600815714; 
 Fri, 24 Jul 2020 07:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR02MB52169D6F055314DCD03746EDE6760@VI1PR02MB5216.eurprd02.prod.outlook.com>
 <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
 <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
 <20200724092536.m2bsg2cxo2ga6vwc@CKC-BS-N0240>
 <CAHmME9p=i5uPJH3KRisrW6ZojnukYrWS9rjh6mVVnu42i-0Tkw@mail.gmail.com>
 <CABZXeoBN-0fBVpXnu4=J-ovxxNCXV5FAQ4rGsuaTe2Jecf060g@mail.gmail.com>
In-Reply-To: <CABZXeoBN-0fBVpXnu4=J-ovxxNCXV5FAQ4rGsuaTe2Jecf060g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Jul 2020 16:26:44 +0200
X-Gmail-Original-Message-ID: <CAHmME9qX9h9GKCEXfLiU4=AJ-v6CSWEFCcV5Xy54gBefXdy=Vg@mail.gmail.com>
Message-ID: <CAHmME9qX9h9GKCEXfLiU4=AJ-v6CSWEFCcV5Xy54gBefXdy=Vg@mail.gmail.com>
Subject: Re: [PATCH] Adding support for reloading configuration via systemd
To: =?UTF-8?Q?Tomcs=C3=A1nyi=2C_Domonkos?= <domi@tomcsanyi.net>
Cc: Garrit Franke <garritfranke@gmail.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Fri, Jul 24, 2020 at 3:09 PM Tomcs=C3=A1nyi, Domonkos <domi@tomcsanyi.ne=
t> wrote:
>
> On Fri, Jul 24, 2020 at 11:29 AM Jason A. Donenfeld <Jason@zx2c4.com> wro=
te:
> >
> > On Fri, Jul 24, 2020 at 11:25 AM Garrit Franke <garritfranke@gmail.com>=
 wrote:
> > >
> > > On Fri, Jul 24, 2020 at 11:14:52AM +0200, Jason A. Donenfeld wrote:
> > > > On Fri, Jul 24, 2020 at 10:30 AM Tomcsanyi, Domonkos <domi@tomcsany=
i.net> wrote:
> > > > >
> > > > > Signed-off-by: Domonkos P. Tomcsanyi <domi@tomcsanyi.net>
> > > > > ---
> > > > > src/systemd/wg-quick@.service | 1 +
> > > > > 1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/src/systemd/wg-quick@.service b/src/systemd/wg-quick=
@.service
> > > > > index a9cbb58..8eb040b 100644
> > > > > --- a/src/systemd/wg-quick@.service
> > > > > +++ b/src/systemd/wg-quick@.service
> > > > > @@ -15,6 +15,7 @@ Type=3Doneshot
> > > > > RemainAfterExit=3Dyes
> > > > > ExecStart=3D/usr/bin/wg-quick up %i
> > > > > ExecStop=3D/usr/bin/wg-quick down %i
> > > > > +ExecReload=3D/bin/bash -c '/usr/bin/wg syncconf %i <(/usr/bin/wg=
-quick strip
> > > > > %i)'
> > > > > Environment=3DWG_ENDPOINT_RESOLUTION_RETRIES=3Dinfinity
> > > > >
> > > > > [Install]
> > > > > --
> > > > > 2.17.1
> > > > >
> > > > > Not the cleanest solution, but I think it might help a lot of peo=
ple, so I'm
> > > > > submitting it.
> > > >
> > > > This actually doesn't seem too bad to me. Are there cleaner solutio=
ns
> > > > that I'm not thinking of that I should consider before applying thi=
s
> > > > patch?
> > >
> > > I think it doesn't get cleaner than this one-liner.
> > > Some time back I submitted a patch that added a restart command to wg=
-tools.
> > > We settled on the conclusion that a systemd approach would be much cl=
eaner.
> >
> > Right, I recall this conversation, and this patch seems to be what we
> > all had in mind there. So I'm just wondering about the "not the
> > cleanest" part in the original patch -- if there are other systemd
> > tricks or something to consider.
>
>
> Thanks for the positive feedback guys. I'm not very much experienced
> with systemd and frankly this one liner was the first hit from a
> simple Google search, hence my comment about it not being the
> best/cleanest solution. It suited my needs and it worked, so I decided
> to send it in, because the functionality seemed like something other
> sysadmins would appreciate.
> If you like it and there is currently no other solution suggested by
> the list I'd be very happy and proud to have it merged :).

Great, good to know. Made some small adjustments and committed this as:
https://git.zx2c4.com/wireguard-tools/commit/?id=3Da66219fa107e1bf0a03ebbbc=
405879c1f0a826c5

Thanks for the patch!

Jason
