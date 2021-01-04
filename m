Return-Path: <SRS0=t67z=GH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA3EC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 18:41:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A0612076D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 18:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A0612076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=maidenheadbridge.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5747927d;
	Mon, 4 Jan 2021 18:30:30 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6cac90ec
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 18:30:27 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i9so33193679wrc.4
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jan 2021 10:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maidenheadbridge-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=z5/7mNgNqWGGYU0PsuubZIVAapetEX5B6vMB0gO4Tug=;
 b=T4h6vD5lL5iSaXQyiH7EYrw7Qs4MnGRDEYeMBw6gqN+otrH/YQk5a4CshxKap/RQqo
 iuJnunEwgsCZW8TdoN/ma1vF4Qm6/X8ZL97ydp3In5sG9lGxTo7w5tiXEEEROzfmgNzJ
 vPzRNiONzzfkKVlizd77+neKuvhyFzzSfezElqxKautmfuiYmkV2t1tAzCc0cX9RCSvt
 LYQj7tHKVAXucb1vTmq4IJfGH6JE2MJ+x8W12kcvnUYwtwxGgnSJyB/164VyPsdIllsB
 GqgEBoxlFrgboR7qNnklUKDEyHNsDCUtyWedbnF34fi0jbguv3WrXRltTNm0z9cXBRRR
 s7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=z5/7mNgNqWGGYU0PsuubZIVAapetEX5B6vMB0gO4Tug=;
 b=fz2GMO7D7vvn/MCG8FiLHOAS5c9slWYn9CRmrzEy+u7uxNHLGjS8TGuL6AHTyfAxUe
 6M3B+nWx8gfmqJAe5pSlTDFSBZShtMleuTCVnakE7XGu8Jhebj+WWXL/noy4mTgucWqn
 VzVGEs4BmYIuzLK9JGqvNqKT03xyQbq4XU8NzUtngYNFZK0bMYwvp3B7piibAWUW6Atl
 S1FER6Snynt7S7lWVoeq2yOy/XsJ/yqZim4TX/b1B+Qo59B3lrCdIh2gvo0HHeiOTsaV
 n45xDsodZveM47x3UunzWSxiVMlB26cN8TlIR4bpiREQQZfa4Rp/U5smT7jvwNvxOJdU
 H6XQ==
X-Gm-Message-State: AOAM532wD1etkt9q8ZDc5uvYgqZ643C00w6GzrtL0LLsFqoQIA4TBTdU
 SlhppdqkIXzDCLBD7PGQ1vxUVmN/2eIgKyIx
X-Google-Smtp-Source: ABdhPJyMPKJ16P3zozBsUkDk9Q7Htmrau+Q9Fj2YZ5AcJICvv8hIc2pm5/Z8hihUk4Mtm8xKQufYmA==
X-Received: by 2002:a5d:4704:: with SMTP id y4mr80518184wrq.358.1609785679150; 
 Mon, 04 Jan 2021 10:41:19 -0800 (PST)
Received: from [192.168.1.140] (82-68-6-78.dsl.in-addr.zen.co.uk. [82.68.6.78])
 by smtp.gmail.com with ESMTPSA id g184sm340431wma.16.2021.01.04.10.41.17
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 10:41:18 -0800 (PST)
Subject: Re: Continued use of `wg-quick save` and SaveConfig=true?
To: wireguard@lists.zx2c4.com
References: <CAHmME9oGiqbq1LtGtV=-wUu7K4OajdQO+6RiEZFw9jP73zpJ2Q@mail.gmail.com>
 <20210103195942.GA23975@server>
 <0619d9f4-c79a-a10d-cdc2-2c08a70d596f@de-vri.es>
From: Adrian Larsen <alarsen@maidenheadbridge.com>
Message-ID: <edc99d2b-74f6-f165-993c-4901ddd9fd99@maidenheadbridge.com>
Date: Mon, 4 Jan 2021 18:41:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0619d9f4-c79a-a10d-cdc2-2c08a70d596f@de-vri.es>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi Jason,

1) From a manual operation point of view, I feel more comfortable if an 
Operator uses:

# wg set wg0 peer ... allowed-ips ...
# wg-quick save wg0

rather than editing manually the config file.

In case the Wire Guard is running multiple peers with production 
traffic, I think an Operator can do less damage using the commands if 
something goes wrong.

2) From automation point of view, still I think that is easy to use the 
commands (on an script):

# wg set wg0 peer ... allowed-ips ...
# wg-quick save wg0

rather than using "sed" or "awk" to modify the config file.

My 2 cents.

Adrian

On 04/01/2021 16:16, Maarten de Vries wrote:
> On 03-01-2021 20:59, Chris Osicki wrote:
>> On Sat, Jan 02, 2021 at 03:37:09PM +0100, Jason A. Donenfeld wrote:
>>> Hi,
>>>
>>> I was thinking recently that most people have switched from a model of
>>> updating the runtime configuration and then reading that back into a
>>> config file, to editing the config file and then syncing that with the
>>> runtime config. In other words, people have moved from doing:
>>>
>>> # wg set wg0 peer ... allowed-ips ...
>>> # wg-quick save wg0
>>>
>>> To doing:
>>>
>>> # vim /etc/wireguard/wg0.conf
>>> # wg syncconf wg0 <(wg-quick strip wg0)
>>>
>>> I think this is mostly a positive change too in terms of reliability.
>>> Reading back the runtime configuration was always a bit hit or miss,
>>> and I suspect that more times than not people have been confused by
>>> SaveConfig=true.
>>>
>>> That raises the question: are there good uses left for SaveConfig=true
>>> and `wg-quick save` that warrant keeping the feature around?
>>> Temporarily caching a roamed endpoint IP, perhaps, but how helpful is
>>> that?
>>>
>>> I haven't thought too deeply about this in order to be wedded to one
>>> outcome over the other yet, but seeing some confusion today, again, in
>>> #wireguard over the feature made me wonder.
>>>
>>> Any opinions on this? Any one on this list actively use this feature
>>> and see replacements for it (e.g. syncconf) as clearly inferior?
>>>
>>> Jason
>> Hi Jason
>>
>> Being an old fashioned Unix admin, ~30 years spent in this job, I 
>> vote for the traditional way of doing it:
>> change the config file and let the application reread it.
>> I think the KISS principle is still valid ;-)
>
> I totally agree. Reloading the config file is much nicer :)
>
> I also don't need to save roaming endpoints. All WireGuard tunnels I 
> use have at-least one side with a fixed endpoint. And if that's not 
> the case I imagine you probably need a more complicated solution than 
> wg-quick.
>
>
>> Thanks for the excellent software, Jason!
>
> I also totally agree with this. WireGuard has made my life a lot 
> easier :)
>
>
> Regards,
>
> Maarten
>
