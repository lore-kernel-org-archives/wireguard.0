Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3882DC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 21:59:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C69622082C
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 21:59:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="QK3sOzaY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C69622082C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cddcc3b7;
	Fri, 6 Sep 2019 21:59:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55a0aa71
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 21:59:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a21276e8
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 21:59:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d293afc
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 21:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=C2j1OVmhrbheOFGL9VfWSYnenhY=; b=QK3sOz
 aYGbASZR9mx2pRNCV5gqkdJ8USbAQ0MaC9k3/980GpeThAKv2vTF6pynYZFXaWiS
 wYEobzP3QTQRz2nUqUISTWdcwxzjDiqF2IM9XJmnCUIjtXWIM6PZJsmeKI/pVkQt
 7gfge5l518UYAXoOra0zWP7hQCA6l67eAnKh9tC0SuyZp7aQYyoq8wBctMcbkvvb
 z7Rev1VF6Whf1N8G9AGWSqNyasj+Mvegd3SxEO+OJF9EE1rvYM71GWRtHDCmsCbX
 Roxir3u23XIid0kpjqR6PoqzepvLcq9BL5nwYnzyD5J9mnZKT2RKiGn7lBRMx7z2
 8FZKDoL/QR/sb7bQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6a933242
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 21:15:46 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id k20so6273962oih.3
 for <wireguard@lists.zx2c4.com>; Fri, 06 Sep 2019 14:59:08 -0700 (PDT)
X-Gm-Message-State: APjAAAWhsDjaZqPMejpmm1WOixT5g1TV6rrAvUsusDj/QNc6m12re+7Q
 A/y4OKa8BTY5L7vcBxwYCEm74DK0I14lEo4rZb0=
X-Google-Smtp-Source: APXvYqzhuUepv8CtSWC0XXGXddYVw/n6FIc6ZZ59H9LKtKI6RIBRX9mpfkGBgjfRMG0GycXyRpQ/ArDaGcNIZpaow7s=
X-Received: by 2002:aca:6083:: with SMTP id u125mr8337746oib.119.1567807147883; 
 Fri, 06 Sep 2019 14:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAApLimgrYEmnRXNuOdnkPW=uihe325z5xzBAGGHZx-YB0L9CCQ@mail.gmail.com>
 <CAPk0gXqPUHS0ufEj7CEDHaf+_KDbzKW8Et8yHO3mtjR9SEUNwQ@mail.gmail.com>
In-Reply-To: <CAPk0gXqPUHS0ufEj7CEDHaf+_KDbzKW8Et8yHO3mtjR9SEUNwQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Sep 2019 16:58:54 -0500
X-Gmail-Original-Message-ID: <CAHmME9pd5j1-NYc4mOz7vbwJ_805fPyO_dK8=+dB7-z0+oebOg@mail.gmail.com>
Message-ID: <CAHmME9pd5j1-NYc4mOz7vbwJ_805fPyO_dK8=+dB7-z0+oebOg@mail.gmail.com>
Subject: Re: wireguard-android broken after update to Android 10
To: Frederick Ding <frederick@frederickding.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============2306916880203454339=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2306916880203454339==
Content-Type: multipart/alternative; boundary="0000000000002044f90591e98ccb"

--0000000000002044f90591e98ccb
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 6, 2019, 16:55 Frederick Ding <frederick@frederickding.com>
wrote:

> Pixel 3 user here on Android 10. Have you checked
>

Just to be certain: is the implication here that you have a P3+AndroidQ and
don't face any trouble using WireGuard?

--0000000000002044f90591e98ccb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Sep 6, 2019, 16:55 Frederick Ding &lt;<a href=
=3D"mailto:frederick@frederickding.com">frederick@frederickding.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><div>Pixe=
l 3 user here on Android 10. Have you checked</div></div></blockquote></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Just to be certain: is the i=
mplication here that you have a P3+AndroidQ and don&#39;t face any trouble =
using WireGuard?</div><div class=3D"gmail_quote" dir=3D"auto"></div></div>

--0000000000002044f90591e98ccb--

--===============2306916880203454339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2306916880203454339==--
