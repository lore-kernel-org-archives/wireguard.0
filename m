Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C390C54F30
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 May 2025 23:58:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1315f42d;
	Sun, 25 May 2025 23:58:56 +0000 (UTC)
Received: from sharkgirl.ing (sharkgirl.ing [2a01:4f8:c012:afee::])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 22b4b177
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 May 2025 22:45:17 +0000 (UTC)
Received: from sharkgirl.ing by sharkgirl.ing ([49.12.9.109]) via tcp with
 ESMTPSA id PKrZTTnv5rc08p5LU8KPtQ (TLS1.3 TLS_AES_128_GCM_SHA256)
 25 May 2025 22:45:16 +0000
DKIM-Signature: v=1; d=sharkgirl.ing; s=2025a; i=claire@sharkgirl.ing;
 a=ed25519-sha256; t=1748213116; x=1748472316; h=From:To:Cc:Bcc:Reply-To:
 References:In-Reply-To:Subject:Date:Message-Id:Content-Type:From:To:Cc:
 References:In-Reply-To:Subject:Date:Message-Id:Content-Type;
 bh=e6tsE7L4BVk92Lx9P9azGXVN0a8vr/RUvr6T9rsju6s=; b=D4cIslR0oLyBKj4bLIkk8t8s
 PBJr6ungBYQYUy6Q/Xp0lW8uTl6KzxXHvpGrJMEjCkDFd4B1rwtpQ1EoEKDxBA==
DKIM-Signature: v=1; d=sharkgirl.ing; s=2025b; i=claire@sharkgirl.ing;
 a=rsa-sha256; t=1748213116; x=1748472316; h=From:To:Cc:Bcc:Reply-To:
 References:In-Reply-To:Subject:Date:Message-Id:Content-Type:From:To:Cc:
 References:In-Reply-To:Subject:Date:Message-Id:Content-Type;
 bh=e6tsE7L4BVk92Lx9P9azGXVN0a8vr/RUvr6T9rsju6s=; b=uW9HSO20QOlgCjHfCeeOS8fw
 aoCAwIFvpmkx1gW+gH9Q/V7FgiysL3kAC09n3mRAlbOR+LFG9sb6k0hzsax1hJX2ppA5KGRLn5s
 bA+DNL6VsZ2FPRlwDzKfnjJbcZZ+7IyRnGtDjMsHH+aLVe1qG7pjF4lTVGteeT2zJm8/XwG9GDM
 mEHBGCfkEttVuYxo6HZFBiJ4a9I06Ye16KVL37eHY9tRycwunYRoYAAXIFyOcSOB5IARXSKO1VD
 kXmi+oIZU+LCmrM3+RSXnucbuAc2k6pQTs58gpel74QfEgvNA8vblRE2+dW1LHq5WTNkgj+NY7h
 kIlEPSVolMnTOupvmQ==
Authentication-Results: sharkgirl.ing;
 auth=pass smtp.mailfrom=claire@sharkgirl.ing
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Mon, 26 May 2025 08:45:12 +1000
Message-Id: <DA5LTSNK3G6X.3KKK3AAQ328MJ@sharkgirl.ing>
From: "Claire" <claire@sharkgirl.ing>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, "Claire Elaina"
 <git@claire.sharkgirl.ing>
Cc: <wireguard@lists.zx2c4.com>, <adam.irr@outlook.com>
Subject: Re: [PATCH wireguard-tools] wg-quick: android: add support for
 {Pre, Post}{Up, Down} hooks
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250525080457.998659-1-git@claire.sharkgirl.ing>
 <aDMQ6eE_aIUTV4dB@zx2c4.com>
In-Reply-To: <aDMQ6eE_aIUTV4dB@zx2c4.com>
X-Mailman-Approved-At: Sun, 25 May 2025 23:58:55 +0000
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

> Wondering, what commands do you want to run?

PostUp =3D wg set CelesteWAN fwmark 0

X problem:
I have a Raspberry Pi at home, and I want to have an encrypted link=20
between it and client devices. When I'm at home (i.e. connected to=20
the Pi's LAN), I want the clients to connect directly to the Pi with=20
its LAN IP address. When I'm away from home, I want them to connect=20
through a remote server that has access to the Pi.

Y problem:
I cannot do port forwarding on my home internet connection because of=20
CGNAT (hence, I cannot have the clients use the Pi's public IP=20
address). My cursed idea is to nest Wireguard over Wireguard when not=20
on LAN, so the connection would be "Phone -> Server -> Pi". This works=20
fine on my laptop, but unfortunately not on my phone (pings to the Pi=20
result in no response).

However, when I manually run `wg set CelesteWAN fwmark 0` after the=20
tunnel is already set up, the connection works. I have made a patch to=20
allow setting FwMark in the config, but it doesn't work when testing.=20
Perhaps the `iptables -m mark ...` rules are interfering. I want to=20
try only setting the `fwmark` for the interface, but I feel like it's=20
too niche to upstream, so I wanted to add generic command execution.

If there's a less cursed way to make Wireguard over Wireguard work, or=20
even not having to do WoW, I'd appreciate it.

Sincerely,
Claire Elaina
