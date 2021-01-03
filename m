Return-Path: <SRS0=V5dh=GG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0C3C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Jan 2021 15:59:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CC6220795
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Jan 2021 15:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CC6220795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=pregonetwork.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9609bac4;
	Sun, 3 Jan 2021 15:48:14 +0000 (UTC)
Received: from jeremyp3.stolon.network (jeremyp3.stolon.network
 [2a00:5880:1401:77:f4d5::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bb5ae23e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jan 2021 15:48:12 +0000 (UTC)
Received: from jeremyp3.stolon.network (localhost [127.0.0.1])
 by jeremyp3.stolon.network (OpenSMTPD) with ESMTP id 571159ca;
 Sun, 3 Jan 2021 16:58:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pregonetwork.net; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=postfix;
 bh=TY50RA7uL/MWnrR0BcNpYBu0TqQ=; b=eubsiFfFeon2i7u27a0rcsI9njEf
 xwVsXTos2YA05GnYM64ckXw3Zm4i9qCinl4grrP21schr9st4a8Mlr7UElffQ0bd
 XqD3SYcRZULqy0UMj7ysnkxewP5sPmgBulY/bS+gF7cZZKPKuOiUgoSfFsPOuZQP
 YjErSJj+ND9AjYFiBtLkfq7L2QYyu5sXkpDqTZT+bdG30oMYbDZFLZzXwQMc+OW9
 Q1McVJ/F+oX1p5146HfT1T9fBvaAM6+7radbB7OZxELpuEedXlOco8ZZhbSzedND
 m3SzDM7pC5lqJijrkJS7o4oWLPjBGblNSh8MJyl2rv08udeubNCCb9nc7g==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=pregonetwork.net; h=subject
 :to:cc:references:from:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=postfix; b=OIN
 Uqcg95a6Fx+fECIGoiNDCsjpYF3zhhU+w6oo/9PEdVXSV1oDLMNXvSWiGsHyONF0
 DTJ65HgFSq2KBrQDdyoTgM82GOUcJmNzMCaiIuPW+fVccJ/jd+RGcYMCzNg4fhRL
 O6qO0WiyebYlYXeywIGFyLN0hSlbq8vKmk7CE/fgJzbt/7SkgbKmhAk7hx97ygpJ
 PEL69ybg4e3ich6nIRRbuqDn6haqxyyDELtatjS3Klb4sP2qza0MQle0K8XtL4au
 VJnzcta66PSPL3BglVK1wXIu6J3G0WaX+mEMFBOjGY0xB9zTuBQNfrpb+lnNPUfK
 MRvuzo4lpsjXTAEUSgg==
Received: from [192.168.80.10] (backupmail.domain.tld [10.4.4.2])
 by jeremyp3.stolon.network (OpenSMTPD) with ESMTPSA id f88c7e99
 (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256:NO); 
 Sun, 3 Jan 2021 16:58:55 +0100 (CET)
Subject: Re: wireguard android don't prefer IPV6 endpoint
To: Harsh Shandilya <me@msfjarvis.dev>
Cc: wireguard@lists.zx2c4.com, team@wireguard.com
References: <ead64d0f-af1e-8d5c-3d87-ed14902c5e1e@pregonetwork.net>
 <64137c2f-266a-1a06-9130-e8b42ecd4edf@pregonetwork.net>
 <37dc844baef3dd8540df172318dafa21@msfjarvis.dev>
From: =?UTF-8?B?SsOpcsOpbXkgUHJlZ28=?= <jeremy@pregonetwork.net>
Message-ID: <9367b4c7-73a1-93f6-ec6d-6d7c0cca25cd@pregonetwork.net>
Date: Sun, 3 Jan 2021 16:58:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <37dc844baef3dd8540df172318dafa21@msfjarvis.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: fr
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

hello Harsh,

> The WireGuard Android client is designed to prefer IPv4 over IPv6 as
> of now
why did you make this choice? is there a known bug with ipv6? I think it
would be useful to put an option in the wireguard application, so that
we can choose.

if I want to use an ipv6 tunnel, do I have another solution than to
create 2 tunels, one in ipv6 only, and another in ipv4 in order to be
able to use ipv6 when available and ipv4 when the place where i am has
no ipv6?

I did not manage to add 2 endpoint in a single tunnel to put an endpoint
only ipv6 and another endpoint ipv4 / ipv6 to bypass the problem

thanks,

Jerem
Le 03/01/2021 à 14:48, Harsh Shandilya a écrit :
> Hey Jérémy,
>
> On 2021-01-02 08:27, Jérémy Prego wrote:
>> I confirm the same problem in wifi
>>
>> Le 27/12/2020 à 07:02, Jérémy Prego a écrit :
>>> hello,
>>>
>>> I've always encountered a bug with android wireguard when using an ipv4
>>> / ipv6 endpoint.
>>>
>>> I tested with two phones:
>>> Huawei p10 lite android 8.0 emui 8
>>> Xiaomi poco m3 android 10.0 miui 12
>>>
>>> When i'm in LTE (not yet been able to test in wifi), wireguard connects
>>> to the endpoint in ipv4 and not in ipv6, and i don't understand why it
>>> is doing that.
>
> The WireGuard Android client is designed to prefer IPv4 over IPv6 as
> of now
> (https://git.zx2c4.com/wireguard-android/tree/tunnel/src/main/java/com/wireguard/config/InetEndpoint.java#n97).
> This may or may not change in the future, and we'll announce here if
> it does.
>
>>> However, chrome, for example, does use ipv6 by default and not ipv4.
>>>
>>> My phone does recover an ipv6 in 2a01: cb1a ........ / 64 and not an
>>> ipv6 type fc00 / fd00 / fe80 ...
>>> I also specify that if I only have an AAAA record, the tunnel works
>>> fine
>>> in ipv6. but suddenly, I can no longer connect to wifi which only
>>> have ipv4.
>>>
>>> I would like wireguard to favor ipv6 when it is available, and
>>> otherwise
>>> switch to ipv4.
>>>
>>> Is it possible ?
>>>
>>> Thanks,
>>>
>>> Jerem
>
> Cheers,
> Harsh

