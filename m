Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a86ea425
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jul 2016 19:14:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9c6a68c
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jul 2016 19:14:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 593fcd01
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Jul 2016 19:14:09 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id q132so80572481lfe.3
 for <wireguard@lists.zx2c4.com>; Mon, 11 Jul 2016 12:14:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87d1mktd41.fsf@alice.fifthhorseman.net>
References: <CAMRLKH8cAu+sD0Pss=GGVbqGUiZxvE3HT1sVgTsRFyKiQGpOog@mail.gmail.com>
 <CAHmME9pueP4YvQ4GJAhq7D06_MdDYq024vR5RSEj7cL1zx4qiQ@mail.gmail.com>
 <87d1mktd41.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 11 Jul 2016 21:14:49 +0200
Message-ID: <CAHmME9pBhzR49+_NcL4MYKsduR0duTExEZZm9ThzXAig2uyLwg@mail.gmail.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Troubleshooting with WireGuard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Jul 11, 2016 at 5:21 PM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> Would it be possible to log more when the kernel is in a more vebose
> mode, or to have a module parameter that increases the logging?  Not
> having to rebuild make it simpler for people experimenting with
> pre-packaged (or dkms-built) modules to just "enable debugging", which
> might produce more verbose problem reports.
>
> Or does anyone know of the simplest way to encourage dkms to build a
> specific module in debug mode?  If so, i could try to ship a
> wireguard-dkms-debug package (which Conflicts: wireguard-dkms and
> Provides: wireguard-dkms) as an alternate option for people who don't
> want to do the build themselves.

I'd prefer that early experimenters not get used to having too much
log output from WireGuard. It's supposed to appear "stateless" to the
user, and I'm afraid that this sort of thing might encourage bad
patterns with regards to it.

I'd rather learn precisely what issues the user is facing, and see if
we can debug it from there. Maybe that approach will prove impossible,
and in the end we'll need some logging, but I think it's worth at
least trying without logs.

That said, if you intend to help with the /development/ of wireguard,
the debug logs are quite helpful, but in that situation you'll already
be building the module yourself.
