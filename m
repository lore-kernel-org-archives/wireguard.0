Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A3FC433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 Oct 2022 13:45:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 707aa002;
	Wed, 5 Oct 2022 13:45:45 +0000 (UTC)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [2607:f8b0:4864:20::1134])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3eb9adb4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 5 Oct 2022 13:45:43 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-358bf076f1fso94435717b3.9
 for <wireguard@lists.zx2c4.com>; Wed, 05 Oct 2022 06:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=LJtlqcYq2cr9n5Zs8wlYjGmSPvf+XZcW1pHg+BAYHxk=;
 b=WdK2fqxA+L7syT/ooqpuJoOi48bIV9lnfhP/DzI4hWxgFL10H5/7AC6Noz06jdx7jU
 upbPQJXqNYIfiZydUHcF/ykXbZomiln1WMdZYv2Yfq0PfXoWDfIszLaF1tMHQwaLDDfJ
 l0MJcRQnEoV5iEk/8ZNRIk29+wyjFzucQctsFCdpFvA7J13TCNlXLsZVG6g8NQSvv5Lh
 kaJobGiGbuu+9+zDgD3T9NCAituUNp9+lcATMU1NwubwL51Rn1S9XqpQ/zJv6Mod9Rmn
 eu2e/iAPmvDiiKsho+PHcnUs8dglCXurzkjo+sdPF9xwh77SsbfmSyfxJAbQ5Tf16WNY
 PZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=LJtlqcYq2cr9n5Zs8wlYjGmSPvf+XZcW1pHg+BAYHxk=;
 b=oDwKzw8fiAHa2LEx1hs0fK6gSmlH2UaU6j4a/Q77v/qpJay1Fvo84kgCV+98VzRXBW
 TfLPaMAYzrxodQcCbKeHJQCTXqIJRAeCRKMmoQpXHdtK2PGDC5Bq1scyfqaZk0cGUK9u
 P7a1Cb6gCdZ5Y9em4NkSfKXg8/m1IZqs3hkyVCvzoNXX3y2LHq/UkbpJjrNBMUJij7Sr
 9Zn7gMM/fUwA1FWfj/T5PyB1gsNsrfqjFk+d9cbs6P0/pPai3YnmwpRHVTfcLq+z/ozy
 a63t/A74i45VRX7O0S5w+ta4K+T9jMLLhKDbuKvjNOd03WPmlFdcvKxhBQxlSdaVCbFw
 KPrQ==
X-Gm-Message-State: ACrzQf3l4mBrttb6gq3uMJ7UjAxMI+GgJrW1QQjwdhUW7Lb8GN0LLYDt
 1vXo1/YYOhqDtpX6+AKzQDaynR9UbNEAcUleNYeqye68AhQ=
X-Google-Smtp-Source: AMsMyM6bODdCkk/6INMwFDlIi/HFeD42NYnKC4zH0RftLHc5kfCwLcmgA9ReHH+tBYUd6pBD/hWlmCNrgFlSG3NUtHs=
X-Received: by 2002:a0d:c342:0:b0:348:ffae:6d7a with SMTP id
 f63-20020a0dc342000000b00348ffae6d7amr29137675ywd.329.1664977541702; Wed, 05
 Oct 2022 06:45:41 -0700 (PDT)
MIME-Version: 1.0
From: Michael Pro <michael.adm@gmail.com>
Date: Wed, 5 Oct 2022 16:45:05 +0300
Message-ID: <CAA+Mow5=Hb-BfEHPG7-L+dagE4rEke8dmH0qXuKtZBeYkxBdPQ@mail.gmail.com>
Subject: Wireguard not compile, - udp: typedef udp tunneling functions to
 functions, not pointers
To: wireguard@lists.zx2c4.com
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

https://reviews.freebsd.org/D36724
https://cgit.freebsd.org/src/commit/?id=bb77f0c2049311f0661c2493838d81a5a66c449c
#> uname -K
1400072

in wireguard-freebsd/src/if_wg.c:
rc = udp_set_kernel_tunneling(so4, (udp_tun_func_t)wg_input, NULL, sc);

change to:
rc = udp_set_kernel_tunneling(so4, wg_input, NULL, sc);
