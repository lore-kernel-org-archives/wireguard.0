Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88652C64EB1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:27:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EA0B20878
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:27:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bbmk.org header.i=@bbmk.org header.b="cfJZuFJ6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EA0B20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bbmk.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96d03c42;
	Thu, 6 Dec 2018 23:08:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c07ce827
 for <wireguard@lists.zx2c4.com>; Wed, 5 Dec 2018 18:42:17 +0000 (UTC)
Received: from mail.reinob.de (mail.reinob.de [5.189.132.144])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efeaf1be
 for <wireguard@lists.zx2c4.com>; Wed, 5 Dec 2018 18:42:17 +0000 (UTC)
Received: from mail.reinob.de (mail.reinob.de [5.189.132.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: reinob@bbmk.org)
 by mail.reinob.de (Postfix) with ESMTPSA id A00D9240007
 for <wireguard@lists.zx2c4.com>; Wed,  5 Dec 2018 19:50:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bbmk.org; s=default;
 t=1544035820; h=from:to:subject:date:message-id:in-reply-to:references;
 bh=b2FeAsdV1RSRh3FmqhCzo+uEhLeom5pdmKoYnKv89JI=;
 b=cfJZuFJ6VPADQzwdV6eFtugrIZ7bti64OqEUOBJ67wkm7kK/iD3PfgapZKCn7XhFdpgmpI
 STkuWvYWrzzadgLWLw9CUvLj4320EP5wwL+F0l4Eeu7gHM55dU+dbLNyKzhCdkiywZiNzQ
 db0xpeXjH8hlFZ4Dbp+OZkl9LUSe5bI=
Date: Wed, 5 Dec 2018 19:50:20 +0100 (CET)
From: "B. Reino" <reinob@bbmk.org>
To: wireguard@lists.zx2c4.com
Subject: Re: Android traffic not being sent over tunnel when using kernel
 backend
In-Reply-To: <1543894515.2362814.1597906872.33D7BAA3@webmail.messagingengine.com>
Message-ID: <nycvar.QRO.7.76.1812051945140.28379@ertraobtra>
References: <1543894515.2362814.1597906872.33D7BAA3@webmail.messagingengine.com>
MIME-Version: 1.0
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=reinob@bbmk.org smtp.mailfrom=reinob@bbmk.org
X-Mailman-Approved-At: Fri, 07 Dec 2018 00:08:53 +0100
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, 3 Dec 2018, BBreeziN wrote:

> I recently set up a WireGuard tunnel between my Android phone and
> Ubuntu Server at home. When using the WireGuard app without root
> granted to it, the userspace implementation works as expected. I get
> the key icon in the status bar on Android and my traffic is being
> routed through the tunnel.
> I then rooted my device, installed the ElementalX kernel (with WireGuard
> support), and upon granting the WireGuard app root access, it indicates
> the kernel module backend is being used. However, now when connecting my
> tunnel using the same settings, my traffic is not being routed through
> the tunnel. I can see this by visiting a site like whoer.net and which
> reveals my carrier WAN IP, not my IP of my home ISP.
> The tunnel seems to be active using the kernel module as I can ping the
> phone (192.168.2.2) from the server (192.168.2.1). I can also ping
> 192.168.2.1 from my phone.
> Any idea why the web traffic is being routed through the tunnel ONLY
> when I use the Go userspace backend? Thanks for the help!
> WireGuard for Android v0.0.20181001
> Kernel module backend v0.0.2018119
>
> WireGuard Ubuntu Bionic v0.0.20181119

After reading your message I decided to (finally) install ElementalX on my 
Oneplus 6. I then tested Wireguard (v0.0.20181103, from F-Droid) using the 
kernel module backend (v0.0.20180809).

It all worked perfectly, including the routing. I tested also with "whats 
my ip" (a few hits on google), and it always showed the IP of my server (a 
VPS).

The server is running debian stretch with wireguard 0.0.20181119-1 (taken 
from debian unstable).

Good luck!

--
Bernardo Reino
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
