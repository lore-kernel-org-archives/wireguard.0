Return-Path: <SRS0=qYKx=WD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E1FC433FF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Aug 2019 08:42:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4206F2238C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Aug 2019 08:42:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="1h5opR4m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4206F2238C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5ae4359;
	Wed, 7 Aug 2019 08:42:02 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id beed351d
 for <wireguard@lists.zx2c4.com>; Wed, 7 Aug 2019 08:42:01 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c50c51a4
 for <wireguard@lists.zx2c4.com>; Wed, 7 Aug 2019 08:42:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 946f774f
 for <wireguard@lists.zx2c4.com>; Wed, 7 Aug 2019 08:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=44zXNQSDctEP6RwxaD6gxidinTs=; b=1h5opR
 4mrG6MdX0mlAOvUEapI6xKNYu/bq8Tg5I5lYVsYXZ2DV6WCmsy1jCAe/5VLSPn1D
 Fhs2Zv/uhZ39V/7DJ/KbCcZZhL+K2r9H7MQKIx1BetgX6Qtc+mqGtgX0xZGlagOc
 iKQGJt2ubusvWAYeuFn3MwHK9GUgUFCy1Qf+9exkkiOkExzM+2PbP22/WThgoYth
 mvyUWoCy1moFxmRf4lIIWGFiaA/eYbEPvvVuuaIHs6iNwFz19W1xAOnx/Ir//wTD
 KoiCauCdpU7vxD9raA0UTLHJa8GxOccfSKiY9R482DJ7JW8v7NaJ7phKaqLPMxv3
 MdwmJHcCSnDRSm3g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8682a528
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Aug 2019 08:02:34 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id n5so101280312otk.1
 for <wireguard@lists.zx2c4.com>; Wed, 07 Aug 2019 01:42:01 -0700 (PDT)
X-Gm-Message-State: APjAAAWJWc8c230HQX9Z5qUeEMFrZ/tVkNapReQ1PdSL5aO6nHm5Aiel
 VCbY/oY42MtPn7t0THaK87lmQsYv2zf+vd5HMUo=
X-Google-Smtp-Source: APXvYqyY8Gbe173/mFZ6FJMEtR1pnH62PDQPz02Qz4/N9l9+LQqUdXbdH69SPUC0Cfnq41xbsfiCaAV3EWQkK1abD7w=
X-Received: by 2002:aca:4711:: with SMTP id u17mr4730088oia.115.1565167320683; 
 Wed, 07 Aug 2019 01:42:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9pGLM9a3Ww-MNy7mNT6JEQQXv4qLF0LDrAqVFUbDDPrsg@mail.gmail.com>
 <20190805225728.43358-1-ankur@lipidity.com>
In-Reply-To: <20190805225728.43358-1-ankur@lipidity.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 7 Aug 2019 10:41:49 +0200
X-Gmail-Original-Message-ID: <CAHmME9pd2CYYcTfr-FAh1XwSVTv4M4g9PJi0h41V1mUGUSTFoA@mail.gmail.com>
Message-ID: <CAHmME9pd2CYYcTfr-FAh1XwSVTv4M4g9PJi0h41V1mUGUSTFoA@mail.gmail.com>
Subject: Re: [PATCH v2] wg-quick: openbsd: fix alternate routing table syntax
To: Ankur Kothari <ankur@lipidity.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Thanks, applied.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
