Return-Path: <SRS0=7uyE=GL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C60DC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Jan 2021 10:42:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1DC12395B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Jan 2021 10:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1DC12395B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ba5c4f1;
	Fri, 8 Jan 2021 10:42:32 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b0a862b9
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jan 2021 10:42:31 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id EFF09240133
 for <wireguard@lists.zx2c4.com>; Fri,  8 Jan 2021 11:42:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1610102551; bh=sBzo0JK5RNszTinmghVlXRZOuhRIO7bM6cjx1hDtzik=;
 h=Date:Subject:To:From:From;
 b=BfF5mNR7vIWC5VvA3w/OhD96wQB5mdjBiBXDzZ/ZV2jtnqfLBNwTzcdRqfk0d5duE
 6WLaNtTajhaZvzKH+aPBaAUn7kV3dVDeVSroRS7kizAnjxBT6oMD3xB5/NN9x6LRzb
 9ffzgpcbCnHW6LE9HJdolnMjEppUmPxIu1+OdjVPSIpISflx5X+sxJ0vjA1760m3cN
 +F4LKwA80GyyB+11oBY+Syef82/AjWRQoRW3wXxtu7AeXDihthK5qmfDDHoE5v8Bm/
 WEUdnVXm9wAU17qeE/PlrOXzT+UUjbaTGXFTKMg9t3I0s6i7bI4ipiMF61vYnEf3RT
 BgTfzSvMlqUew==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4DC06Z2MPgz6tmM;
 Fri,  8 Jan 2021 11:42:30 +0100 (CET)
Date: Fri, 08 Jan 2021 11:42:26 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <da590a57-f605-07a0-de90-319e7e163786@de-vri.es>
References: <CAHmME9oGiqbq1LtGtV=-wUu7K4OajdQO+6RiEZFw9jP73zpJ2Q@mail.gmail.com>
 <20210103195942.GA23975@server>
 <0619d9f4-c79a-a10d-cdc2-2c08a70d596f@de-vri.es>
 <edc99d2b-74f6-f165-993c-4901ddd9fd99@maidenheadbridge.com>
 <da590a57-f605-07a0-de90-319e7e163786@de-vri.es>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: Continued use of `wg-quick save` and SaveConfig=true?
To: wireguard@lists.zx2c4.com,Maarten de Vries <maarten@de-vri.es>
From: Eicke Herbertz <wolletd@posteo.de>
Message-ID: <D466A453-26C2-48C3-BC6E-C4DA3892B907@posteo.de>
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

I don't really want to advertise my stuff, but as I am running our server =
on systemd-networkd instead of wg-quick, I was in need and actually built a=
 script [1] around awk=2E
It may be not particulary clean and I'm currently unsure if support for wg=
=2Econf-Syntax actually works, but it is probably still worth noting in thi=
s context=2E

Regards,
Eicke

[1] https://github=2Ecom/WolleTD/wg-setup

Am 4=2E Januar 2021 22:05:01 MEZ schrieb Maarten de Vries <maarten@de-vri=
=2Ees>:
>
>On 04-01-2021 19:41, Adrian Larsen wrote:
>> Hi Jason,
>>
>> 1) From a manual operation point of view, I feel more comfortable if=20
>> an Operator uses:
>>
>> # wg set wg0 peer =2E=2E=2E allowed-ips =2E=2E=2E
>> # wg-quick save wg0
>>
>> rather than editing manually the config file=2E
>>
>> In case the Wire Guard is running multiple peers with production=20
>> traffic, I think an Operator can do less damage using the commands if
>
>> something goes wrong=2E
>
>
>Another solution could be to have a command line tool that modifies the
>
>configuration file=2E Kinda like `wg set` except for a config file
>instead=20
>of a live interface=2E Would tooling like that alleviate your concerns of
>
>an operator messing up the configuration file?
>
>
>>
>> 2) From automation point of view, still I think that is easy to use=20
>> the commands (on an script):
>>
>> # wg set wg0 peer =2E=2E=2E allowed-ips =2E=2E=2E
>> # wg-quick save wg0
>>
>> rather than using "sed" or "awk" to modify the config file=2E
>
>
>Yeah, sed and awk aren't necessarily the nicest solutions=2E Although
>they=20
>would work fine in practice=2E But maybe a tool as mentioned above=C2=A0 =
could
>
>solve this=2E Even just a script as pretty front-end to the right sed/awk
>
>commands could be useful here=2E
>
>For automation, (re-)applying a config file does have an important=20
>advantage over `wg set =2E=2E=2E && wg-quick save =2E=2E=2E`: you can be =
sure that=20
>all changes are applied, even if the tunnel was temporarily gone for=20
>some reason=2E Worst case, the changes are kept in the config file and=20
>applied when the interface is created again=2E
>
>If you try to do `wg set =2E=2E=2E && wg-quick save =2E=2E=2E` while the =
WireGuard=20
>interface doesn't exist, the changes are lost=2E (Or you have to fall
>back=20
>to modifying the config file by hand, but we didn't want that=2E)
>
>This advantage may not matter for your application, I can't really know
>
>that=2E I suppose that depends on the kind of changes that are made to
>the=20
>configuration at runtime=2E
>
>-- Maarten
>
>>
>> My 2 cents=2E
>>
>> Adrian
>>
>> On 04/01/2021 16:16, Maarten de Vries wrote:
>>> On 03-01-2021 20:59, Chris Osicki wrote:
>>>> On Sat, Jan 02, 2021 at 03:37:09PM +0100, Jason A=2E Donenfeld wrote:
>>>>> Hi,
>>>>>
>>>>> I was thinking recently that most people have switched from a
>model of
>>>>> updating the runtime configuration and then reading that back into
>a
>>>>> config file, to editing the config file and then syncing that with
>the
>>>>> runtime config=2E In other words, people have moved from doing:
>>>>>
>>>>> # wg set wg0 peer =2E=2E=2E allowed-ips =2E=2E=2E
>>>>> # wg-quick save wg0
>>>>>
>>>>> To doing:
>>>>>
>>>>> # vim /etc/wireguard/wg0=2Econf
>>>>> # wg syncconf wg0 <(wg-quick strip wg0)
>>>>>
>>>>> I think this is mostly a positive change too in terms of
>reliability=2E
>>>>> Reading back the runtime configuration was always a bit hit or
>miss,
>>>>> and I suspect that more times than not people have been confused
>by
>>>>> SaveConfig=3Dtrue=2E
>>>>>
>>>>> That raises the question: are there good uses left for
>SaveConfig=3Dtrue
>>>>> and `wg-quick save` that warrant keeping the feature around?
>>>>> Temporarily caching a roamed endpoint IP, perhaps, but how helpful
>is
>>>>> that?
>>>>>
>>>>> I haven't thought too deeply about this in order to be wedded to
>one
>>>>> outcome over the other yet, but seeing some confusion today,
>again, in
>>>>> #wireguard over the feature made me wonder=2E
>>>>>
>>>>> Any opinions on this? Any one on this list actively use this
>feature
>>>>> and see replacements for it (e=2Eg=2E syncconf) as clearly inferior?
>>>>>
>>>>> Jason
>>>> Hi Jason
>>>>
>>>> Being an old fashioned Unix admin, ~30 years spent in this job, I=20
>>>> vote for the traditional way of doing it:
>>>> change the config file and let the application reread it=2E
>>>> I think the KISS principle is still valid ;-)
>>>
>>> I totally agree=2E Reloading the config file is much nicer :)
>>>
>>> I also don't need to save roaming endpoints=2E All WireGuard tunnels I
>
>>> use have at-least one side with a fixed endpoint=2E And if that's not=
=20
>>> the case I imagine you probably need a more complicated solution
>than=20
>>> wg-quick=2E
>>>
>>>
>>>> Thanks for the excellent software, Jason!
>>>
>>> I also totally agree with this=2E WireGuard has made my life a lot=20
>>> easier :)
>>>
>>>
>>> Regards,
>>>
>>> Maarten
>>>

--=20
Diese Nachricht wurde von meinem Android-Ger=C3=A4t mit K-9 Mail gesendet=
=2E
