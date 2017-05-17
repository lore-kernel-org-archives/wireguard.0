Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b03a1fcb
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 17:59:34 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c76d1a9
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 17:59:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5b76cc8
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 18:10:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bee9a7a8
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 18:10:58 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id w10so25759428oif.0
 for <wireguard@lists.zx2c4.com>; Wed, 17 May 2017 11:10:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87wp9fuzki.fsf@alrua-karlstad>
References: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
 <CAHmME9o-PM0ma0E5tF868fBCmOfoSdJ8BYA+_Enbbq89t900+w@mail.gmail.com>
 <87wp9fuzki.fsf@alrua-karlstad>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 May 2017 20:10:57 +0200
Message-ID: <CAHmME9oghtzWz2v5Hgz6BwUy5Y7EOvwm5zNv905qs+-cPuzbQg@mail.gmail.com>
Subject: Re: Text-based IPC for Userspace Implementations
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
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

On Wed, May 17, 2017 at 8:07 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@tok=
e.dk> wrote:
> My point was not so much "just use JSON". My point was "you are
> disguising something that requires stateful parsing as a simple
> key/value scheme, which is bound to lead to bugs eventually". I.e. if
> someone were to write a parser that would (e.g.) just grep for a public
> key, they'd end up with ambiguous results at best.

If your random 256-bit public key is accidentally the prefix or suffix
of something else somewhere else, you have a problem with your RNG.

Anyway, JSON is not regular, though it is context-free, which I think
is your argument. If I had to choose between the two, I'd easily
choose something that's regular to parse, since it can be implemented
in a bug free fashion trivially anywhere.
