Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,TVD_SPACE_RATIO,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68AA7C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 17:55:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C93921871
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 17:55:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="CFWNKyU4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C93921871
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a22d697b;
	Wed, 2 Jan 2019 17:53:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3dc84c2
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 17:52:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9f4423a
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 17:52:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c61a3338
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 17:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=YPB/II2UP1gsbejqFQRjgUvybbg=; b=CFWNKy
 U4KCp6r6y4wuO4xAB3jdVKJzlwZDqLNtr4WNqsOr5+JlkMyw4xWSsECH+aYC1Eei
 TgBEXk3DhSSDgdrhBAG6LVtPWAc8oDOVLG0E+00eXtnM0458z1wRipOaWZ4Hq6dI
 oGp0yoX+W2jY80o6N/9tbNcj/kMrRiOACZqYuBNBZqO8Wt5JCtUdnkEGlodip8No
 FfqFUuYSPTVXr+seVaa9KAiI2VJqzLNAO05bZpI1lK44OiL0kFUmJx5xhy+hwgwR
 lclYtj1Wsvtp+5sowqZhdtHiQZF00s28sZ79fQg+TCzL6CzufaXA9ggCHWDfiAGb
 NNB6VW1Qw4c9jR9A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5bf680a8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 17:43:44 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id t204so25706320oie.7
 for <wireguard@lists.zx2c4.com>; Wed, 02 Jan 2019 09:55:23 -0800 (PST)
X-Gm-Message-State: AA+aEWa34aYDdeHFlaJcrO+udwnSfrQfv/mkLene1/DSXzaffSZW3PD+
 E/aGIKIdfq1hPmRti+zeP1jwMI2SACoCDQPNHSQ=
X-Google-Smtp-Source: AFSGD/X2mBcHhX7S+/ubLVkJYCdw84PZrduStIqbrIX2472tuyoKjhlvHTPyNVFCNE2xvFK+ovls2i/gqQgTzIS49iI=
X-Received: by 2002:aca:2c05:: with SMTP id s5mr31187303ois.190.1546451722358; 
 Wed, 02 Jan 2019 09:55:22 -0800 (PST)
MIME-Version: 1.0
References: <CANe8y8aLx8pRXAZhwD9Cn4zY5tg2w7Mq3nc=WT9s=2kULx9tPg@mail.gmail.com>
In-Reply-To: <CANe8y8aLx8pRXAZhwD9Cn4zY5tg2w7Mq3nc=WT9s=2kULx9tPg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 2 Jan 2019 18:55:11 +0100
X-Gmail-Original-Message-ID: <CAHmME9qn5o4UVPnx3g-kNW3+h17Yhn2fCd0jKMRVavkRg3SSiw@mail.gmail.com>
Message-ID: <CAHmME9qn5o4UVPnx3g-kNW3+h17Yhn2fCd0jKMRVavkRg3SSiw@mail.gmail.com>
Subject: Re: signature verification
To: C Habs <bumpthelala@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Signing key: https://www.zx2c4.com/keys/AB9942E6D4A4CFC3412620A749FC7012A5DE03AE.asc
Tarball: https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181218.tar.xz
Signature: https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181218.tar.asc

zx2c4@thinkpad /tmp $ wget -q
https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181218.tar.xz
zx2c4@thinkpad /tmp $ wget -q
https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20181218.tar.asc
zx2c4@thinkpad /tmp $ unxz WireGuard-0.0.20181218.tar.xz
zx2c4@thinkpad /tmp $ gpg --verify WireGuard-0.0.20181218.tar.asc
gpg: assuming signed data in 'WireGuard-0.0.20181218.tar'
gpg: Signature made Tue 18 Dec 2018 04:42:59 PM CET
gpg:                using RSA key AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
gpg:                issuer "jason@zx2c4.com"
gpg: Good signature from "Jason A. Donenfeld <Jason@zx2c4.com>"
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
