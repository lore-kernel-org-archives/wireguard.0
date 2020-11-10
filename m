Return-Path: <SRS0=GTIq=ES=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A4FC55ABD
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 08:29:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA1CC20825
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 08:29:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RcL/5r7W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA1CC20825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ba15ff4;
	Thu, 12 Nov 2020 08:24:29 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7f0b596b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 18:04:38 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id o24so9098868ljj.6
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 10:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=X7IL7CR1+gv8g+rDtFt+948pOSrscLX9oIS/LWQOSOQ=;
 b=RcL/5r7WshBiBUWepVIMz7IZ9uu+6tSfGdc5roUGJCDf/cxYuV4iV03rxVciFRzyEp
 Z7DIQOCbCtluVCAXs8Vxnbyx6aPAfKttS8MKKXb0MQDuMXZ8FzB856tWUb6TPtxuF+XS
 3AcRRYD1kIqeFPw9TTKH2zXMICnoLBl5gDWJfuAG/Av/xOJy1UH4Z/u0ri7dAOBBvY8+
 xZmCihtFrhJxp+BJqcvgnfRtxgUnj1mAfkYKNSwKRgK9UUe9DrK6dybf9o/fpABrNK+5
 uMThCoCTe11hrNE0upIkHtFe+uJsi0KV9ej7K/sNognQx9+Bc2Mj7S8YIC1M/cU1Cvmv
 US7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=X7IL7CR1+gv8g+rDtFt+948pOSrscLX9oIS/LWQOSOQ=;
 b=h+l8p7M6UETRndemRs14PCIZIGB9zD5hnQ7J8bGl+lZpSx/UvcpspZZw+Sogwy34Sz
 QeJe549eaak2Pg6VAKWmIV4rSLl1qqbABHEtl707ghHfrbtN2SsS7nRmZRqBbopUygq9
 LXHdhX/77vuy/24anbUSzloytebF7fx1tiQYQvxBget5EcM5nb2kCXPhv8MELHm5YtRr
 oGm3XwPghJ1LONV19yLJEfhdh0MdX5o2lZ/oMDmN1oTU+yh5sdPL3IS/g6TvCpIifP8A
 iny3wb/69g7kD/SiG6PMov9jJK4F6hQJTyAdASWPOvqaSK+Sm5ibHEVujQhnwl+nJUIG
 ymsw==
X-Gm-Message-State: AOAM533jBMViDZbvDlxqbGzgjgRzuKYOJ0XIioWFsc4aU5Z2/dE7Xl4A
 y9H40oPyZhYoI8fyhIssAE4r0RY1xHA=
X-Google-Smtp-Source: ABdhPJz3V4BofMzcg9SGp1xyhc6Mi8MvCVzS76p1OQ+g1bpLBY7Fj9ZxPY1i1kZsVs7/en172QFoNw==
X-Received: by 2002:a2e:9c8d:: with SMTP id x13mr9322649lji.253.1605031700000; 
 Tue, 10 Nov 2020 10:08:20 -0800 (PST)
Received: from [10.0.0.11] (user-94-254-182-96.play-internet.pl.
 [94.254.182.96])
 by smtp.googlemail.com with ESMTPSA id 201sm1832164lfk.152.2020.11.10.10.08.18
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 10:08:19 -0800 (PST)
Subject: Re: Add local DNS forwarder to Windows client
To: wireguard@lists.zx2c4.com
References: <CADJb3qRk2nuvQdyF1+=9yf84annmJ+nyapdokFx1o-WcVfvfKQ@mail.gmail.com>
 <A64A6CAC-E8CA-41AB-8CCD-E9E379591C91@tomcsanyi.net>
 <d62f54e7-cb5f-7baf-9320-19903b7c5d51@pcfreak.de>
 <CADJb3qRapO=3-fuyeS6iC8EnM34TxTxpZBr1uyVhhTmfjgOmwA@mail.gmail.com>
From: Lech Perczak <lech.perczak@gmail.com>
Message-ID: <55dea4e3-0499-2b23-6bef-4ebd67b3d905@gmail.com>
Date: Tue, 10 Nov 2020 19:08:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <CADJb3qRapO=3-fuyeS6iC8EnM34TxTxpZBr1uyVhhTmfjgOmwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: pl
X-Mailman-Approved-At: Thu, 12 Nov 2020 09:24:25 +0100
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

Hi,

Thing is, most home LANs have dedicated gateways doing this. Running a 
Windows PC as a home router  is exotic.
It might be easier for you to pick up a cheap router which runs OpenWrt 
and set up it as gateway running Wireguard and local DNS resolver 
(dnsmasq) too.
And even there, local DNS resolution is not done by Wireguard, but by 
dnsmasq, and DNS forwarding is simply not in scope of any VPN 
implementation.

Kind regards,
Lech

W dniu 2020-11-10 o 16:38, Yves Goergen pisze:
> I just read through the 'upstream_servers' section of the Deadwood DNS
> resolver. And it doesn't seem to do what I need. I'll have to specify
> a fixed DNS server for a fixed name suffix. This is not possible on
> LANs where there are no suffixes, as I already described. Setting
> multiple upstreams for the same '.' suffix again results in a lookup
> in one of them, not both.
>
> This is not a solution to my problem. And I still refuse to believe
> that my problem is exotic. Every home LAN has this.
>
> Am Di., 10. Nov. 2020 um 14:06 Uhr schrieb Der PCFreak
> <mailinglists@pcfreak.de>:
>> Hi,
>>
>> concerning local DNS forwarder.
>>
>> I am in an environment where I need to resolve public DNS names to local
>> IPs for specific hosts and additionally public DNS for the rest.
>> In Windows XP it was possible to just stop the DNS cache service and set
>> 2 DNS servers and everything worked.
>> Newer versions of Windows starting with Windows 7 do only connect to the
>> second DNS if connecting (not querying) the first fails.
>> So if your first DNS is up but has no reply for your query, Windows will
>> just add that fqdn to the negative cache and no longer
>> query the DNS for a specific time or until you delete the cache with
>> ipconfig /flushdns.
>>
>> All of the above can be fixed using a local DNS forwarder.
>>
>> I use DeadWood on my machine for years now.
>> https://maradns.samiam.org/deadwood/doc/FAQ.html
>>
>> I just point my DNS to 127.0.0.1 (which is the deadwood service) and
>> configure Deadwood a little bit. It basically let's me
>> exactly specify which hosts to resolve how and can have something
>> similiar to a HOSTS entry, too.
>>
>> As Domi wrote I would encourage you to tryout a local DNS resolver, too.
>>
>> Regards
>>
>> Peter
>>
>> On 10.11.2020 09:14, Tomcsanyi, Domonkos wrote:
>>> Hello Yves,
>>>
>>> I am by no means a person with authority to make such a decision, but your usecase seems to be so specific I would not imagine it would make sense to blow up the size and complexity of the Windows wg with a local DNS forwarder.
>>> I think it is way better if people just install a local DNS resolver/forwarder on their own. There a ton of choices available, from simply python scripts to large scale servers. You could easily configure any of these to distinguish which DNS server to ask based on the TLD portion of your local domain or whatever other distinguisher you have.
>>> Then the only thing you need to do is tell your system (either via wg or by other means) to use the local resolver and the case is solved :).
>>> Also I am pretty sure one of the main philosophies behind wg is to be the same as much as possible on all platforms. Adding a DNS resolver would again mean a lot of complications when compared to e.g. the Linux version, since most Linux distributions already feature some kind of a local resolver by default.
>>>
>>> Cheers,
>>> Domi
>>>
>>>
>>>> 09.11.2020 dátummal, 23:46 időpontban Yves Goergen <yves.goergen@gmail.com> írta:
>>>>
>>>> ﻿Hello,
>>>>
>>>> I've already used WireGuard to connect to private networks and it's
>>>> quite easy once you figure out how to set it up. (Most tutorials are
>>>> outdated and haven't been updated, new ones haven't been written.) One
>>>> thing that's really missing however is DNS support. All I can do now
>>>> is connect to IP addresses. Names are not resolvable on the other
>>>> side. If I add the "DNS" directive to my client configuration, it
>>>> replaces the local DNS resolver and *all* lookups go to that server
>>>> instead. This isn't working either because I'm on two local networks
>>>> and each has its own local DNS server that can only resolve its own
>>>> local names (and forward the rest to the internet).
>>>>
>>>> Specifying both networks' DNS servers also fails because when
>>>> resolving a name, one of them is chosen at random (and the other one
>>>> isn't regarded) and then you won't be able to resolve some of the
>>>> names some of the time. This is also very frustrating. And it wouldn't
>>>> scale to multiple active tunnels.
>>>>
>>>> The solution I've read about is to set up a local DNS forwarder that
>>>> can be configured so that it uses multiple servers and queries each of
>>>> them and returns only a positive response. This way it could query
>>>> both local LAN DNS servers and for local names, only one of them would
>>>> resolve the name. This is a bit complicated to do if you're not
>>>> permanently connected to a VPN, or if you move from one local DHCP
>>>> network to another (like with a laptop). And it requires additional
>>>> software, setup and configuration, and probably intensive maintenance
>>>> and care. All of this makes WireGuard a pretty ugly alternative to
>>>> OpenVPN where all of this already works. Despite all the disadvantages
>>>> of OpenVPN.
>>>>
>>>> I'm asking if it's possible to integrate such a local DNS forwarder
>>>> into the Windows client application. I imagine it would start up
>>>> automatically once the first tunnel is activated. And it would replace
>>>> the local system's DNS server setting for as long as it's active (like
>>>> the tunnel-configured DNS server already does). And it would query the
>>>> original locally configured DNS server and all configured DNS servers
>>>> for the active tunnels. It would then be able to resolve local names
>>>> and tunnel-remote names without any additional work on the user end.
>>>> The user wouldn't have to perform many complex tasks upon activating
>>>> or deactivating a tunnel. This would make WireGuard be as simple and
>>>> productive as I believe it was intended to be (but isn't yet).
>>>>
>>>> This probably stops working as soon as other VPN software is used in
>>>> parallel, but the current "DNS" setting has the same limitation, it's
>>>> better than nothing and most of the time, you only run a single VPN
>>>> software.
>>>>
>>>> Please let me know what you think of it.
>>>>
>>>> -Yves


-- 
Pozdrawiam,
Lech Perczak
lech.perczak@gmail.com
Mobile: +48 694 309 185

