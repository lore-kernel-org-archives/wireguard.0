Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A4DCD4F5E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 May 2026 20:27:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id eff15a26;
	Wed, 20 May 2026 20:27:34 +0000 (UTC)
Received: from mail-24429.protonmail.ch (mail-24429.protonmail.ch
 [109.224.244.29])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id fdabad35
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 May 2026 20:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1779308851; x=1779568051;
 bh=P00KB6FT3UJdToAKg9ueEcL69DCGcY2lx/fzs6yjrZI=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=kOALnfbijjrCphzkguo1+bkzbtmcFAsVrvY2Op30yX+vn4NEP6MC935r3TEZSQ0rN
 abI+VuDdRSpPZm7IW8sMRAQypwyx4r07EOfRYzait0e8KzW0tqUac5ujnbgg436Krz
 n/zLUWmSesJm0M8hNt8gTd6LUa+3Rfl+Kl/TQ2TA0rlMJJptIqVEz0vBCr1Dph6UuD
 SPls40uHOAmNmCDm/7qT+GI92eEjF0vDfdiEYL/LHZccVJ19HiUCRABIUHAfH1C38j
 dv/AME61ABpdSjbri5v7iFLeGZCRCZAqDopucRPzkyFuSR+HH6TwrncMY5yqv6aEQI
 esu9pKp58Z2zQ==
Date: Wed, 20 May 2026 20:27:26 +0000
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Douglas Silva <doug.hs@proton.me>
Subject: Add instructions to verify android APK to wireguard.com
Message-ID: <abgBz1nmM6LD-0bMqUc6gO14UGFdLMad4y7VHlyOMSnK2vUHOeqEc6P1OzkS0lbIhCLtuSXeNxIX72wTxB8LPy-pdl-cH_G70aO7MwUFTOU=@proton.me>
Feedback-ID: 47597204:user:proton
X-Pm-Message-ID: 6892f1831557e012aaca5ef443aa86a6b41eb385
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

The instructions were posted on the mailing list [1] in 2023, but it's stil=
l not available on the site.

Assuming they're still relevant, I think it's a good idea to put them on th=
e installation page [2]. Even a link to that mailing list message would hel=
p.

[1] https://lists.zx2c4.com/pipermail/wireguard/2023-May/008057.html
[2] https://www.wireguard.com/install/#android-play-store-direct-apk-file
