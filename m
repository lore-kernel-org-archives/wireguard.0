Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C95C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Jun 2022 07:43:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c9d622bc;
	Wed, 1 Jun 2022 07:43:24 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [2607:f8b0:4864:20::22f])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 32db533c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Jun 2022 07:43:23 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id v9so1623769oie.5
 for <wireguard@lists.zx2c4.com>; Wed, 01 Jun 2022 00:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=3LF2rzFNN8B6M1ogfC+NqwMhrDOe98N1rwDrBZDxVZA=;
 b=PQ0HRcJGhEtjJZ4qxQUpDRV/Yhw2ouRpiUQH3XTKE1M1vEbIJdhWVa03XBIY+DEftu
 2pbxIYy96AA5kCzbeGq/Pd2jOECiageF+KFAdXiXHWXs68QxXUQQUHrCGBlNeVMBQYNe
 wtqky7VsBvugt6LkZ94jRA1Ehy2GVsOJIcH3J4LJdY6139P3aYxXHRkXqAnml3jvl1Jj
 4kyBW5iBWbbr51paRFswxK2svBe7+AfWlb/yccvOii0fXPlnTnmXLmj3zqet3JxT2uFl
 DQOa3L6kUf/VGbKTPAnKcqauhQPebB6Dl92xXRNn9IfcHWw/szRJ1R2MV1/IVe/rOHI2
 dFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3LF2rzFNN8B6M1ogfC+NqwMhrDOe98N1rwDrBZDxVZA=;
 b=kZGEzh8d4xZgQEac7UCy9N7neNHue8azjC5IzStHUc/81/0r2nbZitRAmG25+ald1l
 0F4LoyR3wdJI9Cu32c4PajfTD91M6r0gNBcYYD9DGWNeRt6MrdRgtZ1FWJW30ujHN6xD
 53/avf3ImhcOUgnxD4ZyY5VkzABtUaNqgzOkxTUN8EmxUu2OkTOdL46frJFsWu+mMWTR
 OIgg3rw7xG+IWn+MuBHWa8O7r07VimurpMztxVdtwIWpP6fAnOt1QPEqKwbuof2Sb8iU
 y6Pr4KucSSxg0ku3cCRyCl7fPYH+Y1ZoFpqiwmicM2Uhi0bp6wc2S3cJ+6mzuCl+suAO
 NP5w==
X-Gm-Message-State: AOAM532508j1yIUyB1mZF3mbcvNvH8W9JxwrNemZ4H9J+FgegiAGKgrF
 BegBIgPgxYYre43NLiW/xls1MYLfE4p4FpnFH401H/4J
X-Google-Smtp-Source: ABdhPJwHNFzS47F2Vp0vay2mqfV3Qqhw+k2J6zsVnumExEfDbqwgSvJyXPUKSeCkTJczSo/jQfq5FSTQKCRPXd2oSL4=
X-Received: by 2002:a05:6808:1453:b0:32b:84a4:5a49 with SMTP id
 x19-20020a056808145300b0032b84a45a49mr15019612oiv.105.1654069400209; Wed, 01
 Jun 2022 00:43:20 -0700 (PDT)
MIME-Version: 1.0
From: Houman <houmie@gmail.com>
Date: Wed, 1 Jun 2022 08:42:44 +0100
Message-ID: <CABBZOs=CRGXaYmajx6GLJMU0sxZbda=qDgKsiB_KM_k3DygCJg@mail.gmail.com>
Subject: How to improve Wireguard speed?
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

Hello,

I'm compiling the latest stable Wireguard on Debian 11.

git clone https://git.zx2c4.com/wireguard-tools
make -C wireguard-tools/src -j$(nproc)
sudo make -C wireguard-tools/src install

However the speed is not that impressive.  I have a VPS with 4 vCores
and 8 GB RAM on 1 Gbps network.  The VPS is located in London and so
am I.

With wireguard enabled I get 117 Mbps
Without wireguard I get 506 Mbps

That's a drop of 75%. What are the factors to improve the download rate?

Thank you,
