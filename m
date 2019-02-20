Return-Path: <SRS0=i+YM=Q4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22A1C10F08
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 07:14:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 597162148D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 07:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 597162148D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=burghardt.pl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b86891e9;
	Thu, 21 Feb 2019 07:05:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc6407ee
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Feb 2019 09:42:05 +0000 (UTC)
Received: from 6.mo173.mail-out.ovh.net (6.mo173.mail-out.ovh.net
 [46.105.43.93])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e9531ee
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Feb 2019 09:42:05 +0000 (UTC)
Received: from player778.ha.ovh.net (unknown [10.109.143.18])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 3A3EFF41DA
 for <wireguard@lists.zx2c4.com>; Wed, 20 Feb 2019 10:50:43 +0100 (CET)
Received: from burghardt.pl (mail-it1-f171.google.com [209.85.166.171])
 (Authenticated sender: krzysztof@burghardt.pl)
 by player778.ha.ovh.net (Postfix) with ESMTPSA id 7DBEB2D6246B
 for <wireguard@lists.zx2c4.com>; Wed, 20 Feb 2019 09:50:42 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id l66so14037770itg.3
 for <wireguard@lists.zx2c4.com>; Wed, 20 Feb 2019 01:50:42 -0800 (PST)
X-Gm-Message-State: AHQUAuaWwE2IAmEJrShcl/A8Spzp6NNedg+7y8C6VhEuYsb1Leu9A62z
 9tSsaO1igk5PbgP70ayfkA50tN/lDZSqd27b9e0=
X-Google-Smtp-Source: AHgI3IbhtPwLdMjJ6mddcaaOFyJzR4ghQeaqJT/4sFbg2OoznSXGOUk+6tP2rj2liUMBfBeymCwzX2ePNr+a/U3Mfwo=
X-Received: by 2002:a24:cc05:: with SMTP id x5mr4755076itf.82.1550656241267;
 Wed, 20 Feb 2019 01:50:41 -0800 (PST)
MIME-Version: 1.0
From: Krzysztof Burghardt <krzysztof@burghardt.pl>
Date: Wed, 20 Feb 2019 09:50:25 +0000
X-Gmail-Original-Message-ID: <CANTbKE9hK70DgO3+ihMnPWm64hcQ7f_DuVbYhckM35d75EM65w@mail.gmail.com>
Message-ID: <CANTbKE9hK70DgO3+ihMnPWm64hcQ7f_DuVbYhckM35d75EM65w@mail.gmail.com>
Subject: easy-wg-quick - script that creates wg-quick configuration for peers
To: wireguard@lists.zx2c4.com
X-Ovh-Tracer-Id: 2518075142286873423
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtledrleeggddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
X-Mailman-Approved-At: Thu, 21 Feb 2019 08:05:11 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi!

I wrote a script that creates wg-quick configuration for hub and peers
with one command.

./easy-wg-quick && sudo wg-quick up ./wghub.conf

After scanning QR code printed by script with mobile application VPN is ready.

For more information please visit:
https://github.com/burghardt/easy-wg-quick/blob/master/README.md

BR,
-- 
Krzysztof Burghardt <krzysztof@burghardt.pl>
http://www.burghardt.pl/
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
