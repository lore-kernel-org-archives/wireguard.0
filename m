Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4335BC3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:29:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6416206DD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:29:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6416206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c3c761c;
	Sun, 25 Aug 2019 15:29:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf7912bf
 for <wireguard@lists.zx2c4.com>; Fri, 9 Aug 2019 08:52:34 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66c578b9
 for <wireguard@lists.zx2c4.com>; Fri, 9 Aug 2019 08:52:34 +0000 (UTC)
Received: from fwd15.aul.t-online.de (fwd15.aul.t-online.de [172.20.27.63])
 by mailout03.t-online.de (Postfix) with SMTP id 930B04257637;
 Fri,  9 Aug 2019 10:52:33 +0200 (CEST)
Received: from asterix.boerner.vpn
 (XLmATaZUQhta7Ge7nKpowPgkdzaQrcYLQ75NB6j3p+VbsWxEraR0AGml15Sjda2gcV@[84.157.52.12])
 by fwd15.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1hw0dT-24aYyG0; Fri, 9 Aug 2019 10:52:31 +0200
Date: Fri, 09 Aug 2019 10:52:29 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <6910a3cab7c5cdfe32de3b61095c7cc47e0702b2.camel@gmail.com>
References: <5549622.se0SCevcK7@majestix.boerner.local>
 <6910a3cab7c5cdfe32de3b61095c7cc47e0702b2.camel@gmail.com>
MIME-Version: 1.0
Subject: Re: Wireguard command line tools for Android
To: =?UTF-8?Q?Ya=C4=9Fmur_Oymak?= <yagmur.oymak@gmail.com>, boerner@t-online.de,
 wireguard@lists.zx2c4.com
From: =?ISO-8859-1?Q?Thomas_B=F6rner?= <boerner@t-online.de>
Message-ID: <4345AA8F-60AC-4106-880E-B3F5A2FF7AC0@t-online.de>
X-ID: XLmATaZUQhta7Ge7nKpowPgkdzaQrcYLQ75NB6j3p+VbsWxEraR0AGml15Sjda2gcV
X-TOI-MSGID: 923f401c-4704-4308-b7fd-a93d65f4b7c5
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:29:26 +0200
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
Content-Type: multipart/mixed; boundary="===============1313660856669942033=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1313660856669942033==
Content-Type: multipart/alternative; boundary="----Z9FEM47IC6PPXP4LSWOWCAUBTYCXEL"
Content-Transfer-Encoding: 7bit

------Z9FEM47IC6PPXP4LSWOWCAUBTYCXEL
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for the clarification!
But this also means that a Tasker workaround would not be feasible for a c=
ommon user=2E
Thus, =C2=A0renewing the binding via DNS when the tunnel is broken would b=
e most desirable, as I already proposed=2E

Am 7=2E August 2019 12:52:19 MESZ schrieb "Ya=C4=9Fmur Oymak" <yagmur=2Eoy=
mak@gmail=2Ecom>:
>On Sat, 2019-07-27 at 18:01 +0200, boerner@t-online=2Ede wrote:
>> My idea was to use Tasker to perform something like wg-quick up|down
>> tun1 accordingly, but the Wireguard command line tools wg and wg-
>> quick don't seem to be available (anymore)=2E In older forum posts I've
>> seen that you can install them from the app settings, but in my
>> version (v0=2E0=2E20190708) this option is not available=2E
>>=20
>> Does anybody know about another solution? Or, as a question to the
>> developers, would it be a big deal to bring back the command line
>> feature?
>
>Hey,
>
>The command line tools were not removed=2E If you are using the Go
>userspace backend (the app will indicate this in settings, together
>with the version information) they will not be available=2E The tools
>control the kernel backend and require root access=2E Thus they are only
>available if you are running a custom kernel with WireGuard support and
>have root access=2E
>
>--
>Yagmur Oymak

--=20
Diese Nachricht wurde von meinem Android-Ger=C3=A4t mit K-9 Mail gesendet=
=2E
------Z9FEM47IC6PPXP4LSWOWCAUBTYCXEL
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body>Thanks for the clarification!<br>But this also mea=
ns that a Tasker workaround would not be feasible for a common user=2E<br>T=
hus, =C2=A0renewing the binding via DNS when the tunnel is broken would be =
most desirable, as I already proposed=2E<br><br><div class=3D"gmail_quote">=
Am 7=2E August 2019 12:52:19 MESZ schrieb "Ya=C4=9Fmur Oymak" &lt;yagmur=2E=
oymak@gmail=2Ecom&gt;:<blockquote class=3D"gmail_quote" style=3D"margin: 0p=
t 0pt 0pt 0=2E8ex; border-left: 1px solid rgb(204, 204, 204); padding-left:=
 1ex;">
<pre class=3D"k9mail">On Sat, 2019-07-27 at 18:01 +0200, boerner@t-online=
=2Ede wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt =
1ex 0=2E8ex; border-left: 1px solid #729fcf; padding-left: 1ex;">My idea wa=
s to use Tasker to perform something like wg-quick up|down<br>tun1 accordin=
gly, but the Wireguard command line tools wg and wg-<br>quick don't seem to=
 be available (anymore)=2E In older forum posts I've<br>seen that you can i=
nstall them from the app settings, but in my<br>version (v0=2E0=2E20190708)=
 this option is not available=2E<br><br>Does anybody know about another sol=
ution? Or, as a question to the<br>developers, would it be a big deal to br=
ing back the command line<br>feature?<br></blockquote><br>Hey,<br><br>The c=
ommand line tools were not removed=2E If you are using the Go<br>userspace =
backend (the app will indicate this in settings, together<br>with the versi=
on information) they will not be available=2E The tools<br>control the kern=
el backend and require root access=2E Thus they are only<br>available if yo=
u are running a custom kernel with WireGuard support and<br>have root acces=
s=2E<br><br>--<br>Yagmur Oymak<br><br><br></pre></blockquote></div><br>-- <=
br>Diese Nachricht wurde von meinem Android-Ger=C3=A4t mit K-9 Mail gesende=
t=2E</body></html>
------Z9FEM47IC6PPXP4LSWOWCAUBTYCXEL--

--===============1313660856669942033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1313660856669942033==--
