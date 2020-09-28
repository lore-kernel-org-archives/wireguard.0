Return-Path: <SRS0=Zpbp=DI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C78F2C4741F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 11:11:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA2A32087D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 11:11:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=squyres.com header.i=@squyres.com header.b="B0nMNXlQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA2A32087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=squyres.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 266dfcff;
	Thu, 1 Oct 2020 10:39:27 +0000 (UTC)
Received: from squyres.com (squyres.com [64.253.106.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ecf01f42
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 28 Sep 2020 13:22:05 +0000 (UTC)
X-Debug-Header: memoryhole.net squyres.com
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=squyres.com; h=
 mime-version:references:in-reply-to:from:date:message-id:subject
 :to:cc:content-type; s=default; bh=1u8ntyGxCC+b2yfYIPppR7CepV4=; b=
 B0nMNXlQhLzR8FIW/x+imdFdVdDKZwjb+CMCg5dLwvlrmtrfPPm75QpGm0n+glNk
 fgMBuliOil02fO8lj1nnudAKGBdNoaDuDd2uUjg2OlsJnyOE/RJfI8hOWAGgBwSE
 HCX9zDoOtQkqenzp4U0XgsxRxCmUEZS6fq3vWYjrxl8=
Received: (qmail 3811 invoked by uid 64020); 28 Sep 2020 13:53:32 -0000
Received: from unknown (HELO mail-wm1-f41.google.com) (jeff@209.85.128.41) by 
 squyres.com with ESMTPSA (AES128-SHA encrypted, authenticated); 28 
 Sep 2020 13:53:32 -0000
Received: by mail-wm1-f41.google.com with SMTP id w2so1210287wmi.1
 for <wireguard@lists.zx2c4.com>; Mon, 28 Sep 2020 06:53:32 -0700 (PDT)
X-Gm-Message-State: AOAM530IxsYyoj6bYNH4R7/RJ7g95KSKenM11jJh/sAAUqyymzCF8YtW
 1IKq8VvQhF25SlUBRKJ058biqNcV+Gn61S7y4GU=
X-Google-Smtp-Source: ABdhPJyrOANV0eEwd9tY9yH7yjcvRYN2KwZygw6T5sjNn2AXuTcjvGFp3nfzrpR+A3ZmX1hwu3uT9+AoTBWR0qShJcE=
X-Received: by 2002:a7b:c085:: with SMTP id r5mr1903840wmh.52.1601301211736;
 Mon, 28 Sep 2020 06:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <6650E7F9-7985-4DFC-9620-60FFE690C4F8@alexburke.ca>
 <010101747ab4aca3-491864e4-b0b7-474e-903e-035cd3fd9884-000000@us-west-2.amazonses.com>
 <_6C1kLqz08ZzDSlyJFksWGJkEabvSXjImi0ZpRw7s5bjUcMYcUlzSTUg1aUVzhnmAyYvGtMpSYff1DvoDw_vbLxel15gdVmkxtAjZWDp-w8=@protonmail.ch>
In-Reply-To: <_6C1kLqz08ZzDSlyJFksWGJkEabvSXjImi0ZpRw7s5bjUcMYcUlzSTUg1aUVzhnmAyYvGtMpSYff1DvoDw_vbLxel15gdVmkxtAjZWDp-w8=@protonmail.ch>
From: Jeff Squyres <jeff@squyres.com>
Date: Mon, 28 Sep 2020 09:53:20 -0400
X-Gmail-Original-Message-ID: <CAOmeisXta6daStnhuh2J9U6TL=7N6QOfY7G-O_e4OnWV9JT+4Q@mail.gmail.com>
Message-ID: <CAOmeisXta6daStnhuh2J9U6TL=7N6QOfY7G-O_e4OnWV9JT+4Q@mail.gmail.com>
Subject: Re: Two small Wireguard frustrations on Mac & Apple iOS
To: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 01 Oct 2020 12:39:26 +0200
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

FWIW, I first publicly reported this same problem with iOS in Jan
2020: https://lists.zx2c4.com/pipermail/wireguard/2020-January/004860.html
(with much more followup information in
https://lists.zx2c4.com/pipermail/wireguard/2020-January/004874.html).

It still happens periodically on my iOS 13 (and now iOS 14) iPhone 8+.
It happens with much lower frequency than it used to, but it still
definitely happens sometimes.

-- 
{+} Jeff Squyres
