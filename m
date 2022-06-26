Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F82CC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 26 Jun 2022 17:51:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 6dec7dc0;
	Sun, 26 Jun 2022 17:51:44 +0000 (UTC)
Received: from tampoco.espindola.nl (tampoco.espindola.nl [149.210.133.191])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 0fe832f2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Jun 2022 17:51:42 +0000 (UTC)
Received: from [192.168.68.249] (77-174-203-219.fixed.kpn.net [77.174.203.219])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: frank-deze)
 by tampoco.espindola.nl (Postfix) with ESMTPSA id 7E3933C0181;
 Sun, 26 Jun 2022 19:51:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deze.org; s=default;
 t=1656265901; bh=CsTtEvpPhGLlluoEIt3LyY9iJMa5H19T8UOHstfGJc0=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=hOAYP3ssw5RsUcAmEueE8lw/7f8kvN4LHiDZ5DPco7PT1cSU2UXHmZ0Yr+RGRH6v5
 jPeh6M8Gvuo8fvtK4kxHzQvTf+Nsl8x2QddL27IST+7u6JGKBw01YEvRlrothqWwM9
 HOuBYKy/VdTqnIiCCo+M/Q8wCgrAsPxQmdVPrn3oIq7+gxVR87PKcNVGNMxOXA447o
 9g5QXiqL5hMXRi7D1xMPwUH/c+M1T6q1U1S7bHIJ0JWVXHgEb5iaKTqj0/0g+8xYwR
 jcJF5vx1p+xPdzb4UTWjQutXf3y0SmB8jBp7Vmx52l//x9aQrYCzqvbs9sS/MoV6p8
 ApJ1wP0byf2cg==
Message-ID: <672909d9-560f-3e83-3c9b-e3d69e8e70fa@deze.org>
Date: Sun, 26 Jun 2022 19:51:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [ANNOUNCE] wireguard-freebsd snapshot v0.0.20220615 is available
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20220615141140.96557C3411C@smtp.kernel.org>
From: Frank Volf <frank@deze.org>
In-Reply-To: <20220615141140.96557C3411C@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


Hi,

I tested this snapshot on my setup for 10 days now and it works 
perfectly without any problems.

My setup is fairly simple: central VPN server (FreeBSD 13.1), two 
servers on branch sites (each behind NAT) and a mobile Android client.
VPN's are used for management type activities, so no high bandwidth or 
low latency requirements needed.
So not sure if this setup is representative enough, but I'm happy with 
how it behaves.

There is one small feature that I would like to see: My central server 
has multiple public IP addresses and sometimes Wireguard needs to 
initiate a connection to one of the branch servers. Unfortunately, there 
is no way to specify which source address to use for that. Currently it 
appears to use a random IP address from the outgoing interface (mostly 
the first IP address configured on the external interface).
I would like to see the option to specify the IP address to be used for 
outgoing connections, that would be  much more convenient when you have 
to deal with upstream firewalls.
Not sure if this is a difficult thing to implement, but I would love to 
have it.

Anyway, thanks for all the work you guys did on this great product!!!

Kind regards,

Frank


Op 15-6-2022 om 16:11 schreef Jason A. Donenfeld:
> Hi,
>
> An experimental snapshot, v0.0.20220615, of WireGuard for FreeBSD has been
> been tagged in the git repository.
>
> At this time this code is new, unvetted, possibly buggy, and should be
> considered "experimental". It might contain security issues. We gladly
> welcome your testing and bug reports, but do keep in mind that this code
> is new, so some caution should be exercised at the moment for using it
> in mission critical environments.
>
> == Changes ==
>
>   * ci: add FreeBSD 12.3 and 13.1
>   * compat: update version to handle sbcreatecontrol() changes
>
>   More fixes to the compat layer.
>
>   * wg_noise: import hmac from crypto
>   * crypto: inline blake2s convenience function
>
>   A few crypto cleanups.
>
> This snapshot contains commits from: Jason A. Donenfeld, Joseph 
> Mingrone, and
> Ed Maste.
>
> The source repository is available at the usual location:
>   git clone https://git.zx2c4.com/wireguard-freebsd
>
> This snapshot is available in compressed tarball form:
> https://git.zx2c4.com/wireguard-freebsd/snapshot/wireguard-freebsd-0.0.20220615.tar.xz
>   SHA2-256: 
> ad6c42d20a7c0ad2989e729dd41ea5a6a019426b762dfd0c6417e340935cca82
>
> Thank you,
> Jason Donenfeld
>
>
 >


