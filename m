Return-Path: ferris@ferrisellis.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd95f389
 for <wireguard@lists.zx2c4.com>; Tue, 5 Dec 2017 14:41:39 +0000 (UTC)
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
 [209.85.161.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf154e37
 for <wireguard@lists.zx2c4.com>; Tue, 5 Dec 2017 14:41:39 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id r205so203407ywb.3
 for <wireguard@lists.zx2c4.com>; Tue, 05 Dec 2017 06:48:26 -0800 (PST)
Return-Path: <ferris@ferrisellis.com>
Content-Type: multipart/alternative;
 boundary=Apple-Mail-67033A07-1E02-4D82-BB91-2AACA182D29C
Mime-Version: 1.0 (1.0)
Subject: Re: File Encryption with WireGuard
From: Ferris Ellis <ferris@ferrisellis.com>
In-Reply-To: <881c121c-5a53-b937-0a3a-f7a7a75400dc@posteo.de>
Date: Tue, 5 Dec 2017 09:48:24 -0500
Message-Id: <C8A2DFA8-4E80-4720-9E8C-88E018D0D8C0@ferrisellis.com>
References: <881c121c-5a53-b937-0a3a-f7a7a75400dc@posteo.de>
To: Mytril <mytril42@posteo.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Apple-Mail-67033A07-1E02-4D82-BB91-2AACA182D29C
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Mytril,

=46rom my understanding of WireGuard (others on the mailing list feel free t=
o correct me):=20

1. This is not in any way a function WireGuard offers nor related to the pro=
jects goals.
2. If you had another program which used Curve25519 keys it could theoretica=
lly use the keys from two WireGuard clients, but that=E2=80=99s outside the s=
cope of WireGuard and also likely not a very secure practice.

Perhaps you should look into using GPG for this. Here=E2=80=99s the document=
ation page on encrypting and decrypting documents using GPG:
https://www.gnupg.org/gph/en/manual/x110.html

Cheers,
Ferris

> On Dec 5, 2017, at 9:36 AM, Mytril <mytril42@posteo.de> wrote:
>=20
> Hello,
>=20
> could it be possible, to encrypt files with WireGuard, copy it to an usb
> stick and decrypt it on another computer?
>=20
> I knew it is not what WireGuard was designed for. But could it be done?
>=20
> PS: See also RFC 1149 :D No not really
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--Apple-Mail-67033A07-1E02-4D82-BB91-2AACA182D29C
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Mytril,<br><br>=46rom my understanding o=
f WireGuard (others on the mailing list feel free to correct me):&nbsp;<div>=
<br></div><div>1. This is not in any way a function WireGuard offers nor rel=
ated to the projects goals.</div><div>2. If you had another program which us=
ed Curve25519 keys it could theoretically use the keys from two WireGuard cl=
ients, but that=E2=80=99s outside the scope of WireGuard and also likely not=
 a very secure practice.</div><div><br></div><div>Perhaps you should look in=
to using GPG for this. Here=E2=80=99s the documentation page on encrypting a=
nd decrypting documents using GPG:</div><div><a href=3D"https://www.gnupg.or=
g/gph/en/manual/x110.html">https://www.gnupg.org/gph/en/manual/x110.html</a>=
<br><div><br></div><div>Cheers,</div><div>Ferris</div><div><br></div><div>On=
 Dec 5, 2017, at 9:36 AM, Mytril &lt;<a href=3D"mailto:mytril42@posteo.de">m=
ytril42@posteo.de</a>&gt; wrote:<br><br></div><blockquote type=3D"cite"><div=
><span>Hello,</span><br><span></span><br><span>could it be possible, to encr=
ypt files with WireGuard, copy it to an usb</span><br><span>stick and decryp=
t it on another computer?</span><br><span></span><br><span>I knew it is not w=
hat WireGuard was designed for. But could it be done?</span><br><span></span=
><br><span>PS: See also RFC 1149 :D No not really</span><br><span>__________=
_____________________________________</span><br><span>WireGuard mailing list=
</span><br><span><a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@list=
s.zx2c4.com</a></span><br><span><a href=3D"https://lists.zx2c4.com/mailman/l=
istinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a></s=
pan><br></div></blockquote></div></body></html>=

--Apple-Mail-67033A07-1E02-4D82-BB91-2AACA182D29C--
