Return-Path: norman.shulman@n-dimension.com
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
 [209.85.213.45])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b76b6355
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 18:02:30 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id k68so188263545vkb.0
 for <wireguard@lists.zx2c4.com>; Tue, 05 Jul 2016 11:05:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qr2H=4Qdzx9Kz4=op-O-yzum0+hJWvazHZ_K7ex05ncQ@mail.gmail.com>
References: <CANQAqMXqQv_MkEsLSuSHNVqHGJuy6yVHhVP4mM6v3x+5iVbVqA@mail.gmail.com>
 <CAHmME9rXYm3yV0j5pW3yH59j-C9S=6X8-6OY+b=dkuRq7Vpzvw@mail.gmail.com>
 <CANQAqMX8Bf9taS+VgRYnGwuOoJcG3PL8PNmyOK66O3pHjP6VBw@mail.gmail.com>
 <CAHmME9rRHgEtsJ8F-4UrzZMwOs43T24Jq+mUHO91-oimQXXjwg@mail.gmail.com>
 <CANQAqMV=QeCG9BPvPpaCAu56a+mNi_7sNvhDL=_i4N7WFY1=Ng@mail.gmail.com>
 <CAHmME9qr2H=4Qdzx9Kz4=op-O-yzum0+hJWvazHZ_K7ex05ncQ@mail.gmail.com>
From: Norman Shulman <norman.shulman@n-dimension.com>
Date: Tue, 5 Jul 2016 14:05:56 -0400
Message-ID: <CANQAqMVT1UkM3uNQbHUKKysHv-tix-Ds9+KaRw62HVHUK5XC+Q@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=94eb2c122c5001b07b0536e74ec9
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] WireGuard cryptokey routing
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c122c5001b07b0536e74ec9
Content-Type: text/plain; charset=UTF-8

Hi Jason,

Makes sense, but what if both clients have the same address (
192.168.32.19/32)?

Norm

On Tue, Jul 5, 2016 at 12:30 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hi Norm,
>
> If you run these commands:
>
> wg set wg0 peer ABCD allowed-ips 192.168.32.19/32
> wg set wg0 peer EFGH allowed-ips 192.168.32.19/32
>
> After the first command ABCD has 192.168.32.19/32. After the second
> command, ABCD has no allowed ips, and EFGH has 192.168.32.19/32.
>
> However, if you run these commands:
>
> wg set wg0 peer ABCD allowed-ips 192.168.32.0/24
> wg set wg0 peer EFGH allowed-ips 192.168.32.19/32
>
> After running both commands, ABCD will have 192.168.32.0/24 and EFGH
> will have 192.168.32.19/32. However, when sending packets, the routing
> table lookups will always match on the most specific match, so ABCD
> will not be able to send or receive packets for 192.168.32.19/32.
>
> Make sense?
>
> Jason
>



-- 
Norman Shulman
Sr. Developer/Architect
N-Dimension Solutions Inc.
9030 Leslie St, Unit 300
Richmond Hill, ON L4B 1G2
Canada

Tel: 905 707-8884 x 226
Fax: 905 707-0886

This email and any files transmitted with it are solely intended for the
use of the named recipient(s) and may contain information that is
privileged and confidential. If you receive this email in error, please
immediately notify the sender and delete this message in all its forms.

--94eb2c122c5001b07b0536e74ec9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jason,<div><br></div><div>Makes sense, but what if both=
 clients have the same address (<a href=3D"http://192.168.32.19/32">192.168=
.32.19/32</a>)?</div><div><br></div><div>Norm</div></div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">On Tue, Jul 5, 2016 at 12:30 PM, Ja=
son A. Donenfeld <span dir=3D"ltr">&lt;<a href=3D"mailto:Jason@zx2c4.com" t=
arget=3D"_blank">Jason@zx2c4.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hi Norm,<br>
<br>
If you run these commands:<br>
<br>
wg set wg0 peer ABCD allowed-ips <a href=3D"http://192.168.32.19/32" rel=3D=
"noreferrer" target=3D"_blank">192.168.32.19/32</a><br>
wg set wg0 peer EFGH allowed-ips <a href=3D"http://192.168.32.19/32" rel=3D=
"noreferrer" target=3D"_blank">192.168.32.19/32</a><br>
<br>
After the first command ABCD has <a href=3D"http://192.168.32.19/32" rel=3D=
"noreferrer" target=3D"_blank">192.168.32.19/32</a>. After the second<br>
command, ABCD has no allowed ips, and EFGH has <a href=3D"http://192.168.32=
.19/32" rel=3D"noreferrer" target=3D"_blank">192.168.32.19/32</a>.<br>
<br>
However, if you run these commands:<br>
<br>
wg set wg0 peer ABCD allowed-ips <a href=3D"http://192.168.32.0/24" rel=3D"=
noreferrer" target=3D"_blank">192.168.32.0/24</a><br>
wg set wg0 peer EFGH allowed-ips <a href=3D"http://192.168.32.19/32" rel=3D=
"noreferrer" target=3D"_blank">192.168.32.19/32</a><br>
<br>
After running both commands, ABCD will have <a href=3D"http://192.168.32.0/=
24" rel=3D"noreferrer" target=3D"_blank">192.168.32.0/24</a> and EFGH<br>
will have <a href=3D"http://192.168.32.19/32" rel=3D"noreferrer" target=3D"=
_blank">192.168.32.19/32</a>. However, when sending packets, the routing<br=
>
table lookups will always match on the most specific match, so ABCD<br>
will not be able to send or receive packets for <a href=3D"http://192.168.3=
2.19/32" rel=3D"noreferrer" target=3D"_blank">192.168.32.19/32</a>.<br>
<br>
Make sense?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Jason<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Norman =
Shulman<br>Sr. Developer/Architect<br>N-Dimension Solutions Inc.<br>9030 Le=
slie St, Unit 300<br>Richmond Hill, ON L4B 1G2<br>Canada<br><br>Tel: 905 70=
7-8884 x 226<br>Fax: 905 707-0886<br><br>This email and any files transmitt=
ed with it are solely intended for the use of the named recipient(s) and ma=
y contain information that is privileged and confidential. If you receive t=
his email in error, please immediately notify the sender and delete this me=
ssage in all its forms.</div>
</div>

--94eb2c122c5001b07b0536e74ec9--
