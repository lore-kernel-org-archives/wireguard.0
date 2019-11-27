Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399A5C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 10:18:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EC4C20656
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 10:18:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="zQa+m/Tl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EC4C20656
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3b07a4f;
	Wed, 27 Nov 2019 10:18:34 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e528363d
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 10:18:32 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c83bd2b
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 10:18:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3370a321
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 09:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=QiGhZQwXYxbOuOLo2d1kW83ymiU=; b=zQa+m/
 TlZZ09nR8Er5jn7z6cVgRjDmZ4YomS/47dU5sB92pEoOCDrbqum/NIziuS1wiHOG
 O+7jfcgNS/ytyxUK4Nv6X2P2Z3RDeUU/Smc2fMY8wCPhTpUVP8mdSn3YwqKgoMPv
 HH0mZu7+GXzIMz7kaFaJccvLmVYkkdYZZP0nhbrc4K5Kn+hnE5IQDk5+KvIMFHrI
 k+ftTxAfaVHcD4M3hOyJH9vdT+YUhaBPiSk9Yc+f7JXQwwFOLr9CcTESag2FJaz7
 itd7UK3a+h9h45cx5h35QMZogGqDDH1VQb0RzCUBF8EwUVJ97OkkLH2NfVYKvgzt
 2TLYwA/HW0n1VTig==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 92513d7f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 09:24:42 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id r24so18623686otk.12
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 02:18:32 -0800 (PST)
X-Gm-Message-State: APjAAAU9uu3GKUjwdN9PWWFwosk/poP30XbKHdJg93VOZSK3KoMfeemP
 Ik4mOFARW8a0clNhDGkJvmNXRAlL7ACIQ1aw7ng=
X-Google-Smtp-Source: APXvYqxY9wMhUaojaE/tBH6Svc5txgfv25RwtvCoBz587aPJYLIw64+EZeGRFvSzeZ68uo7dVIsiGOp05oXRV0OqUpg=
X-Received: by 2002:a9d:4788:: with SMTP id b8mr2988334otf.120.1574849911565; 
 Wed, 27 Nov 2019 02:18:31 -0800 (PST)
MIME-Version: 1.0
References: <CAPWNY8UPSzZuOYb9P1nLV3N6K+C971xjaRteOS2ekTCaFWS=9w@mail.gmail.com>
In-Reply-To: <CAPWNY8UPSzZuOYb9P1nLV3N6K+C971xjaRteOS2ekTCaFWS=9w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 27 Nov 2019 11:18:20 +0100
X-Gmail-Original-Message-ID: <CAHmME9r2Q4c4YP32arbVsaUwYSOg2nS83J499+WnhKenDgOYpQ@mail.gmail.com>
Message-ID: <CAHmME9r2Q4c4YP32arbVsaUwYSOg2nS83J499+WnhKenDgOYpQ@mail.gmail.com>
Subject: Re: Windows: "Not migrating configuration" after every Insider update
To: =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
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

Voila https://git.zx2c4.com/wireguard-windows/commit/?id=202fd6904f31bb7bd166a600a84d0909754d8579
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
