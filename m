Return-Path: Marc-Antoine@perennou.com
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa45c786
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 10:40:54 +0000 (UTC)
Received: from mfilter42-d.gandi.net (mfilter42-d.gandi.net [217.70.178.172])
 by relay2-d.mail.gandi.net (Postfix) with ESMTP id 98B26C5A55
 for <wireguard@lists.zx2c4.com>; Wed,  2 Nov 2016 11:41:59 +0100 (CET)
Received: from relay2-d.mail.gandi.net ([IPv6:::ffff:217.70.183.194])
 by mfilter42-d.gandi.net (mfilter42-d.gandi.net [::ffff:10.0.15.180])
 (amavisd-new, port 10024)
 with ESMTP id uVd-zGYsqfRJ for <wireguard@lists.zx2c4.com>;
 Wed,  2 Nov 2016 11:41:28 +0100 (CET)
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
 (Authenticated sender: sendmail@perennou.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 4D9E0C5AD7
 for <wireguard@lists.zx2c4.com>; Wed,  2 Nov 2016 11:41:27 +0100 (CET)
Received: by mail-wm0-f47.google.com with SMTP id p190so259192881wmp.1
 for <wireguard@lists.zx2c4.com>; Wed, 02 Nov 2016 03:41:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pN4bX=_8D6bKFV7bMJZpLHX_dmW68_fxLwuAarcKHY3w@mail.gmail.com>
References: <20161102103158.5305-1-Marc-Antoine@Perennou.com>
 <CAHmME9pN4bX=_8D6bKFV7bMJZpLHX_dmW68_fxLwuAarcKHY3w@mail.gmail.com>
From: Marc-Antoine Perennou <Marc-Antoine@perennou.com>
Date: Wed, 2 Nov 2016 11:41:06 +0100
Message-ID: <CACpTwpE=YBt3FqyEvc-4dpL5Bn5E1Qrh_Rmt60RGS7d3ekDBug@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [PATCH] tools: allow better build system
	configuration
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

On 2 November 2016 at 11:36, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hi Marc,
>
> What is the motivation for making -s overrideable? Do different
> install versions use different options? Or do you simply want the
> ability to not strip?
>
> Jason

My patch is missing a little background indeed.
Some build environments do not allow the build system to do the
stripping, and want
to do it after the uild system has finished, so it's the latter.
I can split and/or rework that part if needed.

Marc-Antoine
