Return-Path: <SRS0=3VOv=OQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C5CC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 26 Sep 2021 11:02:30 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92DFD60EE0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 26 Sep 2021 11:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92DFD60EE0
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=pregonetwork.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c816ff08;
	Sun, 26 Sep 2021 11:02:27 +0000 (UTC)
Received: from jeremyp3.stolon.network (jeremyp3.stolon.network
 [2a00:5880:1401:77:f4d5::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 56665135
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Sep 2021 11:02:23 +0000 (UTC)
Received: from jeremyp3.stolon.network (localhost [127.0.0.1])
 by jeremyp3.stolon.network (OpenSMTPD) with ESMTP id f288600b;
 Sun, 26 Sep 2021 13:02:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pregonetwork.net; h=
 subject:from:to:cc:references:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=postfix;
 bh=B860seQcm7x9jV3XjFWeHhgbJrQ=; b=nQDFnZxyoHHdLGZt1kjLiqsDce7Q
 iWMbsJN8FeoUnasepayUscKzB30r/p1aLM9di1jQpEukeUkIPlpgy0M4d+Wjwk5x
 k4eP5IqELHVBVT+4RCWuHzfzeJCybVeM9OE9xeRjFPPPqFl9uip8OCEtnoBHSq0a
 +ZBQB5ihzuG4q6KH4iek1ojBC6ebDFOQm8h6VedY+5JH5GaW2gCmQsQJ/++DG33h
 8u3X7SvaOCLs56uQW4ZTKrlsifi5PeLHwYK/O68MfbvKUM6mso8j73NOHvd8niyf
 glXu6hv0cPr2mc1soPOTPByFtvDXkIJ0swKEqUq+PdG2z145qyisHLtC1g==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=pregonetwork.net; h=subject
 :from:to:cc:references:message-id:date:mime-version:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=postfix; b=IhK
 tyQh7mSh0fzD3R/U5/JySRdXWaYnXO/WeOFiyQLOMkxGcvK1U7+4xyffSWgEIWNG
 7zEl3sGyVxwHdJLuKwjxKU/rj73c2VxkNcIm6xUFSenfSeLK9QYa3bD3ngrtzu0D
 sJnIkz1fkX0SQ1NLmXy6Vrp0U78IVlSoa4lW8KDT6UrvBrmE/Uauo0XAdDxfCyPP
 t9WiBuoFcZKMW4vcm+ptybZXkDY8aYQ0JZ+DYJ0P2clRFgQHw6Ex25c8mNZBNSYT
 UoGSLvUCBs9+H3LprIB2OqpvUqveF5RN/zW3xCTjGTeIiNCS3dAgLsKwcv4Pwkzi
 TonWeyWFVL3YlVVTj9g==
Received: from [192.168.80.10] (backupmail.domain.tld [10.4.4.2])
 by jeremyp3.stolon.network (OpenSMTPD) with ESMTPSA id 102de97e
 (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256:NO); 
 Sun, 26 Sep 2021 13:02:21 +0200 (CEST)
Subject: Re: wireguard android don't prefer IPV6 endpoint
From: =?UTF-8?B?SsOpcsOpbXkgUHJlZ28=?= <jeremy@pregonetwork.net>
To: wireguard@lists.zx2c4.com
Cc: team@wireguard.com
References: <ead64d0f-af1e-8d5c-3d87-ed14902c5e1e@pregonetwork.net>
 <64137c2f-266a-1a06-9130-e8b42ecd4edf@pregonetwork.net>
 <37dc844baef3dd8540df172318dafa21@msfjarvis.dev>
 <9367b4c7-73a1-93f6-ec6d-6d7c0cca25cd@pregonetwork.net>
Message-ID: <f1b3f08f-3633-48d5-065d-b126eb32be51@pregonetwork.net>
Date: Sun, 26 Sep 2021 13:02:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <9367b4c7-73a1-93f6-ec6d-6d7c0cca25cd@pregonetwork.net>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Hello,

I think it is useful that I revive this topic.

is it possible to add an option so that i can use an ipv4 / ipv6 
endpoint but using ipv6 by default when available?

With the shortage of ipv4, internet operators now very often provide 
subscribers with native ipv6 but ipv4 in tunnel, hence the performance 
of the wireguard tunnel is affected by this, as it uses ipv4 by default.

if this is not possible in the official client, which wireguard client 
would allow me to have this behavior?

Thanks,

Jerem
Le 03/01/2021 à 16:58, Jérémy Prego a écrit :
> hello Harsh,
>
>> The WireGuard Android client is designed to prefer IPv4 over IPv6 as
>> of now
> why did you make this choice? is there a known bug with ipv6? I think it
> would be useful to put an option in the wireguard application, so that
> we can choose.
>
> if I want to use an ipv6 tunnel, do I have another solution than to
> create 2 tunels, one in ipv6 only, and another in ipv4 in order to be
> able to use ipv6 when available and ipv4 when the place where i am has
> no ipv6?
>
> I did not manage to add 2 endpoint in a single tunnel to put an endpoint
> only ipv6 and another endpoint ipv4 / ipv6 to bypass the problem
>
> thanks,
>
> Jerem
> Le 03/01/2021 à 14:48, Harsh Shandilya a écrit :
>> Hey Jérémy,
>>
>> On 2021-01-02 08:27, Jérémy Prego wrote:
>>> I confirm the same problem in wifi
>>>
>>> Le 27/12/2020 à 07:02, Jérémy Prego a écrit :
>>>> hello,
>>>>
>>>> I've always encountered a bug with android wireguard when using an ipv4
>>>> / ipv6 endpoint.
>>>>
>>>> I tested with two phones:
>>>> Huawei p10 lite android 8.0 emui 8
>>>> Xiaomi poco m3 android 10.0 miui 12
>>>>
>>>> When i'm in LTE (not yet been able to test in wifi), wireguard connects
>>>> to the endpoint in ipv4 and not in ipv6, and i don't understand why it
>>>> is doing that.
>> The WireGuard Android client is designed to prefer IPv4 over IPv6 as
>> of now
>> (https://git.zx2c4.com/wireguard-android/tree/tunnel/src/main/java/com/wireguard/config/InetEndpoint.java#n97).
>> This may or may not change in the future, and we'll announce here if
>> it does.
>>
>>>> However, chrome, for example, does use ipv6 by default and not ipv4.
>>>>
>>>> My phone does recover an ipv6 in 2a01: cb1a ........ / 64 and not an
>>>> ipv6 type fc00 / fd00 / fe80 ...
>>>> I also specify that if I only have an AAAA record, the tunnel works
>>>> fine
>>>> in ipv6. but suddenly, I can no longer connect to wifi which only
>>>> have ipv4.
>>>>
>>>> I would like wireguard to favor ipv6 when it is available, and
>>>> otherwise
>>>> switch to ipv4.
>>>>
>>>> Is it possible ?
>>>>
>>>> Thanks,
>>>>
>>>> Jerem
>> Cheers,
>> Harsh

