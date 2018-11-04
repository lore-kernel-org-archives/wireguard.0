Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4431C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:33:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EBEE20854
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:33:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="212+ckJZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EBEE20854
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae29afac;
	Sun, 4 Nov 2018 17:29:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ee51143
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 17:29:27 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 914926c4
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 17:29:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8002f84;
 Sun, 4 Nov 2018 17:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :cc:subject:message-id:references:mime-version:content-type
 :in-reply-to; s=mail; bh=91VvkoKbWLgyiAPw0s6+ouUaz0Y=; b=212+ckJ
 Z8Ru19mNRQzjWtU0UqnKr8CkGCHdELjwSM5RoeAroIlM0JYsKg/SAsh9PLMdNVMX
 MTifravVS/IDoqbLWHpE0nE87WpKN1aQ60j7Opfn6tBkpfKoYBIgqAY5ebWHWjHD
 FutbuWqzFc2lmEyJpD6EZOwLZ70uYden1YqAjFT8E4/jLryeFrkEv6be/dK2T8kM
 yVOPmmIOf6t3bmXPRwyG57t3YeBknb0OpHOdVmDmadCcYCgDedjoNiiBZOTSTd1I
 E6u6J7dws9J4lA/wgL376ZWY7b0W0B8nl4TXMWsq3vaMOY87j0jLXNTjdZkb2iwr
 iSLCZwaM8F2JrIw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9129ed94
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Sun, 4 Nov 2018 17:29:27 +0000 (UTC)
Date: Sun, 4 Nov 2018 18:33:33 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "mike@farmwald.com" <mike@farmwald.com>
Subject: Re: Could there be an error message on lack of entropy?
Message-ID: <20181104173332.GA9615@zx2c4.com>
References: <CAC35giupDN6M2hhj_kgpwSX4zO3OMWdC+XZzKqJCkkKJCdrwzw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAC35giupDN6M2hhj_kgpwSX4zO3OMWdC+XZzKqJCkkKJCdrwzw@mail.gmail.com>
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

On Tue, Oct 30, 2018 at 10:49:30AM -0700, mike@farmwald.com wrote:
> I've been trying to use wireguard on OpenWRT (using a Turris Omnia without
> wireless.)
> 
> The wg interface would not send packets, but there was no indication of
> why. I've been trying to debug this (intermittently) since May. Someone on
> the OpenWRT mailing list today suggested that a lack of entropy might be
> the problem. Adding "haveged " fixed the problem and the interface now
> seems to work just fine.
> 
> It would be *very* helpful if wireguard reported in the system log that it
> can't come up due to a lack of entropy.

On the receiving end, we do this:

if (skb_queue_len(&wg->incoming_handshakes) > MAX_QUEUED_INCOMING_HANDSHAKES ||
    unlikely(!rng_is_initialized())) {
        net_dbg_skb_ratelimited("%s: Dropping handshake packet from %pISpfsc\n",
                                wg->dev->name, skb);
        goto err;
}

On the sending end, the packets queue up until the first handshake
completes, per usual. Meanwhile sending the handshake initiation packet
is blocked and is just waiting for the RNG to be initialized, and then
it sends, the handshake completes, and the queued up packets are
released. Arguably that blocking behavior is not ideal, though,
especially as it means removing a peer that is waiting for entropy will
wind up blocking rtnl. I'll take a look at this and see what can be
done.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
