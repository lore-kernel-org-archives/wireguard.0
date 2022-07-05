Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB95FC43334
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jul 2022 12:08:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id db874294;
	Tue, 5 Jul 2022 12:08:02 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 54285656
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2022 12:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657022879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rtU/kjgULaXwcfy8e9s7Yd/T+aye61K0bMduomyl2x8=;
 b=U60Gf/9fXpdlgdO7UwDHxqJ0w4Bcp32TMjCGUt0oFpG5+sK0FbZJTRcNLuCSVhVWgJ+UOz
 tZNv15QPfvc9WPqSvijzgnnyjPxsKPuHponJ31pqWeA+hHnDI7qUDKQLg3SxB0A870L2lU
 uW58sGxVbG8neJKRSmXbVH8SIigHStM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-SY_p41x6NYOdyX-ywEAGhQ-1; Tue, 05 Jul 2022 08:07:52 -0400
X-MC-Unique: SY_p41x6NYOdyX-ywEAGhQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso2684822ejs.12
 for <wireguard@lists.zx2c4.com>; Tue, 05 Jul 2022 05:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rtU/kjgULaXwcfy8e9s7Yd/T+aye61K0bMduomyl2x8=;
 b=elUUewd6atXsQOw/GU9df3+qpNTNebB5bHV8st3HeolTzkumTk773n2SKKlZS3PJLq
 HjE3526W/car2ZE8ZIAbDgdux7NWJFuxUrw+9GXIzKCvTxtpCVGG3JSKZ8XMlsumcxM4
 0JljXgTuJAzz8H2hv7JMyXVJxC3UZC7Jsx5VRS2oqgevZoGfZgcl3LuQS3cadCkQBB+V
 kNpuVvD0QrQ45AlZmbLbDBc9OmK32AsJZsYqR7SySly2XEYP9QUim1mMwhU6HMW6upcU
 LOBvLMivrxS4ivf4M7Jh//1+OLxMev2Z6+2JfBJAfkGrU5oIS5vc8sgSNtMmRPPiKWP5
 bWfg==
X-Gm-Message-State: AJIora/cPATd6SwEACjjc7s4odMFQ7pmXm9G8wpe7I25Wr2dtX675XzO
 /GGRvdKq+XKg3xqJBQTiUmuz5Aa8cyfyQznZiFG7u49qTjbV9JmxRDlubnBwoSf6UZL95Ccs+gF
 cv78q0meWfoNDwULWoFgUEMmUE7U8puvLhRhH
X-Received: by 2002:a17:907:60cb:b0:726:a69a:c7a with SMTP id
 hv11-20020a17090760cb00b00726a69a0c7amr34652265ejc.156.1657022871628; 
 Tue, 05 Jul 2022 05:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uhvLESVkJqLMUVkS1+sqRcYMDYYv/DpSqkaUqCJgY9nCI7teVnX7sRGbX5NjXfak1s0+Cw2DXmD+gxM4e1w/E=
X-Received: by 2002:a17:907:60cb:b0:726:a69a:c7a with SMTP id
 hv11-20020a17090760cb00b00726a69a0c7amr34652242ejc.156.1657022871395; Tue, 05
 Jul 2022 05:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220704191535.76006-1-vdronov@redhat.com>
 <YsOKj/GE2Mb2UsYa@zx2c4.com> <YsOY/eWq7gRjXJK1@zx2c4.com>
In-Reply-To: <YsOY/eWq7gRjXJK1@zx2c4.com>
From: Vlad Dronov <vdronov@redhat.com>
Date: Tue, 5 Jul 2022 14:07:40 +0200
Message-ID: <CAMusb+RLB6-oz10yp9Cdigt0TeJ_85M30bH8snZaeM2CyvUiYA@mail.gmail.com>
Subject: Re: [PATCH] wireguard: Kconfig: select CRYPTO_CHACHA_S390
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Harald Freudenberger <freude@linux.ibm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, 
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 LKML <linux-kernel@vger.kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vdronov@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

Hi,

On Tue, Jul 5, 2022 at 3:51 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Tue, Jul 05, 2022 at 02:49:19AM +0200, Jason A. Donenfeld wrote:
> > Hi Vladis,
> >
> > On Mon, Jul 04, 2022 at 09:15:35PM +0200, Vladis Dronov wrote:
> > > Select the new implementation of CHACHA20 for S390 when available,
> > > it is faster than the generic software implementation.
> > >
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Link: https://lore.kernel.org/linux-kernel/202207030630.6SZVkrWf-lkp@intel.com/
> > > Signed-off-by: Vladis Dronov <vdronov@redhat.com>
> > > ... skip ...
> >
> > Thanks for the patch. Queued up as:
> > https://git.zx2c4.com/wireguard-linux/commit/?id=1b4ab028730cd00c144eaa51160865504b780961
> >
> > I'll include this in my series to net.git soon.

Thanks a ton, Jason!
Most appreciated.

> This actually leads to a minor problem:
>
>   WARNING: unmet direct dependencies detected for CRYPTO_CHACHA_S390
>     Depends on [n]: CRYPTO [=y] && CRYPTO_HW [=n] && S390 [=y]
>
> This is of course harmless, since this doesn't *actually* depend on
> CRYPTO_HW. In fact, the dependency on CRYPTO_HW is entirely a mistake
> here that was repeated a few times. I cleaned this up and fixed it in
> this patch:
>
>     https://lore.kernel.org/linux-crypto/20220705014653.111335-1-Jason@zx2c4.com/
>
> So hopefully Herbert will take that for 5.19 and then we'll be all set
> here.
>
> Jason

Whoa, that's... funny. Honestly, I was always wondering why CRYPTO_CHACHA_S390
and friends live in drivers/crypto/Kconfig. Now I know why. The patch
looks great, thank you.

Best regards,
Vladis Dronov | Red Hat, Inc. | The Core Kernel | Senior Software Engineer

