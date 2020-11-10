Return-Path: <SRS0=x2E1=EQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546A2C55ABD
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:03:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2135620674
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2020 13:03:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=pcfreak.de header.i=@pcfreak.de header.b="PKTFDzAx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2135620674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pcfreak.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb86a08b;
	Tue, 10 Nov 2020 12:59:03 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 70d88cf7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 08:41:10 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id o23so16326010ejn.11
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 00:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pcfreak.de; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=AmIFbybm3Zka1VEj4Zd3a8hSB+rU0skoTocLqyDvoh0=;
 b=PKTFDzAx9QvuBwisdjmcqyncqrvpQWpeg6oQnTDTVzeFhsfmKYo0Tgh+ay103qpskv
 hzUdk0MA3XZ30VBMyKEMASYBXZClXAHKsG5yDRYUOvDf0A+l8es/EuDAX4kyOcPiCb0G
 0wiX951038ucpLPfopml6WJTCWImj1oVPYt2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=AmIFbybm3Zka1VEj4Zd3a8hSB+rU0skoTocLqyDvoh0=;
 b=rRuFEeULvGWVbazkbER+7DL9oAYYq4+AA+ogYmL597DE8B2dXkQRdKLzNsR92HQS/p
 UCdKo5Y79ISIcbqhSvA6TCT/sPkMR/MeSoKrju6l0o5fgpA7ACB8nJStcmb6FE0xUT0P
 0swsJNm3589vE3JWwG6jkgvGhJnA+Ez3lNZWloKzQwPU4gUWqPEM1wVHCbLpSm7KVaFv
 Zn1h5waSmmrby9PjL4gqbNajrF+1hoh2QnbW5HxWGzd25XY4WGbQ9fxzH3Sf5VihreW7
 qb704e5V5PTp/wUHDx0/v4vts+E5Wfl/YSgWLt3lnl+kWZCnQ1U1VEPtSdLWw0CHZoT0
 ukag==
X-Gm-Message-State: AOAM5331wv69yI1YqnzASbAs6FbNkhBew48WdGLxujDZSuwnk3RWrGip
 AbVrNfJ4jPhSSjQlhdZ/9fnsBwF/RoONJg==
X-Google-Smtp-Source: ABdhPJwt4mpeSBb54uQM7neVCkMcJ4tVhwiCnMjyrBCJiFlUrtNvzL5qgrwwlZNMhI/vL4rpK3lj0Q==
X-Received: by 2002:a17:906:13d0:: with SMTP id
 g16mr18817074ejc.327.1604997889230; 
 Tue, 10 Nov 2020 00:44:49 -0800 (PST)
Received: from [10.110.180.53] (inetpop1.witron.de. [195.243.201.20])
 by smtp.googlemail.com with ESMTPSA id j7sm10007292ejk.14.2020.11.10.00.44.48
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 00:44:48 -0800 (PST)
Subject: Re: Add local DNS forwarder to Windows client
To: wireguard@lists.zx2c4.com
References: <CADJb3qRk2nuvQdyF1+=9yf84annmJ+nyapdokFx1o-WcVfvfKQ@mail.gmail.com>
 <A64A6CAC-E8CA-41AB-8CCD-E9E379591C91@tomcsanyi.net>
From: Der PCFreak <mailinglists@pcfreak.de>
Message-ID: <d62f54e7-cb5f-7baf-9320-19903b7c5d51@pcfreak.de>
Date: Tue, 10 Nov 2020 09:44:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <A64A6CAC-E8CA-41AB-8CCD-E9E379591C91@tomcsanyi.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Tue, 10 Nov 2020 13:58:56 +0100
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

concerning local DNS forwarder.

I am in an environment where I need to resolve public DNS names to local 
IPs for specific hosts and additionally public DNS for the rest.
In Windows XP it was possible to just stop the DNS cache service and set 
2 DNS servers and everything worked.
Newer versions of Windows starting with Windows 7 do only connect to the 
second DNS if connecting (not querying) the first fails.
So if your first DNS is up but has no reply for your query, Windows will 
just add that fqdn to the negative cache and no longer
query the DNS for a specific time or until you delete the cache with 
ipconfig /flushdns.

All of the above can be fixed using a local DNS forwarder.

I use DeadWood on my machine for years now. 
https://maradns.samiam.org/deadwood/doc/FAQ.html

I just point my DNS to 127.0.0.1 (which is the deadwood service) and 
configure Deadwood a little bit. It basically let's me
exactly specify which hosts to resolve how and can have something 
similiar to a HOSTS entry, too.

As Domi wrote I would encourage you to tryout a local DNS resolver, too.

Regards

Peter

On 10.11.2020 09:14, Tomcsanyi, Domonkos wrote:
> Hello Yves,
>
> I am by no means a person with authority to make such a decision, but your usecase seems to be so specific I would not imagine it would make sense to blow up the size and complexity of the Windows wg with a local DNS forwarder.
> I think it is way better if people just install a local DNS resolver/forwarder on their own. There a ton of choices available, from simply python scripts to large scale servers. You could easily configure any of these to distinguish which DNS server to ask based on the TLD portion of your local domain or whatever other distinguisher you have.
> Then the only thing you need to do is tell your system (either via wg or by other means) to use the local resolver and the case is solved :).
> Also I am pretty sure one of the main philosophies behind wg is to be the same as much as possible on all platforms. Adding a DNS resolver would again mean a lot of complications when compared to e.g. the Linux version, since most Linux distributions already feature some kind of a local resolver by default.
>
> Cheers,
> Domi
>
>
>> 09.11.2020 dátummal, 23:46 időpontban Yves Goergen <yves.goergen@gmail.com> írta:
>>
>> ﻿Hello,
>>
>> I've already used WireGuard to connect to private networks and it's
>> quite easy once you figure out how to set it up. (Most tutorials are
>> outdated and haven't been updated, new ones haven't been written.) One
>> thing that's really missing however is DNS support. All I can do now
>> is connect to IP addresses. Names are not resolvable on the other
>> side. If I add the "DNS" directive to my client configuration, it
>> replaces the local DNS resolver and *all* lookups go to that server
>> instead. This isn't working either because I'm on two local networks
>> and each has its own local DNS server that can only resolve its own
>> local names (and forward the rest to the internet).
>>
>> Specifying both networks' DNS servers also fails because when
>> resolving a name, one of them is chosen at random (and the other one
>> isn't regarded) and then you won't be able to resolve some of the
>> names some of the time. This is also very frustrating. And it wouldn't
>> scale to multiple active tunnels.
>>
>> The solution I've read about is to set up a local DNS forwarder that
>> can be configured so that it uses multiple servers and queries each of
>> them and returns only a positive response. This way it could query
>> both local LAN DNS servers and for local names, only one of them would
>> resolve the name. This is a bit complicated to do if you're not
>> permanently connected to a VPN, or if you move from one local DHCP
>> network to another (like with a laptop). And it requires additional
>> software, setup and configuration, and probably intensive maintenance
>> and care. All of this makes WireGuard a pretty ugly alternative to
>> OpenVPN where all of this already works. Despite all the disadvantages
>> of OpenVPN.
>>
>> I'm asking if it's possible to integrate such a local DNS forwarder
>> into the Windows client application. I imagine it would start up
>> automatically once the first tunnel is activated. And it would replace
>> the local system's DNS server setting for as long as it's active (like
>> the tunnel-configured DNS server already does). And it would query the
>> original locally configured DNS server and all configured DNS servers
>> for the active tunnels. It would then be able to resolve local names
>> and tunnel-remote names without any additional work on the user end.
>> The user wouldn't have to perform many complex tasks upon activating
>> or deactivating a tunnel. This would make WireGuard be as simple and
>> productive as I believe it was intended to be (but isn't yet).
>>
>> This probably stops working as soon as other VPN software is used in
>> parallel, but the current "DNS" setting has the same limitation, it's
>> better than nothing and most of the time, you only run a single VPN
>> software.
>>
>> Please let me know what you think of it.
>>
>> -Yves
