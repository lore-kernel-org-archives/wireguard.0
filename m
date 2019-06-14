Return-Path: <SRS0=O0ly=UR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CF12C31E5B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:16:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 177A6213F2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:16:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLrTrYak"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 177A6213F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5bdd11f;
	Tue, 18 Jun 2019 15:16:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44f6b555
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Jun 2019 15:57:09 +0000 (UTC)
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d896c9e
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Jun 2019 15:57:09 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id a27so1975556qkk.5
 for <wireguard@lists.zx2c4.com>; Fri, 14 Jun 2019 08:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=aFmgDZ0mUlq3FqzXKTQYibd9Svh6Kv2hh0/P+h1QCNg=;
 b=hLrTrYakyjRvHELIZ+h5X+NwZt2hzdFI2i3gyERlrsxsEPcfH6xBkYBmcgbjUwdMw9
 K+H3zs9EB9lg3g6+V1YHZqVhnJjlQq2yhU2wyRtOUgzWqVUMgTOmdLQWoJWKTh/dpXMh
 E9RDbaWB5GT3oRtMRhQ/l3buMGhszWBqDPtkLRD8Si7rznsSfcqSgNvsvpzpZPPHTE3d
 wTn7mjxh2qX6of2ZgipZM1pwfS7KY/sQ0VaX6hHHI6K5nPbYx8DarUrCh3Q1W6nW2AXT
 yqIkM5dDIPVAmt0ER5ynufZMh5656p/5zXWff32uAb/kUwVwujLJjpWDJrUsOrVRnr/0
 0rRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=aFmgDZ0mUlq3FqzXKTQYibd9Svh6Kv2hh0/P+h1QCNg=;
 b=ULX1KSlJIu9OD/+EpMwVpgX+C9PMftXpzZOZmYb5YIiOYa4qVpjRKlznJ4jts3YqX2
 wRK9fBtmE3H4hZg8tOPU9M9j1qZh32DkrtW/yUyA9LhYALuyVSoYkfKAC6lr5+DivzqW
 1jm5O2WqBl3TBRMD//Jnuzdb+/yaTcto+IPkxbHlHTDX74e/lwd2CXXKexX77enOjL/B
 TSvI4TkI9Eb4eVigfvmHGf78P9lKa/yj2aQqZyULBS+GjgclLdECgwnaWxnOD1m/zTqt
 KbdB2oFTjiOkE/TQhdgMvQbNKTu8so2VieNRJnTERraoeJkHoMNyTB36PQNvTrA7UHtr
 gZew==
X-Gm-Message-State: APjAAAUBiYLa3UnUOpXpfJhTqcyrpa8PwpE7Ml2pf/BaWKC9gT0OBKvr
 6XKvJT4O5okYp63sqlZ4OJNpH+2EarhhDeivSP8=
X-Google-Smtp-Source: APXvYqzODf0e/lRiCxxcVuqfVK/arEnVfzIg+7+RKFHjY5fsWLuLwzv41GV4pb72PkaF9LWOQtVmtaT+CDCuC4T1SG8=
X-Received: by 2002:ae9:f801:: with SMTP id x1mr34330965qkh.151.1560527828159; 
 Fri, 14 Jun 2019 08:57:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAGyAFMV=HvOYDRSB7eRpBDp-47wX2vie8JPgp48in1fH+eXn=A@mail.gmail.com>
 <CAFHpkQFVpN-+Uoc6QsLmD8hjwEC7Ba1Q2SP4SuS_EMu_PT=3nw@mail.gmail.com>
 <7bdf712d-4e0c-0667-c9eb-1bdd862b1e40@sf.lists.topphemmelig.net>
 <bfead88f-3e91-6d49-ea70-e73f626468f1@nikhef.nl>
 <CAGyAFMW10tUVswPa8NfVieUJMm1oX1BFQaa9a0GP3NmgWpRshg@mail.gmail.com>
 <CAGyAFMWODccNnD+yby7HrOUfdDFaceC3AX70+jG9_hL9vF=q+A@mail.gmail.com>
 <CAGyAFMUqqjF67DDdr+BQXvFU515_zK=fDehUJH1TF+zjyjuiAA@mail.gmail.com>
In-Reply-To: <CAGyAFMUqqjF67DDdr+BQXvFU515_zK=fDehUJH1TF+zjyjuiAA@mail.gmail.com>
From: Lev Stipakov <lstipakov@gmail.com>
Date: Fri, 14 Jun 2019 18:56:56 +0300
Message-ID: <CAGyAFMWaHBAR1fPVx5PUERg=JU9hg+mQMhtQExqpE_tHvevSAw@mail.gmail.com>
Subject: Re: [Openvpn-devel] Wintun performance results
To: openvpn-devel <openvpn-devel@lists.sourceforge.net>,
 wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Tue, 18 Jun 2019 17:16:22 +0200
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
Content-Type: multipart/mixed; boundary="===============5484270316768748390=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5484270316768748390==
Content-Type: multipart/alternative; boundary="000000000000dc12ce058b4ab234"

--000000000000dc12ce058b4ab234
Content-Type: text/plain; charset="UTF-8"

Hi,

I got some new Wintun (I used version 0.2) performance stats I would like
to share. I have tested openvpn2 and openvpn3 (both with openssl) on the
client against openvpn2 and proprietary openvpn3 server (which is openvpn3
with kernel acceleration). Cipher AES-256-GCM.

Server - proprietary openvpn3
----------------------------------------------------

ovpn3 wintun   1.90 Gbit/s
ovpn3 tap6       890 Mbit/s

ovpn2 wintun    870 Mbit/s
ovpn2 tap6       440 Mbit/s


Server - open source openvpn2
----------------------------------------------------

ovpn3 wintun    670 Mbit/s
ovpn3 tap6       580 Mbit/s

ovpn2 wintun    610 Mbit/s
ovpn2 tap6        450 Mbit/s


As you see, in every case Wintun overperforms tap-windows6 and approaches
mind boggling 2 Gbit/s.

My openvpn2 wintun patch could be found here
https://github.com/lstipakov/openvpn/tree/feature/wintun, and openvpn3 -
https://github.com/lstipakov/openvpn3/tree/fix/wintun-fixes

Jason / Simon - great work on Wintun!

-- 
-Lev

--000000000000dc12ce058b4ab234
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br><br>I got some new Wintun (I used =
version 0.2) performance stats I would like to share. I have tested openvpn=
2 and openvpn3 (both with openssl) on the client against openvpn2 and propr=
ietary openvpn3 server (which is openvpn3 with kernel acceleration). Cipher=
 AES-256-GCM.<br><br>Server - proprietary openvpn3=C2=A0<br>---------------=
-------------------------------------<br><br>ovpn3 wintun=C2=A0 =C2=A01.90 =
Gbit/s<br>ovpn3 tap6=C2=A0 =C2=A0 =C2=A0 =C2=A0890 Mbit/s<br><br>ovpn2 wint=
un=C2=A0 =C2=A0 870 Mbit/s<div>ovpn2 tap6=C2=A0 =C2=A0 =C2=A0 =C2=A0440 Mbi=
t/s=C2=A0<br><div><br></div><div><br></div><div>Server - open source openvp=
n2<br>----------------------------------------------------=C2=A0=C2=A0<br><=
/div><div><br></div></div><div>ovpn3 wintun=C2=A0 =C2=A0 670 Mbit/s</div><d=
iv>ovpn3 tap6=C2=A0 =C2=A0 =C2=A0 =C2=A0580 Mbit/s=C2=A0=C2=A0<br></div><di=
v><br></div><div>ovpn2 wintun=C2=A0 =C2=A0 610 Mbit/s</div><div>ovpn2 tap6=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 450 Mbit/s</div><div><br></div><div><br></div><=
div>As you see, in every case Wintun overperforms tap-windows6 and approach=
es mind boggling 2 Gbit/s.</div><div><br></div><div>My openvpn2 wintun patc=
h could be found here=C2=A0<a href=3D"https://github.com/lstipakov/openvpn/=
tree/feature/wintun">https://github.com/lstipakov/openvpn/tree/feature/wint=
un</a>, and openvpn3 -=C2=A0<a href=3D"https://github.com/lstipakov/openvpn=
3/tree/fix/wintun-fixes">https://github.com/lstipakov/openvpn3/tree/fix/win=
tun-fixes</a></div><div><br></div><div>Jason / Simon - great work on Wintun=
!</div><div><br></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signatur=
e">-Lev</div></div>

--000000000000dc12ce058b4ab234--

--===============5484270316768748390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5484270316768748390==--
