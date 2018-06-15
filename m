Return-Path: antonshpilevoy@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b869f11
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jun 2018 15:39:33 +0000 (UTC)
Received: from mail-wm0-x230.google.com (mail-wm0-x230.google.com
 [IPv6:2a00:1450:400c:c09::230])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ace48a9
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jun 2018 15:39:33 +0000 (UTC)
Received: by mail-wm0-x230.google.com with SMTP id p126-v6so4256198wmb.2
 for <wireguard@lists.zx2c4.com>; Fri, 15 Jun 2018 08:43:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9orL-E8oMioLHf4yNWprrZ-=x73KgEk8xmJDQ5SxK77dw@mail.gmail.com>
References: <CAEyvJ0dTyuN+76QShpTWvr6_6TWyhaJAS6RaU7x=cP4bquqLQQ@mail.gmail.com>
 <CAHmME9oLbsfdi2XO8DP+YP+hDT9DrdVD+BEpVpsGz-sQALTV_w@mail.gmail.com>
 <CAEyvJ0dSBkh+rZyZWBaxho9vkh1FDBDcEEfE_D6Ls0-UQoW40g@mail.gmail.com>
 <CAHmME9qXbhOE1Fu6Ft2MT6cGqN+AHpnwCF_WzgEJY7fsuERD5Q@mail.gmail.com>
 <CAEyvJ0fWcjQH6EU0VkfNa_0TKn1=xFiBSPjJjVJpT+zb0ea8CQ@mail.gmail.com>
 <CAHmME9orL-E8oMioLHf4yNWprrZ-=x73KgEk8xmJDQ5SxK77dw@mail.gmail.com>
From: Anton Shpilevoy <antonshpilevoy@gmail.com>
Date: Fri, 15 Jun 2018 20:43:19 +0500
Message-ID: <CAEyvJ0e4a0cOqiAheb2z+OYngZRfPvs7gcw8UuuzqCLu+XuDvQ@mail.gmail.com>
Subject: Re: problem with Mac OS
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="00000000000074c851056eb01437"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--00000000000074c851056eb01437
Content-Type: text/plain; charset="UTF-8"

stat --version
stat (GNU coreutils) 8.29
Copyright (C) 2017 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <
https://gnu.org/licenses/gpl.html>.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

Written by Michael Meskes.

>>Jason A. Donenfeld  wrote: There's your problem. You've installed gnu
coreutils to PATH.

That was it. The problem is gone after
brew uninstall coreutils

Thank you again Jason.

--00000000000074c851056eb01437
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">stat --version<br>stat (GNU coreutils) 8.29<br>Copyright (=
C) 2017 Free Software Foundation, Inc.<br>License GPLv3+: GNU GPL version 3=
 or later &lt;<a href=3D"https://gnu.org/licenses/gpl.html">https://gnu.org=
/licenses/gpl.html</a>&gt;.<br>This is free software: you are free to chang=
e and redistribute it.<br>There is NO WARRANTY, to the extent permitted by =
law.<br><br>Written by Michael Meskes.<br><br>&gt;&gt;Jason A. Donenfeld=C2=
=A0 wrote: There&#39;s your problem. You&#39;ve installed gnu coreutils to =
PATH.<div><br></div><div>That was it. T<span style=3D"font-size:small;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial;float:none;display:inline">he problem is gone after</span></d=
iv><div>brew uninstall coreutils=C2=A0<br></div><div><br></div><div>Thank y=
ou again Jason.=C2=A0</div></div>

--00000000000074c851056eb01437--
