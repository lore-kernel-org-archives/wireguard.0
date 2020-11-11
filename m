Return-Path: <SRS0=sOGU=ER=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B477BC4742C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Nov 2020 07:36:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 478C020659
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Nov 2020 07:36:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=pcfreak.de header.i=@pcfreak.de header.b="Y1NrSO/2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 478C020659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pcfreak.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 254b4c8b;
	Wed, 11 Nov 2020 07:32:45 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 533aa2f3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Nov 2020 07:32:42 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id ay21so1261502edb.2
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 23:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pcfreak.de; s=google;
 h=subject:references:from:to:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=TkSLPdtDhYoQPk+buzMhUINuajch2BimMHc3qb5nL2Y=;
 b=Y1NrSO/2zLX/iwJI77ZB+u4i+aLG6i9/zMSZMaDWHdotPrzSdVyZo2yPq/V7csin+M
 7zT4wMFYvDIaeCE/B1B/xoPTf608rl7YJgtZuMk4UZJQsn7cRQVqv11eEyxqKUIUS+Pi
 LuAkzb7wCClrGZi/6nLn7ppiOUPExwkRdsIQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:references:from:to:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=TkSLPdtDhYoQPk+buzMhUINuajch2BimMHc3qb5nL2Y=;
 b=KGuvEJ+eUoyWKydrqRGjL15f6/kykvc8P1m1gtW9fHDtK/jgm77Axasq1YcV1kx1Cu
 xs0OH0fC6aZyFOTDrjlv5PTpNgvKzI3QTZkEEDkS0buWMijfHgZ5DLSlET2/ljnv/UXu
 6QuBjHnqCsg6LhagR4HsJPUYrmErNW3XRkOc18Qc5XZxs+S8K/Pk70D9tNHxT+J5HUS3
 huLqUk7YbvG4pG7GY/jwc3a77XcRA0AUL4CeUG+W52TtmhaL36cFazcEJgwUsTHru57w
 CT2Mh4dPx94jrndUVCw6ZaVPx5e4zmEv95XkyYoqbWKVqR7YdsoSRwUZiNn93eb2LHKA
 d2Aw==
X-Gm-Message-State: AOAM532gr+PnAB0sbHQ496pkMQ3FPGk0JSSkDe+uBePKc1rR6O8wGfYA
 OLWFWNhCE3+TFZVOklrC2LzKZnrN0R1sVA==
X-Google-Smtp-Source: ABdhPJzt4m258Na3dEzgGkLzMufJqNVBOCL7y5DVSnUk70jA8Tqlzp0KaP5iIRIK8kLOUeu3j63KWA==
X-Received: by 2002:a05:6402:1042:: with SMTP id
 e2mr25838400edu.320.1605080187468; 
 Tue, 10 Nov 2020 23:36:27 -0800 (PST)
Received: from [10.110.180.53] (inetpop1.witron.de. [195.243.201.20])
 by smtp.googlemail.com with ESMTPSA id zm12sm492329ejb.62.2020.11.10.23.36.26
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 23:36:27 -0800 (PST)
Subject: Re: Add local DNS forwarder to Windows client
References: <CADJb3qRk2nuvQdyF1+=9yf84annmJ+nyapdokFx1o-WcVfvfKQ@mail.gmail.com>
 <A64A6CAC-E8CA-41AB-8CCD-E9E379591C91@tomcsanyi.net>
 <d62f54e7-cb5f-7baf-9320-19903b7c5d51@pcfreak.de>
 <CADJb3qRapO=3-fuyeS6iC8EnM34TxTxpZBr1uyVhhTmfjgOmwA@mail.gmail.com>
From: Der PCFreak <mailinglists@pcfreak.de>
To: wireguard@lists.zx2c4.com
Message-ID: <5304da30-317a-6041-00d2-257089099f79@pcfreak.de>
Date: Wed, 11 Nov 2020 08:36:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CADJb3qRapO=3-fuyeS6iC8EnM34TxTxpZBr1uyVhhTmfjgOmwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

you are wrong!

For example, my dwood3rc.txt (only partially) file looks like this:

upstream_servers = 
{}                                                         # Initialize 
dictionary variable
upstream_servers["internal."]="192.168.178.1, 192.168.178.2, 
192.168.178.3"   # local DNS servers for all fqdns.internal
upstream_servers["."]="9.9.9.9, 
8.8.8.8"                                      # for others Quad Nine, 
Google, WITRON Firewall
root_servers = {}
# manual entries (similar to /etc/hosts)
# pointing to specific DNS servers for specific hostnames to resolve
root_servers["host1.separate.domain."]="10.11.12.13"           # resolve 
host1.separate.domain via DNS 10.11.12.13
bind_address="0.0.0.0"
# The IPs allowed to connect and use the cache
recursive_acl = "127.0.0.1/16, 192.168.178.0/24"

filter_rfc1918 = 0
reject_mx = 0
# please make sure you have 1 empty line at the end of the configuration 
file

So you can exactly do what you told is not possible. Make sure you don't 
forget the dots "." at the end of the names!

- resolve specific hosts via specifix DNS
- resolve specific subdomain via specific DNS
- resolve all others (.) via upstream server e.g. google DNS

So what else you need?

Regards

Peter


On 10.11.2020 16:38, Yves Goergen wrote:
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
