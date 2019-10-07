Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA57C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:04:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CC2920678
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:04:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZyCIyig"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CC2920678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9625c8f8;
	Wed, 27 Nov 2019 09:04:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 569856b7
 for <wireguard@lists.zx2c4.com>; Mon, 7 Oct 2019 16:03:23 +0000 (UTC)
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c84bbb93
 for <wireguard@lists.zx2c4.com>; Mon, 7 Oct 2019 16:03:23 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id a1so29768635ioc.6
 for <wireguard@lists.zx2c4.com>; Mon, 07 Oct 2019 09:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=G+leXCZE8ko8tm0z+PA5YI6op9QAdppVpT8qQnEKrjg=;
 b=BZyCIyigiLpl2m2dprufN9wX95j4LatW+h4rfMfohb8s2aj/heqd4ofaWkMphZoHFX
 blv9xOlKavUseuLqxlGYdJrYRCpCm/K3k7bquUHp7T2w9dTlXwkYk1RXR+T7rD6qkzUb
 BPOaK+qjXn8PBMOu8JoDyZUHcfeeFSKNwLtn+PmNnUwn0dWy+S3Ae0YRxPPJBWyoH77y
 rxGLI70SQxiIdwhzZnoMvUJ/5zGRaChi0cxat8WEy2jtUS8WYOZ0XV6aUKm5y7LV12FA
 m9wD/hw849x0EvB2L8znr38/ivF7Zx0PFJmkm9vpvZmVTS0Y4mR/ZvB/T0KVvjimWvVc
 m2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=G+leXCZE8ko8tm0z+PA5YI6op9QAdppVpT8qQnEKrjg=;
 b=HMZ5VxrIE5Yc8Fp77j48NZSICEE5hdTCogRaNq07fMcOJ+JnR+BGXN3Brrxp3H7ev0
 MGOFvDUYGd/ILCI1OW0VBSVdPJpFSLZFY56AMkW6gQdkK5iXgfQn6Tvts88c/sKPIfI0
 lkYdOqNyfj/i2iBvGBqovsmSx04aRV5hyK2GNbadRDYbTeYojK2/IhXV29rOlsW/k5Cy
 QAkI7qeX23Xd35xcu4DVXV2j/kXPSW9b9mXyHCWz4OO5A+93S6ZGCLCBVIbGQbDJt6bZ
 gOwXBw59ed9WCsFddPzezEd7HcbAaLGtAM0xO3ibkN4J094N33tNO5pQezQWWlF1maEb
 tS0Q==
X-Gm-Message-State: APjAAAVy+iIlUgDq4McLM6NacIXB3UmkzfHCkqAEsWdAupkxpc8rQuCj
 SGseTsrFQygSCDt9Ohgo22obsTKUoyRC3ECcwnzddUAKySc=
X-Google-Smtp-Source: APXvYqzTozrDl/z5dd6HKoAIcji6MKce/mgvxWV2DP4oxNTCUL24Mh65gpHBlaS82VOWvsHVHdBl9oM6HKRHcbv8zU8=
X-Received: by 2002:a02:cd06:: with SMTP id g6mr26762763jaq.89.1570464201832; 
 Mon, 07 Oct 2019 09:03:21 -0700 (PDT)
MIME-Version: 1.0
From: Anton Tokarev <anton.lastname@gmail.com>
Date: Mon, 7 Oct 2019 19:03:09 +0300
Message-ID: <CAHXMqmzp2+8zgsF4z35OHKE2dmWYP4wM2KvV_V-mjwM0WxK=9g@mail.gmail.com>
Subject: Tunnel Error on Windows 7 x64
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:04:23 +0100
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
Content-Type: multipart/mixed; boundary="===============0601166698386759674=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0601166698386759674==
Content-Type: multipart/alternative; boundary="000000000000e201d505945430e0"

--000000000000e201d505945430e0
Content-Type: text/plain; charset="UTF-8"

Hey, guys!

I've faced an issue on Windows 7 x64.
"Tunnel Error
Unable to create Wintun interface.
Please consult the log for more information."

The log states:
"2019-10-07 19:59:09.665: [TUN] [foo_conf] Unable to create Wintun
interface: Error registering rings: Error listing NDIS interfaces: no
interfaces found"

I've tried to delete, reboot the system and install with forced admin
rights, but it didn't help.

At the same time, on Windows 10 1903 work fine with no issues.

Could you please help me to run Wireguard on Windows 7?

Thanks! Regards


-- 
Best regards, Anton
anton.lastname@gmail.com

--000000000000e201d505945430e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey, guys!<br><br>I&#39;ve faced an issue on Windows 7 x64=
.<br>&quot;Tunnel Error<br>Unable to create Wintun interface.<br>Please con=
sult the log for more information.&quot;<br><br>The log states:<br>&quot;20=
19-10-07 19:59:09.665: [TUN] [foo_conf] Unable to create Wintun interface: =
Error registering rings: Error listing NDIS interfaces: no interfaces found=
&quot;<br><br>I&#39;ve tried to delete, reboot the system and install with =
forced admin rights, but it didn&#39;t help.<br><br>At the same time, on Wi=
ndows 10 1903 work fine with no issues.<br><br>Could you please help me to =
run Wireguard on Windows 7?<br><br>Thanks! Regards<br><div><p class=3D"gmai=
l-p1" style=3D"margin:0px;font-variant-numeric:normal;font-variant-east-asi=
an:normal;font-stretch:normal;font-size:14px;line-height:normal;font-family=
:&quot;Helvetica Neue&quot;"></p><p class=3D"gmail-p1" style=3D"margin:0px;=
font-variant-numeric:normal;font-variant-east-asian:normal;font-stretch:nor=
mal;font-size:14px;line-height:normal;font-family:&quot;Helvetica Neue&quot=
;"><br></p>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature">Best regards,=C2=A0Anton<div><a href=3D"mailto:anton.l=
astname@gmail.com" target=3D"_blank">anton.lastname@gmail.com</a></div></di=
v></div></div>

--000000000000e201d505945430e0--

--===============0601166698386759674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0601166698386759674==--
