Return-Path: <SRS0=ktKO=BC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC7FC433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Jul 2020 16:21:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E885206D8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Jul 2020 16:21:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vTFVkQlD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E885206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5454272d;
	Thu, 23 Jul 2020 15:58:18 +0000 (UTC)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7abe2f0f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Jul 2020 15:58:15 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r2so652817wrs.8
 for <wireguard@lists.zx2c4.com>; Thu, 23 Jul 2020 09:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:disposition-notification-to
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=nFv/pLey4bLGclfRATubmYSgf0eU/EHeqnpq4olxgKM=;
 b=vTFVkQlD8Ilp0u/T2XMZkOqJAUQ/4DagEhSmnQW6ZYb3GWHNvuu4Ygi86LLOgsxUa0
 yA5e8qIaPonYd99kPLgimVpLgzMF/hKsMDyUwsiUCIniYcbebOufEwg55jV1FJKNegHr
 Ip1/eOG8hrnzzmo5RlrvRZmbJC0ulHHNg0qm18qm0J+aatEm83YykIcPVGY5rFz+OnNh
 5wkVb1s/pBwXmvgWU8sgMKOdUsjunwHgNmNqBZ46q0aPAq1qi9v0ABqCvUz46wlqqBqc
 LDc+tpiVE1d1pW2YNqKPKYfm4OFqal9uRU6RMtKtn740YA011HbfC4qPH9l8I5PTyS1G
 nJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id
 :disposition-notification-to:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=nFv/pLey4bLGclfRATubmYSgf0eU/EHeqnpq4olxgKM=;
 b=hUORA14aJ2n+KS5j9c333pAVMLcl920cc0Ku/dM4+NK7J7oEphn5CDXg7/LIKzRmvz
 Pfx9SjQxQGCPSA0uCFEIwY3W3ocg7xv3BHgkJGRfvKbU+c9co3iGBper8jaLpzNuzMyJ
 nftRqu5puxmzRdxfB0/0AK/Jh2AHdvELzYWJT/iV8Rp+QNW1uGT5cjELWFHrLmWksrd6
 cmy8pFi+BdtabPMot3bBfTBLA/TECVe+yvM4fPqVEHmnvjkvYrNHhFFN5hXf2tN2raud
 /27HvXk7BeSLevWAwvblgpAgYp5ZA9ZK1jZpyQgDFBEAJKXmXObpiMvawJECEiAh/Q/H
 hz8Q==
X-Gm-Message-State: AOAM532t8PR9CvdZlJ0HHpq1xVQLLp6tWhlFMgAZE2g6KT18LHyuhYQL
 WMbOboy524kdtyXSAemZpKP9bqzS6d0=
X-Google-Smtp-Source: ABdhPJy7uk2zVn8PwPIk05K7Ls4iAmjfGUy44rJKmB8riVejdxec8BwzW5fJF7nMcyT+H8ss5rMjFw==
X-Received: by 2002:adf:db86:: with SMTP id u6mr4614878wri.349.1595521261383; 
 Thu, 23 Jul 2020 09:21:01 -0700 (PDT)
Received: from ?IPv6:2a02:8010:66b7:dddd:1572:ee42:8767:5966?
 ([2a02:8010:66b7:dddd:1572:ee42:8767:5966])
 by smtp.gmail.com with ESMTPSA id p14sm4770695wrg.96.2020.07.23.09.21.00
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 09:21:00 -0700 (PDT)
Subject: Re: DNS Issues with Wireguard for Windows
To: wireguard@lists.zx2c4.com
References: <CAONL4-JqcxN9gtjH+3GFOsfqM8AcoYdsL3Jvf4aWGG=aF0q+pQ@mail.gmail.com>
 <99D61A626FDA8A4B90A270669121BE10D0DE259A@PLANJAVA.amebis.doma>
From: Brian Gregory <bdgregory@gmail.com>
Message-ID: <070867cc-f792-2d94-a82d-07da8993c3df@gmail.com>
Date: Thu, 23 Jul 2020 17:21:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <99D61A626FDA8A4B90A270669121BE10D0DE259A@PLANJAVA.amebis.doma>
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

I wish, or I think I wish anyway, that it would redirect all DNS traffic 
to the DNS servers listed in the configuration.

That's normally the way I run my local gateway, it redirects all DNS 
traffic to it's DNS cache which does not resolve various undesirable 
sites (malware etc.).

Brian Gregory.
bdgregory@gmail.com
www.Brian-Gregory.me.uk
(Home)

On 23/07/2020 13:02, Simon Rozman wrote:
> WireGuard for Windows adds a firewall rules to block all DNS traffic except to the DNS servers listed in the WireGuard config. This is by design (preventing data leakage).
>
> Regards,
> Simon
>
>> -----Original Message-----
>> From: WireGuard <wireguard-bounces@lists.zx2c4.com> On Behalf Of Andrew
>> Burkett
>> Sent: Saturday, July 11, 2020 1:31 AM
>> To: wireguard@lists.zx2c4.com
>> Subject: DNS Issues with Wireguard for Windows
>>
>> I was running into dns issues with wireguard on windows using the
>> released gui app. It seems like a bug with wireguard, but not sure if it
>> was actually something about my networking configs that messed it up. I
>> was able to work around the issue by changing the wireguard config (in a
>> way that seemed odd to me), but I thought it might be useful to share
>> what I was seeing in case its helpful to others or if it is in fact a
>> bug in wireguard. I'll share the configs at the bottom of the email, but
>> I'm just going to describe what I'm seeing first.
>>
>> My basic setup is I have wireguard running on a linux box functioning as
>> a server/router to a remote network. I've got a windows desktop
>> connecting to the linux box via wireguard. There are dns servers on the
>> remote network that I would like to use from the desktop. I added the
>> dns servers from the remote network to my desktop wireguard config.
>> Everything was working fine for awhile. At some point, my windows box
>> started complaining about not being connected to the internet. I was
>> able to pinpoint it with some confidence to dns requests failing when
>> wireguard was connected. Even though windows was complaining about not
>> having a network connection, my browser still worked though it seemed
>> slow so I assumed it was trying a dns server and then falling back to a
>> different one after a timeout (at least that was my guess). The "cause"
>> of the problem was adding
>> 192.168.7.12/32 to the AllowedIPs on the peer (the wireguard network in
>> my case is 10.98.1.0/24 and the rest of the network is under
>> 10.0.X.X) After adding it and waiting for a couple hours windows will
>> inevitably claim that there is no internet access from my network
>> adapter. Sometimes nslookup and ping still work fine, sometimes they
>> start to report errors. My solution that reliably fixes it is to add my
>> local dns server (which is my local router in this case
>> 192.168.86.1) to the dns section of the wireguard config, which seems
>> like an odd fix since I'm not actually sending local dns traffic to
>> wireguard.
>>
>> I couldn't figure out how to use wireshark to view wireguard traffic on
>> windows to see what's happening to the dns requests, nor do I know of
>> another way to view traffic (If someone wants to point me at how to do
>> that, or some other way to view network traffic on windows, I'm happy to
>> look at it).
>>
>> Anyway, thanks for the software. It's the best vpn software I've used by
>> a mile.
>>
>> Andrew
>>
>> My Local Gateway/DNS is 192.168.86.1
>> My Local IP is in 192.168.86.0/24 subnet
>>
>> Working Config 1
>>
>> [Interface]
>> PrivateKey = XXXXX
>> Address = 10.98.1.103/32
>> DNS = 10.0.X.X, 10.0.Y.Y
>>
>> [Peer]
>> PublicKey = XXXXXX
>> AllowedIPs = 10.0.0.0/16, 10.98.1.0/24
>> Endpoint = XXXXXXX
>>
>> Working Config 2
>>
>> [Interface]
>> PrivateKey = XXXXX
>> Address = 10.98.1.103/32
>> DNS = 10.0.X.X, 10.0.Y.Y , 192.168.86.1
>>
>> [Peer]
>> PublicKey = XXXXXX
>> AllowedIPs = 10.0.0.0/16, 10.98.1.0/24, 198.168.7.12/32 Endpoint =
>> XXXXXXX
>>
>> NonWorking Config
>>
>> [Interface]
>> PrivateKey = XXXXX
>> Address = 10.98.1.103/32
>> DNS = 10.0.X.X, 10.0.Y.Y
>>
>> [Peer]
>> PublicKey = XXXXXX
>> AllowedIPs = 10.0.0.0/16, 10.98.1.0/24, 198.168.7.12/32 Endpoint =
>> XXXXXXX
