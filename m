Return-Path: <SRS0=07kU=JH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A963C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 14:30:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0CFD611AE
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Apr 2021 14:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0CFD611AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78443075;
	Sat, 10 Apr 2021 14:27:30 +0000 (UTC)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [2607:f8b0:4864:20::329])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d060addb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Apr 2021 23:05:39 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 w21-20020a9d63950000b02901ce7b8c45b4so459212otk.5
 for <wireguard@lists.zx2c4.com>; Wed, 07 Apr 2021 16:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6PZE53RKNl9B/7ObJZ4xHqEyAwhEqxjrJtKm7dvXLgw=;
 b=PlkBoFV00TEWloGnWt+mqn8Ealk4DO98KFqfesHNFs2ivmwp7zBuo7pRkDXUK7hjBa
 h0brmQCjwBa6RuGgnwMo6Ej2t9Zic53hTQ2X0EBaRIQRHm/sTNW5QlVTfGF0qyY4y2pd
 //KNP1sPZwu745WkSG4M3eCHPqLEkjOuowZYh63ZuuOcIvzZbqZjChfqV7wCJx2WvM+l
 IZtSXDY4PBqdsi6CU9kY/7GWlWZRJ1vPrApJQ4NRbl2bxuWBIy/T+8MyM46xXsxuqhvi
 CSesDNQ08NYQ6gEuZtN/ECnPNzHiURj3ebBtBltf9OsOTCvBzRaKukxQnOeZDktcRPTF
 zsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6PZE53RKNl9B/7ObJZ4xHqEyAwhEqxjrJtKm7dvXLgw=;
 b=rg80IjBzQektE7EFt82umGkdsJaRkiSuW86B6ihFrKPReEFZ0Gx2s2qRDTAt5E7Per
 IUw7q6LzRqrRoLSwyiKfh42CRsmbjYMca5mK5ZNm/WiVxNU13TQwx02c1pTkYF4rzWXR
 apsx5ptQ0TTCYEinyP2zq4COpkyf9wY4l9CUF8dr6PwEQj4pCoXnz947uq/o5WRBe4d+
 shAuMYoyTL7EuHbH4yj8zVdBffLF01GZzniOqJVOqwQwiHEQLw1VCBUM2zDbLYziOyLC
 8LMsGI9pahtbVbeTk0xGc9YPNevHRjee5us0sppyz4I/Zx3XIpatXNOUNGdjSjOUT7kP
 nFjg==
X-Gm-Message-State: AOAM532srpB0iO+YzIRcQs/LA1UMQ5sO5f/NCKs5BzV6/6hRofo1nBDU
 qLb+xlnEbDoP4uZXgAbuNH8Jrmrq5UmukpnUMyvZm8oBZo5VJA==
X-Google-Smtp-Source: ABdhPJxtvnhOYYVTMY5y5TPgcRKEQN4ctFHTVxCKF96J3D+yIMXTn18HcjwBQCKQ3q1YHw6kEOZUceyjSZiDixEhuXs=
X-Received: by 2002:a9d:6e09:: with SMTP id e9mr4973712otr.195.1617836738553; 
 Wed, 07 Apr 2021 16:05:38 -0700 (PDT)
MIME-Version: 1.0
References: <e166447dac58ecaa73bf3f6a2b9bece6a01bf5cd.camel@infradead.org>
 <CAHmME9q-qw=sCxz6Fije+ENQTY2-GdS4bZLSakuh+6Eze4LR3w@mail.gmail.com>
 <e8f0a880ccdca6b252a5b45ebdc54f83ee3fae57.camel@infradead.org>
In-Reply-To: <e8f0a880ccdca6b252a5b45ebdc54f83ee3fae57.camel@infradead.org>
From: Daniel Lenski <dlenski@gmail.com>
Date: Wed, 7 Apr 2021 16:05:02 -0700
Message-ID: <CAOw_LSFfwppgyEN12ttuFMoBpsjCzoUcr5hH5ABxzEs1FhaMpQ@mail.gmail.com>
Subject: Re: Duplicate IP address, and permissions problems on Windows
To: David Woodhouse <dwmw2@infradead.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 10 Apr 2021 14:27:25 +0000
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

On Wed, Apr 7, 2021 at 1:18 AM David Woodhouse <dwmw2@infradead.org> wrote:
>
> On Tue, 2021-04-06 at 18:17 -0600, Jason A. Donenfeld wrote:
> > With regards to permissions, you must be Local System, which is
> > already the case if you're running inside a service. If you'd like to
> > run as a mere Administrator process, you can steal a token with a
> > technique like https://git.zx2c4.com/wireguard-tools/tree/src/ipc-uapi-=
windows.h#n14
> > or https://git.zx2c4.com/wireguard-windows/tree/elevate/doas.go#n30
>
> Great, thanks!
>
> Is there a list of precisely which operations require such privileges?
> Is it only *creating* an adapter? Or only if doing so requires the
> kernel driver to be loaded for the first time?
>

I'm a little confused by this. In my testing of our recent builds of
OpenConnect on Windows 2012 R2 with wintun-0.10.2=E2=80=A6

Running as Administrator *has been* sufficient to allow OpenConnect to
open the Wintun adapters, as well as to configure them with "netsh",
etc.

Is there some additional environment we should be testing in, where
Administrator may *not* be sufficient?

Thanks,
Dan
