Return-Path: <SRS0=D9u6=QF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A0CC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Nov 2021 23:40:26 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63970615E3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Nov 2021 23:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63970615E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=chil.at
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2525e78b;
	Thu, 18 Nov 2021 23:40:23 +0000 (UTC)
Received: from mail.onetrix.net (eleanor.onetrix.net [86.59.13.171])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 32d348bd
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Nov 2021 23:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=chil.at;
 s=default; 
 h=Content-Transfer-Encoding:Content-Type:Subject:From:To:MIME-Version:Date:Message-ID;
 bh=FkZ8OSL1Hbw5dhufk8U/WhEFt8n4o/69dm/uoG04/fo=; 
 b=SbPIHe2l8t+RZtLKx9BZPbmisQekYopkzhLr3moE9Dl9WhFbcqYFE12BEcYAHbwW1UObs0FgL5RlrajSINNS49d3M0aP93Z6Z/ubfFOadRNhvMmWb1pih9AHLcerKP0mkQlTQvtJMVBvYxe2fUEyho83BuQy4AuBHKqoW/84c5k=;
Received: from [10.5.44.225] (port=8448 helo=mail.onetrix.net)
 by mail.onetrix.net with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <mail@chil.at>)
 id 1mnr0l-0002WP-28
 for wireguard@lists.zx2c4.com; Fri, 19 Nov 2021 00:40:12 +0100
Received: from [172.27.0.88] (10.5.44.244) by mail.onetrix.net (10.5.44.225)
 with Microsoft SMTP Server (TLS) id 14.1.438.0; Fri, 19 Nov 2021 00:40:11
 +0100
X-CTCH-RefID: str=0001.0A682F27.6196E45C.0003, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Message-ID: <d60ce240-5bb3-eed7-85a0-31d05cb0133e@chil.at>
Date: Fri, 19 Nov 2021 00:40:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Content-Language: de-AT
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Christoph Loesch <wireguard-mail@chil.at>
Subject: client uses wrong source ip for outgoing connections
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.5.44.244]
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

Hi,

I am using wireguard on about 20 EdgeRouters (based on Debian stretch).
Each router has exact same configuration (apart from router ip addresses and wireguard keys/passphrases).
Works very well on most of them but on five routers wireguard uses the wrong ip address for outgoing connections over the tunnel.
All routers use kernel 4.14.54-UBNT and wireguard-tools v1.0.20210914
Wireguard debian package is from github/WireGuard/wireguard-vyatta-ubnt

On the problematic routers the public ip address is used for the tunnel instead the private ip address.
Interestingly even in the bad example the wg tunnel is running and the server can reach the routers(=wg clients), but not the other way round.

In the following examples 172.27.0.1 is the wireguard server internal ip address.
Routers use ip addresses in the 10.0.0.0/8 range for the wg tunnel which are allowed on the server.
I already even debugged this with tcpdump where I found out it uses the wrong ip.
But looking at a simple ping you also notice the wrong ip after the word "from".

Good example:
eng196-router:~$ \ping -I wg0 -c1 172.27.0.1
ping: Warning: source address might be selected on device other than wg0.
PING 172.27.0.1 (172.27.0.1) from 10.29.85.100 wg0: 56(84) bytes of data.
64 bytes from 172.27.0.1: icmp_seq=1 ttl=64 time=6.82 ms
--- 172.27.0.1 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 6.826/6.826/6.826/0.000 ms

Bad example:
zi1-router:~$ \ping -I wg0 -c1 172.27.0.1
ping: Warning: source address might be selected on device other than wg0.
PING 172.27.0.1 (172.27.0.1) from 78.41.x.y wg0: 56(84) bytes of data.
--- 172.27.0.1 ping statistics ---
1 packets transmitted, 0 received, 100% packet loss, time 0ms

Configurations:
eng196-router:~# wg
interface: wg0
   public key: SoV2obcH0qWfCRY3gZbkLNeMa1QRcnhNDCeiI9weszA=
   private key: (hidden)
   listening port: 58205
peer: 1syRMYD1jIVFMUMm5hF/j0MzjMQmuC5mlcT1VVugIkU=
   preshared key: (hidden)
   endpoint: 86.59.x.y:1024
   allowed ips: 172.27.0.0/24, 10.5.44.0/24
   latest handshake: 53 seconds ago
   transfer: 24.57 MiB received, 26.48 MiB sent
   persistent keepalive: every 25 seconds

zi1-router:~# wg
interface: wg0
   public key: aYtVhblpR0XSsAb/dXF3zM9Hu+LxlvrR5RWFU2psF3M=
   private key: (hidden)
   listening port: 45514
peer: 1syRMYD1jIVFMUMm5hF/j0MzjMQmuC5mlcT1VVugIkU=
   preshared key: (hidden)
   endpoint: 86.59.x.y:51820
   allowed ips: 172.27.0.0/24, 10.5.44.0/24
   latest handshake: 13 seconds ago
   transfer: 1.79 MiB received, 6.26 MiB sent
   persistent keepalive: every 25 seconds

What could cause the wrong selection?
Why does that work for most routers but for some not? There must be some difference or something gets confused up by specific ip addresses I guess?
How could I debug this further to find the difference and/or cause for this problem?

Thanks for any hints and kind regards,
Christoph

