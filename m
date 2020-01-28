Return-Path: <SRS0=wYFz=3R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94346C33C9E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 10:37:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A0732467E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 10:37:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="WNWBn73R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A0732467E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32eaf12b;
	Tue, 28 Jan 2020 10:36:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce3d2186
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 10:36:49 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43b8897b
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 10:36:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7e7bb10
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 09:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=mTRsRHnL2O/IXzJoShkF3DXNHic=; b=WNWBn7
 3RHvaTQ94BVQDPeofOMfa+UogiwUTG7KyUJ9XENFt8NcIt2MHfMPB5+3OKZEGyHM
 annQKlIYRWQOZcwbNEms7BfkCkQAPwF7NFcF3qnDEvd9StV8WgkC5tfB4Ufyrlfm
 A3yuOlqzXe6X5mGxDDrnHQG1BKF0gmVivX5eOK3YTwg7USAFINW/1DzL6zCCMNZd
 Ul2L157zjJjGrlpxpAz7J/DkZMdPSl6MfHmy6PCxEZvAvl0eW3SPmP9LHN5vrxvQ
 8cZMVZ1DGmhpSB+FbAzFBiDbK3J3J8YyHhJuEAx6la7jrlHVJDHkRihqpQYEMXi4
 I8rhstuTKgWn3UYA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dbb08909
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 09:34:57 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id r16so11526645otd.2
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jan 2020 02:36:48 -0800 (PST)
X-Gm-Message-State: APjAAAUz/A5ofXdR/tvuCVPsL8AGXjuNwYA8Ta6yYpNI+My8hA9RIRtG
 EwXudBxD/DP9G+Aq+fgICYMpukI/MmL/tyIDZOk=
X-Google-Smtp-Source: APXvYqxOL+BtTdJhmoFEFqSMi+82/+L5NZrDAob/bu8yqX5cdFswAv4yx6mpYI3ZKME4VKvpgCZ4HhOhF0HBT1r3wtU=
X-Received: by 2002:a9d:6745:: with SMTP id w5mr16324546otm.52.1580207807756; 
 Tue, 28 Jan 2020 02:36:47 -0800 (PST)
MIME-Version: 1.0
References: <39913106ac854a2f2515aa2ad10d71ad@rfraile.eu>
In-Reply-To: <39913106ac854a2f2515aa2ad10d71ad@rfraile.eu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 28 Jan 2020 11:36:36 +0100
X-Gmail-Original-Message-ID: <CAHmME9ra9_gXEq4x75MZy2d0Otbs-k9g_GKHcM8d3f4+=GVy7A@mail.gmail.com>
Message-ID: <CAHmME9ra9_gXEq4x75MZy2d0Otbs-k9g_GKHcM8d3f4+=GVy7A@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: Linux and FreeBSD: Add support to search domain
 in wg-quick
To: Ricardo Fraile <rfraile@rfraile.eu>
Cc: kevin@darbyshire-bryant.me.uk, Matt Layher <mdlayher@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

I'm not so sure that we want to fill wg-quick(8) up with every dns
nob... If you have specialized networking requirements, wg-quick(8) is
probably not for you anyway.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
