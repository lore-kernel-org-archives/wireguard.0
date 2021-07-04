Return-Path: <SRS0=KHeF=L4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D3AC07E95
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Jul 2021 21:00:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1E51613CB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Jul 2021 21:00:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1E51613CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d51cdc3;
	Sun, 4 Jul 2021 20:57:38 +0000 (UTC)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [2607:f8b0:4864:20::52f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1ad519cb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 4 Jul 2021 20:57:36 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id w15so16285091pgk.13
 for <wireguard@lists.zx2c4.com>; Sun, 04 Jul 2021 13:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=kQR66rYAbFMIdEttoecvbaY1IIExV0ksdc9N96P9lW8=;
 b=sRTPrZkKfn3HZlsTHiJ5NZX5AuWvmdapy2Qapj6FCtXjrr+DC8xnMQrsfrpQs5m7yj
 vZhr98pCYo/DLNiSC727WKEi/Q+j5Tquox4c7EOF2LnpdcPgrS+z5PYjSmaL+Vg5P24F
 06Ga8kVItjQnkXBrRr3TMmgoCgRnTMloT92liMjg071SuWIeoO/J4nPf3TZL6sKbk3YO
 WjgmAlR8VYISdgKaayPZRld5vVjjrg3KzIyp06MdEhE6usNMBjqmbYN1nRK9UsIj4HAn
 rEQR3avRAzlD+j3mQMkiI826p67NIpvJuw+eSZ9C3up3xi3tkdnMIJlW36zxq5bl5tmk
 m94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kQR66rYAbFMIdEttoecvbaY1IIExV0ksdc9N96P9lW8=;
 b=f3g8WVsRyXtfVDtEKdj424KZbNiirYxsl+rHm0lOMvTmLQOH+uMSYjStJ17sR13e+x
 9yAUjy/pQySXGvpx4oZssEIAQXcdFndoPx2GsuusiBw/kosXsRn1GHy1KGy2TJol9bM6
 f7IqzS1b1jbrCYo31cXp+G/T1Anind3GxWv4stSfACI0fQN6m8cO78u4PkntgYwBkf/D
 qsiSOsaSQ/N7iSTOqJREsrg1i0EOH8rkXE29Z9vwNKhR5rGzm13ZmsWFIX1TyArdHUD/
 9Zs6l17kAj6i8fLbQvgmOC2BVBvRCwwbKL51rNTX6XKKOLAWFxtrFjEvOp5q5Nl8WjZ4
 g6gA==
X-Gm-Message-State: AOAM5321hIl7l5Oe2XWvGAnU9STLAZVUfZdublfgXNO7iMeica8iLV9I
 W3XmuoJf7y/PNjCUWfSSkNkGpX5HtJMVYcugkd8bVqooUsg=
X-Google-Smtp-Source: ABdhPJybJ8WWbiwIr/HEl1g9K3cRi9r432nsDeuVLO84kJxqLDPGGfxpML4pGM17K1hl58ekA6c6iMl7DxIkJCZvhJs=
X-Received: by 2002:a62:19c6:0:b029:319:4a01:407d with SMTP id
 189-20020a6219c60000b02903194a01407dmr9867359pfz.1.1625432254643; Sun, 04 Jul
 2021 13:57:34 -0700 (PDT)
MIME-Version: 1.0
From: Christian McDonald <rcmcdonald91@gmail.com>
Date: Sun, 4 Jul 2021 16:57:20 -0400
Message-ID: <CADTMz0LJfBUtnKonOhvzs9ZzFPAiuvAG0qD79kATW=1hOgo_zg@mail.gmail.com>
Subject: 'wg syncconf' not removing keep alive once set
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

If wg syncconf is called using a .conf that sets a keep alive, the
keep alive can't then be removed by subsequent calls to syncconf using
a conf that lacks the keep alive value. This seems counterintuitive.
The only way to disable the keep alive once set is to set the value to
zero.

-- 
R. Christian McDonald
E: rcmcdonald91@gmail.com
