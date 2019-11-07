Return-Path: <SRS0=ozWx=Y7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBDDC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Nov 2019 21:51:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF0162084C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Nov 2019 21:51:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF0162084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae3d243d;
	Thu, 7 Nov 2019 21:51:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5700fa16
 for <wireguard@lists.zx2c4.com>; Thu, 7 Nov 2019 21:51:22 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net
 [IPv6:2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61d92b21
 for <wireguard@lists.zx2c4.com>; Thu, 7 Nov 2019 21:51:22 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.92.2)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1iSpg6-0006Hq-Lr; Thu, 07 Nov 2019 21:50:54 +0000
Date: Thu, 7 Nov 2019 21:50:54 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Subject: Re: Netfilter redirect does not work with wireguard
Message-ID: <20191107215054.GA23531@matrix-dream.net>
References: <87pni3ljzh.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87pni3ljzh.fsf@ungleich.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hello,

have you checked the source port of replies, or whether
there are any replies?

# tcpdump -nn

Tcpdump should show pre-NAT addresses on incoming packets
and AFAIK post-NAT on outgoing packets, i.e. what goes on
the wire.

You might need to apply SNAT on outgoing packets, which
might happen automatically with TCP connection tracking,
but I wouldn't really expect it on connection-less UDP.

Regards,
Ivan

On Thu, Nov 07, 2019 at 05:38:42PM +0100, Nico Schottelius wrote:
> 
> Hello,
> 
> I am experimenting with nft / netfilter redirects to support wireguard
> packets on *any* udp port. I tried using the following configuration for
> nftables:
> 
> [17:34:14] vpn-2a0ae5c1:~# cat /etc/nftables.conf
> #!/usr/sbin/nft -f
> 
> flush ruleset
> 
> table ip nat {
> 	chain prerouting {
> 		type nat hook prerouting priority 0;
> 
> 		# SSH works
> 		tcp dport != 22 redirect to 22
> 
> 		# wireguard doesn't
> 		udp dport != 51820 redirect to 51820
> 	}
> 
> 	chain postrouting {
> 		type nat hook postrouting priority 0;
> 	}
> }
> 
> However as you can see in the comments, this does not work with
> wireguard, however it does work with SSH.
> 
> I can see that wireguard is kernel space, and ssh user space, but does
> that cause the netfilter part to be skipped or am I doing some silly
> mistake here?
> 
> Best regards,
> 
> Nico
> 
> 
> --
> Modern, affordable, Swiss Virtual Machines. Visit www.datacenterlight.ch
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
