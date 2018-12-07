Return-Path: <SRS0=3VOv=OQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81B0C04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Dec 2018 00:18:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3143520868
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Dec 2018 00:18:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="1zFT/ZPF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3143520868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b89e69ff;
	Fri, 7 Dec 2018 00:09:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id feafeba6
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 00:09:41 +0000 (UTC)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ffa97ea
 for <wireguard@lists.zx2c4.com>; Fri, 7 Dec 2018 00:09:41 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id j21so2026164oii.8
 for <wireguard@lists.zx2c4.com>; Thu, 06 Dec 2018 16:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MzgEule32/6IOKZH8jM0YCZRLdoGHAyk2x91oOmfQqI=;
 b=1zFT/ZPFQcw3TK6cdowJSD5UGw5KzFiAskGWcU9MppEzfAfkQXlytIm+WIhkLwj/Kp
 ByRbQApDmYNJf20oaeBSE04uFkruJC2HNN0I6ACBVeGkaFNhUgi/S089Sjw2M4FZynax
 VAjxp6I3eyrCy6hqcCgHpOrNSi6K4CI1Rr0ruJq5/Qu0aaeGahOKZhjMvdEj+bLGUCMZ
 Difs3RozofLFSHPVUoGBE4zABLrrn/uHh0H6SgaI/3/aucY8+rUljb8+oN1yE5lbbAX9
 qlyaoFZF+R0oez3gZPWUrKIH0EAJP3XEJNcwQeRP8vTDsu8Kbj2i94532FNtN287pGkB
 uXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MzgEule32/6IOKZH8jM0YCZRLdoGHAyk2x91oOmfQqI=;
 b=mlWqqz0G1IWo1dbWqmIO1JckcQVycdLgwNVd4DBnD0kwecAXTYJs5r4von2ecOcI8e
 7VzVS2Xsx5xA6xWcKG0iuRxSPt4kBWqQR0ciC8oh4oPpZRYafWKYe+j0LxI/MQ5EUxg5
 IOKbZZLRCQy7CRGEqWlE4NFobJ/l0BbNun0nZy8uQ3uFcpS1WdUjJI6E5qaK3JYQzq0Z
 G+O66mDjSpI+xeEUwAhQpm+B3eP29WedZQNd6EYsdU3AjARspObbPJQSFGChftuDHONO
 u/1HwyMwK6wKYWkmbbkVO6UsLgEaU59z/aoqHf83rKvL7JRYgnkhT/d9tHD/gkYnIBjM
 keIQ==
X-Gm-Message-State: AA+aEWYxhn3U+2h8vjQBSM8cux8heBx0RwGiWYzp57ZkxBlJD3Je+10R
 0rqsfkbIw2BUhs8JmCWkMVS08jNmfvAbUWTxxdcm1JG6PtmI4Q==
X-Google-Smtp-Source: AFSGD/XkDl+YBTH953bgmpypfimrtDcx+Hqy+BIuhc5f67pv0k5UOLHS2TD5zp+AB/UE8iFQ33nR2uU8grjRkrl0CsA=
X-Received: by 2002:aca:cf04:: with SMTP id f4mr49020oig.16.1544141873401;
 Thu, 06 Dec 2018 16:17:53 -0800 (PST)
MIME-Version: 1.0
References: <59d2f673-9525-0535-7143-a515a1b7f7e0@activezone.de>
In-Reply-To: <59d2f673-9525-0535-7143-a515a1b7f7e0@activezone.de>
From: John <graysky@archlinux.us>
Date: Thu, 6 Dec 2018 19:17:42 -0500
Message-ID: <CAO_nJAZA7sxBvL=suVf48Nfmf_JRb=U4ese6CmYqjrXhdK9gLQ@mail.gmail.com>
Subject: Re: Simple Shell Script for "Status Monitoring" your WireGuard
To: markus@activezone.de
Cc: wireguard@lists.zx2c4.com
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

Recommend you run the code through shellcheck and take the
suggestions: https://www.shellcheck.net/
On Thu, Dec 6, 2018 at 6:13 PM Markus Grundmann <markus@activezone.de> wrote:
>
> Hi!
>
> I'm new to WireGuard and a formerly user with some experiences on
> OpenVPN with complex setups but sometimes (I believe) a tools must be
> changed ;-)
>
> Now my environment will be migrated to WireGuard and I have wrote a
> little shell script to get a status page for my peerings.
>
> If you are interested on this script please visit the following site:
>
> https://activezone.de/wireguard/
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
