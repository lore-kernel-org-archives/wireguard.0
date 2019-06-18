Return-Path: <SRS0=O0ly=UR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60434C31E5B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:25:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D512F2085A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:25:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="P/BMqMBQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D512F2085A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fcb14663;
	Tue, 18 Jun 2019 15:25:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63df41a0
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jun 2019 15:25:24 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64166ce9
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jun 2019 15:25:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66a6e6f8
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jun 2019 14:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=FY4mvcxJNs9lcIlYT7RQmwOBjao=; b=P/BMqM
 BQm/rsU8IH2xyOUDuQM4nZ1L3Qx1QJiTDrTNRoyTzuln6EsHPShpWe3WyJuxZ2S/
 ioHGT9BbSm9E4rBufqbQCkRJqhzoNU6Y302Rh3sgwKQyN2X5BnYGn+Va0SLRW2V+
 QKZiXNG3VGM8JIEZp1K8+Nuh8ZzBiAyqgeYLysewrRXgqCHznSFmpxxCVJx0rafc
 bXLSdOxV4+W2ovTMDVhxxUt3/sFqe20LZCHiE8BUEH2+iSDayPvn83XdPafF+kP9
 PTAtxsigEfqH7uuCKVAdEmRgnDG6LiSqyjX/vEA057ZuBnU1fGUv+Ce6deJRapOK
 ae9krWnBX11MCSxw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f9d86511
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jun 2019 14:52:22 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id x21so15282783otq.12
 for <wireguard@lists.zx2c4.com>; Tue, 18 Jun 2019 08:25:24 -0700 (PDT)
X-Gm-Message-State: APjAAAXNRdpbYCnMWLhC5DNHBZXF060Rtg+z1Yzdv46l86jdcXVMdRUP
 TpbEEudOizUD9d4cE4kEf75mYEMZe2m2jdRBstw=
X-Google-Smtp-Source: APXvYqw0FqZYVqmMOSrKEULg6zq/YGLob77NcGAmbWe0xqUYYFhQVMI98js4ukqlc7QgJZzvqAfbHclx4gxX5iByKTE=
X-Received: by 2002:a05:6830:2148:: with SMTP id
 r8mr15086191otd.179.1560871523527; 
 Tue, 18 Jun 2019 08:25:23 -0700 (PDT)
MIME-Version: 1.0
References: <CFBC8785-569F-45C0-89A6-A90D063F5E0E@ltnglobal.com>
In-Reply-To: <CFBC8785-569F-45C0-89A6-A90D063F5E0E@ltnglobal.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 18 Jun 2019 17:25:12 +0200
X-Gmail-Original-Message-ID: <CAHmME9p2JzW3RgbquhX=g2pGjg215evBeo-5qVeQWJua6tRD0Q@mail.gmail.com>
Message-ID: <CAHmME9p2JzW3RgbquhX=g2pGjg215evBeo-5qVeQWJua6tRD0Q@mail.gmail.com>
Subject: Re: Can I be reasonably sure the code in
 /usr/share/doc/wireguard-tools/examples/embeddable-wg-library
 will continue to exist / work
To: Larry Kelly <lkelly@ltnglobal.com>
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

Hi Larry,

The netlink interface that that library uses should be fairly stable, yes.

Neat about adding custom authentication on top of WireGuard. I'm sure
the list would be curious to learn about your efforts if they're open
source.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
