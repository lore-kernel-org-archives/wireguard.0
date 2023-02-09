Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B23C61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Feb 2023 09:01:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1badd99;
	Thu, 9 Feb 2023 08:58:26 +0000 (UTC)
Received: from smtp.rekudos.net (c.rekudos.net [95.183.51.78])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3b63c397
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Feb 2023 08:58:24 +0000 (UTC)
Received: from localhost (c.rekudos.net [local])
 by c.rekudos.net (OpenSMTPD) with ESMTPA id d7a57559;
 Thu, 9 Feb 2023 08:58:16 +0000 (UTC)
Date: Thu, 9 Feb 2023 09:58:16 +0100
From: Mark Lawrence <nomad@null.net>
To: Houman <houmie@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Compiling Wireguard-Android repo on a M1 Silicon Mac
Message-ID: <Y+S1qNttY6+u2kYf@c.rekudos.net>
References: <CABBZOsmDgrG_4zZ3WRxhjjfKZBwvzW_f=v3sZ6UKoNTpSsHMhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CABBZOsmDgrG_4zZ3WRxhjjfKZBwvzW_f=v3sZ6UKoNTpSsHMhA@mail.gmail.com>
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

On Thu Feb 09, 2023 at 08:05:35AM +0000, Houman wrote:
>
>I got this error message below. Any idea what I need to do? Thanks

Just read it a little more carefully :-)

>"https://dl.google.com/go/go1.18.2.darwin-arm64.tar.gz" && \
>  echo "6c7df9a2405f09aa9bab55c93c9c4ce41d3e58127d626bc1825ba5d0a0045d5c
> /Users/houmie/.gradle/caches/golang/go1.18.2.darwin-arm64.tar.gz.tmp"
>| sha256sum -c && \
    ^^^^^^^^
> ...
>  zsh:1: command not found: sha256sum

It seems your system does not have the SHA utilities installed.

-- 
Mark Lawrence
