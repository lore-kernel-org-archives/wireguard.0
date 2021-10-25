Return-Path: <SRS0=eD45=PN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CECC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Oct 2021 16:01:06 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 845C260EB1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Oct 2021 16:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 845C260EB1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a771583b;
	Mon, 25 Oct 2021 15:59:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f6e51ccb
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Oct 2021 15:59:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E780060E75
 for <wireguard@lists.zx2c4.com>; Mon, 25 Oct 2021 15:59:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="fWLz8ZZM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1635177575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SyY1vD88xtRkFqBwSytgWicnVi8PbU5iNfd7Z2pntfU=;
 b=fWLz8ZZMr1uwGQUwT3Aj9OMATriSaFX3BbS/zuDYyUEBhSoXHPECK+oDIZWL35TbabkTUt
 hceaaB4m8uYJD8/XJAt7iuxJY43+ItFbiMtI7kQY3Et22C+DbXjbrAphzzeq0aa8IMUHGJ
 EX8OVGfj3iKRv3i9vSe/yCAHHUMMO9M=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 131a92a1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Oct 2021 15:59:35 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id m63so27165919ybf.7
 for <wireguard@lists.zx2c4.com>; Mon, 25 Oct 2021 08:59:35 -0700 (PDT)
X-Gm-Message-State: AOAM530Vj+c67HYV89f7kzwRRANRx5wI6D0LOebjdlQCGSxCzvZL1uB7
 qEq8aA0XwEOv8vmBBFKU5D9n16zQqlQjrAUXwb4=
X-Google-Smtp-Source: ABdhPJyV9H5X6IqVrDxQocsMMuaUZmyD8UbjmxhpZrS9amA8WF0M4/3GdlxKBf78bmAvdvwo1kbpVLzyZMLdVT4wJ7Y=
X-Received: by 2002:a25:e790:: with SMTP id e138mr19359601ybh.62.1635177573896; 
 Mon, 25 Oct 2021 08:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAEAeJWyPEhWgPQXEbJ=26G2FvK0xzyvmQ4reakdFpCt8wgpGPg@mail.gmail.com>
In-Reply-To: <CAEAeJWyPEhWgPQXEbJ=26G2FvK0xzyvmQ4reakdFpCt8wgpGPg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 25 Oct 2021 17:59:23 +0200
X-Gmail-Original-Message-ID: <CAHmME9qt5xSXKKWgpFZ=1kGBDrK-4MUHT4931b9bgeTVy-Rsog@mail.gmail.com>
Message-ID: <CAHmME9qt5xSXKKWgpFZ=1kGBDrK-4MUHT4931b9bgeTVy-Rsog@mail.gmail.com>
Subject: Re: wireguard-go no longer builds with go1.16 ?
To: Adam Bliss <abliss@gmail.com>
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

Thanks for the report:

https://git.zx2c4.com/wireguard-go/commit/?id=828a885a7140e1fe23a684e4a8126cfd978ca0c8
