Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67DB2C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 00:15:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 202ED21527
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 00:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 202ED21527
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nrg-systems.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29693428;
	Wed, 17 Jun 2020 23:56:21 +0000 (UTC)
Received: from srv1.nrg-systems.de (srv1.nrg-systems.de [94.16.120.91])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f2d19bae
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 23:49:19 +0000 (UTC)
Received: from localhost (ip6-localhost [127.0.0.1])
 by srv1.nrg-systems.de (Postfix) with ESMTP id 6E5651A10D2
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 10:50:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv1.nrg-systems.de
Received: from srv1.nrg-systems.de ([127.0.0.1])
 by localhost (srv1.nrg-systems.de [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id FUk1JVKarjBI for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 10:50:03 +0200 (CEST)
Received: from anonymized.ipv4.by.mail.nrg-systems.de (localhost [127.0.0.1])
 (Authenticated sender: hidden)
 by srv1.nrg-systems.de (Postfix) with ESMTPSA id 72D071A1086
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 10:50:03 +0200 (CEST)
Date: Wed, 17 Jun 2020 10:30:01 +0200
To: wireguard@lists.zx2c4.com
From: Robert Federle <wg@nrg-systems.de>
Subject: Wireguard blocks Canon document scanner on macOS Mojave
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Message-Id: <20200617085004.6E5651A10D2@srv1.nrg-systems.de>
X-Mailman-Approved-At: Thu, 18 Jun 2020 01:56:13 +0200
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

We recently changed the VPN on a Mac computer running the latest 
10.14.6 macOS Mojave from OpenVPN to WireGuard and now we have to 
deal with a weird problem. We use a Canon MB5350 multifunction 
printer with integrated scanner unit in our office that is connected 
via Ethernet to our local network.

After the switch to WireGuard, we still can print but we cannot scan 
documents anymore, neither when initiated from the scanner 
application on the computer nor directly with the scan button on the 
Canon device. When the scan process is started, the Canon LJ Scan 
Utility2 on the Mac starts up and searches for a network scanner, but 
fails to succeed. It then shows an error message after a while saying 
besides several other options, the reason for the failure might be a 
blocked network connection. This is kind of confirmed by the console 
application on the Mac:

[00000494]  Processing: Bonjour Devices:(1) && Local Devices:(1)
[00000597]  (connectConnection) New Connection For Canon MB5300 series
[00001257]  Request Close Session On: Canon MB5300 series
[00000664]  Canon MB5300 series - Scanner Close Session (ICACommand)
[00000431]  Fatal - Command received was never executed
[00000494]  Processing: Bonjour Devices:(1) && Local Devices:(1)
[00000319]  Canon MB5300 series - Scanner Close Session (propertyUpdate)

As soon as we deactivate the VPN connection, the scanner starts working again.

There's no other firewall active nor any other software that could 
interfere with this connection. It never was an issue with OpenVPN 
and printing works fine with the active WireGuard VPN connection. The 
local network access to the printer and other local computers is 
enabled with the "Exclude private IPs" option set. Here's the client 
configuration:

[Interface]
PrivateKey = <PrivateKey>
Address = 10.0.0.2/16, fc00::2/96
DNS = 10.0.0.1, fc00::1

[Peer]
PublicKey = <PublicKey>
AllowedIPs = ::/0, 0.0.0.0/5, 8.0.0.0/7, 11.0.0.0/8, 12.0.0.0/6, 
16.0.0.0/4, 32.0.0.0/3, 64.0.0.0/2, 128.0.0.0/3, 160.0.0.0/5, 
168.0.0.0/6, 172.0.0.0/12, 172.32.0.0/11, 172.64.0.0/10, 
172.128.0.0/9, 173.0.0.0/8, 174.0.0.0/7, 176.0.0.0/4, 192.0.0.0/9, 
192.128.0.0/11, 192.160.0.0/13, 192.169.0.0/16, 192.170.0.0/15, 
192.172.0.0/14, 192.176.0.0/12, 192.192.0.0/10, 193.0.0.0/8, 
194.0.0.0/7, 196.0.0.0/6, 200.0.0.0/5, 208.0.0.0/4, 10.0.0.2/32, fc00::1/128
Endpoint = <Global IP Address>:<Port>

According to wireguard.com, the latest WireGuard version on the App 
Store is 0.0.20200127-17, but the version we are using on Mojave is 
0.0.20191105 (16) with Go backend version 0.0.20191013. The App Store 
does not offer us an update to the newest version. Is that one for 
Catalina (10.15) only? The Canon software is up-to-date.

So, in my conclusion, WireGuard somehow blocks the incoming network 
connection from the Canon device while the VPN connection is active, 
but not competely as the scanner application on the Mac starts when I 
hit the scan button and printing over network is always possible.

Has anyone an idea why WireGuard blocks some local network traffic 
and how to fix this?

Robert Federle

