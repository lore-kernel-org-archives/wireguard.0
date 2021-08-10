Return-Path: <SRS0=EM+o=NB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95E8C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Aug 2021 07:53:49 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B597F60F11
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Aug 2021 07:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B597F60F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cupdev.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fda676e;
	Tue, 10 Aug 2021 07:53:46 +0000 (UTC)
Received: from cupdev.net (cupdev.net [2a01:4f9:2a:1861::4464:12])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7a0ee27f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Aug 2021 07:53:43 +0000 (UTC)
To: Trevor Perrin <trevp@trevp.net>
References: <CAHmME9q_9frZ+EQ4_sq_aEoFn3sU01LcW25RysWj0mas4po47Q@mail.gmail.com>
 <6cd87006-902a-3411-4928-67ec5d1f77e2@cupdev.net>
 <CAGZ8ZG1wU=A4Yu0v7938pRL2d1p+Gj_Mh8+9=sdA-ScHZiYVTQ@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com, noise <noise@moderncrypto.org>, labo@labo.rs
From: Karolin Varner <karo@cupdev.net>
Subject: Re: another thread on montonic counter alternatives
Message-ID: <4aea0fd6-a37e-3cf5-8df8-79ef119adff6@cupdev.net>
Date: Tue, 10 Aug 2021 09:53:40 +0200
MIME-Version: 1.0
In-Reply-To: <CAGZ8ZG1wU=A4Yu0v7938pRL2d1p+Gj_Mh8+9=sdA-ScHZiYVTQ@mail.gmail.com>
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

On 8/10/21 2:09 AM, Trevor Perrin wrote:
> On Sun, Aug 8, 2021 at 5:04 PM Karolin Varner <karo@cupdev.net> wrote:
>>
>> 2) Fall back to an interactive handshake using cookies. Define a protocol version two, mandate that in V2 the cookie must be mixed into the handshake hash. Assign a cookie in case of timestamp failure.
> 
> That could be deployed in a backwards-compatible way, I think?  If the
> client's V1 handshake is rejected due to an old timestamp, the client
> is given the cookie which enables it to do the V2 handshake?

Yes!
I was thinking InitHello with a flag set in the reserved bytes, peer responds with cookie and a compatibility flag set as well.
The flag would be ignored by legacy responders, these would also respond with the flag set to zero in cookie replies so the initiator knows not to use V2 when resending InitHello with a cookie.
Peers generating messages without a cookie should skip the cookie mixing step (not mix {0}^n) so the message can be processed by legacy peers and modern ones alike.

There may be non-standard implementations which assert the reserved bytes to be {0}^3,
so sending a one-time-counter using an entirely new packet type might be even more compatible. Such a message would be entirely ignored by all but the worst implementations.

Karolin
