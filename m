Return-Path: <SRS0=38ps=PI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC467C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Oct 2021 06:47:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07DC961074
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Oct 2021 06:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07DC961074
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5241bcc;
	Wed, 20 Oct 2021 06:47:34 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cbea754c
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Oct 2021 06:47:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F26EE60F12
 for <wireguard@lists.zx2c4.com>; Wed, 20 Oct 2021 06:47:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Cdu+eLAl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1634712449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B7pG/ApSMcrIpOKL16l5ItSOpbRJljB470b0SrgLsUc=;
 b=Cdu+eLAltakmkKEIOKnyiv725GQbd6/KPVfO4qOEue3eTLIbRtH6z0H1nzQ+Tf1NrIMAtU
 UU3oqKB3f/D5MAk+3ejCAN/wRkvLw+1OUEezRWQKjhq7a6ty5r3yLGXshKtNLKHMQrfKeq
 O1yWUFedohrseOxS2qomh3FtVCaRe5E=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9d9f5c23
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Oct 2021 06:47:29 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id i84so8829236ybc.12
 for <wireguard@lists.zx2c4.com>; Tue, 19 Oct 2021 23:47:29 -0700 (PDT)
X-Gm-Message-State: AOAM533996dmFPX2+B00pFOLVYpeIdeR4+k9Xgu1muYSvJE0mEUxRwBh
 ikyG3iUsjvqlnHUkN6HDj0KaL8IyJQX2Bm2/2W4=
X-Google-Smtp-Source: ABdhPJwZfoRYFtDSWKWUGPN0WghyxV2Z6E4/A/aCvQlgvxNzhM/InOp9dHIO2AfWeMtRK1l+U3b83M0KBRQ2EvaRpes=
X-Received: by 2002:a25:d047:: with SMTP id h68mr39926016ybg.416.1634712448713; 
 Tue, 19 Oct 2021 23:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <PUlmptu_AouCBnZfF_b_qSr6iE0vwNlZcQ_cB0u6vFmJ4i5zhrYhKm6LCU5z7-0VU36m-8CsjgP2pkdpymQ9B0oPyZIkvVlb3_4tjYAzN5o=@protonmail.com>
 <XcnYGCQFb8CjcIVfX4jdbb9vwXO0M2pth9Laor075LAPBtKtgQnb-D-NbmvnhEZL-BJfsTIR8V78CAVgJkcy7iN3WUecL78NssgR53axTEo=@protonmail.com>
In-Reply-To: <XcnYGCQFb8CjcIVfX4jdbb9vwXO0M2pth9Laor075LAPBtKtgQnb-D-NbmvnhEZL-BJfsTIR8V78CAVgJkcy7iN3WUecL78NssgR53axTEo=@protonmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 20 Oct 2021 00:47:18 -0600
X-Gmail-Original-Message-ID: <CAHmME9qXEj8zeSrv5nww4eavuCpRHoMqF-dm8i9Z-1aR3WwFSw@mail.gmail.com>
Message-ID: <CAHmME9qXEj8zeSrv5nww4eavuCpRHoMqF-dm8i9Z-1aR3WwFSw@mail.gmail.com>
Subject: Re: Access violation exception on windows
To: Mindaugas Veblauskas <mindaugas.veblauskas@protonmail.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

Thanks for the reminder.

Fixed here: https://github.com/golang/sys/commit/0ec99a608a1b8e24d6a2554b64f4208e8e5caae7
With a followup here waiting to be merged:
https://go-review.googlesource.com/c/sys/+/357250

The process now continues until NtTerminateProcess.

Jason
