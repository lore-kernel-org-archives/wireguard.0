Return-Path: <SRS0=hbZ4=2G=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F63C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Dec 2019 07:36:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7285020733
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Dec 2019 07:36:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Mfbqs4JF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7285020733
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26307c06;
	Mon, 16 Dec 2019 07:36:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bdd36e4f
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Dec 2019 07:36:26 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b418f19
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Dec 2019 07:36:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf1cdda4
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Dec 2019 06:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=mOjRF2Wp8ABNcCxpKF6gKoGLZCg=; b=Mfbqs4
 JFFQlaCWUsEqv3Mu+an9LLNLXFf2RrMhcnpUGBj62inwnhiXq3ucVauJAelj85wv
 zKaDkBNK4jdwcjpiM2iHyrEeKo/x3cEuE7RH15gCrU+0f+C45kQI1kqWmn109ab/
 p6UebLIfAcvjb5aqc7sIday1CuAjuHxtXXGWVkz+fNW3kZE+4ZYnZrARKCp2ACO8
 /0SuSMdEf3bRHmetu5sRcAq7WThXJO7tF/WhPZ7ReWLOf+Vg49hpfXPwUgxvTX2g
 uZwIJUE1Qu/G2jFF5xr43yQepc6LRAlyf0VvkvigEXZGPqUtiVYzEgziLTf8/r7Z
 Uwa167FUbkHVGalQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 55945cfd
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Dec 2019 06:40:09 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id 59so7917797otp.12
 for <wireguard@lists.zx2c4.com>; Sun, 15 Dec 2019 23:36:26 -0800 (PST)
X-Gm-Message-State: APjAAAVVPQCsuNooFYyfhuc2fu12mzL2j/CMZQkD8i7F8dBhsoiX4xfT
 ncdyXla6urym2y24Cb8a1v8vrMgef9Unotd6XQc=
X-Google-Smtp-Source: APXvYqwcjRIexILf+WNwSMxC2nYY0nYp+s8CedAdfnQ7acSSEXatywvpIgWzOM0Jln0GcrZTVvX+jPKdoVJgQCxPFzE=
X-Received: by 2002:a9d:1e88:: with SMTP id n8mr31582050otn.369.1576481785655; 
 Sun, 15 Dec 2019 23:36:25 -0800 (PST)
MIME-Version: 1.0
References: <e391693c-d4c4-91a0-6ebc-72a038d95a6b@gtt.tools>
In-Reply-To: <e391693c-d4c4-91a0-6ebc-72a038d95a6b@gtt.tools>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 16 Dec 2019 08:36:14 +0100
X-Gmail-Original-Message-ID: <CAHmME9oNDuoT=8r7nMFdL9_njrBoYuiAUx3vAD46tjaiWf1uNA@mail.gmail.com>
Message-ID: <CAHmME9oNDuoT=8r7nMFdL9_njrBoYuiAUx3vAD46tjaiWf1uNA@mail.gmail.com>
Subject: Re: wireguard-android: Unable to import tunnel: invalid name
To: Dirk Kaiser <dirk@gtt.tools>
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
Content-Type: multipart/mixed; boundary="===============1666943061985663965=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1666943061985663965==
Content-Type: multipart/alternative; boundary="000000000000d438870599cd443d"

--000000000000d438870599cd443d
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 16, 2019, 06:57 Dirk Kaiser <dirk@gtt.tools> wrote:

> I've created the following client configurations with the following
> filenames:
>
> brat.batyr_LS.US_test.conf  <==kicks off error
> pkds_LS.US_test.conf  <==imports fine
> y_LS.US_test.conf  <==imports fine
> zarina_LS.US_test.conf  <==kicks off error
>
> On the Android client, the first and last filename generate the 'Unable
> to import tunnel: invalid name' when trying to import.  The other two
> come import just fine.  If I rename the two problem files to something
> else (i.e., brat.batyr.conf and zarina.conf), they import just fine.
> There obviously is a bug in the filename handling that needs to be fixed.
>

"Obviously", eh?

It's a length restriction, actually. We take the kernels interface name
length (and format) restrictions to retain parity of configs for both the
wgquick backend and the go backend.

Jason

>

--000000000000d438870599cd443d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, Dec 16, 2019, 06:57 Dirk Kaiser &lt;dirk@g=
tt.tools&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I&#39;ve create=
d the following client configurations with the following<br>
filenames:<br>
<br>
brat.batyr_LS.US_test.conf=C2=A0 &lt;=3D=3Dkicks off error<br>
pkds_LS.US_test.conf=C2=A0 &lt;=3D=3Dimports fine<br>
y_LS.US_test.conf=C2=A0 &lt;=3D=3Dimports fine<br>
zarina_LS.US_test.conf=C2=A0 &lt;=3D=3Dkicks off error<br>
<br>
On the Android client, the first and last filename generate the &#39;Unable=
<br>
to import tunnel: invalid name&#39; when trying to import.=C2=A0 The other =
two<br>
come import just fine.=C2=A0 If I rename the two problem files to something=
<br>
else (i.e., brat.batyr.conf and zarina.conf), they import just fine.=C2=A0<=
br>
There obviously is a bug in the filename handling that needs to be fixed.<b=
r></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">&q=
uot;Obviously&quot;, eh?</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>It&#39;s a length restriction, actually. We take the kernels interface nam=
e length (and format) restrictions to retain parity of configs for both the=
 wgquick backend and the go backend.</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Jason</div><div dir=3D"auto"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000d438870599cd443d--

--===============1666943061985663965==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1666943061985663965==--
