Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38b0cded
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:44:56 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8cb92b2
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:44:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d47b6db
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:44:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0164183a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 13:44:56 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id t47so31558289ota.1
 for <wireguard@lists.zx2c4.com>; Fri, 17 Feb 2017 05:45:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8737ffmrnz.fsf@alice.fifthhorseman.net>
References: <CAHmME9pjv8xWoShiD4WhijExsBq3Q4ovCwbLfkOo7xOJ85+qRw@mail.gmail.com>
 <8737ffmrnz.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 17 Feb 2017 14:45:15 +0100
Message-ID: <CAHmME9oUQpGK0G1j6_WYPF8CJUkUsgEAY2FSAxoVc1XbD-59vQ@mail.gmail.com>
Subject: Re: Wanted: Novice Guides
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Daniel,

On Wed, Feb 15, 2017 at 3:53 PM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> A good "novice guide" usually has the following pattern:

This is a nice list of suggestions on how to structure guides. Thanks for that.

> Those of us who are not novices understand that tools like WireGuard can
> be used on a lot of different platforms (c) to perform a lot of
> different tasks (a), but how those tasks are carried out might have more
> to do with policy details (where do you get the peer's public keys from?
> how do you verify that they're the right public keys?  How do peers find
> each other if there are no stable public IP addresses?  How do you
> allocate IP addresses for the wg interfaces?  Which traffic should each
> peer route over which wg interfaces?) than with WireGuard itself.

Right. The concepts are simple, and simplify a lot of the things
WireGuard is supposed to replace, but they're still somewhat new
concepts. That means there's going to need to be explanations and
diagrams and good solid descriptions for people who don't even know
the prior concepts.

> The fact that the WireGuard-specific instructions for any such guide are
> likely to be minimal is one of the strengths of WireGuard, i think.  But
> that also means that any novice guide is going to be at least as much
> about non-WireGuard details as it is about WireGuard itself.

Right. This also raises the question of the role of WireGuard in
general. It's being designed as sort of a fundumental basic build
block, on which other tools and simple bash scripts should be built.
How much should I build those larger things? (Such as wg-quick.) How
much should I wait for others to integrate this into existing
utilities (such as NetworkManager or systemd-networkd)? How much
should other people simply build new tools ontop of the WireGuard
core? I suspect the answer is: all of those things all at once, and
then we'll have a flourishing ecosystem. This, though, makes the focus
of beginner guides non obvious.

>
> Jason, what kinds of novice guides are people asking for?

"How do I set up my laptop with my server?" "How do I set up my laptop
with my home router?" "How do I put it on a RasPi at home and connect
to it from the Internet with my laptop?" "How do I hook all my servers
together with it?" "What's the difference between a tunnel IP address
and an endpoint?" "What do I put in AllowedIPs and what do I put as
the interface IP and what's the difference?" "What's the difference
between AllowedIPs and the normal routing table?" etc etc
