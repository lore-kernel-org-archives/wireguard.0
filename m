Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C03CA5FF5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 12:51:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0c19513a;
	Mon, 5 Oct 2026 07:00:46 +0000 (UTC)
Received: from mail.philomathiclife.com (mail.philomathiclife.com
 [174.136.97.10])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8bad2c64
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Sep 2026 20:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=20260811;
 t=1789503817; x=1789590217; bh=iyf+tlEbwy3I9fJ81LMEsQg7Zx+vlzX9WrzwpmL
 Zi+s=; h=subject:from:to:date; d=philomathiclife.com; b=hiaroiNa0/vD8c
 dBOM6tWasfMpsVfylc3S/HoahbmrpM5pNLuI4qnlcDQMQZi0MZCXPi167HBkvUDKWDBi1j
 FcV+hnENkxWH7OkiaH9jqibNBRMGOj5SKVsHhbEP38F/6V+2y8pIZ3c8uVnvrezQF2KL+f
 Lpi4qkhR4b+Z/yICLmHakc7K7QlGUm6gNa+2bOMP0N2sC8IO8EBj7vr6dv/B2uAOR9NWWU
 TyWGlOF3dvY4bu/3odYYS73sezqnjbKGtc1R7JDQT/8LLuRv/apnEr5BHC3kt7hlCWebyb
 l3lKin9JUIy/MExy+6TxeUCftlBEYVeRMCZiXxojlap+9i/Q==
Received: from laptop.philomathiclife.com (<unknown> [2601:283:4e00:fdd4::2])
 by philomathiclife.com (OpenSMTPD) with ESMTPSA id 4f84c89f
 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Sep 2026 14:23:37 -0600 (MDT)
Message-ID: <188dc861-f452-4830-9b47-e51c15faf41d@philomathiclife.com>
Date: Tue, 15 Sep 2026 14:23:37 -0600
MIME-Version: 1.0
Content-Language: en-US
To: wireguard@lists.zx2c4.com
From: Zack Newman <zack@philomathiclife.com>
Subject: OpenBSD collaboration/peer-review request
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:59:44 +0000
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

Unlike the fiasco that occurred with FreeBSD when WireGuard was attempted
to be implemented in the kernel, Matt Dunwoodie collaborated with Jason
A. Donenfeld with the OpenBSD-kernel implementation. Code is of course
rarely static but more of a "living thing". Over the past five years,
wireguard-openbsd[^1] has substantially deviated from the actual
OpenBSD code[^2]. This suggests that repository may actually be
"Abandoned" and should not be classified as "Active".

Without continued collaboration or at least periodic passive review, this
means the actual code in the kernel may no longer conform to the
WireGuard protocol. In the best case, reliability or compatibility issues
exist; in the worst case, a reduction in the cryptographic security
potentially to the point of exploitation exists.

Over the past five years, issues allegedly from the WireGuard
implementation have required changes to the code. One the more "recent"
commits[^3] has introduced mishandling of the MTU[^4] at least when vio(4)
is used for the underlying connection and IPv6 is used to establish the
VPN tunnel.

Would Jason or anyone from the WireGuard team be willing to collaborate
again with the OpenBSD developers even if that means a passive audit? I
realize Jason and probably most of the team are far more familiar with
Linux, so it will likely require communication with at least one active
OpenBSD kernel developer.

To be clear, I'm not pointing fingers at the WireGuard team nor OpenBSD
developers. I'm merely an "innocent" bystander that is mildly concerned
about the WireGuard implementation in OpenBSD. Note I'm _not_ an OpenBSD
developer myself; otherwise I'd offer my own services. Because I'm not a
developer, I decided to not CC an OpenBSD developer.

Thanks for your time,
Zack

[^1]: https://git.zx2c4.com/wireguard-openbsd/
[^2]: https://cvsweb.openbsd.org/log/src/sys/net/if_wg.c
[^3]: https://github.com/openbsd/src/commit/c06199859734d958552a581d72b4c0f910e68d7c
[^4]: https://marc.info/?l=openbsd-bugs&m=178935440057111&w=2
