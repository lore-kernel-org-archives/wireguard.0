Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF949C35666
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 13:26:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 201E920637
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 13:26:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 201E920637
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=libassi.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4fb03df;
	Sun, 23 Feb 2020 13:22:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37a160f4
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 13:22:34 +0000 (UTC)
Received: from smtp2.outgoing.loopia.se (smtp2.outgoing.loopia.se
 [93.188.3.37])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c86e35ee
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 13:22:34 +0000 (UTC)
Received: from s807.loopia.se (localhost [127.0.0.1])
 by s807.loopia.se (Postfix) with ESMTP id 74F472E5DABA
 for <wireguard@lists.zx2c4.com>; Sun, 23 Feb 2020 14:25:49 +0100 (CET)
Received: from s500.loopia.se (unknown [172.22.191.5])
 by s807.loopia.se (Postfix) with ESMTP id 561DA2E279DD;
 Sun, 23 Feb 2020 14:25:49 +0100 (CET)
Received: from s473.loopia.se (unknown [172.22.191.6])
 by s500.loopia.se (Postfix) with ESMTP id 538141E14707;
 Sun, 23 Feb 2020 14:25:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s500.loopia.se ([172.22.191.5])
 by s473.loopia.se (s473.loopia.se [172.22.190.13]) (amavisd-new, port 10024)
 with LMTP id csMTcGc7YK4y; Sun, 23 Feb 2020 14:25:48 +0100 (CET)
X-Loopia-Auth: user
X-Loopia-User: peter@libassi.se
X-Loopia-Originating-IP: 78.82.164.216
Received: from [10.79.0.17] (c-d8a4524e.03-77-73746f30.bbcust.telenor.se
 [78.82.164.216]) (Authenticated sender: peter@libassi.se)
 by s500.loopia.se (Postfix) with ESMTPSA id 95E8F1E1470B;
 Sun, 23 Feb 2020 14:25:48 +0100 (CET)
From: Peter Libassi <peter@libassi.se>
Message-Id: <645AC0E3-6440-4ABF-9589-179F5AEDE00E@libassi.se>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: FreeBSD wireguard wg-quick remote IP address assignment is
 incorrect
Date: Sun, 23 Feb 2020 14:25:48 +0100
In-Reply-To: <CAHmME9ozSn+f1s9+q4-L_PA+Q76YY81X8_P2i4jMhYM8Or-17Q@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <01F8520D-6F1E-4DFB-BC07-80D9838EF35D@libassi.se>
 <CAHmME9ozSn+f1s9+q4-L_PA+Q76YY81X8_P2i4jMhYM8Or-17Q@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============9204485718519458883=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============9204485718519458883==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_3D657F14-DE18-43B0-B8BA-D136B8E21664"


--Apple-Mail=_3D657F14-DE18-43B0-B8BA-D136B8E21664
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Ok, Well even if using another local IP in range 127.0.0.0/8 we can=E2=80=99=
t be certain we will clash with something else.

How about adding a directive for the remote interface address in =
wg.conf? Like this:

# cat /usr/local/etc/wireguard/wg0.conf
[Interface]
PrivateKey =3D <->
ListenPort =3D 7777
Address =3D 192.168.2.1/32
RemoteAddress =3D 192.168.2.2

[Peer]
PublicKey =3D <->
AllowedIPs =3D 192.168.2.0/24
Endpoint =3D 172.16.0.23:7777

# diff /usr/local/bin/wg-quick.org ./wg-quick
17a18
> REMOTE_ADDRESS=3D""
86a88
> 			RemoteAddress) REMOTEADDRESS=3D"$value"; =
continue ;;
175c177,181
< 		cmd ifconfig "$INTERFACE" inet "$1" "${1%%/*}" alias
---
> 	    if [[ -n $REMOTEADDRESS ]]; then
> 		cmd ifconfig "$INTERFACE" inet "$1" "$REMOTEADDRESS" =
alias
> 	    else
>                 cmd ifconfig "$INTERFACE" inet "$1" "${1%%/*}" alias
> 	    fi

/Peter


> 23 feb. 2020 kl. 12:37 skrev Jason A. Donenfeld <Jason@zx2c4.com>:
>=20
> We tried this already and it didn't work. See the below commit.
> Perhaps you can update that bug report you filed?
>=20
> commit 2c6cabd73dfb23990c245250ef2e502bdb33d189
> Author: Jason A. Donenfeld <Jason@zx2c4.com>
> Date:   Thu Feb 28 19:03:11 2019 +0100
>=20
>   wg-quick: freebsd: rebreak interface loopback, while fixing =
localhost
>=20
>   The commit 7c833642 ("wg-quick: freebsd: allow loopback to work") =
was
>   supposed to make things better, but actually it just started sending
>   legitimate localhost traffic over the WireGuard interface, which is
>   really quite bad.
>=20
>   This reverts commit 7c833642dfa342218602ab18e7091e86408d2982.
>=20
>   Reported-by: Matt Smith <matt.xtaz@gmail.com>
>   Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
>=20
> diff --git a/src/wg-quick/freebsd.bash b/src/wg-quick/freebsd.bash
> index 93f1a3b7..e83dbef0 100755
> --- a/src/wg-quick/freebsd.bash
> +++ b/src/wg-quick/freebsd.bash
> @@ -158,7 +158,7 @@ add_addr() {
>       if [[ $1 =3D=3D *:* ]]; then
>               cmd ifconfig "$INTERFACE" inet6 "$1" alias
>       else
> -               cmd ifconfig "$INTERFACE" inet "$1" 127.0.0.1 alias
> +               cmd ifconfig "$INTERFACE" inet "$1" "${1%%/*}" alias
>       fi
> }


--Apple-Mail=_3D657F14-DE18-43B0-B8BA-D136B8E21664
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Ok, =
Well even if using another local IP in range 127.0.0.0/8 we can=E2=80=99t =
be certain we will clash with something else.<div class=3D""><br =
class=3D""></div><div class=3D"">How about adding a directive for the =
remote interface address in wg.conf? Like this:</div><div class=3D""><br =
class=3D""></div><div class=3D""><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures;" =
class=3D""># cat /usr/local/etc/wireguard/wg0.conf</span></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; color: =
rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures;" class=3D"">[Interface]</span></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; color: =
rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures;" class=3D"">PrivateKey =3D =
&lt;-&gt;</span></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures;" =
class=3D"">ListenPort =3D 7777</span></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures;" =
class=3D"">Address =3D 192.168.2.1/32</span></div><div style=3D"margin: =
0px; font-stretch: normal; line-height: normal; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures;" =
class=3D"">RemoteAddress =3D 192.168.2.2</span></div><div style=3D"margin:=
 0px; font-stretch: normal; line-height: normal; color: rgb(0, 0, 0); =
min-height: 15px;" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures;" class=3D""></span><br class=3D""></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; color: =
rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures;" class=3D"">[Peer]</span></div><div style=3D"margin: =
0px; font-stretch: normal; line-height: normal; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures;" =
class=3D"">PublicKey =3D &lt;-&gt;</span></div><div style=3D"margin: =
0px; font-stretch: normal; line-height: normal; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures;" =
class=3D"">AllowedIPs =3D 192.168.2.0/24</span></div><div style=3D"margin:=
 0px; font-stretch: normal; line-height: normal; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures;" =
class=3D"">Endpoint =3D 172.16.0.23:7777</span></div></div><div =
class=3D""><br class=3D""></div><div class=3D""><div style=3D"margin: =
0px; font-stretch: normal; line-height: normal; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D""># diff /usr/local/bin/<a href=3D"http://wg-quick.org" =
class=3D"">wg-quick.org</a> ./wg-quick</span></div><div style=3D"margin: =
0px; font-stretch: normal; line-height: normal; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">17a18</span></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&gt; =
REMOTE_ADDRESS=3D""</span></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">86a88</span></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&gt; =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">			=
</span>RemoteAddress) REMOTEADDRESS=3D"$value"; continue =
;;</span></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">175c177,181</span></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">&lt; <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
	</span>cmd ifconfig "$INTERFACE" inet "$1" "${1%%/*}" =
alias</span></div><div style=3D"margin: 0px; font-stretch: normal; =
line-height: normal; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">---</span></div><div style=3D"margin: 0px; font-stretch: =
normal; line-height: normal; color: rgb(0, 0, 0);" class=3D""><span =
style=3D"font-variant-ligatures: no-common-ligatures" class=3D"">&gt; =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>&nbsp; &nbsp; if [[ -n $REMOTEADDRESS ]]; then</span></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; color: =
rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">&gt; <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</span>cmd ifconfig "$INTERFACE" =
inet "$1" "$REMOTEADDRESS" alias</span></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">&gt; <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>&nbsp; &nbsp; else</span></div><div style=3D"margin: 0px; =
font-stretch: normal; line-height: normal; color: rgb(0, 0, 0);" =
class=3D""><span style=3D"font-variant-ligatures: no-common-ligatures" =
class=3D"">&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
cmd ifconfig "$INTERFACE" inet "$1" "${1%%/*}" alias</span></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; color: =
rgb(0, 0, 0);" class=3D""><span style=3D"font-variant-ligatures: =
no-common-ligatures" class=3D"">&gt; <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>&nbsp; &nbsp; fi</span></div><div =
style=3D"margin: 0px; font-stretch: normal; line-height: normal; color: =
rgb(0, 0, 0);" class=3D""><br class=3D""></div><div style=3D"margin: =
0px; font-stretch: normal; line-height: normal; color: rgb(0, 0, 0);" =
class=3D"">/Peter</div><div style=3D"margin: 0px; font-stretch: normal; =
font-size: 13px; line-height: normal; font-family: Menlo; color: rgb(0, =
0, 0);" class=3D""><br class=3D""></div><div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D"">23 feb. 2020 kl. 12:37 skrev =
Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" =
class=3D"">Jason@zx2c4.com</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">We =
tried this already and it didn't work. See the below commit.<br =
class=3D"">Perhaps you can update that bug report you filed?<br =
class=3D""><br class=3D"">commit =
2c6cabd73dfb23990c245250ef2e502bdb33d189<br class=3D"">Author: Jason A. =
Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com" =
class=3D"">Jason@zx2c4.com</a>&gt;<br class=3D"">Date: &nbsp;&nbsp;Thu =
Feb 28 19:03:11 2019 +0100<br class=3D""><br class=3D""> =
&nbsp;&nbsp;wg-quick: freebsd: rebreak interface loopback, while fixing =
localhost<br class=3D""><br class=3D""> &nbsp;&nbsp;The commit 7c833642 =
("wg-quick: freebsd: allow loopback to work") was<br class=3D""> =
&nbsp;&nbsp;supposed to make things better, but actually it just started =
sending<br class=3D""> &nbsp;&nbsp;legitimate localhost traffic over the =
WireGuard interface, which is<br class=3D""> &nbsp;&nbsp;really quite =
bad.<br class=3D""><br class=3D""> &nbsp;&nbsp;This reverts commit =
7c833642dfa342218602ab18e7091e86408d2982.<br class=3D""><br class=3D""> =
&nbsp;&nbsp;Reported-by: Matt Smith &lt;<a =
href=3D"mailto:matt.xtaz@gmail.com" =
class=3D"">matt.xtaz@gmail.com</a>&gt;<br class=3D""> =
&nbsp;&nbsp;Signed-off-by: Jason A. Donenfeld &lt;<a =
href=3D"mailto:Jason@zx2c4.com" class=3D"">Jason@zx2c4.com</a>&gt;<br =
class=3D""><br class=3D"">diff --git a/src/wg-quick/freebsd.bash =
b/src/wg-quick/freebsd.bash<br class=3D"">index 93f1a3b7..e83dbef0 =
100755<br class=3D"">--- a/src/wg-quick/freebsd.bash<br class=3D"">+++ =
b/src/wg-quick/freebsd.bash<br class=3D"">@@ -158,7 +158,7 @@ add_addr() =
{<br class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if [[ $1 =3D=3D *:* =
]]; then<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;cmd ifconfig "$INTERFACE" inet6 "$1" alias<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else<br class=3D"">- =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;cmd ifconfig "$INTERFACE" inet "$1" 127.0.0.1 alias<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;cmd ifconfig "$INTERFACE" inet "$1" "${1%%/*}" alias<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fi<br class=3D"">}<br =
class=3D""></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_3D657F14-DE18-43B0-B8BA-D136B8E21664--

--===============9204485718519458883==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============9204485718519458883==--
