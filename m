Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D2CC54FB9
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Nov 2023 13:34:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 475a0c4e;
	Sun, 19 Nov 2023 13:34:41 +0000 (UTC)
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6493c2b4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Oct 2023 06:20:08 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-65b162328edso45056306d6.2
 for <wireguard@lists.zx2c4.com>; Wed, 18 Oct 2023 23:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697696407; x=1698301207; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=T5SEKdWFf1S1UCsC3S6FwamG1eM4FGOEEjITcEYizb4=;
 b=JcZ8lEuBGtJ3AwLbZy6/GFNavoEa3AJ4p2pmt1zNuYehav1+qQ9vpKWLIALTcJJf53
 6y61O6GIlM1jn/K3yCstIruSrLXeq/xPGc7B+I3qEw5kSrEUYnuLRtsPLYTFud/DBQby
 df4YBX+MN59PlEKeds76Jf1qsctT5pH13AxRt8DiSf5ySrb/MGmhyDwlc+GDdRdg5h2r
 wvtQ7lkOuGPx5qREYEc9xcHmrL4dHbraI9OcG1hzpBtaEWPTa1NQ0g385SXM2QqVeR8W
 f7MIrStH+Pvjv1rjQ3W6SPKEJz8VcYKU4FqdU5PgZxZf+x3Zjbi/ACDGf+fiAJfI7x3a
 RwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697696407; x=1698301207;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T5SEKdWFf1S1UCsC3S6FwamG1eM4FGOEEjITcEYizb4=;
 b=UQn36e/IjUi93Y0TxQw/AAosHBO4Apo+8ThkT8+wbSLFrMb6kaSE7yTmwJRhVxNG5g
 2cOq7w6/p4C8a2etshbc4n3hZpMJtEIrhapJH0xQmGMqn4toqdfcxX3mBN7Lu8ZPmNE0
 bhCmAcZaKRzRdEqXFcj8u8/giDZDfCW2RBPhTExmI/GGDSvq68ljZiJb2kKtgjVoxJPq
 JVD1NaXdPBCC5dLfGjHsIrUKxc3Uu1jm4Vf/KIfjiCTzFDPDvIc56TrYJGnriX3liomk
 ojy5Z3wsSmsCwJjbAIZIJNlsjMx1qzYLETO/qxjHrlwDQXohOqWqnkYjhBxWxatx9CNe
 KUbA==
X-Gm-Message-State: AOJu0YygsqzGkZyVXXMKWMFhp161eBUzqrw2S2VWzx8iOdvAbwDiD3EL
 pLHFrEQlOUrXBOPbhyyll/zqcW1HUdq/fUQvY/SpYD7dWCstfw==
X-Google-Smtp-Source: AGHT+IHWAgnfU+R0PK5GaEeMHYRR2J9VZSBS30uRtnCkW1uFp55a8nMgpIS70xsHgQ/0W+y+scOJ87Ek6f4gbQbniVI=
X-Received: by 2002:a05:6214:20aa:b0:658:2bec:eae2 with SMTP id
 10-20020a05621420aa00b006582beceae2mr1376407qvd.10.1697696406961; Wed, 18 Oct
 2023 23:20:06 -0700 (PDT)
MIME-Version: 1.0
From: Tristan Camilleri <tristancamilleri2@gmail.com>
Date: Thu, 19 Oct 2023 08:19:56 +0200
Message-ID: <CADS3Xjem1HEvpYGaM9WF_MUZAXtvaAjsovMEgjqGPo81426e_w@mail.gmail.com>
Subject: Wireguard and Windows metrics priority
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 19 Nov 2023 13:34:33 +0000
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

Dear all,

I hope that you are all well. We have a wireguard service running for
the VPN solution, and currently we are testing a scenario with the
Windows metrics. We are allocating the network adapter metrics as
follows:

VPN (Wireguard): 10

Ethernet adapters: 20

Wifi Adapters: 100

Bluetooth: 150

While configuring this, we were testing if this really works to prefer
wired over wifi or not. While having the wireguard service running and
connected to a wifi connection. We connected a LAN cable to the
device, but the device's connection traffic did not switch from WiFi
to wired. We tested this with the service of wireguard down, and it
switched automatically.

We wish that it would work when connected to wifi; it switches to
wired when the wireguard service is running.

Do you have any suggestions for this? Maybe you have encountered this.

Thanks and regards,

Tristan
