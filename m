Return-Path: <SRS0=3VOv=OQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345AFC07E85
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Dec 2018 04:37:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADE4E20850
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Dec 2018 04:37:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="WO81uDP+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADE4E20850
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35f7ffaf;
	Fri, 7 Dec 2018 04:28:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a800fb1
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 04:28:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8bfc10a1
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 04:28:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b51e525a
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 04:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=/UMl7+oL7w0nq2UCPpKERXp5ydE=; b=WO81uD
 P+fBPg4Y1x8KRzx6RNlRfTqg4mQ+o/YL1fNvZV2mrloHBCErZxaC2xd62wtiNig2
 03XxWZswKlxUEmBsVr1Ol4eJeBNR0u9snWaNzkd3mlrLCEkr64vX3GRENsbxxfD5
 OvRrZfPlL3ebRtagR2tHiPIpYMrgwMWt3ubQP8jAEI9BheObzuh6JzWFABHvivXl
 hlHI7nkYgutXqBeJ4bQuEZxcL2EteVs68AmpPoH82ojleG76FMwDh5fTqDfh4JRu
 t3PQWBpCdPXnJmr4JbDlVZwOl15vR0Rl2dMGlBuqTJ2Y7DUUGWl2Eji6dL99FVhM
 pVNdWldqFcX8PC1A==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8fac4d1a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 04:28:52 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id m6so2387661oig.11
 for <wireguard@lists.zx2c4.com>; Thu, 06 Dec 2018 20:37:06 -0800 (PST)
X-Gm-Message-State: AA+aEWZCCpKp08X/jgOCvdjrI6eQ5R+DTVfvooSajddCdvBwXia/+XLW
 55Pi+dSX/Kr+xBQZxZqlVO813ITB7wKqY2p4+f4=
X-Google-Smtp-Source: AFSGD/X4juMKRZoMsBTjQ6bPntaCdyFvdVfpH8086sB5cCvWB/fFNjoKe6Ig6u1oQPqbP8lXTFWy03N9/xUdT7rRPVI=
X-Received: by 2002:aca:2c05:: with SMTP id s5mr447719ois.190.1544157426179;
 Thu, 06 Dec 2018 20:37:06 -0800 (PST)
MIME-Version: 1.0
References: <CADjxVNr0PnZm8ckYtSToOrgkn5DkJUAEqMKZyKULN8avNRcfQQ@mail.gmail.com>
In-Reply-To: <CADjxVNr0PnZm8ckYtSToOrgkn5DkJUAEqMKZyKULN8avNRcfQQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 7 Dec 2018 05:36:54 +0100
X-Gmail-Original-Message-ID: <CAHmME9r2h4iByRJe-V7qd_hE_ErGdcC75FyV1a7w6ik_aMHoWw@mail.gmail.com>
Message-ID: <CAHmME9r2h4iByRJe-V7qd_hE_ErGdcC75FyV1a7w6ik_aMHoWw@mail.gmail.com>
Subject: Re: [PATCH] contrib: handles peer version in embed-wireguard
To: g@wenarab.com
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

Thanks. Fixed there in the same way it was earlier in src/tools/.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
