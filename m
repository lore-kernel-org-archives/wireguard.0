Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1E2F55809
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Apr 2026 10:40:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id bfa9d2f6;
	Mon, 20 Apr 2026 10:40:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 64547271
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Apr 2026 10:40:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4C23760141
 for <wireguard@lists.zx2c4.com>; Mon, 20 Apr 2026 10:40:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34A4C19425
 for <wireguard@lists.zx2c4.com>; Mon, 20 Apr 2026 10:40:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="N5wmZvKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1776681634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tussU+xhGm1Sw0xzupsIJR9Pa8CWEXW3NBkjmuAVCEI=;
 b=N5wmZvKv77C7pwPpSIpUD/vQkWkylVJ8jjop+bf/YoAOcvLl6eXs6lzyv6CqNzUOEG8jR6
 TlGFBJEURmz6QwT7ZMKgMTUSSuyl+pJFas4yf6+JZMp/c6m+u862NBuiDMVgNKE3pRVxE0
 U8bcXYrq3Nnh/bTopJZJMc/zCnc+Ps8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cb23d9ed
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Apr 2026 10:40:34 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-7dbe437b072so1675131a34.2
 for <wireguard@lists.zx2c4.com>; Mon, 20 Apr 2026 03:40:34 -0700 (PDT)
X-Gm-Message-State: AOJu0YyzCzqYaCJoHzGjdZXGyn/SqTl7Lh9yHICU7zf7jU2npnKUiir2
 a2ChuZrYnAxyW79qiMgyJmgJcpCM3kmrsY91HOwhD4zTAdizmoMFSFQKMU/4KMeWF1VIw1x1Gyd
 FxS4h/+DQwR6Jbh4OK5VIkEQb+jB0mAk=
X-Received: by 2002:a05:6830:2b0a:b0:7dc:4947:36a1 with SMTP id
 46e09a7af769-7dc9518bc7fmr7960763a34.12.1776681633628; Mon, 20 Apr 2026
 03:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <CABJHARCjTJ+T43++SkTam0RiHKvgxGqQJfAeGOOcF65SWCH5yA@mail.gmail.com>
 <aeBXFfT-hIHw_8Ec@zx2c4.com>
In-Reply-To: <aeBXFfT-hIHw_8Ec@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 20 Apr 2026 12:40:21 +0200
X-Gmail-Original-Message-ID: <CAHmME9qn=ZUH7W_ZznYuCAuqP0WOUbkOdDssZZwUsG9xi0cxEg@mail.gmail.com>
X-Gm-Features: AQROBzBwMbcKE-AuArmmkePeqygsDdmEbC31ywIRTSa8EbJceY2ruUJtaOTSWKQ
Message-ID: <CAHmME9qn=ZUH7W_ZznYuCAuqP0WOUbkOdDssZZwUsG9xi0cxEg@mail.gmail.com>
Subject: Re: WireGuard Windows 0.6.1 - Timeline of issues (tunnels lost &
 import still broken)
To: =?UTF-8?B?7Jik7ZWc7JuF?= <oho790114@gmail.com>
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

Fixed: https://git.zx2c4.com/wireguard-windows/commit/?id=857e549307fed893145bbab72ddd3fe08833c8c4
