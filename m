Return-Path: <SRS0=+otM=PW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF9AC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 16:18:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCA27610E5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 16:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCA27610E5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ead2d958;
	Wed, 3 Nov 2021 16:18:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 85afa6a2
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Nov 2021 16:18:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1644610FC
 for <wireguard@lists.zx2c4.com>; Wed,  3 Nov 2021 16:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="iI1WyqIJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1635956320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rVUPe2zjlX411SkgnoaIIl1LzQ/EGJx0m5rKUjo+H8c=;
 b=iI1WyqIJBgAwzJ2+NXreH5cWmo4dLIyQJYIPhysytBUO4ZeBbbZ51fonRTjEBcsjci26nB
 73KFWSxXWsuxMxLduDzCHoN+XSBGt1q1ktmSJC7WDCprr4ck3+yZ2ANSZemhEzFgRH0Lhf
 wbxBypP2bwUT2Q8z9bmxFBNLJlf47Dc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f1e211d1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Nov 2021 16:18:40 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id a129so7611935yba.10
 for <wireguard@lists.zx2c4.com>; Wed, 03 Nov 2021 09:18:40 -0700 (PDT)
X-Gm-Message-State: AOAM531+GkwWG/0oaAm8PVO4N7aDCMbiPJlzoDUaCMza+IXHAq/v/DXc
 Ay4dyOVOpMLgwEnIrQXfLrcrWpoglYQvGmQRZp0=
X-Google-Smtp-Source: ABdhPJxgIggwkNVrcrk5c2qy//fojUg3l5OXw/ly9mJWW0GPAsGXs3Fl3ELHQtwaFCoftjlKDLcllwr6oLOteoIGSMA=
X-Received: by 2002:a25:ba0f:: with SMTP id t15mr51099063ybg.62.1635956319833; 
 Wed, 03 Nov 2021 09:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <1da52141-2cca-9ebb-e415-af471b14e74e@chil.at>
 <ddc62364-6764-3662-5d76-f720a4a375ff@chil.at>
In-Reply-To: <ddc62364-6764-3662-5d76-f720a4a375ff@chil.at>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 3 Nov 2021 17:18:28 +0100
X-Gmail-Original-Message-ID: <CAHmME9pDZ30wAYYgEe3TNp8pwiEW4TF0Lj=oxsaEsvvoQNGQwA@mail.gmail.com>
Message-ID: <CAHmME9pDZ30wAYYgEe3TNp8pwiEW4TF0Lj=oxsaEsvvoQNGQwA@mail.gmail.com>
Subject: Re: WireGuard connection without interface-address / linknet
To: Christoph Loesch <wireguard-mail@chil.at>
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

Fixed, thanks.

https://git.zx2c4.com/wireguard-windows/commit/?id=46da2d426aa79725abafdfb615f623ef1d2d9aa2
