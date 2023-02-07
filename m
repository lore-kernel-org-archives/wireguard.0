Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB40C636D4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Feb 2023 23:00:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aef3a9c0;
	Tue, 7 Feb 2023 22:57:02 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b7d6b71d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Feb 2023 22:57:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5DCDD611E7
 for <wireguard@lists.zx2c4.com>; Tue,  7 Feb 2023 22:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D605C4339B
 for <wireguard@lists.zx2c4.com>; Tue,  7 Feb 2023 22:56:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="I91Te4w+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675810617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XZQszJl6Wy3unWW5shRFKEY0SnIj1Z2g7uZvWygPpWI=;
 b=I91Te4w+wS9brssum+6C4fvt/5Bnjk+cVD6/VBaE3hXHUy4sNVYok8FTLLGSLDKtO7OA0N
 yR2uvBcOZDb2wHHmJgiLsDnNUQDmzWGE5EZNybqoZPELJ8adSWfxLqtUPToLs7BJZuK8qf
 Pz6p56kqO0yZNgYLuVE7P1fMR7HTtZs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 73dd3e27
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Feb 2023 22:56:56 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id m8so18187336edd.10
 for <wireguard@lists.zx2c4.com>; Tue, 07 Feb 2023 14:56:56 -0800 (PST)
X-Gm-Message-State: AO0yUKUgyCxbF4/AEOHZbFf+U6hjktQju70LwktQD00D/znf2iY/P6Na
 1EKl86Lthpqp53m/7ueV+W1Cp7+B3VxYdr4qbt8=
X-Google-Smtp-Source: AK7set9tNLa1cYIHLxFF7Bhs7hWxPSnSiHmU8MBYAqJ38YkTEN2MS020dsueIjrz0UvNXBxlgb0/UVjeFa7Y+H7YNko=
X-Received: by 2002:a50:cc92:0:b0:4ab:554:37e3 with SMTP id
 q18-20020a50cc92000000b004ab055437e3mr68405edi.8.1675810615700; Tue, 07 Feb
 2023 14:56:55 -0800 (PST)
MIME-Version: 1.0
References: <11c3d877-2d92-8593-0a9f-e2c918a791c3@gmail.com>
In-Reply-To: <11c3d877-2d92-8593-0a9f-e2c918a791c3@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 7 Feb 2023 19:56:43 -0300
X-Gmail-Original-Message-ID: <CAHmME9o-TTYatnRfPGOviU4++T-yxLzNN+tytTs+oZBT7qF_nQ@mail.gmail.com>
Message-ID: <CAHmME9o-TTYatnRfPGOviU4++T-yxLzNN+tytTs+oZBT7qF_nQ@mail.gmail.com>
Subject: Re: [PATCH] wg: Fix show all endpoints output
To: Dmitry Selivanov <dseliv@gmail.com>
Cc: wireguard@lists.zx2c4.com
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

Thanks.

Can you send this with a `Signed-off-by:` line like every commit in
that repository does, please? Then I'll apply this.

Jason
