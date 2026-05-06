Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A99CD342C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2026 21:29:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id de09bf10;
	Wed, 6 May 2026 21:29:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id dcf97d7e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2026 21:29:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5AB876015B
 for <wireguard@lists.zx2c4.com>; Wed,  6 May 2026 21:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA0C3C2BCB2
 for <wireguard@lists.zx2c4.com>; Wed,  6 May 2026 21:29:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="CurjfMu1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1778102946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2GQ/V9t+WF8bb89Jnh9anZLP3lhr/pzdT4FWf98ZcQM=;
 b=CurjfMu1lmhpddWRiTwJjBB2gcO0eSr5dVq5h7J5sPASvcPSynXS4Bb/TzUpt6N9rhBQBI
 PELr4GSC/y6mGhranI5MFxhuup9upMT4j5ldtjv/mIQEFayHmKBvAEC4PqMp+m7wqzQhOE
 Vx3Lu2VIObU4PwgCz1UMxYrW1NeX4YU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9a96da93
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2026 21:29:06 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-8acb3dab8dfso811216d6.1
 for <wireguard@lists.zx2c4.com>; Wed, 06 May 2026 14:29:06 -0700 (PDT)
X-Gm-Message-State: AOJu0YzmGgbbBQR7vcfZ+0J1oC+4qAkbfg1xv+gPfCptX5lAOYQ+1Fj6
 f89YpXCDDMQPeWzW4+k5iz9W66wqLV9DTY76FnQn8souKsn9XPfAcE6ge22Q9mmX8+Vil6Ps3Fs
 JAKnVo1bSnbcq1YlR3SlYGdwRFX/F7tw=
X-Received: by 2002:a05:6214:226d:b0:8ac:a5a0:481 with SMTP id
 6a1803df08f44-8bc4249d8c3mr74410276d6.4.1778102945444; Wed, 06 May 2026
 14:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251020142254.16546-2-florian@uekermann.me>
 <afiJFxeMxJw-n9-G@zx2c4.com>
 <8358be3e-d696-454e-a970-2305f23fce2f@uekermann.me>
In-Reply-To: <8358be3e-d696-454e-a970-2305f23fce2f@uekermann.me>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 6 May 2026 23:28:53 +0200
X-Gmail-Original-Message-ID: <CAHmME9pFJyEtgrYLv2h-SFKLuRCwsv=SoMjhteFZPh4B6CfHBw@mail.gmail.com>
X-Gm-Features: AVHnY4JGVBXs7O5W2ubMY1hewk2IQ5z1Sm1fyZ6bNqjpuEjB8rUcUof9XHhvxlU
Message-ID: <CAHmME9pFJyEtgrYLv2h-SFKLuRCwsv=SoMjhteFZPh4B6CfHBw@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: fix darwin MTU detection
To: Florian Uekermann <florian@uekermann.me>
Cc: wireguard@lists.zx2c4.com, A Jonas <jonas@chaincode.com>, 
 Carl Dong <carl@obscura.net>
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

Hi Florian,

Could you test this?
https://git.zx2c4.com/wireguard-tools/commit/?id=a998407747005ea7e4e0258d96f105c97241e1d3

Thanks,
Jason
