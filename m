Return-Path: <SRS0=wOns=UK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EA5C31E44
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Jun 2019 21:07:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF3CD207E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Jun 2019 21:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF3CD207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82190563;
	Tue, 11 Jun 2019 21:06:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a6ea4e2
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jun 2019 21:06:53 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15111610
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jun 2019 21:06:52 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 70B9B1E302B;
 Tue, 11 Jun 2019 17:06:52 -0400 (EDT)
Received: from macpro.priv.abelbeck.com (wsip-70-184-211-81.om.om.cox.net
 [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id EE3721E3005;
 Tue, 11 Jun 2019 17:06:51 -0400 (EDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: RFC: wg syncpeers wg0 wireguard.conf
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CAHmME9r3QVVWRu=36Yx6wmfuHm5CCA3Dg+JdZknpnNAmnj=ATQ@mail.gmail.com>
Date: Tue, 11 Jun 2019 16:06:50 -0500
Message-Id: <F0312C89-85A4-4D69-9B94-A970A4681616@lonnie.abelbeck.com>
References: <6BFBD58C-ACC2-45FD-9986-63CEA1143BA6@lonnie.abelbeck.com>
 <CAHmME9r3QVVWRu=36Yx6wmfuHm5CCA3Dg+JdZknpnNAmnj=ATQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3445.104.11)
Cc: Luis Ressel <aranea@aixah.de>,
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



> On Jun 11, 2019, at 12:28 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> 
> I gave it a stab in this branch:
> https://git.zx2c4.com/WireGuard/commit/?h=jd/syncconf Try it out and
> let me know if it does what you had in mind?

Hi Jason,
This is *exactly* what I had in mind !  Impressive how little code it took you to add "syncconf", very elegant.

I spent over an hour testing this, trying to break it ... worked perfectly.  Active peers don't miss a beat and retain their counters.


> One of the things that always goes wrong with "sync" algorithms in
> software -- and the commit above at the moment is no exception -- is
> that they're kind of racey. In order to synchronize, we have to read
> the current state, compare it, and then set our new state. But in
> between, the state could have changed out from underneath us. One
> strategy for this is to just do nothing and put some notice in the man
> page. Another strategy is to read back the result at the end, compare
> it, and loop like this until we reach the stable state. This then
> requires implementing some equality function.

If "wg" does not offer "syncconf", users will be hacking together their own sync solution and it will no doubt be more racey than your tight code.

Just a simple mention in the man page stating something like:
Warning: unexpected results may occur with simultaneous background configuration changes during 'wg syncconf'

Possibly also add a hint on the command help... "(assume no background configuration changes)"
--
  syncconf: Synchronizes a configuration file to a WireGuard interface (assume no background configuration changes)
--


> The other thing I was wondering is: aside from performance and races
> as described above, why not just make this the functionality of
> `setconf`? Then there's be no need to introduce a new subcommand. In
> otherwords, the idea would be to make `setconf` not destroy existing
> peers if we're going to be re-adding them again.

I vote to keep "setconf" as is, with the addition of the "syncconf" subcommand.

This keeps "setconf" faster, and unchanged, typically used for initial configuration.

Then "syncconf" would typically be used for followup live updates.

Thanks again Jason!  Please merge syncconf -> master

Lonnie


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
