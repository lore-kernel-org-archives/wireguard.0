Return-Path: <SRS0=oxb/=FZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F39CC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 00:24:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BCA922C9C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Dec 2020 00:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BCA922C9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=labrat.space
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea42c145;
	Mon, 21 Dec 2020 00:15:35 +0000 (UTC)
Received: from mariecurie.labrat.space (mariecurie.labrat.space
 [116.203.185.229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 66cde38d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Dec 2020 00:15:32 +0000 (UTC)
Received: from labrat.space (adsl-178-38-56-54.adslplus.ch [178.38.56.54])
 by mariecurie.labrat.space (Postfix) with ESMTPSA id 8D5351524839;
 Mon, 21 Dec 2020 01:24:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=labrat.space;
 s=201904; t=1608510247;
 bh=3xr3xBIKIqX+oXtcZx7a/4h0EP5BCAE0wXu4zk1LJ48=; l=601;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:In-Reply-To:From:To:CC:Date:
 Subject:Content-Type:Content-Disposition:Reply-To:In-Reply-To:
 MIME-Version:Message-ID:References;
 b=htO6XCSe+qKMM2ZrA5Nf9ThAJ0/qNFGOkL5n368Kl1kFWdbzJG/tHAgpskhbv0lYb
 7lE+3ITz5MYexx6gtmKldSf+w2X9pBeYStCSOiQ2NkmTzCDXbj1H8vk7vTqtDAvG9h
 tMEfY3ygIsl4lQvISxBwJ2Bqj2jHxUr33wui9RmZm8ZfFCZ4stEwo2aYzgGB4snrW0
 AmZWOGXm3absbCMpu6OLGsRJeYcf8XxCv4VM1+Pg+69OUDQEPwGqfIQzgYRMWYeo+5
 966J//i41foXP4o5/oFcpaWgYJWnDhUM98WanTto/FmDOxx2cxN6i9BnKCDkXCgfts
 YRfhNbVU3Vegw==
Date: Mon, 21 Dec 2020 01:24:24 +0100
From: Reto <reto@labrat.space>
To: Ronan Lucio <ronanlucio@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Best practices for adding hosts
Message-ID: <20201221002424.imjfxu55bthvrmlg@feather.localdomain>
Mail-Followup-To: Ronan Lucio <ronanlucio@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAF-5T9FDVTqPGsS=FcMMyWy2W6O1w7ShdhEEsGUAaQ+fnTMnVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF-5T9FDVTqPGsS=FcMMyWy2W6O1w7ShdhEEsGUAaQ+fnTMnVg@mail.gmail.com>
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

On Mon, Dec 21, 2020 at 12:09:40PM +1300, Ronan Lucio wrote:
> I have a wireguard VPN server, and it's working gracefully, thanks for that.
> I'd like to ask you how can I add more peers without having to restart wg.

`man wg`... set / setconf / addconf depending on your specific usecase.

Also, `man wg-quick`

```
The strip command is useful for reloading configuration files without disrupting active sessions:
# wg syncconf wgnet0 <(wg-quick strip wgnet0)
```

As well as: https://git.zx2c4.com/wireguard-tools/commit/?id=a66219fa107e1bf0a03ebbbc405879c1f0a826c5


Cheers,
Reto
