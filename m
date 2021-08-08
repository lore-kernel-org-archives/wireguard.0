Return-Path: <SRS0=nfW+=NA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC5C4C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Aug 2021 00:04:08 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8545360F42
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Aug 2021 00:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8545360F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cupdev.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83b589f8;
	Mon, 9 Aug 2021 00:04:05 +0000 (UTC)
Received: from cupdev.net (cupdev.net [2a01:4f9:2a:1861::4464:12])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d96eefe5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Aug 2021 23:19:01 +0000 (UTC)
To: wireguard@lists.zx2c4.com
References: <CAHmME9q_9frZ+EQ4_sq_aEoFn3sU01LcW25RysWj0mas4po47Q@mail.gmail.com>
From: Karolin Varner <karo@cupdev.net>
Cc: noise@moderncrypto.org, labo@labo.rs
Subject: Re: another thread on montonic counter alternatives
Message-ID: <6cd87006-902a-3411-4928-67ec5d1f77e2@cupdev.net>
Date: Mon, 9 Aug 2021 01:18:59 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9q_9frZ+EQ4_sq_aEoFn3sU01LcW25RysWj0mas4po47Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 09 Aug 2021 00:04:04 +0000
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

Good evening,

I can see this has been copiously discussed…

On 8/9/21 12:33 AM, Jason A. Donenfeld wrote:
> Angle 2 presents some interesting possibilities. An adversary who sets
> somebody's time backwards can prevent them from connecting until their
> time is set right again. Adversaries who set somebody's time forward,
> say, to the maximum TAI64N value, and then subsequently have an
> initiator send an initiation message, can then render that initiator's
> static private key forever useless, since that future timestamp can
> always be replayed, and will always set the responder's greatest-yet
> value to that maximum. So, if your NTP is hijacked, your key is
> forever DoS'd.

In my view this presents a major problem. I don't have data on this, but I think this is a common setup.
Mine was vulnerable and if you didn't take care to prevent this yours is probably too.

At the very least there should be a bold, red warning on the webpage "do not use WG with NTP".

> Other clever ideas?

0) Just send the value of tsmax to the peer? This basically surmounts to falling back to fully interactive but is a minimal change?
1) Pick a random time stamp/a time stamp based on the peers `MAC(cookie_secret, IP | Port)` and accept that for a single time only. This also basically surmounts to an interactive handshake with minimal changes.

Is changing the protocol an option? Two options for that:

2) Fall back to an interactive handshake using cookies. Define a protocol version two, mandate that in V2 the cookie must be mixed into the handshake hash. Assign a cookie in case of timestamp failure.
3) Use a stateless responder; forego the timestamp entirely. Instead of storing the handshake state (ck, h, eskr) locally, they could be encrypted with a random key and included in the second message. This way, there is no responder state an attacker could interrupt.

2) is 1-RTT in the normal case and 2-RTT with the attack agains the counter. 3) is always 1-RTT and always interactive but requires a response for replayed old handshakes.

Jason pointed out, that it would be preferable to use a Noise-XK handshake which is a standard fully-interactive handshake but 1.5-RTT. I was assuming 1-RTT-ness was a necessity.
Of course, coming up with a new handshake is…generally foolish and even though both my proposal technially fit into the noise-IK pattern, noise-XK certainly is more trustworthy.

Noise XK could also be used as a fallback only, but this would considerably increase complexity.

As far as mitigations go:

a) Do not drop handshake state after three minutes, just ratchet the key `MixKey(empty)` so the attack can not disrupt active sessions.
b) Jason's angle 4 but with a flag. A command line switch "interpret counter as timestamp and reject timestamps off by more than 20m".

Best,
Karolin
