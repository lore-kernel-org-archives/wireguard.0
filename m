Return-Path: chm.duquesne@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 909dc6d0
 for <wireguard@lists.zx2c4.com>; Tue, 8 May 2018 08:45:56 +0000 (UTC)
Received: from mail-io0-x22e.google.com (mail-io0-x22e.google.com
 [IPv6:2607:f8b0:4001:c06::22e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb7e526c
 for <wireguard@lists.zx2c4.com>; Tue, 8 May 2018 08:45:56 +0000 (UTC)
Received: by mail-io0-x22e.google.com with SMTP id r9-v6so37465118iod.6
 for <wireguard@lists.zx2c4.com>; Tue, 08 May 2018 01:48:23 -0700 (PDT)
MIME-Version: 1.0
Sender: chm.duquesne@gmail.com
In-Reply-To: <153cabd7-f27d-0886-53ba-f4c620af409b@gmx.net>
References: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
 <CAHmME9q3YF87P9u3WXuXPU9nUZtXPWmRS0raw_8p6Gy-CghJdg@mail.gmail.com>
 <493b3bdf-3cf0-5594-dd7e-4b9c8d84e74c@gmx.net>
 <CAHmME9r5cwdfDaHCbO50UhREG9z2zv39y+32YYwAYJEfsGDgVA@mail.gmail.com>
 <ad56c93f-5e36-e9a4-42c2-8632c7df86af@gmx.net>
 <4ZK0EJ5btb88Qoa6vz0bpYJHCbhF7h4Z-BBh0ARD4tdwxcwcmdGeUPFuiPrGcdTNmp8Q8p6t4c4vMo7vKwnEIrXdVe56ovqOhiBXi4PdPxs=@protonmail.ch>
 <825a636f-9311-688d-6f30-9ae8d12ea44a@gmx.net> <874ljk24jh.fsf@toke.dk>
 <dfcc55c3-795b-dfa2-7034-74b537519ea4@gmx.net>
 <7qQvJLeSZV3rJnkg9rIdA6yznDPzhIFVR_qUa0hBhmCdr_onJsjzXvKVIlp-ovJiRaX1eENGmtrtcZ_7xsHY7heX2qOvouN8pXTt_J3RurQ=@protonmail.ch>
 <d8bb14e2-43f6-812b-ad5d-3d7b143ae518@gmx.net>
 <CAHLp1Y=3n-b2x+51hv2-4w2w4_GdLAwKZ00jhKvPGHg+-PiWPg@mail.gmail.com>
 <153cabd7-f27d-0886-53ba-f4c620af409b@gmx.net>
From: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Tue, 8 May 2018 10:48:02 +0200
Message-ID: <CAHLp1Yki+g4PxJFYFkv1wqyv3siY4niYmCu7T-0tpKZQwkx7nw@mail.gmail.com>
Subject: Re: WG interface to ipv4
To: vtol <vtol@gmx.net>
Content-Type: multipart/alternative; boundary="00000000000053364d056badd981"
Cc: wireguard <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--00000000000053364d056badd981
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 7, 2018 at 6:34 PM, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vt=
ol@gmx.net> wrote:

>
> there is no (regular) external audit of WG, at least publicly available,
> neither confirming or contradicting.
>

You keep bringing this lack of security audit as if it was a big deal, but
you don't get any intrinsic security from an audit: It's just an paid
assessment that professionals have read the code and have not spotted
obviously hazardous constructs. What you really want is that hundreds of
people, as opposed to a handful of security analysts, can read the code and
analyze it. Openvpn is 100+ KLOC, which makes it impossible for a single
programmer to read in a reasonable amount of time, and it thus requires
this kind of paid assessment. On the other hand, Wireguard is less than
4KLOC, which is the real deal maker: no unnecessary bloat and an increased
likeliness that more people can read it. Keeping it small is a difficult
task and credits should be given to the authors for staying strong about
it. You claim that the lack of a security audit is a reason to add more
code for supporting binding to a particular interface/ip, but I bet a lot
of people on this list think that it would actually hurt security because
it would grow the code base for no good reason.

--00000000000053364d056badd981
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On Mon, May 7, 2018 at 6:34 PM, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=
=84=A0 <span dir=3D"ltr">&lt;<a href=3D"mailto:vtol@gmx.net" target=3D"_bla=
nk">vtol@gmx.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><s=
pan><br></span>there is no (regular) external audit of WG, at least publicl=
y available, neither confirming or contradicting.<br></blockquote><div><br>=
You keep bringing this lack of security audit as if it was a big deal, but =
you don&#39;t get any intrinsic security from an audit: It&#39;s just an pa=
id assessment that professionals have read the code and have not spotted ob=
viously hazardous constructs. What you really want is that hundreds of peop=
le, as opposed to a handful of security analysts, can read the code and ana=
lyze it. Openvpn is 100+ KLOC, which makes it impossible for a single progr=
ammer to read in a reasonable amount of time, and it thus requires this kin=
d of paid assessment. On the other hand, Wireguard is less than 4KLOC, whic=
h is the real deal maker: no unnecessary bloat and an increased likeliness =
that more people can read it. Keeping it small is a difficult task and cred=
its should be given to the authors for staying strong about it. You claim t=
hat the lack of a security audit is a reason to add more code for supportin=
g binding to a particular interface/ip, but I bet a lot of people on this l=
ist think that it would actually hurt security because it would grow the co=
de base for no good reason.<br></div></div></div></div></div>

--00000000000053364d056badd981--
