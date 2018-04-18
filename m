Return-Path: ximin@dfinity.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61fb43d9
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 16:22:11 +0000 (UTC)
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
 [209.85.214.49])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f2bef98
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 16:22:11 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id h143-v6so3361241ita.4
 for <wireguard@lists.zx2c4.com>; Wed, 18 Apr 2018 09:36:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <24602785.LeAoNilrza@aoi.marionegri.it>
References: <24602785.LeAoNilrza@aoi.marionegri.it>
From: Ximin Luo <ximin@dfinity.org>
Date: Wed, 18 Apr 2018 18:36:58 +0200
Message-ID: <CADX+UFgeoSyNJc+XPSD_RSs6o+jBWanMoK6m3Knb525wYouXTA@mail.gmail.com>
Subject: Re: [HACK] UDP tunneling over TCP for WireGuard
To: Luca Beltrame <lbeltrame@kde.org>
Content-Type: multipart/alternative; boundary="000000000000597f75056a22100d"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000597f75056a22100d
Content-Type: text/plain; charset="UTF-8"

(reposting to the list, not used to gmail)

On Wed, Apr 18, 2018 at 1:55 PM, Luca Beltrame <lbeltrame@kde.org> wrote:

> [..]
>
> Very hacky, but gets the job done. Any suggestions on how to make it
> better?
>

I wonder if anyone has written a program (likely it has to be a kernel
module) to tunnel UDP packets over "fake TCP" i.e. just put the UDP data in
a TCP packet but not actually run TCP. I'm not sure how deeply firewalls
check TCP headers to see if they are "actually" running TCP "properly", but
I'd guess it's possible to fake enough aspects of it so that it "looks
legit" and no firewall would be able to tell the difference.

X

--000000000000597f75056a22100d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">(reposting to the list, not used to gmail)<br><div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Apr 18, 2018 at =
1:55 PM, Luca Beltrame <span dir=3D"ltr">&lt;<a href=3D"mailto:lbeltrame@kd=
e.org" target=3D"_blank">lbeltrame@kde.org</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">[..]<br>
<br>
Very hacky, but gets the job done. Any suggestions on how to make it better=
?<br>
<span class=3D"gmail-HOEnZb"></span></blockquote><div><br>I wonder if anyon=
e has written a program (likely it has to be a kernel=20
module) to tunnel UDP packets over &quot;fake TCP&quot; i.e. just put the U=
DP data
 in a TCP packet but not actually run TCP. I&#39;m not sure how deeply=20
firewalls check TCP headers to see if they are &quot;actually&quot; running=
 TCP=20
&quot;properly&quot;, but I&#39;d guess it&#39;s possible to fake enough as=
pects of it so=20
that it &quot;looks legit&quot; and no firewall would be able to tell the=
=20
difference.<br><br></div><div>X<br><br></div></div></div></div></div>

--000000000000597f75056a22100d--
