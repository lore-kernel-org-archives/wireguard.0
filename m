Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91081C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 24 Nov 2021 15:43:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 07b3cbb8;
	Wed, 24 Nov 2021 15:43:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 90685f49
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Nov 2021 15:43:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A9D060FE7
 for <wireguard@lists.zx2c4.com>; Wed, 24 Nov 2021 15:43:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="N0MLLbBO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1637768582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TP2bY9LldTt/5Jg64jkzAeFJAeA8Cb5hbxcDjjJnMo8=;
 b=N0MLLbBOV8e9b7tQXwpXrZISw1caCOfBD7kbnOfw89Eg7hcC+RHNC8HW7qGzPydrySPEb4
 qHWzkBDKUFicpVnHQSYQlX2IjyjzwZM+MN3oyE9Q9zN17DoO2saalbxSkyVl32TgqxE3M0
 S8+L8FVcaUGrUgXS1RxnwnfCRH4PIbQ=
Received: by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 9ef24f22
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Nov 2021 15:43:02 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id v64so8502176ybi.5
 for <wireguard@lists.zx2c4.com>; Wed, 24 Nov 2021 07:43:02 -0800 (PST)
X-Gm-Message-State: AOAM533uqIsh4y9BkIeKOjZDjXDml0+yQCXhGlgaZSC2nInWeFzOQ2iZ
 WgXNR15dhH+80IzyHoxoxIpZZBTQez6NBhA8xfg=
X-Google-Smtp-Source: ABdhPJyu6U4YHF/5w2pX1kzo671Y71l5UbOqd5IHKr9Vp/WstsobznnCCnLCeHRzBde85HAr1yH5YqOhVYbesmJVPjg=
X-Received: by 2002:a5b:783:: with SMTP id b3mr16981412ybq.328.1637768580692; 
 Wed, 24 Nov 2021 07:43:00 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7110:a243:b0:111:6be9:cf8a with HTTP; Wed, 24 Nov 2021
 07:42:59 -0800 (PST)
In-Reply-To: <1da227e6-5b12-40ca-a6de-3117835a2f16@ut1.org>
References: <1da227e6-5b12-40ca-a6de-3117835a2f16@ut1.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 24 Nov 2021 16:42:59 +0100
X-Gmail-Original-Message-ID: <CAHmME9oqvV9E9cVXeF5nVpumE0fJgdASaBqG6aCPyS-NLq9rXQ@mail.gmail.com>
Message-ID: <CAHmME9oqvV9E9cVXeF5nVpumE0fJgdASaBqG6aCPyS-NLq9rXQ@mail.gmail.com>
Subject: Re: [Windows Client] Out of date Title scare my users
To: Bruno UT1 <bandry@ut1.org>
Cc: wireguard@lists.zx2c4.com, Diab Neiroukh <lazerl0rd@thezest.dev>
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

I agree the situation is a bit ridiculous. I'll revert the change that
added this: https://git.zx2c4.com/wireguard-windows/commit/?id=82129ba288f7561c89bb80e04841ffb46bc29889

I'm CCing Diab, who originally requested the change, in case he wants
to argue with you about it. But in the absence of that, I'll revert.
