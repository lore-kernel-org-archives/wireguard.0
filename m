Return-Path: jens@viisauksena.de
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59a78ac2
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Sep 2016 08:01:32 +0000 (UTC)
To: wireguard@lists.zx2c4.com
References: <20160808132309.Horde.PpRcvoBjgmDh9S0lYDhy7Au@www.vdorst.com>
 <CAHmME9o+QqPR0qo8uadYVZDMw=Z-uxCwuBgggOeYNdE8FDLXpQ@mail.gmail.com>
 <20160908115753.Horde.dla9pNo2jSEeBF-QW8dWlO-@www.vdorst.com>
 <20160909134611.Horde.d1CtbRQrioV8yr-kI71aUI3@www.vdorst.com>
 <20160909135202.GA32666@lud.imag.fr>
From: jens <jens@viisauksena.de>
Message-ID: <d43b4c35-4169-47c9-c7c4-bc5fb3730bb4@viisauksena.de>
Date: Wed, 14 Sep 2016 10:10:15 +0200
MIME-Version: 1.0
In-Reply-To: <20160909135202.GA32666@lud.imag.fr>
Content-Type: text/plain; charset=windows-1252
Subject: Re: [WireGuard] News about MIPS and ARM optimized code?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 09.09.2016 15:52, Baptiste Jonglez wrote:
> Nice work!  I had tried to write chacha20_generic_block in MIPS assembl=
y,
> but I got confused with endianness issues and the code didn't work in t=
he
> end.
>
> Is your code available somewhere?  I'd be happy to test on a variety of=

> MIPS routers.

i build some lede with Rene v Dorst patch - but have no time to actually
test it, if someone has ...
here a the links for 841-v11 we want to test specificly
and here is the link for more devices (only build in patched)

patch openfreiburg.de/freifunk/firmware/lede/chacha20poly1305.c_patch1
841 stuff openfreiburg.de/freifunk/firmware/lede/
more lede buildstuff also there (other images and packages)

jens
