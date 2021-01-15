Return-Path: <SRS0=/ntC=GS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF867C433E9
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Jan 2021 08:13:00 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5F9B2220B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Jan 2021 08:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5F9B2220B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9aced7e3;
	Fri, 15 Jan 2021 08:12:57 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f575a6cd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jan 2021 08:12:54 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id h16so8555631edt.7
 for <wireguard@lists.zx2c4.com>; Fri, 15 Jan 2021 00:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/KDRdTLv6cvRUv652PsxF8N926ZFBRugtlETZnPTzFU=;
 b=A8/Uc3nDXxIJPm5PhhQefDNOFJkWwDrLKk73GAvGjr2+tCJyMwH0i8tFw8mNM0EbeB
 OPZpGbpLw6A+XmsnQR5e4PglAdw9apeXkvGWvzUhfaBcYNXKyH7eOOp5jm10jEgMYDiI
 pRusSP53UeQz7xAJBHsz7y1A0KJ2KaVBP4ElUrgBL6Zh0fImrVfsjrelFu45jzHcAWSu
 nQh2f9GAVZ5FOR5Vboj2FRRj8jMQOYJR+EyTw7NbYxBK3sYoz3AkR2GmZR3OPs0fdxQp
 6FRTYMpbK1363Tm9qV4ycVFhcA7dBu0/mXXsaddgJ0yM5ov+N/gaDoE5/bpk1k0v/nDN
 k9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/KDRdTLv6cvRUv652PsxF8N926ZFBRugtlETZnPTzFU=;
 b=t4SIgn5liNgBa9t4EGGTjhP/g8apCNnXvAMIRKgRlyaoYo42an8ShMZw43vI946QQ3
 YlL361u/6tRUt6aDOzVDQHLCIyUSoVYbPOQxevWF3uPJY26gzGHTTXQSK/vpN+SN5TOc
 jD6YxZ3PPdHZTFviliSNou5i4xO0Ilqlcf3VWURKcR45Aruy/J/OzRnVYh6g4HglT9pN
 ljQaMV36KT4H4yAMFFy3Gnw7jGEnfWxndkcwkZu/f+QBH1rNoEoZV7c4XSlO3nrK1vcz
 vWS91EiLGgOEovlQfRrJVZWj7CUamTPaDKum5JLLaBJ5srwslrxcd0HKMQz4bOGPI9DI
 BA/w==
X-Gm-Message-State: AOAM531HQ03Jrzo5lVFoSK2b+0yxFhTVk9ccnsR06Froo4Nzr6JEX6dR
 hVCPIgDfeBnzVvEBemBSv0exDFyibFnDZfkVVEQ=
X-Google-Smtp-Source: ABdhPJxeENkf0GmKz6sCA174KisWrL0em4x/8KZGFZR/ilxS61sVbhR6+1Dgwqqypj1AB661ZozbQ6y1J8CiZM2dLKU=
X-Received: by 2002:a05:6402:4389:: with SMTP id
 o9mr7750016edc.164.1610698374142; 
 Fri, 15 Jan 2021 00:12:54 -0800 (PST)
MIME-Version: 1.0
References: <X/8aDfdkod+rCPqK@zx2c4.com>
 <33997a3d-591e-9aa3-92fe-a06a4d3c5b26@gmail.com>
In-Reply-To: <33997a3d-591e-9aa3-92fe-a06a4d3c5b26@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 15 Jan 2021 12:12:42 +0400
Message-ID: <CAJ+F1CJY6YU86bu1CMewcJ-tY0v8Y2Kf3JJB8X6puM4f-+=vhw@mail.gmail.com>
Subject: Re: Userspace Networking Stack + WireGuard + Go
To: Julian Orth <ju.orth@gmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com
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

Hi Julian

On Wed, Jan 13, 2021 at 8:28 PM Julian Orth <ju.orth@gmail.com> wrote:
>
> On 13/01/2021 17.04, Jason A. Donenfeld wrote:
>
>  > Even if you're unprivileged and want a WireGuard interface for just a
>  > single application that's bound to the lifetime of that application,
>  > you can still use WireGuard's normal kernel interface inside of a user
>  > namespace + a network namespace, and get a private process-specific
>  > WireGuard interface.
>
> That's what my patches from back in 2018 were trying to accomplish.
> Unless I've missed something since, I do not see how what you're
> describing would work.  Unless you also
>
> - create a TUN device in the network namespace
> - add a default route through that TUN device
> - manually route all traffic between the init network namespace and your
>    network namespace.
>
> Is that what you meant or is there a simpler way?


I am not a network admin, but I agree. Setting up this kind of user
network namespace isn't trivial and requires some privileges. It would
be nice if the kernel or some services provided a simpler way. (fwiw,
some time ago I did some experimental/research work for VM &
containers at https://gitlab.freedesktop.org/elmarco/vnet)

--=20
Marc-Andr=C3=A9 Lureau
