Return-Path: <SRS0=e2pA=3E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4802C32771
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Jan 2020 18:29:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FC5424656
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Jan 2020 18:29:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="SYdziBIC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FC5424656
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6d9b696;
	Wed, 15 Jan 2020 18:29:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 083d9f04
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Jan 2020 18:29:20 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a3c17e8
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Jan 2020 18:29:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0edd586;
 Wed, 15 Jan 2020 17:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=subject:to
 :references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; s=mail; bh=/sCs12mvQLQ2
 Re8AM6ersuASfjU=; b=SYdziBICtm3R1nL1ox1VMA0l2fbO/X72QnbBd8lk3C87
 KWU9QaWZ7FvOuPRfPOI+ThQb5pPF8edwt4Z/QhsIXwt3lqbjQXhqBz1iL9mL1PVx
 XroGGjZZqIpWwQBNU+R3nawK5s+R15CTF8AgOHS8s7Rc5Phfc9LvZoN5uoO4GPJ5
 0UNGc1gKroQOlFj/5oQxXmQIeLekzhzcSXm91GZXu7O/lbP/0tl3EoImAXu9Inpc
 NRiiJgY5BYP2owaKhi4AD+JuN8Er+XMWo+QOAI3/cMzrYrkcrdDoDgN9Bv/lxppi
 S0NEeceULnQRITCINvoLNrzUEBmq6Nk4iMLvi8V/yQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 337c42ed
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Wed, 15 Jan 2020 17:29:09 +0000 (UTC)
Subject: Re: Bug report: WireGuard client not setting underlying network on
 Android Pie
To: Andrey Kupreychik <foxel@quickfox.ru>, wireguard@lists.zx2c4.com
References: <CA+hAYV=67S+3d0g+eQ9AZHok=AdvmBsd2XpOFSEcJ=aozjK9PA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <aaf2a265-f53e-f6d2-09d7-e83497578a81@zx2c4.com>
Date: Wed, 15 Jan 2020 13:29:19 -0500
MIME-Version: 1.0
In-Reply-To: <CA+hAYV=67S+3d0g+eQ9AZHok=AdvmBsd2XpOFSEcJ=aozjK9PA@mail.gmail.com>
Content-Language: en-US
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

Hi Andrey,

Thanks for the bug report.

On 1/13/20 12:00 AM, Andrey Kupreychik wrote:
> My Android phone running wireguard VPN threats it as a metered 
> connection and does not do anything it should do on Wi-Fi only
> 
> What I found is this discussion 
> https://issuetracker.google.com/issues/114309459
> I've looked thru the GitHub mirror code and found no evidance of 
> setUnderlyingNetworks called in WireGuard client code.
> 
> As seen in the issue tracker link above, it's needed in order to take 
> advantage of this 
> (https://developer.android.com/about/versions/pie/android-9.0-changes-all#network-capabilities-vpn) 
> behavior change. As described in the issue tracker link, this prevents 
> Pie devices from properly using unmetered WiFi networks.

Are you suggesting something like the below? According to the docs, the 
null value is the "default", and the others don't fit the wireguard 
model. Are you saying we should still be calling this anyway because the 
android system is expecting it?

 From 4ae0e9688e4edfdad06e6db49f414a95c5663d07 Mon Sep 17 00:00:00 2001
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 15 Jan 2020 13:25:56 -0500
Subject: [PATCH] GoBackend: set empty underlying networks

https://lists.zx2c4.com/pipermail/wireguard/2020-January/004859.html
https://issuetracker.google.com/issues/114309459
https://developer.android.com/about/versions/pie/android-9.0-changes-all#network-capabilities-vpn

Apparently we need to call this at least once.

Reported-by: Andrey Kupreychik <foxel@quickfox.ru>
---
  app/src/main/java/com/wireguard/android/backend/GoBackend.java | 1 +
  1 file changed, 1 insertion(+)

diff --git 
a/app/src/main/java/com/wireguard/android/backend/GoBackend.java 
b/app/src/main/java/com/wireguard/android/backend/GoBackend.java
index 3e8e1ec..3c4c893 100644
--- a/app/src/main/java/com/wireguard/android/backend/GoBackend.java
+++ b/app/src/main/java/com/wireguard/android/backend/GoBackend.java
@@ -224,6 +224,7 @@ public final class GoBackend implements Backend {

              currentTunnel = tunnel;

+            service.setUnderlyingNetworks(null);
              service.protect(wgGetSocketV4(currentTunnelHandle));
              service.protect(wgGetSocketV6(currentTunnelHandle));
          } else {
-- 
2.24.1


Regards,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
