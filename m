Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45625606A31D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Oct 2026 20:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=ehh4WI2Y
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 352c97a3;
	Tue, 27 Oct 2026 20:15:05 +0000 (UTC)
Received: from mail-24429.protonmail.ch (mail-24429.protonmail.ch
 [109.224.244.29])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 30c4a2ef
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Oct 2026 20:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail2; t=1793132101; x=1793391301;
 bh=1iH/d3LSWmsJgdGyWxDJBHhGlt9FNLDjPBqMx+fR4Bo=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ehh4WI2YyKFYhO2+esFeIv/YlfepYHJ7YkIneqyYUysp0+WVSqgb/WwXQWcKPcXfl
 CWB7ENfs4j7Wo/McNvPiTm691x30zt2I0p20zvgzGjk3KKpJKedAwjk5z9HGG6whma
 N/V0zBqr7Yn643iTSuDJqUO5Aser1Kgu1/HeydHpz3s6fRktOt4w738W2Y+XSAQ0gC
 hHa+fYOUthu49PmHtg9yP97gvpkkSTzFhBhsGa0fqlLS3ErnDJJ2zIslYENTObc4k+
 lvHBUH59GwAEuTiVB7XurECzSR6FelzFLK57VHl+CBNNMVly76XAbFdwKJT0pYJTSH
 AH8NKFJkV/1Og==
Date: Tue, 27 Oct 2026 20:14:56 +0000
To: Loren McQuade <loren.mcquade@gmail.com>
From: John <therealgraysky@proton.me>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [PATCH 0/2] iOS 27 build and launch fixes
Message-ID: <cQ5RZK_Y0lKvlOFsZhUJ1YDYuZ7KjrFE-cPNrjXBxIZIjKxdABqdZARa6KR1jRtK-lRi30j4jnI1wmITDsP6KgCjM4eLoo76HYb6yYXK4zA=@proton.me>
In-Reply-To: <20261010160303.2853-1-loren.mcquade@gmail.com>
References: <20261010160303.2853-1-loren.mcquade@gmail.com>
Feedback-ID: 47473199:user:proton
X-Pm-Message-ID: 813af2ab9d230a3166b79f61a9fb9bf22f0585f4
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Monday, October 26th, 2026 at 3:54 PM, Loren McQuade <loren.mcquade@gmai=
l.com> wrote:

> Two small fixes for building and running the iOS app with the iOS 27 SDK.

Built this series on top of master with the iOS 27 SDK and installed it on =
an iPhone running iOS 27.0.1. Without it the app does not build, and does n=
ot launch once the include is fixed; with it the app builds, launches, show=
s the existing tunnels, connects, and On-Demand works.

Tested-by: John Audia <therealgraysky@proton.me>

