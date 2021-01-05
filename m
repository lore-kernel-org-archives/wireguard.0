Return-Path: <SRS0=XdmQ=GI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DD9C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 00:16:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 829922255F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Jan 2021 00:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 829922255F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=maidenheadbridge.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1386ecfe;
	Tue, 5 Jan 2021 00:05:59 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 150d08dd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jan 2021 00:05:57 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id r3so33859447wrt.2
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jan 2021 16:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maidenheadbridge-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=07xiJ/fZcp4t9KsNS0uZhuOpveElIcKmV0fq0LgL9nk=;
 b=xDzooB4M/rmJDEw0cB8dq2AzzJ6tys0ngxYIutoXkE6/586IvnrC3QSLzwp4r8cKtF
 pBFkacquO6qS/ehyiUH/X9u2Lmjc0f8x2k4wv5LikN7MqAM3CjORP7CRrThO5HhpamTA
 +CMvuyjgTjCalzdx0jZgj6J+DR9sgaLrHGdMkw288nsXRpaOdQ9oI+X+DOiv0cD3DVWe
 AdBKUK3QNU8MaWYiuE3+EntzlH7jyVmcyhe9aqPzVt9icnLUUEzMQv5ZzSOvdt2lZR8U
 Wnm+H6Ywn8cwB68lRgPXz2NP07PXhbX+nfmFqSzZCoa50AykI0xlxyiNomIbVtj07SO0
 7fxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=07xiJ/fZcp4t9KsNS0uZhuOpveElIcKmV0fq0LgL9nk=;
 b=hKZb9Zgb+IzI3p2JwJ8qZpKQBWQA3RrqHV0LcNssLnj6vNUAJSczb7RiYPPABPei7d
 6bWO4zAFouk5sgqQNJceWgZejnyNOtA46HUSpV6V3kIFS61oLEzZIm+MzQ8mDNeDhIqJ
 5t2Pd5rnrLSMDuwvijYWMCZkyVddhUS17Gpc8gKiihYoIsGkrUP1VVG4JTwi22kAk7XG
 wS9fQx9G1pwbviZDO+DQlchgDIcqGE7O4BLcTxWjUKadvhKYuzdzVpYsfe0YUoQlpbsR
 l+7GG5FAXE6FFxu0ZgSgcfQWqq8YC7oEc2BgL79E7F/l0Nb4IxfEM94+1QGTvOTNbLwl
 cOwg==
X-Gm-Message-State: AOAM53026VGeP6ZkXmDbovCAubfyZvzU8Se5XqabUEK6OVtk8lmZf2I1
 TaRca7kklxORg8BI6DYuPyFN+090ItJq/BRd
X-Google-Smtp-Source: ABdhPJwjQHm2aSKgHoia62FKCZxQudAU6DTqOgBtqRK9D94YVFP31iO/DTuNo3NEVs9jSfkWOo2JMw==
X-Received: by 2002:a5d:4587:: with SMTP id p7mr78989593wrq.178.1609805810375; 
 Mon, 04 Jan 2021 16:16:50 -0800 (PST)
Received: from [192.168.1.140] (82-68-6-78.dsl.in-addr.zen.co.uk. [82.68.6.78])
 by smtp.gmail.com with ESMTPSA id o74sm1971236wme.36.2021.01.04.16.16.48
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 16:16:49 -0800 (PST)
Subject: Re: Continued use of `wg-quick save` and SaveConfig=true?
To: wireguard@lists.zx2c4.com
References: <CAHmME9oGiqbq1LtGtV=-wUu7K4OajdQO+6RiEZFw9jP73zpJ2Q@mail.gmail.com>
 <20210103195942.GA23975@server>
 <0619d9f4-c79a-a10d-cdc2-2c08a70d596f@de-vri.es>
 <edc99d2b-74f6-f165-993c-4901ddd9fd99@maidenheadbridge.com>
 <da590a57-f605-07a0-de90-319e7e163786@de-vri.es>
From: Adrian Larsen <alarsen@maidenheadbridge.com>
Message-ID: <efc2e5c8-a46b-38ad-04c4-1e11c33c021e@maidenheadbridge.com>
Date: Tue, 5 Jan 2021 00:16:48 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <da590a57-f605-07a0-de90-319e7e163786@de-vri.es>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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

Hi Maarten,

Thanks for your answer..


On 04/01/2021 21:05, Maarten de Vries wrote:
>
> On 04-01-2021 19:41, Adrian Larsen wrote:
>> Hi Jason,
>>
>> 1) From a manual operation point of view, I feel more comfortable if 
>> an Operator uses:
>>
>> # wg set wg0 peer ... allowed-ips ...
>> # wg-quick save wg0
>>
>> rather than editing manually the config file.
>>
>> In case the Wire Guard is running multiple peers with production 
>> traffic, I think an Operator can do less damage using the commands if 
>> something goes wrong.
>
>
> Another solution could be to have a command line tool that modifies 
> the configuration file. Kinda like `wg set` except for a config file 
> instead of a live interface. Would tooling like that alleviate your 
> concerns of an operator messing up the configuration file?
>
Yes, one of them.  :-)

The second potential problem is if the change is wrong, it is better not 
to permanent save it before to test. This is a common scenario:

1- The operator does a change using "wg set" on "x remote node"

2- The setting is incorrect and the "x remote node" becomes isolated. 
The operator cannot access to it any more.

3- Last resource solution: Due to the change was not saved, rebooting "x 
remote node" will allow the Operator to have access to it again.

>
>>
>> 2) From automation point of view, still I think that is easy to use 
>> the commands (on an script):
>>
>> # wg set wg0 peer ... allowed-ips ...
>> # wg-quick save wg0
>>
>> rather than using "sed" or "awk" to modify the config file.
>
>
> Yeah, sed and awk aren't necessarily the nicest solutions. Although 
> they would work fine in practice. But maybe a tool as mentioned above  
> could solve this. Even just a script as pretty front-end to the right 
> sed/awk commands could be useful here.
>
> For automation, (re-)applying a config file does have an important 
> advantage over `wg set ... && wg-quick save ...`: you can be sure that 
> all changes are applied, even if the tunnel was temporarily gone for 
> some reason. Worst case, the changes are kept in the config file and 
> applied when the interface is created again.
>
> If you try to do `wg set ... && wg-quick save ...` while the WireGuard 
> interface doesn't exist, the changes are lost. (Or you have to fall 
> back to modifying the config file by hand, but we didn't want that.)
>
> This advantage may not matter for your application, I can't really 
> know that. I suppose that depends on the kind of changes that are made 
> to the configuration at runtime.
>
> -- Maarten
>
>>
>> My 2 cents.
>>
>> Adrian
>>
>> On 04/01/2021 16:16, Maarten de Vries wrote:
>>> On 03-01-2021 20:59, Chris Osicki wrote:
>>>> On Sat, Jan 02, 2021 at 03:37:09PM +0100, Jason A. Donenfeld wrote:
>>>>> Hi,
>>>>>
>>>>> I was thinking recently that most people have switched from a 
>>>>> model of
>>>>> updating the runtime configuration and then reading that back into a
>>>>> config file, to editing the config file and then syncing that with 
>>>>> the
>>>>> runtime config. In other words, people have moved from doing:
>>>>>
>>>>> # wg set wg0 peer ... allowed-ips ...
>>>>> # wg-quick save wg0
>>>>>
>>>>> To doing:
>>>>>
>>>>> # vim /etc/wireguard/wg0.conf
>>>>> # wg syncconf wg0 <(wg-quick strip wg0)
>>>>>
>>>>> I think this is mostly a positive change too in terms of reliability.
>>>>> Reading back the runtime configuration was always a bit hit or miss,
>>>>> and I suspect that more times than not people have been confused by
>>>>> SaveConfig=true.
>>>>>
>>>>> That raises the question: are there good uses left for 
>>>>> SaveConfig=true
>>>>> and `wg-quick save` that warrant keeping the feature around?
>>>>> Temporarily caching a roamed endpoint IP, perhaps, but how helpful is
>>>>> that?
>>>>>
>>>>> I haven't thought too deeply about this in order to be wedded to one
>>>>> outcome over the other yet, but seeing some confusion today, 
>>>>> again, in
>>>>> #wireguard over the feature made me wonder.
>>>>>
>>>>> Any opinions on this? Any one on this list actively use this feature
>>>>> and see replacements for it (e.g. syncconf) as clearly inferior?
>>>>>
>>>>> Jason
>>>> Hi Jason
>>>>
>>>> Being an old fashioned Unix admin, ~30 years spent in this job, I 
>>>> vote for the traditional way of doing it:
>>>> change the config file and let the application reread it.
>>>> I think the KISS principle is still valid ;-)
>>>
>>> I totally agree. Reloading the config file is much nicer :)
>>>
>>> I also don't need to save roaming endpoints. All WireGuard tunnels I 
>>> use have at-least one side with a fixed endpoint. And if that's not 
>>> the case I imagine you probably need a more complicated solution 
>>> than wg-quick.
>>>
>>>
>>>> Thanks for the excellent software, Jason!
>>>
>>> I also totally agree with this. WireGuard has made my life a lot 
>>> easier :)
>>>
>>>
>>> Regards,
>>>
>>> Maarten
>>>
