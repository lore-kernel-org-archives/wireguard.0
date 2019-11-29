Return-Path: <SRS0=ytco=ZV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBF5C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Nov 2019 22:33:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8325D20656
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Nov 2019 22:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8325D20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18469850;
	Fri, 29 Nov 2019 22:32:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40b10811
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Nov 2019 22:32:49 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2ad5217
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Nov 2019 22:32:49 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id EB3A31E302B;
 Fri, 29 Nov 2019 17:32:48 -0500 (EST)
Received: from [10.4.1.148] (wsip-70-184-211-81.om.om.cox.net [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id C25AF1E3005;
 Fri, 29 Nov 2019 17:32:48 -0500 (EST)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: idle traffic considerations
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <86ffb110-50f2-de38-ec25-698b0232b09b@trustiosity.com>
Date: Fri, 29 Nov 2019 16:32:48 -0600
Message-Id: <81C63072-2522-4B64-87A6-ACEAEFF6519D@lonnie.abelbeck.com>
References: <48f2826293c5cf93d123d8789b6afc15@ethergeist.de>
 <86ffb110-50f2-de38-ec25-698b0232b09b@trustiosity.com>
To: zrm <zrm@trustiosity.com>
X-Mailer: Apple Mail (2.3445.104.11)
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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



> On Nov 29, 2019, at 3:18 PM, zrm <zrm@trustiosity.com> wrote:
> 
> On 10/17/19 06:29, Knuth wrote:
>> Hey,
>> we are planning to deploy certain devices with an embedded sim cards in different countries across the globe, for maintenance we need to be able to connect to the devices with ssh.
>> Since the sim cards only provide us with a private IPv4 behind NAT (because apparently IPv6 is still hard...) we need to reverse the connection process to our control system,
>> at the moment we consider doing this with wireguard (we are aware of the "pre" release status), since we had good experiences with it on other similar setups.
>> To calculate some rough estimated costs for the mobile connection traffic volume, i'd love to know if there is a way to calculate the amount of traffic caused by an idle wireguard connection kept alive since we would be charged per MByte transferred.
>> Or do we simply have to setup a few test subjects and monitor it over a longer time, which in itself could be error prone.
>> Thanks for your time
>> Knuth
> 
> Ballpark estimate, round a keepalive packet to about a hundred bytes. You're also going to get a re-keys, call those two hundred bytes. If you have a keepalive every 30 seconds and a re-key every 120 seconds, that's around 18KB per hour per peer in each direction.

I had a similar use case as Knuth described, zrm's estimate is right on target.

Using a Netgear LB1121 as a 4G/LTE Endpoint, native IPv4-only behind NAT to a static IPv4 public server.

## 4G/LTE Endpoint
PersistentKeepalive = 25

## Static Endpoint
PersistentKeepalive = 0

When idle the WireGuard VPN consumes less than 0.5 MB/day of data.

Lonnie

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
