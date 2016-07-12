Return-Path: quanzhou822@gmail.com
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
 [209.85.161.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 300a7c41
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Jul 2016 15:42:00 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id j17so17538373ywg.0
 for <wireguard@lists.zx2c4.com>; Tue, 12 Jul 2016 08:42:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qw1Ymrjyfhkmh7YOBgBuKGP5r=VdurAR1KLpaoFzqCyQ@mail.gmail.com>
References: <CAMRLKH8cAu+sD0Pss=GGVbqGUiZxvE3HT1sVgTsRFyKiQGpOog@mail.gmail.com>
 <CAHmME9pueP4YvQ4GJAhq7D06_MdDYq024vR5RSEj7cL1zx4qiQ@mail.gmail.com>
 <CAMRLKH_Ve7cnhYP9ZtBT868m298fhxKYvRAEHhkdCVfmpVZbSQ@mail.gmail.com>
 <CAHmME9qw1Ymrjyfhkmh7YOBgBuKGP5r=VdurAR1KLpaoFzqCyQ@mail.gmail.com>
From: Quan Zhou <quanzhou822@gmail.com>
Date: Tue, 12 Jul 2016 23:42:28 +0800
Message-ID: <CAMRLKH8Dh6dKbCZBDM2OeSpJ4PAO-K=KORQR+6rmttONP8eWhQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=94eb2c064372fa29cb0537721e1e
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Troubleshooting with WireGuard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c064372fa29cb0537721e1e
Content-Type: text/plain; charset=UTF-8

I'm trying to connect to [2600:3c01:..:1487]:41414 from [2400:6180:...:1]

I have added the specific IPv6 /128 address to the AllowedIPs on one side,
and
on the other side I simply put ::0/0.

The address I've set was:

srv1 # ip addr add 10.240.51.2/24 dev wg0
srv2 # ip addr add 10.240.65.2/24 dev wg0

I will deal with routing later, with OSPF or simply a static route. Right
now the
problem is:

Jul 12 15:32:41 debian kernel: [1081190.595578] Invalid MAC of handshake,
dropping packet from [2400:...:aec:1]:41414/0%0

Having no idea about handshake, what should I do next.

On Tue, Jul 12, 2016 at 5:05 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi Quan,
>
> WireGuard is a layer 3 tunnel device, so AllowedIPs should probably be
> a different IP than endpoint unless you've set up some policy based
> routing. Also, you'll need to configure the devices with ip-addr too
> -- what were your commands there?
>
> Regards,
> Jason
>



-- 
Regards,

Quan Zhou
+------------------------+
|pub [expires 2019-05-04]|
|2C0C 4D88 E631 4C73 4C44|
|CDE0 C0E 5470 1D2D 3F3EE|
+------------------------+
|pub [revoked 2016-04-16]|
|44D2 0307 1643 E80F 2E31|
|F081 FAFA 6643 7F9F D46F|
+------------------------+
|quanzhou822@gmail.com   |
|https://keybase.io/qzhou|
+------------------------+

--94eb2c064372fa29cb0537721e1e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m trying to connect to [2600:3c01:..:1487]:41414 fro=
m [2400:6180:...:1]<div><br><div>I have added the specific IPv6 /128 addres=
s to the AllowedIPs on one side, and</div><div>on the other side I simply p=
ut ::0/0.</div><div><br></div><div>The address I&#39;ve set was:</div><div>=
<br></div><div>srv1 # ip=C2=A0addr add <a href=3D"http://10.240.51.2/24">10=
.240.51.2/24</a> dev wg0</div><div>srv2 # ip addr add <a href=3D"http://10.=
240.65.2/24">10.240.65.2/24</a> dev wg0</div><div><br></div><div>I will dea=
l with routing later, with OSPF or simply a static route. Right now the</di=
v><div>problem is:</div><div><br></div><div>Jul 12 15:32:41 debian kernel: =
[1081190.595578] Invalid MAC of handshake, dropping packet from [2400:...:a=
ec:1]:41414/0%0</div></div><div><br></div><div>Having no idea about handsha=
ke, what should I do next.</div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On Tue, Jul 12, 2016 at 5:05 PM, Jason A. Donenfeld <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Ja=
son@zx2c4.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Qu=
an,<br>
<br>
WireGuard is a layer 3 tunnel device, so AllowedIPs should probably be<br>
a different IP than endpoint unless you&#39;ve set up some policy based<br>
routing. Also, you&#39;ll need to configure the devices with ip-addr too<br=
>
-- what were your commands there?<br>
<br>
Regards,<br>
Jason<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><font face=3D"monospace, monospace">Regards,<=
br><br>Quan Zhou<br></font><span style=3D"font-family:monospace,monospace;f=
ont-size:12.8px">+------------------------+</span></div><div dir=3D"ltr"><f=
ont face=3D"monospace, monospace">|pub [expires 2019-05-04]|</font><br styl=
e=3D"font-family:monospace,monospace;font-size:12.8px"><font face=3D"monosp=
ace, monospace">|2C0C 4D88 E631 4C73 4C44|<br>|CDE0 C0E 5470 1D2D 3F3EE|</f=
ont></div><div dir=3D"ltr"><font face=3D"monospace, monospace">+-----------=
-------------+<br>|pub [revoked 2016-04-16]|<br>|44D2 0307 1643 E80F 2E31|<=
br>|F081 FAFA 6643 7F9F D46F|<br>+------------------------+<br>|<a href=3D"=
mailto:quanzhou822@gmail.com" target=3D"_blank">quanzhou822@gmail.com</a>=
=C2=A0 =C2=A0|<br>|<a href=3D"https://keybase.io/qzhou" target=3D"_blank">h=
ttps://keybase.io/qzhou</a>|<br>+------------------------+</font></div></di=
v></div></div></div></div></div></div></div>
</div>

--94eb2c064372fa29cb0537721e1e--
