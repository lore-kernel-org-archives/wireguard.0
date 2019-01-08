Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4FEC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:04:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6424C206B7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 02:04:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="h2Y9e094"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6424C206B7
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdee4381;
	Tue, 8 Jan 2019 02:01:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 770bbed2
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 02:01:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42480d40
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 02:01:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d01a3adc
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 01:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=D2ITCL2edl9MSRyht1re1ZKtOAE=; b=h2Y9e0
 94cxRJX9SI9esZVN0Yx52L3D2hzlcnSS/kD361BMmGHIPKNX5LZGIVwwuVRtAaq6
 y6a9q2GMkaG31rNByiLjyHCIE3xcXkq9RKQKaNzkQR+tiS/EGyzCuqA9bThCttIu
 9bEoa92csuCdfk1uqHt+mv6gpfQnM+4WgEfsU0W1OvrpBu87tF0+k0+HE5MNasW1
 a34U/g+9ClK4h7wtPiKnQN26dHEa9yqi8OAMPcUa6TmFp/BrOhRNye7shryl25N2
 qPzAMBXQhgP+S4EMCHTrBrZihlvRxDHN27RdNqOd+AYm/DlQOY9nVkGSnPUBTvuY
 CReNT8qFTKyO2yAA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 85067ce5
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 01:52:29 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id x23so2099279oix.3
 for <wireguard@lists.zx2c4.com>; Mon, 07 Jan 2019 18:04:49 -0800 (PST)
X-Gm-Message-State: AJcUukeee4E1FOKCe5ytYxvQFTfZM113jAIwxkWObw6+I6fAvaoQF3JA
 9NAWpZ9qb+Y1RFkW9vEFcXUIGMWXSFJMfMsc5qg=
X-Google-Smtp-Source: ALg8bN55Dka15NWtwtNJ7ATAdpbGnG873pGMVu4gd4rkyTm2QXXAKWPzmm+5QlYlhvOyz00wzzOVhzaKKnf6NxiUobY=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr9830735oia.278.1546913088651; 
 Mon, 07 Jan 2019 18:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20190107105727.GH51930@gmail.com>
In-Reply-To: <20190107105727.GH51930@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 7 Jan 2019 18:04:37 -0800
X-Gmail-Original-Message-ID: <CAHmME9oA2bSzGXzB7ACfsKewy4gjHGr3z8aPwNVeOOOXopyMWQ@mail.gmail.com>
Message-ID: <CAHmME9oA2bSzGXzB7ACfsKewy4gjHGr3z8aPwNVeOOOXopyMWQ@mail.gmail.com>
Subject: Re: Correct capitalisation of IPsec
To: Raf Czlonka <rczlonka@gmail.com>
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

Thanks.

https://git.zx2c4.com/WireGuard/commit/?id=11d1b7d339f46fa70750ebc2fffba76912db056a
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
