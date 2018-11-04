Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FC9C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 13:46:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C09712082E
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 13:46:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2qFuN+B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C09712082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4d567f17;
	Sun, 4 Nov 2018 13:42:17 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf18952e
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 13:42:14 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3fcf5c1b
 for <wireguard@lists.zx2c4.com>; Sun, 4 Nov 2018 13:42:14 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id v24-v6so5768257wmh.3
 for <wireguard@lists.zx2c4.com>; Sun, 04 Nov 2018 05:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K9V/oVrKwmVrY89Zo9gT+XGKBB3lJgHF6gPMToQCwjU=;
 b=g2qFuN+BzwE4FG0Jc1Dd3EZ79ic8p7f/C48WB8e0DuxqOVyLyYeQ1ZebyL5cs/OTGE
 fNm4ojxtqA56OvjTHo392yx98bHYBH7G1PMZjvG4RQUzslaQSlps72hp0EdUF5MJG1FB
 KXSeGmwYgqDx0H4898zhjaIKUcz/2T9RLYaNecGiMJNRAWZdO7vU/PSRk7VrQrQL9M99
 DLGiIQT28/6A2T9tGH/4jqSEXqz4OMyA2E61Dd4C7kmCFpHQ1Ql+Q8Y7zfkRgdG+Mk61
 ihEx5Tl0G+wzU0GmKncHsoKwhMV4kbfiMmZaPOfqONG+iEHYFO6a8YnFKr5vFzn8e0pa
 evSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K9V/oVrKwmVrY89Zo9gT+XGKBB3lJgHF6gPMToQCwjU=;
 b=OeDAL7YUNXQMCqmq5uiHzQcyus1EffL7Z+V0Cw2c1enZcH7vlP2Z/f8AADq5AipSVS
 +4dss3ErZ1nFZVKguiOhFEkB7ZL9TrI+KMvF2KeWEQou2BRnwFfgeuVPUqrohLcrXlW/
 hIU7EgzXNuBgg7RfsXL8sWgMYc7t9HPNuLTFavylhMk3g7EQFXR2z/I13T0yyr8eXjSl
 6dSL190vhukTHzcQh5CsTT2fGbSDlvLRcfXqtwCtnQNKgwxwrmJbcVTz39/0Y4qzZX/9
 qymEY8I/Poe8q/IWgKSZ9fJU/xTeW4iw9c+3Nw0aqUMv94feAo3rb1DcbHepE1bWg7e3
 dYpQ==
X-Gm-Message-State: AGRZ1gLzHqL1RxmSUgWfLbG+3S0hWRqJLOUvFCmMbRgY/7rVHqW185Ms
 S0L+pYpA8Kt4sozeZr9BIUr8R7S3
X-Google-Smtp-Source: AJdET5epATVp+tBwjAxQ7Kfd7y22xrTgLsplpQz822B7NpuK+jeF+j1/QIFkHiNHPrAQQgopcK4k7Q==
X-Received: by 2002:a1c:4007:: with SMTP id n7-v6mr3499491wma.46.1541339178487; 
 Sun, 04 Nov 2018 05:46:18 -0800 (PST)
Received: from hal.home ([188.25.94.178])
 by smtp.gmail.com with ESMTPSA id o3-v6sm4747842wmc.2.2018.11.04.05.46.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 04 Nov 2018 05:46:17 -0800 (PST)
Subject: Re: match on wg packets and redirect
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
References: <22f7e0cd-b0cd-aa6b-29dc-18ef2d689c2b@gmail.com>
 <CAKXLc7e5ddvAskcDyFON=qapYfdKjd2rLYFnaoxrE1Y5yh=Vew@mail.gmail.com>
From: Adrian Sevcenco <adrian.sev@gmail.com>
Message-ID: <6b75dc4f-f519-6841-133e-98dbbdb5e862@gmail.com>
Date: Sun, 4 Nov 2018 15:46:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAKXLc7e5ddvAskcDyFON=qapYfdKjd2rLYFnaoxrE1Y5yh=Vew@mail.gmail.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 11/04/2018 01:41 PM, Kalin KOZHUHAROV wrote:
> On Sun, Nov 4, 2018 at 10:10 AM Adrian Sevcenco <adrian.sev@gmail.com> wrote:
>>
>> Hi! Is there a way to use iptables to match wireguard packets incoming
>> on 443 and the redirect them to the actual port?
>>
>> In many hotels/hostels and other free wifi it seems that only 80+443 is
>> allowed but amazingly both tcp and udp...
>>
> Should be, just don't try to match "wg packets", match instead your
> (other) endpoint IP address and port.
> 
> And why would you even need to do that?
> If you have an endpoint (in cloud, home, etc.) with address 1.2.3.4
> and port 443, just connect to that, no iptables should be needed.
so, the scenario is connecting laptop over free wifi to my server.
most often free wifi block anything other than 80 and 443
on my endpoint i have beside http(s) also ssh (multiplexed through sslh)

so, i would like to redirect (in raw/prerouting) the incoming wg packets 
from 443 to actual wg listening port .. but first i would need to match them

> And you can still use the same ip to host a https website (it uses tcp) :^D
well, yes, but this endpoint is already setup and used by other 
connections and i would like to keep it like that..

and now, that i took the time to answer the email i realize that i can 
always start a second endpoint on 443 :)))

So, thank you! :)
Adrian

> 
> Cheers,
> Kalin.
> 

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
