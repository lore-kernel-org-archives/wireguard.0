Return-Path: <SRS0=o99y=2A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 483C3C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 16:25:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB5B72073B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 16:25:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="bArm0qsJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB5B72073B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72368afa;
	Tue, 10 Dec 2019 16:24:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8cb8cc92
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 16:23:59 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6d89a69
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 16:23:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fde2a74d
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 15:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=FUJK1QV3GQaCanOrcY8zizLsltE=; b=bArm0q
 sJPvoNglPBcxzngcb/PNfHViZye1wKAuRyiQoV/S+fpgxEYS0m6wKaumi4PKa6AL
 3iJAaWdeCmIWC7qmWD5vRBt35kfBYy5TnFyIpT0t2mKVJZCisNDeSyiDfznxhSGg
 CWAYYOSQH+eDxtMLRot2OCnLYBkaXJ2rUDTOnXnEqGo97nfs95MsUQ5IrDxduN2z
 LDjkOTQIehq/CQUU97Mn1YWNxxble20IgXtNLo6Tpgt8g5o5L3CnRWaH3TkIH4ku
 +lUijQgXNUm2Q+/ifbgvSi0O2iR42eqoCyuMHliLsS7tBGy9pmYMUq75rnbG5QJD
 zoxNGKw+62Yw+ihQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b49628c6
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 15:28:25 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id x195so10349949oix.4
 for <wireguard@lists.zx2c4.com>; Tue, 10 Dec 2019 08:23:58 -0800 (PST)
X-Gm-Message-State: APjAAAXlaMl4Q4hlCqf1se9sZMpNhmORHUzmkzYIvGiRY7emneHPVUiW
 FN3bEQVqJ5cutgU5UEW7ZxPwzKq/qbFSZo+kdlg=
X-Google-Smtp-Source: APXvYqyfLrAzvDeEBFGCDmy6BPwP0BwH1smxhJl1Q56bb+ZjSMn1fPPGnRKbmNdN9NO3Xuxm2IyfGWJXm8rL/mmBHQM=
X-Received: by 2002:aca:815:: with SMTP id 21mr4858984oii.52.1575995038089;
 Tue, 10 Dec 2019 08:23:58 -0800 (PST)
MIME-Version: 1.0
References: <CACZqfqDUquPPnrpqMzf4irqyUU7TYOrmRPnYp3=6pkxuuYgj6A@mail.gmail.com>
In-Reply-To: <CACZqfqDUquPPnrpqMzf4irqyUU7TYOrmRPnYp3=6pkxuuYgj6A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 10 Dec 2019 17:23:46 +0100
X-Gmail-Original-Message-ID: <CAHmME9pDbqRwYL-4COsweRc6u2GyBUDUSwFYrsVts7i_oQF6OA@mail.gmail.com>
Message-ID: <CAHmME9pDbqRwYL-4COsweRc6u2GyBUDUSwFYrsVts7i_oQF6OA@mail.gmail.com>
Subject: Re: Spelling corrections for WireGuard
To: Josh Soref <jsoref@gmail.com>
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

Can I have your signed-off-by line, please?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
