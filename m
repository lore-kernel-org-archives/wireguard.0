Return-Path: <SRS0=t67z=GH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2513EC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 21:05:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58451207B0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 21:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58451207B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=de-vri.es
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 903e065d;
	Mon, 4 Jan 2021 20:54:12 +0000 (UTC)
Received: from mx1.de-vri.es (voyager.de-vri.es [149.210.162.205])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 109a620f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 20:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de-vri.es; s=voyager; 
 t=1609794301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WHJSSK+fz6tbvyHshApeQ0ZeSkju5pxW8qBD4TTqZl4=;
 b=Ty0fvjvEm0Aw4Wx6lLhD9imfldU+tufk0a+D7pickzE3nnIuSVoIpO+SKpvdDh09k3rUmc
 iv6/poxn6FwtJZcI5CCuy5P6brwFmIICGbNrIPeicCt1fScmkYKd9Iqv+4qvxTdn4G+c5M
 QwTVAqEgTGcsGxVzjOpCJzsJlKg6RQ5b9GLvD2O02EVv6Nyl8oJvX609cHygINfdxq5K+/
 LtIcvCyZ+qj/yp/82i4jXB9ivEVJV3IC0Uo/UcP+1CHg5Qy8J90jWeGYqSvVyVMZlH/ntg
 w/q8IEcjGLwTYE/1th7TwkH2iAi5SaOMij5XmqM1qjjqF/nkLSmXsQYOBI/akEZ89z0Ymr
 4vOk8JLrwZVZImaYLuR5wDm/E1pj6myyLMh2T63qBlMRNk5b2cQEayX2ZBfqTQ1cJ8jHIv
 LD86894KDsa/3b6HN6WK2Qw6WU876NgG8BLTiu+VG3zmhRvHXVGSi7WskLWxKALRcLZ5uy
 H+7KpfxEUkTuF+vsYtFDGOxHg4FeiJrQ/GC2qlskawGZ3STdPKBv75FTrb8aimDRGnKNbS
 UhRADnNuJgtlp7KNR38R0FQH3Tku3g7jmyw2NthVzAeaM8BNaY3v80i6olLJZ3b7zjDBZy
 rnioeQ6XFcDmHkN++yi8jrqt8qOziQE1GNzEVNFGCfS2yG0xO2JKM=
Received: from [10.13.1.1] (83-86-162-32.cable.dynamic.v4.ziggo.nl
 [83.86.162.32]) by voyager (OpenSMTPD) with ESMTPSA id 2456e8d6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 21:05:01 +0000 (UTC)
Subject: Re: Continued use of `wg-quick save` and SaveConfig=true?
To: wireguard@lists.zx2c4.com
References: <CAHmME9oGiqbq1LtGtV=-wUu7K4OajdQO+6RiEZFw9jP73zpJ2Q@mail.gmail.com>
 <20210103195942.GA23975@server>
 <0619d9f4-c79a-a10d-cdc2-2c08a70d596f@de-vri.es>
 <edc99d2b-74f6-f165-993c-4901ddd9fd99@maidenheadbridge.com>
From: Maarten de Vries <maarten@de-vri.es>
Message-ID: <da590a57-f605-07a0-de90-319e7e163786@de-vri.es>
Date: Mon, 4 Jan 2021 22:05:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <edc99d2b-74f6-f165-993c-4901ddd9fd99@maidenheadbridge.com>
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


On 04-01-2021 19:41, Adrian Larsen wrote:
> Hi Jason,
>
> 1) From a manual operation point of view, I feel more comfortable if 
> an Operator uses:
>
> # wg set wg0 peer ... allowed-ips ...
> # wg-quick save wg0
>
> rather than editing manually the config file.
>
> In case the Wire Guard is running multiple peers with production 
> traffic, I think an Operator can do less damage using the commands if 
> something goes wrong.


Another solution could be to have a command line tool that modifies the 
configuration file. Kinda like `wg set` except for a config file instead 
of a live interface. Would tooling like that alleviate your concerns of 
an operator messing up the configuration file?


>
> 2) From automation point of view, still I think that is easy to use 
> the commands (on an script):
>
> # wg set wg0 peer ... allowed-ips ...
> # wg-quick save wg0
>
> rather than using "sed" or "awk" to modify the config file.


Yeah, sed and awk aren't necessarily the nicest solutions. Although they 
would work fine in practice. But maybe a tool as mentioned above  could 
solve this. Even just a script as pretty front-end to the right sed/awk 
commands could be useful here.

For automation, (re-)applying a config file does have an important 
advantage over `wg set ... && wg-quick save ...`: you can be sure that 
all changes are applied, even if the tunnel was temporarily gone for 
some reason. Worst case, the changes are kept in the config file and 
applied when the interface is created again.

If you try to do `wg set ... && wg-quick save ...` while the WireGuard 
interface doesn't exist, the changes are lost. (Or you have to fall back 
to modifying the config file by hand, but we didn't want that.)

This advantage may not matter for your application, I can't really know 
that. I suppose that depends on the kind of changes that are made to the 
configuration at runtime.

-- Maarten

>
> My 2 cents.
>
> Adrian
>
> On 04/01/2021 16:16, Maarten de Vries wrote:
>> On 03-01-2021 20:59, Chris Osicki wrote:
>>> On Sat, Jan 02, 2021 at 03:37:09PM +0100, Jason A. Donenfeld wrote:
>>>> Hi,
>>>>
>>>> I was thinking recently that most people have switched from a model of
>>>> updating the runtime configuration and then reading that back into a
>>>> config file, to editing the config file and then syncing that with the
>>>> runtime config. In other words, people have moved from doing:
>>>>
>>>> # wg set wg0 peer ... allowed-ips ...
>>>> # wg-quick save wg0
>>>>
>>>> To doing:
>>>>
>>>> # vim /etc/wireguard/wg0.conf
>>>> # wg syncconf wg0 <(wg-quick strip wg0)
>>>>
>>>> I think this is mostly a positive change too in terms of reliability.
>>>> Reading back the runtime configuration was always a bit hit or miss,
>>>> and I suspect that more times than not people have been confused by
>>>> SaveConfig=true.
>>>>
>>>> That raises the question: are there good uses left for SaveConfig=true
>>>> and `wg-quick save` that warrant keeping the feature around?
>>>> Temporarily caching a roamed endpoint IP, perhaps, but how helpful is
>>>> that?
>>>>
>>>> I haven't thought too deeply about this in order to be wedded to one
>>>> outcome over the other yet, but seeing some confusion today, again, in
>>>> #wireguard over the feature made me wonder.
>>>>
>>>> Any opinions on this? Any one on this list actively use this feature
>>>> and see replacements for it (e.g. syncconf) as clearly inferior?
>>>>
>>>> Jason
>>> Hi Jason
>>>
>>> Being an old fashioned Unix admin, ~30 years spent in this job, I 
>>> vote for the traditional way of doing it:
>>> change the config file and let the application reread it.
>>> I think the KISS principle is still valid ;-)
>>
>> I totally agree. Reloading the config file is much nicer :)
>>
>> I also don't need to save roaming endpoints. All WireGuard tunnels I 
>> use have at-least one side with a fixed endpoint. And if that's not 
>> the case I imagine you probably need a more complicated solution than 
>> wg-quick.
>>
>>
>>> Thanks for the excellent software, Jason!
>>
>> I also totally agree with this. WireGuard has made my life a lot 
>> easier :)
>>
>>
>> Regards,
>>
>> Maarten
>>
