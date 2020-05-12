Return-Path: <SRS0=yjuW=62=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A18C54E4B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 May 2020 06:33:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 589F020714
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 12 May 2020 06:33:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="A/zLHOx2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 589F020714
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f69236a6;
	Tue, 12 May 2020 06:19:35 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e0307b12
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 May 2020 06:19:34 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d24b3333
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 May 2020 06:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:cc:content-type; s=mail; bh=WpP
 fL/NRj2LBQHgVwKlxmQmkdOw=; b=A/zLHOx2A5N/z649VteStFm1bcXtk7HKVgz
 WascLxSFPbmjYinbLtNtE6/wPbcHomh9/EvEwRF+QciyvOkbPhgHJqaqkeT0JmxU
 ZCjhdIENuVrbsIl7tl62MB2/FzMQVfJBpkHVnUW5fSIqZQEp18a/y3RtlOpmSBpS
 6cPND2AoFzFkmb+Ts8GWtAcIsLzKOqCd7OiwstFAykvQuv9AE1U2qjK497N7hgFk
 QlY6Mt69QSARmJFjFzRlXFJhIAhwKlRLhwvYfQNQmdN2bI4fB/vM2zztMtgNiArX
 C03XoZHLNPiwSKNoVU76qFlWJyk1aWsPtGolTfceZfkJd5E9SHg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 795a62df
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 May 2020 06:19:33 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id w11so12658198iov.8
 for <wireguard@lists.zx2c4.com>; Mon, 11 May 2020 23:32:58 -0700 (PDT)
X-Gm-Message-State: AGi0PubLz1TN6jujzw34l88BLUvOcf2gKnB9mD8OS1Bfikzai3hc87DX
 qXcVYi7c6QlU9ZxuQXhrChrbYoqfcpT55oPjQi8=
X-Google-Smtp-Source: APiQypJwF/bLrVZBk8KKu40/2D2nPs+rZdYD1gDisYHbNfQi8LzbRMSptZnanz5NNDJMdpnpqfPPNjtbV2eZhXQ3rSc=
X-Received: by 2002:a02:b88e:: with SMTP id p14mr18464395jam.36.1589265177912; 
 Mon, 11 May 2020 23:32:57 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 12 May 2020 00:32:46 -0600
X-Gmail-Original-Message-ID: <CAHmME9oZxfaLpt7d=6omZEH0+cAKJPYw451ARTz0HJrMtrVnkw@mail.gmail.com>
Message-ID: <CAHmME9oZxfaLpt7d=6omZEH0+cAKJPYw451ARTz0HJrMtrVnkw@mail.gmail.com>
Subject: WireGuard for OpenBSD Kernel Patches Posted
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Matt Dunwoodie <ncon@noconroy.net>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hey folks,

I'm delighted to announce that Matt has posted his OpenBSD kernel port
to the OpenBSD mailing list:

https://marc.info/?l=openbsd-tech&m=158926407905492&w=2
https://marc.info/?l=openbsd-tech&m=158926356005344&w=2

We've worked together closely on this for a long time, and I think
this is a high quality implementation with a lot of the same security
design principles as our Linux implementation. In a way, WireGuard's
minimalism fits into and was inspired by OpenBSD's overall design
philosophy. Looking forward to seeing how things pan out on the
mailing list there; I'm optimistic.

Users can try this out early by following the directions at:
https://git.zx2c4.com/wireguard-openbsd/about/

Regards,
Jason
