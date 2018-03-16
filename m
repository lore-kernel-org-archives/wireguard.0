Return-Path: samuel@sholland.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 619f8946
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 02:28:01 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89ea4013
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 02:28:01 +0000 (UTC)
Subject: Re: Android app and command line
To: Jacob Schooley <jacob.schooley+wgvpn@gmail.com>, wireguard@lists.zx2c4.com
References: <CAHjFYUJnEvhB27dKcUXLzj-KYK5U+gMLuQORNiiQwG2Zp8E9TQ@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <2598be63-11f3-1e91-a52a-f82f47274eed@sholland.org>
Date: Thu, 15 Mar 2018 21:38:23 -0500
MIME-Version: 1.0
In-Reply-To: <CAHjFYUJnEvhB27dKcUXLzj-KYK5U+gMLuQORNiiQwG2Zp8E9TQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

On 03/12/18 20:51, Jacob Schooley wrote:
> There is an option in the Android app to enable wg and wg-quick, which will be
> extremely useful to me as most of my VPN stuff is taken care of with Tasker.
> There are two major bugs with this however.

Thanks for the report!

> One is that the app doesn't automatically update the status of wireguard, so the
> switch inside the app won't flip if I use wg-quick up or down until I swipe off
> and reopen the app, and the quick settings toggle won't change.

I've looked into this, and it is unfortunately quite difficult to do. The app
can register to receive notification about network changes, but unfortunately
there's no* way for the app to tell the Android connectivity service that the
WireGuard tunnel exists, so Android can track its state. Even then, wg-quick on
the command line wouldn't easily be able to tell the app about _new_ tunnels.

*without using reflection to access internal framework classes.

> The other is that if I run wg-quick up, then try to bring it down through the
> app or the quick settings toggle, it says "Error bringing down tunnel: Unable to
> configure tunnel (wg-quick returned 2)." So as of now it really doesn't work
> well with tasker because I can't bring it down manually if I need to.

Hmm, that might actually be a bug. I'll look into that.

In the meantime, have you considered using Tasker to kill the app every time you
use wg-quick? Android will restart it and the quick tile will update, plus it
will refresh the state of all known tunnels within the app.

Regards,
Samuel
