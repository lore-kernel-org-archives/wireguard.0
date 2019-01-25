Return-Path: <SRS0=HYXs=QB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398B8C282C0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Jan 2019 18:28:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6572C218CD
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Jan 2019 18:28:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="lyzMkgxT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6572C218CD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97e4ea8b;
	Fri, 25 Jan 2019 18:23:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32040966
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Jan 2019 18:23:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6b4ffc1
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Jan 2019 18:23:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6fbd1dee
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Jan 2019 18:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=IIQGnf
 RyaW+TjlL5IV5efmb23H0=; b=lyzMkgxTjzcXaF6l+4X6Xrw/+Oe4nUjOgfKeKR
 dNSgeCEVkvCEelmfKalnlw8ZAjtaW8w561A9zeS/xO3cnA3RfoepBlU0JCNrTcs0
 GTHmubihf5Dwh5pPUQLYMWRxKUpT78L5+sehZo328ZmroTf1dtb+Iuh/dY/b5yDL
 2LGz5vXOTrn3Qw3SOm+soNWkTTnw/RhxAKir1vcr1u+e9ttoSiIb6Plxfy4wFwjo
 S2dY4nTQ5WTAgiTQ2RO1FU6eMuvdJbarMA8oAXjZ43DoiH7tJTQauvTBrv92mt4m
 8xZ8cZAaTsUIsChZn/O/Q0SzlTz1OV/nWGt8/u82XnBVL6LQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a9afad8c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Jan 2019 18:14:01 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id y1so8338033oie.12
 for <wireguard@lists.zx2c4.com>; Fri, 25 Jan 2019 10:28:37 -0800 (PST)
X-Gm-Message-State: AJcUukeHM8H1DXDZikNTfO0o5PHQgUDswcxC2umWW6R/kF3T1GGIhUg5
 dGgwHg41x6UqZd0iVzUJiWodK9zTCvcNmleCE+Q=
X-Google-Smtp-Source: AHgI3IZG7skpzscUU/HaKm5uY/eMY7ekjKdLBhAFdVx4GZkNuPCdiqCFr053XQzNSNCcCeVkRdcBg7X0rCXch5ocNtI=
X-Received: by 2002:aca:14f:: with SMTP id 76mr2110540oib.74.1548440916546;
 Fri, 25 Jan 2019 10:28:36 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 25 Jan 2019 19:28:25 +0100
X-Gmail-Original-Message-ID: <CAHmME9oWcFMquF4TuaQ3o1KVN2pBwr4+uyJx4=ujGVtzexzqzw@mail.gmail.com>
Message-ID: <CAHmME9oWcFMquF4TuaQ3o1KVN2pBwr4+uyJx4=ujGVtzexzqzw@mail.gmail.com>
Subject: WireGuard @ FOSDEM -- Meetup
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hey folks,

I think I'll head to FOSDEM next weekend. Is there interest on the
list in some sort of meetup and discussion there? If so, is somebody
who's familiar with the FODEM ins-and-outs willing to work out finding
a room and scheduling?

Regards,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
