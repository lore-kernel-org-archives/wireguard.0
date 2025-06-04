Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBBFC5AE59
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Jun 2025 10:49:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f04e4bbe;
	Thu, 5 Jun 2025 10:49:20 +0000 (UTC)
Received: from mailout.alphasrv.net (mailout.alphasrv.net [95.217.28.6])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 70fbff9c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jun 2025 14:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphasrv.net;
 s=210728; t=1749048814;
 bh=rtNj68Fcbz1RelzMfzrua2eTuRfdi1ossdgiX/zaSJk=;
 h=Date:From:To:Subject:From;
 b=l8kRXxz5VlgoNrqspmQhd8h77ko+sIzDjhWmqe2irswTB5t0P314h82DiIY+ms0Ob
 IK4lY+iINnQTQDAtbv2QZUydwzERKeSDoT/1iQr9Qdu5qLpfzjJZWwU+Jr5qojVmY/
 FQIJSNdDPXugAAM74vBbeIiK1KuEbrApwoe53usPWY82FPakm1sLdX/oqlSfXW1y+r
 b2zC1UzflWCo8oA/POHgLklaexTWaUI0/JnvbeVJp/IbbxAfYriOpMc2UNObkbLngv
 EfosUS+s4HsNcvw1yzy4ycG0hi3BqVJe9Q7HsbPRNinMyetcnEQtFkoq5cI32ZikX2
 2orCOIq3HaBLA==
Received: from alphamobil.inter.netz (unknown
 [IPv6:2001:a61:2a5b:4200:b776:e028:59fd:2a93])
 by a10.alphasrv.net (mailout.alphasrv.net) with ESMTPSA id 57B7E3E8DC
 for <wireguard@lists.zx2c4.com>; Wed,  4 Jun 2025 16:53:34 +0200 (CEST)
Received: by alphamobil.inter.netz (Postfix, from userid 1000)
 id DBCFCB00034; Wed, 04 Jun 2025 16:53:33 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by alphamobil.inter.netz (Postfix) with ESMTP id CB674B0002E
 for <wireguard@lists.zx2c4.com>; Wed, 04 Jun 2025 16:53:33 +0200 (CEST)
Message-ID: <7e977585-5b93-4591-94f7-bf33c8923543@alphasrv.net>
Date: Wed, 4 Jun 2025 16:53:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Andre Tann <atann@alphasrv.net>
To: wireguard@lists.zx2c4.com
Subject: Delay in ipv6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 05 Jun 2025 10:49:18 +0000
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

Hi all,

I hope this is not offtopic here. If so, pls let me know a better place 
for this question.

I configured wireguard to route both IPv4 and IPv6. Both protocols work 
fine. But test-ipv6.com only gives 9/10 points because the browser does 
not use IPV6 even though it is available.

Then I investigated a bit and found this:

ping -4 dns.google => ping sequence starts immediately
ping -6 dns.google => .5 secs delay => ping sequence starts
ping -6 dns.google => ping sequence starts immediately

i.e.: On the first try, ping6 takes longer, but the second time there is 
no delay anymore.

I suspected DNS trouble, but pinging 2001:4860:4860::8844 shows the 
exact same behavior: delay the first time, no delay next time.

Yet I couldn't determine how long I need to wait until a second try 
becomes a first one again, i.e. the delay shows up again.

Any ideas where to look next?

-- 
Andre Tann

