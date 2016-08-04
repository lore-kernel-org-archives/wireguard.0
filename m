Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e3ac215
 for <wireguard@lists.zx2c4.com>; Thu, 4 Aug 2016 08:12:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7da3910c
 for <wireguard@lists.zx2c4.com>; Thu, 4 Aug 2016 08:12:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 37ba8902
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Aug 2016 08:12:01 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id f93so177487867lfi.2
 for <wireguard@lists.zx2c4.com>; Thu, 04 Aug 2016 01:15:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <923cdc92-aa01-758a-5741-99a3f6009dc5@viisauksena.de>
References: <7a999008-9396-c82d-1764-d658873af7fc@viisauksena.de>
 <CAHmME9rCmhkegmUnS8EBoSmb8BEHo=bv7fxOQNdCwu1CaB+L-A@mail.gmail.com>
 <CCE0C17C-29C4-4E58-A853-590802C58589@viisauksena.de>
 <CAHmME9qqv3kC=6Y_JTO-P++4jpfTjw8qUGtGTQhsdmCujvU4sw@mail.gmail.com>
 <DEB54C8F-1159-48AD-B2A3-CB2B4E05C896@viisauksena.de>
 <CAHmME9oveH4hLUzEjwWnZ8Nj8U63LEuVezgivsxVxgpZKL_PwQ@mail.gmail.com>
 <8eebb32d-b302-5975-726b-874a9ad12a84@viisauksena.de>
 <20160803064853.Horde.ZExiUp0by8SskYUmZW7CFq4@www.vdorst.com>
 <ce094d6d-2314-8bfe-72e1-879b88ec7141@viisauksena.de>
 <20160803201014.Horde.RctXDT7A7Fi6hFbWMcqDmJs@www.vdorst.com>
 <923cdc92-aa01-758a-5741-99a3f6009dc5@viisauksena.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 4 Aug 2016 10:15:34 +0200
Message-ID: <CAHmME9oNd9o6rzqPU-Lh69E09oWb8_gHApxuD5+asAdQbgAcwA@mail.gmail.com>
To: jens <jens@viisauksena.de>
Content-Type: multipart/alternative; boundary=001a11418d6cfd74c305393a8d85
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] LEDE / OpenWrt test - on TP-Link841Nv11 - 15MBs and
	crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11418d6cfd74c305393a8d85
Content-Type: text/plain; charset=UTF-8

Hello Jens,

Your prior communications have not been clear to me, and recently somebody
took the mailing list off the CC. In order to steer this conversation back
on a useful track, please check all that apply:

[  ] I have tried removing "sk_clear_memalloc(sock);" and
"sk_set_memalloc(sock->sk);"
from socket.c, and the problem still continued.
[  ] I have tried removing "sock->sk->sk_sndbuf = INT_MAX;" from socket.c,
and the problem still continued.
[  ] I do not know how or am unable to make changes to the source code,
recompile, and test these changes.
[  ] I have an extra device that I can mail to Jason so that he can debug
the issue.

Thanks,
Jason

--001a11418d6cfd74c305393a8d85
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Jens,<div><br></div><div>Your prior communications h=
ave not been clear to me, and recently somebody took the mailing list off t=
he CC. In order to steer this conversation back on a useful track, please c=
heck all that apply:</div><div><br></div><div>[ =C2=A0] I have tried removi=
ng &quot;<span style=3D"font-size:12.8px">sk_clear_memalloc(sock);&quot; an=
d &quot;</span><span style=3D"font-size:12.8px">sk_set_memalloc(sock-&gt;sk=
);&quot; from socket.c, and the problem still continued.</span></div><div><=
span style=3D"font-size:12.8px">[ =C2=A0] I have tried removing &quot;</spa=
n><span style=3D"font-size:12.8px">sock-&gt;sk-&gt;sk_sndbuf =3D INT_MAX;&q=
uot; from socket.c, and the problem still continued.</span></div><div><span=
 style=3D"font-size:12.8px">[ =C2=A0] I do not know how or am unable to mak=
e changes to the source code, recompile, and test these changes.</span></di=
v><div><span style=3D"font-size:12.8px">[ =C2=A0] I have an extra device th=
at I can mail to Jason so that he can debug the issue.</span></div><div><sp=
an style=3D"font-size:12.8px"><br></span></div><div><span style=3D"font-siz=
e:12.8px">Thanks,</span></div><div><span style=3D"font-size:12.8px">Jason</=
span></div></div>

--001a11418d6cfd74c305393a8d85--
