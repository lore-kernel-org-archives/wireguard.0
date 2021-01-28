Return-Path: <SRS0=0rhS=G7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FD8C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Jan 2021 23:24:19 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC6D564DF4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Jan 2021 23:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC6D564DF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=prosimo.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa8a139d;
	Thu, 28 Jan 2021 23:24:15 +0000 (UTC)
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fbb4ccd1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jan 2021 23:24:14 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id n14so3685151qvg.5
 for <wireguard@lists.zx2c4.com>; Thu, 28 Jan 2021 15:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=prosimo-io.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=OFXtkdULyAs6sA4ap7564a9E0+Xdzibe1p6SjA47hGI=;
 b=tewDZsnzDJ+C5fGT9iO16TuzRSXQB0TzvAqnxvXG63/HL29puHyNahfuO4SzpuX/7U
 0I3ljkyBA/TRkcKdKBO/mP8DuvZZa0CE62gTEuDjcmDNZ15dCMhQFi682kdTmYDYfDoW
 rGl7UHBD1J/s7vD7Q/FkrcnMqB8s4ZjEYI66qfTHzkl+Wa7dMQr4heMTKGbJqCL9re3n
 r9myF+TH2q2aso9YrFIPXA8o7MPXjvBR6l50zMP1G4OdblS0SrwJYnHbIMFplFu+1vkQ
 2ATpHM+hX5pht8rXU6EtQZzw6ydmoV2dY4T1FDivQoXyYVps/wiuOZLV5fFO7SLuhpT9
 VziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=OFXtkdULyAs6sA4ap7564a9E0+Xdzibe1p6SjA47hGI=;
 b=UyALpwyqE1zjj8fmNIr8GryXJzhjUEpLtSK7FTyxtu4tz+PPqHJhHyuIFQKPzmrlVP
 ZegtfK/PQhdz5VOjTDLHV2yBG5m15rPIKCO+IEVjR4vJWCZ7yNpyohs++7JvIDhKUrt3
 wnvSxiztCcaHAEgDhBWp3dNlwEaTFX9MSRPdCjSzcfGQc980k60bV0xYsqS2zeBNgON7
 UTdsJmPiDCGHPpdqAALP02oUBgmqc8wA6Pdw166CRGXjV2+cJ88prbdz7n6TCnKp/aV8
 SCNNmsBsRhTtDqfFBzy4TPd80F2Qsu5rKWhTpnGnSOBrxmIHG2h+H/7vobx0MIkB8R40
 hkiQ==
X-Gm-Message-State: AOAM531616GcImESUtTSV0fAkhhMNQXk6YdRwqhbChlkjqGqWWXvnW10
 3YBYVdwf8x9V/RPOyXEQk3Nx+ew3uvF6QGADDx2tniDPXmH1jStd
X-Google-Smtp-Source: ABdhPJzK+zItV0zR4N5M1Xis5wFspimpeKO0IbBAxIQQk97RlaJdQ9cbtxRdTpq3yjnOdGuMnBIs0BQHIKpMnqgEVhA=
X-Received: by 2002:a05:6214:b2b:: with SMTP id
 w11mr1955268qvj.27.1611876252728; 
 Thu, 28 Jan 2021 15:24:12 -0800 (PST)
MIME-Version: 1.0
From: Manikandan Thiagarajan <tmani@prosimo.io>
Date: Thu, 28 Jan 2021 15:24:02 -0800
Message-ID: <CAJV1VRDbW+LWhy_zA5VqvdiVc_-S28M5Lv1L30j9JGC5ZcTKfg@mail.gmail.com>
Subject: [Windows] Unable to build latest wireguard missing
 i686-w64-mingw32-windres
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

Hi,

I am trying to update Wireguard to latest version on windows but could
not build because of missing dependencies i686-w64-mingw32-windres.
I can't go back to older commit such as 0.3.4 (a5102ca - version:
bump) because of go mod has reference to unknown revision
76ef01985b1c.
Please suggest how to fix either one of these issues. I can use either
of these commits.

Building off of commit 5f420f6 - manager: pipeline UAPI requests
'i686-w64-mingw32-windres' is not recognized as an internal or external command,
operable program or batch file.
[-] Failed with error #1.

Building off of commit a5102ca - version: bump
[+] Building library x86
get "golang.zx2c4.com/wireguard/windows": found meta tag
get.metaImport{Prefix:"golang.zx2c4.com/wireguard/windows", VCS:"git",
RepoRoot:"https://git.zx2c4.com/wireguard-windows"} at
//golang.zx2c4.com/wireguard/windows?go-get=1
go: golang.zx2c4.com/wireguard/windows@v0.0.0-20201130211600-76ef01985b1c:
invalid version: unknown revision 76ef01985b1c
[-] Failed with error #1.
[+] Rendering icons
[+] Assembling resources x86
[+] Building program x86
get "golang.zx2c4.com/wireguard/windows": found meta tag
get.metaImport{Prefix:"golang.zx2c4.com/wireguard/windows", VCS:"git",
RepoRoot:"https://git.zx2c4.com/wireguard-windows"} at
//golang.zx2c4.com/wireguard/windows?go-get=1
go: golang.zx2c4.com/wireguard/windows@v0.0.0-20201130211600-76ef01985b1c:
invalid version: unknown revision 76ef01985b1c
[-] Failed with error #1

Thanks,
Mani
