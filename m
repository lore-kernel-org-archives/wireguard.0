Return-Path: <SRS0=fAOc=DR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CEDDC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Oct 2020 15:58:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34EDF223AB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Oct 2020 15:58:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="CHs/FvBh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34EDF223AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=riseup.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79936eaa;
	Sat, 10 Oct 2020 15:25:05 +0000 (UTC)
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5fa95237
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Oct 2020 15:25:01 +0000 (UTC)
Received: from bell.riseup.net (bell-pn.riseup.net [10.0.1.178])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "*.riseup.net",
 Issuer "Sectigo RSA Domain Validation Secure Server CA" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4C7qN84mymzDsbx;
 Sat, 10 Oct 2020 08:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1602345480; bh=avlwWpZQYfVVBCJ8P/WqGkp6acqdVbJ5THqA60J91/Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CHs/FvBhm0LR1K9E1+xfgJ0dCMUZFgjYjpESss5Ox79sHslA0EA0daDnKT4uo2pwf
 n321yYhXLjJwa8tfEB1vbtK+mvAe/WGHw/zceHLVk9JOYCQ3QmJ8THfZ6HB5Z5noNH
 BOcswUGBGp5UGJGvT8Sy3xnxiSSUbYeztKkVQTBo=
X-Riseup-User-ID: 8A38CC49353C67BC4C3975B5EB11DA9FA39F17433E390C33E57032C47D934D87
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by bell.riseup.net (Postfix) with ESMTPSA id 4C7qN56CfXzJn7K;
 Sat, 10 Oct 2020 08:57:55 -0700 (PDT)
Subject: Re: [PATCH] wg-quick linux: Add strip-and-eval cmd to extract keys
 from PostUp
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <be4e9109-399b-5520-e6fd-e7163350aaf0@riseup.net>
 <CAHmME9oe5e84gpsGjGYkWHZoOLYKX1xUZBNzM7g0R6cEHg5JUg@mail.gmail.com>
From: Robin Schneider <ypid@riseup.net>
Message-ID: <b1955eb8-bc38-770c-848d-540c6c13bfbc@riseup.net>
Date: Sat, 10 Oct 2020 17:57:48 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9oe5e84gpsGjGYkWHZoOLYKX1xUZBNzM7g0R6cEHg5JUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi Jason,

On 2020-10-09 14:20, Jason A. Donenfeld wrote:
> This seems like a weird inconsistent hack. Strip should return
> something that is acted on by something else, and not also do things.

I know. Thats why I made this clear by making it a separate subcommand so that users can choose if they want this hack or not.

> 
> But I have another suggestion on how to achieve what you want:
> 
> wg syncconf wg0 <(printf '[Interface]\nPrivateKey=%s\n' "$(wg show wg0
> private-key)"; wg-quick strip wg0)
> 

At first I considered/implemented such a workaround on the systemd level. It is good to know that I would not have to care about merging two INI files as `wg` can handle two `Interface` sections and merge them together itself as it seems.

The proposed workaround has two issues:

1. It does not allow to replace the PrivateKey or PresharedKey using the `syncconf` now from the config file which is what I want to have.
2. It only outputs the PrivateKey and not the PresharedKey for each peer. Sure, this could be done with a for loop.

-- 
Live long and prosper
Robin `ypid` Schneider -- https://me.ypid.de/
