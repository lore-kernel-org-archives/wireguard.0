Return-Path: <SRS0=YtjY=Z3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5C9C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Dec 2019 21:28:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E18FA24671
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Dec 2019 21:28:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtTagZ82"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E18FA24671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba603db8;
	Thu, 5 Dec 2019 21:28:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de7e4e0e
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 21:28:27 +0000 (UTC)
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ef79955
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 21:28:27 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t2so5458484wrr.1
 for <wireguard@lists.zx2c4.com>; Thu, 05 Dec 2019 13:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=WTob/EmO87CeRvLNGoFYZNguGWku4MBzgqFD0jajWvs=;
 b=BtTagZ82YEL51jN8EdMAZb/QllgoGypNK3L8jpRsc5ojRvigjdX2C5bDdj+ESMcXXE
 sti/dWs4NP5r1cYF3YoOz52NW/xzmPOiCZfniaXfMbG73NW/cQFxlZcepg+rMHHdMml/
 VJ9zAuM/Jm3OuIZw1X1m1vQC/WFrP1+QhOt2Yj1mVfRnmQv1PwRoq2CMG8KPq+worVeT
 N4UBs3PYez3hOT1gvPgXXKH6nqFQ8ATuWC/5T5Yl+1wogGg8cVewsd1fguk5dJzyoERe
 hM7B7TFM2wJoUn9u9YRDMiIbtlvn2iWGJ6NpyUgb3pZB4mLdoz8r4CIJ8TgH6XZGyd0M
 07qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WTob/EmO87CeRvLNGoFYZNguGWku4MBzgqFD0jajWvs=;
 b=tibmwOo2TyY0MprIjxZjRcTyk/zwapKDlrv9WcFwID2g1rUG+HKd+9DVmzso/uwVHj
 bnmxtkwGQHopJve/+WzfkdPEJzcePLLED5Jm11CB2cu4vS6nBHgTJYvmSiiJ1FHBG8qd
 f1v4Pu3FIdz/WMVTCMmBUA+4XFrkpwIj20pd7H7ruqTPq0ABnkv3rhuwuB7EF+vNR9oT
 TlSmpkM0cZkjAsFKrUNdiztV4cY3AzoIfKXj1cGLybPj1KWqhJ2sEBpeMEfu9SkJCXsA
 gqeFaOaADEDWtoE44/cl0W8ztIHqLNI3X2lyFiUPtwFKpzifTteqRJtJ500vKeGh5LSq
 d6DQ==
X-Gm-Message-State: APjAAAU+kgT/5iJOEAXnFCRM+f+sy6G+/g8FmCH8hWNMuhIeZoNAcH4y
 Wxz6GS6p1xXRSsMdC0bk9/Vw8mv2Kw6rag==
X-Google-Smtp-Source: APXvYqwaRnlzG6rjo/Yjah1rRA4ehuBV1LPho11hkH/ViPsj147t+by/xlroiBJmr8u+72XWXWklYA==
X-Received: by 2002:adf:fa87:: with SMTP id h7mr11774756wrr.172.1575581305439; 
 Thu, 05 Dec 2019 13:28:25 -0800 (PST)
Received: from [0.0.0.0] (ori.enn.lu. [85.248.227.163])
 by smtp.gmail.com with ESMTPSA id c72sm1244667wmd.11.2019.12.05.13.28.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Dec 2019 13:28:24 -0800 (PST)
Subject: Re: Regarding "Inferring and hijacking VPN-tunneled TCP connections"
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "William J. Tolley" <william@breakpointingbad.com>
References: <20191205191318.GA44156@zx2c4.com>
 <db72ae85-4e68-1745-e11b-0fb81016358e@gmail.com>
 <CAHmME9osDRPQvfYMexRcAhHdAb-x2PjD8Wnf+nrcHyX42ivmqA@mail.gmail.com>
From: Vasili Pupkin <diggest@gmail.com>
Message-ID: <fdc450ad-f382-87d7-4c63-c31d595295df@gmail.com>
Date: Fri, 6 Dec 2019 00:28:38 +0300
User-Agent: Mozilla/5.0 (Windows NT 5.2; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9osDRPQvfYMexRcAhHdAb-x2PjD8Wnf+nrcHyX42ivmqA@mail.gmail.com>
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


On 05.12.2019 23:24, Jason A. Donenfeld wrote:
> Hey Vasili,
>
> On Thu, Dec 5, 2019 at 8:50 PM Vasili Pupkin <diggest@gmail.com> wrote:
>> Isn't it enough to just enforce Strong Host Model, i.e. a host won't
>> respond from it's IP that is not facing the interface. If a host is
>> connected to two subnets 10.1.x.x and 10.2.x.x and have two IP 10.1.0.1
>> and 10.2.0.1, it will just drop all the packets sent to 10.1.0.1 that
>> came from the interface 10.2.0.1 and vice verse. This model can be
>> emulated using the FIB lookup feature of NFT with this one liner:
>>
>> nft add rule inet filter input fib daddr . iif type != { local,
>> broadcast, multicast } drop
>>
>> this also works for both IP4 and IP6. This mode can be safely enabled on
>> most setups not breaking things. Enabling it is a good precaution
>> measure anyway and it is a shame that it is not widely assumed as
>> default and standard.
>>
>> Doing the same with just iptables isn't easy and can't be accomplished
>> with one liner but nft perfectly coexist with iptables.
>>
> That actually appears to work pretty well in my quick bootleg setup.
> Thanks. I'm adding William to the email chain -- perhaps he can try
> this and report back with his attack rig?
>
> If we can make nft coexistance work reliably, perhaps we can run the
> nft rule on systems where the nft binary simply exists.
>
> For cleanup, we'll need some way of marking that rule as belonging to
> wg-quick(8) for our interface. The iptables magic currently uses
> --comment for that.
>
> There's also the issue with nft not having default table and chain
> names. Perhaps it'd be cleanest to just ad a new table and chain with
> a given name, and set that as a high priority input hook?
>
> We'll also probably want to make this only apply to our interface, and
> not others, if that's possible.
>
> Any downsides I'm overlooking?
>
> William -- you might want to subscribe to follow along better:
> https://lists.zx2c4.com/pipermail/wireguard/2019-December/004679.html
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
I've just figured out that the same effect can also be achieved with 
iptables:
iptables -t filter -I INPUT -m addrtype --limit-iface-in ! --dst-type 
LOCAL -j DROP

So it is very similar to your solution. It is not exactly the same to 
nft oneliner, because it drops multicast and broadcast packets, this can 
probably be fixed though the multiple -j jumps, I am not an expert in 
this though:
iptables -t filter -N NOTLOCAL
iptables -t filter -I INPUT -m addrtype --limit-iface-in ! --dst-type 
LOCAL -j NOTLOCAL
iptables -t filter -I NOTLOCAL -m addrtype --limit-iface-in ! --dst-type 
MULTICAST -j DROP

It should also be dubbed with ip6tables command to also filter IP6 packets.

There can possibly be systems where only nftables is installed and there 
is no iptables though.

In any case you can limit it to just one wireguard interface. It is a 
good precaution measure to enable it systemwide and rule out the 
CVE-2019-14899 completely and many other possible attacks. The weak host 
model used in linux by default is literally weak and a good system 
administrator should avoid it by all means. But for the sake of wg-quick 
the filter can be enables for wireguard interface only to be sure it 
wouldn't break anything else and in this case you can probably also 
ignore multicasts and broadcasts.

One can possibly has a sophisticated firewall rule that only accept some 
packets and his firewall will unintentionally dodge packets around our 
rules and I don't see how this can be avoided.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
