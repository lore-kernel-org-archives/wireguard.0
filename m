Return-Path: debee1jp@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2891ec0
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Feb 2018 16:51:48 +0000 (UTC)
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
 [209.85.214.47])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2acc4eb
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Feb 2018 16:51:48 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id j21so13419937ita.1
 for <wireguard@lists.zx2c4.com>; Wed, 14 Feb 2018 08:58:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qVoBkdu35n4aGdZ8nCH6ONZhcGb=WCGx2LGbyHgJMTSw@mail.gmail.com>
References: <7d5325a3-fa07-f67f-a31e-aadd44458d41@student.tuwien.ac.at>
 <CAHmME9qVoBkdu35n4aGdZ8nCH6ONZhcGb=WCGx2LGbyHgJMTSw@mail.gmail.com>
From: Jordan DeBeer <debee1jp@gmail.com>
Date: Wed, 14 Feb 2018 11:58:39 -0500
Message-ID: <CAFi5oX6LM+A=jbPmhffc4wT+pKmMg8xi=2ebSMg=s7Qg2AY_sw@mail.gmail.com>
Subject: Re: NetworkManager Plugin
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="94eb2c05ad76e95e6505652f0580"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c05ad76e95e6505652f0580
Content-Type: text/plain; charset="UTF-8"

Hello Max,

I went ahead and tested this on Fedora 27 w/ NetworkManager 1.8.6-1.fc27
and was able to get it working.  A few things I noticed:

Starting the VPN with SELinux enabled results in a number of alerts.
Mostly for the sysctl source process.  This is to be expected as you
mentioned you were testing on Arch.  If this ever ends up getting packaged
for Fedora the policies can probably be added to the RPM.

The DNS field under Identity does not currently function.  I am not sure
how you want to handle this field as NetworkManager has their own DNS field
under the IPv4 tab in the GUI.

The Endpoint section of the GUI only accepts IP addresses and not FQDNs.

and the last thing I noticed: the Private Key section is required.  This
breaks functionality if you were to have your private key stored in a
password manager.  This is solvable by just pasting a properly formatted
key (I just used my public key) into the field and adding a Post Up script
to grab the private key string.

I am going to keep playing around with this and possibly work on packaging
it into an RPM.

This adds quite a bit of value to Wireguard imo so glad to see you worked
on this.  Thank you!

Cheers,
Jordan DeBeer

On Wed, Feb 14, 2018 at 10:28 AM, Jason A. Donenfeld <Jason@zx2c4.com>
wrote:

> Hey Max,
>
> This is wonderful news. I'm happy to work with you to make sure this
> comes out perfectly, and maybe when it's finished we can submit it
> upstream to NetworkManager, similar to how systemd-networkd now has
> WireGuard support built-in.
>
> The biggest hurdle I currently see is entirely removing the dependency
> on wg-quick and wg, and talking Netlink yourself to the kernel, just
> like systemd-networkd does. It shouldn't be too hard to adopt the
> libmnl-based code in wg(8) to be suitable for your usage; I can assist
> with this. In general, the fwmark/routing logic of wg-quick should
> probably be done in a NetworkManager-centric way, which means not
> using wg-quick.
>
> Looks like things are off to a great start!
>
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--94eb2c05ad76e95e6505652f0580
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div><div>Hello Max,<br=
><br></div>I went ahead and tested this on Fedora 27 w/ NetworkManager 1.8.=
6-1.fc27 and was able to get it working.=C2=A0 A few things I noticed:<br><=
/div><br>Starting the VPN with SELinux enabled results in a number of alert=
s.=C2=A0 Mostly for the sysctl source process.=C2=A0 This is to be expected=
 as you mentioned you were testing on Arch.=C2=A0 If this ever ends up gett=
ing packaged for Fedora the policies can probably be added to the RPM.<br><=
br></div>The DNS field under Identity does not currently function.=C2=A0 I =
am not sure how you want to handle this field as NetworkManager has their o=
wn DNS field under the IPv4 tab in the GUI.<br><br></div>The Endpoint secti=
on of the GUI only accepts IP addresses and not FQDNs.<br><br></div>and the=
 last thing I noticed: the Private Key section is required.=C2=A0 This brea=
ks functionality if you were to have your private key stored in a password =
manager.=C2=A0 This is solvable by just pasting a properly formatted key (I=
 just used my public key) into the field and adding a Post Up script to gra=
b the private key string.<br><br></div>I am going to keep playing around wi=
th this and possibly work on packaging it into an RPM.=C2=A0 <br><br></div>=
This adds quite a bit of value to Wireguard imo so glad to see you worked o=
n this.=C2=A0 Thank you!=C2=A0 <br><br></div>Cheers,<br></div>Jordan DeBeer=
<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed,=
 Feb 14, 2018 at 10:28 AM, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a href=
=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">Hey Max,<br>
<br>
This is wonderful news. I&#39;m happy to work with you to make sure this<br=
>
comes out perfectly, and maybe when it&#39;s finished we can submit it<br>
upstream to NetworkManager, similar to how systemd-networkd now has<br>
WireGuard support built-in.<br>
<br>
The biggest hurdle I currently see is entirely removing the dependency<br>
on wg-quick and wg, and talking Netlink yourself to the kernel, just<br>
like systemd-networkd does. It shouldn&#39;t be too hard to adopt the<br>
libmnl-based code in wg(8) to be suitable for your usage; I can assist<br>
with this. In general, the fwmark/routing logic of wg-quick should<br>
probably be done in a NetworkManager-centric way, which means not<br>
using wg-quick.<br>
<br>
Looks like things are off to a great start!<br>
<br>
Jason<br>
______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo/wire=
guard</a><br>
</blockquote></div><br></div>

--94eb2c05ad76e95e6505652f0580--
