Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C1EC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Nov 2021 16:41:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d4de9ec0;
	Thu, 25 Nov 2021 16:38:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d7604541
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Nov 2021 16:38:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 756E261130
 for <wireguard@lists.zx2c4.com>; Thu, 25 Nov 2021 16:38:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Se7b9c9k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1637858312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MmuMuFL5qlRvaThf9A9diDDTjGPsvrYDWgpDwcJX0HE=;
 b=Se7b9c9kxFX2afa1ThFpI/J3Fp132CNHrsJlw3PC1xVwSaryRS8QZ6+Q9f1rpFSqx3bJp5
 ailGtJSP/AUyty5iIVrs25FcsdnrMhjB5JGtTd+/uFOuPbflDAy6Chr1d37ewdUJB2LD/t
 Y/fDdQ6RTX3k1e5B9/Ge6HwBYcZ8NF4=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 4fd30f6a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Nov 2021 16:38:31 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id d10so13313043ybe.3
 for <wireguard@lists.zx2c4.com>; Thu, 25 Nov 2021 08:38:31 -0800 (PST)
X-Gm-Message-State: AOAM532kXPh5GjBi+GhItn2YhD79N46DsyBqEmr+5YckJgkKjLHE6DXO
 9Akd606XYlqer7rhcSWNqKFa90CZUYXNR5ImCvQ=
X-Google-Smtp-Source: ABdhPJxzGTN6Abp2XQeEMlJjq3AI02/kZKw1bKjd4ma1eh15bj49HkkGZDGqcRGMTmOZkKpqTI2Ljri0LDwhvlOsQhw=
X-Received: by 2002:a5b:783:: with SMTP id b3mr7399183ybq.328.1637858310885;
 Thu, 25 Nov 2021 08:38:30 -0800 (PST)
MIME-Version: 1.0
References: <20211123190331.101346-1-minus@mnus.de>
 <CAHmME9pEf9=6C3eAXfanftBt4LJ4viRszQc5oG3Jt9H7Fxd68A@mail.gmail.com>
 <fef7daf2-adf7-e042-4977-46fda04aa07d@mnus.de>
In-Reply-To: <fef7daf2-adf7-e042-4977-46fda04aa07d@mnus.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 25 Nov 2021 17:38:20 +0100
X-Gmail-Original-Message-ID: <CAHmME9qMLM=HedzvADriiWLZXbo0yLoxt=Nk9B=PGcwY9kn0eg@mail.gmail.com>
Message-ID: <CAHmME9qMLM=HedzvADriiWLZXbo0yLoxt=Nk9B=PGcwY9kn0eg@mail.gmail.com>
Subject: Re: [PATCH wireguard-go] conn: linux: fix incorrect endpoint address
To: minus <minus@mnus.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hey Minus,

I'm not seeing what could be causing this. Could you triple check that
it really is busted on Debian 8?

Jason
