Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D708C65BD4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 01:13:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B8A0206B2
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 01:13:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJjltted"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B8A0206B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 488ed26b;
	Sun, 7 Oct 2018 01:12:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ceb47cf9
 for <wireguard@lists.zx2c4.com>; Sat, 6 Oct 2018 12:08:30 +0000 (UTC)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 154df6aa
 for <wireguard@lists.zx2c4.com>; Sat, 6 Oct 2018 12:08:30 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id q19-v6so13854824edr.1
 for <wireguard@lists.zx2c4.com>; Sat, 06 Oct 2018 05:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=rS7EThEPrKwv5/UfpXt1YZTpj3Z9tHCZckaZh+BQKRI=;
 b=bJjlttedZuZmJBG/xauSXWWnCXEk4cBFRi0gohItrMcI1dzKtaRYl7iV5TUpnNpL9Z
 fHuRZiSVd+v5NcEnAuiYccTQGOBfMYlo3HWueI70WYvLLpFGtwVdJ1SQB2rpC0T2ENc2
 TmDQDTz882mABL/nRxWuQKdGrbH5YjGWDb9hF282V9ZVq8HB9Sh0w56qzsTBhFJ7tqCQ
 goLRl/sEw5Vaodoit5U2vfrAwPD9GjdsLIcPSPIP/dSsl41RtC9ectq8EKeQNw/bAf0q
 NZBc6CKPQClgrT0tiQCsY+/TMbZCghJ4DKjrXZfqqXwErdQV2Of2zQ2MYUB50rRBwLvV
 3YiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rS7EThEPrKwv5/UfpXt1YZTpj3Z9tHCZckaZh+BQKRI=;
 b=Y6SBCm0/ZgOcHrJhaW3C9d5tLptsEKD5mYSUMwAEX64cXkIHOuthEYKFmDJlnEh6d2
 JI5QMT9RsU/K3moGKrNq9H28jFBEgo6F76HrII5j47uB0dgRQOuO1rkO6VrVDXRIQl9w
 cTimTkiVQSneLG589kAOdIZGcSyKAP084+aV1APOI1vStgg5HnNro1+4c6vTXGSZBZTe
 BQvvzu7dyL8V3EKlNsjAAVcKq4m7vCnNPiVapkeIeazSGceKAhP6lq1mmg7Ve5zZIYJP
 6LNNpTbrh1RlgApvbMOkHWDIDfGTrwUqGBom3PTL4NCC+19U5+CmM4CobSBRR4bsUm4b
 quHw==
X-Gm-Message-State: ABuFfoj2ldKbtJwtPzuv5zM5nFGIzNEr58VeaW0+ImjXqsoVBMjXHle2
 EO92onY8h+uG7zuPlJ7WJDtdeo4ue3IxG9vUuMFH23d/
X-Google-Smtp-Source: ACcGV634Zy/BWkKxq8tVBtoF20wmXXKlG533y6mQgjobDiX3xNndeCZKZEahNX/WMjBX5coMUhjUvBkx45dbhpsis/Y=
X-Received: by 2002:a17:906:6d4b:: with SMTP id
 a11-v6mr9892353ejt.226.1538827741333; 
 Sat, 06 Oct 2018 05:09:01 -0700 (PDT)
MIME-Version: 1.0
From: Nico <nicorg2529@gmail.com>
Date: Sat, 6 Oct 2018 20:08:50 +0800
Message-ID: <CACepnScV-2ypr+DahEnZTrsNNWpZ34xPkjsEiei=ymBSeTmduQ@mail.gmail.com>
Subject: Fail to compile - redefinition of may_use_simd
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sun, 07 Oct 2018 03:12:52 +0200
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
Content-Type: multipart/mixed; boundary="===============7394534972424860830=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7394534972424860830==
Content-Type: multipart/alternative; boundary="000000000000e491dc05778e408e"

--000000000000e491dc05778e408e
Content-Type: text/plain; charset="UTF-8"

Hi,

may_use_simd is defined in include/asm-generic/simd.h
<https://github.com/hritikutekar/kernel_motorola_msm8916/commit/adcea6f1a489cb7048f799c3b2bca86d97448324#diff-155202bdde56ceb826602667efbd2dbd>
From commit
https://github.com/hritikutekar/kernel_motorola_msm8916/commit/adcea6f1a489cb7048f799c3b2bca86d97448324

Please avoid this.

Thanks,
nico

--000000000000e491dc05778e408e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>m=
ay_use_simd is defined in=C2=A0<a href=3D"https://github.com/hritikutekar/k=
ernel_motorola_msm8916/commit/adcea6f1a489cb7048f799c3b2bca86d97448324#diff=
-155202bdde56ceb826602667efbd2dbd" class=3D"gmail-link-gray-dark" title=3D"=
include/asm-generic/simd.h" style=3D"box-sizing:border-box;background-color=
:rgb(250,251,252);outline-width:0px;font-family:SFMono-Regular,Consolas,&qu=
ot;Liberation Mono&quot;,Menlo,Courier,monospace;font-size:12px;color:rgb(3=
,102,214)">include/asm-generic/simd.h</a><br></div><div>From commit</div><d=
iv><a href=3D"https://github.com/hritikutekar/kernel_motorola_msm8916/commi=
t/adcea6f1a489cb7048f799c3b2bca86d97448324">https://github.com/hritikutekar=
/kernel_motorola_msm8916/commit/adcea6f1a489cb7048f799c3b2bca86d97448324</a=
><br></div><div><br></div><div>Please avoid this.</div><div><br></div><div>=
Thanks,</div><div>nico</div></div></div></div>

--000000000000e491dc05778e408e--

--===============7394534972424860830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7394534972424860830==--
