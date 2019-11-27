Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E30CC432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 12:26:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D18372068E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 12:26:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="tMmlyeTm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D18372068E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72b1c819;
	Wed, 27 Nov 2019 12:25:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9ad49a3
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 12:25:45 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ba741a8
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 12:25:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26e3fb3c
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 11:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=81wvnw6SFrZjZeHTuQwbmW5cIvg=; b=tMmlye
 TmzU6O6niZGwLP5fxaMnW80m8lXWg1eveyrQyuase5T22k4mtNyIMlaeTpJeOJmB
 e/gP3gVXSSJovIM61GfdwwcffbyPyB3J7+PnQpsgxOq+GaFRwIddT9j9twmfrd5W
 K2+4wKmkJxgL5pINocNXODgHzsxdd1zRDztrpw5hTqPiMuOjXosDohOhvt0zCQjb
 qNGGSZ1v/g6K7ER8fATvxLINTj1IQk8Lolv2eYm2j1ZsGWcB29/tVhD8IL5NnxRB
 nGp2HMBgd73g3b7clPNwqrUSRfzWUkdF1l7UTBowj2A22wqGyJJmTCgN0JOxQxSQ
 X4FYLRACc9wotbBw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8a94ebc0
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 11:31:54 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id k196so3536729oib.2
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 04:25:45 -0800 (PST)
X-Gm-Message-State: APjAAAXp4mvq7rNaXKvXwMxtNThCi0XzcjStHRyU8k1e8LF2f9Afar+i
 Kewr0+9roIALI93oX7shEdV8EtBI5bmdGsFK+eA=
X-Google-Smtp-Source: APXvYqwxdvKY8RTdyiqqPKxfmNZjz/nSPQuDgkt2CGTBMPUAjM3O9exYb+VsrxSWF3ZJuHU3g8nWsNueXQr3+TB65ik=
X-Received: by 2002:aca:d7d4:: with SMTP id o203mr1091856oig.119.1574857544459; 
 Wed, 27 Nov 2019 04:25:44 -0800 (PST)
MIME-Version: 1.0
References: <a4ca89a7-5eee-e570-e721-e559e9eb0e23@molgaard.org>
In-Reply-To: <a4ca89a7-5eee-e570-e721-e559e9eb0e23@molgaard.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 27 Nov 2019 13:25:33 +0100
X-Gmail-Original-Message-ID: <CAHmME9r04ugt7-Q0=Cn+7QyW1F7m38vpL85JVnhTpvf=QW53uw@mail.gmail.com>
Message-ID: <CAHmME9r04ugt7-Q0=Cn+7QyW1F7m38vpL85JVnhTpvf=QW53uw@mail.gmail.com>
Subject: Re: Wireguard, bridging and DHCP?
To: =?UTF-8?Q?Sune_M=C3=B8lgaard?= <sune@molgaard.org>
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

You might be looking for "Proxy ARP", which can be enabled with sysctl.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
