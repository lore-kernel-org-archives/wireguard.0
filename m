Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537B1C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:51:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF10C20760
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 07:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8uOmEyZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF10C20760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45231404;
	Wed, 17 Jun 2020 07:26:48 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bc3ef252
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 Jun 2020 13:36:34 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id x6so14389886wrm.13
 for <wireguard@lists.zx2c4.com>; Sun, 14 Jun 2020 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:autocrypt:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=YNbp5gGw9hy2wyGyH6motLrTPev8+G7Uq7ghkRrCAxY=;
 b=m8uOmEyZ3NaRhZUM8rfsgaMRXED6mEG1Kp9pdZGA3o2L81Jw3gy1lHP5Ks2PYWV65d
 FWYAqSgqAiqBlSMzr0CqDJ0al1+nWxYq+YnO96H3UeYAvOfUlw4KGghznIZOVJZ0F/Mp
 +vDwfkwGr78GumeUyjFqpiRKnQ7+EdBMvf65y7CURA3oNIKZOysvIWzYTloFYgWG038U
 LGzoFrluP3YXAImmqbNp+vrgDm+VPOonQY78Jauri2LC9XZ5kYJf4AfYd5te1qzA/7OA
 6UmLeuVlHwax/VxN1h6o+kOpO1+6FHpgPPLmv0MkRsfIj8mKSMqrV6URb2X5ZxGaoomS
 Khww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:autocrypt:message-id:date
 :user-agent:mime-version:content-transfer-encoding:content-language;
 bh=YNbp5gGw9hy2wyGyH6motLrTPev8+G7Uq7ghkRrCAxY=;
 b=VLdClA8XnjX88HexHfLz4i04jsDWC1435uSzTqYGiwXY8+oOxPZ7iG92crrOB6pbXP
 V5XtHuERwP28NPuUe2l1HNJZwUJgmIq1vja9ceud9SJiYhuOfpLuvYkm+ACjq8nQO4KS
 kepxUp6xcgyMRH8cPfxOEVZyLOIEVsHDttmtTEe094PbJK4H2V1z6RInxNvuNAU9GTZn
 +vuiVCKKvyy4Z1OpF5450La8/K3kRHGrGJNMLcOJCpcWS/YJeCtzpxzDGJMra97G7AOP
 L2ZTKTZ+v1TShSmRcxlS39D4z6ay1/+uPDxd9vs8it8qUmNAFqtZbcDvrufBuRa7emfq
 RxjA==
X-Gm-Message-State: AOAM5307HQRJCLATv4JxKTTh4tLrpXIKv7qtVO49+ilMwwPj7xZeEi7a
 mqqstS9PECJBf4+B8QAkl4sJ1Kug
X-Google-Smtp-Source: ABdhPJwq40DOos3XpABL0qEMMqZ8v3zr6LNYHIA4ZadOKTfzqXVzX+/x+FMQfmX3EQ/oVRsx3Yh29g==
X-Received: by 2002:adf:f707:: with SMTP id r7mr25763527wrp.390.1592142855523; 
 Sun, 14 Jun 2020 06:54:15 -0700 (PDT)
Received: from [192.168.1.10] ([5.51.220.116])
 by smtp.googlemail.com with ESMTPSA id c16sm18122556wml.45.2020.06.14.06.54.14
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Jun 2020 06:54:14 -0700 (PDT)
To: wireguard@lists.zx2c4.com
From: Gregory ORIOL <fortin81@gmail.com>
Subject: Problems with Ubuntu 16.04 kernels and wireguard 1.0.20200611
Autocrypt: addr=fortin81@gmail.com; keydata=
 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
Message-ID: <56455548-76ff-1f8e-9aff-e0bd45d8daa3@gmail.com>
Date: Sun, 14 Jun 2020 15:54:12 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:52.0)
 Gecko/20100101 PostboxApp/7.0.18
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Mailman-Approved-At: Wed, 17 Jun 2020 09:26:34 +0200
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

Hi,

Since commit e24c9a9265af40781fa27b5de11dd5b78925c5be to
wireguard-linux-compat with a fix for some Ubuntu versions, we are
experiencing a problem with some older, but still LTS, versions of
Ubuntu 16.04: older kernels 4.4.0-148, 4.4.0-166 fail to build with
wireguard 1.0.20200611

So, any system running an (or still having an installed) "older" kernel
and doing an apt upgrade to install wireguard 1.0.20200611 would fail
during the wireguard dkms step, while trying to build wireguard for all
the kernels available.

The problem gets more problematic when a newer kernel 4.4.0-184 gets
installed with the same apt upgrade: then, trying to downgrade wireguard
also fails; none of the 1.0.20200611 or 1.0.20200520 versions work
anymore with this combination of old/new kernels...

To recap :
# wireguard 1.0.20200520
=C2=A0- ok with kernels 4.4.0-148, 4.4.0-166
=C2=A0- fails with kernel 4.4.0-184
# wireguard 1.0.20200611
=C2=A0- fails with kernels 4.4.0-148, 4.4.0-166
=C2=A0- ok with kernel 4.4.0-184

(nb: we see it now with -184 but it could have started with an earlier
version)

We could partially fix this by manually getting each deb/src and doing
dkms install:
dkms install wireguard/1.0.20200520 -k 4.4.0-148-generic
dkms install wireguard/1.0.20200611 -k 4.4.0-184-generic
=2E..
But apt upgrade is still broken.

While we could boot onto the newer kernel and remove the older ones to
get rid of the problem, this situation would prevent from having a
"previous working" kernel on the system, which is not very safe.

Could there be a fix for this made to wireguard-linux-compat for those
versions?

Best regards,
Greg


