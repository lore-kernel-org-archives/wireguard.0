Return-Path: <SRS0=gQ6O=UF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7508EC04AB5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:38:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1279C20693
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:38:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkgYwzDE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1279C20693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c8d888b;
	Thu, 6 Jun 2019 09:37:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc4ea3d9
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Apr 2019 07:32:48 +0000 (UTC)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 576cb981
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Apr 2019 07:32:48 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id v84so19226254oif.4
 for <wireguard@lists.zx2c4.com>; Wed, 17 Apr 2019 00:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=vtXqMd/MDinvtZmmHcihdVWOcz4+IgMG45JEPm4Sen0=;
 b=WkgYwzDEjd3OrGcXB0jCEGvZoTh8T9+XeNz5BPfPGxu+brrkShcfWHtkIvuwafz+pa
 9WnHaaAhIQ8c6vwHEoLO/RlOa/TGxHMbiXKeTRB4vgfKx/qOsoLUyUOVpIgyjulGnggw
 G3/KsGBQppPg83TFzHcCNg7UgsVH3xzcKIJQSczHS7iDQk3s+G8L6NyTeNMF8OwsIdYE
 av8Qo6M/IR3hAAJVRg44U61axz5KAqTVbPaCsfRCBPdEJG7QsbLwJiemSYz/C2UVtVvv
 zfNUhv3KSzPUugVAYL95mwC5Iz04N/7jdwi/g4Xq7MNNVxMmYMfEaSTXjIZwDrLU1ISk
 I3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vtXqMd/MDinvtZmmHcihdVWOcz4+IgMG45JEPm4Sen0=;
 b=M6wxMTHhNySkrYZwIv6vKTrhG7IiaeI47J/dg3G+mYmCQcujKAUh8oPmmhKILfH0P3
 NVl30XeI3jP2MLDgcSY4RQu6cZLMHla9+akrSbdBHpja8lS2kNVHNHqjY3YvTejQFEvb
 KI+icgiUljMp5Ryxy1G6OBg1Y2KedtGX7LwdC5tFxpcdnaNkyuC+t3KLPdWhpccE+OPv
 5dGlz1Jjy0BNj74jFRFcFzdr9KlfhhFarBKpNvc5EQXvcMJe5MliXgGBY5iLnKJ8yt6s
 yY/nePM2LghcaQ2HaHOieqrMDGXVMM/fOz2TYIkU2Mps6W5nOpu023Jo192KbSlxyHdW
 wylQ==
X-Gm-Message-State: APjAAAXoW4mcMSFvTl65HnOVMApLO3vtCPtlLnyz3wkRSYErHec+gtGc
 QckTB1ClVoT3v3L1buHnFo9/5V4f2/FyoAEYUm1K3g==
X-Google-Smtp-Source: APXvYqwE+XRAXRVWcObG4XsM0Pm7kaNuAQoHGpUa/pyWxxEE8Wt4614GuUmQ5dkC/1H7BKvp2/rUtouvJEx2vI1ulcY=
X-Received: by 2002:aca:60c2:: with SMTP id u185mr27201191oib.99.1555486366853; 
 Wed, 17 Apr 2019 00:32:46 -0700 (PDT)
MIME-Version: 1.0
From: bhashkar prakash Singh <singh.bhashkar@gmail.com>
Date: Wed, 17 Apr 2019 13:02:36 +0530
Message-ID: <CACX7Ny6=bmREXiq6x25s-MA=eAiV4P554=7gNn6CTPR76OAirg@mail.gmail.com>
Subject: Wiregaurd integration to private project
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Thu, 06 Jun 2019 11:37:05 +0200
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
Content-Type: multipart/mixed; boundary="===============3329930450956974823=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3329930450956974823==
Content-Type: multipart/alternative; boundary="0000000000005971060586b4e4e0"

--0000000000005971060586b4e4e0
Content-Type: text/plain; charset="UTF-8"

Hi,

I want to integrate Wireguard to my confidential project. I see Wireguard
source code is under GPLv2, if I add any patch to Wiregaurd source code to
work with my confidentail project, do I need to publish complete source
code along with my project source code ?

Any other pointer how I can start work to integrate Wireguard in my project
will be highly appreciated.

Thanks & Regards,
Bhashkar

--0000000000005971060586b4e4e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I want to integrate Wireguard to my=
 confidential project. I see Wireguard source code is under GPLv2, if I add=
 any patch to Wiregaurd source code to work with my confidentail project, d=
o I need to publish complete source code along with my project source code =
?</div><div><br></div><div>Any other pointer how I can start work to integr=
ate Wireguard in my project will be highly appreciated.</div><div><br></div=
><div>Thanks &amp; Regards,</div><div>Bhashkar</div></div>

--0000000000005971060586b4e4e0--

--===============3329930450956974823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3329930450956974823==--
