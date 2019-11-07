Return-Path: <SRS0=ozWx=Y7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB52AC5DF60
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Nov 2019 16:38:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B10D206DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Nov 2019 16:38:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ungleich.ch header.i=@ungleich.ch header.b="VOKrQuYM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B10D206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 222b4fc4;
	Thu, 7 Nov 2019 16:38:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5200e177
 for <wireguard@lists.zx2c4.com>; Thu, 7 Nov 2019 16:38:28 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [IPv6:2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5faf219a
 for <wireguard@lists.zx2c4.com>; Thu, 7 Nov 2019 16:38:27 +0000 (UTC)
Received: from diamond.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id B1E3A21EB7
 for <wireguard@lists.zx2c4.com>; Thu,  7 Nov 2019 17:38:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1573144705; bh=znc/B6/eSWbQccPp5NQuAt0+vLOHuvN9+DY/CU8dlxE=;
 h=From:To:Subject:Date:From;
 b=VOKrQuYMLLhZd19EsMY3wGwFcteE3qy742GKRffV0Zn+FV1AUEyYRFtkDgosqV5/C
 1bEWis2mP6KI5vOnfiwUBa0uTRjaSTIRO4lrvI4J7nEBNXO1zxKntx/BPT3/SyhYJS
 FTl+MihKGWRYblutFVSdXXo+abuu8yHS8+b4xkCVFdxfaYjBp0Wj+RZ6O5T686cxi7
 16zerC3w1nz0lulzmH1QEZOfiiVl0GpbvWuMEPZapexNavs2wUw8C0TD/GayLbjgAS
 VO3s4xdnEN5H5jgNDmP9S8HJ7+2XL3z+Eij+QL1JTT8yNrrRmVUmkdvqUTUPaFsPoP
 T6QUbE1MJOj3g==
Received: by diamond.localdomain (Postfix, from userid 1000)
 id D511013E2D1A; Thu,  7 Nov 2019 17:38:42 +0100 (CET)
User-agent: mu4e 1.3.5; emacs 26.3
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Netfilter redirect does not work with wireguard
Date: Thu, 07 Nov 2019 17:38:42 +0100
Message-ID: <87pni3ljzh.fsf@ungleich.ch>
MIME-Version: 1.0
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

I am experimenting with nft / netfilter redirects to support wireguard
packets on *any* udp port. I tried using the following configuration for
nftables:

[17:34:14] vpn-2a0ae5c1:~# cat /etc/nftables.conf
#!/usr/sbin/nft -f

flush ruleset

table ip nat {
	chain prerouting {
		type nat hook prerouting priority 0;

		# SSH works
		tcp dport != 22 redirect to 22

		# wireguard doesn't
		udp dport != 51820 redirect to 51820
	}

	chain postrouting {
		type nat hook postrouting priority 0;
	}
}

However as you can see in the comments, this does not work with
wireguard, however it does work with SSH.

I can see that wireguard is kernel space, and ssh user space, but does
that cause the netfilter part to be skipped or am I doing some silly
mistake here?

Best regards,

Nico


--
Modern, affordable, Swiss Virtual Machines. Visit www.datacenterlight.ch
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
