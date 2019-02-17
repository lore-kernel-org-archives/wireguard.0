Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 886C7C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 15:21:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E11A521A4A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 15:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E11A521A4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa3ee905;
	Sun, 17 Feb 2019 15:13:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4eb2aff9
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 15:13:01 +0000 (UTC)
Received: from mail-it1-f173.google.com (mail-it1-f173.google.com
 [209.85.166.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51688620
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 15:13:01 +0000 (UTC)
Received: by mail-it1-f173.google.com with SMTP id f10so11983573ita.4
 for <wireguard@lists.zx2c4.com>; Sun, 17 Feb 2019 07:21:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=d9XB49OOfdDpTrQbo2iTFOj8ezLDIkqxMBT5PlN6feg=;
 b=BxKwcdyACiZ6+GrMGKUeQMquLqk/hsUie8d9hXBsIeMZHQRdn5yN/uzE9GgmtGRqvF
 KP+9wJ1j4ufBYedVOM2z5j3lwLXdkZJ4JOCFb+LOn+R5SC5KEvLOy1p9L9rzGTaz4H+u
 g56oj9WjrRLkVur9Ni6hVrMJMUqSj3WUVtRv0gpEnVclhitN3Y8H86uFesRbEMBldO7q
 KckROeIvnknIr+gCMsy8Esx2e0SI1IFA65uuXJ5Vn1Can1KX4dc4vyJ7NaX8u/1e5hQJ
 wxoqwf9THq3Yj3kpY51XquMMy2r6EMKSKCf69kGGL9hxCom/0nFHw7M6nPNChQGod5Vm
 N1DQ==
X-Gm-Message-State: AHQUAub+b6roWQsiNR0KPiWfsTg0i920nNp5l5Z0g6i3h99Z88XJelEW
 b1Wnoj1Xa69rjEKijuIl+aEs47Qo996Qao+Yp7kvgZZELcM=
X-Google-Smtp-Source: AHgI3IY0b8PCyNRMP28KVJr8FQ0RAFgo1Gbd0QxskIx8mFlD6YSO2C/oBkbxUWoklKaBJn5sAL8pOZufcCxpTLvgxJg=
X-Received: by 2002:a6b:4108:: with SMTP id n8mr947909ioa.168.1550416878298;
 Sun, 17 Feb 2019 07:21:18 -0800 (PST)
MIME-Version: 1.0
From: Raffaele Spazzoli <rspazzol@redhat.com>
Date: Sun, 17 Feb 2019 10:21:07 -0500
Message-ID: <CACOeLqLQjM1AQPpi31F_Fxvv02tFgD+27qFGjnLnW8KFcy66Kw@mail.gmail.com>
Subject: dynamic reload of configuration file
To: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============8282332042744424609=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8282332042744424609==
Content-Type: multipart/alternative; boundary="0000000000004906b60582188fd0"

--0000000000004906b60582188fd0
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm using wireguard to build a VPN mesh. The nodes of the mesh are dynamic
and can come and go at any time. Is there a way to reconfigure a wireguard
device without restarting it or losing the current connections?

If yes, how can it be done?


Thanks,
Raffaele

Raffaele Spazzoli
Senior Architect - OpenShift <https://www.openshift.com>, Containers
and PaaS Practice <https://www.redhat.com/en/services/consulting/paas>
Tel: +1 216-258-7717

--0000000000004906b60582188fd0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I&#39;m using wireguard =
to build a VPN mesh. The nodes of the mesh are dynamic and can come and go =
at any time. Is there a way to reconfigure a wireguard device without resta=
rting it or losing the current connections?</div><div><br></div><div>If yes=
, how can it be done?</div><div><br></div><br clear=3D"all"><div><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r">Thanks,<div>Raffaele</div><div><br></div><div>Raffaele Spazzoli</div><di=
v>Senior Architect - <a href=3D"https://www.openshift.com" target=3D"_blank=
">OpenShift</a>, <a href=3D"https://www.redhat.com/en/services/consulting/p=
aas" target=3D"_blank">Containers and=C2=A0PaaS Practice</a></div><div>Tel:=
 +1 216-258-7717</div><div><br></div><div><br></div></div></div></div></div=
></div></div></div></div></div></div></div></div></div>

--0000000000004906b60582188fd0--

--===============8282332042744424609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8282332042744424609==--
