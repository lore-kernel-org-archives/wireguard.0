Return-Path: <SRS0=/nf9=RE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA728C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:09:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80D092186A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:09:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lu5GHe5S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80D092186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 855c28a1;
	Fri, 1 Mar 2019 09:59:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 683c8d37
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Feb 2019 20:44:04 +0000 (UTC)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e73c3661
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Feb 2019 20:44:04 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id j36so16622619qta.7
 for <wireguard@lists.zx2c4.com>; Tue, 26 Feb 2019 12:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=9KUbOlOtOn4TPIP1ZOD+CztEmpwpYNWMRSrngUmmWX8=;
 b=lu5GHe5SFClkWV4WjP+3aa+v6K7AIn+pNERSzttu5hiaGy604v5GTy35nUrPktjnF1
 XWQU8jK6h51naaan42htvEyz9Ty/0A9bJn/axAdmM3icAO4ada2nhKQXM5z0g7N6UROF
 366JSEj1zo3GISmJugVxUaxjnjEFHZd5F5XI0SX1S5oNg9GFo6wOc5WG8xJLj4TdLt2M
 G1dJRJ8TM5YnMpZDmj1GY1xZ34thMnBH+ONHArTOBsffOayqH/7ah0Sru0vQ1yacQ/Eq
 TTqoBx9vbtS3Y4/TmlYjspc9ouxN9fuZaW+zjA+9zbz0f93yiSn3tyGtAWoYOKo2v5+2
 cWcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9KUbOlOtOn4TPIP1ZOD+CztEmpwpYNWMRSrngUmmWX8=;
 b=JxxFuAW48FpZQ25q0QidT4cbJ9SUo4LSe2/ugxHomkq58hA9EvGkzQxEfUTBP6oaNk
 TmdhgKIR0Ra4liaR+TbN58RIOsmue99tLqkHBPZ4F6YsI6WE2Pst1waj99noG9j9kmLs
 HkM5GPrxFUhn24UAv9RY9ZTtcpVqKhSAF8Zjfh+hxRf4NmnBvbTYnAOY9xtCvM8LEexu
 BYKs0BeYU8Q+aVc6OiX/6fIzo0EOXY69qxUd+homhE6LRLIMY/zCQG41DwKzZkvVUfIs
 GiyF+GFrhYoZkM4A/GNhuNxKJyXgxV+VG+fo665rnHkaF63JXOU5TwzUa8YqWdPbS8QR
 EaRg==
X-Gm-Message-State: AHQUAuYQ/oicLzXRrT9lQQvCEpgQnFHH2n/470JUObiAxIthmTCtek7L
 T4miODUDHpGzfpUn7xvm51ubfqWZPikFBmRi/yHmZGOJ
X-Google-Smtp-Source: AHgI3IaoJRBWMdGGwr6Sr46sR4v9pLIc8aCbltd23W5AQAlEmMSo7mB4XYBjlnsYNXMXhpiYXnB9bv1ugWNg7tiKmM4=
X-Received: by 2002:ac8:2415:: with SMTP id c21mr18361467qtc.93.1551214412839; 
 Tue, 26 Feb 2019 12:53:32 -0800 (PST)
MIME-Version: 1.0
From: Scott Lipcon <slipcon@gmail.com>
Date: Tue, 26 Feb 2019 15:53:22 -0500
Message-ID: <CAJwvAosHFogtuPL09C9ek4bz6A7vW76mzKymL11iWs+9F7Ep_Q@mail.gmail.com>
Subject: performance query
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 01 Mar 2019 10:59:37 +0100
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
Content-Type: multipart/mixed; boundary="===============1063895895781665721=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1063895895781665721==
Content-Type: multipart/alternative; boundary="0000000000000c3f9c0582d24035"

--0000000000000c3f9c0582d24035
Content-Type: text/plain; charset="UTF-8"

I've been experimenting a bit with Wireguard on several ubuntu systems, and
am not seeing the performance I'd expect based on the numbers at
https://www.wireguard.com/performance/

I'm wondering if there is a configuration setting i'm missing or any better
way to debug this.

Testing between two locations - both have nominally 1Gbit internet
connections from the same provider.

At location A:
1) Ubuntu 18.04 "server" - i7-4790K CPU @ 4.00GHz
2) Ubuntu 16.04 client - i5-3470 CPU @ 3.20GHz

At location B:
3) Ubuntu 18.04 client - Celeron N2808  @ 1.58GHz
4) Ubuntu 18.04 client - Virtual Machine - Xeon(R) Gold 6126 CPU @ 2.60GHz


Using iperf3 for all tests, with 8 threads, but that doesn't seem to matter
significantly.

Between 1 & 2, via gigabit LAN - 940 Mbit/sec.
Between 1 & 2, via WireGuard - 585 Mbit/sec
- I might have expected a bit higher, but this is certainly acceptable.

Between 3 and 1, direct iperf3 - 580 Mbit/sec
Between 3 and 1, WireGuard - 73 Mbit/sec

At this point I was guessing WireGuard was CPU limited on this little
Celeron, so I set up the Xeon VM (#4):

Between 4 and 1, direct iperf3 - ~600 Mbit/sec
Between 4 and 1, WireGuard - 80 Mbit/sec

In other words, the much faster VM is only a tiny bit faster that the
celeron.

Any suggestions?

Thanks,
Scott

--0000000000000c3f9c0582d24035
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-famil=
y:arial,helvetica,sans-serif">I&#39;ve been experimenting a bit with Wiregu=
ard on several ubuntu systems, and am not seeing the performance I&#39;d ex=
pect based on the numbers at <a href=3D"https://www.wireguard.com/performan=
ce/">https://www.wireguard.com/performance/</a>=C2=A0</div><div class=3D"gm=
ail_default" style=3D"font-family:arial,helvetica,sans-serif"><br></div><di=
v class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">=
I&#39;m wondering if there is a configuration setting i&#39;m missing or an=
y better way to debug this.</div><div class=3D"gmail_default" style=3D"font=
-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" =
style=3D"font-family:arial,helvetica,sans-serif">Testing between two locati=
ons - both have nominally 1Gbit internet connections from the same provider=
.</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sa=
ns-serif">=C2=A0</div><div class=3D"gmail_default" style=3D"font-family:ari=
al,helvetica,sans-serif">At location A:</div><div class=3D"gmail_default" s=
tyle=3D"font-family:arial,helvetica,sans-serif">1) Ubuntu 18.04 &quot;serve=
r&quot; -=C2=A0i7-4790K CPU @ 4.00GHz=C2=A0<br></div><div class=3D"gmail_de=
fault" style=3D"font-family:arial,helvetica,sans-serif">2) Ubuntu 16.04 cli=
ent -=C2=A0i5-3470 CPU @ 3.20GHz</div><div class=3D"gmail_default" style=3D=
"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-family:arial,helvetica,sans-serif">At location B:</div><=
div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif=
">3) Ubuntu 18.04 client - Celeron=C2=A0N2808=C2=A0 @ 1.58GHz</div><div cla=
ss=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">4) Ub=
untu 18.04 client - Virtual Machine -=C2=A0Xeon(R) Gold 6126 CPU @ 2.60GHz<=
/div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans=
-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,h=
elvetica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-f=
amily:arial,helvetica,sans-serif">Using iperf3 for all tests, with 8 thread=
s, but that doesn&#39;t seem to matter significantly.</div><div class=3D"gm=
ail_default" style=3D"font-family:arial,helvetica,sans-serif"><br></div><di=
v class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">=
Between 1 &amp; 2, via gigabit LAN - 940 Mbit/sec.</div><div class=3D"gmail=
_default" style=3D"font-family:arial,helvetica,sans-serif">Between 1 &amp; =
2, via WireGuard - 585 Mbit/sec=C2=A0<br></div><div class=3D"gmail_default"=
 style=3D"font-family:arial,helvetica,sans-serif">- I might have expected a=
 bit higher, but this is certainly acceptable.<br></div><div class=3D"gmail=
_default" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div c=
lass=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Bet=
ween 3 and 1, direct iperf3 - 580 Mbit/sec</div><div class=3D"gmail_default=
" style=3D"font-family:arial,helvetica,sans-serif">Between 3 and 1, WireGua=
rd - 73 Mbit/sec</div><div class=3D"gmail_default" style=3D"font-family:ari=
al,helvetica,sans-serif">=C2=A0 =C2=A0</div><div class=3D"gmail_default" st=
yle=3D"font-family:arial,helvetica,sans-serif">At this point I was guessing=
 WireGuard was CPU limited on this little Celeron, so I set up the Xeon VM =
(#4):</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetic=
a,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:a=
rial,helvetica,sans-serif">Between 4 and 1, direct iperf3 - ~600 Mbit/sec</=
div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-=
serif">Between 4 and 1, WireGuard - 80 Mbit/sec</div><div class=3D"gmail_de=
fault" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div clas=
s=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">In oth=
er words, the much faster VM is only a tiny bit faster that the celeron.</d=
iv><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-s=
erif"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,hel=
vetica,sans-serif">Any suggestions?</div><div class=3D"gmail_default" style=
=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_d=
efault" style=3D"font-family:arial,helvetica,sans-serif">Thanks,</div><div =
class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">Sc=
ott</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,=
sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:ari=
al,helvetica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-family:arial,helvetica,sans-serif"><br></div></div></div></div></div></d=
iv></div>

--0000000000000c3f9c0582d24035--

--===============1063895895781665721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1063895895781665721==--
