Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccf827c9
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 20:57:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eea8a050
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 20:57:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 561c92fa
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 20:57:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 700aa8d7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 20:57:11 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id 3so374989629oih.1
 for <wireguard@lists.zx2c4.com>; Wed, 04 Jan 2017 13:06:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87a8b6k07f.fsf@alice.fifthhorseman.net>
References: <CAHmME9qEs=oHr=r=dfAeiL=QGXxOeNmuFUkrnbv7L4MBbHb+tw@mail.gmail.com>
 <20170104201416.25893-1-list@eworm.de>
 <87a8b6k07f.fsf@alice.fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 4 Jan 2017 22:06:10 +0100
Message-ID: <CAHmME9p5E57NiVtdYDacViuDJhtFOuG5pWq1hhHJQbd5aTT0LA@mail.gmail.com>
Subject: Re: [PATCH 1/1] tools: remove DESTDIR for autodetection
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Content-Type: text/plain; charset=UTF-8
Cc: Christian Hesse <mail@eworm.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Jan 4, 2017 at 10:02 PM, Daniel Kahn Gillmor
<dkg@fifthhorseman.net> wrote:
> why are we checking either place?  It's entirely possible that my
> dedicated build farm doesn't have any bash completion mechanisms
> installed, even if my development system does.

Yes, the concept of auto-detection is "broken". But it's useful as a
default, for people doing `make && make install` on their dev
machines. Packagers should always set these types of flags explicitly,
as with autotools.
