Return-Path: <SRS0=wOns=UK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1E1C31E44
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Jun 2019 21:41:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FBAA20665
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Jun 2019 21:41:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZ2hTt5g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FBAA20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e76289b2;
	Tue, 11 Jun 2019 21:41:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97e9eee5
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jun 2019 21:41:54 +0000 (UTC)
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2fb76e2d
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jun 2019 21:41:51 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id s21so13179082lji.8
 for <wireguard@lists.zx2c4.com>; Tue, 11 Jun 2019 14:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CREMohdGyJgidf2q+oIA9Xv+ZVu9xS4OPuppqVEH6h0=;
 b=HZ2hTt5giphGvbO3RhPSAJfg9BAsUg5/JkmApvPeheuAGhIkhAwGbx612NRwLxQFYl
 p/RGhqpcJOPd0VUH0/+krg9wZgz3HbOnSt7R75OGpPg0xy2pF/sL7lXsUvcBnpgCjI50
 8p+BFeMNYMRdFKY8+6OdS5bOfOvIg0xSmmKOGHz3ONBxZVQHUmCMRWpgpw5lgO7y6+Jv
 dOsciyAs3rz3FOQ30tHnyM0PTLPmmV71v+/oMG92/HLMbVH7CZmUBpg3eDP0lPbufj67
 Ce09C+Tw8AUKIcgNM+9SbK4cVZJM65ngyRrWl9A8JmRNoCqBBgU34cQzNQQyOpmExtZ7
 J4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CREMohdGyJgidf2q+oIA9Xv+ZVu9xS4OPuppqVEH6h0=;
 b=kJj0d0fRBDOMq6CCU3yZt/gV6Q3XN+UoRlmv7W5RnOOn+ciM39yAZ+9h8WsPwJ5mNS
 2J4Ojknq42wwt49bBNMaoQiX3/+vrou3qNOUYBPAncIVXWzXQLziJZYD/seGxVRxKcGm
 6re5pgr/fXZ/pBtBZT1IIc6bzKDHJkTI80xzogU+0+NiGy/C/0RGfGrIyw3erYtzEqkq
 cF9ZggN4TPXMzB9ftNoJTQ+A3ODxQQCefIc8/KmoaWxCmQz6FajTijpa/6Fz2nkmLykc
 lCr4+SuZhFq/dTL1bWKKcMxLusxVq+b63kIDZQKpBROKWuCYMacxLwPEa0+tYWGy/NUc
 bpIw==
X-Gm-Message-State: APjAAAUF5COq5MIkZkGO5EqpvyLCJmiXgFPR7yP6Yp1zQovgO4/gDLSL
 nCcva+6nD6da0eYXphHDGDkGqGGlBMqgGP6xk2xKijr87jM=
X-Google-Smtp-Source: APXvYqwr5QO2pGMqxAHIu4w3ahxE/o7f3tsY1G8dfv5Fvrr3Sfd2qlPKE0Vgjp36C6saHWm2jYCO6CbbrZWggwjp7sw=
X-Received: by 2002:a2e:9ad1:: with SMTP id p17mr10128410ljj.34.1560289310211; 
 Tue, 11 Jun 2019 14:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <6BFBD58C-ACC2-45FD-9986-63CEA1143BA6@lonnie.abelbeck.com>
 <CAHmME9r3QVVWRu=36Yx6wmfuHm5CCA3Dg+JdZknpnNAmnj=ATQ@mail.gmail.com>
 <F0312C89-85A4-4D69-9B94-A970A4681616@lonnie.abelbeck.com>
In-Reply-To: <F0312C89-85A4-4D69-9B94-A970A4681616@lonnie.abelbeck.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Tue, 11 Jun 2019 23:41:38 +0200
Message-ID: <CAKXLc7ci2nr+x7Xg_s0zZ66rDJXdsEjY55YVqG_O5=vPb5GNow@mail.gmail.com>
Subject: Re: RFC: wg syncpeers wg0 wireguard.conf
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
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

On Tue, Jun 11, 2019 at 11:08 PM Lonnie Abelbeck
<lists@lonnie.abelbeck.com> wrote:
> > On Jun 11, 2019, at 12:28 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > One of the things that always goes wrong with "sync" algorithms in
> > software -- and the commit above at the moment is no exception -- is
> > that they're kind of racey. In order to synchronize, we have to read
> > the current state, compare it, and then set our new state. But in
> > between, the state could have changed out from underneath us. One
> > strategy for this is to just do nothing and put some notice in the man
> > page. Another strategy is to read back the result at the end, compare
> > it, and loop like this until we reach the stable state. This then
> > requires implementing some equality function.
>
> If "wg" does not offer "syncconf", users will be hacking together their own sync solution and it will no doubt be more racey than your tight code.
>
+1

> > The other thing I was wondering is: aside from performance and races
> > as described above, why not just make this the functionality of
> > `setconf`? Then there's be no need to introduce a new subcommand. In
> > otherwords, the idea would be to make `setconf` not destroy existing
> > peers if we're going to be re-adding them again.
>
> I vote to keep "setconf" as is, with the addition of the "syncconf" subcommand.
> This keeps "setconf" faster, and unchanged, typically used for initial configuration.
> Then "syncconf" would typically be used for followup live updates.
>
I guess you've seen Cisco (an other) network devices having running
and the startup config. I think this is quite similar idea here.
While I understand the need to sync, looking at the code it is more of
an `updateconf` (i.e. file -> memory) operation, while I'd expect sync
to be 2-way sync where startup/saved/disk/file/whatever config is
equal to the running/current/memory/state/whatever config by some
automagic algorithm.

Looking from a high place, a bit tired and before going to bed, these
are my thoughts:

AFAIR, the way to save config is `wg showconf wg0 >wg0.conf` (running
-> startup)...
Then why is `wg setconf` requiring a file, i.e. why not `wg setconf
wg0 <wg0.conf` ??  (to be able to use easily sudo?) If nothing
special, I'd rather see `wg setconf` read from STDIN.
We have also `wg addconf` ... hmm

I'd suggest drop addconf altogether and rename the proposed syncconf
to `updateconf` (other software uses reload, but it is not clear in
this usecase).
Do we need the reverse of `wg setconf` without the redirect like `wg
saveconf wg0 wg0.conf` ? I don't think so.
Yes, I am sure it "will break userspace", but it is better to do it
now than later.

Cheers,
Kalin.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
