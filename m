Return-Path: <SRS0=J4Yg=GQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2370C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Jan 2021 16:47:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E81D23441
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Jan 2021 16:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E81D23441
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed10e056;
	Wed, 13 Jan 2021 16:46:12 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [2a0c:4d80:42:2001::664])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ccd3189b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jan 2021 16:46:06 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1610556364; bh=S6e0ShpmjWWGIklNl4MCZxC57hcXza0hzKJ1KUueAmM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=wfTbvVbwrqKJZgm61M53rGOaqFw9AfUz/eZ2ai75jzGVajY1FWK5Cp8opy1g8pA7F
 ZNGEmUr7C+jrfymQ/HM6DUxuEpz+dIz6Sa0RsY4ino82xEODPUxHxtDS0YJTSE1D0g
 cIaUbmZ1wufdkX2dxQKWshzvZIPgt3koLiLzQM4Rf3mz01eV87B0Ql40x9WFOy27iY
 lFMjqAVXRENWJQFZ842cErb1nTxrFgUREs1d68Ue/YBjMCwouP5W8DhKpLbkR704em
 NcSehLlb7QFEh10//hPpXWmua0MQ2C3LmwCJblXbMM/pWgA7yybWTnByVBJ8CZMZwh
 t50LfOGQNhBrA==
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Julian Orth <ju.orth@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: network namespace wireguard routing [Was: Re: Userspace
 Networking Stack + WireGuard + Go]
In-Reply-To: <CAHmME9rbUbEZah0MDtdRXhUxMtOSrcdo4BCN1LY-iDtXUWHy5Q@mail.gmail.com>
References: <X/8aDfdkod+rCPqK@zx2c4.com>
 <33997a3d-591e-9aa3-92fe-a06a4d3c5b26@gmail.com>
 <CAHmME9rbUbEZah0MDtdRXhUxMtOSrcdo4BCN1LY-iDtXUWHy5Q@mail.gmail.com>
Date: Wed, 13 Jan 2021 17:46:03 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87v9c09450.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
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

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> In order to prevent this Go thread from being hijacked with Linux
> concerns, I've changed the Subject line of the email. Please keep
> follow ups in this thread rather than the other.
>
> Response is in line below:
>
> On Wed, Jan 13, 2021 at 5:26 PM Julian Orth <ju.orth@gmail.com> wrote:
>>
>> On 13/01/2021 17.04, Jason A. Donenfeld wrote:
>>
>>  > Even if you're unprivileged and want a WireGuard interface for just a
>>  > single application that's bound to the lifetime of that application,
>>  > you can still use WireGuard's normal kernel interface inside of a user
>>  > namespace + a network namespace, and get a private process-specific
>>  > WireGuard interface.
>>
>> That's what my patches from back in 2018 were trying to accomplish.
>> Unless I've missed something since, I do not see how what you're
>> describing would work.  Unless you also
>>
>> - create a TUN device in the network namespace
>> - add a default route through that TUN device
>> - manually route all traffic between the init network namespace and your
>>    network namespace.
>>
>> Is that what you meant or is there a simpler way?
>
> What I meant was:
>
> 1. User opens his shell and runs ./blah. That executes in the init
> namespace where all the physical interfaces are.
> 2. blah creates a wireguard interface.
> 3. blah creates a network namespace.
> 4. blah moves that wireguard interface into that network namespace.
> 5. blah calls `setns()` on one of its threads to use that network namespace.
>
> Thinking about this in more detail, I'm guessing you take issue with
> step #2? Since that actually might require privileges in the init
> namespace?

5. also requires CAP_SYS_ADMIN (and I think by extension, so does 3.,
and 4.). From 'man setns':

       Network, IPC, time, and UTS namespaces
              In order to reassociate itself with a new network, IPC,
              time, or UTS namespace, the caller must have the
              CAP_SYS_ADMIN capability both in its own user namespace
              and in the user namespace that owns the target namespace.

-Toke
