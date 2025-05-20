Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E125C54E65
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39c3cfbf;
	Tue, 20 May 2025 23:00:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ff63752f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 May 2025 22:59:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B65595C5675
 for <wireguard@lists.zx2c4.com>; Tue, 20 May 2025 22:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8E5C4CEEF
 for <wireguard@lists.zx2c4.com>; Tue, 20 May 2025 22:59:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="h3Hs/8/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1747781982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gWpDt/rwNM/nig7k6lt+szP4lNhhSqQ0Y3OUIZSEPzM=;
 b=h3Hs/8/qexJXzoocs5pdVf2FUOdTnYcL4sw/+oB5VSPg2pwS3RyBL7INqQeBOIv4FGG5Cy
 01Y2XAao2cXqegAPZVmUYrZOLMFDR/FPBhH0WniqCr6Bdr8hdHlFpgr8CfugV32RfbnQqW
 AsvMuPoD2pUGv0kiUjwiePXJUBBcBBU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 30e431c3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 May 2025 22:59:42 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-40337dd3847so4287826b6e.0
 for <wireguard@lists.zx2c4.com>; Tue, 20 May 2025 15:59:42 -0700 (PDT)
X-Gm-Message-State: AOJu0YyHfsXnseHxumMqYYDncpilqlEoaup1lpBwIeiuylcLmTf8+spj
 pXDUf2ys+p6Zny5JUpsgv/r/ZxsTN2QY/pZiS9NRr+QwWYPEGSkY9gOHcS8Dhny4cAms4LcPgyr
 reJsuGjD2O+wzhB/RQza8aWzWuXlYUDQ=
X-Google-Smtp-Source: AGHT+IHNjjRmUw8IqnOOXMKDB+fdR31hvX7EyCcrH/ReMoIR8rY7PYF9de/2fj/yEoK59YnMRUutLhySUOCxrONXAUQ=
X-Received: by 2002:a05:6808:83ae:b0:3f8:1df6:40f with SMTP id
 5614622812f47-404da72460fmr8470673b6e.15.1747781981726; Tue, 20 May 2025
 15:59:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240709090728.872-1-chipitsine@gmail.com>
 <20240709090728.872-2-chipitsine@gmail.com>
In-Reply-To: <20240709090728.872-2-chipitsine@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 21 May 2025 00:59:30 +0200
X-Gmail-Original-Message-ID: <CAHmME9oFTzvodu0N3-wsOafnTUUF+P1C-cXWEmSjjXP9pHx+ug@mail.gmail.com>
X-Gm-Features: AX0GCFu-airl6LmmFq6UF-m_U9OIfz2Oz5DzJ5ImGo6TDq57zOD4VX0FjelhXB8
Message-ID: <CAHmME9oFTzvodu0N3-wsOafnTUUF+P1C-cXWEmSjjXP9pHx+ug@mail.gmail.com>
Subject: Re: [PATCH 1/1] src/config.c: handle strdup failure
To: Ilia Shipitsin <chipitsine@gmail.com>
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

Applied, thanks for the patch.
