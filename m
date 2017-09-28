Return-Path: lordkitsuna112@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20d9cd0f
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Sep 2017 05:17:20 +0000 (UTC)
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
 [209.85.128.179])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64347678
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Sep 2017 05:17:20 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id a43so686781wrc.0
 for <wireguard@lists.zx2c4.com>; Wed, 27 Sep 2017 22:45:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pD--t1gNhZ=W=LS1PC0Rz3umEY8pbpsbcmU8MSqp5XCw@mail.gmail.com>
References: <CAH8WAOZGHrxOHTWsTCgEQNgF3XixeeWeU6+-nMSjOeoFNtDJFQ@mail.gmail.com>
 <CAHmME9pD--t1gNhZ=W=LS1PC0Rz3umEY8pbpsbcmU8MSqp5XCw@mail.gmail.com>
From: Lord Kitsuna <lordkitsuna112@gmail.com>
Date: Wed, 27 Sep 2017 22:45:32 -0700
Message-ID: <CAH8WAOY8qiF8GbdOCNKqO9wbOMztaXwyci71KuvRgH3wFNMmWQ@mail.gmail.com>
Subject: Re: Bridge interfaces?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="94eb2c14a378af0f88055a396a84"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c14a378af0f88055a396a84
Content-Type: text/plain; charset="UTF-8"

Oh hey missed this reply, thanks! That was what i needed working
beautifully.

On Sep 23, 2017 3:44 PM, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> Hi,
>
> Yes indeed this is possible. Enable ip forwarding (sysctl -w
> net.ipv4.ip_forwarding=1), and then make sure you have the correct
> routes set. You may have to add a few entries to your allowed-ips to
> ensure that the network is okay with wireguard, or, perhaps easier,
> would to just enable MASQUERADEing (iptables -t nat -A POSTROUTING -s
> 10.8.8.0/24 -o tinc0 -j MASQUERADE, where 10.8.8.0/24 is the wireguard
> network.)
>
> There are a lot of ways to skin the cat, and I suspect if you write
> back with details of network segments and whatnot, there might be
> others who might have their own useful opinions. Alternatively, you
> can always ask in #wireguard on Freenode.
>
> Jason
>

--94eb2c14a378af0f88055a396a84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Oh hey missed this reply, thanks! That was what i needed =
working beautifully.=C2=A0</div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Sep 23, 2017 3:44 PM, &quot;Jason A. Donenfeld&quot; &l=
t;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br type=
=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
Yes indeed this is possible. Enable ip forwarding (sysctl -w<br>
net.ipv4.ip_forwarding=3D1), and then make sure you have the correct<br>
routes set. You may have to add a few entries to your allowed-ips to<br>
ensure that the network is okay with wireguard, or, perhaps easier,<br>
would to just enable MASQUERADEing (iptables -t nat -A POSTROUTING -s<br>
<a href=3D"http://10.8.8.0/24" rel=3D"noreferrer" target=3D"_blank">10.8.8.=
0/24</a> -o tinc0 -j MASQUERADE, where <a href=3D"http://10.8.8.0/24" rel=
=3D"noreferrer" target=3D"_blank">10.8.8.0/24</a> is the wireguard<br>
network.)<br>
<br>
There are a lot of ways to skin the cat, and I suspect if you write<br>
back with details of network segments and whatnot, there might be<br>
others who might have their own useful opinions. Alternatively, you<br>
can always ask in #wireguard on Freenode.<br>
<br>
Jason<br>
</blockquote></div></div>

--94eb2c14a378af0f88055a396a84--
