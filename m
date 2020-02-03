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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A219C35247
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Feb 2020 21:06:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2F092082E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Feb 2020 21:06:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqYmg8cB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2F092082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c21bf3a;
	Tue, 4 Feb 2020 21:05:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a416dda3
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 18:17:19 +0000 (UTC)
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6fb68d32
 for <wireguard@lists.zx2c4.com>; Mon, 3 Feb 2020 18:17:19 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id l24so8246904pgk.2
 for <wireguard@lists.zx2c4.com>; Mon, 03 Feb 2020 10:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=19h+SkKmkwjK5sjA80T7a2detw2yj63kLrpBrzlDKOQ=;
 b=XqYmg8cBGK9qml4SikzCz2kEA69VfZeWUXBQN0y4d2EsEhiMcHRS5q/yo35IREPKBd
 DqTZ/B6eMTTz4LeHfDyriPsOb1buSfP+29R4oK2etUeicQT+P7shdvL6B/97RYIYR+4t
 HQs23skj2lACwHeGm62KkpsWCp305FKI2nfZfcfB26YJQ72jeNP6rVhk9xpYVlUDUMlr
 +XnFOk8uNy0RqtUb3xZY9VbJw5+khrT0exGvCdJHcJcP13l2A3dosTz+RJ5JykOXYZ2Y
 ZNjJV+Q75M+TlpkZ1W+Q38pWPq++q6gs2iVXEO3UO9kTJlYA+SQxyStHU9kPxUDYzQS9
 sd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=19h+SkKmkwjK5sjA80T7a2detw2yj63kLrpBrzlDKOQ=;
 b=Jk/rkEuK/9SAuo8zVSHuVPwL41DJWyaeuY+c7Rq7uBZGt1osC+gtiJqrSm6T7RwXuY
 A4mWrqPKw5i88pvt/Fb+NyZFuLvMLl1HM79WXQViRKD5l0ueaTSyKumXRWZ5asaXthUh
 SqhCPoIRmCJDyO4zebGXGycG1f+Fjg1u+wkhAAqrGd6fs3QiQDWmNXfqvuIGA/APMQcK
 HxMHG6ZwH9rElav2X4b1qKCjl+J4W/eUtzOlMQgYvUd2/vaMadqiwtH4spUCxzDmHV9f
 N+izDARlEkwJqtbEY1dhD2B8HsiyoQuKkRdE7yddUKB2dKKi4OiASmXt+zW8X+isjced
 RHRg==
X-Gm-Message-State: APjAAAWVMDPjpynyFdblytsGdVFX6MshtqPHSi8nck3usQ66KvFocEyB
 hgzImz64yGMWYKilXIHEGBX1Si9z
X-Google-Smtp-Source: APXvYqy3dgm2UinWLMRSE+BN4hd18krlyAntjm8bAfA6AgHLCpoxGpnguzORXe/VGboJfADG6k77Uw==
X-Received: by 2002:a63:cd15:: with SMTP id i21mr20893196pgg.453.1580753880481; 
 Mon, 03 Feb 2020 10:18:00 -0800 (PST)
Received: from ?IPv6:2620:15c:2c1:200:55c7:81e6:c7d8:94b?
 ([2620:15c:2c1:200:55c7:81e6:c7d8:94b])
 by smtp.gmail.com with ESMTPSA id l7sm10493447pga.27.2020.02.03.10.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2020 10:17:59 -0800 (PST)
Subject: Re: [PATCH net] wireguard: fix use-after-free in
 root_remove_peer_lists
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Eric Dumazet <edumazet@google.com>
References: <20200203171951.222257-1-edumazet@google.com>
 <CAHmME9r3bROD=jAH-598_DU_RUxQECiqC6sw=spdQvHQiiwf=g@mail.gmail.com>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <efaa70a3-5c71-3cc0-ffe4-e8401d598992@gmail.com>
Date: Mon, 3 Feb 2020 10:17:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAHmME9r3bROD=jAH-598_DU_RUxQECiqC6sw=spdQvHQiiwf=g@mail.gmail.com>
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



On 2/3/20 9:29 AM, Jason A. Donenfeld wrote:
> Hi Eric,
> 
> On Mon, Feb 3, 2020 at 6:19 PM Eric Dumazet <edumazet@google.com> wrote:
>> diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
>> index 121d9ea0f13584f801ab895753e936c0a12f0028..3725e9cd85f4f2797afd59f42af454acc107aa9a 100644
>> --- a/drivers/net/wireguard/allowedips.c
>> +++ b/drivers/net/wireguard/allowedips.c
>> @@ -263,6 +263,7 @@ static int add(struct allowedips_node __rcu **trie, u8 bits, const u8 *key,
>>         } else {
>>                 node = kzalloc(sizeof(*node), GFP_KERNEL);
>>                 if (unlikely(!node)) {
>> +                       list_del(&newnode->peer_list);
>>                         kfree(newnode);
>>                         return -ENOMEM;
>>                 }
>> --
>> 2.25.0.341.g760bfbb309-goog
> 
> Thanks, nice catch. I remember switching that code over to using the
> peer_list somewhat recently and embarrassed I missed this. Glad to see
> WireGuard is hooked up to syzkaller.
> 

I will let you work on a lockdep issue that syzbot found :)



_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
