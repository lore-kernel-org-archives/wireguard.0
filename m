Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F3AC43215
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:45:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 834BA20678
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:45:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ethergeist.de header.i=@ethergeist.de header.b="lcHMOZfH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 834BA20678
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=ethergeist.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dde289a2;
	Wed, 27 Nov 2019 09:45:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5da7a31
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Oct 2019 10:29:40 +0000 (UTC)
Received: from mother.ethergeist.de (mother.ethergeist.de [176.9.28.164])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28c7696b
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Oct 2019 10:29:40 +0000 (UTC)
Received: from mail.ethergeist.de (unknown [172.26.0.11])
 by mother.ethergeist.de (Postfix) with ESMTPSA id 7867741E077B
 for <wireguard@lists.zx2c4.com>; Thu, 17 Oct 2019 12:29:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ethergeist.de;
 s=20181021; t=1571308179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s2J8agyu8xjS0U+QqXAcctofnvUtAEpbjoXxhKJ0xpM=;
 b=lcHMOZfHfXOijxiyQb+yUU/+OsQlSbTzxs1Ixquah/8QclpU4k9z93jbNFwJgvhRm30nXa
 //UPGaAcqv33+ZFnM9luM+FBB/P0fyBh8hh0qD7LMnjlpkWq48KYhAwqV9qc5OoBDUMWSn
 3uq3i7sWBX6gP0DmjlDmqQmKv8UNkPA=
MIME-Version: 1.0
Date: Thu, 17 Oct 2019 12:29:39 +0200
From: Knuth <knuth@ethergeist.de>
To: wireguard@lists.zx2c4.com
Subject: idle traffic considerations
Message-ID: <48f2826293c5cf93d123d8789b6afc15@ethergeist.de>
X-Sender: knuth@ethergeist.de
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:45:52 +0100
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

Hey,

we are planning to deploy certain devices with an embedded sim cards in 
different countries across the globe, for maintenance we need to be able 
to connect to the devices with ssh.

Since the sim cards only provide us with a private IPv4 behind NAT 
(because apparently IPv6 is still hard...) we need to reverse the 
connection process to our control system,
at the moment we consider doing this with wireguard (we are aware of the 
"pre" release status), since we had good experiences with it on other 
similar setups.

To calculate some rough estimated costs for the mobile connection 
traffic volume, i'd love to know if there is a way to calculate the 
amount of traffic caused by an idle wireguard connection kept alive 
since we would be charged per MByte transferred.
Or do we simply have to setup a few test subjects and monitor it over a 
longer time, which in itself could be error prone.


Thanks for your time
Knuth

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
