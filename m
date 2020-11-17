Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6673C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 20:41:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BADAA2225E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 20:41:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="MgM5nsMq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BADAA2225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=openvpn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13e1d9b8;
	Tue, 17 Nov 2020 20:36:29 +0000 (UTC)
Received: from smtp73.iad3a.emailsrvr.com (smtp73.iad3a.emailsrvr.com
 [173.203.187.73])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5d840afd
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 10:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openvpn.net;
 s=20170822-45nk5nwl; t=1605607660;
 bh=OoSt4zI/A55xd2DmFGEKW06kRreOILROaH9aCHdoT70=;
 h=To:From:Subject:Date:From;
 b=MgM5nsMqzl6NvYT70GkQLaNWEi3sv6HhVY8rhkLkqN81v03JT1oBZOuJ2UfFwEVr2
 fibYI7U9518Oi7nddW/kZVDex+x4jI0IZX3B5Kjx1oHVHupMKDN5cjk6CQnBtJMLiy
 uxayVsr7qFYgGoAprmv/CNMmsxuSOhMplBYvx0Eg=
X-Auth-ID: antonio@openvpn.net
Received: by smtp26.relay.iad3a.emailsrvr.com (Authenticated sender:
 antonio-AT-openvpn.net) with ESMTPSA id 8742A1A17; 
 Tue, 17 Nov 2020 05:07:38 -0500 (EST)
To: Ard Biesheuvel <ardb@kernel.org>, Antonio Quartulli <a@unstable.cc>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 wireguard@lists.zx2c4.com,
 "open list:BPF JIT for MIPS (32-BIT AND 64-BIT)" <netdev@vger.kernel.org>,
 keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Howells
 <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
References: <20201117021839.4146-1-a@unstable.cc>
 <CAMj1kXFxk31wtD3H8V0KbMd82UL_babEWpVTSkfqPpNjSqPNLA@mail.gmail.com>
 <5096882f-2b39-eafb-4901-0899783c5519@unstable.cc>
 <CAMj1kXGZATR7XyFb2SWiAxcBCUzXgvojvgR9fHczEu9zrpF9ug@mail.gmail.com>
From: Antonio Quartulli <antonio@openvpn.net>
Organization: OpenVPN Inc.
Subject: Re: [PATCH cryptodev] crypto: lib/chacha20poly1305 - allow users to
 specify 96bit nonce
Message-ID: <47819bd4-3bed-d7e5-523a-6ec5c70caad8@openvpn.net>
Date: Tue, 17 Nov 2020 11:06:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXGZATR7XyFb2SWiAxcBCUzXgvojvgR9fHczEu9zrpF9ug@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Classification-ID: 3c7d4df9-03f3-4138-8fe9-03b0ab2b7cbf-1-1
X-Mailman-Approved-At: Tue, 17 Nov 2020 21:36:28 +0100
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

On 17/11/2020 10:52, Ard Biesheuvel wrote:
> On Tue, 17 Nov 2020 at 10:47, Antonio Quartulli <a@unstable.cc> wrote:
>>
>> Hi,
>>
>>
>> On 17/11/2020 09:31, Ard Biesheuvel wrote:
>>> If you are going back to the drawing board with in-kernel acceleration
>>> for OpenVPN, I strongly suggest to:
>>> a) either stick to one implementation, and use the library interface,
>>> or use dynamic dispatch using the crypto API AEAD abstraction, which
>>> already implements 96-bit nonces for ChaCha20Poly1305,
>>
>> What we are implementing is a simple Data Channel Offload, which is
>> expected to be compatible with the current userspace implementation.
>> Therefore we don't want to change how encryption is performed.
>>
>> Using the crypto API AEAD abstraction will be my next move at this point.
>>
> 
> Aren't you already using that for gcm(aes) ?

Yes, correct. That's why I had no real objection to using it :-)

At first I was confused and I thought this new library interface was
"the preferred way" for using chacha20poly1305, therefore I went down
this path.

> 
>> I just find it a bit strange that an API of a well defined crypto schema
>> is implemented in a way that accommodates only some of its use cases.
>>
> 
> You mean the 64-bit nonce used by the library version of
> ChaCha20Poly1305? I agree that this is a bit unusual, but a library
> interface doesn't seem like the right abstraction for this in the
> first place, so I guess it is irrelevant.

Alright.

> 
>>
>> But I guess it's accepted that we will have to live with two APIs for a bit.
>>
>>
>>> b) consider using Aegis128 instead of AES-GCM or ChaChaPoly - it is
>>> one of the winners of the CAESAR competition, and on hardware that
>>> supports AES instructions, it is extremely efficient, and not
>>> encumbered by the same issues that make AES-GCM tricky to use.
>>>
>>> We might implement a library interface for Aegis128 if that is preferable.
>>
>> Thanks for the pointer!
>> I guess we will consider supporting Aegis128 once it gets standardized
>> (AFAIK it is not yet).
>>
> 
> It is. The CAESAR competition is over, and produced a suite of
> recommended algorithms, one of which is Aegis128 for the high
> performance use case. (Note that other variants of Aegis did not make
> it into the final recommendation)

oops, I was not up-to-date. Thanks again!
We'll definitely look into this soon.


Best Regards,

-- 
Antonio Quartulli
OpenVPN Inc.
