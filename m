Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d55e5eec
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 19:21:36 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20de2f0b
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 19:21:36 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: PostUp/PreUp/PostDown/PreDown Dangerous?
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
Date: Fri, 22 Jun 2018 14:26:37 -0500
Message-Id: <296DF757-2B21-4F54-9444-1EEBD4A40BEA@lonnie.abelbeck.com>
References: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
 <CAHmME9qPwF-YdSKRhngVuL4JXrMD_1=nbP0jDUAejBxexsN3EA@mail.gmail.com>
 <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: baines.jacob@gmail.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


> On Jun 21, 2018, at 8:41 PM, Jason A. Donenfeld <Jason@zx2c4.com> =
wrote:
>=20
> Hey list,
>=20
> wg(8) is the main WireGuard configuration tool. It takes a fairly
> strict set of inputs, and is supposed to perform acceptable input
> validation on them.
>=20
> https://git.zx2c4.com/WireGuard/about/src/tools/man/wg.8
>=20
> wg-quick(8), on the other and, is a dinky bash script, that is useful
> for making some common limited use cases a bit easier.
>=20
> https://git.zx2c4.com/WireGuard/about/src/tools/man/wg-quick.8
>=20
> wg-quick(8) has the very handy feature of allowing
> PostUp/PostDown/PreUp/PreDown directives, to execute some helpers,
> such as iptables or whatever else you want in a custom setup. These
> have proven very useful to folks. And because these allow arbitrary
> execution anyway, wg-quick(8) doesn't try very hard to do proper input
> validation either.
>=20
> I just saw this nice post pointing out a problem in OpenVPN:
> =
https://medium.com/tenable-techblog/reverse-shell-from-an-openvpn-configur=
ation-file-73fd8b1d38da
>=20
> The same thing applies to wg-quick(8) with
> PostUp/PostDown/PreUp/PreDown.

How about not supporting direct execution of commands in the config =
[Interface] section but rather support an optional path to where a fixed =
command (ex. wireguard.script) is found...
--
ActionScriptDir =3D /usr/local/bin
--

Then instead of executing the PostUp/PostDown/PreUp/PreDown data, the =
wg-quick script would call:
--
/usr/local/bin/wireguard.script PRE_UP|PRE_DOWN|POST_UP|POST_DOWN =
"$INTERFACE"
--

1) When called, the first argument would be one of: =
PRE_UP|PRE_DOWN|POST_UP|POST_DOWN

2) When called, the second argument would be the wireguard interface.

3) If ActionScriptDir is not defined, then wireguard.script is not =
called.


This requires an extra step to be taken to create a wireguard.script =
file with execute permissions and possibly require specific ownership.

Lonnie
