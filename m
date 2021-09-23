Return-Path: <SRS0=2DBL=OO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA59C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 00:21:30 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 283EC61152
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Sep 2021 00:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 283EC61152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5c6d6cf;
	Fri, 24 Sep 2021 00:21:27 +0000 (UTC)
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com
 [2607:f8b0:4864:20::e33])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 78d7ebdc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 22:23:53 +0000 (UTC)
Received: by mail-vs1-xe33.google.com with SMTP id z62so8117191vsz.9
 for <wireguard@lists.zx2c4.com>; Thu, 23 Sep 2021 15:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=9FGJa+wg7rJWb0vDEZ8MjDRavF6pODd/jDV9irEWdPg=;
 b=OxLqmG/OVeAqvKNXAfV3IOxGfBSJGTM72iyEDp1yrgEPmsHdvznQXvDoU2tWSBjrOL
 cbQI9HF4BULpG+jrRPC6fqiHKwMlxskxQBb3SYEh9ro3bgfQ7XF2kgcnTsvNFO966Jyh
 Tfla7UElg0QyeYmWZgvxPLtSF4mI5G54NHK/u1zJA8tHaLbG1vahH4RWRmEu+aGWrxyB
 y7rUDOIKQSw6FxMreEQVgjRPZPCaUCMjglRMe60bEFSVHm/fHuzUJZgNfmuSM6QqlUWP
 E9YJKT/jEkQQ7o0jNjUlB3OxD/LB0+/2uQrlNCFEUdqtFmW4SnXWmnz8WG5rNq+ggc2j
 /nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=9FGJa+wg7rJWb0vDEZ8MjDRavF6pODd/jDV9irEWdPg=;
 b=PdKRmcoNLKRgbstpRcdtRNnyZ9TQMrjRyHbJfTElLbXgruOENlLvVGWDV8ktssUsDp
 9WiIs0HenHvYOEnN0JW+wD0HBdIJdSq1hrbdq+NYtFwkBMdzD/Mk0Iv/qcjAQJO+PyMO
 h3knrAU8/OhNj24ZJiFpsatUr/qXTZp/HmkH/oc494HaXTA0yDJN/hvXUeDLtbeJT9pg
 drOARJe3fTGaLEiJvuDPk0Z8oLXCut2KtH2JSteBD+AaSVaHkS4qSoFQm7ygw9KLloeF
 xmL9h8438gVIWoQGO/vZtnASCFqUyrLBeYdWg717OY0grSdBrpQA5VqUTEhpnpqQrTs3
 xkLg==
X-Gm-Message-State: AOAM5310if2LpOeGCiLV5EW01qlXUwTVVQszWPyLc8FlRhlCenQ8BnoT
 bRllZUOhZ6X5bXVQWGDDNzIS8+A865nYXfX+Qn6o6ZUGwSs=
X-Google-Smtp-Source: ABdhPJyacOv8ZYdLO9+o7p7UMYRlxrF+67hzop2kIWZUI+NdkS7TPThf51kQ9SVE98r9MHHug1ZN8jTPb6qhT345uSk=
X-Received: by 2002:a05:6102:528:: with SMTP id
 m8mr6912050vsa.43.1632435832390; 
 Thu, 23 Sep 2021 15:23:52 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Maciej_Le=C5=9Bniewski?= <leshniack@gmail.com>
Date: Fri, 24 Sep 2021 00:23:41 +0200
Message-ID: <CAKF6ahaqcCYg5zrnM=uRzdmgLhui5CD-JhaiXvsMrOGkSbdF0g@mail.gmail.com>
Subject: wireguard-apple: overriding on-demand status
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 24 Sep 2021 00:21:25 +0000
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

firstly, thank you for the amazing job and the on-demand feature.

Question: What if I'd like to override the exclusions and enable my
tunnel in on-demand mode just for a while (wireguard-apple
v1.0.14-25)? Do I have to edit the tunnel profile?

Explanation: I'd like to have an auto-(de)activation when network
changes, according to the rules, but still be able to override this
behavior. So the on-demand rules should be reapplied every time when
network changes, but after that I still should be able to turn on/off
the tunnel manually.

For me, the controls looks a bit over engineered right now. I think
that two switches would be better =E2=80=93 the main switch should stay as =
it
was before, but should also allow to turn on/off the tunnel regardless
of the on-demand settings. And, additionally, a second switch (in the
details view) that allows to enable/disable the on-demand function.

Maybe it may cause some issues that I don't see, especially in a
multi-tunnel scenario. Anyway, please consider it.

Regards,
Maciej Le=C5=9Bniewski
