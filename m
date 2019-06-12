Return-Path: <SRS0=O0ly=UR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBDFC31E5B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:16:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E921213F2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:16:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJ4ioV+B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E921213F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40c64968;
	Tue, 18 Jun 2019 15:14:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8801344
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jun 2019 12:12:44 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 601af20b
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jun 2019 12:12:44 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id b17so16626203wrq.11
 for <wireguard@lists.zx2c4.com>; Wed, 12 Jun 2019 05:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=FGfPLx87nIDW/84r997LFOiohYoOaF37qDVwG8H3VTg=;
 b=hJ4ioV+BYdpNMqQEgehAK9++hOtYR8TmxhAuzFUXOk3RZPo0on4QwRsJMVVRZY+U/2
 3Bie1ulLIn4xYNjuFS6vwYVP3aw1cKu2xpnoNVZ/UOfY2t+6l1tALtVEfihh2S2l2rNI
 qWJ2Suh3ZD998V3MnvSVX+auu2swpRQsm2+QJ/QREce7rrsuCHjK+MRQ59VYtK31VsZT
 3fDRLNHRsTfQ3Y02Tf5V5HO92JNZtUTdMumtghuU60N4mnyHPrmigJrTieZvEqaFWRtD
 zbfcT7/WJSuztsA3JcGUM6ozTDHYiE+gPEGiTRSgE3PIs/AfJ27cjn7afVWA2CbJ5NEu
 x3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=FGfPLx87nIDW/84r997LFOiohYoOaF37qDVwG8H3VTg=;
 b=FhGqmNtT7EJNnC72sKuKln1q9e/o30EZEXf/2bPxpzMfxDBy4W55ivS9hN/yDkvu8H
 O6cxg/oTpQMR6omvGUUx0++Qo3At7xBn3LbvwLpva0sQ+hHqScps28T/Zs1oUnod/Tuc
 q+AbVf7pWaDWoS2t1Y9jcVe4k+Yr40SUFfTRtUPqMReVB1RUAFZ0WGkH8dU9Rtg8r6gV
 f4t6bCCh1Vpyf6QAWq5hbUml5BvdMD3ytTJjLw0CM2WZ/Qkynh6MQLsSefcDAlcsdPhz
 PaPy6xwGONrPekgJP24d4mAFwDH4mjHU6fYtcCIidty4c6xF0hqFdMwS2nunO6aC4hBt
 w/yw==
X-Gm-Message-State: APjAAAVrQDQpyUXwMT8BLpRsaRaklGSy5pynrlGbrw6w6QaqY4Wk9OuL
 NNM6h6YrzIVoPF98TPopjzGDVKJdpDO7kSqGLhgI2SbF
X-Google-Smtp-Source: APXvYqzAW02jp7QavsY8hhRBHLtRccZtFL+8B7Z4NxUQheqaki0tpcrZf+gdNJ+2q09UEfUu5LO4kqxSGS8cRXId0bI=
X-Received: by 2002:adf:fbc2:: with SMTP id d2mr7815154wrs.334.1560341557699; 
 Wed, 12 Jun 2019 05:12:37 -0700 (PDT)
MIME-Version: 1.0
From: Jack Craig <jack.craig.aptos@gmail.com>
Date: Wed, 12 Jun 2019 05:12:26 -0700
Message-ID: <CAL0FmdX1SJSZmQYNiLD1xtg8QMjqJp2_RSQo6SjRr1JS+Nd0Cw@mail.gmail.com>
Subject: fedora 28 & wireguard packaging
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Tue, 18 Jun 2019 17:14:17 +0200
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
Content-Type: multipart/mixed; boundary="===============7500461129052761574=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7500461129052761574==
Content-Type: multipart/alternative; boundary="000000000000466a0a058b1f5421"

--000000000000466a0a058b1f5421
Content-Type: text/plain; charset="UTF-8"

hi wireguard folks,

after a recent install of wireguard, i get the below warning.

*Repository jdoss-wireguard is listed more than once in the configuration*

assuming it's not desired operation, is there someone i might speak to
about it?

tia, jackc...

--000000000000466a0a058b1f5421
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hi wireguard folks,</div><div><br></div><div>after a =
recent install of wireguard, i get the below warning.</div><div><b><br></b>=
</div><div><span style=3D"color:rgb(0,0,255)"><b>Repository jdoss-wireguard=
 is listed more than once in the configuration</b></span></div><div><b><br>=
</b></div><div>assuming it&#39;s not desired operation, is there someone i =
might speak to about it?</div><div><br></div><div>tia, jackc...<b></b><br><=
/div></div>

--000000000000466a0a058b1f5421--

--===============7500461129052761574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7500461129052761574==--
