Return-Path: <SRS0=K437=FV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C887FC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 17:37:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F205B23426
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 17:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F205B23426
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=capeyron.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92e6fcfd;
	Thu, 17 Dec 2020 17:27:23 +0000 (UTC)
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [2607:f8b0:4864:20::82a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 45963e9c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 15:11:13 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id v5so11055250qtv.7
 for <wireguard@lists.zx2c4.com>; Thu, 17 Dec 2020 07:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=capeyron.fr; s=google;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Q5UlWIbnJXVkJ8srp5+Pz/54Ap2vggg3hVA2eoXafSU=;
 b=HfqEuYDxaoOHxZLhuyzx6l7Qh1elrAfzDqBEY5N6IiWmbDPDLQFnTQwPw16RSdiM3d
 IxY8nFNJwOaPztw0oawNmsecpW+m85qbffMd0zGYC+RNXfmuDPVL+W+XiC8JitZJ/kjz
 XeBFrXHzd2D8j0i/tCrT/nzJiaEXAt5tATA6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=Q5UlWIbnJXVkJ8srp5+Pz/54Ap2vggg3hVA2eoXafSU=;
 b=GQXiqXcAraClmkQ1boIp/rlW/Uv4GuQkiTIodM5KNVHG5nRUQJFPj0B8QU2PC/oYsU
 Vt5P8KfhKSrXcZkf0AF7ReU0Wa6KpnbGhHbZBPQ02u96+X916Sd1lwf0P9ixNGtFt2ar
 x5FvjID/vDV/xrHnBZ+ZpMdRpQlZQGRGE67YBVUtUpqll2wbnUUh9hVqIAN85MEZ+9zV
 QaWDU3FjvheGUHtuneKtymUWTChFTgyu53wErKgzOQBTMp+EnL9d3FfWIgA8qV84gA8e
 IFmmZ6sZnNfSG7A8LbJVr0EAsltn5Op7FZ6mHbsKEG595+TotbaWwVDKdfcrkpxNHbqY
 q7og==
X-Gm-Message-State: AOAM5339jNiVjB1KCVBbGDmye3S0HYeNWdmYC0ME8oHjGe2Ekgw+ueY/
 /8QttjKkK7Ui3jQrUbIM8pZiwJsVzzEmC2GaaDwydOthPH911YvU
X-Google-Smtp-Source: ABdhPJzcqFTJcN0/WwvLGObMe0lv3jmXA7ZMtjFVze0QG4qKQT/HN9JADWBcZYSs6qOJo0XqfLHJcE9EqXqdKIUydpk=
X-Received: by 2002:ac8:5d53:: with SMTP id g19mr48359871qtx.354.1608218384114; 
 Thu, 17 Dec 2020 07:19:44 -0800 (PST)
MIME-Version: 1.0
From: Nicolas CAPEYRON <nicolas@capeyron.fr>
Date: Thu, 17 Dec 2020 16:19:33 +0100
Message-ID: <CAAhtBmOeq4vd=7MTJL_Qib-erwvMFJthTN+QnA0K_ykXk-G-Yw@mail.gmail.com>
Subject: Re: WireGuard on macOS stopped working after 1.0.10 update
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 17 Dec 2020 18:27:22 +0100
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

Thanks a lot !
Save my day !

Wireguard 1.0.10 on macos is a lot faster !

--=20
Nicolas CAPEYRON
Conseil en h=C3=A9bergement, architecture infra web
06 26 12 27 17 - https://www.sysadminbadass.com
