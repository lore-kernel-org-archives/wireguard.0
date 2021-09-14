Return-Path: <SRS0=GDNb=OE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09BEC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Sep 2021 20:53:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE0E36109E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Sep 2021 20:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE0E36109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=prosimo.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9be357c;
	Tue, 14 Sep 2021 20:53:29 +0000 (UTC)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 095b18b4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Sep 2021 20:53:25 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id m9so323406qtk.4
 for <wireguard@lists.zx2c4.com>; Tue, 14 Sep 2021 13:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prosimo.io; s=google;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=Mlbj8D43WrjXo4hAOEF8XDc34pKBIcEGGGoDhPFzJLQ=;
 b=S0jcTMseCsG2yH71DCa4A0lCm4mBrC/MYu7VL6OfiWdjKvBNuRdbWNh7pVr4rBPgiK
 at8g2EbWft2dnbmWCY0UxU/LsMGESPE7PSPjsBQaUA5SDdfaNUfw9M98qEsRzngtKTYm
 TpnFq07V9Ps98ptMD1ktJeDNNS0cUd9Y693P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=Mlbj8D43WrjXo4hAOEF8XDc34pKBIcEGGGoDhPFzJLQ=;
 b=rZfAy3/k155em+e7is+G7RjRs0JFPyCWkRVOXhjo38yRFaaDt0Oa9FFJUPLrFhqEun
 RqLCLxLouSH4hCjdd2rJ2pLrQErWn7n5HmL4kUajs8IPO+Lm5NYgT/vxPiAqEVftj0ZN
 fT4oZHHIvwFG7DnbBcpbAUsVHrYu1PGD3N2TTc/3PysgFM0dg2NId9fez6TwnnT7Mgz5
 cQ26cmSP+OSb+yKuyrYSJAUKmgcykiPedTrTubhUoXEYP4VhwQwRj+Xw8OZPxVJc7Zm/
 UtuxNyqcoi6ZiIdv16RCsOrMRsOfymP3hswsVJtD8WtxypaVW1MpDcsZ3g1OSLtAAoXR
 ysVg==
X-Gm-Message-State: AOAM530vVkALFm1lOlMSLg+/LBq99pe3EQ89RAXuTDCDYmyUACj+VxrX
 3FM7saRg1oTFttaC/feu1eepfdEvJ9h6Dg==
X-Google-Smtp-Source: ABdhPJxOAO71lr+VNn9ZRDHQBg9XG2QfVGCxyqo3aSXaNMw9MbFu5WLXHg/5Xfys65+/FZgOo1gS9A==
X-Received: by 2002:ac8:7482:: with SMTP id v2mr6794517qtq.235.1631652803796; 
 Tue, 14 Sep 2021 13:53:23 -0700 (PDT)
Received: from macbook-pro.attlocal.net
 ([2600:1700:4a30:f780:c50c:5925:5d80:8fb4])
 by smtp.gmail.com with ESMTPSA id t188sm8579367qkf.22.2021.09.14.13.53.23
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 Sep 2021 13:53:23 -0700 (PDT)
From: Manikandan Thiagarajan <tmani@prosimo.io>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Netstat bytes count doesn't match with Wireguard
Message-Id: <DBFC0427-180B-4757-A93A-0D9DECD959EE@prosimo.io>
Date: Tue, 14 Sep 2021 13:53:22 -0700
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3608.120.23.2.7)
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

Hi,

I use the Wireguard Go C API to integrate with my packet tunnel network =
extension to forward traffic to the WG tunnel on Mac OS. I also use the =
wgGetConfig() API to get tunnel status information.

During my testing, I noticed some differences between what the netstat =
-ib reports and what Wireguard reports as rx and tx bytes. Usually the =
Wireguard numbers are higher than netstat numbers.

Is it normal to see so much difference? Can you be able to provide me =
some information or point me to a doc on how Wireguard calculates the =
tx/rx bytes?


Netstat -ib output:
Name  Mtu   Network       Address            Ipkts Ierrs     Ibytes    =
Opkts Oerrs     Obytes  Coll
utun2 1420  <Link#23>                          130     0      42713      =
180     0      15245     0
utun2 1420  100.101.113.5 100.101.113.54       130     -      42713      =
180     -      15245     -

Wireguard output:
last_handshake_time_sec=3D1631646164
last_handshake_time_nsec=3D79839000
tx_bytes=3D21328
rx_bytes=3D47980
persistent_keepalive_interval=3D0
allowed_ip=3D155.2.135.28/32
allowed_ip=3D192.168.128.4/32

Thanks,
Mani=
