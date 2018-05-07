Return-Path: chm.duquesne@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f38e3716
 for <wireguard@lists.zx2c4.com>; Mon, 7 May 2018 13:33:38 +0000 (UTC)
Received: from mail-io0-x233.google.com (mail-io0-x233.google.com
 [IPv6:2607:f8b0:4001:c06::233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa54396d
 for <wireguard@lists.zx2c4.com>; Mon, 7 May 2018 13:33:38 +0000 (UTC)
Received: by mail-io0-x233.google.com with SMTP id d73-v6so33649558iog.3
 for <wireguard@lists.zx2c4.com>; Mon, 07 May 2018 06:36:00 -0700 (PDT)
MIME-Version: 1.0
Sender: chm.duquesne@gmail.com
In-Reply-To: <d8bb14e2-43f6-812b-ad5d-3d7b143ae518@gmx.net>
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
From: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Mon, 7 May 2018 15:35:39 +0200
Message-ID: <CAHLp1Y=3n-b2x+51hv2-4w2w4_GdLAwKZ00jhKvPGHg+-PiWPg@mail.gmail.com>
Subject: Re: WG interface to ipv4
To: vtol <vtol@gmx.net>
Content-Type: multipart/alternative; boundary="000000000000137150056b9dc04d"
Cc: wireguard <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000137150056b9dc04d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 6, 2018 at 9:39 PM, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vt=
ol@gmx.net> wrote:

> With a thread model considering every piece of software being flawed in
> mind, and with whatever CVE unearthed being a point in case, it should be
> of little surprise that the question of mitigating surface exposure is
> raised. Once WG would gain traction beyond a niche app it is likely to be
> subjected to malicious attacks with increased frequency.
>


There is no need for a nob in wireguard to ensure that the wireguard
traffic goes through a specific interface or is bound to a specific ip
address. You can use iptables if you want to drop packets that are not for
the intended interface / ip address. You can disable ipv6 if you don't want
ipv6. If you think that wireguard could be flawed, why would you trust this
as a wireguard option? If you do not trust it, enforce it from the outside.

--000000000000137150056b9dc04d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, May 6, 2018 at 9:39 PM, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:vtol@gmx.net" target=3D"_blank">vt=
ol@gmx.net</a>&gt;</span> wrote:<span class=3D""></span><br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
With a thread model considering every piece of software being flawed in min=
d, and with whatever CVE unearthed being a point in case, it should be of l=
ittle surprise that the question of mitigating surface exposure is raised. =
Once WG would gain traction beyond a niche app it is likely to be subjected=
 to malicious attacks with increased frequency.<br></blockquote><div><br><b=
r></div><div>There is no need for a nob in wireguard to ensure that the wir=
eguard traffic goes through a specific interface or is bound to a specific =
ip address. You can use iptables if you want to drop packets that are not f=
or the intended interface / ip address. You can disable ipv6 if you don&#39=
;t want ipv6. If you think that wireguard could be flawed, why would you tr=
ust this as a wireguard option? If you do not trust it, enforce it from the=
 outside.<br></div></div><br></div></div>

--000000000000137150056b9dc04d--
