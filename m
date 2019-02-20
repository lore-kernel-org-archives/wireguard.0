Return-Path: <SRS0=+Bco=Q3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42346C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Feb 2019 19:46:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 954C02086A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Feb 2019 19:46:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpL0D70X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 954C02086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6c7c257;
	Wed, 20 Feb 2019 19:37:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9790282a
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Feb 2019 19:37:05 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f298baf2
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Feb 2019 19:37:05 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id z84so7618217wmg.4
 for <wireguard@lists.zx2c4.com>; Wed, 20 Feb 2019 11:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5Aqec6xzfj/h2Axo5eFRFPu1p8jp7HeNptkNlxpmApA=;
 b=bpL0D70XEyawz7ACu/7LOZ/sVYhfD1tECjLUFUEnIVxcAYw6TeMjxkafg5hG++ItGS
 r4rZa5/tzPs+u7CafY42AvZBQJpp7IogCYYHX3Gm4GbStODoi+mbk6yDvmuw72oFCXuD
 2RqNHOWoafBRfmP6MFVSFBCZCIVuBeu0encmW5emkm0+AJgUKEzicn68bViArH34nqYx
 HhnqXfV57szKPLRsY/Fim/nb07cOHAQOvPuLDX2YL8sAFZON9z5v+Fyy1ag0cnu2rw6o
 OeGyyPRy//JIsGQHGntn/lh9dmnhpvIj5oO/YssPF+jZJXEssE7VI0J9VS57YxQImTIx
 mqZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5Aqec6xzfj/h2Axo5eFRFPu1p8jp7HeNptkNlxpmApA=;
 b=I4QLuSv8qurpmP9UICFsjol8qDRACXvDwXIRvBxdU6cTOmRedr97pUzw5/klduxeLZ
 YJTNvOZ8YI0ThsbS09c0bnyY6oWv2j2dbU+iiP4u9Z4WzKamvB5VS56+c7N8MTlQT9C4
 N9uToSHJ+9CiexdORTCSO9BUPEDy9HHkF77r+Qi4hyuKRyo03d093/1M5nn9G58u2swb
 cki8yOgoN467HW05c/Bsbr9y0glo7p9Wu8N6TIiBCbpa1YD0ZQp6RdyE1lBRrn/7Eazm
 CcYWGbmGVPubTs8+V5hmc1DPU9HbLPBQT5R+w75dNsqfUWit+3dIUwlOnGrbst96Rlnm
 dJpA==
X-Gm-Message-State: AHQUAubbzRaWRKDAgDSvh/1XXIDbVaEJYvgpLuv7TVccHDX3cYmPPAkY
 RbwSyJtxTfMVm9HIDRlNe7CDHst9/ySdUPtljbYb60Pf
X-Google-Smtp-Source: AHgI3Iak8BjAQBejKJ/mMc353bL/W/OnOj0wCihJtjrLRwgmm65GbjrDwg5cpk6QPhUsAD4NeMmSglV1ztC9TqQOoMg=
X-Received: by 2002:a1c:a789:: with SMTP id q131mr7751102wme.82.1550691945251; 
 Wed, 20 Feb 2019 11:45:45 -0800 (PST)
MIME-Version: 1.0
From: Love4Taylor <love4taylor.me@gmail.com>
Date: Thu, 21 Feb 2019 03:45:33 +0800
Message-ID: <CAD6UttB_fM=2uvLnVUsmV+15fHy+utsB92ZdRJohr_Q_rfDqHQ@mail.gmail.com>
Subject: Android Pie's DNS-over-TLS does not work when WireGuard is enabled.
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
Content-Type: multipart/mixed; boundary="===============3474611044967646939=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3474611044967646939==
Content-Type: multipart/alternative; boundary="0000000000008d897b0582589a02"

--0000000000008d897b0582589a02
Content-Type: text/plain; charset="UTF-8"

Hi,

When WireGuard is enabled with the kernel backend, the DNS request will
only use the DNS set in WireGuard instead of DoT.Is it possible to support
DoT at the same time?
Even though WireGuard is very secure, I may still not want the WireGuard
provider to know the domain name I am accessing due to privacy reasons, and
to prevent possible DNS hijacking.

--0000000000008d897b0582589a02
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br><div dir=3D"auto">When WireGuard=
 is enabled with the kernel backend, the DNS request will only use the DNS =
set in WireGuard instead of DoT.Is it possible to support DoT at the same t=
ime?</div><div dir=3D"auto">Even though WireGuard is very secure, I may sti=
ll not want the WireGuard provider to know the domain name I am accessing d=
ue to privacy reasons, and to prevent possible DNS hijacking.<br></div></di=
v></div>

--0000000000008d897b0582589a02--

--===============3474611044967646939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3474611044967646939==--
