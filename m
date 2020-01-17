Return-Path: <SRS0=RHSj=33=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NORMAL_HTTP_TO_IP,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D97C352A2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Feb 2020 11:21:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 629402082E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Feb 2020 11:21:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxD3rnVs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 629402082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1dbfaf94;
	Fri, 7 Feb 2020 11:20:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39de2ec4
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Jan 2020 10:54:11 +0000 (UTC)
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91970842
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Jan 2020 10:54:10 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id j17so21853866edp.3
 for <wireguard@lists.zx2c4.com>; Fri, 17 Jan 2020 02:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=b2wPDvJfaxS/fUGTRDK5aOSL8rN0dAfqLATmIReBIHs=;
 b=MxD3rnVsL77Hs3iVLkAj+L3U9l0bsYMnymHoxKMtp6N+2NoqImsF4+XRfH8VkKjL5p
 hRYow79N59lGyN8VRNl8HJP33Qg4yAGwcO1E4gaWzWOn5zzz46pcoYWs3QbXjbYuVezx
 XP1l85wmCoXBH3hnzSEL1QpMjjBmH4PUwmHnZPNQqnuh9rxh7vuN1aIqyf7RTyBkVsEj
 rUWcjukJdk/893Suji9ewM0QZYZOgHcZWzLavMRv44wDoIpnebUUh+20+hL2Rx7psnSn
 E+RtW8RY2GtvgckrQsOBgOqmkjswqF2dTi4fdtu9PWGwk5ASRLlQ4nlFrYniN9Wy8Pad
 y4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=b2wPDvJfaxS/fUGTRDK5aOSL8rN0dAfqLATmIReBIHs=;
 b=XK5udtfmbI7yemFNVFOt93mVI4kydyHIFqDlii+hoOPrrGc3NARHEyMzPACyp65QRl
 o6UVcJdUsWHhhv73sQHJavcJc5pUboxrJ1YB3IeUQ6tp1CJGg7E+CUuObNiqC6cU7T1N
 sJIbA0vfCCBD3SLkiOK5g/Kora82gLEMO+7UZV5fMnAQ/AGmUEw6Vz1MK5Xor3iYg0jN
 fddZ4pXUeIC6V3Acbt83RK4cZXb6ommX0NbJkZoXO5Et/004CpEUJd6z896him2ycoVI
 t6dXaR+9Teq7Ei4KhzuGi0lLDrFRLwGxifeZsLempTkvH+jYbGGdVNJExsLGapZ3s/57
 MwZg==
X-Gm-Message-State: APjAAAW5iqjGsAtB18IT/7I7T4cgVppiu6J9Jfv5PHQCndt6IvjOMPtJ
 hmYYXUENUOmVm0C1p2S+kXM199cCQckc2ijcbQBg
X-Google-Smtp-Source: APXvYqxqRDwX4SObVSSNLRZUyO3x3MF35lhs3Brvpcl4yimRan8RO97XSfRBQMAKOfxgZTmbn+ZU+dwflc8LuR68xY4=
X-Received: by 2002:aa7:d610:: with SMTP id c16mr2987471edr.323.1579258449348; 
 Fri, 17 Jan 2020 02:54:09 -0800 (PST)
MIME-Version: 1.0
From: Roberto 007 <mikit77777@gmail.com>
Date: Fri, 17 Jan 2020 17:53:57 +0700
Message-ID: <CABW-WNP=WfUcLaex2bMPAv4FX6hUmt4==CXx=nT3=K0NbHqE_g@mail.gmail.com>
Subject: BGP over multiple wireguard vpn link
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 07 Feb 2020 12:20:37 +0100
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
Content-Type: multipart/mixed; boundary="===============8959761909165882094=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8959761909165882094==
Content-Type: multipart/alternative; boundary="000000000000e1ccd2059c53c2bf"

--000000000000e1ccd2059c53c2bf
Content-Type: text/plain; charset="UTF-8"

Hello Wireguard team,

I would like to test multiple VPN links with BGP which is for controlling
traffic.
I have no problem to make BGP over multiple links but once I tried to ping
then I found a problem because I cannot set Allowed-IPs 0.0.0.0/0 to all
the wireguard links.

My question is that this kind of configuration is not supported wireguard?

I could make it with IPSec without any issues.

If you could give us some advice, it would be greatly appreciated.

Thanks and best regards,
Miki

--000000000000e1ccd2059c53c2bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Wireguard team,<div><br></div><div>I would like to t=
est multiple VPN links with BGP which is for controlling traffic.</div><div=
>I have no problem to make BGP over multiple links but once I tried=C2=A0to=
 ping then I found a problem because I cannot set Allowed-IPs <a href=3D"ht=
tp://0.0.0.0/0">0.0.0.0/0</a> to all the wireguard links.</div><div><br></d=
iv><div>My question is that this kind of configuration is not supported wir=
eguard?=C2=A0</div><div><br></div><div>I could make it with IPSec without a=
ny issues.</div><div><br></div><div>If you could give us some advice, it=C2=
=A0would be greatly appreciated.</div><div><br></div><div>Thanks and best r=
egards,</div><div>Miki</div><div><br></div></div>

--000000000000e1ccd2059c53c2bf--

--===============8959761909165882094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8959761909165882094==--
