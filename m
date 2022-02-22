Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80522C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Mar 2022 17:16:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4c4b8a05;
	Mon, 14 Mar 2022 17:11:44 +0000 (UTC)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [2607:f8b0:4864:20::b2d])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3ff9f89c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <WireGuard@lists.zx2c4.com>;
 Tue, 22 Feb 2022 12:48:02 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id w63so19554502ybe.10
 for <WireGuard@lists.zx2c4.com>; Tue, 22 Feb 2022 04:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=I2twvWhdHb1paT+Bz+WZEC1zWEUCXQym4ULH7o65yIw=;
 b=UxaU62qfilUjf+6Cjict79phw5VACG+2ajhq0Dgeg9KFKYiOmYwPYmtOepolFB6LTC
 9oscRf/ZcULGq/kOpZa0ntDp32TeaBXi7mroSsHEE7YtZpEW2dFJwIz1k0fr00C6r2uV
 Dw+8srCj/Iq6J4KZZ4ZV4bGctqLhSP70g3Buqvd1kZ98sTDlV+CFnNEXsjMlfi93XPuM
 uqbGoylWPBRVhJcwVa/DVrwn8LEpmO47o3WwWkW9LohGFIMZzjrsQQDlcZjP0fmBPURw
 Imhkwnw86cIpqoV7nXdgKTZTQF/oZcyD4XS6iHC8mHz2fU2DT1lCpv6/qsPdITA6SEvK
 YFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=I2twvWhdHb1paT+Bz+WZEC1zWEUCXQym4ULH7o65yIw=;
 b=u/uBOcDTOCGNXTEKuayU3RkQW7Sq2Puc5XBLUxTF5I/YtWSiHg+RUlBpCGN77Yicwb
 fuGnnVqYXVcHAQfQlhRE+Px0shs/88U6pJXPL+NewJPWtNfFHN5UUxpaq98CFq+PF62s
 2XqNVQ1aB2MVBPGhEAfXTebZ7M+GKMtP4ZIFPgieATHs3g70PwIZap4KNHM+OOTWv3ai
 /yeEKAcCKsGTslj4HXcdyu/ATljixx+EcPGOKRiY2lfu0W+EghD+97h09XVCjx8stBS7
 e3nIM22GoxD/2qXsZTT6HmVfROk/wXViw2h5DvJlyRUI30eydIUNonO3Aw1EVlXoiLEp
 WZ4A==
X-Gm-Message-State: AOAM531xJX/xnniGpPPQoa6F4xeaGD5EbuTdnDfDEC6KrkwkABjYPp7y
 sMrlfaskGt1Emw1pmvITId7ybOfafEiAHf/uCBm67FLdCHA=
X-Google-Smtp-Source: ABdhPJz705cHfdIj1d7cCoBUYmEKhOkgYQAbjwlYxRprfQRuhXboyowm9AEFtHKxP+Myui8251ZA7qH5v3mISECZfhk=
X-Received: by 2002:a25:9a44:0:b0:622:4e:958c with SMTP id
 r4-20020a259a44000000b00622004e958cmr23328306ybo.566.1645534080832; 
 Tue, 22 Feb 2022 04:48:00 -0800 (PST)
MIME-Version: 1.0
From: Siva R <siva131mz@gmail.com>
Date: Tue, 22 Feb 2022 18:17:50 +0530
Message-ID: <CA+f5crf3w-BV7-Hp6FpSvCnMY3VXDug2_cvu=iDEyJVezzANOw@mail.gmail.com>
Subject: Need Help - When 2 WireGuard tunnels are active Windows BSOD occurs
 upon disconnecting/disabling Ethernet NIC
To: WireGuard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 14 Mar 2022 17:11:40 +0000
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

Hi..

This is my wg setup

2 Active wg tunnels. Table=Off in both. Routes added/deleted via
PostUp and PreDown. Both tunnels have routes configured for subnet
0.0.0.0/0 with low priority(higher interface metric and route metric)

So by default all my connections go via Ethernet unless configured in
the application to use wg NIC.

Problem is when 2 wg tunnels are active Windows BSOD occurs upon
disconnecting/disabling Ethernet NIC. It doesn't happen when 1 wg
tunnel is active

Please let me know if any other information is needed. Happy to share.

I've also posted about the anomaly in reddit.

https://www.reddit.com/r/WireGuard/comments/syk18j/when_2_wireguard_tunnels_are_active_windows_bsod/

Many thanks.
