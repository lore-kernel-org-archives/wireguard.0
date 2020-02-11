Return-Path: <SRS0=KrVi=4C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFDBC2BA83
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 10:56:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1785C20675
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 10:56:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7eb3JCh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1785C20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87adf0c2;
	Fri, 14 Feb 2020 10:53:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e643c75
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Feb 2020 02:45:48 +0000 (UTC)
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [IPv6:2607:f8b0:4864:20::e36])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 078b2513
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Feb 2020 02:45:48 +0000 (UTC)
Received: by mail-vs1-xe36.google.com with SMTP id g23so5371240vsr.7
 for <wireguard@lists.zx2c4.com>; Mon, 10 Feb 2020 18:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+N0/tuwAlDIULHsTIc9Kq83kN2bvDjaJy3Pb0YJx8bk=;
 b=Y7eb3JChjX3ossTmQy0Hbz+hoGLhyRfRB9bIwBemEJx4BGULxzK/Ee/08k/KeVtri1
 WPLurod9kZnuM/iNjbjQUpHP7OFNP5RMAdCt75KijP/XyPYCEXNj12ItVOEcxE/SxvRB
 BG818+XeKeO3Mk2UWi4IYGABS+weHMFe9Ttqef51muxCqvp2PWa6/InIXKiXRbCb0EO9
 yuxEYelKQE4Z9FDTtKZB+8cLCx7Olh/6FrrixgBY+KT79Is6eEV4pXXmgDtKWP3R+Sqj
 n+CoZI4fQetnJx3lpQFWTaHL+R1cbqnPHtVxx6sfEV4d2gzkr9DUNnyzV00iAWivXqdx
 Sm7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+N0/tuwAlDIULHsTIc9Kq83kN2bvDjaJy3Pb0YJx8bk=;
 b=VDBgyJsQugl3V/0/W7OInBGx1c4BHOk0K3mFbZg7Y3DfyoKuXk/XOdFApJuZCMD3Z3
 4mryTpTKODgKFJassaV+AeFjic9n2cWjL/ktlYSlWvVeI3OPU6lCmFmakeoKvI5Q3cNo
 SjUQlKhm8J5q19hRGlk+f7Col5zkw3dxWn/NAAhQUBZLvH1RrI2PF/d8armm3806Y4Lp
 AYcSQj5gWdhxlngULLrqYZ4rSk0IQbwuHjesWGZAfHpa7ojKqtd3lb5EXIWDiZAs/rGC
 X306InFTZZUspnuo4+hticheUN9J7TlbCAEQdAf441YlBgZspVPD+7PqG9TJQGfeJgx4
 Mf7w==
X-Gm-Message-State: APjAAAWmnpbEwVGlybE5Y3kwZANOMWU/fHKSIvIa3RiE4FU2TjL75W4R
 xur4qp0RAHEmenkyPJ0/HI5nzFLuqt/R4403t84yZlOsRzU=
X-Google-Smtp-Source: APXvYqzdYo4LDQFNZHwmVSV9vlIYsNZpc0eIkNAFqNKSf8i1NGJr81uI7Pkhl5Trd/nKI0cjz1zIGG0lUc/+PfaUeKM=
X-Received: by 2002:a67:7987:: with SMTP id u129mr8148070vsc.83.1581389247760; 
 Mon, 10 Feb 2020 18:47:27 -0800 (PST)
MIME-Version: 1.0
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Tue, 11 Feb 2020 11:47:16 +0900
Message-ID: <CAA2ss9EoMTdDHez2rFte5XJk_qOhFgeNkJJ6xdyRz7qDTAZBJw@mail.gmail.com>
Subject: Japanese Translation for Android app
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 14 Feb 2020 11:53:29 +0100
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
Content-Type: multipart/mixed; boundary="===============2518059973083353694=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2518059973083353694==
Content-Type: multipart/alternative; boundary="0000000000005d5129059e43e0d8"

--0000000000005d5129059e43e0d8
Content-Type: text/plain; charset="UTF-8"

Hello,

I recently started to use WireGuard, this is great product.
I have Galaxy S9, iPad Pro, MacbookAir, and all of they can use WireGuard
Tunnel.
It is useful for me.

I want to contribute this product, but I can't write code, I don't have
build environment, so what can I do?
I can translate to Japanese, so start translate wireguard-android and
wireguard-apple.

Today, I made translation patch for Android App. How do I send patch?
"git format-patch" and "git send-email" directly to this ML?

Thanks,

--0000000000005d5129059e43e0d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I recently started to use WireGu=
ard, this is great product.</div><div>I have Galaxy S9, iPad Pro, MacbookAi=
r, and all of they can use WireGuard Tunnel.</div><div>It is useful for me.=
</div><div><br></div><div>I want to contribute this product, but I can&#39;=
t write code, I don&#39;t have build environment, so what can I do?</div><d=
iv>I can translate to Japanese, so start translate wireguard-android and wi=
reguard-apple.</div><div><br></div><div>Today, I made translation patch for=
 Android App. How do I send patch?</div><div>&quot;git format-patch&quot; a=
nd &quot;git send-email&quot; directly to this ML?</div><div><br></div><div=
>Thanks,</div></div>

--0000000000005d5129059e43e0d8--

--===============2518059973083353694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2518059973083353694==--
