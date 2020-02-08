Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6118C35242
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:31:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2A4222522
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:31:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="dvmoSfHM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2A4222522
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb67d6d3;
	Sat, 8 Feb 2020 21:29:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c189bc33
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:29:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6be82ed6
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:27:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b3662e6
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=iNhuS2EuyuHuDburnIl3gIlzSPg=; b=dvmoSf
 HMyac0YJvi6NrprY4w8rwQsvPbc1LofYTBVjOh9tGRjSp76WZm3FqE8Xfo0UYi9x
 ce1/V2dRcGoVisojt2QozWW8x9CrkhkfLXrii3IKPZmgcAFv0M44UhOegh4XBuRm
 4PQ7mL9Uq9JFX5BmpWKypRUdxcg8HQ69jTXeF4uMG9jfQApSL0KPGtjzmIrMo9yl
 GNiZIBERGC+4R8ZMxurf7So+Ja9xVeQ3qVzht7RXiYEzp6GOxgr9pN03+PEcly0b
 pIlFyTrrjfC+e+JizC8YInSZVPDIhp99uwfmXxC0J2PU2mT/leBVdBzuLatRI6wz
 4TEv1W/lj2fVRjkA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 72f959ad
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:27:53 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id 59so2693418otp.12
 for <wireguard@lists.zx2c4.com>; Sat, 08 Feb 2020 13:29:15 -0800 (PST)
X-Gm-Message-State: APjAAAUNB0sK6z6jU8jp9VPrbR5ejqXnEgbi1VGLIu7/Tn/hGx5Mf9yV
 +iu8/7L9J4J9nkqAjVrCXAbgy34LyPXFZtpCpJo=
X-Google-Smtp-Source: APXvYqx/Z1/9T0hjzTYuYhfp5bqAlXxQz++sfLudu1jtJGtctlztMbjHjK7fk+lhq6NZp5G+geB7t9GmztfteCKtzzM=
X-Received: by 2002:a9d:7a47:: with SMTP id z7mr4885918otm.179.1581197354865; 
 Sat, 08 Feb 2020 13:29:14 -0800 (PST)
MIME-Version: 1.0
References: <CA+w0pKbV0bUrYfvnZ82Nam2oCODGG5_hv4d+AzqYXvuto3Y_vg@mail.gmail.com>
In-Reply-To: <CA+w0pKbV0bUrYfvnZ82Nam2oCODGG5_hv4d+AzqYXvuto3Y_vg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 8 Feb 2020 22:29:03 +0100
X-Gmail-Original-Message-ID: <CAHmME9pFY10ujuOWUD45YkEu8zgFgyQP+zxbSbYE+oh=2fhmnQ@mail.gmail.com>
Message-ID: <CAHmME9pFY10ujuOWUD45YkEu8zgFgyQP+zxbSbYE+oh=2fhmnQ@mail.gmail.com>
Subject: Re: CryptoKey Routing Management for Peers
To: Barrett Strausser <barrett@bossanova.com>
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

WireGuard has an API, via Netlink. This might help you:

https://git.zx2c4.com/wireguard-tools/tree/contrib/embeddable-wg-library
https://git.zx2c4.com/wireguard-tools/tree/src/uapi/linux/wireguard.h

It can handle 1M peers, yes.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
