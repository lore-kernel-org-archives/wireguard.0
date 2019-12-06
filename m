Return-Path: <SRS0=ImwE=Z4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D029C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 16:04:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30C962464E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 16:04:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIn6f0sn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30C962464E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04945bf7;
	Fri, 6 Dec 2019 16:03:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ecd6671d
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 16:03:46 +0000 (UTC)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2ac281f
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 16:03:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j42so8286311wrj.12
 for <wireguard@lists.zx2c4.com>; Fri, 06 Dec 2019 08:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0sZxom6yFqEWf+JnJJ0NCR4TZooOVJwoVr4PX2AdSuk=;
 b=SIn6f0snQOqTl2i37GV5LUIZC2a84t5YmG/piHKlbARDFknsnZu8rfUSWMo4yfsZoy
 hAKZWvi0i+DDwtqIfDfTPy6VyYKzv8DzklZI4grvByEIP6IhAe+d0OfgK/uHJXdcyx5x
 sO+nenblp2y4ym8TA/r6wPUnojGfZ/frYOckPZDYfdgPOhtFWWADKRgMbgbt6UgDcfIf
 QfvJlTxnRk3+WD7a4hEY16UoNamQx5tuaKgvgEuiIR0GW55uT6NrtwBkIR77ZmuazfP3
 cVcwBatEm16s2Or6ADAf1xJBgWIapfOdPEzlKrQzNg5iqaK5f3GCSWHLvdgoj2JYw4m9
 TjIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0sZxom6yFqEWf+JnJJ0NCR4TZooOVJwoVr4PX2AdSuk=;
 b=DCEUrOTywtOr9RqfwcakfoZFNgwOCmwh5cPQWOnc/lO0QPbIxhIRowFyj8VLenHQhz
 iRcHfsn2OM4rQjxkm8mifeEKDjpmWprPsLut3ny0qVkdl3AdwY6CN8ir6+cDq+HrfrHA
 rK3MxzYONohE9hYZ/fY+kPZc3kFWYi7CwprYfpZ20cKYM4LoYTOe6pcRg0qnhdMtDcC9
 b7deJW34bAIsgoQ2MV8slS/7/Vj63bXJRnYS4N987Pksy61UxxpND2XDftDDVzgKA0l6
 iq8snDheZv60OUIAqD8b0c0YsvyCSZI3IyuocPSu/w460qQataXkGWXjOBSuuvfPKXIp
 6cdQ==
X-Gm-Message-State: APjAAAWyHfwVIqGfETkijUP4OUdaYlk0dXCyf8JycqN7fOU8E65/nuFX
 dC2DySp872FIV74SC63Xh1Lwiz6zuj1mmA==
X-Google-Smtp-Source: APXvYqwcG1jDpy9llSJnPEV8tS4wEGfbVx3BoPEeIlbJ+VZv9DhDt44twPSOMz8QNocAE8YOlDdG+A==
X-Received: by 2002:adf:f10a:: with SMTP id r10mr15494265wro.202.1575648225148; 
 Fri, 06 Dec 2019 08:03:45 -0800 (PST)
Received: from [0.0.0.0] ([185.220.101.76])
 by smtp.gmail.com with ESMTPSA id a78sm2531422wme.9.2019.12.06.08.03.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Dec 2019 08:03:44 -0800 (PST)
Subject: Re: Regarding "Inferring and hijacking VPN-tunneled TCP connections"
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Jordan Glover <Golden_Miller83@protonmail.ch>
References: <20191205191318.GA44156@zx2c4.com>
 <db72ae85-4e68-1745-e11b-0fb81016358e@gmail.com>
 <CAHmME9osDRPQvfYMexRcAhHdAb-x2PjD8Wnf+nrcHyX42ivmqA@mail.gmail.com>
 <51usC7EJy_alaYnTOuLCvYhTzzcKrvAfq01j0Vfu5QVd6OGARQLdDDqQymloKWhWqkp81E09bpwjSRw5mnJDwg5fv8FuAVS-W0CYLuJlpRI=@protonmail.ch>
 <CAHmME9qUWRO76NJrnO5iNoWuauvMT3kf+qM1bY49bVkcBFXY9g@mail.gmail.com>
From: Vasili Pupkin <diggest@gmail.com>
Message-ID: <1bcf459c-4c08-33b2-19da-31cb62fd56a1@gmail.com>
Date: Fri, 6 Dec 2019 19:03:54 +0300
User-Agent: Mozilla/5.0 (Windows NT 5.2; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9qUWRO76NJrnO5iNoWuauvMT3kf+qM1bY49bVkcBFXY9g@mail.gmail.com>
Content-Language: en-US
Cc: "William J. Tolley" <william@breakpointingbad.com>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 06.12.2019 18:08, Jason A. Donenfeld wrote:
> On Fri, Dec 6, 2019 at 4:06 PM Jordan Glover
> <Golden_Miller83@protonmail.ch> wrote:
>> On Thursday, December 5, 2019 8:24 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>>
>>> If we can make nft coexistance work reliably, perhaps we can run the
>>> nft rule on systems where the nft binary simply exists.
>>>
>> Will this work correctly on systems where nft binary exist but only
>> iptables rules are used?
> That's what I meant by, "if we can make nft coexistance work reliably."
>

Take a look at the table on the bottom of this page
https://wiki.nftables.org/wiki-nftables/index.php/Troubleshooting#Question_4._How_do_nftables_and_iptables_interact_when_used_on_the_same_system.3F

On my system their rules coexist fine. Both nftables and iptables are 
just high level interfaces to kernel netfilter hooks after all, if 
either of them drop the packet then the packet is dropped. It is also 
possible to write the same filter using iptables, not as easy and not as 
beautiful as nft though. Finally wireguard can do this directly 
interacting with netfilter as the last resort.

I'd like if kernel developers reconsider the default system behavior on 
this... It is so stupid that the system expose all its IPs on all 
interfaces by default. But Linus don't like patches that break things 
and this will break some bad network setups, yes weak and insecure but 
still.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
