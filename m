Return-Path: <SRS0=8Q1O=NR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762EAC32789
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 22:31:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCB422083D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 22:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCB422083D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4f432a9;
	Tue, 6 Nov 2018 22:26:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7dc76f1e
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 22:26:44 +0000 (UTC)
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com
 [209.85.166.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73bbc6d0
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 22:26:44 +0000 (UTC)
Received: by mail-it1-f177.google.com with SMTP id m15so20075957itl.4
 for <wireguard@lists.zx2c4.com>; Tue, 06 Nov 2018 14:31:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=O8Ni4LYH3Zh07GuThVwc9DEGvOISo+poJ1j4gh0eLDg=;
 b=HsUQaOn9xKLifp6Vq4Y1H7molBvmMCzAq54NlEsd9jHAv3UTRH02rJNla2YyJyI7DB
 5HR5QuZj9Wvs5my2VGGl3Mcs+CrKPWQr63QbYALl5rfqP6aszzCXyT66zi3Xp0WTax5g
 oy8tdafPxgsmzKG9K4xvZTQyx2lJF8ChLK/zJWmGKLpcZTNOorw7bRvuK7ghIKDhr/3j
 qzTn4lR7bEL6pMrUA2rnoi27y9vFgFJf3ugnYBPy/iA6Nup6x3OyHkZ+zkU3kHU+sa96
 qRIxZKG+6t7W4f5jiviyhPVMlTtaIR9dQe9PLGUbhlbdFgYp5dUcTFql3R7+IUvFDWCU
 5NvA==
X-Gm-Message-State: AGRZ1gKLh9wSrbx6Fc982N1cYlh1YMoEGvdqHuv9gH5gVpZ4XhpedDgK
 MF1GYeDwdQpk2ADLhcyYeheDU1pwvHqu1BBbK+syxMsh33U=
X-Google-Smtp-Source: AJdET5d7WvnCHfSkLIOjcUBNOr9UMo5mYWR/QdGqzDcUDOz+QBOnck7A2PmIbszKp1ZezOz+3fzIOkCl9seIW2vcUuk=
X-Received: by 2002:a24:9583:: with SMTP id
 m125-v6mr3228593itd.175.1541543467353; 
 Tue, 06 Nov 2018 14:31:07 -0800 (PST)
MIME-Version: 1.0
From: Raffaele Spazzoli <rspazzol@redhat.com>
Date: Tue, 6 Nov 2018 17:30:55 -0500
Message-ID: <CACOeLqJ2r5ZG+23mt4So8G1ukCQR3g67x-LgMHZo0RjKJYCiBg@mail.gmail.com>
Subject: wireguard and OpenShift SDN mesh
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
Content-Type: multipart/mixed; boundary="===============5746070858513524799=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5746070858513524799==
Content-Type: multipart/alternative; boundary="000000000000c74ee9057a068e28"

--000000000000c74ee9057a068e28
Content-Type: text/plain; charset="UTF-8"

Hi,

I wanted to share that I have come up a method to create a wireguard mesh
for a set of OpenShift clusters. If interested more details can be found
here:
https://blog.openshift.com/connecting-multiple-openshift-sdns-with-a-network-tunnel/
https://blog.openshift.com/connecting-multiple-openshift-sdns-with-a-network-tunnel-part-2-service-proxying-and-discovery/



Thanks,
Raffaele

Raffaele Spazzoli
Senior Architect - OpenShift <https://www.openshift.com>, Containers
and PaaS Practice <https://www.redhat.com/en/services/consulting/paas>
Tel: +1 216-258-7717

--000000000000c74ee9057a068e28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi,</div><div><br><=
/div><div>I wanted to share that I have come up a method to create a wiregu=
ard mesh for a set of OpenShift clusters. If interested more details can be=
 found here:</div><div><a href=3D"https://blog.openshift.com/connecting-mul=
tiple-openshift-sdns-with-a-network-tunnel/">https://blog.openshift.com/con=
necting-multiple-openshift-sdns-with-a-network-tunnel/</a></div><div><a hre=
f=3D"https://blog.openshift.com/connecting-multiple-openshift-sdns-with-a-n=
etwork-tunnel-part-2-service-proxying-and-discovery/">https://blog.openshif=
t.com/connecting-multiple-openshift-sdns-with-a-network-tunnel-part-2-servi=
ce-proxying-and-discovery/</a></div><div>=C2=A0</div><div><br></div><br cle=
ar=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"=
><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><di=
v dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">Thanks,<div>Raffa=
ele</div><div><br></div><div>Raffaele Spazzoli</div><div>Senior Architect -=
 <a href=3D"https://www.openshift.com" target=3D"_blank">OpenShift</a>, <a =
href=3D"https://www.redhat.com/en/services/consulting/paas" target=3D"_blan=
k">Containers and=C2=A0PaaS Practice</a></div><div>Tel: +1 216-258-7717</di=
v><div><br></div><div><br></div></div></div></div></div></div></div></div><=
/div></div></div></div></div></div></div></div></div></div></div>

--000000000000c74ee9057a068e28--

--===============5746070858513524799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5746070858513524799==--
