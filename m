Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A155C46CD2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 05:01:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9529d67;
	Wed, 20 Dec 2023 04:58:55 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c3ee58f7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Aug 2023 08:15:43 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fe10f0f4d1so6921017e87.0
 for <wireguard@lists.zx2c4.com>; Mon, 07 Aug 2023 01:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=opera.com; s=google; t=1691396143; x=1692000943;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LUPebdIVZELpnuojpgPe1s2IpoMcZ4ONIAq/fW8Qm38=;
 b=brqUWdeXiIcE0chav/d4V81A0hR2JCtti+HVJxwcfbfQ9jBAOmc8fmYAwrV6YnopBs
 +OxA0mF4VLso3Jc1O3dcti4ymK0mutzAH9qJEocCGDtcW16TGapl2VXoIwv+niDkH0Rt
 QmyW/5w2Ng3mZX+PXSUbVcxvENeWU/swvoqwcNG1pLiBtbfvNer+JC7T+O5E4rTlLygj
 NCy0Yuh8sCYasBf/5egpD4oFDaW1n/MHkLE93C/vnClibZ5/HKpg84Us6czgve1vt4Sk
 3kN4zXObejuCCjszJYnEWle4bvM6z3+B+yJX4WUuL1SrAKEPLEVt8NHKXsH1lYQiaQ47
 gX4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691396143; x=1692000943;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LUPebdIVZELpnuojpgPe1s2IpoMcZ4ONIAq/fW8Qm38=;
 b=UaFrRTe9PZc6GFEoFPo4kDS7xXXSH6bezsNXkM/fDFrvb+8n8UgP0uwsjwLVjq/c/6
 zJQVf5zbjC9xB6MNlkiqIauR3+Z+5Zju6typ8KN4ccXRSJC15FlotpgKmUTf61I81bfO
 ZbC4op5UjaKv3p7ucsWmzzhyRKKmiCOftAr24V2/dJeHyXjHiKURRwu0swS4NA38xFfP
 L7vj0aMVlbglwkcR/uuLpifOEaaS5URgF1YzPBYsdhzouoyMjGvaRqm0tPyMmfU5zpKs
 0az2Zm8bonk2sCnhpY9MMxw3b6WUZmA8cpEHsZAJl7FvpKkt2qKzhl2IhbPFSrZ8iqGm
 DWcQ==
X-Gm-Message-State: AOJu0Yx/5d1dVRnGo98DoVowxXB3Wwae4JD2LlU62mcm08xC1y6HG0Ol
 thyqmRcb1FJCZIgmqoMHxWV+23c7Yz1LpRxUVXaKDyKKJxVCUXrE3zI=
X-Google-Smtp-Source: AGHT+IGiaMkc68FSd8LeQErloTcQgAHbSY00QLFUvAlTx69sp/NwKSBKldafEESjW292VrbLqZeNzOi59atq4hr/srs=
X-Received: by 2002:a05:6512:4886:b0:4f8:e4e9:499e with SMTP id
 eq6-20020a056512488600b004f8e4e9499emr5326718lfb.12.1691396143006; Mon, 07
 Aug 2023 01:15:43 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Lazarenko <danielo@opera.com>
Date: Mon, 7 Aug 2023 10:15:32 +0200
Message-ID: <CAL77Jid=hbH6fQw1cWJW+VifyQ-+9-VORpuO=5R+uGDR5Yu8ow@mail.gmail.com>
Subject: Xcode 15 wireguard-apple build errors
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 20 Dec 2023 04:58:44 +0000
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

Hello. We're using wireguard-apple for an iOS app. We're using this
library in production, it works as expected built with Xcode 14.3, but
we'd like to start testing the app on Xcode 15 to look for potential
breakage before iOS 17 goes live.

With the latest Xcode 15 beta 5, linking WireGuardKitGo library to the
WireGuard Network Extension target produces an error:

Initializer pointer must point to start of function (no addend) in
'.../Library/Developer/Xcode/DerivedData/MyApp/Build/Products/Debug-iphonesimulator/WireGuardKitGo.framework/WireGuardKitGo[arm64][2](go.o)'

and a warning:

'.../Library/Developer/Xcode/DerivedData/MyApp/WireGuardKitGo.framework/WireGuardKitGo[arm64][2](go.o)'
has malformed LC_DYSYMTAB, expected 61 undefined symbols to start at
index 4624, found 73 undefined symbols starting at index 15

Is it a known issue? Are there any existing fixes or clues to help
fixing the problem?
