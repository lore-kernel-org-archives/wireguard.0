Return-Path: sg5414@g.rit.edu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a80491b
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jul 2017 23:48:13 +0000 (UTC)
Received: from mx03b-out01ag.rit.edu (mx03b-out01ag.rit.edu [129.21.3.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9dec4ba
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Jul 2017 23:48:13 +0000 (UTC)
From: Sahil Gupta <sg5414@rit.edu>
Received: by mail-pg0-f72.google.com with SMTP id d193so82451826pgc.0
 for <wireguard@lists.zx2c4.com>; Fri, 21 Jul 2017 17:07:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1500681823.1017135.1048796128.794D7A24@webmail.messagingengine.com>
References: <CAA8CD9vTW5XJVDjhE=5t6e8midm6LivLYqLHBrT98riTYnP3kQ@mail.gmail.com>
 <CAA8CD9s67yT1esUYwyo5rmsZAKahoXn86AAX8faccgvTcA8_xw@mail.gmail.com>
 <CAHmME9pQR3hmHJjV-wUah2wqYGKqSw+HipuQH6F92hVgD4FBrg@mail.gmail.com>
 <1500680038.1009000.1048775720.4A6974DA@webmail.messagingengine.com>
 <CAA8CD9uBLq_2NsVVDYw8MkJa19a86YabtWrvmx1qsNxzhx+scw@mail.gmail.com>
 <1500681823.1017135.1048796128.794D7A24@webmail.messagingengine.com>
Date: Fri, 21 Jul 2017 20:07:47 -0400
Message-ID: <CAA8CD9vAD2aqjwQ+tpO_T-X_8PsoXLi8Fs7Q=GwT1X++eO_wRQ@mail.gmail.com>
Subject: Re: Not able to ping the host as per demo of wireguard.
To: Eric Light <eric@ericlight.com>
Content-Type: multipart/alternative; boundary="089e082347289a80090554dcc561"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: sg5414@rit.edu
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--089e082347289a80090554dcc561
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Eric.
I will do that.
=F0=9F=98=8A

On Fri, Jul 21, 2017 at 8:03 PM, Eric Light <eric@ericlight.com> wrote:

> Yep you can make them permanent.  Create your config in
> /etc/wireguard/wg0.conf.  Then run 'systemctl enable wg-quick@wg0'
>  (assuming you're running systemd).
>
> wg-quick takes care of interface creation, interface and endpoint IP
> addressing, routing, and peer keys; so you just create that file and then
> use 'wg-quick up wg0'.  :)
>
> I wrote a few blog posts on setting up wg to act as a bridge into a remot=
e
> network; you can probably use a lot of the info from there to get you
> started:   https://www.ericlight.com/wireguard-part-one-installation
>
> E
>
> --------------------------------------------
> Q: Why is this email five sentences or less?
> A: http://five.sentenc.es
>
>
>
> On Sat, 22 Jul 2017, at 11:54, Sahil Gupta wrote:
>
> Sorry, my bad.
> I copy paste configuration of Peer A in both Peer A and B in this email.
> I will follow the advise of Jason.
>
> I switched off both Laptops and now wg interface are gone.
> I need to create them again.
> Can we make these interfaces permanent so they will not go upon switching
> off the laptop?
>
> I will mail again if problem still persists.
> Thanks
> Sahil Gupta
>
>
>

--089e082347289a80090554dcc561
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Eric.<br>I will do that.<br>=F0=9F=98=8A<br></div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Jul 21, 20=
17 at 8:03 PM, Eric Light <span dir=3D"ltr">&lt;<a href=3D"mailto:eric@eric=
light.com" target=3D"_blank">eric@ericlight.com</a>&gt;</span> wrote:<br><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><u></u>




<div><div>Yep you can make them permanent.=C2=A0 Create your config in /etc=
/wireguard/wg0.conf.=C2=A0 Then run &#39;systemctl enable wg-quick@wg0&#39;=
 =C2=A0(assuming you&#39;re running systemd).<br></div>
<div><br></div>
<div>wg-quick takes care of interface creation, interface and endpoint IP a=
ddressing, routing, and peer keys; so you just create that file and then us=
e &#39;wg-quick up wg0&#39;. =C2=A0:)</div>
<div><br></div>
<div>I wrote a few blog posts on setting up wg to act as a bridge into a re=
mote network; you can probably use a lot of the info from there to get you =
started: =C2=A0=C2=A0<a href=3D"https://www.ericlight.com/wireguard-part-on=
e-installation" target=3D"_blank">https://www.ericlight.com/<wbr>wireguard-=
part-one-<wbr>installation</a><br></div><span class=3D"">
<div><br></div>
<div>E</div>
<div><br></div>
<div id=3D"m_1256548775279209199sig66226376"><div class=3D"m_12565487752792=
09199signature">------------------------------<wbr>--------------<br></div>
<div class=3D"m_1256548775279209199signature">Q: Why is this email five sen=
tences or less?<br></div>
<div class=3D"m_1256548775279209199signature">A: <a href=3D"http://five.sen=
tenc.es" target=3D"_blank">http://five.sentenc.es</a><br></div>
<div class=3D"m_1256548775279209199signature"><br></div>
</div>
<div><br></div>
<div><br></div>
</span><div><div class=3D"h5"><div>On Sat, 22 Jul 2017, at 11:54, Sahil Gup=
ta wrote:<br></div>
<blockquote type=3D"cite"><div dir=3D"ltr"><div>Sorry, my bad.<br></div>
<div>I copy=C2=A0paste configuration of Peer A in both Peer A and B in this=
 email.<br></div>
<div>I will follow the advise of Jason.<br></div>
<div><br></div>
<div><div>I switched off both Laptops and now wg interface are gone.<br></d=
iv>
<div>I need to create them again.<br></div>
<div>Can we make these interfaces permanent so they will not go upon switch=
ing off the laptop?<br></div>
</div>
<div><br></div>
<div><div>I will mail again if problem still persists.<br></div>
</div>
<div><div>Thanks<br></div>
<div>Sahil Gupta<br></div>
</div>
</div>
</blockquote><div><br></div>
</div></div></div>

</blockquote></div><br></div>

--089e082347289a80090554dcc561--
