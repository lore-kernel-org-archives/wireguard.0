Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NORMAL_HTTP_TO_IP,SPF_PASS,URIBL_BLOCKED,WEIRD_PORT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23994C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 23:07:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB1192075B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 23:07:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFvNeIL5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB1192075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6a7529c;
	Wed, 2 Jan 2019 23:05:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8196c3fa
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 23:05:11 +0000 (UTC)
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1f6e910
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 23:05:11 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id 40so28020317oth.4
 for <wireguard@lists.zx2c4.com>; Wed, 02 Jan 2019 15:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L0gyS1OmVt2IhZCNBLpUj5xtRrG8OikABUIE56m5/58=;
 b=BFvNeIL5wdsQEoZP28KFcZPCCg6oS1F46kMAj0wzjJ3pIo8K6qBa70yI+UYxFoBl2Q
 QYtFsVoLUAmwYPYrXaUV+JjhMzlUs1rcAa9cApOcLvBt5T/PzXASHxrp4EwCKMjewpSV
 dsQbteG5uMBynRENza10/bRtXJPBRcRPhNik0bsKUsDWdDSP5TmORGBpDuaeKD5VnkYo
 0lL+1RfTCaahKxGHWbcCGywi2VOmA6PnAaWKX3vGCzqtq+4Y0zD4/vdzbRfxqE+dRSRE
 MGpUPRoAUnauAgtQoEJ9rAY73iGAaDRTHf1ZnF2yuY4ZwxkhEAjP6HP2sSax3Zq9aAy0
 pxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L0gyS1OmVt2IhZCNBLpUj5xtRrG8OikABUIE56m5/58=;
 b=l8xwgi8zv1AH3ZhDFuiRJ1p05atf2M20SWUZwlxPvaF3cn+UqQ9X7XM6uYAzFKDwjm
 UM/18waOaCPuoLqiBUPpKcUx7YRE8fwbqqs4KMFTjO4HvBkQEO1pteUex/UX/u/f54dG
 NtBHzV3bEQm3bz7JehEG/27ga3YESCNGthpnl6R+93fN6Xj++GJKvPm1IrRQ0iBML4yT
 XnGwmckaH3dqCcn72enzVK4Vz/RcTUaqU0hRKXaYKF/WoJoBcqjUKsylDLfJXTDe9pbu
 lmaVe3FTdguKkNqWull/53kFQW8TIg90zAFi/uxthLwOpt2Xs+Pb69gm1CEN3d5sDi4m
 izzw==
X-Gm-Message-State: AJcUukfvVLjkjJrnviMqPxSxpbSnwvMHM1bo2sZL5ckjypdmF8AwDyiD
 Ki0a+DurwMDnZ5iTmtoHy5swAXmWYXiN1L0b0BM=
X-Google-Smtp-Source: ALg8bN4XcUhFUkXZ1nCJavOeLjJXnxGkDGs57X+o3SDAWqsQbUhA3lorSWNOD+YKLqbr0P2dnDOPOarAbLDJJ7XIHQM=
X-Received: by 2002:a9d:d21:: with SMTP id 30mr32477948oti.245.1546470456203; 
 Wed, 02 Jan 2019 15:07:36 -0800 (PST)
MIME-Version: 1.0
References: <17359ea7-e029-bfac-10d5-213faa7b2c0e@me.com>
In-Reply-To: <17359ea7-e029-bfac-10d5-213faa7b2c0e@me.com>
From: Jaseem Abid <jaseemabid@gmail.com>
Date: Wed, 2 Jan 2019 23:07:00 +0000
Message-ID: <CAH-tXsAYAw=uGzV_gTpvHvBvgH48UbVDYRPChTVAZqvDbNEnQg@mail.gmail.com>
Subject: Re: Problems on MacOS (Mojave)
To: Shankar Ramamoorthy <shankar@me.com>
Cc: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5155627703197494325=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5155627703197494325==
Content-Type: multipart/alternative; boundary="000000000000329fda057e81b676"

--000000000000329fda057e81b676
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Jan 2019 at 19:28, Shankar Ramamoorthy <shankar@me.com> wrote:

> Installed Wireguard via MacPorts on machine running macOS Mojave 10.14.2.
>
> It worked the very first time, but haven't been able to get it to work
> since.
>
> Any help or suggestions appreciated. Gory details below.
>
> Machines: 192.168.11.44 (macos, 192.168.1.2) and 192.168.11.15 (Debian,
> 192.168.1.1)
>
> I know that Wireguard on the Debian box is working properly because I
> can connect to it from a different peer.
>
> macos config:
> [Interface]
> Address =3D 192.168.1.2/24
> PrivateKey =3D kJbWLVX6tj+PxV9eKTZ0g4akHiPFOreUwsqsDrRXJmo=3D
> ListenPort =3D 2200
>
> [Peer]
> PublicKey =3D H+RLiowROj143Xjn/P87R4qcSmt+X7ROaPVzXYrYb1U=3D
> AllowedIPs =3D 0.0.0.0/0, ::/0
> Endpoint =3D 192.168.11.15:2200
> # This is for if you=E2=80=99re behind a NAT and want the connection to b=
e kept
> alive.
> PersistentKeepalive =3D 25
>
> Debian config:
> [Interface]
> PrivateKey =3D uMZzy458hweehyFfD4PenKwsH1/bKHSn0ayOWLknl2U=3D
> ListenPort =3D 2200
>
> [Peer]
> PublicKey =3D uM3OykF94Ior3CnRudN6AwH4zNqN8Vh7CwcuwQaCt3E=3D
> AllowedIPs =3D 0.0.0.0/0
> Endpoint =3D 192.168.11.44:2200
> # This is for if you=E2=80=99re behind a NAT and want the connection to b=
e kept
> alive.
> PersistentKeepalive =3D 25
>
> Output of "sudo wg-quick up ~/.config/wireguard/wg0.conf":
> INFO: (utun1) 2018/12/25 03:47:35 Starting wireguard-go version
> 0.0.20181222
> [+] Interface for wg0 is utun1
> [#] wg setconf utun1 /dev/fd/63
> [#] ifconfig utun1 inet 192.168.1.2/24 192.168.1.2 alias
> [#] ifconfig utun1 up
> [#] route -q -n add -inet6 ::/1 -interface utun1
> route: writing to routing socket: Network is unreachable
> [#] route -q -n add -inet6 8000::/1 -interface utun1
> route: writing to routing socket: Network is unreachable
> [#] route -q -n add -inet 0.0.0.0/1 -interface utun1
> [#] route -q -n add -inet 128.0.0.0/1 -interface utun1
> [#] route -q -n add -inet 192.168.11.15 -gateway 192.168.11.1
> [+] Backgrounding route monitor
>
> ifconfig for utun0 and utun1:
> utun0: flags=3D8050<POINTOPOINT,RUNNING,MULTICAST> mtu 2000
>     inet6 fe80::6431:138d:3530:c696%utun0 prefixlen 64 scopeid 0xb
>     inet 192.168.1.2 --> 192.168.1.1 netmask 0xffffff00
>     nd6 options=3D201<PERFORMNUD,DAD>
> utun1: flags=3D8051<UP,POINTOPOINT,RUNNING,MULTICAST> mtu 1420
>     inet 192.168.1.2 --> 192.168.1.2 netmask 0xffffff00
>
> Output of "netstat -an | grep utun":
> netstat -rn | grep utun
> 0/1                utun1              USc            67        0
> utun1
> 128.0/1            utun1              USc             2        0
> utun1
> 192.168.1.2        192.168.1.2        UH              0        0
> utun1
> default                                 fe80::%utun0
> UGcI          utun0
> fe80::%utun0/64                         fe80::6431:138d:3530:c696%utun0
> UcI           utun0
> fe80::6431:138d:3530:c696%utun0         link#11
> UHLI            lo0
> ff01::%utun0/32                         fe80::6431:138d:3530:c696%utun0
> UmCI          utun0
> ff02::%utun0/32                         fe80::6431:138d:3530:c696%utun0
> UmCI          utun0
>
> Both "ping 192.168.1.1" and "ping 192.168.1.2" report Request timeout.
>
> I'm also not able to get rid of the utun0 interface, which did not exist
> before Wireguard I think.
> Shankar
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

The Debian config seems to be missing an `Address`.  I'm not sure if that's
really the issue here, but I cannot see anything else wrong with the
config. I run a very similar config to tunnel b/w a mac and ubuntu.

Regarding the utun0, I seem to have the same interface on my laptop and
it's not managed by wg.


--=20
Regards,

Jaseem Abid
https://twitter.com/jaseemabid

--000000000000329fda057e81b676
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr">On Wed, 2 Jan 2019 at 19:28, Shankar Ramamoorthy &lt;<a hr=
ef=3D"mailto:shankar@me.com">shankar@me.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Installed Wireguard via MacPorts=
 on machine running macOS Mojave 10.14.2.<br>
<br>
It worked the very first time, but haven&#39;t been able to get it to work<=
br>
since.<br>
<br>
Any help or suggestions appreciated. Gory details below.<br>
<br>
Machines: 192.168.11.44 (macos, 192.168.1.2) and 192.168.11.15 (Debian,<br>
192.168.1.1)<br>
<br>
I know that Wireguard on the Debian box is working properly because I<br>
can connect to it from a different peer.<br>
<br>
macos config:<br>
[Interface]<br>
Address =3D <a href=3D"http://192.168.1.2/24" rel=3D"noreferrer" target=3D"=
_blank">192.168.1.2/24</a><br>
PrivateKey =3D kJbWLVX6tj+PxV9eKTZ0g4akHiPFOreUwsqsDrRXJmo=3D<br>
ListenPort =3D 2200<br>
<br>
[Peer]<br>
PublicKey =3D H+RLiowROj143Xjn/P87R4qcSmt+X7ROaPVzXYrYb1U=3D<br>
AllowedIPs =3D <a href=3D"http://0.0.0.0/0" rel=3D"noreferrer" target=3D"_b=
lank">0.0.0.0/0</a>, ::/0<br>
Endpoint =3D <a href=3D"http://192.168.11.15:2200" rel=3D"noreferrer" targe=
t=3D"_blank">192.168.11.15:2200</a><br>
# This is for if you=E2=80=99re behind a NAT and want the connection to be =
kept<br>
alive.<br>
PersistentKeepalive =3D 25<br>
<br>
Debian config:<br>
[Interface]<br>
PrivateKey =3D uMZzy458hweehyFfD4PenKwsH1/bKHSn0ayOWLknl2U=3D<br>
ListenPort =3D 2200<br>
<br>
[Peer]<br>
PublicKey =3D uM3OykF94Ior3CnRudN6AwH4zNqN8Vh7CwcuwQaCt3E=3D<br>
AllowedIPs =3D <a href=3D"http://0.0.0.0/0" rel=3D"noreferrer" target=3D"_b=
lank">0.0.0.0/0</a><br>
Endpoint =3D <a href=3D"http://192.168.11.44:2200" rel=3D"noreferrer" targe=
t=3D"_blank">192.168.11.44:2200</a><br>
# This is for if you=E2=80=99re behind a NAT and want the connection to be =
kept<br>
alive.<br>
PersistentKeepalive =3D 25<br>
<br>
Output of &quot;sudo wg-quick up ~/.config/wireguard/wg0.conf&quot;:<br>
INFO: (utun1) 2018/12/25 03:47:35 Starting wireguard-go version 0.0.2018122=
2<br>
[+] Interface for wg0 is utun1<br>
[#] wg setconf utun1 /dev/fd/63<br>
[#] ifconfig utun1 inet <a href=3D"http://192.168.1.2/24" rel=3D"noreferrer=
" target=3D"_blank">192.168.1.2/24</a> 192.168.1.2 alias<br>
[#] ifconfig utun1 up<br>
[#] route -q -n add -inet6 ::/1 -interface utun1<br>
route: writing to routing socket: Network is unreachable<br>
[#] route -q -n add -inet6 8000::/1 -interface utun1<br>
route: writing to routing socket: Network is unreachable<br>
[#] route -q -n add -inet <a href=3D"http://0.0.0.0/1" rel=3D"noreferrer" t=
arget=3D"_blank">0.0.0.0/1</a> -interface utun1<br>
[#] route -q -n add -inet <a href=3D"http://128.0.0.0/1" rel=3D"noreferrer"=
 target=3D"_blank">128.0.0.0/1</a> -interface utun1<br>
[#] route -q -n add -inet 192.168.11.15 -gateway 192.168.11.1<br>
[+] Backgrounding route monitor<br>
<br>
ifconfig for utun0 and utun1:<br>
utun0: flags=3D8050&lt;POINTOPOINT,RUNNING,MULTICAST&gt; mtu 2000<br>
=C2=A0=C2=A0=C2=A0 inet6 fe80::6431:138d:3530:c696%utun0 prefixlen 64 scope=
id 0xb<br>
=C2=A0=C2=A0=C2=A0 inet 192.168.1.2 --&gt; 192.168.1.1 netmask 0xffffff00<b=
r>
=C2=A0=C2=A0=C2=A0 nd6 options=3D201&lt;PERFORMNUD,DAD&gt;<br>
utun1: flags=3D8051&lt;UP,POINTOPOINT,RUNNING,MULTICAST&gt; mtu 1420<br>
=C2=A0=C2=A0=C2=A0 inet 192.168.1.2 --&gt; 192.168.1.2 netmask 0xffffff00<b=
r>
<br>
Output of &quot;netstat -an | grep utun&quot;:<br>
netstat -rn | grep utun<br>
0/1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 utun1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 USc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 67=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=
=A0=C2=A0<br>
utun1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
128.0/1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u=
tun1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 USc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0<br>
utun1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
192.168.1.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 192.168.1.2=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 UH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0=C2=A0=C2=A0<br>
utun1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
default=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fe80::%utun0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
UGcI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utun0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
fe80::%utun0/64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 fe80::6431:138d:3530:c696%utun0<br>
UcI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utun0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
fe80::6431:138d:3530:c696%utun0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 link#11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0<br>
UHLI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lo0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
ff01::%utun0/32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 fe80::6431:138d:3530:c696%utun0<br>
UmCI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utun0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
ff02::%utun0/32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 fe80::6431:138d:3530:c696%utun0<br>
UmCI=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 utun0=C2=A0=C2=
=A0=C2=A0=C2=A0<br>
<br>
Both &quot;ping 192.168.1.1&quot; and &quot;ping 192.168.1.2&quot; report R=
equest timeout.<br>
<br>
I&#39;m also not able to get rid of the utun0 interface, which did not exis=
t<br>
before Wireguard I think.<br>
Shankar<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div><br clear=3D"all"><div>The Debian config seems to be mis=
sing an `Address`.=C2=A0 I&#39;m not sure if that&#39;s really the issue he=
re, but I cannot see anything else wrong with the config. I run a very simi=
lar config to tunnel b/w a mac and ubuntu.=C2=A0<br><br>Regarding the utun0=
, I seem to have the same interface on my laptop and it&#39;s not managed b=
y wg.=C2=A0</div><div><br></div><div><br></div>-- <br><div dir=3D"ltr" clas=
s=3D"gmail_signature">Regards, <br><br>Jaseem Abid<br><a href=3D"https://tw=
itter.com/jaseemabid" target=3D"_blank">https://twitter.com/jaseemabid</a><=
br></div></div>

--000000000000329fda057e81b676--

--===============5155627703197494325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5155627703197494325==--
