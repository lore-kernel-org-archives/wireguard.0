Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE75FC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 13:29:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C5F26112F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 13:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C5F26112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=massar.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9b88152;
	Wed, 22 Sep 2021 13:27:19 +0000 (UTC)
Received: from citadel.ch.unfix.org (citadel.ch.unfix.org [2001:1620:20b0::50])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9280db8c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 08:19:49 +0000 (UTC)
Received: from [IPv6:2a10:fc42:a:1042:ca2a:14ff:fe1f:2b7b] (unknown
 [IPv6:2a10:fc42:a:1042:ca2a:14ff:fe1f:2b7b])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: jeroen@massar.ch)
 by citadel.ch.unfix.org (Postfix) with ESMTPSA id A37EE22B056AC;
 Wed, 22 Sep 2021 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=massar.ch; s=DKIM2009;
 t=1632298789; bh=M+oeCM3qUXFVfhXkrXfwHC12nVPTb3tDteJJNmu41vE=;
 h=Subject:From:In-Reply-To:Date:Cc:References:To;
 b=oTo/NuU78IrZofm2FNjTxY4LCn2RaBKEl8aQvHo1M/B44nu0Fq3+PaYnXCQuI9DPO
 yiGT1fTep5gbmz9euKiDGeP4F18kDFqqYhlhUDEZYDzbliixN6pz4xsBEpx3HtapfZ
 UYJj56EWmS6LSAaFX4O2GfssAh+YLJj4XtUoL3pzh5LIIo+pto1sX+mdCbhNwD2ZFg
 yEk4cUU1JVYwRNqMFKm8NweuPnYWf1a1yUm9QNe72/1WAh7KVgIRw69bLRTmiGYMza
 laND9XLWatWSnYnuFzbE2x8lFbzjjmwDikTDdWLOyJxd6pTyBQ/W/7Stc+98BX/WBN
 /d0VOT6umnR/g==
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Subject: Re: [wireguard-apple] [iOS] Changing network fails with
 includeAllNetworks (Kill Switch)
From: Jeroen Massar <jeroen@massar.ch>
In-Reply-To: <B3A4A27C-1FBF-4098-B38F-9F87F8C115B5@gmail.com>
Date: Wed, 22 Sep 2021 10:19:46 +0200
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <20076636-54BD-46DF-A4F2-ADD0E559C5F3@massar.ch>
References: <B3A4A27C-1FBF-4098-B38F-9F87F8C115B5@gmail.com>
To: Juraj Hilje <juraj.hilje@gmail.com>
X-Mailer: Apple Mail (2.3445.9.7)
X-Mailman-Approved-At: Wed, 22 Sep 2021 13:27:16 +0000
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

That flag, is a MAJOR privacy improvement.

If "All" really includes "all" networks.

Before, "some" undefined traffic to Apple systems might be routed =
outside the VPN.

I guess this is so that Apple Private Relay is private, and other VPNs, =
eg wireguard, can't say "but you still route traffic elsewhere" like =
before, which would be an unfair advantage.


Thanks Apple Employee X who arranged getting this in! Very very much =
appreciated!

Greets,
 Jeroen


> On 20210921, at 12:55, Juraj Hilje <juraj.hilje@gmail.com> wrote:
>=20
> If NETunnelProviderProtocol is configured with includeAllNetworks=3Dtrue=
 (Kill Switch), when network change is detected the device connectivity =
goes offline instead of routing VPN tunnel traffic through a new =
network.
>=20
> Here are some logs from the moment of this event:
> 2021-09-20 12:07:26.735453: [NET] Network change detected with =
unsatisfied route and interface order [en0, utun4, pdp_ip0]
> 2021-09-20 12:07:26.736186: [NET] Connectivity offline, pausing =
backend.
> 2021-09-20 12:07:26.736732: [NET] Device closing
> 2021-09-20 12:07:26.737503: [NET] Routine: TUN reader - stopped
> 2021-09-20 12:07:26.738970: [NET] Routine: event worker - stopped
> 2021-09-20 12:07:26.739613: [NET] Routine: receive incoming v4 - =
stopped
> 2021-09-20 12:07:26.742070: [NET] Routine: receive incoming v6 - =
stopped
> 2021-09-20 12:07:26.746712: [NET] peer(eN1f=E2=80=A6Oymc) - Stopping
> 2021-09-20 12:07:26.751550: [NET] peer(eN1f=E2=80=A6Oymc) - Routine: =
sequential receiver - stopped
> 2021-09-20 12:07:26.751597: [NET] peer(eN1f=E2=80=A6Oymc) - Routine: =
sequential sender - stopped
> 2021-09-20 12:07:26.753433: [NET] Device closed
> 2021-09-20 12:07:26.754097: [NET] Routine: decryption worker 5 - =
stopped
>=20
> Tested on devices: iOS 14.8, iPadOS 15
> WireGuardKit: 79aeb0be0d0aa3f6c8bd24309aaa8dcf03216fb4
>=20
> More info on includeAllNetworks option:
> =
https://developer.apple.com/documentation/networkextension/nevpnprotocol/3=
131931-includeallnetworks
>=20
> Can someone confirm this issue or point to a possible workaround?
> Thanks!
>=20
> Juraj H.

