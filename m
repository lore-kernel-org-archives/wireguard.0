Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A79C04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:19:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5A4B20989
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:19:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="gt4HLHkX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5A4B20989
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c88b3f9;
	Thu, 6 Dec 2018 23:06:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4f693dc
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Nov 2018 07:53:16 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98b83302
 for <wireguard@lists.zx2c4.com>;
 Thu, 29 Nov 2018 07:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=Content-Transfer-Encoding:MIME-Version:Date:
 Message-ID:Subject:From:To:content-disposition;
 bh=aSSJXG0FO96XCrXtdfV7wdZx+j2xiZXZ3nvoRykOmq8=; b=gt4HLHkXe2txpi/TCNxGE6Ux7f
 AZjPNerJNzs712IB5jDgE+iCiMifzm0TM6081A/XGa2asxt7tvD5jcZSOEhaNcaNOW9uL+PtfVP0z
 GgnA6I7HTbNhc6hLjjs/SyEUyWfLbt4yP0Hr3KqVpDRvabNHOLyn14HOEmnV5q1yeFzv18gxbbrJs
 DBzYZipelVch4wAuowSoleJG9E0mQsAWqaDYfKlAHm49H1XE1iHk6P80lTGfTVIESm738zfBdLulF
 CI6TbZXgEfiDk2mejID1TZEkmRLk9GyOTMsv7CzOlhbmr3f06WdbmeRYzNu/9Ia68sgsIwBlzgYUi
 KaqbMK4ODulgXUljtuKO60VY33AVmH+jhbGvMWh7vOaffk9LiRXQsdQ4Fl6uZPBog3v+76S+1ef0C
 EDyR8OBNEbaoO7VDWTkVvNtnI90+DOuAgy0Sc+PvIRBTtl5bpbrrTxZrT+sIjyq6+V/PO09xbXIR/
 GkQuM4qQ/Bg5x6rhwTNduyfSL8Z8GVArNDYLatRQFDx66YdiO7+lbbA95cj9cWjuJQmltb9lPzs0F
 uPglWnC4D+5SzAnfETAcv9W5P5mPIwE8e0x5So9j2gzFI6BmQarUJpqMWmEXdxpC3eUByMcBQLduk
 ViEvhWFSN0y17/q4Rwn3lbTSdEn6zkgPHuSSllMAk=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1gSHFL-0008Ll-7W
 with ESMTPSA (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 for wireguard@lists.zx2c4.com; Thu, 29 Nov 2018 09:00:29 +0100
To: wireguard@lists.zx2c4.com
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Subject: Both peers behind NAT?
Message-ID: <3472fb49-19a8-4dfc-7e45-7efb2a5f431a@bartschnet.de>
Date: Thu, 29 Nov 2018 09:00:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Fri, 07 Dec 2018 00:06:41 +0100
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

Hi,

I'm new to the list, so a "Hello" to all! :-)

Are there any plans to implement a DHT-based solution for IP-address/port provisioning like https://github.com/manuels/wireguard-p2p?
In case of static IP-addresses configuration is also simplified as you don't have to fiddle around with IP-addresses.
If peers announce their subnets via DHT, it would allow to set up overlay networks easily.

Regards,

Renne
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
