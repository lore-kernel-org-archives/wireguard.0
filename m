Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8048C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:40:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8376C2183E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:40:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hatzl.org header.i=@hatzl.org header.b="DMnYmyQd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8376C2183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hatzl.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e56290ea;
	Wed, 20 Mar 2019 22:40:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbc45227
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 15:00:03 +0000 (UTC)
Received: from ns1.ourcloudserver.com (ns1.ourcloudserver.com [5.148.186.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dbf4365a
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 15:00:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ns1.ourcloudserver.com (Postfix) with ESMTPSA id E3088480B10
 for <wireguard@lists.zx2c4.com>; Thu, 21 Feb 2019 16:08:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hatzl.org; s=2018;
 t=1550761730; bh=6N4GzREXOv6Nj4iwJTHteahUhDTRnfJtDEXlcKUe+do=;
 h=From:To:Subject:Date:From;
 b=DMnYmyQd0yfJDgsHQhFV4JdfXwoEiM91Zb+I8nX74D2FuQ7GGLl/VlI8fFlnSQ65Q
 JDA9AyCQMXK4RZGBVKJJdmi7z3Ro8qt64brEBc6zxlZx8PuuUQgIF8HNJaUe4apY5x
 Sndv8NZbCmMfzetnbl/OUlHPlju3x++dvBrhNBbOHL06j3TK16g9ZQtoErtOcOcvNj
 ou9QTn/j6+41qdiwNG1FzLUaF/LuvndH8ti/CspCXJQ5D5h7RqVDXdJE+OZmYwLVlC
 XBQCpK1dkXV4KMhW8CE6B8J+MF2Vc54jLe0bEV1J9lDjLq8L6MhPUye6S/9u4f9GZl
 i0H0atIzKhm3Q==
From: Andreas Hatzl <andreas@hatzl.org>
To: wireguard@lists.zx2c4.com
Subject: VPN - excluding local IPs
Date: Thu, 21 Feb 2019 16:08:50 +0100
Message-ID: <18914224.dsVBvaN9Bx@bot>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:40:29 +0100
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

Hi,

I have successfully set up a wireguard VPN between my notebook (Manjaro behind 
NAT) and my virtual server (ubuntu 18.04). The only "issue" left is that I 
can't connect to local devices on the client while using wireguard. Is there a 
way to exclude an IP range from using wireguard? 

my client config:
[Interface]
Address = 10.x.y.z/32
PrivateKey = xyz

[Peer]
PublicKey =xyz
Endpoint = xyz:51820
AllowedIPs = 0.0.0.0/0
PersistentKeepalive = 21

I am aware that the solution for this has most likely been posted a lot of 
times but I can't find anything on the Wireguard page or Google.

It would be great if somebody could help me with this.

Thanks

Andreas


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
