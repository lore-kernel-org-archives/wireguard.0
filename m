Return-Path: <SRS0=zGfa=LJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C14C49EA2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Jun 2021 13:40:13 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8502A6147F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 15 Jun 2021 13:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8502A6147F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a6ae18c;
	Tue, 15 Jun 2021 13:40:10 +0000 (UTC)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3bcdfa1f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Jun 2021 20:03:43 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id e3so9583544qte.0
 for <wireguard@lists.zx2c4.com>; Mon, 14 Jun 2021 13:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=kK841Lw7YC9hiwn9aCCye9V4nBpJh4jrOLaUEnuWPkY=;
 b=fTJ9a4xg7nBK0E8Zik8HQJTHW8WllX5wbaCjjGr0H3kSJyE5S+RpBUBuL0UKeH8ZDf
 Kl85uSfW5vNeziOYeMeKZPv1rD/iNmnuvCWRIfU1qRkVdHxb4UnuExOTZu9EPoP0Q5Ke
 bXHCheBlOv578PTGj0OhSVl3TI+JhYBdMm96Vjp89JxENuHi7vH6s6Wu8qMxtMzIKzqa
 PEH2Fu0YzHq2y0lg0h1N2PqyslcJjS6dchuHUjVFhx410kmAdLMyBCkXYBAmY4idS1NV
 mjbzviuQHsRcjylhEh8U1pVMblI67X5btdeD/nD8D5az8pFifNNKPvydoDEvygjmqzKC
 eq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kK841Lw7YC9hiwn9aCCye9V4nBpJh4jrOLaUEnuWPkY=;
 b=CX/sbqqDrJ+XpylsCSOOl4jF1zV11F2wHdM6UD2zhV0iUcw8qbNOuoa2m2shM/lLbv
 xQ0EHGg9fnr6/bW8wz6TW8AXkttz48roWNPRajmV/Lqmc5XzPhXR53TxxKZb4sPRHiIE
 pj8KqPB2ce7bVN/aWIH2P7xOX5s3KTahGKkP1f1kI4NUZkGrSh3kGXd816xOydA7SMS+
 M8sjGfzlQyzITyCa7HV9ycT5agN4FlZeoHG+o5fV69cP8f/JyeMCMWnj3ku2yKqSI6Qf
 EWYxyI7x9gWGhatkbHEOSnk/6laNpC6P3aKUjnNJFvYh4kKmmlEhUv1FixJz3kKo/YZ+
 Ia2w==
X-Gm-Message-State: AOAM5320/k72Ek+B9T9hnIk+Wj3ZtADkFIaTEIbOqX1CimWE5/7ABP6K
 5FDGomCIXTWzygqGRpsNtACbwiMgu9gIqQkGtP7kTIfSJkh8qA==
X-Google-Smtp-Source: ABdhPJyhYOmgX2S0QXPOwCLHh7EGf12aS7C/mQt7ksXbFw2vbB0QzPEcDtG8vWm8JLqDtNlPpsj1c+MH87WTgaVfmPs=
X-Received: by 2002:ac8:7d46:: with SMTP id h6mr904656qtb.57.1623701021916;
 Mon, 14 Jun 2021 13:03:41 -0700 (PDT)
MIME-Version: 1.0
From: Eric Romano <gelstudios@gmail.com>
Date: Mon, 14 Jun 2021 16:03:26 -0400
Message-ID: <CAF2Tf9R3Q2FjP0SsmfTgROkEbC5ydrfmjUsv=5nu_ffvZ9AcJw@mail.gmail.com>
Subject: wintun interface sometimes can't start after wireguard-windows
 service dies
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 15 Jun 2021 13:40:09 +0000
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

Hey All,

I ran into some unexpected behavior with a script that calls
"/installtunnelservice" waits a bit, then calls
"/uninstalltunnelservice". This happens in a loop with some
connectivity checks in between.

When the tunnel service itself ("wireguard.exe /tunnelservice ...") is
killed, I noticed a log message that mentions "leftover residue" on
the next service startup or next "/installtunnelservice" call.

Most of the time, the client is still able to connect following the
wintun residue message.

snippet 1 >
2021-06-14 09:21:50.966: [TUN] [testClient] Starting WireGuard/0.3.14
(Windows 10.0.19042; amd64)
2021-06-14 09:21:50.966: [TUN] [testClient] Watching network interfaces
2021-06-14 09:21:50.970: [TUN] [testClient] Resolving DNS names
2021-06-14 09:21:50.970: [TUN] [testClient] Creating Wintun interface
2021-06-14 09:21:51.408: [TUN] [testClient] [Wintun] CreateAdapter:
Creating adapter
2021-06-14 09:21:51.408: [TUN] [testClient] [Wintun] CreateAdapter:
Requested GUID {01351A57-32EF-4644-C335-5A44C0808EC6} has leftover
residue
2021-06-14 09:21:51.768: [TUN] [testClient] [Wintun] SelectDriver:
Using existing driver 0.11
2021-06-14 09:21:53.679: [TUN] [testClient] Using Wintun/0.11
... (normal behavior resumes)

But on two different machines I've seen this error: "system cannot
find the file specified", after which the tunnel device does not come
up. At that point I attempted to uninstall the tunnel service, as well
as uninstall+reinstall wireguard, with no success. A reboot was the
only apparent way to recover from this state.

snippet 2 >
2021-06-14 13:23:49.668: [TUN] [testClient] Starting WireGuard/0.3.14
(Windows 10.0.19042; amd64)
2021-06-14 13:23:49.677: [TUN] [testClient] Watching network interfaces
2021-06-14 13:23:49.686: [TUN] [testClient] Resolving DNS names
2021-06-14 13:23:49.686: [TUN] [testClient] Creating Wintun interface
2021-06-14 13:23:49.954: [TUN] [testClient] [Wintun] CreateAdapter:
Creating adapter
2021-06-14 13:23:50.087: [TUN] [testClient] [Wintun] SelectDriver:
Using existing driver 0.11
2021-06-14 13:23:50.939: [TUN] [testClient] [Wintun] CreateAdapter:
Failed to setup adapter (code: 0x0, status: 0xc00002f0): The operation
completed successfully. (Code 0x00000000)
2021-06-14 13:23:51.045: [TUN] [testClient] Unable to create Wintun
interface: Error creating interface: The system cannot find the file
specified.
2021-06-14 13:23:51.056: [TUN] [testClient] Shutting down
... dead from here onward

Similar behavior with a different log message, unfortunately I don't
know what was different about this test run. The same version of
wireguard was in use.

snippet 3 >
2021-06-10 18:42:22.044051: [TUN] [testClient] Starting
WireGuard/0.3.14 (Windows 10.0.19042; amd64)
2021-06-10 18:42:22.044051: [TUN] [testClient] Watching network interfaces
2021-06-10 18:42:22.575650: [TUN] [testClient] Resolving DNS names
2021-06-10 18:42:22.575717: [TUN] [testClient] Creating Wintun interface
2021-06-10 18:42:27.920185: [TUN] [testClient] [Wintun] RegistryQuery:
Querying registry value
\REGISTRY\MACHINE\SYSTEM\ControlSet001\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0011\NetCfgInstanceId
failed: The system cannot find the file specified. (Code 0x00000002)
2021-06-10 18:42:27.920185: [TUN] [testClient] [Wintun]
GetNetCfgInstanceIdFromHKEY: Failed to get
\REGISTRY\MACHINE\SYSTEM\ControlSet001\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0011\NetCfgInstanceId
2021-06-10 18:42:27.920185: [TUN] [testClient] [Wintun]
GetNetCfgInstanceIdFromHKEY: Failed to get
\REGISTRY\MACHINE\SYSTEM\ControlSet001\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\0011\NetCfgInstanceId
2021-06-10 18:42:27.921506: [TUN] [testClient] [Wintun] CreateAdapter:
Creating adapter
2021-06-10 18:42:27.921506: [TUN] [testClient] [Wintun] CreateAdapter:
Requested GUID is already in use:
{928C5167-D802-9148-233E-28D4D15E1550}: Cannot create a file when that
file already exists. (Code 0x000000B7)
2021-06-10 18:42:28.506458: [TUN] [testClient] Unable to create Wintun
interface: Error creating interface: Cannot create a file when that
file already exists.
2021-06-10 18:42:28.506524: [TUN] [testClient] Shutting down
... dead from here onward

I acknowledge that killing the service PID is not the right way to
stop wireguard, but it does seem to clean up pretty well (routes, etc)
so I did not expect it to stay "broken".

Please let me know if there's something I can do to get more info
about any of the above errors.

Thanks,

-Eric
