Return-Path: <SRS0=s0AX=FT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1F2C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Dec 2020 16:07:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 287F6224F4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Dec 2020 16:07:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 287F6224F4
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95603ba0;
	Tue, 15 Dec 2020 15:58:30 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d75f4e35
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Dec 2020 15:58:28 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c7f5135
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Dec 2020 15:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=ZNFqGJ
 axGLb3Nxe1F6asScoLfps=; b=JQ/tyDy3dhr5zAGe2rDZF26TRfHybMYrOhgf/b
 cJfIqEOumZXw+VLY8ZNnMsHn3CI/DKbQJtfFKZidwhZbID5NjlZqx271g2NylLJw
 CJsSKdA4KwEjgir5RHsbUNIGPBmBV0yWHdyAw06dmMdmr9js6wZK7sm2onMYlckS
 lhkeXeNOJYD/AbSRClQz55X4+GFadEeedTaUjiUcEWWPUjCzCznLwihDQYxuRYo7
 v24GtpzFwcGxvVJTb2nmOT9vXaG/9El05hzmkGCOR9+apiqeFgdRSXmmwkZsdF3c
 /ipIr7yEM8+KupxZP06YJzTjEBbbxhX+wMaFhJKb+xkxtXfA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f41fa07e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Dec 2020 15:59:14 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id v67so19456284ybi.1
 for <wireguard@lists.zx2c4.com>; Tue, 15 Dec 2020 08:06:44 -0800 (PST)
X-Gm-Message-State: AOAM530KIqAyv9juJ8iHWAuHOAAPZ68nKLiML72JP0Icn7buuQRK8Au8
 e4MOWbV1zf7FpObq5QorDS3OF6Ez/7Pa0z57Jtk=
X-Google-Smtp-Source: ABdhPJwlwZ7nLa/JL/QoNyBba0VmIY6312MzB/H088IAf8R48ti+mwNg3GT3Ck55rQrXJF9r/KBsjQqx48lFvq77a9o=
X-Received: by 2002:a5b:78d:: with SMTP id b13mr43493835ybq.123.1608048404351; 
 Tue, 15 Dec 2020 08:06:44 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 15 Dec 2020 17:06:33 +0100
X-Gmail-Original-Message-ID: <CAHmME9ozv2UAe8NOUaBGDfQpohYS+SLY+Zix8A-q3dt8AKao+w@mail.gmail.com>
Message-ID: <CAHmME9ozv2UAe8NOUaBGDfQpohYS+SLY+Zix8A-q3dt8AKao+w@mail.gmail.com>
Subject: [ANNOUNCE] WireGuardKit for iOS and macOS Released
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi folks,

For the last several weeks, Andrej from Mullvad has been working hard
at modularizing the wireguard-apple repository, which contains the
code we use to build WireGuard for macOS and WireGuard for iOS. The
end result is WireGuardKit, an open source Swift PM package that
anybody can use to easily build macOS and iOS applications that
incorporate WireGuard tunnels. Instructions on usage are available
here:

https://git.zx2c4.com/wireguard-apple/about/#wireguardkit-integration

Users of WireGuardKit will be able to instantiate a WireGuardAdapter
inside of their PacketTunnelProvider network extension. The one that
ships with WireGuard for macOS and iOS should serve as a simple
reference of ~125 lines of boiler plate code:

https://git.zx2c4.com/wireguard-apple/tree/Sources/WireGuardNetworkExtension/PacketTunnelProvider.swift

All of the heavy lifting has moved into the WireGuardKit, so that
application writers do not need to concern themselves with low-level
networking details.

In general, the WireGuardKit project has been a great example of
positive collaboration between the WireGuard open source project and
an industry stakeholder. As Mullvad's mobile apps depend on WireGuard,
putting the development time into improving our upstream code so that
their downstream code can more easily consume it, as well as
contributing fixes and improvements in their downstream code back
upstream, not only makes things easier for Mullvad, but also brings
shared improvements to everyone else across the WireGuard ecosystem.

As more developers begin to use WireGuardKit, we're very interested to
hear feedback, particularly about missing features or APIs that might
be useful.

Enjoy!
Jason

PS: Today we've also sent new versions of the WireGuard app up to the
App Store approval process for iOS and macOS, with a bunch of
performance improvements and also support for Apple Silicon. Who knows
how long it will take for Apple to approve it -- we've experienced
wait times between 1 day and over 1 month -- but keep your eyes peeled
for the update.
