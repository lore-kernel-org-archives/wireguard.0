Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c15a5c5
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 13:15:00 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b54b4e6
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 13:15:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d7f6401
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 13:15:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e5708011
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 13:14:59 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id w204so33609236oiw.0
 for <wireguard@lists.zx2c4.com>; Sat, 11 Feb 2017 05:28:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMx+r7WLJ5S-Op_9dq4AY9BNmk6u7xMOwqwVoAis=_pqJX1_-g@mail.gmail.com>
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
 <CAHmME9q8+D7y0Hz4xOJv1MiVsq0=bUf3TgENseGEWWF2BEpx4Q@mail.gmail.com>
 <CAMx+r7VgJ0xDAy46d28Qv_Vv7vM8JO0yRbYEh6AHVWT55LEVAw@mail.gmail.com>
 <CAHmME9rumLr0V6yD=zoHk-GSN2-bCiGe644WHtt4EJvKrhtLoA@mail.gmail.com>
 <CAMx+r7VkgtkFdqkKVbeX_Pv=T1TO6KaTY-+T1iM2OphS-L8mWA@mail.gmail.com>
 <CAHmME9qkRgySY61Cqm76Lqs_f3U3V3p5YF1G0kE1CCPd9u398Q@mail.gmail.com>
 <CAMx+r7WLJ5S-Op_9dq4AY9BNmk6u7xMOwqwVoAis=_pqJX1_-g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 11 Feb 2017 14:28:47 +0100
Message-ID: <CAHmME9qmfSQ2=Bcdxzx=41vcF2NPkXBhDBVbrjCizkrDsB3KSA@mail.gmail.com>
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
To: David Anderson <dave@natulte.net>
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

Hey David,

On Sat, Feb 11, 2017 at 12:48 PM, David Anderson <dave@natulte.net> wrote:
> Okay, I've set up a Debian stable builder as well... However, Debian stable
> has a 3.16 kernel, and wireguard-dkms requires >=3.18, so installation
> fails. Assuming 3.18 is a hard lower-bound on kernel versions, it looks like
> jessie will never run in-kernel wireguard. Fortunately it'll be moot in a
> few months when stretch becomes the new stable.

I probably could backport to 3.16... It's a bit of a PITA but still
possible if there's sufficient demand. I'll wait to see if people pipe
up.

Jason
