Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3453BC4360F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:47:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3A1B218AE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:47:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="aCRKTwRP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3A1B218AE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69725769;
	Wed, 20 Mar 2019 22:46:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d57da636
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 22:46:19 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1210b617
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 22:46:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb58729b
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 22:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=uALcIcuP7pc21/RDCqdpKkljnkU=; b=aCRKTw
 RPpYgdGMoYpLIToPicfklb9slK4Dff6kuvf6y3HUp19dCF2tZ/DVjVk8ygxdP09Q
 lR5rfbSHKqJGaaSbbgufK86IL0Mp0R3y0z8eWkICU1JzF6fGgZEeJXTckEpg+1PF
 VxUfblNOOcUyrPCUEupEWX7/zpk4sN5DOac2pDkx4Y8g/GBLb6eJct3aNYCRKPi5
 mR1AxfvpCGgVsB99agZdxX0L5+ZOjkQhz38GiaEV00mTwl7GMPbpMxECF/4KnzJ/
 j5HVIdKPVfy69N4X2sfnpZcdYxL246E7dkgNIEb0CHQveKuO7NvEhqwB5VpWiJQw
 teV6iVHDdSKz0wwg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 912751fc
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 22:25:06 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id e22so3229088oiy.0
 for <wireguard@lists.zx2c4.com>; Wed, 20 Mar 2019 15:46:39 -0700 (PDT)
X-Gm-Message-State: APjAAAXr7UIFyCUtDWOeqvBiZiFdni7Usjf5xeLou96+GeguXijt04Au
 V9Mxddu+kPTGTv6JFh9YXnFmHsY96Vz6uy7UNPE=
X-Google-Smtp-Source: APXvYqz01PjowLrmoZvkLVpf5btr4oirmCQcTN1vyHaKPyRREo8Z9D20jAtAh7uCIVX019TtiSXRzVYMlC3XbHjhmVs=
X-Received: by 2002:aca:550c:: with SMTP id j12mr307951oib.52.1553121999169;
 Wed, 20 Mar 2019 15:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAAvxC95qZXF-eDkZ7P2e+nYbxXzh66FHN=x+iV2jDPvv7=uS8g@mail.gmail.com>
In-Reply-To: <CAAvxC95qZXF-eDkZ7P2e+nYbxXzh66FHN=x+iV2jDPvv7=uS8g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 20 Mar 2019 16:46:27 -0600
X-Gmail-Original-Message-ID: <CAHmME9pTsVh20Xsn27QoU=S2jugeGvWe7Uvh9V9Fq1Lfv4q=Zw@mail.gmail.com>
Message-ID: <CAHmME9pTsVh20Xsn27QoU=S2jugeGvWe7Uvh9V9Fq1Lfv4q=Zw@mail.gmail.com>
Subject: Re: [Bug] MacOS import fails due to line ending
To: =?UTF-8?B?Q2/Fn2t1IEJhxZ8=?= <cosku.bas@gmail.com>
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

https://git.zx2c4.com/wireguard-ios/commit/?id=1d768d4e9d9e0e2002b73cac35f21f43c10ba894

This is released on the app stores now.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
