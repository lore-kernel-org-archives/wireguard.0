Return-Path: jason.donenfeld@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3996e97
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Aug 2018 00:34:56 +0000 (UTC)
Received: from mail-oi0-x230.google.com (mail-oi0-x230.google.com
 [IPv6:2607:f8b0:4003:c06::230])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 936d126b
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Aug 2018 00:34:56 +0000 (UTC)
Received: by mail-oi0-x230.google.com with SMTP id m11-v6so21834578oic.2
 for <wireguard@lists.zx2c4.com>; Sat, 11 Aug 2018 17:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
 <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
 <CAHmME9pQJ4-1AGGUd63Nsys2_5tVxecH2rWqVScWdMgNyG_zOA@mail.gmail.com>
 <CAJq09z5GX4QxqhN7j4UC+2cM=fp4FKpZm1gsyREy1f_vhXGzyg@mail.gmail.com>
 <fb5cc651-e249-c5f1-f42c-d46198a8e36b@gmail.com>
In-Reply-To: <fb5cc651-e249-c5f1-f42c-d46198a8e36b@gmail.com>
From: "Jason A. Donenfeld" <jason.donenfeld@gmail.com>
Date: Sat, 11 Aug 2018 17:46:10 -0700
Message-ID: <CAHmME9pfsYbBfxOAOv0GhGe6Xb7HbZH00OVNZ2bFFfAnQUdGNQ@mail.gmail.com>
Subject: Re: Reflections on WireGuard Design Goals
To: A Jones <aaronmdjones@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b15bce0573324e92"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: Jason@zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000b15bce0573324e92
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 11, 2018, 17:15 Aaron Jones <aaronmdjones@gmail.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA512
>
> On 11/08/18 22:52, Luiz Angelo Daros de Luca wrote:
> > I see these wireguard extra features just like dhcp is. Nobody
> > thinks about implementing dhcp inside kernel or even iproute
> > tools.
>
> The Linux kernel has a (minimal, non-configurable) DHCP client already
> (used for rootfs on NFS without an initramfs, among other things).
>
> CONFIG_IP_PNP_BOOTP=y
>

This is in fact true, but I'm not sure we're planning on following suite
with that kind of thing in kernel space for WireGuard...




> -----BEGIN PGP SIGNATURE-----
> Comment: Using GnuPG with Thunderbird - https://www.enigmail.net/
>
> iQIzBAEBCgAdFiEEYKVBwe43zZh/jkxPivBzdIirMBIFAltvfB4ACgkQivBzdIir
> MBLldA//aCK1DHoew8joweZkI2coLZjolMqPActFDTtDkIXAka3guJjh2zVDCxVF
> 45AdF1Xv7jhmuDB4emCgH6ANk0vPDAHvs6SBYYZgHvvHdNbBzmM9FqJFk01KHUkl
> LhPVCjR9T9EMNifoP5EI1R3YTpoAQbUpaJJ9K12rumdGMelpVU7qg7hW7VkscwAq
> WtmN/wuD3w3mZKH+TvtlT409JefvocvE9kA7NUXWOZ9Bxxj3pEJIVTmquE6MS4rm
> zHcQ7hY3JR7cPg4Imc0FHuyvbU55R2AnU9+00+dTUISlBT9k2pneIw4EhW0WSHLK
> uXXplZfpwV9WSiI/n1dXX1RdRc/42U6LsD4ZLPr6uxoULyeM0ahW7P2+Zq7+yt34
> gEDjwTdLSLQYpLEWhAZ4q6fBLGamZHqXgLXTtioWrIqr5eaScYJcINNjsnAEa8Kz
> 3Oo5HOxvJvEMyDz35M+04ugAbjW5LHiqWsOoWfX0A2XfDPt9mnTuiPXrGSLEPWdh
> 5OvOsPAmda4/CbJo83cRHqwhsOvoxIJX5+Ewx8giyLZ4lWIGum57wD6n6ZaUVsHZ
> 9OXA8f7LZdkxKZ/QSFi7HN9S7SRdkCbJB9E0L96AAVhPGbZuXkGavN5sIOA3fd7Y
> CWMCI3Y+x675gtYTpVooR+P1fTWgBAHOHuVFeU8e+LSHwhMallc=
> =OY67
> -----END PGP SIGNATURE-----
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000b15bce0573324e92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><br><div class=3D"gmail_quote"><div dir=3D"l=
tr">On Sat, Aug 11, 2018, 17:15 Aaron Jones &lt;<a href=3D"mailto:aaronmdjo=
nes@gmail.com">aaronmdjones@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">-----BEGIN PGP SIGNED MESSAGE-----<br>
Hash: SHA512<br>
<br>
On 11/08/18 22:52, Luiz Angelo Daros de Luca wrote:<br>
&gt; I see these wireguard extra features just like dhcp is. Nobody<br>
&gt; thinks about implementing dhcp inside kernel or even iproute<br>
&gt; tools.<br>
<br>
The Linux kernel has a (minimal, non-configurable) DHCP client already<br>
(used for rootfs on NFS without an initramfs, among other things).<br>
<br>
CONFIG_IP_PNP_BOOTP=3Dy<br></blockquote></div></div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">This is in fact true, but I&#39;m not sure we&#39;re=
 planning on following suite with that kind of thing in kernel space for Wi=
reGuard...</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">
<br>
-----BEGIN PGP SIGNATURE-----<br>
Comment: Using GnuPG with Thunderbird - <a href=3D"https://www.enigmail.net=
/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://www.enigmail.net=
/</a><br>
<br>
iQIzBAEBCgAdFiEEYKVBwe43zZh/jkxPivBzdIirMBIFAltvfB4ACgkQivBzdIir<br>
MBLldA//aCK1DHoew8joweZkI2coLZjolMqPActFDTtDkIXAka3guJjh2zVDCxVF<br>
45AdF1Xv7jhmuDB4emCgH6ANk0vPDAHvs6SBYYZgHvvHdNbBzmM9FqJFk01KHUkl<br>
LhPVCjR9T9EMNifoP5EI1R3YTpoAQbUpaJJ9K12rumdGMelpVU7qg7hW7VkscwAq<br>
WtmN/wuD3w3mZKH+TvtlT409JefvocvE9kA7NUXWOZ9Bxxj3pEJIVTmquE6MS4rm<br>
zHcQ7hY3JR7cPg4Imc0FHuyvbU55R2AnU9+00+dTUISlBT9k2pneIw4EhW0WSHLK<br>
uXXplZfpwV9WSiI/n1dXX1RdRc/42U6LsD4ZLPr6uxoULyeM0ahW7P2+Zq7+yt34<br>
gEDjwTdLSLQYpLEWhAZ4q6fBLGamZHqXgLXTtioWrIqr5eaScYJcINNjsnAEa8Kz<br>
3Oo5HOxvJvEMyDz35M+04ugAbjW5LHiqWsOoWfX0A2XfDPt9mnTuiPXrGSLEPWdh<br>
5OvOsPAmda4/CbJo83cRHqwhsOvoxIJX5+Ewx8giyLZ4lWIGum57wD6n6ZaUVsHZ<br>
9OXA8f7LZdkxKZ/QSFi7HN9S7SRdkCbJB9E0L96AAVhPGbZuXkGavN5sIOA3fd7Y<br>
CWMCI3Y+x675gtYTpVooR+P1fTWgBAHOHuVFeU8e+LSHwhMallc=3D<br>
=3DOY67<br>
-----END PGP SIGNATURE-----<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div></div></div>

--000000000000b15bce0573324e92--
