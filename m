Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 921f31c0
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 21:21:29 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94c5c487
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 21:21:29 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: curve25519_generate.js [was: Re: [ANNOUNCE] WireGuard Snapshot
 `0.0.20171211` Available]
In-Reply-To: <CAHmME9r8qyXY-h3fw=JBee_mwD3Xe9frUCOTrf05eumrkN+d=g@mail.gmail.com>
References: <b95c15baca1d3929@frisell.zx2c4.com>
 <874loxxe02.fsf@fifthhorseman.net>
 <CAHmME9r8qyXY-h3fw=JBee_mwD3Xe9frUCOTrf05eumrkN+d=g@mail.gmail.com>
Date: Mon, 11 Dec 2017 16:28:11 -0500
Message-ID: <87h8sxvtsk.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason--

On Mon 2017-12-11 21:15:16 +0100, Jason A. Donenfeld wrote:
> - emscripten is laborious to build and recent versions are not readily
> accessible on many distros.
> - I figure web developers generally lack build system competence and
> would be more inclined to use this if it was as easy as copy and
> paste.
> - Signal includes the generated .js file in their repos.

these are all true statements, i'm just not sure that they argue in the
direction of the current state of the repository :)

> It would indeed be much cleaner to include a Makefile, like you
> suggest, which would take care of all the appropriate magic, but I
> worry about that being overwhelmingly inconvenient for some. Is that
> actually a good reason? I don't know...
>
>  > * Do you expect packagers do rebuild this with whatever version of
>  >  emscripten available to them?  Or should that be left up to the party
>  >  who makes use of the key-generator?
>
> Certainly don't bother rebuilding it. contrib/examples has tons of
> source code (most of which has proper makefiles!), which similarly
> shouldn't be built, since it's example code meant to be tweaked.

If we can't build it from the preferred form of modification in debian,
then we shouldn't be shipping it.  People *definitely* aren't going to
be tweaking the .js (other than the SPDX changes, which did appear to
happen by hand).

>>   In debian, i can't reasonably ship a binary artifact that i can't
>>   build from source (this is sensible debian policy
>
> This is sensible policy. There is a question that people could
> bikeshed about all day: "Is emscripten output a binary artifact?"
> Probably the existing Debian policy answer to that is a sufficient
> one, if that kind of thing has already been decided.

i think debian as a whole has answered that one pretty clearly (despite
some intermittent bickering).  Minimized or generated javascript is a
binary artifact, and is clearly not the "preferred form of
modification".  It's much more similar to java bytecode than it is to
source code, when it comes to manipulability and comprehension.

> So anyway, I'm not really sure what to do here. Happy to take
> suggestions from all sides. Just keep in mind that emcc is a massive
> pain to get installed.

agreed, but given that the introduction to this project is "don't use
this if you don't know what you're doing, and you've thought about all
the tradeoffs", i'm inclined to say having a "massive pain" hurdle that
keeps people from using it without really meaning to.  This patch will
also (as a happy byproduct) help me keep the debian packaging free from
un-buildable binary artifacts :)

I'll send a patch to the list shortly with a simple proposal.

all the best,

     --dkg
