Return-Path: <SRS0=u0A/=QA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FACC282C5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 04:00:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16FDE2184C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 04:00:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="iGHHBfjP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16FDE2184C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e17af71;
	Thu, 24 Jan 2019 03:54:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26c114ae
 for <wireguard@lists.zx2c4.com>;
 Sun, 20 Jan 2019 21:33:34 +0000 (UTC)
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a3ba290
 for <wireguard@lists.zx2c4.com>;
 Sun, 20 Jan 2019 21:33:34 +0000 (UTC)
Date: Sun, 20 Jan 2019 21:38:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1548020293;
 bh=UulnDaqC1cghSwO3NQ5Ny5N6BmbcG7wiB7TjUBc6zJ0=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=iGHHBfjP1RRwKHNMLpGwHnvCIy8m75IpYjR6/APfe51a8pw8VF8e1ATNaLK24K2SW
 brFvTAsgJU+a1wJ0Sy/Nw7NRa0QTYh7QbGbTqfFebXHqb/8AGLaeJm/a8xCHtlqT51
 fDHsW2WpyFZ9r7T8SR9RgDhzJUwgpji/V916bkZY=
To: wireguard@lists.zx2c4.com
From: Allen Walker <eawalker@protonmail.com>
Subject: Using OPENVPN Client (UDP port 1194) on top of wireguard - packets
 corrupt
Message-ID: <c_FUpjUVAFaFWrfz97DeqRpOcM3uLdpa3ylizfNa3ceIzcB5qpDmKvKXb4VD7jfPsTUt17ji91aVxBqHXDdu0IBC4Y1xCZZXMPCyrj6GneM=@protonmail.com>
Feedback-ID: ViZvbooCqCMmn5p3fVDdXMuvSyRK9Uu31c7gZUWiC-jDKoTLPQ7jpyhEigX8WS0zAQRK3OAx6LqJiT8sdGf6VQ==:Ext:ProtonMail
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 24 Jan 2019 04:54:37 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Allen Walker <eawalker@protonmail.com>
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

My router is set to route everything thru my wireguard vpn. My windows 
machine (a lan client) can run openvpn client but there are issues as 
when I copy large files, specifically mp4s via scp or ftp, the files are 
inevitably corrupted. My guess is that the clients OPENVPN UDP packets 
are getting invariably corrupted when going thru the router and 
wireguard (my router routes are configured via wg-quick). Any ideas on 
how to prevent such packet corruption from the clients openvpn connection?

Thanks


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
