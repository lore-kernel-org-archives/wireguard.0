Return-Path: <SRS0=xHST=JO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BABC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 17 Apr 2021 00:10:18 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19B84610A6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 17 Apr 2021 00:10:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19B84610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=poisk.co.ua
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7bec2ac9;
	Sat, 17 Apr 2021 00:10:14 +0000 (UTC)
Received: from srv.itcontrol.com.ua (srv.itcontrol.com.ua [194.79.11.91])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fc5925e2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Apr 2021 07:49:42 +0000 (UTC)
Received: from srv.itcontrol.com.ua (localhost [127.0.0.1])
 by srv.itcontrol.com.ua (Postfix) with ESMTP id 4FM7dx5Csxz3FWB
 for <wireguard@lists.zx2c4.com>; Fri, 16 Apr 2021 10:49:41 +0300 (EEST)
Authentication-Results: srv.itcontrol.com.ua (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=itcontrol.com.ua
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=itcontrol.com.ua;
 h=content-language:content-transfer-encoding:content-type
 :content-type:mime-version:user-agent:date:date:message-id
 :organization:subject:subject:from:from:to; s=dkim; t=
 1618559381; x=1621151382; bh=Ne3klBRt0biZ0HKyNYRt6j7dNuCNeE5MHcB
 /LaATl+M=; b=uREZRlAQ/5ohicYAG0nq9xgTSkKPL8f079HXQW8OC7vgpLYyJLT
 L4HQE3/rzcWnD+WWeyWQAQBgpSRlIeG+yypeWE+hNJ4s5I5/If2LMYpDxt+N07/V
 vIA9/1Dzn53Ndbd6O+/g9gUFYznLhJiVu7XkPhzyph/57xX4+HrCq4IQ=
X-Virus-Scanned: Debian amavisd-new at 
Received: from srv.itcontrol.com.ua ([127.0.0.1])
 by srv.itcontrol.com.ua (srv.itcontrol.com.ua [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id cRc7Uk92h1xO for <wireguard@lists.zx2c4.com>;
 Fri, 16 Apr 2021 10:49:41 +0300 (EEST)
Received: from [10.3.3.58] (backup.sed.poisk [194.79.11.90])
 by srv.itcontrol.com.ua (Postfix) with ESMTPSA id 4FM7dx2m37z3FW7
 for <wireguard@lists.zx2c4.com>; Fri, 16 Apr 2021 10:49:41 +0300 (EEST)
To: wireguard@lists.zx2c4.com
From: =?UTF-8?B?0KDQvtC80LDQvSDQodGC0YDQvtCz0LDQvdC+0LI=?= <rostma@poisk.co.ua>
Subject: Wireguard speed
Organization: =?UTF-8?B?0KfQnyDQndCf0KQgItCf0L7QuNGB0Loi?=
Message-ID: <0d460501-14a1-370f-554e-f6d19bf55329@poisk.co.ua>
Date: Fri, 16 Apr 2021 10:49:40 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: ru
X-Mailman-Approved-At: Sat, 17 Apr 2021 00:10:13 +0000
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

Help with speed in the wireguard vpn.
There are 2 routers linksys with openwrt 19.07.7. And the wireguard 
tunnel between them.
If the link between the Wan of both routers is 1 gigabit/s, then the 
speed inside the tunnel is 300-370 Mb/s, which I think is good. I 
understand that these are simple routers, not servers.
This is done for the test.
In real life, the speed between the feasts will be limited to 100 Mb/s.
I decided to do a test and lowered the speed on the switch ports 
(routers connected through a gigabit switch) to 100 Mb/s. After that, 
the speed between routers through wg is 30-40 Mb/s. Processors on 
routers are loaded at 25-25%. Once I am on a channel in 100 Mb/s. 
received speeds between routers 85-90 Mb/s. So such speeds are possible 
on the wireguard.

After that, something went wrong with the electricity and the routers 
were rebooted. I didn't have time to save the settings.

 From memory, I set everything up again, but now I can't achieve high 
speeds...
I measure iperf3 installed on the routers themselves.

How can I get ~ 80-90 Mb/s again via 100 Mb/s channel?
I will be grateful for any help in setting the speed wireguard

p.s Forgive my English. I do not know him well and use a translator
