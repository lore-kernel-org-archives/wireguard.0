Return-Path: <SRS0=kilO=AD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072D8C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Jun 2020 08:17:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F62E206D4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Jun 2020 08:17:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ii5V3VQH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F62E206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9bc4fe3;
	Mon, 22 Jun 2020 07:58:28 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id abe7990e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Jun 2020 09:59:20 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id q19so16134905lji.2
 for <wireguard@lists.zx2c4.com>; Sun, 21 Jun 2020 03:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=tWXkqyzMemCg7l8KuFBJZZ11INGyOoPXLQI8Wj6oaPk=;
 b=Ii5V3VQHfGZ5/4A3iwcmP8XV6rtMcJe1iibuJ5sqEdeoD6+OJMKL2WJPu6qL7NuXeX
 vl4YNFljMLf0G0tbeV1NKd4cFj/3gUP2r2MFJrd0n5a3FuKpDSPQdbokZP1shCOR1u/z
 W8iOuXSh+lf8GTR48TAqYy6Qsbf3aj07F5MvJs7bE1mKsJuyCQmE75PSAptrQg1/PVrW
 tlUPJd6VeUmCsR7dKjvDyESvyIbRC/23y6vlGI5hUJxj+K5Setgm2qdgIZ17e3kG2xZ1
 9/i3telysZ7jnI1bV421s57otWKorE0hBG2b3XYuwgN8zSVrDlrg8RhitPl/0S39nUl/
 uvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=tWXkqyzMemCg7l8KuFBJZZ11INGyOoPXLQI8Wj6oaPk=;
 b=DNazy+DRAbsnlxYuKyLnzkpX1MFCVuSSCnJnKB/eh3F9ykoTYbuJcpQYEkaJsv4r5D
 42UPLyT4GhZwfkv91BN0QpJeChRTZfuf1M15poLMufCnBZJiCkcClnQc9qWQx/CVydMe
 P+8Mra9uDe3JYlJCKfwqPJof8ThpjhZM8zt5XZaMKlFqB5u8Be4uzPeYQRkfvMB8T6e5
 jp5iuBq10MVJ4RXbx2vcd2HAyMPwhjECIvTSd5dmO1KEmF9x/S/PxMbWhIsrWdbQBYqB
 UoGaa24Cd67rrOXNA5HzzskaEFTXn/Ki6f9sYn2p9EGNUYEvsH6BjrSr1b8dJpmlZHJ2
 qSxw==
X-Gm-Message-State: AOAM5333jpDfOOckwihYd3ZKXF1uJZyqfVp9uvKLwUtQYvbN8tAvSr9d
 I3WuhJFJsJq/ZoTGc2p6bHHD5WCBKmBZLamtEsbUgeUw
X-Google-Smtp-Source: ABdhPJzqRYprJqGMwI9X9aeAV+Qn7Geb8vv+ARYwhKfCqB+2LSE01nhFitdbiVNsmhak07bbk591pA7r2BZVth7MG+E=
X-Received: by 2002:a2e:2a84:: with SMTP id q126mr6183920ljq.42.1592734674833; 
 Sun, 21 Jun 2020 03:17:54 -0700 (PDT)
MIME-Version: 1.0
From: Christopher Ng <facboy@gmail.com>
Date: Sun, 21 Jun 2020 11:17:44 +0100
Message-ID: <CAN5wt5r_qoLFrZM6T2CJ6UhQpcqFTqf5AHUugpe0rN5LuL3YLQ@mail.gmail.com>
Subject: Wireguard over VPN broken on windows
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 22 Jun 2020 09:58:24 +0200
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

I raised an issue on github which was closed, and issues seem to have
been disabled on github now so I can't respond there.

59e556f on wireguard-go breaks Wireguard working over OpenVPN on
windows.  It only ever worked in my private builds as there was no
public release of wireguard-windows that included  66ad537 (which
fixed a routing problem in wireguard-windows).  Now with
wireguard-windows 0.1.1 Wireguard over an OpenVPN tunnel no longer
works again.  I have triaged it with my own private builds of
wireguard-windows and 59e556f is where it starts breaking.
