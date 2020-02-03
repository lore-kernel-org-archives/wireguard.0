Return-Path: <SRS0=oAv7=3Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09B4C3F68F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Feb 2020 21:06:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 722322082E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Feb 2020 21:06:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cFa4jZ0M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 722322082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 597f581a;
	Tue, 4 Feb 2020 21:05:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c3ec171
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 18:19:53 +0000 (UTC)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d848d0ca
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 18:19:53 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id j15so1195110pgm.6
 for <wireguard@lists.zx2c4.com>; Mon, 03 Feb 2020 10:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xYaMX13Lpg26+cMEriN2lo885jko91UPKe0BLsD49fc=;
 b=cFa4jZ0Maqd3bkSaGhDMN0ARQpvXDWyeBHGP8mV9eOsyafOgZ3yCKppCq+YZdXH1EJ
 aeVM+B/Ry4PFNs/6QeuqYRVr6YibG/9JQRTZERD2Cben/kXiU/MmZ9/Mv4NMpz/khqfZ
 lcJZ4a1RKt3g3VKOg+7qdclMF+t0m+de22srySsuHg1ROeUXouPuHPiwvyhhPtsPMWsj
 yl3nORqDnRCDdSG2XVLz361+EI9p2Z2b4tHwCz3CUfiJ4veKENR/A0dbdpUM16K0FJXD
 EpWJnGDoecj1DzJJAybpOzZ8PdDT10hFZa+hle0EcnpLszc1sWWTQUX+ldEJhfpg6adw
 /y6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xYaMX13Lpg26+cMEriN2lo885jko91UPKe0BLsD49fc=;
 b=r+mC59WADC6emO/CVd4vE1KDw+WPQcWVomFWwtqTE+hFMzj0fX2GzpcF7u/U6WoUjB
 GBgbIyGWRSp1mCcP6oBdlkYWO741AFRGdcN5q26dPxHjBSRg9ukXS6XeEPmzYYm8A+BN
 yD+tDUAat6OHEECxeGlS78sO5WVa0VUO3oYPwYmy3siaSgYLDITaQaeIxWxLznNIdOX1
 Sv16tp2/rApW5rsSPTcCE0qSN4LMVmTZfMgDn5LaWoyem88zYKeZnAgOcD/wdVg+7vi2
 G+GxlDnZ7ijvPC0zca+Rv/TQm5/vM1xdkP3J9U1bGjWyxr+bq7ZKAr2zud47wWIAejZi
 wCBQ==
X-Gm-Message-State: APjAAAUXBpH//I/ttZXrL5+euSwPCGZlIshFa2Ws7l2zEUzFevWYG1gA
 v6djAl4NpzxnFIqBHgBuVHgToyAU
X-Google-Smtp-Source: APXvYqyfqUDg4YPI6HQ3+mec00YINQIcfgA2Rfid5AdGIXg0iGNQRX99a6lqodz9O+B6BPJpZGPf+g==
X-Received: by 2002:a63:1d1a:: with SMTP id d26mr25096960pgd.98.1580754034382; 
 Mon, 03 Feb 2020 10:20:34 -0800 (PST)
Received: from ?IPv6:2620:15c:2c1:200:55c7:81e6:c7d8:94b?
 ([2620:15c:2c1:200:55c7:81e6:c7d8:94b])
 by smtp.gmail.com with ESMTPSA id j8sm153172pjb.4.2020.02.03.10.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2020 10:20:33 -0800 (PST)
Subject: Re: [PATCH net] wireguard: fix use-after-free in
 root_remove_peer_lists
From: Eric Dumazet <eric.dumazet@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Eric Dumazet <edumazet@google.com>
References: <20200203171951.222257-1-edumazet@google.com>
 <CAHmME9r3bROD=jAH-598_DU_RUxQECiqC6sw=spdQvHQiiwf=g@mail.gmail.com>
 <efaa70a3-5c71-3cc0-ffe4-e8401d598992@gmail.com>
Message-ID: <ba618605-ec50-085d-c854-f65290473c1c@gmail.com>
Date: Mon, 3 Feb 2020 10:20:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <efaa70a3-5c71-3cc0-ffe4-e8401d598992@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 04 Feb 2020 22:05:55 +0100
Cc: netdev <netdev@vger.kernel.org>, syzbot <syzkaller@googlegroups.com>,
 "David S . Miller" <davem@davemloft.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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



On 2/3/20 10:17 AM, Eric Dumazet wrote:
> 
> 
> On 2/3/20 9:29 AM, Jason A. Donenfeld wrote:
>> Hi Eric,
>>
>> On Mon, Feb 3, 2020 at 6:19 PM Eric Dumazet <edumazet@google.com> wrote:
>>> diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
>>> index 121d9ea0f13584f801ab895753e936c0a12f0028..3725e9cd85f4f2797afd59f42af454acc107aa9a 100644
>>> --- a/drivers/net/wireguard/allowedips.c
>>> +++ b/drivers/net/wireguard/allowedips.c
>>> @@ -263,6 +263,7 @@ static int add(struct allowedips_node __rcu **trie, u8 bits, const u8 *key,
>>>         } else {
>>>                 node = kzalloc(sizeof(*node), GFP_KERNEL);
>>>                 if (unlikely(!node)) {
>>> +                       list_del(&newnode->peer_list);
>>>                         kfree(newnode);
>>>                         return -ENOMEM;
>>>                 }
>>> --
>>> 2.25.0.341.g760bfbb309-goog
>>
>> Thanks, nice catch. I remember switching that code over to using the
>> peer_list somewhat recently and embarrassed I missed this. Glad to see
>> WireGuard is hooked up to syzkaller.
>>
> 
> I will let you work on a lockdep issue that syzbot found :)
> 

BTW wireguard@lists.zx2c4.com  seems to be a moderated list...

You might document this.

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ae68fb8d38f167ae4a4b8ab49e27946393641e5..890d1f3e698e4c2475eadcd4a462768391328dd7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18040,7 +18040,7 @@ M:      Jason A. Donenfeld <Jason@zx2c4.com>
 S:     Maintained
 F:     drivers/net/wireguard/
 F:     tools/testing/selftests/wireguard/
-L:     wireguard@lists.zx2c4.com
+L:     wireguard@lists.zx2c4.com (moderated for non-subscribers)
 L:     netdev@vger.kernel.org
 
 WISTRON LAPTOP BUTTON DRIVER

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
