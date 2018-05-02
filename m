Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f72ec0d7
 for <wireguard@lists.zx2c4.com>; Wed, 2 May 2018 16:50:48 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [IPv6:2001:470:dc45:1000::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab44fcaa
 for <wireguard@lists.zx2c4.com>; Wed, 2 May 2018 16:50:48 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: vtol@gmx.net, wireguard <wireguard@lists.zx2c4.com>
Subject: Re: WG via systemd (dis)advantage?
In-Reply-To: <b4e58a27-df47-b47b-0191-80483db929a6@gmx.net>
References: <b4e58a27-df47-b47b-0191-80483db929a6@gmx.net>
Date: Wed, 02 May 2018 18:52:32 +0200
Message-ID: <8736za0zlb.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

=D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.net> writes:

> Debian kernel 4.15.11
> WG 0.0.20180420-1
>
> Out of curiosity having WG configured/manged via systemd, which is=20
> working thus far as having the interface up and listening (also after=20
> rebooting the server).
>
> Now I was looking to manipulate the network interface with some=20
> post-up/post-down which though does not seems applicable with systemd,=20
> like it would be when managed through networking.service.

You can't do one-line up/down scripts, but you could create a separate
service file and have it depend on the wg interface...

> Hence, wondering whether I miss something about systemd or whether it is=
=20
> rather a bit of a disadvantage to configure/manage WG through systemd as=
=20
> opposed to networking.service?
> What is the benefit of systemd vs. networking.service WG management?

If you're using systemd-networkd to configure the rest of your
networking, having wireguard configured the same way can be useful; and
systemd-networkd can manage dependencies between interfaces as well (to
a certain extent).

However, as you note, things like running arbitrary scripts is a bit
more of a hassle...

-Toke
