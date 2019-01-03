Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FAAC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:21:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A9B2089F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:21:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6/x1v4n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15A9B2089F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99c455fb;
	Tue, 8 Jan 2019 02:18:22 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45ec7832
 for <wireguard@lists.zx2c4.com>; Thu, 3 Jan 2019 18:59:43 +0000 (UTC)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b223c5e
 for <wireguard@lists.zx2c4.com>; Thu, 3 Jan 2019 18:59:43 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id k12so37989311qtf.7
 for <wireguard@lists.zx2c4.com>; Thu, 03 Jan 2019 11:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=DsYzRZgZn7PNyU/saGq7BENMNOap0spFtkRXylQhbSk=;
 b=d6/x1v4ne/Ty2jYpi7xjLM6WXhVMXrm3CzC7OpRAuP32jsyUHorx46yWh0eiAnVWCc
 LR6Ra0rCbRNpx0mnRZTkWQT9AkH+WYTpiJxZrpH9EqKNdQNGUb5a0YVXESrr9QK4NgpB
 RGY39LxOO1lqiLOGJgXbVJ7xMdjy9camganU/3bU7BL4ZjYxcmN+QvZqf4UQ2yC0rBkG
 Jpzfas0swIYg8Py9pKTJUHuHA+7JjITgmTnwyCNFsk/URfgAK17Q0QqVug35jxxdy6pe
 yxxTHrj14NWIJ6/i6KuFQeBJyaR5d0qrcLYwSzitpxAWwZqYM0zTvYlHXPvgyc74oqlh
 4DwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DsYzRZgZn7PNyU/saGq7BENMNOap0spFtkRXylQhbSk=;
 b=YkTqkFFxbXKXL2gLO5zMjFwJkrx7NNzMdqMOioIgXrtmde/LCud3IAp17dRb/n7Y90
 p7QTsn2VOeIhbJQHw1Nmv/fM/7vCm6XLZXYRzQ4v0ZoY2N/EfHLVmae3ihkQ2CBptT3U
 pBF7MewXLZMbSwAZ1yuA9qTZaupDEHH/ABeoAMyTBlxBVE+aWrxh7sqNIevlaqr8f+wQ
 E1gc7Cd92sROBwtghTGOzDDEZ2Wq+iE94Ypw1VQTxBPFkehv4HAHViOfKkEl6bDRD3sb
 vVMG3B/ouvGw7tAaKoTGKa1tlAIkgbxVcWJWNLjWEyWODhleohcgtP+AyD1Pu57CBdUy
 uKRQ==
X-Gm-Message-State: AA+aEWYFJt4sA+YHoPI5ibQwM235t6HLor7w8NV4aaJs6ZP2U8A8WMfp
 qOsqKc422FTBPI5VhSewCEXqMvW0wBf1zuoWZiG+U5FyXiw=
X-Google-Smtp-Source: AFSGD/UF47ihD0JvGP19ARVBL8C4kdlpgqTTB6HE0N0D3SKK7J63NuF/7SuLuhBvXFBPOyBXF8sPC6mBAjhn/oSXoXg=
X-Received: by 2002:aed:2798:: with SMTP id a24mr47337341qtd.138.1546542134930; 
 Thu, 03 Jan 2019 11:02:14 -0800 (PST)
MIME-Version: 1.0
From: Arpit Gupta <g.arpit@gmail.com>
Date: Thu, 3 Jan 2019 19:02:04 +0000
Message-ID: <CAGCGytL90oVSVe_VNKszSynq_gvNzKGwORk8LEacXMANVaD2zA@mail.gmail.com>
Subject: issue with certain apps + wireguard
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Tue, 08 Jan 2019 03:18:20 +0100
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
Content-Type: multipart/mixed; boundary="===============1575582035863909307=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1575582035863909307==
Content-Type: multipart/alternative; boundary="000000000000953084057e926632"

--000000000000953084057e926632
Content-Type: text/plain; charset="UTF-8"

Hi All

A new user here. Recently setup wireguard to run on my pi 3 + pi hole. I am
noticing some interesting behavior with certain apps.

When using Google Duo on my android phone it would not work if wireguard
was configured in split tunnel mode. When i enabled all traffic via
wireguard it worked fine.

Downloading app updates my phone when on wireguard would not work
regardless if it was split tunnel or all traffic was being routed via
wireguard. Interestingly installing an app did not have any issue.

Another issue i noticed is when i try to open lets say a pdf attachment in
my browser from gmail it gets stuck in downloading state. I then turn off
wireguard and then it works fine.

All of this is when i am at home so network is not an issue. I have
confirmed pi hole is not causing issues as when i disable wireguard
applications are working fine and still using pi hole dns.

I am noob in the matters of VPN, security, network etc so i wanted to see
if people had thoughts on how i can debug this further to determine if this
is an issue with the wireguard app on my phone vs the peer running on my pi
and if there are certain types of apps i should add to my exclude list.
Right now i have added google duo and play store to it.

On my pi3 i am running wireguard 0.0.20181218-1 and on my pixel 3xl i am
running 0.0.20181218 and go backend of 0.0.20181018.

Thanks
--
Arpit

--000000000000953084057e926632
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi All</div><div><br></div><div>A ne=
w user here. Recently setup wireguard to run on my pi 3 + pi hole. I am not=
icing some interesting behavior with certain apps.</div><div><br></div><div=
>When using Google Duo on my android phone it would not work if wireguard w=
as configured in split tunnel mode. When i enabled all traffic via wireguar=
d it worked fine.</div><div><br></div><div>Downloading app updates my phone=
 when on wireguard would not work regardless if it was split tunnel or all =
traffic was being routed via wireguard. Interestingly installing an app did=
 not have any issue.</div><div><br></div><div>Another issue i noticed is wh=
en i try to open lets say a pdf attachment in my browser from gmail it gets=
 stuck in downloading state. I then turn off wireguard and then it works fi=
ne.</div><div><br></div><div>All of this is when i am at home so network is=
 not an issue. I have confirmed pi hole is not causing issues as when i dis=
able wireguard applications are working fine and still using pi hole dns.</=
div><div><br></div><div>I am noob in the matters of VPN, security, network =
etc so i wanted to see if people had thoughts on how i can debug this furth=
er to determine if this is an issue with the wireguard app on my phone vs t=
he peer running on my pi and if there are certain types of apps i should ad=
d to my exclude list. Right now i have added google duo and play store to i=
t.</div><div><br></div><div>On my pi3 i am running wireguard 0.0.20181218-1=
 and on my pixel 3xl i am running 0.0.20181218 and go backend of 0.0.201810=
18.</div><div><br></div><div>Thanks<br></div><div><div><div dir=3D"ltr" cla=
ss=3D"gmail_signature"><div dir=3D"ltr"><div>--</div>Arpit</div></div></div=
></div></div></div>

--000000000000953084057e926632--

--===============1575582035863909307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1575582035863909307==--
