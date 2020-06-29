Return-Path: <SRS0=JnmV=AK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3896EC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 19:59:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAC2B206F1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 19:59:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OddpcXR0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAC2B206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 088876fb;
	Mon, 29 Jun 2020 19:39:56 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 66224eea
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jun 2020 19:39:54 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id g2so9910839lfb.0
 for <wireguard@lists.zx2c4.com>; Mon, 29 Jun 2020 12:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2xfb02WRhN0yltTVnANavSVb6P5o/ah1IHhHDE9NeA4=;
 b=OddpcXR01FZJH/lEkk6+rhJl9EJIiA3qO8vo8VWF2wOb/xC/94Oqt138Nd/QEiZOiK
 GDkUf+xZS3nHiHnyYExHwT1OquZrXwRGctWezvGEwaph1YvBq4ftuREjSVkO2BbS8cb+
 LEpHNQJGCCR+2xIZ38Eo/6ZYTl72vG51L3TU6JPrLzoGGd+v1Hwll4ydODhp0JbQUamC
 Z39JZVrc0OhdGja3O3juzH7hYK6NNBWIant4HvfWL9R6fK+YYdXCsoOVFVviM3+TQ9h8
 k6hNchcAdZsiPQgos+IHQSom3XcmCpKhdpIxIgZ9nkxIcTo41s7vhf0rgMM3ja8j+ovN
 SB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2xfb02WRhN0yltTVnANavSVb6P5o/ah1IHhHDE9NeA4=;
 b=O/PhxVkEb1MeagKLbu8inNlimbOv2k9zetPXvNXZI9Uw9rDH/vjk+Yp0bZIGcfIM8y
 jFJefp0fIYc7dc6ylW7UQfn5wDDdmjAYJbkQh+lSiqb0QoenoaZcWI30zq2lHg01NgPm
 BdZSaX8hY6CF/OCSa3QT0IN9V56iqUwlQB1Yl36oqlHgYtXv7vXGE2Iw+9yb0kQ86Mmt
 GDx9TnqXjPjGJpJSi3vN+jwPc2UZZj5JpT1hvFeSEPGHntNcfUfMze/G6hDRzFGjmbLr
 yTK/onsg/XB2Ze/2kULuyBB6dXVXY086GZpTGBBmVaQGftSztOyKDTXHrpIGoZIl8qu+
 tnRw==
X-Gm-Message-State: AOAM531XvOuoOxwzHBUGBIQaX1ob/wJxIymFOUFT/E2vu1qQ27N0Vztl
 NALoEnOm93sD9UAcKf6PUjEQI3aVax4X+fRgAmu4EF0T
X-Google-Smtp-Source: ABdhPJxGgasWcTZYO21gxpL0i1fVC+kyfgJZmq2ZKitgvjbbuKNNOO9PrzuwpOUUtjp9vwt9lqU2TwyUleV7OJEpyTc=
X-Received: by 2002:a19:c50a:: with SMTP id w10mr10239744lfe.48.1593460774089; 
 Mon, 29 Jun 2020 12:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
 <20171205035352.01ffe1f5@vega.skynet.aixah.de>
 <CAHmME9ouUNV4pc7qwr4bO-5bEecFc1U64PF13ExgmYnH9q45tw@mail.gmail.com>
 <20200624153706.3yngzzslepqh7q54@ws.flokli.de>
 <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
 <CAMaqUZ0nTL9mbYEifHP-sc8kQ6ehAOOWfmEb7ARNfZWWDkv4eA@mail.gmail.com>
 <875zbai32e.fsf@toke.dk> <20200629153118.4d72f447@natsu>
 <87r1tygmlv.fsf@toke.dk>
 <20200629163851.41d6d755@natsu> <87lfk6gjax.fsf@toke.dk>
 <910f09eb8b67bef5cc55114fe1b0bd6297ea2ec4.camel@gmail.com>
 <CAHmME9rsiejKsNw9Wq6noNPf46m=2eYu9o4e0EHj_=ek5phZig@mail.gmail.com>
In-Reply-To: <CAHmME9rsiejKsNw9Wq6noNPf46m=2eYu9o4e0EHj_=ek5phZig@mail.gmail.com>
From: Reid Rankin <reidrankin@gmail.com>
Date: Mon, 29 Jun 2020 15:58:57 -0400
Message-ID: <CAMaqUZ1TkemV7Ocvx+VzHUbOJeEx_L4tVTPLzbzS4hzBu7TXaQ@mail.gmail.com>
Subject: Re: Standardized IPv6 ULA from PublicKey
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, 
 Roman Mamedov <rm@romanrm.net>, ch@ntrv.dk, Arti Zirk <arti.zirk@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

> 2. There is very little practical utility. In WireGuard, both sides
> must _already_ preshare their public keys, and there's no way around
> this.

Well, it looks like you've discovered the method behind my madness!
Specifically, while a handshake *initiator* must know the public key
of the responder it's trying to talk to, the *responder* doesn't need
to know anything about the initiator ahead of time -- because the
initiator's public key is right there in the handshake. In my usecase,
I examine incoming handshake requests in a userspace daemon via
nfqueue. The daemon knows the interface private key, so it can also
see the initiator's public key, and if it's a new peer the daemon adds
it via `wg set` -- with only the calculated LLA in the `AllowedIPs`
list -- before releasing the handshake request for delivery. The
newly-minted peer can then send a certificate via TFTP (a very simple,
DoS-resistant protocol) to the responder's LLA, which convinces the
responder to add additional stuff to the initiator's `AllowedIPs`
list. Because this bootstrap process occurs within the tunnel,
integrity and confidentiality protection are already assured -- and
WireGuard is already ensuring that the node with the initiator's LLA
possesses the initiator's private key.

Now, I'm not recommending this specific scheme generally, but it goes
to show that there is indeed a benefit to calculating an LLA via a
hash -- it allows you to move an out-of-band authentication ceremony
in-band. Maybe you're not using my fancy nfqueue setup to pull out
public keys from handshakes -- you could just have a web server with a
POST handler that takes unknown public keys and adds them as peers.
You're not trusting anything by doing this if you're using a hashed
LLA, and then you could proceed to chat inside the tunnel to run
whatever authentication scheme you'd like. But if you're taking both a
public key and an arbitrary LLA as input, you're going to have to
trust the assertion that that specific public key should be assigned
that specific address. To do that, you'll need to verify both that the
owner of the public key indeed wants that LLA (what if the request was
forged?) and that the owner of the key is authorized to use that LLA
(what if they're trying to steal or squat on someone else's address?),
and you'll have to do both of those things out-of-band -- because
until you settle on addressing you can't even talk to each other
inside the tunnel.

Anyhow, my point is that pre-sharing public keys might be easy, but
sharing *relationships* between public keys and addresses is a whole
different ball of wax, requiring at least an integrity-protected
transport -- which would be a shame to have to do out-of-band, since
we've already got one of those.

--Reid
