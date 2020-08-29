Return-Path: <SRS0=L5sV=CH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=3.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF9AC433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Aug 2020 20:57:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F079D20774
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Aug 2020 20:57:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bukn-net.20150623.gappssmtp.com header.i=@bukn-net.20150623.gappssmtp.com header.b="MOL0hQXO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F079D20774
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bukn.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 817c2629;
	Sat, 29 Aug 2020 20:28:57 +0000 (UTC)
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [2607:f8b0:4864:20::22b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 97c9174c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 29 Aug 2020 15:39:39 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id u24so3401966oic.7
 for <wireguard@lists.zx2c4.com>; Sat, 29 Aug 2020 09:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bukn-net.20150623.gappssmtp.com; s=20150623;
 h=from:mime-version:date:message-id:subject:to
 :content-transfer-encoding;
 bh=tDDK/0+PufqmyrFOGBggFlcqdnTWiuQpix8KCByKiAI=;
 b=MOL0hQXOorzNsHBLSlw+mp8K1FntKC9Ttmk41/6RfFhQ2YmAthQ7AFGKeo3SYUrs2u
 EVlyE5Iwc62JNtV/2wyUnnwYIcVgav25QN4LJUvqQ03xbLw9HzPBZ7Sao4YJSzgUeEdl
 Epa+/ERNgmS145hbSeoq3zFaKmoTLUlcEl7jvL6x5pX2NjxfUNe7VbyyHThnAZLsOTNa
 m/UB8GcePUWb4ycNIKoghjU6jONa8diZ7Xajap8mKLzGAONL1NxwGUvBUTYg77rAhtCm
 JSsSM6NKdExRt1/pvyGCa89C6MMWfihKbVqbTXkZ/AWGte3TxjKsHdPg3ErnjK4Rka3d
 s8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:date:message-id:subject:to
 :content-transfer-encoding;
 bh=tDDK/0+PufqmyrFOGBggFlcqdnTWiuQpix8KCByKiAI=;
 b=C2k5ti38uePgWHaSIo4f3P7v8zNCO9HDGEKoW4iGJ2/XlGu6dgacDEk7jPYanSwr8j
 /1USOOu/FK6kcKwKGzJC4mpZKu+XVllxjeDIMxDMZTwwyKcu8Le0dgicES/8X0cMQr9M
 /x9rY5O1Py2wu59puuPQEDdCoyI3p3U/UFewfMHpGQZzzHN+rAUX+4jdBu221842d61V
 ypwbORFdE2hwlvJZNl/A2jHtWjpuqWL63v19tmbrGI7DeJ9FJ1vTA07g3bQxuRnHrZpX
 iIK7TUKe4wdtOcVaQ+B57gU9ZrVImkywZazsgauR3FuGmYWCvsr4CNMvkwpzulV7omIt
 p15Q==
X-Gm-Message-State: AOAM5334aOS0eKHuedfYLKdr9sSdnD0VBSME5tI4dbN+ZUTAi5tbyjLu
 q4rLgH25rR7lD4fftnlm0HG2tAglBC1Wh5mRQVapdVI9QhK9aw==
X-Google-Smtp-Source: ABdhPJxwsLzbTblXUkuBVvV94732W+6zqersH1AbCeGztKa1wPHFGhgpxCfDPsOcOyRsCZ135flePXRuRyA2Gd+XmgU=
X-Received: by 2002:a05:6808:258:: with SMTP id
 m24mr2327467oie.112.1598717235355; 
 Sat, 29 Aug 2020 09:07:15 -0700 (PDT)
Received: from unknown named unknown by gmailapi.google.com with HTTPREST;
 Sat, 29 Aug 2020 09:07:14 -0700
From: Aaron Bolton <aaron@bukn.net>
Mime-Version: 1.0 (1.0)
Date: Sat, 29 Aug 2020 09:07:14 -0700
Message-ID: <CA+oXxS2pqyYht7gA71vMK69i8RK0soX9fi-FiXqAK2FfTnSB=Q@mail.gmail.com>
Subject: AllowedIPs
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 29 Aug 2020 22:28:54 +0200
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

I=E2=80=99m trying to understand AllowedIPs better is it effectively a ACL
that day what is allowed down the tunnel or is it mechanism to
configure what addresses get routed down the tunnel?

Thanks in advance
