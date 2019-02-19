Return-Path: <SRS0=+C0p=Q2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F48C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 Feb 2019 05:03:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7AE520449
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 Feb 2019 05:03:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=mx.trustiosity.com header.i=@mx.trustiosity.com header.b="85nYmOb4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7AE520449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=trustiosity.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 434b134a;
	Tue, 19 Feb 2019 04:55:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 749c30d7
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Feb 2019 02:52:46 +0000 (UTC)
Received: from mx.trustiosity.com (mx.trustiosity.com [54.186.28.113])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc1ff75f
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Feb 2019 02:52:45 +0000 (UTC)
Received: from [192.168.212.105] (csm [192.168.212.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 (Authenticated sender: zrm@trustiosity.com)
 by mx.trustiosity.com (Postfix) with ESMTPSA id BE09F42340B
 for <wireguard@lists.zx2c4.com>; Mon, 18 Feb 2019 22:01:13 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
 s=mx; t=1550545273; bh=diir4xzSGVil9YghIn2E6C1xDFsuHi8LlnfT3KBCckc=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=85nYmOb4NcZnMUu0Fbttv4SQuhy6+eoERHOECIRbqk3k+c39hi/uVgttDqq9UkGst
 FJCYtQeyFP8OYAUGudUPgl7AbYYFxTrvR5SafYNl2QEzs9Vv+cfJbJYVmVwfxQEMIZ
 sXkqP/tqLlzxWtdzQxiKW2NXQuyjxDM1XgR7fSn4=
Subject: Re: DNS name resolution should not be done during configuration
 parsing.
To: wireguard@lists.zx2c4.com
References: <8_iPFshR7GasRS24vRTFKp3pG-UGxQLluTaoZZeAO-UlYBTQ2nCHNlMniuKWz9tWpWPbbXS8Br3SxRpCjcruohwFw8PD83jko2lrf3E7hq4=@wieliczko.ninja>
 <CAJJxGdG2G+busk12y==dZOL2__+C1T6nQy+tGRJM=M65-SuZ5Q@mail.gmail.com>
 <CAH8yC8=2pjH3VbxaeJ-sTSnV64-KxKK3AHA7K_EEANX5_g02Mw@mail.gmail.com>
From: zrm <zrm@trustiosity.com>
Message-ID: <8f46738a-35bd-8d48-ab0a-aa0c9ed40e8d@trustiosity.com>
Date: Mon, 18 Feb 2019 22:01:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAH8yC8=2pjH3VbxaeJ-sTSnV64-KxKK3AHA7K_EEANX5_g02Mw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 19 Feb 2019 05:55:24 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 2/16/19 23:08, Jeffrey Walton wrote:
> On Sat, Feb 16, 2019 at 10:35 PM David Kerr <david@kerr.net> wrote:
>>
>> Erik, see here for a proposed fix.  No response from the WireGuard team yet.
>>
>> https://lists.zx2c4.com/pipermail/wireguard/2019-January/003842.html
>>
>> Recently I had a power outage and both my gateway and cable modem went offline. On power recovery both devices start up, but the gateway completes startup before the cable modem completes its protocol negotiations, so initially the external network (eth0) is not functional.  That comes online say one minute later and all is well.
>>
>> Except that all is not well.  Wireguard failed to start up because I have Endpoint=<a URL> instead of a IP address.  And because external interface is not live yet, DNS lookup fails and Wireguard does not gracefully handle it.  This is really important because Wireguard may be my only way into my local network.
>>
>> As work-around I replaced the URL with the IP address... but that is not a long term solution if the endpoint is not a static IP address.
>>
>> Wireguard needs to handle the situation where external network may not have stabilized at the time it starts up.  The above link proposed a fix.
> 
> Forgive my ignorance... Should init just retry the service start?
> Something like this (from Systemd):
> 
>      [Unit]
>      StartLimitInterval=360
>      StartLimitBurst=5
> 
> The statements above say to retry 5 times within 360 seconds.
> 
> Jeff

The issue is that the service shouldn't terminate over failure to 
resolve an individual endpoint.

Suppose name resolution fails because of a DNS failure rather than a 
network failure. If there are other endpoints configured by address that 
are still reachable, should we give up entirely and not even connect the 
ones that we can? What if one of the endpoints configured by IP address 
is the DNS server?

Pushing this onto init would imply something like separate unit files 
per endpoint, which may complicate things more than simplify them.

It seems like the conflict is that on the one hand, we want to resolve 
the name at connection time rather than configuration time, but on the 
other hand we don't want a DNS resolver in the kernel. How hard would it 
be to call out to a trivial userspace DNS client? This shouldn't be very 
performance sensitive, the results could be cached for the TTL which is 
typically hours or at least minutes.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
