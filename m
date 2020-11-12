Return-Path: <SRS0=GTIq=ES=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8F9C388F7
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 23:35:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1BD5216C4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 23:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1BD5216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=abnormalfreq.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 635db5b9;
	Thu, 12 Nov 2020 23:31:46 +0000 (UTC)
Received: from zero.abnormalfreq.com (zero.abnormalfreq.com [87.98.167.245])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b96014ab
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 21:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by zero.abnormalfreq.com (Postfix) with ESMTP id F3598493F7F
 for <wireguard@lists.zx2c4.com>; Thu, 12 Nov 2020 23:56:19 +0200 (EET)
X-Virus-Scanned: amavisd-new at abnormalfreq.com
Received: from [192.168.0.11] (synapse.abnormalfreq.com [192.168.0.11])
 by zero.abnormalfreq.com (Postfix) with ESMTPSA id DB691493F74
 for <wireguard@lists.zx2c4.com>; Thu, 12 Nov 2020 23:56:19 +0200 (EET)
Subject: Re: Should we sunset Windows 7 support?
To: wireguard@lists.zx2c4.com
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
 <K17360-33.1605029899@spamhaus.org>
From: Panagiotis Kalogiratos <nodens@abnormalfreq.com>
Message-ID: <25bc3612-5a95-6094-c06e-9361db65bec4@abnormalfreq.com>
Date: Thu, 12 Nov 2020 23:56:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <K17360-33.1605029899@spamhaus.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Fri, 13 Nov 2020 00:31:41 +0100
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

It's not really a matter of cost of updating. Windows 10 *STILL* 
activates using
Win7, 8 and 8.1 keys (including OEM licenses implemented via SLIC in 
BIOS/UEFI
by using the COA key on the sticker or directly upgrading an activated 
Win7 installation).
The update is actually free.

Stubborn users of Windows 7, fall down to two main categories:
a) Those who are afraid of the telemetry in Win10, which they think it's 
spying onto them.
b) Those who can't stand the "Metro" aka "Modern" interface and have not 
discovered
Open-Shell (the FOSS continuation of Classic Shell).

That's always excluding the enterprise where there are other factors 
involved regarding
TCO, training employees, etc etc.

Frankly, the internals of 10 are such an upgrade from 7 that it's about 
time people let
7 die in peace. We should not encourage the use of antiquated tech, when 
there's
actually no cost factor involved and it's being done only because of 
stubbornness
(and sometimes misinformation).

Since 7 has been effectively EOL'd, let's stop wasting resources on it.
People can upgrade for free. If they're so fixed onto their obsession 
with 7 and wish
to keep using an EOL'd OS with no security updates, they can also live 
using old
versions of wireguard or another solution. Although I believe most 
developers will
drop support as well. I know I will for all applications I'm working on 
that I have a say
in doing so or not. I have no intention of supporting deprecated OS 
versions. It's
literally a waste of resources.
Soon it will be impossible to find drivers for any new hardware for it. 
It's dead. Let's
just accept that and move on.

Panagiotis

On 10/11/2020 19:38, Andrew Fried wrote:
> We recently began deploying clusters of recursive DNS "firewalls" that
> use wireguard to secure and authenticate all traffic between the client
> and servers.   What we quickly learned was that virtually the entire
> customer base in India uses Windows 7 almost exclusively.
>
> I can certainly understand the desire to streamline development and
> focus on current versions of client operating systems, but by
> deprecating support for Windows 7 you would be reducing the number of
> potential Wireguard deployments by hundreds of millions of users,
> particularly in Asian and underpopulated communities in Africa.  Most of
> the end users there simply can't afford the cost of updating to the
> latest version of Windows.  I personally wish this were not the case,
> but it is what it is.
>
> Andrew
>
> On 11/10/20 7:27 AM, Jason A. Donenfeld wrote:
>> Hi,
>>
>> Windows 7 has been EOL'd by Microsoft since January of this year. It
>> is no longer receiving security updates or fixes. This email is to get
>> the conversation started about doing the same with WireGuard for
>> Windows.
>>
>> Supporting Windows 7 is an ongoing maintenance burden. For example, we
>> use SHA2 signatures instead of SHA1 signatures for our drivers, which
>> is not something we want to compromise on, and as a result Windows 7
>> users must have KB2921916 installed. But Microsoft never supplied
>> KB2921916 via Windows Update and it removed all Windows 7 hotfixes
>> from its webpage last year. So in order to keep supporting this, we're
>> forced to add clunky disgusting code like this:
>> https://git.zx2c4.com/wireguard-windows/commit/?id=b63957dc830e39c94844d2f0d32ba29575991e44
>> Keen readers will wince at all the layering violations there. Do we
>> really want to keep maintaining gross stuff like this? It makes me
>> uncomfortable to have kludges like that sitting around in the code.
>> Shouldn't I write an auto-downloader that then checks hashes?
>> Shouldn't I build this into the installer? Shouldn't I.... waste tons
>> of time supporting Windows 7 better?
>>
>> Probably not.
>>
>> But I know so many users are still using Windows 7. I'd like to hear
>> from you to understand why, in order to assess when is the right
>> moment to sunset our Windows 7 support.
>>
>> So, if you care for Windows 7, please pipe up! We're not going to
>> remove support for it overnight, and we're not prepared yet to
>> announce any sort of formal deprecation plan, but the world is moving
>> on at some point.
>>
>> Jason

