Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582B0606A321
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Nov 2026 19:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=posixcafe.org header.i=@posixcafe.org header.a=rsa-sha256 header.s=20200506 header.b=FaZdWtbQ
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a7db641f;
	Tue, 10 Nov 2026 19:41:54 +0000 (UTC)
Received: from mail.posixcafe.org (mail.posixcafe.org [45.76.19.58])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c4834c61
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2026 19:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posixcafe.org;
 s=20200506; t=1794339676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1O69ONJd5Z/4OFCDy0UhO/+fDgUUsUxm7O9/NP7y++4=;
 b=FaZdWtbQp2nwDPSCKgdeVwOga+4BIamCfpZf9MqqBA5ngLYYgN2gXWu1QlaVbeAjp9DrcR
 SLD3BZhpd4YGnF8+OZGIWaOI4xjeoYCgiwGjWatLBG5wfEl6EI+uobOZkwQr8GaWMf6NmS
 C80PKK13vJgVfMSXwqfythUl+FJC4qU=
Received: from [192.168.168.98] (173-26-212-115.client.mchsi.com
 [173.26.212.115])
 by mail.posixcafe.org (OpenSMTPD) with ESMTPSA id 385c3c38
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 10 Nov 2026 13:41:16 -0600 (CST)
Message-ID: <387aaf4c-6c36-4608-a1c1-4ba4672170e2@posixcafe.org>
Date: Tue, 10 Nov 2026 13:41:48 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implementation for the 9front operating system
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
References: <0ab57e49-8904-4e4b-bc3a-38e10b214ab3@posixcafe.org>
 <avNDEWFqlEfq1e6Y@zx2c4.com>
Content-Language: en-US
From: Jacob Moody <moody@posixcafe.org>
Autocrypt: addr=moody@posixcafe.org; keydata=
 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
 kA7wyn9tHMM41bDH8w==
In-Reply-To: <avNDEWFqlEfq1e6Y@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/26 10:15, Jason A. Donenfeld wrote:
> Hi Moody,
> 
> On Tue, Aug 04, 2026 at 04:08:07PM -0500, Jacob Moody wrote:
>> All,
>>
>> I've been working on an implementation of wireguard for 9front.
>> I am starting to get to the point where I feel like the implementation is getting
>> pretty close, and its in a good spot to review before I do some tighter integration into 9front.
>>
>> I know in the past I've seen some desire from the wg community to ensure that code using the wireguard
>> name at least be somewhat decent. So I wanted to share it here and get feedback if people felt inclined.
>>
>> Grab the code from your choice of git hosts:
>> 	git://shithub.us/moody/wg
>> 	https://github.com/majiru/wg
>>
>> I am happy to answer any questions regarding plan 9/9front specifics.
>>
>> One note is that there's some stubs right now, the dynamic runtime addition
>> and subtraction of peers, and likewise the condition under which we send
>> cookie's is not implemented, that's pending the more tighter integration.
> 
> Cool project! Would be happy to look at it together at some point. Let
> me know when you feel like it's "complete" and matches the various
> semantics of the Linux implementation, and then maybe we can do a
> read through together. I've always wanted to learn more about 9front.
> 
Thanks! Very excited to get some more eyes on it. I can give this thread a ping
when I feel its at a more complete state.

I don't anticipate the flow of the code to change too much, but for a rough idea of
what remains:

- Integration into our key storage file system (auth/factotum), I have a protocol for this
  sketched out but need to finish and implement it with the existing code.
- Figure out a way to provide changes in peers at runtime. Plan 9 has no ioctl's or something
  similar, so perhaps the wg code exposes a filesystem for modifications, still undecided.

Another thing, I could be misremembering (I got nerd sniped to go look at some other things), but
I believe the portable implementation gets some sort of peek into the UDP queue to determine if we
should start sending cookies/PoW challenges. We currently do not have this sort of information from
userspace in 9front, my best semantic equivalence was to count auth_rpc (to auth/factotum) in flight.
For this implementation that is likely the thing to "guard against", but I understand this is a slight
departure.

Also curious, is there some further reading/discussion for cases in which an initiator sends a PoW challenge
back to a responder? I understand that the P2P nature and potential role-switching makes the individual role
of an endpoint fluid over a long enough time frame, however I'd like to understand a bit more.

Cheers,
Moody

