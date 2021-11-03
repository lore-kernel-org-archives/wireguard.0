Return-Path: <SRS0=+otM=PW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497E0C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 18:24:07 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6438260F5A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 18:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6438260F5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=freebsd.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac8f6983;
	Wed, 3 Nov 2021 18:24:04 +0000 (UTC)
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 623c2f99
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Nov 2021 16:39:31 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id CB14D7C309
 for <wireguard@lists.zx2c4.com>; Wed,  3 Nov 2021 16:39:30 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4HkstV517Pz4vsX
 for <wireguard@lists.zx2c4.com>; Wed,  3 Nov 2021 16:39:30 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 86EC8209F6
 for <wireguard@lists.zx2c4.com>; Wed,  3 Nov 2021 16:39:30 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f181.google.com with SMTP id o12so1450004qtv.4
 for <wireguard@lists.zx2c4.com>; Wed, 03 Nov 2021 09:39:30 -0700 (PDT)
X-Gm-Message-State: AOAM531N9Nh9c6ooZUEF/0k4BrGrFYtmu2E6xylRVbo2NiXkfQDa7CQQ
 M/WeHd4JjmCyehQ4Ppb/PacWVrpHkJkb5joVGjQ=
X-Google-Smtp-Source: ABdhPJyRVC75P9P6XcJw88TUibYBXVHAD0lNBpLdmrG0YRtNTpHZzXWh3BEz3TkQJnIcj+uoqeujhi0+fUbs7ULi2Ek=
X-Received: by 2002:a05:622a:13:: with SMTP id
 x19mr46459211qtw.83.1635957570067; 
 Wed, 03 Nov 2021 09:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <cfddc41d-0768-af1a-d527-d2bccd5cfd56@deze.org>
In-Reply-To: <cfddc41d-0768-af1a-d527-d2bccd5cfd56@deze.org>
From: Kyle Evans <kevans@freebsd.org>
Date: Wed, 3 Nov 2021 11:39:19 -0500
X-Gmail-Original-Message-ID: <CACNAnaE8DrntMR0RifxNzijLWfBXNHxm2poSY-DewOQszP-XqQ@mail.gmail.com>
Message-ID: <CACNAnaE8DrntMR0RifxNzijLWfBXNHxm2poSY-DewOQszP-XqQ@mail.gmail.com>
Subject: Re: Wireguard on FreeBSD - a few questions
To: Frank Volf <frank@deze.org>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 03 Nov 2021 18:24:03 +0000
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

On Wed, Nov 3, 2021 at 5:55 AM Frank Volf <frank@deze.org> wrote:
>
>
> Hi,
>
> This weekend I installed Wireguard on FreeBSD 13.0 and until now
> everything seems to work fine (I use the kernel module).
> Installation and configuration was easy and connecting with the Android
> app works great as well.
>

Excellent, that's good to hear! :-)

> I do have a few questions.
>
> 1) Is it possible on FreeBSD to enable some kind of logging? I did made
> a small configuration error with my first client and it was hard to find
> the error, because there does not seem to be any logging at all.  Some
> logging information would be appreciated and probably wold have pointed
> me faster to the fact that I needed to switch two keys in my config.
>

If you set 'debug' on the interface (`ifconfig wg0 debug`) then it'll
write some useful bits to syslog for your perusal.

> 2) I noticed that Wireguard uses a wildcard to listen to all IP
> addresses on my multi-homed machine on his dedicated UDP port. I would
> prefer if Wireguard would only bind to the specific IP address on the
> outside interface that is designated for that use. Is this possible?
>
> 3) Final question: is it possible on the server side to restrict the
> destinations that clients can connect to it? I know, that I can set the
> AllowedIPs on the client side to restrict that, but that setting can be
> changed at the client side. It would be nice if I could restrict
> destinations at the server side (so client X can only connect to an IP
> address of an internal server that it needs access to but nothing else).
> I can probably use a state full packet filtering firewall for this, but
> it would it be possible to configure this on the Wireguard server side
> as well?
>

For these last two, I'll defer to somebody else -- I'm not aware of
any such functionality on other platforms, but wireguard-freebsd will
follow suit if this is or will become an accepted concept elsewhere.

> That said, I'm pleased with the first test results of Wireguard on
> FreeBSD and hopefully it keeps on running fine. Great product!
>

Great, thanks for testing! =)

Kyle Evans
