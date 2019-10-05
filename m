Return-Path: <SRS0=SFG/=X6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A797FC4740A
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  5 Oct 2019 20:58:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22EDE20867
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  5 Oct 2019 20:58:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Ood9Z7QV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22EDE20867
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bca4892e;
	Sat, 5 Oct 2019 20:57:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0acd5263
 for <wireguard@lists.zx2c4.com>; Sat, 5 Oct 2019 20:57:37 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5199c61
 for <wireguard@lists.zx2c4.com>; Sat, 5 Oct 2019 20:57:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba6840fb
 for <wireguard@lists.zx2c4.com>; Sat, 5 Oct 2019 20:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=7nyFEq9l9xxj6LI8+mcdGt50cJo=; b=Ood9Z7
 QVlv3vf8Po/wWcDv9hz1228qpnLyNOx5Od3o9QkMKbfjNgo/d/vSwXJBCmvzSRGf
 NNQozoK4rCT6zLsngzjAypQDATrcKHztK9U5gDnBA2L2h4dDjQUqotllgwdlemwN
 vPRasgbcEKXddu3Hw4N4n34Vigq8j1wKQ9aRPDrpYFi8xWaZGeRhacvUBLWgw3SS
 xFB2AgZqSdzUCi5hsWZx6whIST7ChRTK+P4/RtgblilPguaCE6ZcJ8s6L0jJ3BWJ
 GtpnhE8BoDanEMsVm9Z1HVc/25L+quv/O+AM0/DsgpVwgYM1VbYW+Ac9yymPtFaY
 1nz5f4OEkAIFkIVA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 530b06be
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 5 Oct 2019 20:10:33 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id g13so8057424otp.8
 for <wireguard@lists.zx2c4.com>; Sat, 05 Oct 2019 13:57:37 -0700 (PDT)
X-Gm-Message-State: APjAAAVAKf7dJoiACAJ7R4HsCJeHSrRPIGkZguc7SHrPyxB9sUiXAWi4
 EQzpO5A7A30exwvsP+P/b9xPt6ktMB97lC6ZWWE=
X-Google-Smtp-Source: APXvYqz7cBUMw0zsmMOiTGquSyImcpbStGWl4BxvlkX4qsiEar9GXdRRqUQzZgP7FwN4UD07ubhxhojdQE+koSwoaMM=
X-Received: by 2002:a9d:65d2:: with SMTP id z18mr3586290oth.52.1570309056657; 
 Sat, 05 Oct 2019 13:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <87v9t2c45b.fsf@ungleich.ch>
In-Reply-To: <87v9t2c45b.fsf@ungleich.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 5 Oct 2019 22:57:24 +0200
X-Gmail-Original-Message-ID: <CAHmME9rHYf71vrPxVec5AVaUOgB=+1YHE+j8rg=ebDbZO0qA2g@mail.gmail.com>
Message-ID: <CAHmME9rHYf71vrPxVec5AVaUOgB=+1YHE+j8rg=ebDbZO0qA2g@mail.gmail.com>
Subject: Re: Kernel panic on 5.3.1-arch1-1-ARCH
To: Nico Schottelius <nico.schottelius@ungleich.ch>
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

This isn't WireGuard, actually. It's a line in wg-quick's bash that
says `ip rule add ... suppress_prefix ...`.

You can reproduce the kernel crash without WireGuard anywhere in the
equation with this sequence:

ip netns add crash
ip -n crash link add dummy1 type dummy
ip -n crash link set dummy1 up
ip -n crash -6 route add default dev dummy1
ip -n crash -6 rule add table main suppress_prefixlength 0
ip netns exec crash ping -f -c 1000 -W 1 1234::1 || true
ip -n crash -6 rule del table main suppress_prefixlength 0
ip -n crash link del dummy1
ip netns del crash

I submitted a patch for this upstream here:

https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git/commit/?id=ca7a03c4175366a92cee0ccc4fec0038c3266e26

It's been backported to stable already. Update your kernel to 5.3.4
and things should work again for you.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
