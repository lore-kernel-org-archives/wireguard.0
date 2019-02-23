Return-Path: <SRS0=Z7jZ=Q6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E636C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Feb 2019 12:35:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF1DB20850
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Feb 2019 12:35:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF1DB20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e15d35c5;
	Sat, 23 Feb 2019 12:26:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 403cee1b
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Feb 2019 12:25:58 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net
 [IPv6:2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc3c41bc
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Feb 2019 12:25:58 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.91)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1gxWWC-0000wO-Oc; Sat, 23 Feb 2019 12:35:00 +0000
Date: Sat, 23 Feb 2019 12:35:00 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: Axel Neumann <axel@notmail.org>
Subject: Re: WG: Need for HW-clock independent timestamps
Message-ID: <20190223123500.GA3305@matrix-dream.net>
References: <403fa228-40e5-cbe4-4135-15b71cf76553@cgws.de>
 <20180521112235.v2ksniasmd36kern@ghostArch.localdomain>
 <97874cad-ac60-5a88-a384-f036f9688668@cgws.de>
 <20180521123558.qemdunuwgr4u7gsj@ghostArch.localdomain>
 <8fc246f8-7662-2fd2-f6ee-93d6802a37f0@urlichs.de>
 <20180521145618.GA3199@wolff.to>
 <c1fb2c8b-12f1-7e98-8291-a63c1eb91682@urlichs.de>
 <20180522202537.GA18356@matrix-dream.net>
 <CAHmME9pMHC6jV6sAGvbyRpnKdYaRYUoBnfn1mOCks_uAi3coAQ@mail.gmail.com>
 <48ac1469-a8f3-7841-95c5-4d0610078d41@notmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48ac1469-a8f3-7841-95c5-4d0610078d41@notmail.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: neumann@cgws.de, WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Jann Horn <jannh@google.com>
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

Hi,

On Sat, Feb 23, 2019 at 05:00:57AM +0100, Axel Neumann wrote:
> ..
> Regarding
> > Initiation of a wireguard
> > tunnel for those devices would be: read last counter to variable X,
> > increment last counter, store incremented counter to flash, tell
> > wireguard to use X as basetime.
> 
> Do you mean update counter to flash for each peer for each handshake?
> That may again result in a lot (10..100++ ???) of write cycles per day, no?
> ..
> Incrementing by e.g. 16000 (corresponding 16ms in real time) would allow
> 16k handshakes before the stored value had to be updated again.

You've got the right idea. Counter is a 12-byte (96-bit) number,
which is quite big. Increase it enough and you won't go past
your next initialization number in a sufficiently long time,
or more precisely number of handshakes.

You could periodically increase and save the counter each hour or day,
100 years or whatever, or just increase it enough so you don't need
periodic updates. Just remember to store your next initialization
number before using the current one so you won't end up using expired
numbers.

> Wireguard could even delay first handshake by 16ms to 100% ensure that
> SQNs have never be used before.
> 
> Then, by setting system base time to stored counter value on wireguard
> init, and
> > choose a per-peer base
> > time for the first handshake, and then simply increment that on each
> > handshake
> would be sufficient for our use case.
> 
> Just important that the peer base time used for all peers is always
> given by the system base time when wireguard initialized (and NOT the
> current time when the handshake is made).
> Otherwise, an unexpected reboot of the system after >16ms may again lead
> to re-used handshake SQNs.

I guess you could rig something up via system time with current
wireguard API, but it's not nice to devices that do things other
than wireguard tunneling and it would have lots of corner cases.
Adding a wireguard set-counter API should be clearer and much
simpler to use.

Regards,
Ivan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
