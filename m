Return-Path: <SRS0=S+OT=BR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28BFC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Aug 2020 12:00:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16B7C2075D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Aug 2020 12:00:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BT6gnNAA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16B7C2075D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9799e10;
	Fri, 7 Aug 2020 11:35:01 +0000 (UTC)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8cbbdfe1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 7 Aug 2020 11:34:59 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id v22so1020246qtq.8
 for <wireguard@lists.zx2c4.com>; Fri, 07 Aug 2020 04:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+jcbHZsj4HfLyriGFEVJEKV6P7MBmqSmrwc+bUQr6QM=;
 b=BT6gnNAAo5uF2bMppX5fwoR+J73H2MIInaWCIMJ5jxV4OZIgSAZ+eLuZNPEJhd0AlT
 ih+Yxi1HDC1RmWefRbaqM6glvka+sX5BgWysACp06l74u8WFm9XPdmVfzw9YuT+EDji2
 IkfirSuxCoLdml1xhrGi6oXtzt0nbNkTW+QYqsRSlqeIk2eBSP0bASMPHxFNMCt6d2Mx
 BI5DPFVStzFnbLmS9KgfW12oRVUVm2fbYX2Ix//tsIaFrG4BZZt37gAXr7GBU961kyUu
 KYDSbNX0cEKehf5It3W5ZmFuZwhXdRSN3C+IrfLFGGeHjSS8Smlr2k/mcVetWAj8jd2e
 u0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+jcbHZsj4HfLyriGFEVJEKV6P7MBmqSmrwc+bUQr6QM=;
 b=I5duIgVCc1bQqzHLLFhOpadL4TV8eLpymTT+UXFozfaV1H1OD3PzTnsUiD5AaS7Dlu
 M25cHvD8lzuPuPtqa5EIu9J1zzeIa0FCuzDO+Udu7B/fFqOvvdjTyH/kaqU6RAl9aY65
 iGast/Pamq//+LCYeJAZQVGoBwo5QCZcCsz7YXA9lIztHEYCErwCsuny0AEG54oR6i2m
 KBMfgn15hpiaGWCo3SB/RbyrrlIlTnvfnlKgYAOf3QLzOrg2bRR/2kQ+JYeQaPtaw6U+
 /Z4F/3HBGD2pvCquPzFA1ksNu4lu1BVVjaY6ufTZVwy2NS0KATXKrb8c+W0xbjs+PDns
 F+Qw==
X-Gm-Message-State: AOAM531Bh9sEOUoj5wcJlNIhikyLAVBOpQun/vmKVa74P9QIZJz6J0eN
 wuS6INAMezFQqo2qgOp9oJCUK3CPDAOrhqkoZm8=
X-Google-Smtp-Source: ABdhPJxgSBmuPT5mV+I8dgt/3RbZpbcLdU6ughD/7D1oVdavcRwJsrYFBD9tvb9hdime9nIJeN3CEgKnmlRIF8qyJSA=
X-Received: by 2002:ac8:4e28:: with SMTP id d8mr13690478qtw.134.1596801582844; 
 Fri, 07 Aug 2020 04:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <aa041580-d6e8-6fa1-abc6-86de7f2ef53b@gmail.com>
 <CADn-QaO2gn8vX0qA9jeitSGiSK11qengh0U5_JjonTmSND84Tg@mail.gmail.com>
 <338b5098-1125-584b-e3c9-19a6c6015926@gmail.com>
In-Reply-To: <338b5098-1125-584b-e3c9-19a6c6015926@gmail.com>
From: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
Date: Fri, 7 Aug 2020 13:59:31 +0200
Message-ID: <CADn-QaNC7shh1_QSVmPUU6NGGB1wEOp==RhojwTcqZd2phDSyg@mail.gmail.com>
Subject: Re: Android App not setting DNS when allowed IPS not 0.0.0.0/0
To: Mauro Santos <registo.mailling@gmail.com>
Cc: wireguard@lists.zx2c4.com
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

Hello,

Am Fr., 7. Aug. 2020 um 12:51 Uhr schrieb Mauro Santos
<registo.mailling@gmail.com>:

> I'm not on macOS, this is a problem with the android app, just like the
> subject says ;)

Ah, yeah, now I notice the subject as well... Too bad then (for me).

FWIW, my client config (in the exported ZIP file) looks different to
what you've got.

[Interface]
Address =3D 172.31.0.5/24
DNS =3D 176.9.37.132
PrivateKey =3D =E2=80=A6=3D

[Peer]
AllowedIPs =3D 10.136.16.0/22, 172.31.0.0/24, 169.254.169.253/32
Endpoint =3D wg.=E2=80=A6.ch:51820
PublicKey =3D =E2=80=A6=3D

I've got no "name" attribute and I'm using "=3D" signs. But I guess you did=
n't
use an export in your OP but copied the stuff by hand?

Regards,
Alexander
