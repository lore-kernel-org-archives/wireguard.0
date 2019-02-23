Return-Path: <SRS0=Z7jZ=Q6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810ABC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Feb 2019 04:01:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87324206A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Feb 2019 04:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87324206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=notmail.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03500fc7;
	Sat, 23 Feb 2019 03:52:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4d0f320
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Feb 2019 03:52:16 +0000 (UTC)
Received: from black.cryptix.de (ipv6.cryptix.de [IPv6:2001:470:6d:eb9::222])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2296fd2d
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Feb 2019 03:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by black.cryptix.de (Postfix) with ESMTP id 83B67266E7E;
 Sat, 23 Feb 2019 05:01:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at black.cryptix.de
Received: from black.cryptix.de ([127.0.0.1])
 by localhost (black.cryptix.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id OleCgdG0VOYc; Sat, 23 Feb 2019 05:01:03 +0100 (CET)
Subject: Re: WG: Need for HW-clock independent timestamps
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <403fa228-40e5-cbe4-4135-15b71cf76553@cgws.de>
 <20180521112235.v2ksniasmd36kern@ghostArch.localdomain>
 <97874cad-ac60-5a88-a384-f036f9688668@cgws.de>
 <20180521123558.qemdunuwgr4u7gsj@ghostArch.localdomain>
 <8fc246f8-7662-2fd2-f6ee-93d6802a37f0@urlichs.de>
 <20180521145618.GA3199@wolff.to>
 <c1fb2c8b-12f1-7e98-8291-a63c1eb91682@urlichs.de>
 <20180522202537.GA18356@matrix-dream.net>
 <CAHmME9pMHC6jV6sAGvbyRpnKdYaRYUoBnfn1mOCks_uAi3coAQ@mail.gmail.com>
From: Axel Neumann <axel@notmail.org>
Openpgp: preference=signencrypt
Autocrypt: addr=axel@notmail.org; prefer-encrypt=mutual; keydata=
 mQENBFK98FMBCADDabzGxW2PDqTRlJ0q8c0LO1o1bHp7u0gQ3UMK8GsbTttvnXPExlFjm33Y
 2FQZZanHEdudOV139PA5BmyvqL4z0MtBmZ/8s0uS3rY3pclC64rQaMDDK4N72KG+8+W6uRjV
 8phz0ypvwGcS0qKXfWS8ryzPS3eMKIGE3Pv64+8jfyt1jWzPUfUEs3n+GO1yL0bD2Pl0ZO2P
 /fI1x0GfPTDE6rh5K3nsfKsBIgEsisrrwxFuEIlEXe1Krqvv7AZvJyNpIB81xcYz0jBXYgjK
 INPtfivx7tLConC8vPd6fZanozT5rRVjn/KgV1KEyS82c3nLMf3MW0goCvUTe/ZOPljTABEB
 AAG0HkF4ZWwgTmV1bWFubiA8bmV1bWFubkBjZ3dzLmRlPokBPgQTAQIAKAUCUr3wUwIbIwUJ
 CWYBgAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQJxtz0k0CrylZAAf/YqzbNiMA0fe0
 XHW9VENWpte3iojsZ1KY/4aBSgTbu0sKe94LoNDqIWvi1HzB+veP6zRAfd6124JXvWDfJORn
 y0/pyHbM9oV4g8usT6eDGc6Gngq0X3ilAijO8k17Y+13A6GS09b1w7VCJhf37Rc84jnpHNFr
 ol4fVAveV8kt56G1qIIiInaXY6OlybUPfeGkw6Af2alPT31+QKHjsogffJSfH9UMwtCxwUnz
 LUzArxo/5GGjy4NEBGVmiAmXTZG/Gzd39kTgxpXdSrZXbXnB5AZ99MpM1cnli88AWtn2ROsO
 rvNiHkXCrIWFZCqIETGYSoRb03LVsuF6fVtH6c5AQA==
Message-ID: <48ac1469-a8f3-7841-95c5-4d0610078d41@notmail.org>
Date: Sat, 23 Feb 2019 05:00:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
Mime-Version: 1.0
In-Reply-To: <CAHmME9pMHC6jV6sAGvbyRpnKdYaRYUoBnfn1mOCks_uAi3coAQ@mail.gmail.com>
Content-Language: en-US
Cc: neumann@cgws.de, Jann Horn <jannh@google.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I really appreciate the resumption.

Whatever mechanisms wireguard introduces to handle non-RTC devices with
limited flash-write cycles (which far most of the openWrt community
uses) would significantly ease the configuration of
every-even-ntp-traffic-secured networks.



Regarding
> Initiation of a wireguard
> tunnel for those devices would be: read last counter to variable X,
> increment last counter, store incremented counter to flash, tell
> wireguard to use X as basetime.

Do you mean update counter to flash for each peer for each handshake?
That may again result in a lot (10..100++ ???) of write cycles per day, no?

Otherwise, if done only once per overall wireguard initialization then
incrementing last counter by one would not be enough to ensure that
already used SQNs are not used again after a reboot.

Incrementing by e.g. 16000 (corresponding 16ms in real time) would allow
16k handshakes before the stored value had to be updated again.
Wireguard could even delay first handshake by 16ms to 100% ensure that
SQNs have never be used before.

Then, by setting system base time to stored counter value on wireguard
init, and
> choose a per-peer base
> time for the first handshake, and then simply increment that on each
> handshake
would be sufficient for our use case.

Just important that the peer base time used for all peers is always
given by the system base time when wireguard initialized (and NOT the
current time when the handshake is made).
Otherwise, an unexpected reboot of the system after >16ms may again lead
to re-used handshake SQNs.




On 04.02.19 15:56, Jason A. Donenfeld wrote:
> An update on this old thread:
> 
> The only requirement for the "timestamp" field is that it's
> monotonically increasing. I've been mulling over some improvements to
> the current situation of just sticking a nanosecond resolution
> timestamp in there raw, after discussing with Jann a few months ago
> and then with Ivan the last two days at FOSDEM.
> 
> First, it's quite trivial to whiten that by only allowing a resolution
> of 16 or so ms, which might mitigate various unrelated sidechannels
> that think they have an oracle in WireGuard.
> 
> Second, both Ivan and Jann have suggested that rather than always
> adding a fresh timestamp, we should instead choose a per-peer base
> time for the first handshake, and then simply increment that on each
> handshake (making sure that the stamp never exceeds the current time).
> While we're holding off on new features and nobs and whatnot until
> post kernel merge, this would then enable us to potentially add a
> specialized option for manually setting the base time. It would by
> default remain the time, as it is now, since that's almost always a
> reasonable decision. But for devices without an RTC and whose flash
> chips prohibit writing out a new timestamp once a second or minute or
> whatever, this would allow, instead, to just write out a counter once
> per boot, which is much more reasonable. Initiation of a wireguard
> tunnel for those devices would be: read last counter to variable X,
> increment last counter, store incremented counter to flash, tell
> wireguard to use X as basetime. I think this dance should handle a lot
> of the issues discussed in this thread.
> 
> Third, Ivan suggested that we actually add a blinding factor to the
> timestamps, simply by adding HASH(label||private||public) or similar
> to the stamp itself. I'll need to think carefully about the crypto
> before committing to anything, but this kind of transformation does
> not seem infeasible and might lessen a potential infoleak. A good
> idea, in other words.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
