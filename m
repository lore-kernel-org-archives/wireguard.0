Return-Path: <SRS0=H7Gu=WY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49B5C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 13:42:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BAE920828
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 13:42:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="F30QYhJc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BAE920828
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1204180c;
	Wed, 28 Aug 2019 13:42:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 254c2927
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 13:42:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 801ecf61
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 13:42:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4523af6
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 13:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=FRpSZjxHfLfTtHtC+ksC3sT3zvs=; b=F30QYh
 JcTNDYuot5QX7c/mE1m/HFPjjTCa1vL/xsAgh+eE61Z0XiRoE3sSwyv0uuBUyGmz
 L0DP1EfihVnPoFHs6Vs7UlcXW3CAqNkU9vu2n5uVIkfDH0AGujYvG1a5LTQD2Ntk
 aGBT1popeSuVGnyLJJbpN/1+drtkiLLJ0f8PadM/3L7vthwQup/ix/QiW7b8aPEp
 v4Khs82/NwTSioW2Um0QP3+65RPkpoJgaBx1jeNxZG3Kxl1zvVo1QQStCgPRWeHV
 wQF/P+cnTZqw5zTgv/oKI3enqc3C61cWnBKXzpEH/2UfyviaT/XIx1ea3p+aO3x7
 N+DSb42L0pMGrzZw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8ee7ef3a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 13:00:33 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id g128so2142262oib.1
 for <wireguard@lists.zx2c4.com>; Wed, 28 Aug 2019 06:42:44 -0700 (PDT)
X-Gm-Message-State: APjAAAVPcIlu0q0Xm7rPeQ91XjensTfu+b1UrQ+vFIVet9lbF5eftPac
 2Paa2m4DDoZDTz98UlDDgTGvAOAPmKzRGYJBHRs=
X-Google-Smtp-Source: APXvYqxPJaOSY8r6bfw8Sd+L22nPp0o+SdglferAabwUq82wSWaL0KY5aFoAN9MDUD/WD5d35meCaq2FqWsDjPEAKow=
X-Received: by 2002:aca:4a53:: with SMTP id x80mr2737857oia.115.1566999763371; 
 Wed, 28 Aug 2019 06:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190828130125.2261931-1-mikkmar@airmail.cc>
In-Reply-To: <20190828130125.2261931-1-mikkmar@airmail.cc>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 28 Aug 2019 07:42:32 -0600
X-Gmail-Original-Message-ID: <CAHmME9pOoQ6xRWeJaq43BWMheoU8mN7=R23i1mjJMCc1XZwx5Q@mail.gmail.com>
Message-ID: <CAHmME9pOoQ6xRWeJaq43BWMheoU8mN7=R23i1mjJMCc1XZwx5Q@mail.gmail.com>
Subject: Re: [PATCH] Makefile: rework kernel version logic
To: Mikk <mikkmar@airmail.cc>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Merged as: https://git.zx2c4.com/WireGuard/commit/?id=dcca03f27879701d7377109517176a3aae86619f

Every place else uses KERNELRELEASE, so I've changed the variable to that.

Thanks for the patch.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
