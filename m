Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F5D5C4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 29 Oct 2023 16:22:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03197011;
	Sun, 29 Oct 2023 16:20:21 +0000 (UTC)
Received: from mail-200167.simplelogin.co (mail-200167.simplelogin.co
 [176.119.200.167])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8e084a51
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Oct 2023 16:20:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1698596414;
 cv=none;
 b=IS02nr6mweqAKUnOJw98pULFp6enrO7PEg2UFQmZXb231UG4/i+47RLsb88bczQY8bgfLORf2gz4xZNMHuSolhyTIJdUMRbMRItn6tnTAnE0Uv/e0gWhVdzO+eJLekHz5VzIVtpCYK+++zfx210jFg5jS6uku78fx0fAou33ry8a1TJ7+hFRVfB/DhJo9pMQhS96EtFAKjL96vc/wr8GsAS8vcep/2gV7qFPTB3hqE8AxFUwwSbVpWBYuHE6qLpCgyof+03qfNGN5yqeKVHZGoVM9KTDtM5eQ7Li66s4Bvep9ekfkBGwq2G/n4V/5Z9JbEqsjQtvTMcGhtxLlSsaiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
 t=1698596414; c=relaxed/simple;
 bh=KCANbv4D9a4LnL9lqqXHmJmnP4yzUFerG+GimpaUleo=;
 h=DKIM-Signature:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:From:To:Message-ID:X-SimpleLogin-Type:
 X-SimpleLogin-EmailLog-ID:X-SimpleLogin-Want-Signing;
 b=tf6kng/sW0OY30zeqEEJFKshByY1OhzkfkMH864IHKNGljh7NucaSY3VSzNxftaGuSY2IrtrBRapFXkUzw7E/tj9+vHQpuC22BCLxGDe++Jm2ME12X6DX5IYLw5pb1Bho09oeP3v8zNOjYUNrcDQQ271PonYggA7VGNbKqM7pzDCUsemw0HVNmqiSuOcWPeW0j3r0If2sxqWM7Tb2sSovDC0gHKNs9aJnMUCXzRmlRx/bGJ4Btv7FYUDwi2kXSAZqvzQFNxi/37oRv6WjSJlNI9OXZaPYzk/yDyf+7zo8ruQwFI5jLmQKL5MnX3IzJKEuaypqkK64GDM6z6P0LbpWQ==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=simplelogin.com;
 s=dkim; t=1698596413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KCANbv4D9a4LnL9lqqXHmJmnP4yzUFerG+GimpaUleo=;
 b=iO8Yh3FMTG5B3xIJuhntvMvlMd/prqZWJQVqJtYH2S9v7ZfaX0eTJIfixR3ZcD4BUHPcG1
 49c7xjcGX9K/QGWIp/SQAW70byqavo+A7kxThDdaEd+EAUmoj03ljPicY22SeJDnuTYiKv
 bffaB88A7xuVY8L2UPXQSFnlgepmTOg=
Date: Sun, 29 Oct 2023 16:20:04 +0000
Subject: Windows kill-switch with IP exceptions
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: blurt_overkill882@simplelogin.com
To: wireguard@lists.zx2c4.com
Message-ID: <169859641326.7.9409086915341472769.203421242@simplelogin.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 203421242
X-SimpleLogin-Want-Signing: yes
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

Howdy WireGuard team!

I was wondering if it is at all possible to enable the kill-switch on the W=
indows client with exceptions for local IP addresses. I have noticed the ki=
ll-switch will automatically enable when you specify the allowed IPs 0.0.0.=
0/0.

Unfortunately this is not ideal for my machine as I would like to allow all=
 LAN connections to bypass the VPN. One way I can achieve this is by disabl=
ing the kill-switch, which sets the allowed IPs 0.0.0.0/1 and 128.0.0.0/1. =
This does work, however some apps on Windows can still bind themselves to t=
he non VPN adapter, which completely bypasses the VPN even on these IP rang=
es.

The kill-switch feature works great at stopping apps binding to the non VPN=
 tunnel. I was hoping that it might be possible to have the kill-switch con=
tinue to do this baring all local addresses.

Surfshark have implemented this with their kill-switch feature, it would be=
 nice to be able to replicate the same with the WireGuard client.

Is this at all possible, please may you explain why or why not if you have =
the time?

Thanks for the software, and more importantly thanks for reading my query!

Regards, avid WireGuard user.

