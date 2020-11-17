Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BB1C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 09:42:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AC6A206B2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 09:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AC6A206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unstable.cc
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 753906ad;
	Tue, 17 Nov 2020 09:37:51 +0000 (UTC)
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5052b2cb
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 09:37:49 +0000 (UTC)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, keyrings@vger.kernel.org,
 linux-security-module <linux-security-module@vger.kernel.org>,
 Antonio Quartulli <antonio@openvpn.net>,
 Herbert Xu <herbert@gondor.apana.org.au>, David Howells
 <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
References: <20201117021839.4146-1-a@unstable.cc>
 <CAHmME9q8k26a9rn72KTfcJw0kJ0iMdob6BBsAsyYBzvfYjRtQQ@mail.gmail.com>
From: Antonio Quartulli <a@unstable.cc>
Subject: Re: [PATCH cryptodev] crypto: lib/chacha20poly1305 - allow users to
 specify 96bit nonce
Message-ID: <69c23c36-60fe-2676-d07a-67ce1f752dd1@unstable.cc>
Date: Tue, 17 Nov 2020 10:41:10 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9q8k26a9rn72KTfcJw0kJ0iMdob6BBsAsyYBzvfYjRtQQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Hello,

On 17/11/2020 09:30, Jason A. Donenfeld wrote:
> Nack.
> 
> This API is meant to take simple integers, so that programmers can use
> atomic64_t with it and have safe nonces. I'm also interested in
> preserving the API's ability to safely encrypt more than 4 gigs of
> data at once. Passing a buffer also encourages people to use
> randomized nonces, which isn't really safe. Finally, there are no
> in-tree users of 96bit nonces for this interface. If you're after a
> cornucopia of compatibility primitives, the ipsec stuff might be more
> to your fitting. Or, add a new simple function/api. But adding
> complexity to users of the existing one and confusing future users of
> it is a non-starter. It's supposed to be deliberately non-awful to
> use.
> 

Thanks for explaining the ratio behind this API.

At first I thought this API wanted to take over the existing one, hence
my attempt of making it more generic and re-use it.
But I understand now this was not the goal.

I will stick to the classic crypto API then.

Best Regards,


p.s. I am curious about any use case you may have in mind for encrypting
more than 4GB in one go, as there are no users doing that right now.

-- 
Antonio Quartulli
