Return-Path: <SRS0=/nf9=RE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70801C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:05:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC8C82085A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:05:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mx.trustiosity.com header.i=@mx.trustiosity.com header.b="1ScUO8/w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC8C82085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=trustiosity.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b2cc628;
	Fri, 1 Mar 2019 09:55:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56cab866
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 19:02:52 +0000 (UTC)
Received: from mx.trustiosity.com (mx.trustiosity.com [54.186.28.113])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3de4821
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 19:02:52 +0000 (UTC)
Received: from [192.168.212.105] (csm [192.168.212.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 (Authenticated sender: zrm@trustiosity.com)
 by mx.trustiosity.com (Postfix) with ESMTPSA id 67DA142349E
 for <wireguard@lists.zx2c4.com>; Thu, 28 Feb 2019 14:12:32 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
 s=mx; t=1551381153; bh=SIlY1BZ1vpm89hZF2cSMsrfLMiTLKbmbcXFAWjq3LnQ=;
 h=From:Subject:To:Date:From;
 b=1ScUO8/wqQLsgLXaXY9LnGTORg1sT5KSqjmasxL9t1q+yYhqLnR6qDSnna6+KHgUV
 vOErgbIn4MohooPARCkJajU3NjHPyyUDlzaXeGCDWsB0Lwhlw1sIU6I04RqPG3zsk6
 GrVJsrYwqRZ4v9cJFmU03KrMQkFOFFHc1zbvlxV0=
From: zrm <zrm@trustiosity.com>
Subject: WireGuard and distributed hashtables
To: wireguard@lists.zx2c4.com
Message-ID: <27136dc1-0cbb-87ad-50b6-35879e581add@trustiosity.com>
Date: Thu, 28 Feb 2019 14:12:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Fri, 01 Mar 2019 10:55:14 +0100
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

Distributed hashtables use overlay routing networks that typically have 
between dozens and thousands of peers per node. Suppose it's 480 peers. 
Then a node might forward a message between two peers once a minute or 
so (using of 2/480), but the mean time between use of a given peer link 
could be an hour or more.

Now consider the WireGuard rekey-after time if DHT peer links are via 
WireGuard. If keepalives are used so that an active key is always 
available then a 120 second rekey interval with 480 peers has you doing 
four rekeys per second despite mostly-idle peers. We'd have to measure 
in rekeys per message rather than messages per rekey and have a lot of 
idle chatter.

But not having active keys would _triple_ the DHT request latency. 
Instead of a message from A -> B -> C, you get a handshake initiation 
from A -> B, handshake response from B -> A, and finally the message 
from A -> B, which then causes B to need a handshake with C.

The rekey time is fixed by the protocol.

If I was going to suggest a protocol change, what might help is to have 
longer and shorter rekey-after/reject-after times and the long timeout 
starts at handshake whereas the short timeout starts at the first 
non-keepalive transport data message. Then a peer purposely kept active 
with keepalives without any real traffic wouldn't have to be rekeyed so 
often.

The question is, can anyone see a good solution to this that doesn't 
involve a protocol modification?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
