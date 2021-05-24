Return-Path: <SRS0=YF0P=KT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FE9C04FF3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 May 2021 22:05:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2AAE61404
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 May 2021 22:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2AAE61404
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emilenijssen.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 413c4ef6;
	Mon, 24 May 2021 22:05:32 +0000 (UTC)
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6aa7164e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 May 2021 09:35:33 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id a25so31132970edr.12
 for <wireguard@lists.zx2c4.com>; Mon, 24 May 2021 02:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=emilenijssen.nl; s=google;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=0RVX1elYEhnQgNOJ02AE7FIba3s7fgbJ8o4DsALAFfU=;
 b=RHMFwHX+PoOZVvI397tMB7+sRFvChIktNLX4RzUDY4mSLM5y89vXbvpZHDlavgCbmK
 geg48mdgJS/tXDjuCeVGU+56hUxFchvfF5W7JFaxpntVn3K2BC+Cdqami+7l306ssHBK
 ZmGEBiwGOp8LqTCpKGwMgABj8tVvpbzBt24T9ngpfSxgPcMIrXopMFIbtVAryFREOC46
 s696re3RgPIMJuZaUTrs9B7rgjZiU9T4iOQXVOMvDu0fJbo1+WIcULM0/AzEiDK8smzH
 3KT/+Fxr6d27Hd3rvFMDA7uQ/lDH8jb9ldydXCT+WhUBM7dVn5izn4xUrWTkB+d77jtM
 fL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=0RVX1elYEhnQgNOJ02AE7FIba3s7fgbJ8o4DsALAFfU=;
 b=rh4yQMgGnCG+up8ywSb9zn9VOCQEijf8pm5Emd4NQYq5XdhvncYI9A8B5KKkqXaylc
 wxqM7s1/pLE1CAtZm5a6a/C/eLJds7h2bPr4S70HS5LFUrVej1jx6ZNpXzKDZj73Ppn9
 UVtgLGJTnJFiRAOXG2C82Du04ZhtNy7lgQrfnzWEfkowWBwHy+EqSRmxIftvRiwa/If8
 ZUXhfpUezubl/LHaq67W3PEuItltg44OaZzokKiL+Un6J3bx9S0HiT+iJmMsxL9UPEac
 aSJJ3XvsCXHVhS+BaCUWqJ8z5qA7ygUzMUI+m/j0xMHLA1BWupSOPJVE1Aos7gRynWx8
 UNUQ==
X-Gm-Message-State: AOAM532sPFnjn5Gke9MEU5Y8lhh5x+m0wvMpodmvCZcieMnA/vrTU8Oe
 VORlmrHy9HaDZhjSgGYwobL6Uqj6raz0WA/P
X-Google-Smtp-Source: ABdhPJyPrkxgF4VIKVAHfpC7bRHtwlwPiXAzGv0ojfNkedSkCgbYVmVknLpPy5ewaTz9hECk2m7YdQ==
X-Received: by 2002:aa7:c54a:: with SMTP id s10mr24180348edr.132.1621848932745; 
 Mon, 24 May 2021 02:35:32 -0700 (PDT)
Received: from smtpclient.apple (82-75-145-32.cable.dynamic.v4.ziggo.nl.
 [82.75.145.32])
 by smtp.gmail.com with ESMTPSA id y25sm9003265edq.75.2021.05.24.02.35.32
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 May 2021 02:35:32 -0700 (PDT)
From: Emile Nijssen <emile@emilenijssen.nl>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: [wg-easy] The easiest way to run WireGuard VPN + Web-based Admin UI.
Message-Id: <428B744A-4C1C-482F-9990-E790EB1622B7@emilenijssen.nl>
Date: Mon, 24 May 2021 11:35:29 +0200
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3654.80.0.2.43)
X-Mailman-Approved-At: Mon, 24 May 2021 22:05:31 +0000
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

Hi all,

I want to share my open source project, wg-easy.

It's an easy to setup, pre-built docker image that runs WireGuard with a =
beautiful Web UI for clients management on top of it. You can =
view/create/disable/delete clients, show a QR code, or download their =
.conf. There's even Gravatar support :)

It's intended for new users (your typical Raspberry Pi hobbyist) to get =
started easily.

Check it out: https://github.com/WeeJeWel/wg-easy (there's a screenshot =
of the Web UI in the repository).

---

Emile Nijssen=
