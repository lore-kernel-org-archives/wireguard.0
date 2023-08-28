Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDDD6C001E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Oct 2023 14:24:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cf9f1ee;
	Mon, 23 Oct 2023 14:07:29 +0000 (UTC)
Received: from smtp.zlima12.com (<unknown> [47.87.186.165])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 80ab7ee3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 28 Aug 2023 02:54:56 +0000 (UTC)
Date: Sun, 27 Aug 2023 22:54:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zlima12.com; s=dkim;
 t=1693191294; bh=vdmO6Z60ykXGdx2St9wAHRw1SMv3VG5vbA958csN6eg=;
 h=Date:From:To:Subject;
 b=Bd+4nCV2msDw6Sj611QucWokI/m2ZPdKtYBUrvSiaMvWpoO7aljU/ORSkiJf33CV5
 Dj5ccJf17aw+t26c6tQ2kvK/HaLi7ozQC5zCBF7uxHtNQzTiF2rah/Jhq6S8HwZcYw
 NYy9e58EAraiacQc44EZ3XHORfeLysE9MMHyknUvR9TemoZ6DC5xg3rOYQLxkple4O
 hsG/LNPR/6y6zNRGrahQ0JphhscNy3coImUmX9C3MIQY3a8w1yBJK97xBKyR0ij5m5
 BmTXdRZcTADDom3uebRqVIlW6xmDHH9teVJiWvhB9pCeuc/F8TqQFOYq3UeeMWsh9V
 0OwmI2fek/hUg==
From: "John A. Leuenhagen" <john+wireguard@zlima12.com>
To: wireguard@lists.zx2c4.com
Subject: wireguard-android: Multiple Tunnel Support with Userspace Backend
Message-ID: <krf5hsjmtqbq2qsb2rivsmlhidpq22w4foks42fyuu2e4uo6hx@32wygy6wjv2r>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 23 Oct 2023 14:07:27 +0000
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

Hi all,

I've just noticed that since switching to the Android userspace backend,
I am unable to activate multiple tunnels at the same time. From what I
was able to find with a quick search, it seems that unlike the kernel
module backend, the Go backend does indeed have this limitation. Can
anyone confirm that this is the case?

If so, is there some limitation or other issue that is preventing the
functionality from being implemented? Or is it simply a matter of the
code not being written yet? Would patches be welcomed in this case?

Best,
John
