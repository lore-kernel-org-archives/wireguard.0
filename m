Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6884DC761A6
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Mar 2023 13:27:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99de84e5;
	Thu, 30 Mar 2023 13:25:13 +0000 (UTC)
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [2607:f8b0:4864:20::132])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4794b6a7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Mar 2023 13:25:11 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id o12so4773994ilh.13
 for <wireguard@lists.zx2c4.com>; Thu, 30 Mar 2023 06:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680182710;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=av9qMQufqg9b0rEkxuFI5+zLgwKJz0B1O+8RCZ2/4PM=;
 b=TxGJ7fdx9BpA8LCIT38M7LOQBp3mzslvjSE+y21yL9u+9kVosc8IQO4NwOggkHyOrH
 GdZjvLX/mW3srMn+6RB8kjZECAqSCFeQmDkPMl4ER4x95GSzhSLHyV3jsf/8FGMam7bS
 AZcOfqE4APXJUSpAPiMVxrD6gPm3n5+dL9kQ2nIdfqwMXXnxCQM/FjbYHveUIsSuaPPl
 vXk6Sn0j+1pMAAsRzC3xKU3sVftHL4EpFkQCU3AtBff7gIdgz+kvhR0wAg4bZt08QHhL
 UEzuXiEhK2oHkE9NTA6ER3sd4PeDa0T+81Bbg7ifjjBQMmzUA9Y5dpRNS1YlXkzQGMYN
 P+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680182710;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=av9qMQufqg9b0rEkxuFI5+zLgwKJz0B1O+8RCZ2/4PM=;
 b=a5bxvXU3gsQxcL5D9XY08cic6Ys0OdJGekPcQXt3w8pR7AYBluwpVNBgOfwHbWCWGh
 V6qAuilq5lzchg3bbwcyRJ5NExmcczrTv0fWHe/gvy+IyrJSv7ZVqsE1EExEH62+vlVq
 nGX7Hf2JyzglUCuCiTmCEbLr9aYhn0YpSL7JnS/GQJcVi3exUfztO1iuma1P2NFHeVzq
 xmWB2zM14O+RH/+QdDaxDGy4KEAHwE6AKjHGT+7Cxlih/urPL8qthkqhnhR/Tank7iiw
 p60QOGJ1T8P1jRtjWWls0lbWRg0qAFmCcXRGRX8WZNditdUZSShuiCyHLS0DQdhiQB/T
 Hznw==
X-Gm-Message-State: AAQBX9cOhBdEPG7RKp6+8qRFRathYrn/WiNrZtVKNof7m3t6SYs1GmSQ
 WxOV0ctJnXIPynvvSBVLjmZ4onsXtUewBPvZXEjNr5ZdVwMspdfH
X-Google-Smtp-Source: AKy350bbdDQwy2r2nZNxoY6X7na0xU11z5QmA1+qhsRHMNOO50zcwZE2OQmYww9YDRpv4cZ4GCQ2GT2cK0jszUUH+VU=
X-Received: by 2002:a05:6e02:1be1:b0:325:e0bd:d1c7 with SMTP id
 y1-20020a056e021be100b00325e0bdd1c7mr10931994ilv.2.1680182710003; Thu, 30 Mar
 2023 06:25:10 -0700 (PDT)
MIME-Version: 1.0
From: Kai Haberzettl <khaberz@gmail.com>
Date: Thu, 30 Mar 2023 15:24:59 +0200
Message-ID: <CA+CGqoKvx-Yeh6zP1_9goVFaPMKaVPQUij2UrO9B9Ea8cRd7iQ@mail.gmail.com>
Subject: Nw Android version crashes on Android TV / Google TV
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

The new Android version Version 1.0.20230328 crashes upon startup on
Android TV - in my case on a Google Chromecast with Google TV (others
appear to see the same per reports on reddit).  If I can provide
additional debug Information, please let me know how and I=E2=80=99ll be ha=
ppy
to.
