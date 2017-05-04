Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0410172
 for <wireguard@lists.zx2c4.com>; Thu, 4 May 2017 18:25:53 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 215eff47
 for <wireguard@lists.zx2c4.com>; Thu, 4 May 2017 18:25:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4c1cf23
 for <wireguard@lists.zx2c4.com>; Thu, 4 May 2017 18:25:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 284945f7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 May 2017 18:25:53 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id 131so1063671itz.1
 for <wireguard@lists.zx2c4.com>; Thu, 04 May 2017 11:35:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9p0L8WjCvcrtk+8AeOxmnExSK5YhnCcNbYmxmp_Yc_ejg@mail.gmail.com>
References: <CAM3m09RKuXF=HkvGFpH3=VxW2PvqDx2BpB3yfLkMcZgLhm_X9w@mail.gmail.com>
 <CAHmME9p0L8WjCvcrtk+8AeOxmnExSK5YhnCcNbYmxmp_Yc_ejg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 4 May 2017 20:35:40 +0200
Message-ID: <CAHmME9oeaMNrbN1Eek=0p7xR54oCZgBRVjnR-UgcQAoPaJczGQ@mail.gmail.com>
Subject: Re: Specifying the source port
To: Ryan Whelan <rcwhelan@gmail.com>
Content-Type: multipart/alternative; boundary=001a113adb123a870a054eb70a0c
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113adb123a870a054eb70a0c
Content-Type: text/plain; charset=UTF-8

"ListenPort", " listen-port"

On May 4, 2017 20:21, "Ryan Whelan" <rcwhelan@gmail.com> wrote:

Hello!

When specifying an endpoint, you have to tell wg which dst port the peer is
listening on- is it possible to tell wg which source port to send traffic
from?  I've looked over the documentation and if its in there, I managed to
miss it.

Thanks!

ryan

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--001a113adb123a870a054eb70a0c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>&quot;ListenPort&quot;, &quot; listen-port&quot;<br>=
<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On May 4, 2017 20=
:21, &quot;Ryan Whelan&quot; &lt;<a href=3D"mailto:rcwhelan@gmail.com">rcwh=
elan@gmail.com</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr">Hello!<div><br></div><div>When specifying an endpoint,=
 you have to tell wg which dst port the peer is listening on- is it possibl=
e to tell wg which source port to send traffic from?=C2=A0 I&#39;ve looked =
over the documentation and if its in there, I managed to miss it.</div><div=
><br></div><div>Thanks!</div><font color=3D"#888888"><div><br></div><div>ry=
an</div></font></div>
<br>______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo/wire=
guard</a><br>
<br></blockquote></div><br></div></div></div>

--001a113adb123a870a054eb70a0c--
