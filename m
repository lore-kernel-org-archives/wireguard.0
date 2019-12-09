Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E40C00454
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 16:36:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA1FD2077B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 16:36:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="e5exDt5J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA1FD2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4509cce7;
	Mon, 9 Dec 2019 16:36:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b71affeb
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 16:36:09 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [IPv6:2a0c:4d80:42:2001::664])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1762f1c9
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 16:36:09 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1575909367; bh=r+Rx8MLw8sxzvfU95qxOzmqsemswIgeX3vuPUrpAlDE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=e5exDt5JZXoRscX/Rx34Edzikn3YnegkCC5Uaqo7uke5F7+TZpBPcEHIyN3cy9sq+
 e8nRhGazyNriDea67azmUN8Q4qcFK2NRwwAFxBCbs0aVyA6MjjaDTn6jJO8nA7fs9M
 8VojCeheZGq89h8n7N0EvjYcJmfKEp8bsOtfW5T4KfoK51dFxFemqePjAZme8V09vu
 Cpc3qROAoBpY45C6j8Q2cSpJyRwe2mOJ+WmV8IBAES5UiRuMB++95n+tZtYmJu6CJ3
 MGf86ioj7WpV/cmahvDe++L/oqZNytJUESkhFQWawgsava9ZR+DgP4dCUiljRDM6U7
 LkBglpcaMvAUw==
To: David Ahern <dsahern@gmail.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: organization of wireguard linux kernel repos moving forward
In-Reply-To: <8a5bdf0f-c7f8-4667-ecba-ecb671bea2e5@gmail.com>
References: <CAHmME9p1-5hQXv5QNqqHT+OBjn-vf16uAU2HtYcmwKMtLhnsTA@mail.gmail.com>
 <87d0cxlldu.fsf@toke.dk>
 <CAHmME9oUfp_1udMFNMpeXPeoa7aacdNp9Q31eKvoTBpu+G5rpQ@mail.gmail.com>
 <8a5bdf0f-c7f8-4667-ecba-ecb671bea2e5@gmail.com>
Date: Mon, 09 Dec 2019 17:36:07 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <875zipihhk.fsf@toke.dk>
MIME-Version: 1.0
Cc: Stephen Hemminger <stephen@networkplumber.org>,
 Netdev <netdev@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

David Ahern <dsahern@gmail.com> writes:

> On 12/9/19 5:49 AM, Jason A. Donenfeld wrote:
>> I'd definitely be interested in this. Back in 2015, that was the plan.
>> Then it took a long time to get to where we are now, and since then
>> wg(8) has really evolved into its own useful thing. The easiest thing
>> would be to move wg(8) wholesale into iproute2 like you suggested;
>> that'd allow people to continue using their infrastructure and whatnot
>> they've used for a long time now. A more nuanced approach would be
>> coming up with a _parallel_ iproute2 tool with mostly the same syntax
>> as wg(8) but as a subcommand of ip(8). Originally the latter appealed
>> to me, but at this point maybe the former is better after all. I
>> suppose something to consider is that wg(8) is actually a
>> cross-platform tool now, with a unified syntax across a whole bunch of
>> operating systems. But it's also just boring C.
>
> If wg is to move into iproute2, it needs to align with the other
> commands and leverage the generic facilities where possible. ie., any
> functionality that overlaps with existing iproute2 code to be converted
> to use iproute2 code.

Thought that might be the case :)

That means a re-implementation, then. In which case the question becomes
whether it's better to do it as an 'ip' subcommand (or even just new
parameters to 'ip link'), or a new top-level utility striving for
compatibility with 'wg'. But that's mostly a UI issue...

-Toke
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
