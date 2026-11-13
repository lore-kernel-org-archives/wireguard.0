Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBF1606A337
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 13 Nov 2026 17:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TEJX86Ba
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 690adb16;
	Fri, 13 Nov 2026 17:42:37 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id ec058737
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 13 Nov 2026 17:42:35 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso7774995e9.2
 for <wireguard@lists.zx2c4.com>; Fri, 13 Nov 2026 09:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794591755; x=1795196555; darn=lists.zx2c4.com;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=kO73QjDBfpWHjLW3kB+PyMjmhbxy0Ai1Tg0W4jImrP4=;
 b=TEJX86Ba5rcBbPseY88JOOoFlY88OIZBSoSlk5e+GN2T4fCLt39FX8dXOGRZ+sopXJ
 lyvcYGh62065vxqDqvaIMgAS4kxe9JuFTyOGxqlEXyKF56Kgi+DdQaR4KihrVmHSn+OS
 YeAozw3I0utDCRbsAOdiQIDnwNSDbum36w3zz/nuXVSUyI3Zt3wB6RfSt7iF8osllRJn
 iYF4hZtGtv7RGTVYmGSnhtwVFWXmtxv6m0eq/xtJVTU5yiXtmHzW66SZ4UCaFhBW1Wbh
 l42AUJTdNuoIl2oEndW0t5khBtgRrVqq4uEHELTqtRdJY7HP1q/oalBEJyVEM/l45gCI
 jxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794591755; x=1795196555;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kO73QjDBfpWHjLW3kB+PyMjmhbxy0Ai1Tg0W4jImrP4=;
 b=cCZ35Xwp56+SO2ann6HTtcPTz0OM3TuCSAlFB4/duMcz99sd6/BnAxYnyIexCrAK8L
 Igdfa5OhbTjgQGIvXeoKojxWaBDwBVKV882QhngEUPXlXLExPd+AbvErpfFI4upNWh2/
 7mFL8Y5r1mPKsUxC6hkDpeTjiXgOQZXmgAsddg4E6A3okahaclOn6zW0o7bdSXi7l/pX
 2yvuI82+O/ZBeB8sF3R3rKifFL/aVWgluUf6PmLcBgwUtBk9sRPqqbV5Wf6buxRar1KB
 eenm0jJTqqkuSf8iJPcgzoQ5qF50Pyzr0RDQEaJVdk49pSmxABBmvw8dZ2/ABxp3gmEd
 iGGw==
X-Gm-Message-State: APuU4Z93VziCzZtzIQ2GpZDF7U1bvFS0740ie1AJcMqiKV3Nmm+tZNc2
 fQHT5VEwnRsJcBHx1brR436gTsvaGWK1jSe5dZx2xg2XLNVadEp2EfanU0N9bA==
X-Gm-Gg: AYBFou1nyxEJS7WNyiiUvXsFuUc2AMfiV1NtcY+OGa22CcDh/of017z4aD/2whAuhiv
 3OIO+XIc96ve0K+acC4wMSpQ6M+/Sp5d2Y64tTGw5y7XHnVknXwH/yN1bXL/cCzcZZBwd2c3kKx
 e0CIUb1S9zEnxyoOZOio8jN/1g/lv7vppb/HsvlvMei0+tZslo1+z6aztFl/ZKanh0ErcujZjPK
 210MOecdFxNT/WcIsRnKmq/9qdY6eWcSgoFkn3gmg25a6h5kynIv07E838BO2AAEBf8UxmZE3Mg
 xP3G1Tj7wgo/AjVHZjln/9oP64cwcyj6TVyWLUQXzLTiyJuGHiH9RHoeOAqFSJEgz+Z1aBl9tBJ
 k6phYCqj33082ji1Q4OuHWgApW1wMSYyHN8cXYaB7pfSvDeNLtWJoujn6VIaHH037I9bt6Hwpid
 b+RH+PBp7o9ZouMf8nmUc5/cjZmdICxUA9Zh7cQg+VbLM7ycQ6Cek/HHnLDO78wyu5jdl84JtmY
 06bOe9yZnaUV7x6vgex28Ev4mzPSMd40tPPbgScIVuyMHwZ2EJahEYNdpkS/KS5M6PO+l3FzB09
 DktY/+54UD9h4YL+GXiFkD5Ff8FbaYDXPp2YBY1InE79/rrvcYKnXGQ+RuIF
X-Received: by 2002:a05:600d:8654:10b0:49f:ce78:3562 with SMTP id
 5b1f17b1804b1-4bb55a8c859mr58005525e9.19.1794591754965; 
 Fri, 13 Nov 2026 09:42:34 -0800 (PST)
Received: from smtpclient.apple ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f7828a4sm6577524f8f.23.2026.11.13.09.42.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Nov 2026 09:42:34 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH wireguard-apple 0/7] macOS: build fix, resizable tunnels
 list, localization fixes, language menu and lint cleanups
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
In-Reply-To: <20261113172421.35096-1-yoandysse@gmail.com>
Date: Fri, 13 Nov 2026 19:42:32 +0200
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: 7bit
Message-Id: <2F2B374E-0201-4A53-A41F-E6817FFA36F2@gmail.com>
References: <20261113172421.35096-1-yoandysse@gmail.com>
To: Yoandy Isse <yoandysse@gmail.com>
X-Mailer: Apple Mail (2.3864.700.51.1.1)
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Yoandy,

Thanks for testing the multiple tunnels series on macOS 27, and for
carrying the sys/types.h fix. That is fine with me: it is the same
patch as 01/10 of my series [1], so whichever series is applied first,
the other copy can simply be dropped. Apart from that the two series
only meet in Base.lproj/Localizable.strings, in different places, and
your hunk applies cleanly on top of mine.

Since the GitHub repository is only a mirror, a Tested-by in reply to
the series on the list would carry more weight than the comment on the
pull request, if you don't mind adding one.

I went through yours. 3/7, 6/7 and 7/7 look good to me: the fallback
in 3/7 helps every localization that lags behind Base, not only
Spanish; unused_import only runs under `swiftlint analyze`, so
analyzer_rules is where it belongs; and in a non-lazy property
initializer `self` is indeed not the view controller.

One small thing in 2/7: whether to set the initial divider position is
decided by reading "NSSplitView Subview Frames ManageTunnelsSplitView"
from UserDefaults, which is the key AppKit uses internally for
autosaveName and is not documented. A flag of your own would not
depend on that format.

[1] https://lists.zx2c4.com/pipermail/wireguard/2026-August/009689.html

Thanks,
Razvan


multumesc,
razvan

---
Razvan Cremenescu
razvan.cremenescu@gmail.com




> On 13 Nov 2026, at 19:24, Yoandy Isse <yoandysse@gmail.com> wrote:
> 
> Hi,
> 
> This series contains small, independent fixes for the macOS app that I
> ran into while using it daily. Each patch builds on its own on top of
> master (2fec12a).
> 
> Patch 1 is Razvan Cremenescu's build fix from his multiple-tunnels
> series [1]. Current master does not build with recent Xcode versions
> (tested with Xcode 27.2), so I included it here so that the rest of
> the series can be built and tested. It can be dropped if his series is
> applied first.
> 
> Patch 2 makes the tunnels list resizable, so long tunnel names can be
> read in full.
> 
> Patches 3 and 4 fix untranslated strings. Missing translations
> currently show up as raw keys (e.g. "macFieldKey (Interfaz)"), so
> patch 3 falls back to English for any key a localization lacks, which
> helps every language, and patch 4 completes the Spanish translation.
> 
> Patch 5 adds a Language menu, so the app's language can be changed
> without going through System Settings.
> 
> Patches 6 and 7 fix the remaining SwiftLint warnings. Patch 7 makes
> removeButton lazy: it passed `self` as its target from a non-lazy
> property initializer, where `self` is not the view controller. I
> checked that the button still removes the selected tunnel.
> 
> Tested on macOS 27.2.1 (Apple Silicon) with Xcode 27.2 and Go 1.27.4.
> 
> I also tested Razvan's multiple simultaneous tunnels series [1] on the
> same setup: two tunnels stay active at the same time, which is
> exactly what I needed (one tunnel for a site network
> and another for a second network, as already works on Windows).
> 
> I'd be glad to help more with the Apple apps: reviewing and testing
> patches on new macOS releases, translations, and small fixes like
> these. If help with maintenance is welcome, please let me know how I
> can best contribute.
> 
> Thanks,
> Yoandy
> 
> [1] https://github.com/WireGuard/wireguard-apple/pull/63
> 
> Razvan Cremenescu (1):
>  WireGuardKitC: include sys/types.h for BSD type definitions
> 
> Yoandy Isse (6):
>  macOS: make the tunnels list resizable
>  App: fall back to English for missing translations
>  App: es: complete and fix the Spanish translation
>  macOS: add a language menu
>  App: fix SwiftLint warnings
>  macOS: make removeButton lazy so its target is the view controller
> 
> .swiftlint.yml                                |   3 +-
> .../Base.lproj/Localizable.strings            |  10 ++
> Sources/WireGuardApp/LocalizationHelper.swift |  26 +++-
> Sources/WireGuardApp/UI/macOS/MainMenu.swift  | 119 +++++++++++++++---
> .../ManageTunnelsRootViewController.swift     |  44 +++++--
> .../TunnelsListTableViewController.swift      |   5 +-
> .../WireGuardApp/es.lproj/Localizable.strings | 112 +++++++++++------
> Sources/WireGuardKitC/WireGuardKitC.h         |   2 +
> 8 files changed, 255 insertions(+), 66 deletions(-)
> 
> -- 
> 2.54.0 (Apple Git-157)
> 

