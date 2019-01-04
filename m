Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,WEIRD_PORT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF590C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:26:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74E3F2089F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:26:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyKY8gEP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74E3F2089F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24dd3dca;
	Tue, 8 Jan 2019 02:22:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a5e00ad
 for <WireGuard@lists.zx2c4.com>; Fri, 4 Jan 2019 08:28:35 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 431b1ac8
 for <WireGuard@lists.zx2c4.com>; Fri, 4 Jan 2019 08:28:35 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id l10so24892318lfh.9
 for <WireGuard@lists.zx2c4.com>; Fri, 04 Jan 2019 00:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xPkaKejE/Pyj09FSyrmuh4mMzFgKTXZtigonE7p/mKs=;
 b=WyKY8gEP1tc2MMEmtHKFxeBpNpOAQ/t45cnp1SKOfKgqs1GzK2uDUcB2UuDYH52oS8
 9cSBh8E/41s/8xEvwHwkhy1esjfvmGEQU8k3vJR39x1griRm8dtt8BGVe9bNDZUCMKaA
 NU/5oZKhiFY86RfEx09huPOU7EiUXfJTWp3Zf4IIOvjnJOB2UR3+o45Xn8oKtwrJNDZ+
 GVVFgiqh0lj0ILwRZp5BgAMEOtH+wYgwrDQ4GyJscnJoIzlaAwfeV9hYoCux9Aue+Uou
 3h/uLHxXnU7ZRypa/UQ9rwxtmyE+88Ks4cODD0c7rupE1xPcX7L2wkVMsZEqKsY6B+XI
 UwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xPkaKejE/Pyj09FSyrmuh4mMzFgKTXZtigonE7p/mKs=;
 b=F2vjE99kcLmAEZbZNlojjrXRRtTA2TXxgUbLoyJLaEeyPEbov6sr2+cqn7QAjiOWbj
 a/wlck79/XMz9wT/tqZmZviUSXTqdvSnPxAM1e4dg95BVp1gQZ/ldXvie+RlcWHh1+2r
 YhJYfUJyJjGduOnxSN0INie1vhzT7kJAWz00Pn48j+XVVab0IXpvrAo4ZRCckvyVqB4+
 JkBSWmWPUlPGEqEiXuh/qC3ZQ+UjYGNLVfByTujqC0KVCONadTu2/M2BVNtZtcMz0Twn
 JCOJapmunHPlw8N2C3U/FZwB7sC2SLTL+nHn0Gpu0azmtFIMurr//g6sDktgkgoK4Fa+
 GIwg==
X-Gm-Message-State: AA+aEWZ8vP4C8KINVHuimVszsBVXtbL05xZhERbKq6F9AtjNcnopwVh1
 5YNBglKpA0nkMoZPXIlZsi66sJ4c+dZ4cZmzjfg=
X-Google-Smtp-Source: AFSGD/WVnpiJnqnv0AECnIRuuRb010N7oiyFGo95KHFyvBsD0V9YXJI1v4zOO+IYsedXmBeYe651UaDFoTxYcBP84N4=
X-Received: by 2002:a19:1bd2:: with SMTP id
 b201mr24036813lfb.136.1546590670257; 
 Fri, 04 Jan 2019 00:31:10 -0800 (PST)
MIME-Version: 1.0
References: <CAPRZce1x-TLHiZ=nU9s0_aYcWZdf_hTbcXYg+ZkAjD1F_=X9ng@mail.gmail.com>
In-Reply-To: <CAPRZce1x-TLHiZ=nU9s0_aYcWZdf_hTbcXYg+ZkAjD1F_=X9ng@mail.gmail.com>
From: Henning Reich <henningreich@gmail.com>
Date: Fri, 4 Jan 2019 09:30:33 +0100
Message-ID: <CAOAVeL0KUkr1gZfeipuQ9+vWKSBnGOx4QnF+hfcTKcCqvJh-eA@mail.gmail.com>
Subject: Re: Wireguard + anycast
To: Edward Vielmetti <edward.vielmetti@gmail.com>
X-Mailman-Approved-At: Tue, 08 Jan 2019 03:22:44 +0100
Cc: WireGuard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============8634323778106004175=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8634323778106004175==
Content-Type: multipart/alternative; boundary="00000000000083831b057e9db390"

--00000000000083831b057e9db390
Content-Type: text/plain; charset="UTF-8"

I think you could add multiple peers with the same (anycast) Endpoint but
different Key-Pairs (see the try of an example below).
Your DNS will select the IP for the closed one, and WG will try to connect
with each Key until success.
Or did I missing some important point?


cat /etc/wireguard/wg0.conf
[Interface]
Address = 172.16.0.2/24
ListenPort = 12345
PrivateKey = YIYTN0Hil/32QWTo3F1fTVc3SDkgncXLHbGFlCgIQnM=

# anycast-Server 1
[Peer]
PublicKey = K+m7KQWy78JIAL7+8oFUdgrlBQdS8NZ2IPJu1rPTsnQ=
AllowedIPs = 172.16.0.1/24, 192.168.178.0/24
Endpoint = my.anycast.com:12345

# anycast-Server 2
[Peer]
PublicKey = O79QWUAdNFbWFIuWeKp3264BL3RuWKF+WFO21r2tAo=
AllowedIPs = 172.16.0.1/24, 192.168.178.0/24
Endpoint = my.anycast.com:12345


Am Do., 3. Jan. 2019 um 23:38 Uhr schrieb Edward Vielmetti <
edward.vielmetti@gmail.com>:

> A little thought experiment which I haven't tried yet.
>
> Using anycast, a single IP address can be routed to multiple machines in a
> data center or around the world.
>
> Is it at all possible that anycast and Wireguard would play together
> nicely? In particular, is it plausible that you could give a client an
> anycast address of a server to use as its endpoint, and that when it picked
> the correct / closest one that it would do the right thing?
>
> The naive approach would be to have all of the anycast devices share the
> same private/public key pair, but that has a bad smell. And I don't know
> what would happen if your routing changed in mid-connection.
>
> (anycast is the technology used to give name servers a single global
> address, like Google's 8.8.8.8 DNS)
>
> --
> Edward Vielmetti +1 734 330 2465
> edward.vielmetti@gmail.com
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--00000000000083831b057e9db390
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">I think you co=
uld add multiple peers with the same (anycast) Endpoint but different Key-P=
airs (see the try of an example below). <br>Your DNS will select the IP for=
 the closed one, and WG will try to connect with each Key until success.<br=
>Or did I missing some important point?</div><div dir=3D"ltr"><br></div><di=
v dir=3D"ltr"><br></div><div dir=3D"ltr">cat /etc/wireguard/wg0.conf<br>[In=
terface]<br>Address =3D <a href=3D"http://172.16.0.2/24">172.16.0.2/24</a><=
br>ListenPort =3D 12345<br>PrivateKey =3D YIYTN0Hil/32QWTo3F1fTVc3SDkgncXLH=
bGFlCgIQnM=3D<br></div><div dir=3D"ltr"><br></div><div># anycast-Server 1<b=
r></div><div dir=3D"ltr">[Peer]<br>PublicKey =3D K+m7KQWy78JIAL7+8oFUdgrlBQ=
dS8NZ2IPJu1rPTsnQ=3D<br>AllowedIPs =3D <a href=3D"http://172.16.0.1/24">172=
.16.0.1/24</a>, <a href=3D"http://192.168.178.0/24">192.168.178.0/24</a><br=
>Endpoint =3D <a href=3D"http://my.anycast.com:12345">my.anycast.com:12345<=
/a><br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"># anycast-Server 2=
<br>[Peer]<br>PublicKey =3D O79QWUAdNFbWFIuWeKp3264BL3RuWKF+WFO21r2tAo=3D<b=
r>AllowedIPs =3D <a href=3D"http://172.16.0.1/24">172.16.0.1/24</a>, <a hre=
f=3D"http://192.168.178.0/24">192.168.178.0/24</a><br>Endpoint =3D <a href=
=3D"http://my.anycast.com:12345">my.anycast.com:12345</a><br><br></div></di=
v></div></div></div></div></div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr">Am Do., 3. Jan. 2019 um 23:38=C2=A0Uhr schrieb Edward Vielmetti =
&lt;<a href=3D"mailto:edward.vielmetti@gmail.com">edward.vielmetti@gmail.co=
m</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr">A little thought experiment which I haven&#39;t tried yet.<div>=
<br></div><div>Using anycast, a single IP address can be routed to multiple=
 machines in a data center or around the world.</div><div><br></div><div>Is=
 it at all possible that anycast and Wireguard would play together nicely? =
In particular, is it plausible that you could give a client an anycast addr=
ess of a server to use as its endpoint, and that when it picked the correct=
 / closest one that it would do the right thing?</div><div><br></div><div>T=
he naive approach would be to have all of the anycast devices share the sam=
e private/public key pair, but that has a bad smell. And I don&#39;t know w=
hat would happen if your routing changed in mid-connection.</div><div><br><=
/div><div>(anycast is the technology used to give name servers a single glo=
bal address, like Google&#39;s 8.8.8.8 DNS)<br clear=3D"all"><div><br></div=
>-- <br><div dir=3D"ltr" class=3D"gmail-m_-7529213214564369591gmail_signatu=
re"><span>Edward Vielmetti=C2=A0<span id=3D"gmail-m_-7529213214564369591gc-=
number-93" class=3D"gmail-m_-7529213214564369591gc-cs-link" title=3D"Call w=
ith Google Voice">+1 734 330 2465</span></span><div><a href=3D"mailto:edwar=
d.vielmetti@gmail.com" target=3D"_blank">edward.vielmetti@gmail.com</a></di=
v><div><br></div></div></div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--00000000000083831b057e9db390--

--===============8634323778106004175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8634323778106004175==--
