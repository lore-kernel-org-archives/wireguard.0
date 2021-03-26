Return-Path: <SRS0=AHPd=I4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C521DC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Mar 2021 08:38:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A61A361919
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Mar 2021 08:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A61A361919
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4472210;
	Tue, 30 Mar 2021 08:38:20 +0000 (UTC)
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [2a00:1450:4864:20::541])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cb1d2782
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 Mar 2021 05:43:34 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id b16so4942996eds.7
 for <wireguard@lists.zx2c4.com>; Thu, 25 Mar 2021 22:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xGfY32MwzvukwIc/LS98oK1H1Fwd2uYho0erZD6HiEY=;
 b=TJ9AT7gmNAA0qOQV6mBS5dYQ+kKGD2eHmZbUC2XmMaPVmtjoNGVn0ZDsBLtehxK/gv
 qFXcPpX7X6G+6jNp6hs6FCv7IIp8gDheveCdGuKhBgwhuYutg05XyI9l78CnTplV7S4Y
 IMNCF02EMyDEt0hOSN2VkVFwFiJTge/mHpTINvAypOg+kBvfAqKRbnNKYHCd6V2JOCMA
 vh/1xnQl5ieHE6jAqeGSTY3WZcbiKhtW/mf5txaIJD1Khi/dixmhEV6D6bPZcUECq7cu
 Vl51sZ4zeqAQBdSorb4dZwYZFWt0pOPG34DdMNPxgok1o5MOGcalej7y9yLAjdELd28C
 sVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xGfY32MwzvukwIc/LS98oK1H1Fwd2uYho0erZD6HiEY=;
 b=W1cc/ik6D3LuphfoTnhdeWRcbpzV1vCCDvHD9XXVGfH48klPhzWSeCgMzgQw9Rod3o
 3GLGOLTcSMUMY9ADssTrrfIB5IkCZqdivUCKY3CkCsW32Fwg4Fp41VEWUjt7G7trvTZW
 DhQpZA5+jpmMuOtF6vltjEK8+iIzqTTjOJ3nU4dWnz3xZsJG7BlQKNyVp8eQ40daXebG
 NSl/pTI3rfUG1oWSYKHTeWitcuq96vREx3mjVGqf+0HqDtxHcIrfkxton2bD/WRJk8n2
 YoUWgDeugsbisc7BBo4+ND/9KQfaecMFWFtfbWAR5v9k785hyHbwefDcY5FZEmw1EfZ/
 YUkQ==
X-Gm-Message-State: AOAM531p2/HjS3RrW4h74r1Nm9OdMzdrgm0AngEPkbdAjo+F18MfllaT
 0hWDIzUB9pRUodLYoe5GTq1zZTSiQGEKGMQtVpTevw8e5YU=
X-Google-Smtp-Source: ABdhPJxifKZPmf03kbFmoB2NQOwOYvDj5UKAkqkNg7b5LCPvn0LlB/psCOeCecPfO3PsgU6rFuW6VMNI/+ujtAplG0c=
X-Received: by 2002:aa7:c916:: with SMTP id b22mr13155528edt.299.1616737413901; 
 Thu, 25 Mar 2021 22:43:33 -0700 (PDT)
MIME-Version: 1.0
From: Matthew Poletiek <matthew.poletiek@gmail.com>
Date: Fri, 26 Mar 2021 00:43:38 -0500
Message-ID: <CAJhSV8sPbHOWXjmCchMr=q3_bQatDMuxzcn2i=PVuyyQChnfhQ@mail.gmail.com>
Subject: wireguard-android building the Tunnel
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 30 Mar 2021 08:38:17 +0000
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

Hello,

I'm messing around in android-studio and am trying to figure out how
to create the Tunnel for Backend.setState().

Trying to find documentation has been rough and I'm getting lost in the repo.

If anyone has any tips I'd greatly appreciate it.

Where does 'Tunnel' come from?

Thanks,
-------------------------------------------
Matthew Poletiek
303.810.9082
matthew.poletiek@gmail.com
www.matthewpoletiek.com
