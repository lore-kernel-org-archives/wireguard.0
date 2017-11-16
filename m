Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6155c24b
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Nov 2017 12:24:04 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6cb4fcdf
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Nov 2017 12:24:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9914f742
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Nov 2017 12:24:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d670c31f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Nov 2017 12:24:04 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id b189so16956474oia.5
 for <wireguard@lists.zx2c4.com>; Thu, 16 Nov 2017 04:28:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1510826689.1349863.1174432192.27EE87E6@webmail.messagingengine.com>
References: <1510826689.1349863.1174432192.27EE87E6@webmail.messagingengine.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 16 Nov 2017 13:28:24 +0100
Message-ID: <CAHmME9qvePERJzuUKXz+nMgd9rH2G9T2EkTbyfPO+8oonR+KoQ@mail.gmail.com>
Subject: Re: disabling ipv6 with wg-quick
To: ds@fastmail.fm
Content-Type: multipart/alternative; boundary="001a113d6104a72cc3055e18c160"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113d6104a72cc3055e18c160
Content-Type: text/plain; charset="UTF-8"

Remove the v6 addresses from Address= and AllowedIPs=, and then you'll be
set.

--
Sent from my telephone.

On Nov 16, 2017 11:04 AM, <ds@fastmail.fm> wrote:

> Hi,
>
> Is there a way to disable ipv6 when using wg-quick?
>
> If I have the following line on my conf file:
>
> Address = xx.xx.x.39/32,xxxx:xxxx:xxx:bb01::327/128
>
> wg-quick will fail with the following error:
>
>  ~ 2   wg-quick up mullvad-se2
> [#] ip link add mullvad-se2 type wireguard
> [#] wg setconf mullvad-se2 /dev/fd/63
> [#] ip address add  xx.xx.x.39/3 dev mullvad-se2
> [#] ip address add xxxx:xxxx:xxx:bb01::327/128 dev mullvad-se2
> RTNETLINK answers: Permission denied
>
> I have ip6 disabled in my system.
>
> Removing xxxx:xxxx:xxx:bb01::327/128 works, but wg-quick still sets ups
> some ipv6 routes `ip -6 ..` etc.
>
> Is there a way to use ipv4 only with wg-quick?
>
> Thanks.
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--001a113d6104a72cc3055e18c160
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Remove the v6 addresses from Address=3D and AllowedIPs=3D=
, and then you&#39;ll be set.<br><br><div data-smartmail=3D"gmail_signature=
">--<br>Sent from my telephone.<br></div></div><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On Nov 16, 2017 11:04 AM,  &lt;<a href=3D"mai=
lto:ds@fastmail.fm">ds@fastmail.fm</a>&gt; wrote:<br type=3D"attribution"><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Hi,<br>
<br>
Is there a way to disable ipv6 when using wg-quick?<br>
<br>
If I have the following line on my conf file:<br>
<br>
Address =3D xx.xx.x.39/32,xxxx:xxxx:xxx:<wbr>bb01::327/128<br>
<br>
wg-quick will fail with the following error:<br>
<br>
=C2=A0~ 2=C2=A0 =C2=A0wg-quick up mullvad-se2<br>
[#] ip link add mullvad-se2 type wireguard<br>
[#] wg setconf mullvad-se2 /dev/fd/63<br>
[#] ip address add=C2=A0 xx.xx.x.39/3 dev mullvad-se2<br>
[#] ip address add xxxx:xxxx:xxx:bb01::327/128 dev mullvad-se2<br>
RTNETLINK answers: Permission denied<br>
<br>
I have ip6 disabled in my system.<br>
<br>
Removing xxxx:xxxx:xxx:bb01::327/128 works, but wg-quick still sets ups<br>
some ipv6 routes `ip -6 ..` etc.<br>
<br>
Is there a way to use ipv4 only with wg-quick?<br>
<br>
Thanks.<br>
<br>
______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><=
br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/<wbr>mailman/listinfo/wire=
guard</a><br>
</blockquote></div></div>

--001a113d6104a72cc3055e18c160--
