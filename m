Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 494E1C33CB2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 02:04:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68390206D5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 02:04:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ngs.ru header.i=@ngs.ru header.b="lQGbKT8r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68390206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=ngs.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 540acd2d;
	Thu, 30 Jan 2020 01:53:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 817ac5b8
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 08:50:25 +0000 (UTC)
Received: from smtpout.ngs.ru (smtpout243.gw-m1-1.ngs.ru [195.19.220.243])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4a8bfd0
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jan 2020 08:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ngs.ru; s=mail1;
 t=1580201423; bh=LKzJ/VPo/Td6b6JCNh6aPa6NHDuwZsmCrQcQnrrDH/s=;
 l=772;
 h=From:Subject:To:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=lQGbKT8rrXBo1GYTw4Y0g2pjMcqDI7qKryLcS0FLDahxboc5qMCD8x/roHBAYM1FW
 zetux9FkU1W0BRpwnjChw6zm5et6mhnsbfpMnLMTufzMOJongbC7+rLWxNkwj0yg+i
 VsVFzehD8ciZXfOnrId/9HXs2nFzql0uKUD9o6C4=
Received: from [212.77.128.130] (account smith151@ngs.ru)
 by mx61.intranet.ru with HTTP id 43707088 for wireguard@lists.zx2c4.com;
 Tue, 28 Jan 2020 15:50:23 +0700	
From: smith151@ngs.ru
Subject: Enable default route after establishing connection only
To: wireguard@lists.zx2c4.com
Date: Tue, 28 Jan 2020 15:50:23 +0700
Message-ID: <web-43707088@mx61.intranet.ru>
MIME-Version: 1.0
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 139415 [May 13 2019]
X-KLMS-AntiSpam-Version: 5.8.14.0
X-KLMS-AntiSpam-Envelope-From: smith151@ngs.ru
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Info: LuaCore: 270 270
 6c51353dd3ca3e23ee775cfa699b78fb2292d8a9, mx61.intranet.ru:7.1.1;
 mx50.intranet.ru:7.1.1; d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 127.0.0.199:7.1.2;
 ngs.ru:7.1.1, Auth:dkim=none, ApMailHostAddress: 212.77.128.130
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: not scanned, disabled by settings
X-KLMS-AntiVirus: Kaspersky Security 8.0 for Linux Mail Server,
 version 8.0.1.705, not scanned, license restriction
X-Spamd-Result: default: False [0.00 / 13.00]
 R_SPF_ALLOW(0.00)
X-Spamd-Server: localhost
X-Spamd-Scan-Time: 0.12
X-Spamd-Queue-ID: 1C91D21FBF4
X-Virus-Scanned: clamav-milter 0.98.6 at mc-filter1
X-Virus-Status: Clean
X-Mailman-Approved-At: Thu, 30 Jan 2020 02:53:14 +0100
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

I am using default route on wireguard. And sometimes 
remote server is not acceptable. The reasons may differ - 
planned maintenance of server, internet troubles, blocked 
IPs of server by country black list an so on.

In case when wireguard server is not reachable wireguard 
client always setting default route via wg0 peer. And all 
internet traffic is not available in this case. How can I 
set up wireguard to enable default route after 
establishing connection only?

I am using wireguard v.20200121 on Debian 10 buster. The 
config file of client is very simple:

```
[Interface]
Address = 1.2.3.2
PrivateKey = ClientPrivateKey=

[Peer]
PublicKey = ServerPublicKey=
Endpoint = 1.2.3.1:51820
PersistentKeepalive = 25
AllowedIPs = 0.0.0.0/0,::/0
```
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
