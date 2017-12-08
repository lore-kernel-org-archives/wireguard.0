Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01faa9c8
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 20:32:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75444012
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 20:32:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 882ec59d
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 20:32:15 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 37634feb
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 20:32:14 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id x20so7958246oix.12
 for <wireguard@lists.zx2c4.com>; Fri, 08 Dec 2017 12:39:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <BC9DA88D-CB32-434E-AF02-74A862405A5D@lonnie.abelbeck.com>
References: <4B7E0154-039F-4008-9C47-C825E1474731@lonnie.abelbeck.com>
 <CAHmME9pL8+FQv_oAKCFpnZQ6ew1xmoKk-RQqtDHktWARvDXH_w@mail.gmail.com>
 <705B40D6-4947-4E5A-A042-B0C8A0D5BB84@lonnie.abelbeck.com>
 <CAHmME9rV3simg0dTD7ja-RGWGTSR0dSMgJ20ft1FXPeZyFWamw@mail.gmail.com>
 <BC9DA88D-CB32-434E-AF02-74A862405A5D@lonnie.abelbeck.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 8 Dec 2017 21:39:23 +0100
Message-ID: <CAHmME9r-Vc20LS=bQeNPH8f4+zMjyVNjYW30zX1+5-8vx5Y4cg@mail.gmail.com>
Subject: Re: [patch] add support for peer names using a file in userspace
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
Content-Type: multipart/alternative; boundary="001a113de1a41f49ee055fda2e5d"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113de1a41f49ee055fda2e5d
Content-Type: text/plain; charset="UTF-8"

On Dec 8, 2017 14:00, "Lonnie Abelbeck" <lists@lonnie.abelbeck.com> wrote:


On Dec 8, 2017, at 12:45 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

I suggested "no spaces"  since currently all spaces are stripped in
config_read_line()


Oh, okay. It's that way mostly out of my own laziness. I wouldn't object to
making that into a real parser though.

--001a113de1a41f49ee055fda2e5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">On Dec 8, 2017 14:00, &quot;Lonnie Abelbeck&quot; &lt;<a href=3D"=
mailto:lists@lonnie.abelbeck.com">lists@lonnie.abelbeck.com</a>&gt; wrote:<=
br type=3D"attribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"quoted-text"=
><br>
On Dec 8, 2017, at 12:45 PM, Jason A. Donenfeld &lt;<a href=3D"mailto:Jason=
@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br>
<br>
</div>I suggested &quot;no spaces&quot;=C2=A0 since currently all spaces ar=
e stripped in config_read_line()<br></blockquote></div></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Oh, okay. It&#39;s that way mostly ou=
t of my own laziness. I wouldn&#39;t object to making that into a real pars=
er though.</div></div>

--001a113de1a41f49ee055fda2e5d--
