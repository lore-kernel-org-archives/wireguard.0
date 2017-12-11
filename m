Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 542fe167
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 20:07:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d3f068c
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 20:07:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87d5d6c8
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 20:07:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c304e3f8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 20:07:43 +0000 (UTC)
Received: by mail-ot0-f177.google.com with SMTP id b54so15827867otd.8
 for <wireguard@lists.zx2c4.com>; Mon, 11 Dec 2017 12:15:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <874loxxe02.fsf@fifthhorseman.net>
References: <b95c15baca1d3929@frisell.zx2c4.com>
 <874loxxe02.fsf@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 11 Dec 2017 21:15:16 +0100
Message-ID: <CAHmME9r8qyXY-h3fw=JBee_mwD3Xe9frUCOTrf05eumrkN+d=g@mail.gmail.com>
Subject: Re: curve25519_generate.js [was: Re: [ANNOUNCE] WireGuard Snapshot
 `0.0.20171211` Available]
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset="UTF-8"
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

Thanks for bringing this up. All excellent points. I wasn't totally
confident about doing that, but what went into the decision was the
following:

- emscripten is laborious to build and recent versions are not readily
accessible on many distros.
- I figure web developers generally lack build system competence and
would be more inclined to use this if it was as easy as copy and
paste.
- Signal includes the generated .js file in their repos.

It would indeed be much cleaner to include a Makefile, like you
suggest, which would take care of all the appropriate magic, but I
worry about that being overwhelmingly inconvenient for some. Is that
actually a good reason? I don't know...

 > * Do you expect packagers do rebuild this with whatever version of
 >  emscripten available to them?  Or should that be left up to the party
 >  who makes use of the key-generator?

Certainly don't bother rebuilding it. contrib/examples has tons of
source code (most of which has proper makefiles!), which similarly
shouldn't be built, since it's example code meant to be tweaked.

>   In debian, i can't reasonably ship a binary artifact that i can't
>   build from source (this is sensible debian policy

This is sensible policy. There is a question that people could
bikeshed about all day: "Is emscripten output a binary artifact?"
Probably the existing Debian policy answer to that is a sufficient
one, if that kind of thing has already been decided.

So anyway, I'm not really sure what to do here. Happy to take
suggestions from all sides. Just keep in mind that emcc is a massive
pain to get installed.

Jason
