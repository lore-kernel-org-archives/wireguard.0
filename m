Return-Path: Golden_Miller83@protonmail.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eed062f1
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Aug 2018 11:05:28 +0000 (UTC)
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9642a559
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Aug 2018 11:05:28 +0000 (UTC)
Date: Sun, 26 Aug 2018 11:18:45 +0000
To: Jorge AC <jorgeanton@gmail.com>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: [PATCH 1012/1012] Support for unicode interface names: only '%',
 ':' and '/' must be avoided
Message-ID: <FDnMYYaLpOD43GpWKVYppC41gq5UDScWf4p0KxdLZY6roXjrrEhMGntqR81ot7tDKnn7SrXmaM5gYYWITnQfbUJYMYSjACH6DABIQWRkhaI=@protonmail.ch>
In-Reply-To: <CAFafqTtNdm4odfYLpdR59wNjr5RBsJn3_YmkYW=-Yfty+0reLg@mail.gmail.com>
References: <CAFafqTtD_Qk9pSZvurmg6tsWFyYLOarqJmA5bizpygxuOmPqbQ@mail.gmail.com>
 <CAHmME9qMGNfdJLNFAaPezOc11Wi9EGHRV-d2+jdYok1W-aL36Q@mail.gmail.com>
 <CAFafqTtNdm4odfYLpdR59wNjr5RBsJn3_YmkYW=-Yfty+0reLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On August 25, 2018 5:50 PM, Jorge AC <jorgeanton@gmail.com> wrote:

> Thank you for checking my regex with the kernel code lines :-)
>
> Definetly is insanity what drives me, I enjoy naming interfaces with
> unicodes like =E2=98=A2.
>
> Nevertheless, thinking about a legit use, it could be a nice gesture
> for those non-latin1 people who wants to use their language.
>

Wireguard aims to be simple and secure. The name of device is used to
identify it, not to make a gestures to anyone. All wg/wg-quick commands
are in latin (english). I don't see much benefit of executing commands
like 'wg showconf =E2=98=A2' instead of 'wg showconf abc123' other than som=
eone's
egoistic pleasure.

Jordan
