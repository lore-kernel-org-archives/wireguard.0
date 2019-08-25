Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,PDS_TONAME_EQ_TOLOCAL_SHORT,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC222C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:56:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AC562070B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:56:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="m94NLi+j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AC562070B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f45af21;
	Sun, 25 Aug 2019 15:53:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b24139a7
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:53:37 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81114320
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:51:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5022d792
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=VOwKfheyejoJlvDW87V5xGLX6JM=; b=m94NLi
 +j3P94La9yYJPlMyqCNIsAnB3S8ApUX2gRTLZ9y4Q1Fu4EhY6utB5GG1vs/CTdUD
 eIA6nk2cECMwBu5pzR0twjCHUTXP7n5+mhL5B6pEGHmIZ05/CvIsymgKrj798zqM
 FLpIW/42MulHcQ8x54T2osxaEE/G+gGMlYqAAat6p8hTVJ3E1BbJwiNEgs3qx3Cg
 FxPrF89wvTkgOKrmh0EVAVVyDEI9XvBKJJzmV3nJZniiHpALgmfpLFb1aQ4Vn1Pg
 VhGr3u0tcvZipmoJlOEOgWEx4GkVnhuVQnj/BKJqFqEX3D3KtWKwyRLoNfLLRO+e
 B5rjbfTJieDGtKYw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 262ae4ba
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:09:34 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id b187so9355812vsc.9
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 08:51:22 -0700 (PDT)
X-Gm-Message-State: APjAAAUC4cQKl9KdEWOQKllpd2uYjPPLZWQtK8Al0VEuYVFgfkOLibJo
 jqJ8P3hu4yu33RJJOtaycHQrClUM4BbDAQ08x+o=
X-Google-Smtp-Source: APXvYqwIcvy24aIb25WJar0gM1T0ngEnSAPJKhwjA/XhCRcR82ECi9ehdymEG8q0zy3L9ZCxe6p6jOEZrM/sPKFZStk=
X-Received: by 2002:a05:6102:100f:: with SMTP id
 q15mr8524049vsp.100.1566748281641; 
 Sun, 25 Aug 2019 08:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <CANNc_DSMxv5NhrNnKkVp+yYGEmDm48Db=8VsB_S0N4RVai1jUQ@mail.gmail.com>
In-Reply-To: <CANNc_DSMxv5NhrNnKkVp+yYGEmDm48Db=8VsB_S0N4RVai1jUQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 25 Aug 2019 09:51:10 -0600
X-Gmail-Original-Message-ID: <CAHmME9rGNPRtoAhi2Y94sMk8B-Q9f++v0S8rprTpwakV+a1Jig@mail.gmail.com>
Message-ID: <CAHmME9rGNPRtoAhi2Y94sMk8B-Q9f++v0S8rprTpwakV+a1Jig@mail.gmail.com>
Subject: Re: Ryzen 3000 CPU soft lockup
To: trulyliu <trulyliu@gmail.com>
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

WireGuard uses get_random_u32 which uses rdrand. AMD shipped with a
broken rdrand. Update your CPU's microcode or your motherboard's BIOS
and all should be good.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
