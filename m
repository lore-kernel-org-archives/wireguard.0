Return-Path: <SRS0=JaX8=BG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85ADC433E3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Jul 2020 15:47:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C35F206E7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Jul 2020 15:47:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=westernsemico.com header.i=@westernsemico.com header.b="OJjwzt89"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C35F206E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=westernsemico.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e834c555;
	Mon, 27 Jul 2020 15:23:26 +0000 (UTC)
Received: from server220-3.web-hosting.com (server220-3.web-hosting.com
 [198.54.115.164])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 936036d5
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jul 2020 08:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=westernsemico.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QleLkY2HdPRl2vP1YgW4fIApBe6MTZCJCapMO+Rq5Q4=; b=OJjwzt890EM7vZaIWi7Ox5/30R
 59vOnaY7+0GkhJV64wlbC6HZ9VaOPb1aN0kYYecNUw9tkcs4MTtBFLlsGZ8WUCWqED4ooc+/lqy7E
 YEmbu6rTXFhWwunrPohEmKIn5+4fHN2VJhuk2yMdQT9jKEsJtqz89+EcKQQVJeC7tMfqXjZaZNPGE
 erj8fzvyEHik0/ieT9ZBJsG/QxcPgplF/QAQKA0fAuqLxHDwHyeepqVaRZgmBmG6zw5sdrzYXKLTz
 6Fnw84Xr5cB9DxM4llZZoFCOIf+KR9iFSM1rCwGPfu1HJiXj7FLIQs1fhGhEddQaZvhj5PiHWq71g
 f2xBMSIw==;
Received: from [104.200.129.62] (port=42864 helo=conway)
 by server220.web-hosting.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <adam@westernsemico.com>) id 1jzFvh-002q4C-MP
 for wireguard@lists.zx2c4.com; Sat, 25 Jul 2020 04:53:28 -0400
Date: Sat, 25 Jul 2020 01:52:10 -0700
From: Adam Joseph <adam@westernsemico.com>
To: wireguard@lists.zx2c4.com
Subject: "wg ping" primitive for implementing prioritized endpoint lists?
Message-ID: <20200725015210.0d656ea8@conway>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - server220.web-hosting.com
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - westernsemico.com
X-Get-Message-Sender-Via: server220.web-hosting.com: authenticated_id:
 westwhdn/from_h
X-Authenticated-Sender: server220.web-hosting.com: adam@westernsemico.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: unmodified, already matched
X-Mailman-Approved-At: Mon, 27 Jul 2020 17:23:24 +0200
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

Hi, thanks so much for wireguard, it is awesome.

Is there any way to test if a peer is reachable at a particular ip:port
endpoint, without disturbing an existing, working exchange of packets
with that peer at some other ip:port?  Sort of like a "wireguard ping"
that avoids modifying the kernel's wg_peer.endpoint field the way "wg
set peer endpoint; /bin/ping" would.

The use case here is a mobile client like a laptop that knows how to
reach a server via either a preferred LAN IP (when the laptop is on the
LAN) or via a less-desirable public internet address for the server.
In a perfect world packets from the LAN to the server's public internet
address wouldn't be trombone-routed.  Sadly, in real life they usually
are -- for reasons beyond the control of the endpoints' administrators.

With a primitive "wg ping" it would be possible to write a userspace
tool to opportunistically upgrade a peer to a more-preferred endpoint
or fall back to a less-preferred endpoint when connectivity is lost.
More complex policies are possible too, along with improvements on
the wireguard-tools/contrib/nat-hole-punching tool.

In terms of implementation, one possibility is to allow an ICMP socket
to mark its outbound packets "hey wireguard, if you find yourself
encrypting this packet, after doing so send the resulting encrypted
packet [and MESSAGE_HANDSHAKE_INITIATION it might provoke] to $IP:$PORT
regardless of wg_peer.endpoint."  If the peer does not currently have a
valid handshake (e.g. the timer just expired) then the ping will
provoke a MESSAGE_HANDSHAKE_INITIATION, and the peer's
MESSAGE_HANDSHAKE_RESPONSE will cause
wg_socket_set_peer_endpoint_from_skb() to be called, which will update
wg_peer.endpoint.  It would be nice if there were a way to prevent
this, but I don't see any easy way to accomplish it.

  - a
