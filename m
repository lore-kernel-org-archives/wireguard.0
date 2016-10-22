Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e4ef543
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Oct 2016 08:01:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca32a6c4
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Oct 2016 08:01:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e73ef36b
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Oct 2016 08:01:55 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id b75so160824275lfg.3
 for <wireguard@lists.zx2c4.com>; Sat, 22 Oct 2016 01:03:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87bmyet4dx.fsf@toke.dk>
References: <87mvi0jxsb.fsf@toke.dk>
 <58096029.23859.5C451AE@pageexec.gmail.com>
 <CAHmME9opbKv9c67uCk69K_J3=A0-8p0gkwmJos83wBiMJ9WmCw@mail.gmail.com>
 <5809CB98.15179.767FB18@pageexec.gmail.com>
 <CAHmME9oAnWiN8fx5dGP6+i+rTdxH4fMfxmbsr56Ey7viBwiL-Q@mail.gmail.com>
 <87bmyet4dx.fsf@toke.dk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 22 Oct 2016 17:03:03 +0900
Message-ID: <CAHmME9pF_jcwP6ZbnH1zLmA4vG6c6z+yZ_wO2cSB4W80u0TkEw@mail.gmail.com>
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Content-Type: text/plain; charset=UTF-8
Cc: Emese Revfy <re.emese@gmail.com>, Pipacs <pageexec@gmail.com>,
 Brad Spengler <spender@grsecurity.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Error building against grsec-enabled kernel
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Toke,

On Fri, Oct 21, 2016 at 6:53 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@tok=
e.dk> wrote:
> Wooh! FYI I was seeing the bug being triggered on IPv4 as well...

Think you could try to acquire a backtrace? I'm not able to reproduce this.

Jason
