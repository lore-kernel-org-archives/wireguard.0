Return-Path: norman.shulman@n-dimension.com
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
 [209.85.213.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb1859c9
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 19:05:52 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id v6so7355880vkb.2
 for <wireguard@lists.zx2c4.com>; Tue, 05 Jul 2016 12:09:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rh8wCLV3jaqyDBm8ZDuVUC__XZOuzbX1haonO2C_ZCEQ@mail.gmail.com>
References: <CANQAqMXqQv_MkEsLSuSHNVqHGJuy6yVHhVP4mM6v3x+5iVbVqA@mail.gmail.com>
 <CAHmME9rXYm3yV0j5pW3yH59j-C9S=6X8-6OY+b=dkuRq7Vpzvw@mail.gmail.com>
 <CANQAqMX8Bf9taS+VgRYnGwuOoJcG3PL8PNmyOK66O3pHjP6VBw@mail.gmail.com>
 <CAHmME9rRHgEtsJ8F-4UrzZMwOs43T24Jq+mUHO91-oimQXXjwg@mail.gmail.com>
 <CANQAqMV=QeCG9BPvPpaCAu56a+mNi_7sNvhDL=_i4N7WFY1=Ng@mail.gmail.com>
 <CAHmME9qr2H=4Qdzx9Kz4=op-O-yzum0+hJWvazHZ_K7ex05ncQ@mail.gmail.com>
 <CANQAqMVT1UkM3uNQbHUKKysHv-tix-Ds9+KaRw62HVHUK5XC+Q@mail.gmail.com>
 <CAHmME9rh8wCLV3jaqyDBm8ZDuVUC__XZOuzbX1haonO2C_ZCEQ@mail.gmail.com>
From: Norman Shulman <norman.shulman@n-dimension.com>
Date: Tue, 5 Jul 2016 15:09:19 -0400
Message-ID: <CANQAqMWY=8WRbz9+bw11oUO2OAi-SFnHv=f+z5jQ0F1MYf5Ruw@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary=94eb2c07c964a1d1760536e83029
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard cryptokey routing
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c07c964a1d1760536e83029
Content-Type: text/plain; charset=UTF-8

How is this enforced? How does this scale?

On Tue, Jul 5, 2016 at 3:06 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> One peer may have multiple allowed-ips.
>
> Several peers may not share the same IP.
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

--94eb2c07c964a1d1760536e83029
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">How is this enforced? How does this scale?</div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jul 5, 2016 at 3:06=
 PM, Jason A. Donenfeld <span dir=3D"ltr">&lt;<a href=3D"mailto:Jason@zx2c4=
.com" target=3D"_blank">Jason@zx2c4.com</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">One peer may have multiple allowed-ips.<br>
<br>
Several peers may not share the same IP.<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">Norman Shulman<br>S=
r. Developer/Architect<br>N-Dimension Solutions Inc.<br>9030 Leslie St, Uni=
t 300<br>Richmond Hill, ON L4B 1G2<br>Canada<br><br>Tel: 905 707-8884 x 226=
<br>Fax: 905 707-0886<br><br>This email and any files transmitted with it a=
re solely intended for the use of the named recipient(s) and may contain in=
formation that is privileged and confidential. If you receive this email in=
 error, please immediately notify the sender and delete this message in all=
 its forms.</div>
</div>

--94eb2c07c964a1d1760536e83029--
