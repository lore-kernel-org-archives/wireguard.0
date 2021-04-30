Return-Path: <SRS0=papb=J3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BD7C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Apr 2021 13:48:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2552961452
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Apr 2021 13:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2552961452
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c0643f6;
	Fri, 30 Apr 2021 13:48:19 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 42e469c9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Apr 2021 13:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1619790495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+cFWRtXRey9KXqJohiNgSXIKHEAfli+Jg7wtzGCdT4U=;
 b=EO/Tb4j0eQUpC+3CXc6HtMpHBmee/Xzw5nlWZetu6IZz+LiAAjqPbYoDyrwXtiPKNEg7XQ
 3d0T+zDhN+BAo+I1gMhUy5XC3G6IOeiP2D2PLEHuoYpDfZfCMPI8FdnIeLQ5soc0v6VrxI
 wy5llvnMU4MqUE0OC4Ca4Fuzdm6EF2g=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 756f116f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Apr 2021 13:48:15 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id p126so29539910yba.1
 for <wireguard@lists.zx2c4.com>; Fri, 30 Apr 2021 06:48:15 -0700 (PDT)
X-Gm-Message-State: AOAM530hUm17Fxu8gfvvPnysMKeg8G4joEymuVK7llnkb1qeP1wcEo0p
 GwnoDJwC98Ksor2BeZDjVUVRIq9prjroP7uxN9Q=
X-Google-Smtp-Source: ABdhPJz0zyKdCRFv74S8YrCnaulAH4w7NdSZtZiiTml1G3RxeihqFtD3tqErFJwEY1ZAmLkLcdKFJI99qb6OPj7IGwE=
X-Received: by 2002:a25:d247:: with SMTP id j68mr7061172ybg.49.1619790494636; 
 Fri, 30 Apr 2021 06:48:14 -0700 (PDT)
MIME-Version: 1.0
References: <7ec76c38-be24-2ad1-04dd-0883d46ec39d@clodo.it>
In-Reply-To: <7ec76c38-be24-2ad1-04dd-0883d46ec39d@clodo.it>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 30 Apr 2021 15:48:03 +0200
X-Gmail-Original-Message-ID: <CAHmME9rofjy=5dY_Z81kBKKs=bBTrguMbp_EuM2oDUxnTfSPvQ@mail.gmail.com>
Message-ID: <CAHmME9rofjy=5dY_Z81kBKKs=bBTrguMbp_EuM2oDUxnTfSPvQ@mail.gmail.com>
Subject: Re: embeddable-dll-service - c++ - tunnel_proc_t
To: wireguard@clodo.it
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Thanks for letting me know. The doc was out of date. Fixed here:

https://git.zx2c4.com/wireguard-windows/commit/?id=786bb04d4081e8c9d07eecf27c12a318f24235ed
