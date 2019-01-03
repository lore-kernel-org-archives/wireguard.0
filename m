Return-Path: <SRS0=V5/A=PL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D0EC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  3 Jan 2019 22:37:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8854208E3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  3 Jan 2019 22:37:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kq8urrij"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8854208E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23a20817;
	Thu, 3 Jan 2019 22:34:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 224a01c7
 for <WireGuard@lists.zx2c4.com>; Thu, 3 Jan 2019 22:34:53 +0000 (UTC)
Received: from mail-it1-x135.google.com (mail-it1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03633ef9
 for <WireGuard@lists.zx2c4.com>; Thu, 3 Jan 2019 22:34:52 +0000 (UTC)
Received: by mail-it1-x135.google.com with SMTP id i145so47464473ita.4
 for <WireGuard@lists.zx2c4.com>; Thu, 03 Jan 2019 14:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=MzS2Lhdwnl+2/lCXXMeUGzEOEgGAVQ/oi3Zr66nVvwI=;
 b=kq8urrijXt5PhAdQjyUHUA1QSjqlBf74WElxhZIwP3UaVyyZPHgtiREJ4C/6ClV8X9
 Jx7Cdig/xA/BJ/A2t8rzExVyOu/eheTg7s9XgKt+27vAr0Vbv2Zd+XFrpxRfLwYGvHAL
 4c/VwicO+oRZpjm2o8D8lY7CNuqvg8XUV0iMbAzgCNQK9wA1FUNb/ktPIAveQDgabImy
 IfOQT8JDZR9rfdgUcQFoAd3X+b8g8dUlRZAV8HdTBnNhyOs/ZqnXxarNnkdSLN4bkDvF
 nC4cCqkNLEkZMGAE/YQtWd2FjWgIoFN28MY2ukxWJUbuzX4GjbUGQzaVYOBUIlvhd6u8
 vxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MzS2Lhdwnl+2/lCXXMeUGzEOEgGAVQ/oi3Zr66nVvwI=;
 b=mGNiYDpFaSwcQ3jGoUeOR+JZhfbL9dZqVhsDGs26E+S+zrtbNncUYqbvPPLB5Yjkxc
 MCVcZpeUNSubvyaPnrL/LT6NbBR5iaL71vRx7hR0GF8EJoXx5L3KyO44ZOhJy9yfgVYr
 bC7OqpE3SGSL5KzFQcxbzatOGct8GCnZyb5Qg8LesEEMfmPjTt64Et7+GW4P6G294zTt
 F+nOJyuBUdMIAKEoT6bywLg5sZke2UPJGpKik2AD7H6dFYpHHpWUJgCfq+ChsB52q4yR
 WDjxCR8zzILjCnGH99l2RwXWAelicBUA9NMe4pcMRmo0b6VLtIByzgx9+KKGrR5iprZR
 SP7A==
X-Gm-Message-State: AA+aEWYbbZvrNRzQIs4t6yvyUp+iHKvrj+b5feQ7sElZ2Cy+fXsob0T4
 wjCQ7GyTyat9t/qiMBXxOP5xE4hG6m07WK06L0lsLGTS
X-Google-Smtp-Source: AFSGD/Ws8FdeAEpqGZHvJdG5Mogcmzy84Ask4khBO9EbYVH3LvaPcxhC1h5Ot94dfYg9xojSPqz4DCKA0XIUq5frsjc=
X-Received: by 2002:a24:8a44:: with SMTP id v65mr31418305itd.67.1546555043699; 
 Thu, 03 Jan 2019 14:37:23 -0800 (PST)
MIME-Version: 1.0
From: Edward Vielmetti <edward.vielmetti@gmail.com>
Date: Thu, 3 Jan 2019 17:36:45 -0500
Message-ID: <CAPRZce1x-TLHiZ=nU9s0_aYcWZdf_hTbcXYg+ZkAjD1F_=X9ng@mail.gmail.com>
Subject: Wireguard + anycast
To: WireGuard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============0320471888911245776=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0320471888911245776==
Content-Type: multipart/alternative; boundary="000000000000016682057e956819"

--000000000000016682057e956819
Content-Type: text/plain; charset="UTF-8"

A little thought experiment which I haven't tried yet.

Using anycast, a single IP address can be routed to multiple machines in a
data center or around the world.

Is it at all possible that anycast and Wireguard would play together
nicely? In particular, is it plausible that you could give a client an
anycast address of a server to use as its endpoint, and that when it picked
the correct / closest one that it would do the right thing?

The naive approach would be to have all of the anycast devices share the
same private/public key pair, but that has a bad smell. And I don't know
what would happen if your routing changed in mid-connection.

(anycast is the technology used to give name servers a single global
address, like Google's 8.8.8.8 DNS)

-- 
Edward Vielmetti +1 734 330 2465
edward.vielmetti@gmail.com

--000000000000016682057e956819
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">A little thought experiment which I haven&#39;t tried yet.=
<div><br></div><div>Using anycast, a single IP address can be routed to mul=
tiple machines in a data center or around the world.</div><div><br></div><d=
iv>Is it at all possible that anycast and Wireguard would play together nic=
ely? In particular, is it plausible that you could give a client an anycast=
 address of a server to use as its endpoint, and that when it picked the co=
rrect / closest one that it would do the right thing?</div><div><br></div><=
div>The naive approach would be to have all of the anycast devices share th=
e same private/public key pair, but that has a bad smell. And I don&#39;t k=
now what would happen if your routing changed in mid-connection.</div><div>=
<br></div><div>(anycast is the technology used to give name servers a singl=
e global address, like Google&#39;s 8.8.8.8 DNS)<br clear=3D"all"><div><br>=
</div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature"><span>Edward Vielmetti=C2=A0<span id=3D"gc-number-93" class=
=3D"gc-cs-link" title=3D"Call with Google Voice">+1 734 330 2465</span></sp=
an><div><a href=3D"mailto:edward.vielmetti@gmail.com" target=3D"_blank">edw=
ard.vielmetti@gmail.com</a></div><div><br></div></div></div></div>

--000000000000016682057e956819--

--===============0320471888911245776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0320471888911245776==--
