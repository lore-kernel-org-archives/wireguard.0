Return-Path: <SRS0=m2o5=BO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02327C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Aug 2020 21:59:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 571D822B42
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Aug 2020 21:59:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Nr91Au3s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 571D822B42
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 422eecee;
	Tue, 4 Aug 2020 21:34:09 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 72fda95f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Aug 2020 21:34:07 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b3078af
 for <wireguard@lists.zx2c4.com>; Tue, 4 Aug 2020 21:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :in-reply-to:references:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=hrwGiXPYj8D2E188WoOqQq7KTPI=; b=Nr91Au
 3sD3RHfd3Qq4GUJyLfC2nuYmbH+9eC4aZXenkdOdp6YDAVhKyKAnGJ4U+383KaZN
 Kga+3Lbn11REDVXn2WKp5tAMxkgoH3H6/6Cy6d+o5tJG0arB48NAn93JaxtJf1VM
 P8Ep858Kxm78CEQwA9/fM3LK5qNSW/p1s2MYgQ+b7Fz7/LlfhbqEo53PpKqV6VCi
 i6vgGUfVzJ4iNggEmbny0kdERaykyzsR/MUyzFuKZOavqyljMEu/2fy3CySJSHsV
 yPdC+Q85FUHo0ps+WavnK6z4x58ii/GntSbTZ7nW6D9JCedO7C3nM2rZWO/JlwGi
 o3RPvg8JP3WNDrpw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8949a427
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Aug 2020 21:34:07 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id q75so35702299iod.1
 for <wireguard@lists.zx2c4.com>; Tue, 04 Aug 2020 14:58:31 -0700 (PDT)
X-Gm-Message-State: AOAM531DBT40RC++n0th1ubEFNxU7qpS9mOnrso9LYJq+dMIhXpg8fOd
 X0/Yp18wV4hrsUdtEy3aZe6nHUP9r5a/WQyQyw8=
X-Google-Smtp-Source: ABdhPJztt8odPbQGriNawudmYLqpVfY8ElccFOxHv2jCfkUPVoa0sFDB8UdmErUF/Hru7EHWXG7bxBCftr5hpcgD5/Y=
X-Received: by 2002:a6b:b211:: with SMTP id b17mr81810iof.29.1596578310814;
 Tue, 04 Aug 2020 14:58:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6e02:607:0:0:0:0 with HTTP; Tue, 4 Aug 2020 14:58:29
 -0700 (PDT)
In-Reply-To: <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
References: <20200803102808.GA1402387@zx2c4.com>
 <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 4 Aug 2020 23:58:29 +0200
X-Gmail-Original-Message-ID: <CAHmME9qeZ5bSFToFoQZqiNQpwNyHp+25T9Nzhu+cR=7s+oGR1w@mail.gmail.com>
Message-ID: <CAHmME9qeZ5bSFToFoQZqiNQpwNyHp+25T9Nzhu+cR=7s+oGR1w@mail.gmail.com>
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
To: lists@noddingdog.org
Cc: wireguard@lists.zx2c4.com, unit193@ubuntu.com, apw@canonical.com
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

Hey NoddingDog,

I think that the fix has now been released to -updates, as of about 20
minutes ago. It may still take some time to hit the mirrors, but can
you see if "apt update && apt upgrade && apt install wireguard"
produces a saner result than last time?

Thanks to Andy for getting this fixed so quickly!

Jason
