Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 453DAC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 17:49:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96E5D21900
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 17:49:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uQymmA6y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96E5D21900
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b167b8ef;
	Wed, 2 Jan 2019 17:47:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f943b1ec
 for <wireguard@lists.zx2c4.com>; Sun, 9 Dec 2018 12:24:34 +0000 (UTC)
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98963224
 for <wireguard@lists.zx2c4.com>; Sun, 9 Dec 2018 12:24:34 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id c19-v6so7204683lja.5
 for <wireguard@lists.zx2c4.com>; Sun, 09 Dec 2018 04:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=CJi+3wmTLsmICTfW2cFwLLpUnYmYHeiKYYTyJ0KaiLw=;
 b=uQymmA6ybZT8BhqbnJm1nLyCNiClwEGU03tgrHYOT+JEGt2/eiAKJ3UIVDVqrtRHGN
 SbrTGuR3cr68y9lleiDZYFpt1hJiUyesK97+l4bsqebYD10g/rOCuWVgw3h+6TkJG7Fn
 3B/jqGcCZ34d/X3XCO8BvYlE4atdDbnrXa1x0l/h79D4K2SpCu1RDpzPP6OceT1bBe6R
 4IrRAIvrYuN+pe0QvemGBLC8ao3gZqTW1ilrevZrZ7YB6bxsZU74q72PCMRfjm0yB6mv
 E+je/+xGdahuBIHY9OI7xjWzFPrdCYpOoGxmwvFjuuG2HYgSChwS4cpfAb61syV9F482
 DsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=CJi+3wmTLsmICTfW2cFwLLpUnYmYHeiKYYTyJ0KaiLw=;
 b=l4ElCB9BG55THiD0TPEO3hvM8hq2sYjFGG5GnLCfurYT5fBYfezWw/ZjvdXkJzZHL5
 /7Upi3/9iMaSMoJdsnfbBbecje/MwrZNMxluqhrpuM2tOi6kdqEh7PwwlcwWQ5gZGGM/
 3x7L/SQP+1ISypGPinMiCi9/hSTIIFfR3vj5CrfFNUZNkimyCQGqSxOrSgz2ji9Uux8A
 aEDU/NoI2CG8lCeMsBO3sJMCzaIQ8DrC0HaTwMbshbx/4/7cn90m1YYV+EIDeaoOHKOZ
 yllTx3ay1S15XiUZsFz1WHH+lYBgwEo/Pd7MVQSFxVi3zxzSXoeR9loa5HjGT4j54goX
 MSsg==
X-Gm-Message-State: AA+aEWZhMm+f5ub9whdWwI39w8Gec7NAVBKueK71VRKvv7nytel/fuT9
 B1v5lzRL+u8SjKmgOCSj6KyeaB254Mo=
X-Google-Smtp-Source: AFSGD/XNZxEhWFRRglAGHLR2d6oZpVKeU3SAnGxsdGA0MIMltfuFpAJ3UXSbD25AV53rPHL5QHqIVg==
X-Received: by 2002:a2e:2416:: with SMTP id
 k22-v6mr5753851ljk.80.1544358784631; 
 Sun, 09 Dec 2018 04:33:04 -0800 (PST)
Received: from mammut (dhcp-18-250.cable.infonet.ee. [212.7.18.250])
 by smtp.googlemail.com with ESMTPSA id v64sm1578443lfa.48.2018.12.09.04.33.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 09 Dec 2018 04:33:04 -0800 (PST)
Message-ID: <b583ebce1b6eb90fa979953c22f70816ab0f4ceb.camel@gmail.com>
Subject: Re: Simple Shell Script for "Status Monitoring" your WireGuard
From: Arti Zirk <arti.zirk@gmail.com>
To: markus@activezone.de, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Date: Sun, 09 Dec 2018 14:33:03 +0200
In-Reply-To: <59d2f673-9525-0535-7143-a515a1b7f7e0@activezone.de>
References: <59d2f673-9525-0535-7143-a515a1b7f7e0@activezone.de>
User-Agent: Evolution 3.30.2 
Mime-Version: 1.0
X-Mailman-Approved-At: Wed, 02 Jan 2019 18:47:30 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

> Hi!
> 
> I'm new to WireGuard and a formerly user with some experiences
on
> OpenVPN with complex setups but sometimes (I believe) a tools must
be
> changed ;-)
> 
> Now my environment will be migrated to WireGuard and
I have wrote a
> little shell script to get a status page for my
peerings.
> 
> If you are interested on this script please visit the
following site:
> 
> https://activezone.de/wireguard/
> 

Pretty cool script!

I Added some fixes and pushed it to my git repo

https://github.com/artizirk/wg-pprint

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
