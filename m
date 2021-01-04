Return-Path: <SRS0=t67z=GH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2109BC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 16:17:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CBAE221F1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 16:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CBAE221F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=de-vri.es
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4580d80b;
	Mon, 4 Jan 2021 16:05:39 +0000 (UTC)
Received: from mx1.de-vri.es (mx1.de-vri.es [2a01:7c8:aab4:33e::4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f42ed6e9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 16:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de-vri.es; s=voyager; 
 t=1609776985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2DckzgXiiHFEQKjFgIZ6F81CtSnWDJi77vLp5tp9i0=;
 b=D5AbD99ECxvg/EpE2wtRl0VTETetkXlPciM0vRZDvbWMQpHxfEwIMFL/HVD3uYgtF7mCb8
 Yb7VfnxSaY7uyvTv5c9Pr0pWbp/fPFoFfNSIfFqmqsOLKIamFkw+5TTVDiZ/O/JaupLbOa
 wF4x1yUXyfX6srDVyY/A+Zw3pK6NSjgcxoCrHiu/vqKo2m3l5blK77GWDJLGntXgnWU4En
 ecxY9CofJnyT4ycVK1BUc/tZ31lsAAN8rdPpPpudV+4T/gXebeAXOeQ2L1qM6m05+peZkp
 MvI8qd3NXqDBBGv1qt9VJAz0Asrufs6u20SXfuVP4DAhMOs1F/qVftza8feMIDf75bkuOb
 +qEpGNWzJ8Fg49ox2LsXMrUWmYYZ+w1FkyIkfj8+7BQWCq8Ecqmu9j5R0woeUinxyCWeJn
 4vJS+N8e+PZXUtR87fy3zQhpx21HyuJWwxarErZUcesFdaNVI+AvCIF47Wa5eVQbrvCusF
 ErLYHvKa7AH+HqePq5PQsyTFVtfyFpwLR5tlW9AI9T0thO7eD+di7JCoRKewVyhsLNKX4S
 GylO4ayEu+uW6DllvWJ6Dt2E/0DvVaAzz14ih2q0CHIuyMWC7B6cF7YdJkCeFERFF+Inzy
 0f0qqk3TF8wLCZMxC8IlYNf6pX7kMy6vFVFq9yTZXowBNonhb7zFE=
Received: from [10.13.1.1] (83-86-162-32.cable.dynamic.v4.ziggo.nl
 [83.86.162.32]) by voyager (OpenSMTPD) with ESMTPSA id d33f4283
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 16:16:25 +0000 (UTC)
Subject: Re: Continued use of `wg-quick save` and SaveConfig=true?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAHmME9oGiqbq1LtGtV=-wUu7K4OajdQO+6RiEZFw9jP73zpJ2Q@mail.gmail.com>
 <20210103195942.GA23975@server>
From: Maarten de Vries <maarten@de-vri.es>
Message-ID: <0619d9f4-c79a-a10d-cdc2-2c08a70d596f@de-vri.es>
Date: Mon, 4 Jan 2021 17:16:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210103195942.GA23975@server>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 03-01-2021 20:59, Chris Osicki wrote:
> On Sat, Jan 02, 2021 at 03:37:09PM +0100, Jason A. Donenfeld wrote:
>> Hi,
>>
>> I was thinking recently that most people have switched from a model of
>> updating the runtime configuration and then reading that back into a
>> config file, to editing the config file and then syncing that with the
>> runtime config. In other words, people have moved from doing:
>>
>> # wg set wg0 peer ... allowed-ips ...
>> # wg-quick save wg0
>>
>> To doing:
>>
>> # vim /etc/wireguard/wg0.conf
>> # wg syncconf wg0 <(wg-quick strip wg0)
>>
>> I think this is mostly a positive change too in terms of reliability.
>> Reading back the runtime configuration was always a bit hit or miss,
>> and I suspect that more times than not people have been confused by
>> SaveConfig=true.
>>
>> That raises the question: are there good uses left for SaveConfig=true
>> and `wg-quick save` that warrant keeping the feature around?
>> Temporarily caching a roamed endpoint IP, perhaps, but how helpful is
>> that?
>>
>> I haven't thought too deeply about this in order to be wedded to one
>> outcome over the other yet, but seeing some confusion today, again, in
>> #wireguard over the feature made me wonder.
>>
>> Any opinions on this? Any one on this list actively use this feature
>> and see replacements for it (e.g. syncconf) as clearly inferior?
>>
>> Jason
> Hi Jason
>
> Being an old fashioned Unix admin, ~30 years spent in this job, I vote for the traditional way of doing it:
> change the config file and let the application reread it.
> I think the KISS principle is still valid ;-)

I totally agree. Reloading the config file is much nicer :)

I also don't need to save roaming endpoints. All WireGuard tunnels I use 
have at-least one side with a fixed endpoint. And if that's not the case 
I imagine you probably need a more complicated solution than wg-quick.


> Thanks for the excellent software, Jason!

I also totally agree with this. WireGuard has made my life a lot easier :)


Regards,

Maarten

