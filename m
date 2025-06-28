Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3066DC54ED1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 28 Jun 2025 16:05:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68138d84;
	Sat, 28 Jun 2025 16:05:33 +0000 (UTC)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a6b34c21
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Jun 2025 16:05:30 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-312f53d0609so384472a91.1
 for <wireguard@lists.zx2c4.com>; Sat, 28 Jun 2025 09:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrife-io.20230601.gappssmtp.com; s=20230601; t=1751126728; x=1751731528;
 darn=lists.zx2c4.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6aezSHN45uDXxhfwLny8MywH/f96jqDnbUNyp4IJzeo=;
 b=lkIREYVlB0afqmHfRXb+cQ0mRWs//Hivuo/nzMX5qJNV9LUMLZDkVjOobci8/vthfr
 pFFyuFlTcT6MeRHBu04SAaf1R20xoRHsUkaysfuEh9GV+vU58nCLmR0CHGbVdFVOwt9d
 NBCZ84NklsnlyDpoKwWhzkO9lcFfuYFcMH6muRdjTVbmZRF6hG23Bvbhi+5MNIBqlBFG
 33KYNhyKeHVvQxWgO72VXN8Da8KCizUeVtQGrZZ06I8owDHJcapTymK7XM3OiOqwpnlI
 w3Cj746aqvm4nztHK/z3Wxee4ZtXKAwQO8nv4ldnjORIbF88gMw9qjgA0D+kIQwxi8zr
 nZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751126728; x=1751731528;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6aezSHN45uDXxhfwLny8MywH/f96jqDnbUNyp4IJzeo=;
 b=NgpoRRsWBOLeIUdR/H/fdbo9UBfRy2AWRLePNPULy5c+qIMsGreJPKqHqrkS86xx9k
 EDGJyBU6XOaNxp52ITd8JQrSUHy62jkPuZsK61sKYPAs+OvJ5tUreWr1SDH18XDXkpYJ
 Mhx3K459rBluDWisuy0L5Ux3QHoVyaDYhHFVt1L1Dx6MWtxDXo6FvbUe0lSECAkvkr96
 mPRhkFsyQ8WDOPx/Hc0mdhze75HIwWzVf3XLSmEwe5BIBAfs7iuMMJm684RaRSBd1TBU
 0T8sL19isCge6f3tiCEzojgDDnz/vwnPcZS7+bfUWufXFyQO4H/PYsObxbrzqjhPNAmI
 AMtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGCrbTnnFOx7Phccr3fiummb7lvruyulEYeER3t6PPzujVjldywSxn3EI1WhWpuza0DlYCgv22X04=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyORU4awoFCRuQXUK7IVT1RRdi4M5HALuwIXCI2pzVOkPlzbthi
 gSoH2e/h2f421fmJZmz2xfTUWuTFjWUUpJRULtvxS/yr//F7LAdL2gVD/15T0c10DPk=
X-Gm-Gg: ASbGnctP1VGtj6biZT6CgqnP5YlUbRjCqGj9hVd0xo+txQyY9ci0njm/qBLa6ExJaPC
 1ctwPCbzg+0PHfCDhfvXM7+AkoHd39Or0MpSILd/3e9i+0aXvM5x53X5w8d8oKgDogNx6t2d7kS
 1bp03bbqPQ3CT8ylorZuUbiWEw3DYSW/9OG7HG1PnuxCh7SrWeNGF1nCwEh8H9fka0lQkiJJ4MB
 4dH3ydtL+5vM7NXiUyt8mssolLndnm/Wj8x2j0gTihUt2ZjFqIdL07vpUzEoxFOrNmtsHk+AN9i
 hjajuKWGOAR2x6Ygh8UJ+8+rMPTfN7WmheUW0yLU1bWvRII=
X-Google-Smtp-Source: AGHT+IHYYhe26HLPNKoBVcnNOy6/jkpQn8WfKdz60I6/TVd500pn0InVU9KvudOTGbI9ixjvqF8axQ==
X-Received: by 2002:a05:6a20:258b:b0:1f0:d1b3:7b39 with SMTP id
 adf61e73a8af0-220b050049cmr2367369637.1.1751126728462; 
 Sat, 28 Jun 2025 09:05:28 -0700 (PDT)
Received: from t14 ([2001:5a8:4528:b100:c6fe:2091:41f:3e3f])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af55786efsm4894673b3a.82.2025.06.28.09.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Jun 2025 09:05:28 -0700 (PDT)
Date: Sat, 28 Jun 2025 09:05:24 -0700
From: Jordan Rife <jordan@jrife.io>
To: Kyle Evans <kevans@freebsd.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com, 
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [RESEND PATCH v1 wireguard-tools] ipc: linux: Support
 incremental allowed ips updates
Message-ID: <hxqd4mhg6wir7oaatgtdshimtzdwkhlhdje2xet7mcj25g7zzt@jyhmin2ovram>
References: <20250517192955.594735-1-jordan@jrife.io>
 <aCzirk7xt3K-5_ql@zx2c4.com> <aCzvxmD5eHRTIoAF@zx2c4.com>
 <vq4hbaffjqdgdvzszf5j56mikssy2v2qtqn2s5vxap3q5gi4kz@ydrbhsdfeocr>
 <CAHmME9rbRpNZ1pP-y_=EzPxRMqBbPobjpBazec+swr+2wwDCWg@mail.gmail.com>
 <d309fd3a-daf1-4fd5-98aa-2920f50146fd@FreeBSD.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d309fd3a-daf1-4fd5-98aa-2920f50146fd@FreeBSD.org>
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

On Wed, Jun 25, 2025 at 10:37:55PM -0500, Kyle Evans wrote:
> On 5/21/25 18:51, Jason A. Donenfeld wrote:
> > On Thu, May 22, 2025 at 1:02 AM Jordan Rife <jordan@jrife.io> wrote:
> > > > > Merged here:
> > > > > https://git.zx2c4.com/wireguard-tools/commit/?id=0788f90810efde88cfa07ed96e7eca77c7f2eedd
> > > > > 
> > > > > With a followup here:
> > > > > https://git.zx2c4.com/wireguard-tools/commit/?id=dce8ac6e2fa30f8b07e84859f244f81b3c6b2353
> > > > 
> > > > Also,
> > > > https://git.zx2c4.com/wireguard-go/commit/?id=256bcbd70d5b4eaae2a9f21a9889498c0f89041c
> > > 
> > > Nice, cool to see this extended to wireguard-go as well. As a follow up,
> > > I was planning to also create a patch for golang.zx2c4.com/wireguard/wgctrl
> > > so the feature can be used from there too.
> > 
> > Wonderful, please do! Looking forward to merging that.
> > 
> > There's already an open PR in FreeBSD too.
> 
> FreeBSD support landed as of:
> 
> https://cgit.freebsd.org/src/commit/?id=f6d9e22982a
> 
> It will be available in FreeBSD 15.0 and probably 14.4 (to be released next
> year) as well.  I have pushed a branch, ke/fbsd_aip, to the wireguard-tools
> repository for your consideration.
> 
> Aside: this is a really neat feature.
> 
> Thanks!
> 
> Kyle Evans

That's great news. It's nice to see this feature percolating through
the WireGuard ecosystem.

I was working on adding support for direct IP removal to wgctrl-go too,
a Go library for controlling WireGuard devices:

https://github.com/WireGuard/wgctrl-go/pull/156

While I'm at it, I'll try to add native support for IP removal on
FreeBSD if I can get a dev build working with the latest and greatest
( I am a FreeBSD noob :) ).

Jordan

