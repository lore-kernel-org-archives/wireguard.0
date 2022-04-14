Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEE51C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Apr 2022 12:08:50 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 8670d4da;
	Thu, 14 Apr 2022 12:06:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 42770c0a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Apr 2022 12:06:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2DFEB61BAA
 for <wireguard@lists.zx2c4.com>; Thu, 14 Apr 2022 12:06:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCFEC385A5
 for <wireguard@lists.zx2c4.com>; Thu, 14 Apr 2022 12:06:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="WrIX3owo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649937977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GZ1BA6TpHPMsY58vHmext4YwmrVTXLAF1tsLrMoMkc8=;
 b=WrIX3owoGN9CDDtth8T7LUvIxFATx07ce+2Uweo2wy8ERCuOIikVZQci/pPWgqjhM7yg1O
 gucQz5LGVi8DDdZcHb/XXHf3gMWvxYV0dRdWIBJfR0FOmNd544tMAiaDTJa950IEvTkqjq
 Ju8jgoE9Dge6siJJO9/mZYd4dLtzC/Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4333667b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Apr 2022 12:06:17 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id f17so8964281ybj.10
 for <wireguard@lists.zx2c4.com>; Thu, 14 Apr 2022 05:06:17 -0700 (PDT)
X-Gm-Message-State: AOAM530rFsxcQyitmczLCVgGnGGf9O1gU83bVq3klIWsNXtO0IG920en
 vVi4/7s3pIElW1k7RAXCBDhpikt+MyT7PK2UIZs=
X-Google-Smtp-Source: ABdhPJyqUFFKSzuWQmKd31Q61BMpomS7L/FGgsv5ayCAaemFit1pLM1Ox0PpNxZ/9vj+KWrmK/e2k30jVk6QmAoFzkY=
X-Received: by 2002:a25:b905:0:b0:61e:23e4:949f with SMTP id
 x5-20020a25b905000000b0061e23e4949fmr1484880ybj.373.1649937975177; Thu, 14
 Apr 2022 05:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220414104458.3097244-1-razor@blackwall.org>
 <20220414104458.3097244-3-razor@blackwall.org>
In-Reply-To: <20220414104458.3097244-3-razor@blackwall.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 14 Apr 2022 14:06:04 +0200
X-Gmail-Original-Message-ID: <CAHmME9ouN0O-mfi4d_xVon_SxzE4hbzdD0Zm8hRLS4k5C3dPFw@mail.gmail.com>
Message-ID: <CAHmME9ouN0O-mfi4d_xVon_SxzE4hbzdD0Zm8hRLS4k5C3dPFw@mail.gmail.com>
Subject: Re: [PATCH net 2/2] wireguard: selftests: add metadata_dst xmit
 selftest
To: Nikolay Aleksandrov <razor@blackwall.org>
Cc: Netdev <netdev@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Martynas Pumputis <m@lambda.lt>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>
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

Hi Nikolay,

These tests need to run in the minimal fast-to-compile test harness
inside of tools/testing/selftests/wireguard/qemu, which you can try
out with:

$ make -C tools/testing/selftests/wireguard/qemu -j$(nproc)

Currently iproute2 is built, but only ip(8) is used in the image, so
you'll need to add tc(8) to there. Clang, however, seems a bit
heavyweight. I suspect it'd make more sense to just base64 up that
object file and include it as a string in the file? Or, alternatively,
we could just not move ahead with this rather niche test, and revisit
the issue if we wind up wanting to test for lots of bpf things.
Thoughts on that?

Jason
