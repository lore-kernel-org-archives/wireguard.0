Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947FFC2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 17:14:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5842e0c6;
	Tue, 20 May 2025 19:50:14 +0000 (UTC)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 68e32e69
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 Jan 2025 17:11:35 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2efb17478adso3782599a91.1
 for <wireguard@lists.zx2c4.com>; Fri, 31 Jan 2025 09:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riobard.com; s=google; t=1738343494; x=1738948294; darn=lists.zx2c4.com;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aze/MvLPTqY8f341cJptixyAb6S4eni7KpTpIROAAqA=;
 b=nVlkhx4f7bHviTc2mB2+9m5yngzO5nFv+ZyU8zqdPW8c5o9DYdZeMUIItxcbtUX+OQ
 Gw8TFw5X3nCqgPV6K1hDliV8hNTTYozDJkoDD/wnDAx61+YUxVv100ZE1rEVF2ZsvKHj
 8PkXLdEo6837o3mtoZWn+m7Lqq3/L0ltIe3ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738343494; x=1738948294;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aze/MvLPTqY8f341cJptixyAb6S4eni7KpTpIROAAqA=;
 b=pZfLZ32SbPEZPYgfauKDiljiy+TQjeuzD6qlpMX8CgdAZT8iy3jnznjqVnwhH4wqlc
 SNvLk0qNUpseUSQZdJr1kiT9x9tYKS4NVeuv2zJaYUlVMZt9R8hCGdT0C9tcihH6f/PR
 252LDXcpiq9DPInFmeMKkQrzt0SkvTiC6eBfx1oiWYFThBs8c2EvSayMX6/vjbUw/3Fs
 W2jJ/9BDahMoGlDs72bV/7pMk4mB4WAxRS8SH7Yr6Ybhep5nj8JjzB5I6YCUoGM7k1a/
 gkTVWMzIAjKUnsg0yJLPazn0v3GoRyMpm/8XHmpXZhEul+jYUmn7aR6hnyg5Z726M4Zt
 I22g==
X-Gm-Message-State: AOJu0YxnHPfYGu8XF3UYFXbj9pWqs2Y2sPn4z+MeLZXqkhGV2kdr7E9w
 zVQucXE6UbUcn9ArMcJ/631IQymCzrtGZ79SyQdvG1BmT2yT8uCoBlc75doHTdOHlnm1NAzGaUK
 Ww1tgD3BN3iZsQPhfklKwzYSHyMFVKkj4Xu1PkWiJMx2tbqEgIZA=
X-Gm-Gg: ASbGncvbcyJHTwQowmKF0YPzXUTtgR5Ivr28B4tBk3V+zFmDM/9EEO2NxKVWHJQXjLI
 laEybd3dlv/TBmms0umWypHLEO1xIHxWGg88fIBwUm4X1IXy+lxDzO6Y/n+BaoCBugF5IJTTF/G
 hsk0eRBiT7ZeXO
X-Google-Smtp-Source: AGHT+IHim3Oo3GlWJJYUa1Xq0/5jwD58/yklbqb3PZtHUrVwuKjG79aYZvJxU9iAbkT33CX9Awm4eRiN7OJ2z2othUs=
X-Received: by 2002:a17:90b:2707:b0:2ee:d63f:d71 with SMTP id
 98e67ed59e1d1-2f83abf3126mr19875711a91.14.1738343493441; Fri, 31 Jan 2025
 09:11:33 -0800 (PST)
MIME-Version: 1.0
From: Rio Z <me@riobard.com>
Date: Sat, 1 Feb 2025 01:11:22 +0800
X-Gm-Features: AWEUYZkAy8sxJQi3cWwjmeNCKmG-ptrYVPmvnOnxFLgwB7KoiHvcYJwQcvGV7RE
Message-ID: <CAJxHB+3ztP1Pqk5K_L2+A61KmQMuMPAOHSK56_NusXc1BDYqNQ@mail.gmail.com>
Subject: Avoid deprecated IPv6 temporary addresses
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 20 May 2025 19:45:56 +0000
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

Background: IPv6 Privacy Extensions (RFC 4941)-enabled host creates a
temporary address that is preferred for a short period of time
(usually 1 day), after which it becomes deprecated and a new temporary
address is generated. RFC 4941 =C2=A73.2 states that "deprecated address
can continue to be used for already established connections, but are
not used to initiate new connections."

RFC 4941 =C2=A76 discusses the problem of tracking deprecated addresses to
be removed. In particular, TCP connections can be easily tracked. But
for UDP-based applications like WireGuard, it's not straightforward as
it is usually connectionless.

Problem: Currently WireGuard keeps using the same temporary address to
send UDP packets to an existing peer even after the address becomes
deprecated. It should use the preferred (i.e. non-deprecated)
temporary address as soon as possible to satisfy the requirement of
privacy and also to make the deprecated addresses eligible to be
removed.
