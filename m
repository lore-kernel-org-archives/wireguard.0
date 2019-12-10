Return-Path: <SRS0=o99y=2A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30AFC3F68F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 21:56:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 573172053B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 21:56:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJtOPA4W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 573172053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0dfc4ef1;
	Tue, 10 Dec 2019 21:56:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e891d79e
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 21:56:27 +0000 (UTC)
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b69978e
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 21:56:27 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d16so21795599wre.10
 for <wireguard@lists.zx2c4.com>; Tue, 10 Dec 2019 13:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=oIvrOFIxj2P8e03LwUuzAlly4uTQNO9tteXCC3cO2zw=;
 b=SJtOPA4WWnn038BGCvCFb9CbLbuSi4dhRP82TdVwyQqfeCRCnL3nAu/zMB8DFoR3ij
 sPpnu/23/YwInjt5P+XeAlt+pP736Yuh3/GKX/SmxRfHilPzdPMSlLlwFu8rYNv15i1J
 KSYUyWAfsylYVhn8BbCkKsZPAqci8nyc4UJv/y/ch7T3ke/ZDBGQlofTX+AueQjBqr4k
 SWidZcWcu1snSr/3lxkr58SFv9zC//u8VwTiFHsyt59If/UCmM1mNDLTTlYouxDxsQCg
 bm3JUb90lG0Eyw0c1J0yICq9rgf0jC+HzH68Bw5hnGIrJO31BQ8wWnO+3z78BWmYmjcP
 L7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=oIvrOFIxj2P8e03LwUuzAlly4uTQNO9tteXCC3cO2zw=;
 b=M6zzoCqu1IY5MqkpgrPXBlhYTbDklHkS2asnxC3ZCzgoV6t14oBFL4vfvZ4Pqyrj9w
 GmtxESCQzOboA4lr1ii5EbfBh45u0yMiycgHPbHH8eyzyCOJWFW7ufyxG0Gf6iDKtiwG
 Mc0RfETapAMLSjE1aO9evOdXBIZ0K/cC5REl6POcGiWSorlm3/iBIrIpbWOacaWGmu5w
 THBgYDR90HVT8Ow+BO8IuNwMPXWfZJ9/lrS251buJCdY7pPiWnR0E+gKuu6CSeVxwlN1
 5uAh86RUPNKq3hCJCT1x/Vit0ukcIujxVZ+vBiduLaE811DOReh9c4sW2GIwOOaKc9P3
 jy5Q==
X-Gm-Message-State: APjAAAWXvpEN3Lxzq0tlubB5Nh0Kqumh0FivUstOcHZL9RyjXfbtN88d
 jbx78FOpdPDQ6+GrBvD55o0vu7b67LG49g==
X-Google-Smtp-Source: APXvYqwxddN40ecSSddlhfrhh1ggiaV8Wkfu4rYIftMhltf7PFqChWNNJleRw6a2egY1DQcUZVPd7w==
X-Received: by 2002:adf:ee88:: with SMTP id b8mr5950950wro.249.1576014986092; 
 Tue, 10 Dec 2019 13:56:26 -0800 (PST)
Received: from [0.0.0.0] ([185.220.101.15])
 by smtp.gmail.com with ESMTPSA id o4sm4731118wrw.97.2019.12.10.13.56.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Dec 2019 13:56:25 -0800 (PST)
Subject: Re: [PATCH] wg-quick: linux: add support for nft and prefer it
To: Roman Mamedov <rm@romanrm.net>, "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20191210154850.577745-1-Jason@zx2c4.com>
 <FX30kbIJvHNSsmPxMSA_XdlAOLSee8p5eHMDcDAkDH8KKhihrybE2EtZJIjtU9ojh-JJT9g4Cj5xlT85E5uETb9JsBJmficyjfDvblrRaJg=@protonmail.ch>
 <CAHmME9pdqq23OXNPHLT-YyXCKTVTKJNyfz9D+Q0jADAN=BDhnA@mail.gmail.com>
 <20191210221215.56c2f30d@natsu>
From: Vasili Pupkin <diggest@gmail.com>
Message-ID: <a8f51c8e-d0e8-aaa6-024f-70b65007559f@gmail.com>
Date: Wed, 11 Dec 2019 00:56:22 +0300
User-Agent: Mozilla/5.0 (Windows NT 5.2; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191210221215.56c2f30d@natsu>
Content-Language: en-US
Cc: "jwollrath@web.de" <jwollrath@web.de>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

On 10.12.2019 20:12, Roman Mamedov wrote:
> On Tue, 10 Dec 2019 17:54:49 +0100
> "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>
>> iptables rules and nftables rules can co-exist just fine, without any
>> translation needed. Indeed if your iptables is symlinked to
>> iptables-nft, then you'll insert nftables rules when you try to insert
>> iptables rules, but it really doesn't matter much either way (AFAIK).
>> I figured I'd prefer nftables over iptables if available because I
>> presume, without any metrics, that nftables is probably faster and
>> slicker or something.
> nftables is slower than iptables across pretty much every metric[1][2]. It
> only wins where a pathological case is used for the iptables counterpart (e.g.
> tons of single IPs as individual rules and without ipset). It is a disaster
> that it is purported to be the iptables replacement, just for the syntax and
> non-essential whistles such as updating rules in place or something. And
> personally I don't prefer the new syntax either. It's the systemd and
> pulseaudio story all over again, where something more convoluted, less reliable
> and of lower quality is passed for a replacement of stuff that actually worked,
> but was deemed "unsexy" and arbitrarly declared as deprecated.
>
> [1] http://www.diva-portal.org/smash/get/diva2:1212650/FULLTEXT01.pdf
> [2] https://developers.redhat.com/blog/2017/04/11/benchmarking-nftables/
>
As far as I know both of them are maintained in the same repository and 
both use the same userspace library to interact with the kernel and down 
there all the rules are translated into BPF code which in turn is 
compiled into machine code by kernel BPF JIT compiler. So identical 
rules should show exactly the same performance. nft syntax is odd and 
its curvy braces aren't easy to pass in command line, it is more 
difficult to delete rules from nft table, but it also allows to arrange 
rules into separate chains easier and also provide a native way to 
define sets which are then processed very efficiently as seen in [2]. 
Anyway netfilter infrastructure developers have chosen nft as 
replacement to iptables and it will slowly phase it out, but this will 
be a very slow process and it is already going for 10 years now, 
everything is written in iptables.

I don't see a big problem. Just choose any of the console command 
present on the system and print warning if neither of them is found. 
wg-quick shows its log in console and these rules will not cause any 
problems in most setups anyway. If this is such an issue then it can be 
opted by a command line argument (i.e. use iptables, nft or none) but it 
is already an overshoot. Personally I don't even think that the issue 
should be fixed in wireguard. The weak host model affects any other 
network setups and all the other vpn's just as wireguard and even if 
wg-quick patch it somehow for wireguard interface the end system will 
still be open to attacks on other interfaces. The strong host model 
should be chosen as default by kernel developers or configured system 
wide by an administrator.

Also.. what about other systems, windows, android etc?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
