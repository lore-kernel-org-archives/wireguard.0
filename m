Return-Path: <SRS0=UpYJ=F3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C26AC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Dec 2020 16:34:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EE932226A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Dec 2020 16:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EE932226A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d115e153;
	Wed, 23 Dec 2020 16:24:41 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8a27a713
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Dec 2020 16:24:38 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15f5a503
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Dec 2020 16:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=USUZFp
 DasT0xaM3KKujgdQwyL5Y=; b=ngvBrDV9WIge2NZVhDZ+UWbuLQ1+OTkXR3mZFc
 y5ymfuds5GP0MVbpNm1Cz285gmrbZZF9VigK2PlNbWwbgyiKBKV+R4MlgYIVp++c
 7Booe11XcJ+U73KrjCel7eFpLB7StFWOvQ/gehEAEVLO8yAw3A3GgCi2IQ7k/qE7
 9uquRovFwsumViTpriB7hCfeeRTsPcTtxZtIfVreQCmYGwGPhbj/hYvOIfHBunVJ
 K97mL8N8B6BHZ/sMpn+gZPWNTV1MIHAXvwiDDCt8V/wDS/758LF41GL+TDqMxE1Y
 DgUQEN3ZU6hOix+evXB+2vsNX87yQwy+kODv2irSvPheCJMg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d5fa7d8d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Dec 2020 16:25:24 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id y128so34338ybf.10
 for <wireguard@lists.zx2c4.com>; Wed, 23 Dec 2020 08:33:56 -0800 (PST)
X-Gm-Message-State: AOAM530R1GwY2yaVPFF5k6IeWliV+GLry79khiAD/PX1U9CjkRQF0m9H
 76QDXiql54dapYWZBDgN2aAEIkJAlel3EMsvAkA=
X-Google-Smtp-Source: ABdhPJwZiqQH8N+ctT1/iJNnAa466WDRuUXkt/SHEZaGjK0UfWWD/Mg3cNaTjSBBkUqMHBA33H0tlNf+bs492wtgXWw=
X-Received: by 2002:a5b:78d:: with SMTP id b13mr36762336ybq.123.1608741236522; 
 Wed, 23 Dec 2020 08:33:56 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 23 Dec 2020 17:33:45 +0100
X-Gmail-Original-Message-ID: <CAHmME9pnwQMzZGjV+22NB-6K11f8W1U4vS-U1MDkABjRvucfQg@mail.gmail.com>
Message-ID: <CAHmME9pnwQMzZGjV+22NB-6K11f8W1U4vS-U1MDkABjRvucfQg@mail.gmail.com>
Subject: Embedding WireGuard into Custom Applications
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

Hi,

As WireGuard adoption continues to accelerate, I'm getting more emails
asking me how to make custom WireGuard clients for specific use cases.
The most obvious inquiry has been from VPN providers looking to
integrate WireGuard into their branded clients, but there have also
been others looking to do more nuanced things.

To that end, I've put together a doc on this on the webpage:
https://www.wireguard.com/embedding/

This summarizes the current options for Windows, macOS, iOS, Android,
Linux, and so on. It mostly amounts to a series of links at the
moment, but I figure it's helpful to have a unified place for that.

If you have suggestions for expanding that, I'm all ears.

Jason
