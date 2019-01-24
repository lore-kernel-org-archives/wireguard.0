Return-Path: <SRS0=u0A/=QA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8490C282C3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 23:59:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C374218A5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 23:59:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="RljQ5cbP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C374218A5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4938b4d;
	Thu, 24 Jan 2019 23:54:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ef12163
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 23:54:02 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 909ca15c
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 23:54:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dec2f2d7;
 Thu, 24 Jan 2019 23:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :cc:subject:message-id:references:mime-version:content-type
 :in-reply-to; s=mail; bh=qaw1CfeC5xNtpcTkHoRZ6hW/fXQ=; b=RljQ5cb
 PfKNxGSLmaFzgGKIIDnQ6YR4j3cKoYs7e4XbbTNWYhElU3Edu5ZtONRWcuEuFLt0
 hkb0sL7+/utK+iroMWUpD34CRqbYsEIAlr8HnIVxsNV7WANejPLsJtDi1DKyJeI0
 I3C/0ObvzrycPZbCV0+ZMLjacpXTuuei7RI85mka/KkSe2E/VO8hp11P5n/XVl6B
 eDjLmv47uk5Ez2fbUPkWpkj8Rz4mcXXeqnOQP+9+a/2b3Iac2k+gYD+UBZq7oo/Z
 9XCYxKtSp8tfSpAxMb5QpWU66gYFcUBO2GljXpMv9eGG+ahV8XxSrem/Yqm7b9xA
 WavH5vlcedVA8vw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5ffcaf51
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Thu, 24 Jan 2019 23:44:47 +0000 (UTC)
Date: Fri, 25 Jan 2019 00:59:15 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Derrick Lyndon Pallas <derrick@pallas.us>
Subject: Re: Long outage when changing private key
Message-ID: <20190124235913.GA21643@zx2c4.com>
References: <8ae75832-91dd-428e-9b04-a48cec019bf6@pallas.us>
 <ca5e0871-c55a-c8cd-eac1-4cf4603f7c48@pallas.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca5e0871-c55a-c8cd-eac1-4cf4603f7c48@pallas.us>
Cc: wireguard@lists.zx2c4.com
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

Hi Derrick,

The fix is probably this:

diff --git a/src/netlink.c b/src/netlink.c
index 3458c817..6b6a3f7a 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -539,6 +539,7 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
 					 peer_list) {
 			if (!wg_noise_precompute_static_static(peer))
 				wg_peer_remove(peer);
+			wg_noise_keypairs_clear(&peer->keypairs);
 		}
 		wg_cookie_checker_precompute_device_keys(&wg->cookie_checker);
 		up_write(&wg->static_identity.lock);

But the idea was originally that we wouldn't clear transport sessions
when the private key or peer preshared key changes, to allow for various
types of negotiated rotations with a grace period, in particular the
case of preshared keys for post quantum protocols. However, I can see
how the private key case causes problems for you, since changing the
public key on a peer is akin to removing and adding a different peer,
and so those transport sessions are lost in the process. In other words,
you might have a point.

Regards,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
