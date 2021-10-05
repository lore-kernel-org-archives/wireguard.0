Return-Path: <SRS0=nAhE=O3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4ABC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Oct 2021 23:35:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAAAB613A9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Oct 2021 23:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAAAB613A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kandoo.tech
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71eaf0f3;
	Thu, 7 Oct 2021 23:35:50 +0000 (UTC)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2932d6a0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Oct 2021 04:14:35 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id y23so41227554lfb.0
 for <wireguard@lists.zx2c4.com>; Mon, 04 Oct 2021 21:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kandoo-tech.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=Nt6viW1jUAqr+GliChnX3MxNipl0CYHZ58hLiHB++Rw=;
 b=Oo/0/nFNk8kRDxOngYQAywmcy1QEhMtLjXh2kaIZ9LfGT/bz72JlrijmoM/D12defl
 p1wV5J4FEbhqsHbZ0NV+zqlB/oRk5F7aBGe8nDdQpAbOsnr9B0HkddSpDI7sbOUCWNXp
 i/E9wy362dD+qS2ISwG7k/bRGQlfRVwSmNwFctQkGks2M6F/TqDBGIlgSz9ANTmptPVK
 51v+4puI/i9rmj6fd+0+sLWaFKhBKmc/6pFY+jKIYOHgBmSsIHnQ5i3+CLWetWByZGg9
 drOsK2/cFiHhJ2VUef6oktixW/JwkyHQweXrZIZmTQ7hn7u01k51SdGvLcEg4pg5cFSq
 b6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Nt6viW1jUAqr+GliChnX3MxNipl0CYHZ58hLiHB++Rw=;
 b=c8QjzxldKnAcfzmjsGDuIse1wRthlUYVCBVmKjAs2Wtxl6oQ68kMVFm93uFdrrCbsN
 LpvelwO2s/1HN+Py+gf07SGy6XNRVJV86uzCAbLCfROJFoH+Y15tu5GKlzys72v22Xwc
 XjU+yuAVCeYJKQDOLoyAGn2hlNBXTTS4wyJeRYvmOucaUDOP+jDqS0zMKYfn81yjE0Y7
 +niN2kvfgnSwZwK5hWMe+GII1bCz+uUC490VbLTS3pJuzZyR5hWIua/ytzeUfSCv/PjO
 4OdStSvP9jlj8C1MICsCzmIiZOpOVWykhTYkFwSw28LU92tmVktF5zRvHv3kIi0bmFw6
 +04Q==
X-Gm-Message-State: AOAM530akkB6uJQJSxFfNWb0oLGkUI3W/h0K2/x3YqhF+F85L623sxnW
 wxltRm+LiLojpLztcotRiMCKvpZU6zKemYgn4Q0qL5yALZmzUE7D
X-Google-Smtp-Source: ABdhPJx+GCW3ZFll+N5axQ+uZf6th4ElhZDj8nsr4Im5syoXM9wU+37XoZ9Ll0/01Rslf2xPXq0sYF6x6vkb45OXY9E=
X-Received: by 2002:a05:6512:c1a:: with SMTP id
 z26mr1091956lfu.335.1633407274542; 
 Mon, 04 Oct 2021 21:14:34 -0700 (PDT)
MIME-Version: 1.0
From: Nima Fatemi <nima@kandoo.tech>
Date: Mon, 4 Oct 2021 21:14:23 -0700
Message-ID: <CABXzbRfw6wCik1MR-V1Gx-F1sN+5xGdSZYQJGMqGchYPA1qYaw@mail.gmail.com>
Subject: macOS on-demand leaking during 'connecting' stage
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 07 Oct 2021 23:35:48 +0000
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

Hi there,

I was reconfiguring my network so I had a ping window open and
realized that wg on macOS leaks traffic right after disconnection
during the 'activating' phase. Figured I should give this list a heads
up.

Cheers,
Nima Fatemi (he/him)
President, Kandoo
Twitter: @mrphs
Phone: +1 202 318 1984
