Return-Path: <SRS0=nQDx=PZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4028C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Jan 2019 11:54:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2B5B20657
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Jan 2019 11:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2B5B20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5654294e;
	Thu, 17 Jan 2019 11:50:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9af2077
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Jan 2019 11:50:13 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net
 [IPv6:2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66bc4a3a
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Jan 2019 11:50:13 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.91)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1gk6Fl-0008FO-CX; Thu, 17 Jan 2019 11:54:33 +0000
Date: Thu, 17 Jan 2019 11:54:33 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: WireGuard roaming behind a load balancer
Message-ID: <20190117115433.GA31370@matrix-dream.net>
References: <CABbM=Lk6WQGctp7Z3YBYBcq9CKwRn-KWC-e8DeHxvYF+Cda8Og@mail.gmail.com>
 <20190117002100.GA24923@matrix-dream.net>
 <d66b2b95-ee36-ed16-b8fa-94edfe092478@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d66b2b95-ee36-ed16-b8fa-94edfe092478@sholland.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Wed, Jan 16, 2019 at 06:40:05PM -0600, Samuel Holland wrote:
> H can immediately send handshakes to all peers when it is brought up (and will
> do so today if they have persistent keepalives set). But you need more than HA
> being able to initiate traffic to B. B could have roamed to a new IP while it
> was communicating with A. Then A would know about the new IP (because it
> received an authenticated packet from there), but H would not.
> 
If B can roam like that, I wouldn't really say HA can initiate traffic.
I was thinking more of big site to smaller site high availability VPNs
with static IPs and one side seamless failover capability. Not the usual
case, just if you rally wanted to.

Yes, you should probabaly use multiple peers/tunnels and/or different
failover protocols if you can't take the 2min downtime.

Maybe it would be useful, if wireguard could reinitiate a handshake
if it hasn't received packets in a configurable amount of time?
Currently it can only be set to periodically send packets, which doesn't
help if only one side can initate and the other loses state, so it will
wait till the generic timeout.

> Sharing ephemeral keys would avoid the need for a new handshake at failover, but
> that is very little benefit, since handshakes happen every couple of minutes
> anyway. More importantly, sharing keys comes with the security risk of sending
> your most sensitive data over the network. Anyone with those keys can decrypt
> VPN traffic in real time.

If the hosts are trusted to decrypt the traffic anyway, it shouldn't
be that big a deal, if done right. But yes, beware, it can can create
serious security issues.

Ivan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
