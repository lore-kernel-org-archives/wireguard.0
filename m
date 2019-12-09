Return-Path: <SRS0=o99y=2A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D0FC2D0BF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 16:19:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F40120836
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 16:19:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+8HhL6w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F40120836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c03eb49;
	Tue, 10 Dec 2019 16:19:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0f02168
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 16:18:24 +0000 (UTC)
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6dd6a89c
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 16:18:24 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id q19so2838835qvy.9
 for <wireguard@lists.zx2c4.com>; Mon, 09 Dec 2019 08:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wC7Sf/uo6CfuKrsvXK/l/vbxDk3ZK1u2NuCSrwck27g=;
 b=m+8HhL6wLmXQsMjt0cFQt0DVs3VBsryMBrsuOaZAEx0xxqAh19sau/BnGBI5vBzxnK
 fH4GeF2FUYKSsbzhbIb4d0bdzRr6ZHivjsys7fQPdRTXeQahHROXnaJBYjPrjE70e64z
 lFqNeeAsK8lSX0R5tQkrUHSANECnxGLyuvdHLGHZnf30V1eDSGMuw1Djt13E95mCM5f8
 qbNIff6OSInGnFYIUdEhfM2GDT7CkiRGWszLT+u3P78jWQyp/CyWlcFulAnEIo3YvQQ4
 ifu/1fPxwd95Nyhywl9sGbsdTXmSdPo5br1bPNd3MUfgD6C4sVy+dNLxbEJ335MXuvPG
 /bXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wC7Sf/uo6CfuKrsvXK/l/vbxDk3ZK1u2NuCSrwck27g=;
 b=KGv6Rm9MvHXyP7VC4T0U06faFEaGFmDABLWuggzQDPEagQBtMoOurBQxioSoaeQ4Az
 Sg+R489eFtYWHkZ/+J1PgzMsUsm8RJmC9bi78/6J9GNklciqkklvzEQMkZpA6JU2R/pG
 OAviiTyjInKyuLg37sCv8sSn6PV4ZgY9R3CR1elIX9Gn/SHnwjJ/TXycrefhXeudLwxc
 InYxounL3tYadAps8tiY4cwPqwRVcNZjWWNiuoFf+mFPdz8/+nrVxsrEfQPN3M6Zmepw
 Lt+pDweInBPyVrvI5fdnOnhJIRWHYDbqZSOZ2mnI4eIxqZW3S7/NLzdbYMK6aMP7OdBu
 VUyg==
X-Gm-Message-State: APjAAAWRalrWx7H83RvbTcg8YNRCYY8Jno/CjTGoMy6+BEaMXLKHJWca
 A0EXxtFExjjwHZc/19+GXJpSS0RR
X-Google-Smtp-Source: APXvYqym3dsaS69WWOZ9PwDNq+4Iz4POxscfOyxsxtKR1CBUN8aHF099o78tCWIb+IiQzIJwmJR3uQ==
X-Received: by 2002:ad4:5689:: with SMTP id bc9mr23753620qvb.132.1575908303287; 
 Mon, 09 Dec 2019 08:18:23 -0800 (PST)
Received: from ?IPv6:2601:282:800:fd80:6903:116b:63ac:ff23?
 ([2601:282:800:fd80:6903:116b:63ac:ff23])
 by smtp.googlemail.com with ESMTPSA id 13sm8961940qke.85.2019.12.09.08.18.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2019 08:18:22 -0800 (PST)
Subject: Re: organization of wireguard linux kernel repos moving forward
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?Q?Toke_H=c3=b8iland-J=c3=b8rgensen?= <toke@toke.dk>
References: <CAHmME9p1-5hQXv5QNqqHT+OBjn-vf16uAU2HtYcmwKMtLhnsTA@mail.gmail.com>
 <87d0cxlldu.fsf@toke.dk>
 <CAHmME9oUfp_1udMFNMpeXPeoa7aacdNp9Q31eKvoTBpu+G5rpQ@mail.gmail.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <8a5bdf0f-c7f8-4667-ecba-ecb671bea2e5@gmail.com>
Date: Mon, 9 Dec 2019 09:18:20 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9oUfp_1udMFNMpeXPeoa7aacdNp9Q31eKvoTBpu+G5rpQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 10 Dec 2019 17:19:38 +0100
Cc: Stephen Hemminger <stephen@networkplumber.org>,
 Netdev <netdev@vger.kernel.org>,
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

On 12/9/19 5:49 AM, Jason A. Donenfeld wrote:
> I'd definitely be interested in this. Back in 2015, that was the plan.
> Then it took a long time to get to where we are now, and since then
> wg(8) has really evolved into its own useful thing. The easiest thing
> would be to move wg(8) wholesale into iproute2 like you suggested;
> that'd allow people to continue using their infrastructure and whatnot
> they've used for a long time now. A more nuanced approach would be
> coming up with a _parallel_ iproute2 tool with mostly the same syntax
> as wg(8) but as a subcommand of ip(8). Originally the latter appealed
> to me, but at this point maybe the former is better after all. I
> suppose something to consider is that wg(8) is actually a
> cross-platform tool now, with a unified syntax across a whole bunch of
> operating systems. But it's also just boring C.

If wg is to move into iproute2, it needs to align with the other
commands and leverage the generic facilities where possible. ie., any
functionality that overlaps with existing iproute2 code to be converted
to use iproute2 code.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
