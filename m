Return-Path: <SRS0=V78u=MZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988CBC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 13:18:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D42AF60F70
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 13:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D42AF60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5821c85;
	Mon, 2 Aug 2021 13:14:09 +0000 (UTC)
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [2607:f8b0:4864:20::72a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8a1bddd7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Jun 2021 21:10:56 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id bm25so5294364qkb.0
 for <wireguard@lists.zx2c4.com>; Sat, 19 Jun 2021 14:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=EqlMBQRfLb8q+EvjYHvouePalCTyV0BtCN1uO5LDJUU=;
 b=fJaVkFEaDV3CBdStanbt7uorwHQ7djfEGc0f2iH5Y6ymcAvPjxhdvzL9F0EyddfkKu
 VsWj5k/b8E7S9TL3X1YMbS2COsaqjXymSjQKvuDramSlLpiJ5Unsk3prn6zF0EE93AI/
 OA6GGFW3EVe9EFN8XcAMtfEtKxIe8UlS6sRwT34r5LBWG47qEZaNH26oHsVpvzM61O4J
 CPocefVp7STkSyhGaqwZvj5/4SGc3LPlat7ZaH9s54S2gfburpUZjx1C7UiVfITSNSIy
 yeT/qpF3yVErrbIBTX/40iVuJ02RaMPhN6KKFn2bGsCfZ85upR9gARS8DLD0XJFyCo9T
 w0ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=EqlMBQRfLb8q+EvjYHvouePalCTyV0BtCN1uO5LDJUU=;
 b=C30XYxPM9fY4rqf8IOyFgfSWkuRooUaZJTtdl+25h7sjYO+sDhQvJP8fGG8lISa+XW
 Xir7QwH2TF8KqOPNG4Z2COKsN6a10qaMRUDBLWYx6oK7BcvabisyWj7KnorL2w8649tB
 kokrNL22L7XnBsnpqIsX4+50rNHRaXHL9GMblToGT1Qvfr5KKz4dUdOwScAiTBIwUBMx
 oEj/khtewtGoZ9rwMZzbnkemfh08Dc0tGoDANJ+KzA0QR/GRmuF42dBy8XcKTjlvU3ww
 kjHHOx7m8Vy5L/ucYpWSyrTgM0RL5dHQ+UhfLUG6M/YOEL6Hjenfk7d+PcfK4Q1fM1iN
 3Idg==
X-Gm-Message-State: AOAM531u7Csn05lnLcXJpZXftyKDz0+KaYpvCgq/uO7QoIIuKjLsnO2B
 /Ipzz4e4YQ7jSQ3mjrZn05a/S5He2uI=
X-Google-Smtp-Source: ABdhPJzKC9ziyszs3i3Km6vAm9wiAHLPk89WtCLAh4yh4o0I8q2W+OThnw1rdfaUwUF25ihrNqNaIA==
X-Received: by 2002:a05:620a:307:: with SMTP id
 s7mr15195888qkm.213.1624137055100; 
 Sat, 19 Jun 2021 14:10:55 -0700 (PDT)
Received: from smtpclient.apple (fl-67-235-128-112.dhcp.embarqhsd.net.
 [67.235.128.112])
 by smtp.gmail.com with ESMTPSA id d9sm1303692qko.110.2021.06.19.14.10.53
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 19 Jun 2021 14:10:54 -0700 (PDT)
From: Andrew Udvare <audvare@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: macOS app: DNS resolution failure
Message-Id: <62264DB4-5919-4E1F-A162-80147A8FEECC@gmail.com>
Date: Sat, 19 Jun 2021 17:10:51 -0400
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Mailman-Approved-At: Mon, 02 Aug 2021 13:14:07 +0000
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

I am unable to connect to my tunnel that uses a name rather than IP. =
Every time I click activate, I get an alert "One or more endpoint =
domains could not be resolved."

I can connect using a MacPorts-built copy of wg-quick in CLI. I can also =
connect if I put the mapping in /etc/hosts. I know I definitely have DNS =
working as nothing else has this issue.

Is this a sandbox issue? I noticed the code uses getaddrinfo() and when =
I look in the logs after clicking activate, there are many errors like =
this:

UNIX error exception: 17

The correct entitlements are present in the network extension =
entitlements.

I cannot build my own copy at this time because I do not have a paid =
Apple Developer account.

Thanks
--=20
Andrew Udvare
