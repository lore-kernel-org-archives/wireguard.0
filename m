Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ffc4a284
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 21:39:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c02a902d
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 21:39:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92b75392
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 21:15:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8dc4a6cb
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 21:15:27 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id 77-v6so5046666otd.4
 for <wireguard@lists.zx2c4.com>; Fri, 20 Apr 2018 14:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <1524220589.2059.27.camel@gmail.com>
In-Reply-To: <1524220589.2059.27.camel@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 20 Apr 2018 21:39:12 +0000
Message-ID: <CAHmME9q_7DK67f=TakrRimX7fs_ZrKQrNP8wHoauj3r7GwRsyQ@mail.gmail.com>
Subject: Re: Interface's Address is not saved when SaveConfig = true in config
To: ST <smntov@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007af541056a4e8545"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000007af541056a4e8545
Content-Type: text/plain; charset="UTF-8"

Out of date iproute2?

Which distro? Version?

--
Sent from my telephone.

On Fri, Apr 20, 2018, 12:36 ST <smntov@gmail.com> wrote:

> Hello,
>
> I have
> ...
> Address = 192.168.4.1/24
> SaveConfig = true
> in wg0.conf
>
> 1. if I add a peer with `wg set wg0 peer ...` WG doesn't add it
> immediately to the wg0.conf file, only after I run `wg-quick down wg0`.
> Why not? What happens if the system crashes unexpectedly?... The peer
> will not be saved to the config file and the information will be lost.
>
>
> 2. once I run `wg-quick down wg0` I get:
>
> Option "-all" is unknown, try "ip -help".
> cat: /etc/resolvconf/run/interface/wg0: No such file or directory
> [#] wg showconf wg0
> sync: ignoring all arguments
> [#] ip link delete dev wg0
>
> Now the wg0.conf is enhanced with the peer details that was added
> through command line, but the Address = 192.168.4.1/24 disappears from
> the config. So running `wg-quick up wg0` again doesn't assigns IP to the
> wg0 interface... What's wrong?
>
> I'm using version:
> apt list wireguard
> wireguard/unstable,now 0.0.20180304-1 all [installed]
>
> Thank you!
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000007af541056a4e8545
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Out of date iproute2?<div dir=3D"auto"><br></div><div dir=
=3D"auto">Which distro? Version?<br><br><div data-smartmail=3D"gmail_signat=
ure" dir=3D"auto">--<br>Sent from my telephone.<br></div></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Apr 20, 2018, 12:36 ST &l=
t;<a href=3D"mailto:smntov@gmail.com">smntov@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Hello,<br>
<br>
I have <br>
...<br>
Address =3D <a href=3D"http://192.168.4.1/24" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">192.168.4.1/24</a><br>
SaveConfig =3D true<br>
in wg0.conf<br>
<br>
1. if I add a peer with `wg set wg0 peer ...` WG doesn&#39;t add it<br>
immediately to the wg0.conf file, only after I run `wg-quick down wg0`.<br>
Why not? What happens if the system crashes unexpectedly?... The peer<br>
will not be saved to the config file and the information will be lost.<br>
<br>
<br>
2. once I run `wg-quick down wg0` I get:<br>
<br>
Option &quot;-all&quot; is unknown, try &quot;ip -help&quot;.<br>
cat: /etc/resolvconf/run/interface/wg0: No such file or directory<br>
[#] wg showconf wg0<br>
sync: ignoring all arguments<br>
[#] ip link delete dev wg0<br>
<br>
Now the wg0.conf is enhanced with the peer details that was added<br>
through command line, but the Address =3D <a href=3D"http://192.168.4.1/24"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">192.168.4.1/24</a> disappe=
ars from<br>
the config. So running `wg-quick up wg0` again doesn&#39;t assigns IP to th=
e<br>
wg0 interface... What&#39;s wrong?<br>
<br>
I&#39;m using version:<br>
apt list wireguard<br>
wireguard/unstable,now 0.0.20180304-1 all [installed]<br>
<br>
Thank you!<br>
<br>
<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--0000000000007af541056a4e8545--
