Return-Path: <SRS0=+otM=PW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B59C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 10:57:10 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6736761076
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 10:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6736761076
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=rcsnetwork.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c5ddd55;
	Wed, 3 Nov 2021 10:53:25 +0000 (UTC)
Received: from rcsnetwork.com (rcsnetwork.com [107.175.134.219])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9c4c8adc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 2 Nov 2021 18:07:09 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52]) by rcsnetwork.com (Postfix) with ESMTPSA id 2FAFE12D
 for <wireguard@lists.zx2c4.com>; Tue,  2 Nov 2021 14:07:08 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 rcsnetwork.com 2FAFE12D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rcsnetwork.com;
 s=2020; t=1635876428;
 bh=vHFW3l5qOF4lozW2tLhaJrGHV2WRmb9tyS41otaR048=;
 h=References:In-Reply-To:From:Date:Subject:To:From;
 b=E15tRTDBLtpY8QngWGHCT/jHxTG6dnwzX+QQ8JoVx80xvrMXnyBXC5ALOIm46jmKV
 VeewRJmT0r65gqv72cip94HRpDLfJnkXYMuc6CMnOelnM8ynEcG5UV/Jt9aHyJu9W7
 XD31k/UbmGRqpcNk8Wz0CetfKurQ1X5+KGAmDLHcIX+iTaNRpsl//jlgaFEwzlmfRw
 AKRXLaA/pk/Xa+ZaeO5A9+Gd05fneeFrosjvKYsvBM/GBMnRA17ORE7Ggkc1y3lM3Y
 UtvjuTJQah65xQCbQ9ro1iNpZf/jyhWVpEmdC5AjtkjDF2Bi8gN5uis5umut05g5Nh
 e31PndqXNRwTw==
Received: by mail-ed1-f52.google.com with SMTP id r4so581847edi.5
 for <wireguard@lists.zx2c4.com>; Tue, 02 Nov 2021 11:07:08 -0700 (PDT)
X-Gm-Message-State: AOAM531ts3didKWfBSBnJRNi9OTeSRCUFo/wv3kshWKAqLUesFip0dma
 2LAH1VSXIAKKg9NVwXT8/iu+lJ/35LcZ+c+qY4U=
X-Google-Smtp-Source: ABdhPJzgjd+YvNsX+I5QaCzvt8sADwy1oTPOb12Go/o07E4Hk7XevwLBNTSTZNYJWuL8KOg/GpLn1H4WTJjNiuIszgc=
X-Received: by 2002:a17:907:2627:: with SMTP id
 aq7mr37954593ejc.483.1635876427144; 
 Tue, 02 Nov 2021 11:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAHFBhiah1NgozmGWtTgvZEfhyxDNA0EySiZao+fsK-Z9_1QLpQ@mail.gmail.com>
In-Reply-To: <CAHFBhiah1NgozmGWtTgvZEfhyxDNA0EySiZao+fsK-Z9_1QLpQ@mail.gmail.com>
From: am2@rcsnetwork.com
Date: Tue, 2 Nov 2021 14:06:55 -0400
X-Gmail-Original-Message-ID: <CAHFBhibg_LDeUZ=96d2u=7kh2py0zC5Abp_L0S7Krd2xptZOyQ@mail.gmail.com>
Message-ID: <CAHFBhibg_LDeUZ=96d2u=7kh2py0zC5Abp_L0S7Krd2xptZOyQ@mail.gmail.com>
Subject: the format of the specified network name is invalid
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 03 Nov 2021 10:53:18 +0000
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

Ever since the last update to the windows client, I receive the
following error when trying to start a tunnel: "the format of the
specified network name is invalid" I can connect using the android
client and the windows client worked fine before the last update so
I'm pretty sure it has something to do with the windows client    Has
anyone else encountered this or know of a solution?  Wireguard is
basically unusable from this client at the moment.
