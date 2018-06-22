Return-Path: Golden_Miller83@protonmail.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ece6db45
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 10:41:49 +0000 (UTC)
Received: from mail-1857040130.protonmail.ch (mail-1857040130.protonmail.ch
 [185.70.40.130])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00cf6da3
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 10:41:49 +0000 (UTC)
Date: Fri, 22 Jun 2018 06:46:48 -0400
To: Antonio Quartulli <a@unstable.cc>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: PostUp/PreUp/PostDown/PreDown Dangerous?
Message-ID: <CgE9_flxwDk6vYs9xSAoTvLJp5qHdNF20xieK4syAMzldOBqEq5lZ3gZN77A7ambiqtFeuBfm-jXarYLMvcY4LAn1aC9ub1su871JPhDpUo=@protonmail.ch>
In-Reply-To: <a7989c95-0047-dfe9-e870-59db44fbb463@unstable.cc>
References: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
 <CAHmME9qPwF-YdSKRhngVuL4JXrMD_1=nbP0jDUAejBxexsN3EA@mail.gmail.com>
 <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
 <a7989c95-0047-dfe9-e870-59db44fbb463@unstable.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: "baines.jacob@gmail.com" <baines.jacob@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On June 22, 2018 3:56 AM, Antonio Quartulli <a@unstable.cc> wrote:
>=20
> In case this might be useful: in OpenVPN there is an additional
>=20
> parameter called "--script-security" that requires to be set to a
>=20
> certain level before allowing configured scripts to be executed.
>=20
> Unfortunately there is no real protection against the clueless user, who
>=20
> can and will blindly enable that setting if asked by a $random VPN provid=
er.
>=20
> However, I still believe (and hope) that forcing the user to enable a
>=20
> specific knob may raise the level of attention.
>=20
> Maybe something similar could be added as a command line parameter to
>=20
> wg/wg-quick so that it will execute the various
>=20
> PostUp/PreUp/PostDown/PreDown only if allowed to?
>=20
> Just as a side note: this is not a VPN specific problem, this is
>=20
> something users can end up with everytime they execute some binary with
>=20
> a configuration they have not inspected. So, be careful out there ;-)
>=20
> Cheers,
>=20

Attacker can pass appropriate "--script-security" level with the very same =
config
containing malicious commands so this isn't solving problem of not looking =
at
the content of config files. I think blindly using untrusted files from the=
 web is
indefensible. Sure, we could throw away this functionality completely  but =
then
we will punish people who bother to look at the configs before using them a=
nd
make their life little harder while the others will still find their footgu=
n somewhere
else as this is rather generic issue not limited to wireguard or even netwo=
rking.

Jordan
