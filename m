Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7711C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:13:25 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6F4560E78
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6F4560E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lenstra.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23dae3ee;
	Sun, 8 Aug 2021 23:00:14 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7145d26a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Jul 2021 12:53:31 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id g16so11997230wrw.5
 for <wireguard@lists.zx2c4.com>; Fri, 16 Jul 2021 05:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenstra.fr; s=google;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=KHylXyoLUIerAXQ/U5Z8qIdjy4Sweh6qSgSFP8kTCrc=;
 b=KIed+QvTQU0ZJ7c6ZyBUz5pSGvREuIm2h0fJOrFG69uQur4Ym9GsvpwS/0yEZ61rsA
 yBjCZ3CxmC7x7l4IjwdRbKucD7BF0eF8PR3ooQsFRv3WFrkeK9eigS5QpphaJoJ1N14Y
 Uj8+1NMn0jsOzajuy0+Zg2Hv9TY4/oSV2tftZFJRSucLvMgNgJ11R4R1ss1MhhOUOgXo
 q7AkKhkFtJwOS080JXUpYO5uNCOsaS6X/006/5cfD2cpfL0iZRLJbWN1KR80/wMZBX4p
 TelOkbhfpavpIUF34WKBHqUvRDv+Pp3cyyppbL9vOVDrocyqDd/deZXZQVh/Ke8jFNV5
 0Gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=KHylXyoLUIerAXQ/U5Z8qIdjy4Sweh6qSgSFP8kTCrc=;
 b=k524seqqh/OXScenUGOEWT2CLPhY0FNT2YKwQwcOvAkErqX+9ehDIGHMLokRDqvsIi
 mNROR0TnYSzIGFcHwiQq2zd1RzhITK9gE+CKPZ7evcwIBMqrLynrPc9SpO3MdeDaa+U5
 V+wgpJU/CjTt1FlphiNloYCmT46yukCukiUQ2rctJLEJLxZttyYrWAQmbbPKNKChKt9F
 NytPuHk4TYT15CZsGAk2jiWsP6IDk5KFDMVvTZYSP3U9+65r8i1ih20EkDzwTiwOirG2
 YHUyxge6bUAndBbEv+GJUNzjzrZINyy9HN4H8EvgZ+u/ws6iEuZuMBZfEbxokbdG+ZGJ
 wJxQ==
X-Gm-Message-State: AOAM530zauhGGQXllWAwr+hHbHe+PB0bmf7fet+VE0PlqSAUXOil1rkR
 cU/7dVNnbPex9yABVyykI5mTTicN17Ux7zbB+tk=
X-Google-Smtp-Source: ABdhPJxdw3deNxEQUidirxVnSKVBM1KUQBq1o9PwVjElXQ8OmFaXlqZwYCoQpuyMpJ6ya4orrD8aaQ==
X-Received: by 2002:a05:6000:1281:: with SMTP id
 f1mr12571380wrx.114.1626440011235; 
 Fri, 16 Jul 2021 05:53:31 -0700 (PDT)
Received: from smtpclient.apple (176-189-146-38.abo.bbox.fr. [176.189.146.38])
 by smtp.gmail.com with ESMTPSA id
 v2sm9816058wro.48.2021.07.16.05.53.30 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Jul 2021 05:53:30 -0700 (PDT)
From: =?utf-8?Q?R=C3=A9mi_Lapeyre?= <remi.lapeyre@lenstra.fr>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Missing route table configuration on "Quick Start" section
Message-Id: <E42173AE-ECFE-46E2-8F33-65F113F7A601@lenstra.fr>
Date: Fri, 16 Jul 2021 14:53:30 +0200
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Mailman-Approved-At: Sun, 08 Aug 2021 23:00:12 +0000
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

Hi, in the =E2=80=9CCommand-line Interface=E2=80=9D paragraph of the =
=E2=80=9CQuick Start=E2=80=9D section at =
https://www.wireguard.com/quickstart/#command-line-interface it seems to =
me like the list of commands given:=20

# ip link add dev wg0 type wireguard
# ip address add dev wg0 192.168.2.1/24
# ip address add dev wg0 192.168.2.1 peer 192.168.2.2
# wg setconf wg0 myconfig.conf
# wg set wg0 listen-port 51820 private-key /path/to/private-key peer =
ABCDEF... allowed-ips 192.168.88.0/24 endpoint 209.202.254.14:8172
# ip link set up dev wg0


is missing the route table configuration with =E2=80=9Cip rule add =
=E2=80=A6=E2=80=9D. Those are given just a bit later in the GIF that =
shows 'wg-quick=E2=80=99 working but I=E2=80=99m not sure whether =
configuring the wireguard interface with the command given will actually =
work.

Cheers,
R=C3=A9mi=
