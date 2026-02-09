Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCFBEA811C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Feb 2026 13:49:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd4879ab;
	Tue, 10 Feb 2026 13:49:43 +0000 (UTC)
Received: from ojstrica.amebis.si (ojstrica.amebis.si [93.103.235.91])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6959ba67
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Feb 2026 12:02:41 +0000 (UTC)
Received: from ojstrica.amebis.doma (localhost [IPv6:::1])
 by ojstrica.amebis.si (Postfix) with ESMTP id 274E530E994B
 for <wireguard@lists.zx2c4.com>; Mon, 09 Feb 2026 13:02:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amebis.si; s=mail;
 t=1770638556;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a/jfS4V6n+nt9vmqK9eDZEYYGQjGZcnL6+JsR1vpvXA=;
 b=QuhYcCsuYqOa91fDOuR5FIfeqlA8adhXHneiLJ/sBLZk7E/wEIwJHWmyH/Ex5MQSuq0cva
 NSuosd9Mej3n7PFXnEe+Q4tNhQwVQUAYCBmcUxDUjyzPF5s7w4A2VlcwZrmO5/W+QQ6lGo
 QjLMQaMswohy8bkWJCaaQ0hLuwwqww8=
Received: from [IPV6:2a01:260:4101:1464:b1f6:258:7cda:4522]
 ([2a01:260:4101:1464:b1f6:258:7cda:4522])
 by ojstrica.amebis.doma with ESMTPSA id RQVLCdzMiWlrfjcAkOztjA
 (envelope-from <simon.rozman@amebis.si>)
 for <wireguard@lists.zx2c4.com>; Mon, 09 Feb 2026 13:02:36 +0100
Message-ID: <8f88f226-031c-4aea-a71a-bf4a143b292b@amebis.si>
Date: Mon, 9 Feb 2026 13:02:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: I want to report an issue I found with your example (send
 ring buffer get corrupted)
Content-Language: en-US, sl
To: wireguard@lists.zx2c4.com
References: <CAApnxP0OicCUvxYo41sK8AnK=bxqR+qE2BTxFmE5cJbSyOJrBQ@mail.gmail.com>
 <CAApnxP1yjyM0ZjtHXHf8WHrsc0XtwbuwMfeSYPnZm_q19R26mA@mail.gmail.com>
From: Simon Rozman <simon.rozman@amebis.si>
Organization: Amebis
In-Reply-To: <CAApnxP1yjyM0ZjtHXHf8WHrsc0XtwbuwMfeSYPnZm_q19R26mA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 10 Feb 2026 13:49:38 +0000
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

Hi, Oded!

Reviewing your issue closely, I may have found the cause. I have queued 
a proposal to fix it here: 
https://git.zx2c4.com/wintun/commit/driver/wintun.c?id=8814f660310c30a9297fc640c844c4ab6f27e5d7

However, I need to reinstall my testing environment to test and confirm 
it working.

Lep pozdrav | Best regards,
Simon Rozman
Amebis, d. o. o., Kamnik

On 4. 2. 2026 19.19, Oded Katz wrote:
> Hi,
> 
> I'm reposting this one as I didn't get any response.
> 
> We were trying to integrate `wintun` into our product and while
> testing we found an issue with upload of high UDP throughput on
> multiple sockets. initially we thought it may be related to our
> integration. but we managed to find the same issue in your example
> code.we tried to do some debugging on the example, but it seems like
> the corruption is on the driver side.
> the way to reproduce this issue- run the example
> - run the `send_udp.py` (the attached python script) on 2 different
> command terminals
>     - `send_udp.py 10.6.7.8 5201 1450`
>     - `send_udp.py 10.6.7.8 5201 1400`after some time the
> `WintunReceivePacket` returns NULL and `GetLastError()` return 13
> (`ERROR_INVALID_DATA`)
> many thanks,
> and I hope you can help us.
> btw: in the meantime, I'll try to see if I can contribute myself with a fix
> Oded

