Return-Path: <SRS0=fvuZ=M5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5122C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Aug 2021 19:11:01 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07CA260FE7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Aug 2021 19:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07CA260FE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5999cd24;
	Fri, 6 Aug 2021 19:10:59 +0000 (UTC)
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [2607:f8b0:4864:20::936])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 15fe38e7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Aug 2021 00:35:26 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id 91so2906461uas.10
 for <wireguard@lists.zx2c4.com>; Thu, 05 Aug 2021 17:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/B1ABBTCIYMCMKkk+e6Iag1HAhEOO0+bxYT9uBR5CHM=;
 b=fbwUmsr2hC4F0T3BOvmCbn0xrqRDfBywBQ20AFrV2fhA87R5NeLk7euefvKZZcs3P8
 VWgcR5TyE/Hen+y5U6CVFoTYY6gErH2Eex9ET8xezF8/Xa7iuJ3+8yNjafQNA/try7Rv
 SrVzpL1WmMIKNKsnLcPivUAysKY1gdIpnxJB8bfQNm8WjSH8jsBktFw7MY+EUyKygyLG
 yRb7iHyUQlcBpM9vG2aCmW6ebnz7JF6gtGOq0rmW4o7vs0R+NRSX6pGxep6z5B3H4ATi
 NWGFBygrD0JdTWW2U2vZqeTbmF82WP+pFIEM8BRBHyOteCdZO1QSjIO3RSOI+EuaWAs9
 GkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/B1ABBTCIYMCMKkk+e6Iag1HAhEOO0+bxYT9uBR5CHM=;
 b=lu80MwfJp6LdUwazT5JkZImS8h4CI51pIapCsqvFPyP+p9ybnlbAyZ2IDneGi2DJWr
 UMGhhR5d2D6UdAuA04aAfW/8tyrCR5xQEC5+OQ7qS7ykXNTRs3vueM3d5fd4auHM+30T
 m0b1tE9Q0x5mxZQwpDwoEcNQ00HlyakiGuw0i7bUyTk4JPubjoiQ2iF9QS7vMRZnDuWc
 RMd7uUnronnoF8hKFAj+Xu7KAL6CwnCQI5AlQWSU17JKFVstorW09Jf8+pnbjcQkDS5I
 +Tn2JWwxmYxvgQ4SC135jYV1rRmX88RWMobZOruU5FYhSQRiOPKyLVozOLD/QPyCkzxt
 zz7A==
X-Gm-Message-State: AOAM533e+JmwS588wk97owwbs0Imhh4g+8zRa5eTR/L/CO2XcsozyiZG
 oEhULm7ekaeLCjGAfA87HfdG+m79T2Oq6AAkUbvwKzaDxo0=
X-Google-Smtp-Source: ABdhPJyKOQrVgLyfy1Mg7QrX6cy13/KQoAWhTCZ5gB+9sy7i89XmwpD40tE8JkdTkPCtoGtIaZw8Be7AwtQY7dy9BP8=
X-Received: by 2002:ab0:7c6e:: with SMTP id h14mr7073137uax.14.1628210125184; 
 Thu, 05 Aug 2021 17:35:25 -0700 (PDT)
MIME-Version: 1.0
From: Devanath S <s.devanath@gmail.com>
Date: Thu, 5 Aug 2021 17:36:17 -0700
Message-ID: <CADjMg7WdL97oX=RfxP11tPmca2UqM2ST-QpG9m7GXp3fmKQUTw@mail.gmail.com>
Subject: wireguard tunnel UP/DOWN registration
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 06 Aug 2021 19:10:57 +0000
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

Hi All,

Is there a way an application can register to wireguard to get tunnel
handshake successful/failure events.
Plz suggest.

Regards,
Dev
