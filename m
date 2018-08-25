Return-Path: jorgeanton@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c9720be
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 15:37:37 +0000 (UTC)
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48e8b017
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 15:37:37 +0000 (UTC)
Received: by mail-it0-x243.google.com with SMTP id j81-v6so5948120ite.0
 for <wireguard@lists.zx2c4.com>; Sat, 25 Aug 2018 08:50:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAFafqTtD_Qk9pSZvurmg6tsWFyYLOarqJmA5bizpygxuOmPqbQ@mail.gmail.com>
 <CAHmME9qMGNfdJLNFAaPezOc11Wi9EGHRV-d2+jdYok1W-aL36Q@mail.gmail.com>
In-Reply-To: <CAHmME9qMGNfdJLNFAaPezOc11Wi9EGHRV-d2+jdYok1W-aL36Q@mail.gmail.com>
From: Jorge AC <jorgeanton@gmail.com>
Date: Sat, 25 Aug 2018 17:50:42 +0200
Message-ID: <CAFafqTtNdm4odfYLpdR59wNjr5RBsJn3_YmkYW=-Yfty+0reLg@mail.gmail.com>
Subject: Re: [PATCH 1012/1012] Support for unicode interface names: only '%',
 ':' and '/' must be avoided
To: Jason@zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Thank you for checking my regex with the kernel code lines :-)

Definetly is insanity what drives me, I enjoy naming interfaces with
unicodes like =E2=98=A2.

Nevertheless, thinking about a legit use, it could be a nice gesture
for those non-latin1 people who wants to use their language.

On Sat, Aug 25, 2018 at 7:26 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Indeed it looks like we could be slightly more permissive. From net/core/=
dev.c:
>
> /**
> *      dev_valid_name - check if name is okay for network device
> *      @name: name string
> *
> *      Network device names need to be valid file names to
> *      to allow sysfs to work.  We also disallow any kind of
> *      whitespace.
> */
> bool dev_valid_name(const char *name)
> {
>        if (*name =3D=3D '\0')
>                return false;
>        if (strnlen(name, IFNAMSIZ) =3D=3D IFNAMSIZ)
>                return false;
>        if (!strcmp(name, ".") || !strcmp(name, ".."))
>                return false;
>
>        while (*name) {
>                if (*name =3D=3D '/' || *name =3D=3D ':' || isspace(*name)=
)
>                        return false;
>                name++;
>        }
>        return true;
> }
>
> And earlier in the callstack, %d is checked for, which indeed adds %
> to the blacklist, as your commit indicates.
>
> But should wg-quick enable insane dev names?
