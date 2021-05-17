Return-Path: <SRS0=pvJ2=KM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C238C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 May 2021 09:43:50 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B67B1611EE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 May 2021 09:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B67B1611EE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e29b899;
	Mon, 17 May 2021 09:43:47 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d20ab44d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 May 2021 09:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1621244622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lHuXjtnGIwA8Zzr3bT7RPQh03xIe4TvMRJ0gk9Qtcas=;
 b=phpsLVJE/mr3fYO+Ebi2XhH1fhswbKuO1SS0yAbPtiyZ0gLzVRgzXQYtFFkdwBhTnjPwOr
 ZNFASMRk4sKnJe476l1t8ZUopSRcIa0MkRu3jlVLP04B5+5Ol6DkESOZVqH+UiklbZ5IOf
 XQ4A6mIaq/U8yZef7BAY41/QzlSnFXg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f34c428a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 May 2021 09:43:42 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id v188so7725206ybe.1
 for <wireguard@lists.zx2c4.com>; Mon, 17 May 2021 02:43:42 -0700 (PDT)
X-Gm-Message-State: AOAM530td8g/lC/RFbx/yoQyuS+mKkG4pa/6DKiYQOR22arxLxguJvUU
 gFqKgf79jx4wBNzM8r1RoJMFzdEXTKH51tNzNh8=
X-Google-Smtp-Source: ABdhPJwFrAk9VbOdUwfEKMdtEZfvEWFs3i25IlNvTKA24N0vDxY3APfz8PQS2gVd5W+NwtoLOJCVpIaHvaEyouNC7rM=
X-Received: by 2002:a25:be09:: with SMTP id h9mr85543946ybk.239.1621244621869; 
 Mon, 17 May 2021 02:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210517081730.868755-1-liuhangbin@gmail.com>
In-Reply-To: <20210517081730.868755-1-liuhangbin@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 17 May 2021 11:43:31 +0200
X-Gmail-Original-Message-ID: <CAHmME9pfudqehwO2X=hgmOJFzqpP1qK5v137MFMpKjJo5_3BQw@mail.gmail.com>
Message-ID: <CAHmME9pfudqehwO2X=hgmOJFzqpP1qK5v137MFMpKjJo5_3BQw@mail.gmail.com>
Subject: Re: [PATCH RESEND wireguard-tools] contrib/launchd: fix xml syntax
 error
To: Hangbin Liu <liuhangbin@gmail.com>
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

Applied, thanks.
