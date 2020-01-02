Return-Path: <SRS0=WErI=2X=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9664AC2D0DD
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Jan 2020 05:26:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F256321655
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Jan 2020 05:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F256321655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=attglobal.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a63f9bd5;
	Thu, 2 Jan 2020 05:26:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5bbd0b0b
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 05:25:57 +0000 (UTC)
Received: from p-impout001.msg.pkvw.co.charter.net
 (p-impout002aa.msg.pkvw.co.charter.net [47.43.26.133])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4563898e
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 05:25:57 +0000 (UTC)
Received: from [192.168.0.2] ([76.91.204.161]) by cmsmtp with ESMTP
 id mszci9jz7WkjHmszdiQzc7; Thu, 02 Jan 2020 05:25:57 +0000
X-Authority-Analysis: v=2.3 cv=IpRgj43g c=1 sm=1 tr=0
 a=rO8gbEbqGp3jIVlhlq3uIg==:117 a=rO8gbEbqGp3jIVlhlq3uIg==:17
 a=IkcTkHD0fZMA:10 a=xP1ufChRAAAA:8 a=Hi1OobsBpwcAyijCwHgA:9
 a=QxG4OI8PWL17y5ok:21 a=mdfGrniXiRg3uQyw:21 a=QEXdDO2ut3YA:10
 a=SuU39FtTVyGER4vBZ3Sa:22 a=pHzHmUro8NiASowvMSCR:22 a=xoEH_sTeL_Rfw54TyV31:22
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Eddie <stunnel@attglobal.net>
Subject: wg-quick: syntax error, unexpected saddr
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <b3fb12ff-969a-9037-ee6f-f8e4b6d91895@attglobal.net>
Date: Wed, 1 Jan 2020 21:25:56 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
X-CMAE-Envelope: MS4wfPK5qeIRdTcNefT5w+l8SXVO/TeiuKdL0eTYwzhp4K7Dk23cCsHlyX/ZJryJvIByghPQLHrzAl752NpVi9Uy4kkmMBcSEWxWcusOYj+LRg35z4fpoOq1
 dEACpADcfFAwWxIpM6VG9x1wfjLS3Y3EA6UMelVxmyg+ELuGmgPKDHNCQBx5ey1baMsb+5qg19+ugA==
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: stunnel@attglobal.net
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

First time running wireguard as a native client on my Slackware 14.2 
system throws this:

root@The-Tardis:~# wg-quick up wg0
[#] ip link add wg0 type wireguard
[#] wg setconf wg0 /dev/fd/63
[#] ip -4 address add 192.168.150.14/32 dev wg0
[#] ip link set mtu 1420 up dev wg0
[#] wg set wg0 fwmark 51820
[#] ip -4 route add 0.0.0.0/0 dev wg0 table 51820
[#] ip -4 rule add not fwmark 51820 table 51820
[#] ip -4 rule add table main suppress_prefixlength 0
[#] sysctl -q net.ipv4.conf.all.src_valid_mark=1
[#] nft -f /dev/fd/63
/dev/fd/63:5:76-80: Error: syntax error, unexpected saddr

Fairly simple config to connect to my VPS:

[Interface]
Address = 192.168.150.14/32
PrivateKey = <Not the key you're looking for>

[Peer]
PublicKey = <Just being overly paranoid>
Endpoint = www.xxx.yyy.zzz:51820
AllowedIPs = 0.0.0.0/0

Not sure what additional information you need collected at this point.

I'm able to connect outbound successfully using NordVPN's version of 
wireguard, but that doesn't use wg-quick, which is where the issue is.

Cheers.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
