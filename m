Return-Path: <SRS0=FlPj=7X=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22845C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Jun 2020 03:42:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88A6820737
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Jun 2020 03:42:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="mglb60q1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88A6820737
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf6305dc;
	Wed, 10 Jun 2020 03:25:24 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 33c8bab7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Jun 2020 03:25:21 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b69d45e1
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Jun 2020 03:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=WxP0YQVGb/GYzrViQS1WSXQeXn0=; b=mglb60
 q1f9pE6Z0km3nCh1BLlFIbPBqHvVd9o8Bvxxdxy1GpSliPBCABWVONUCX1MquAhh
 KwihUVHvxUAXselUs9QqgKTIEPqg9/NvZ/T/Q/d2xY0gfV2nXlzCf++RIAhu7wmN
 +aZ+3cpc3dEjOPYnygGMPYV7DNTxM/+peGnU00CSt7OlmlvI7xhJ3KeobZFtT7Fh
 L32UKyNHyOuygFTpF+LPi9imak9Ww9THc8a1mhb+BnlDy+UbMQFqiTGD0MwrCn6N
 hAlwaagJrgO98/v2pK4du5WKcj7zQ46wD6kfmElHOsF5v4mb78Q4EzrNO7IIzf3l
 wkk2FqCdvSqNv5GA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1fe82647
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Jun 2020 03:25:20 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id e11so576249ilr.4
 for <wireguard@lists.zx2c4.com>; Tue, 09 Jun 2020 20:42:29 -0700 (PDT)
X-Gm-Message-State: AOAM531lewgt7DdkeXt/aOFv75Yfbd9Emt46TbBfPAOuw+HjCQbNRRjh
 cX4xiUqrSKBOrmweuFJhIHxHREEkuoV8OgqDhFU=
X-Google-Smtp-Source: ABdhPJwVJTXyE+0max50h/3oBgdpiw7jusy9UrhqCRBjWU+q8aFts18KzyGm+1NfOmpt9VMpjqD84e79vUICw3dl1Q0=
X-Received: by 2002:a92:2515:: with SMTP id l21mr1170698ill.64.1591760548653; 
 Tue, 09 Jun 2020 20:42:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200609152100.29612-1-mail@hb9fxq.ch>
In-Reply-To: <20200609152100.29612-1-mail@hb9fxq.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 9 Jun 2020 21:42:17 -0600
X-Gmail-Original-Message-ID: <CAHmME9o=VwZQtQH7i2qE2Jf6OLP_vcOzyA4U+NhLkiATnyN2Bg@mail.gmail.com>
Message-ID: <CAHmME9o=VwZQtQH7i2qE2Jf6OLP_vcOzyA4U+NhLkiATnyN2Bg@mail.gmail.com>
Subject: Re: [PATCH] Do not assign in if condition
 wg_noise_handshake_consume_initiation()
To: Frank Werner-Krippendorf <mail@hb9fxq.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
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

On Tue, Jun 9, 2020 at 9:21 AM Frank Werner-Krippendorf <mail@hb9fxq.ch> wrote:
>
> Fixes an error condition reported by checkpatch.pl which caused by
> assigning a variable in an if condition in
> wg_noise_handshake_consume_initiation().
>
> Signed-off-by: Frank Werner-Krippendorf <mail@hb9fxq.ch>

Thanks. Queued up in the wireguard-linux.git tree.

Jason
