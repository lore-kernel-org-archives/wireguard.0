Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58F5C10F05
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:37:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F77120830
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="PzFIeGmM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F77120830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=airmail.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ef191a0;
	Wed, 20 Mar 2019 22:36:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7dc253b
 for <wireguard@lists.zx2c4.com>; Wed, 6 Mar 2019 09:07:47 +0000 (UTC)
Received: from cock.li (mx1.cock.li [185.10.68.5])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f52193f
 for <wireguard@lists.zx2c4.com>; Wed, 6 Mar 2019 09:07:47 +0000 (UTC)
Message-ID: <3053f293b7e9a34a733c2b5b314e2d8a620682db.camel@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
 t=1551863892; bh=fkaI249dqYUe7QqV6qMQ3uxdR/AWjkidceOKD3jqGi4=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=PzFIeGmMma5pm0Hp8ZfZsElcRN+edNmFolm3bDUoQeQktoAG00GrQHkhdHgTZAQyH
 B6ucAfg1xsOz7pwrDJr7/JAjhBUp2YTrpKcORSTmiICZ5cO+XNrcTatWuykkLslPGM
 nwinDBmlw+GW5CPTipBxOWl9ZtrXpkrXZnxf/mZuD7o9uWC8ngDSdQFypV5m/Ukrv8
 F2DR9ija7iwa85Wvc3X8kwc/gXoBmsKRXCYhx/rYfwN9FU22gmTDqPjNOdWMpt5MHA
 l4aMz+4PSwpmfs41Ip7l3Hjd9dUE/CnASDI9IRy9724775tiYEx1XSwxXy/PKpAQYI
 1B8wYkevuG9hw==
Subject: Re: cant connect to wireguard when router connected to a vpn service
From: XRP <xrp@airmail.cc>
To: Arpit Gupta <g.arpit@gmail.com>, wireguard@lists.zx2c4.com
Date: Wed, 06 Mar 2019 10:18:11 +0100
In-Reply-To: <CAGCGytLuf1Lhm-oQrL+ACOJw0wMu3wcXPOS0qufRWo1w47RQ+g@mail.gmail.com>
References: <CAGCGytLuf1Lhm-oQrL+ACOJw0wMu3wcXPOS0qufRWo1w47RQ+g@mail.gmail.com>
User-Agent: Evolution 3.30.5 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:36:25 +0100
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

On Wed, 2019-03-06 at 08:40 +0000, Arpit Gupta wrote:
> On my server my conf is
> 
> [Interface]
> Address = 192.168.100.1/32
> PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o
> %i -j
> ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD
> -o %i
> -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
> ListenPort = 54930
> PrivateKey = xxxxx
> 
> [Peer]
> PublicKey = xxxx
> AllowedIPs = 192.168.100.2/32
> 
> 
> on my client my config is
> 
> [Interface]
> Address = 192.168.100.2
> PrivateKey = xxxxx
> ListenPort = 21841
> DNS = 192.168.1.63
> 
> [Peer]
> PublicKey = xxxx
> Endpoint = ddns:xxx
> AllowedIPs = 192.168.1.0/24
> 
> # This is for if you're behind a NAT and
> # want the connection to be kept alive.
> PersistentKeepalive = 25

Try changing AllowedIPs in the client config to:
AllowedIPs = 192.168.100.1/32,192.168.1.0/24

Also, if you want to masquerade the traffic to the internet you need to
add 0.0.0.0./0 to the client or change the destination IP to the server
node via a NAT rule, otherwise it's going to be rejected because the IP
packet doesn't have an AllowedIP address, I think. (The source needs to
match, so either 192.168.100.1/32 or 192.168.1.0/24). My guess is
that's why you couldn't complete the handshake.

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
