Return-Path: texteditor.si@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ffac6680
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 May 2017 22:52:21 +0000 (UTC)
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
 [209.85.218.53])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8fe3c632
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 May 2017 22:52:21 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id l18so260869849oig.2
 for <wireguard@lists.zx2c4.com>; Wed, 24 May 2017 16:04:40 -0700 (PDT)
MIME-Version: 1.0
From: Text Editor <texteditor.si@gmail.com>
Date: Wed, 24 May 2017 19:04:38 -0400
Message-ID: <CAL+S5MVFd9Z=70X67E69-XcEq7hO76UT6vmzLGj+0YS8vhfedA@mail.gmail.com>
Subject: Can't seem to split tunnel using tables the way I can in OpenVPN
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="001a11407770f0921905504d20d3"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11407770f0921905504d20d3
Content-Type: text/plain; charset="UTF-8"

Trying to replicate my OpenVPN routing setup, tunnel is split to go to /24
subnet inside OpenVPN without the default traffic going through it.

However, it is setup to use a gateway in OpenVPN to reach the internet when
packets go through the interface


Copying this setup over to Wireguard seems to break - I can ping the
endpoints inside the Wireguard VPN, but trying to reach the internet via
the internet seems to not work



Configuration files on the Server side:

https://pastebin.com/raw/TJvKazSL

Configuration files on the Server side:

https://pastebin.com/raw/2t760WvY


This same concept works on OpenVPN without issue, not sure what is happening

--001a11407770f0921905504d20d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div>Trying to replicate my OpenVPN routing=
 setup, tunnel is split to go to /24 subnet inside OpenVPN without the defa=
ult traffic going through it.<br><br></div>However, it is setup to use a ga=
teway in OpenVPN to reach the internet when packets go through the interfac=
e<br><br><br></div>Copying this setup over to Wireguard seems to break - I =
can ping the endpoints inside the Wireguard VPN, but trying to reach the in=
ternet via the internet seems to not work<br><br><br><br></div>Configuratio=
n files on the Server side:<br><br><a href=3D"https://pastebin.com/raw/TJvK=
azSL">https://pastebin.com/raw/TJvKazSL</a><br><br>Configuration files on t=
he Server side:<br><br><a href=3D"https://pastebin.com/raw/2t760WvY">https:=
//pastebin.com/raw/2t760WvY</a><br><br><br></div>This same concept works on=
 OpenVPN without issue, not sure what is happening<br></div>

--001a11407770f0921905504d20d3--
