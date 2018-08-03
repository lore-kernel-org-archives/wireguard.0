Return-Path: iddqd.x84@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f608043a
 for <wireguard@lists.zx2c4.com>; Fri, 3 Aug 2018 10:31:10 +0000 (UTC)
Received: from mail-io0-x236.google.com (mail-io0-x236.google.com
 [IPv6:2607:f8b0:4001:c06::236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0d4b21e
 for <wireguard@lists.zx2c4.com>; Fri, 3 Aug 2018 10:31:10 +0000 (UTC)
Received: by mail-io0-x236.google.com with SMTP id z19-v6so4598275ioh.4
 for <wireguard@lists.zx2c4.com>; Fri, 03 Aug 2018 03:41:37 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Woyzek <iddqd.x84@gmail.com>
Date: Fri, 3 Aug 2018 12:41:35 +0200
Message-ID: <CAKg0LU=6BAj17882is6t85b4F+S80KAOnm6Bm0p34CaofXJUUw@mail.gmail.com>
Subject: reconnecting client (LTE) with dynamic IPv4
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="0000000000006b6d7f057285927c"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000006b6d7f057285927c
Content-Type: text/plain; charset="UTF-8"

Hi

I'm trying to run wireguard on an embedded linux device instead of openvpn.

Everything is going as planned, until the client receives a new IP from the
mobile provider (LTE, ipv4), e.g. after a reconnect.

The endpoint, debian router behind nat does not recognize the new IP from
the embedded device. And the "last handashake" is just keep going. Sometimes
it works, but mostly not.
The embedded device use libqmi but over ethernet is the same issue.

Only a restart of the WG interface on the router brings the connection up
again.

What am I doing wrong?

Best regards,

TOM

--0000000000006b6d7f057285927c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi</div><div><br></div><div><div id=3D"gmail-gt-src-c=
" class=3D"gmail-g-unit"><div id=3D"gmail-gt-src-c" class=3D"gmail-g-unit">=
  </div> <div id=3D"gmail-gt-res-c" class=3D"gmail-g-unit"><div id=3D"gmail=
-gt-res-p"><div id=3D"gmail-gt-res-data"><div id=3D"gmail-gt-res-wrap"><div=
 id=3D"gmail-gt-res-content"><div id=3D"gmail-gt-res-dir-ctr" dir=3D"ltr" c=
lass=3D"gmail-trans-verified-button-small"><span id=3D"gmail-result_box" cl=
ass=3D"gmail-" lang=3D"en"><span>I&#39;m trying to run wireguard on an embe=
dded linux device <span id=3D"gmail-result_box" class=3D"gmail-short_text" =
lang=3D"en"><span class=3D"gmail-">instead of</span></span> openvpn.</span>=
<br><br><span class=3D"gmail-">Everything is going as planned, until the cl=
ient receives a new IP from the mobile provider (LTE, ipv4), e.g.</span> <s=
pan>after a reconnect.</span><br></span></div><div dir=3D"ltr" class=3D"gma=
il-trans-verified-button-small"><span id=3D"gmail-result_box" class=3D"gmai=
l-" lang=3D"en"><br></span></div><div dir=3D"ltr" class=3D"gmail-trans-veri=
fied-button-small"><span id=3D"gmail-result_box" class=3D"gmail-" lang=3D"e=
n"><span class=3D"gmail-">The endpoint, debian router behind nat does not r=
ecognize the new IP from the embedded device. And the &quot;last handashake=
&quot; is <span id=3D"gmail-result_box" class=3D"gmail-short_text" lang=3D"=
en"><span class=3D"gmail-">just keep going</span></span>. <span id=3D"gmail=
-result_box" class=3D"gmail-" lang=3D"en"><span id=3D"gmail-result_box" cla=
ss=3D"gmail-short_text" lang=3D"en"><span class=3D"gmail-">Sometimes it wor=
ks</span></span></span>, but <span id=3D"gmail-result_box" class=3D"gmail-s=
hort_text" lang=3D"en"><span class=3D"gmail-">mostly not</span></span>.<br>=
</span></span></div><div dir=3D"ltr" class=3D"gmail-trans-verified-button-s=
mall"><span id=3D"gmail-result_box" class=3D"gmail-" lang=3D"en"><span clas=
s=3D"gmail-">The embedded device use libqmi but over ethernet is the same i=
ssue.</span><br><br><span class=3D"gmail-">Only a restart of the WG interfa=
ce on the router brings the connection up again.</span></span></div></div><=
/div></div></div></div><br>  </div> <div id=3D"gmail-gt-res-c" class=3D"gma=
il-g-unit"><div id=3D"gmail-gt-res-p"><div id=3D"gmail-gt-res-data"><div id=
=3D"gmail-gt-res-wrap"><div id=3D"gmail-gt-res-content"><div id=3D"gmail-gt=
-res-dir-ctr" dir=3D"ltr" class=3D"gmail-trans-verified-button-large"><span=
 id=3D"gmail-result_box" class=3D"gmail-short_text" lang=3D"en"><span class=
=3D"gmail-">What am I doing wrong?</span></span></div></div></div></div></d=
iv></div></div><div><br></div><div>Best regards,</div><div><br></div><div>T=
OM<br></div><div><div><br></div><div><br></div><div><br></div></div></div>

--0000000000006b6d7f057285927c--
