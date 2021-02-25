Return-Path: <SRS0=9XF/=H3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A6AC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 09:50:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55B8C64EC8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 09:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55B8C64EC8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wandera.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2182248;
	Thu, 25 Feb 2021 09:50:18 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d2bb565b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 09:50:16 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b3so4575462wrj.5
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 01:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wandera.com; s=google;
 h=from:mime-version:subject:message-id:date:to
 :content-transfer-encoding;
 bh=FkCLxWPrpsn/T+C7FbW4BqtYDqg+1rfprgjZLJv2ypk=;
 b=VR4dikdsezCINZayJ7mPt4mJybs3vgvwdR/ILopDyAm3bekb0cmv0CpsU+WcGZa8Z6
 DHwHT7SrCS7yiAMlPyDbiAbq5EdHta/bl9UtKy8Lo6M9wwYA9qlZpEena2iLFhpp4wT7
 CN/QMrBGNWPe8wCp9q6ZvOQQeom/wzeLtEq6hTfj23VZAVnQCo2y7fbnQCK4Q1+DdaEn
 Q8+JkuGdCHW0EUyiGKGvqcLsrI97dRHsSiZKxd6r0nTh++gMZpnBEyuZV0Tvg5YLk3OV
 H1wVVzLQ4vHKf2/gwx+uCA8QUWLsE1odfIXoRZ+FLkbsszVMUMRX0Gzhod9tqo78OXfU
 Qayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:to
 :content-transfer-encoding;
 bh=FkCLxWPrpsn/T+C7FbW4BqtYDqg+1rfprgjZLJv2ypk=;
 b=AuG8+YVoyeULHF3mssj4NvPjs2U8foCeZVLhV3wwKaCWmeT3VzXw6pgorwXeUpQeVJ
 mgI4+PqDs4xJnpYl7SUbYyPoFx21dgYwEwZEsNLdbtzv8+vPYfIoXMKjfEizbCt8KdSo
 +50aJYXiUtASVgMqNBQreGwseR7qmGF7+q8mvXeLcYtQkWsPTxu8wfFx9PjWFsfxt07h
 arbD9AzJdxFDG2/aICwYRKQHmxjwLjqZV7mbi5CPDGBTznZlSoAF7SOeFoDfFZct6DJM
 ODAG0u+pYShUZurlekVB7wXh46gdCMmiOsMFb4JDx6DyTmXMpbvsP3rfXx19ldQiwrYO
 4C+A==
X-Gm-Message-State: AOAM5314BgFHMJUkDr8Q6VVn8/uRWwqawAu99ZpGsQjHpUzDx5vRhpjq
 +tzJie6Sv/P2bva/oYYSA9aoPrsWS+Dehv9Gd8nOiwPCxnqsjkKRP4ZKDwFle9la3DggUHZ1WCr
 ka7vayuvxi2s0cwLpIZolmcwWkb54AePQbeqwYkAfpKAnaD+8yKUGueqwYCiD+9E8g3qUhkUnrx
 bmXMLARA==
X-Google-Smtp-Source: ABdhPJwoKMexKJFzkZh0Gvyl9Cn3M4GqZW/2QTub+tsAy5EThp+lCbmxjhI6RIIQhicnV+JOTFOSnQ==
X-Received: by 2002:adf:a703:: with SMTP id c3mr2476600wrd.379.1614246616163; 
 Thu, 25 Feb 2021 01:50:16 -0800 (PST)
Received: from ?IPv6:fddd:dddd:1000:0:9a12:47ec:bb66:3813?
 (ec2-18-130-213-235.eu-west-2.compute.amazonaws.com. [18.130.213.235])
 by smtp.gmail.com with ESMTPSA id o15sm6513697wmh.39.2021.02.25.01.50.15
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Feb 2021 01:50:15 -0800 (PST)
From: Laura Zelenku <laura.zelenku@wandera.com>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Patch: initialise device.peers.empty
Message-Id: <F332C4E6-0559-4BE0-8AF6-3AD942C01FAC@wandera.com>
Date: Thu, 25 Feb 2021 10:50:14 +0100
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi devs,
in some custom unit test for wireguard go I=E2=80=99m experiencing failed t=
ests because =E2=80=9Cdevice.peers.empty=E2=80=9D contains default =E2=80=
=9Cfalse=E2=80=9D value right after device creation. Please apply following=
 patch to initialise the value to true (empty =3D true) in device creation.

thanks
Laura

Index: device/device.go
IDEA additional info:
Subsystem: com.intellij.openapi.diff.impl.patch.CharsetEP
<+>UTF-8
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- device/device.go	(revision 7a0fb5bbb1720fdd9404a4cf41920e24a46e0dad)
+++ device/device.go	(date 1614241756159)
@@ -292,6 +292,7 @@
 	}
 	device.tun.mtu =3D int32(mtu)
 	device.peers.keyMap =3D make(map[NoisePublicKey]*Peer)
+	device.peers.empty.Set(true)
 	device.rate.limiter.Init()
 	device.indexTable.Init()
 	device.PopulatePools()



--=20
*IMPORTANT NOTICE*: This email, its attachments and any rights attaching=20
hereto are confidential and intended exclusively for the person to whom the=
=20
email is addressed. If you are not the intended recipient, do not read,=20
copy, disclose or use the contents in any way. Wandera accepts no liability=
=20
for any loss, damage or consequence resulting directly or indirectly from=
=20
the use of this email and attachments.
