Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4BFC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Jun 2022 09:24:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a0bd4c20;
	Tue, 14 Jun 2022 09:23:26 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [2607:f8b0:4864:20::d2c])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id dfc700c9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 May 2022 14:09:14 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id 2so4737988iou.5
 for <wireguard@lists.zx2c4.com>; Fri, 27 May 2022 07:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=datawire.io; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=7Rr8RoG+3ZrG+EamFRZs/1zjQD7xTlYkE37HnxaM6C4=;
 b=gPS2m1HSqbVxals5RTmFAAHOpO7oHUajNEFQKwAzPMErJzwLB48QGx+Pp+/k3beix5
 2W0eBtCIC8t52jBhihYU5x8j+3IuA5vmdk9UOtFCvw265S7zGvCKtdQcVjk5wfj3VAM3
 /j5EtEeXVgglbf4IHCjZyjQmDJzdStwKY6LL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7Rr8RoG+3ZrG+EamFRZs/1zjQD7xTlYkE37HnxaM6C4=;
 b=DoWahNjqO4Wwn4Ft72trGQF2my5+pPSJGzJGMRFpeFPBujkRY0a6u/0kMEfskH5YE0
 8vE8OgAj2MlNBy0au8FK8wGIc+hwkJccH74/hDY7m5E7HPptIIeByQCR0cwIVwkGnpYh
 K3DLMIo0kfyL+2qPAnFSjiBOaJ+1oizEdKJK1kI+2I/KSP9WVsMjJGsm2GyqbEik9TS/
 Qyb9dibCND5syvuDA0M4zoFQXG0NJmU7lqI42d3CTkLbTPc1Q9KJrjOxnvLN7DrLF9vp
 7UV5K7+M48WfBU3Bvk6mVGr/wscfX+AwLrj8n0cNHzXMpsPgpCd7V3Bgbrnw6g6kyQx/
 9r0w==
X-Gm-Message-State: AOAM530GgjUmLnLrDDm2HSoXARLDpCHckIfk/sFEyERYbZxiTDSaYZx9
 eR3HVMfsnvKBLUQr2+KfNNfe8vwo6DCMxxPXfTj2nUTLOMCK3Q==
X-Google-Smtp-Source: ABdhPJxVgMsmeJ9PncIgUgpOYSMRBtgbp6Q5OYWKkxW0RGX/Z5NJMFxjFkWoyMpk/NxwpqhjoyQluMZ+AGbX2Ocg/9E=
X-Received: by 2002:a05:6602:73b:b0:665:8739:6a5b with SMTP id
 g27-20020a056602073b00b0066587396a5bmr6362214iox.1.1653660552715; Fri, 27 May
 2022 07:09:12 -0700 (PDT)
MIME-Version: 1.0
From: Thomas Hallgren <thomas@datawire.io>
Date: Fri, 27 May 2022 16:09:02 +0200
Message-ID: <CAGyv=Qv7vNrTvMriOxAyEHHUAz6qOOZDtjfj=+ru+yOKAcY8UQ@mail.gmail.com>
Subject: Incompatibility between wintun.dll and go module
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 14 Jun 2022 09:23:24 +0000
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

We're using the wintun.dll and the go module
golang.zx2c4.com/wireguard/windows v0.5.3 in our product. The dll
initialization fails when upgrading the wintun.dll to version 0.14.1
(or 0.14, it doesn't matter). 0.13 works fine. Relevant stack trace
below.

Thanks for an excellent library. Without it, it would be much harder
to port our product to Windows.

unexpected fault address 0xffffffffffffffff
fatal error: fault
[signal 0xc0000005 code=0x0 addr=0xffffffffffffffff pc=0xe8b29d]

goroutine 65 [running, locked to thread]:
runtime.throw({0x27b93d9?, 0x0?})
runtime/panic.go:992 +0x76 fp=0xc000a393d8 sp=0xc000a393a8 pc=0xce8996
runtime.sigpanic()
runtime/signal_windows.go:261 +0x125 fp=0xc000a39420 sp=0xc000a393d8 pc=0xcfbb05
golang.org/x/sys/windows.UTF16PtrToString(0x240e6a0?)
golang.org/x/sys@v0.0.0-20220209214540-3681064d5158/windows/syscall_windows.go:132
+0x1d fp=0xc000a39468 sp=0xc000a39420 pc=0xe8b29d
golang.zx2c4.com/wireguard/tun/wintun.setupLogger.func1(0xc000057590?, 0x0?)
golang.zx2c4.com/wireguard@v0.0.0-20210427022245-097af6e1351b/tun/wintun/wintun_windows.go:53
+0x1c fp=0xc000a394b0 sp=0xc000a39468 pc=0x1f321bc
runtime.call16(0x0, 0x28df468, 0xc000a39538, 0x0, 0x0, 0x10, 0xc000a39790)
runtime/asm_amd64.s:701 +0x50 fp=0xc000a394d0 sp=0xc000a394b0 pc=0xd14530
runtime.callbackWrap(0x7c95ffebc0)
runtime/syscall_windows.go:378 +0x134 fp=0xc000a398b0 sp=0xc000a394d0
pc=0xd04074
runtime.cgocallbackg1(0xd03f40, 0x0?, 0x0)
runtime/cgocall.go:314 +0x2ca fp=0xc000a39980 sp=0xc000a398b0 pc=0xcb4b8a
runtime.cgocallbackg(0xc000583380?, 0x300000002?, 0xc000583380?)
runtime/cgocall.go:233 +0x106 fp=0xc000a39a18 sp=0xc000a39980 pc=0xcb47c6
runtime.cgocallbackg(0xd03f40, 0x7c95ffebc0, 0x0)
<autogenerated>:1 +0x36 fp=0xc000a39a40 sp=0xc000a39a18 pc=0xd18356
runtime.cgocallback(0xcb464b, 0xd17be0, 0xc0001002c0)
runtime/asm_amd64.s:971 +0xd7 fp=0xc000a39a68 sp=0xc000a39a40 pc=0xd160f7
runtime.systemstack_switch()
runtime/asm_amd64.s:436 fp=0xc000a39a70 sp=0xc000a39a68 pc=0xd13fe0
runtime.cgocall(0xd17be0, 0xc0001002c0)
runtime/cgocall.go:167 +0xab fp=0xc000a39aa8 sp=0xc000a39a70 pc=0xcb464b
syscall.SyscallN(0x7ffc169c3a90?, {0xc000a39b40?, 0x3?, 0x0?})
runtime/syscall_windows.go:538 +0x109 fp=0xc000a39b20 sp=0xc000a39aa8
pc=0xd12de9
syscall.Syscall(0xc000479590?, 0x1a428c8510a?, 0x1a428c8510a?, 0x0?, 0x0?)
runtime/syscall_windows.go:476 +0x3b fp=0xc000a39b68 sp=0xc000a39b20 pc=0xd129fb
golang.zx2c4.com/wireguard/tun/wintun.(*Pool).OpenAdapter(0xc000187800,
{0x27b825c?, 0x1a403910598?})
golang.zx2c4.com/wireguard@v0.0.0-20210427022245-097af6e1351b/tun/wintun/wintun_windows.go:89
+0xad fp=0xc000a39bd8 sp=0xc000a39b68 pc=0x1f3256d
golang.zx2c4.com/wireguard/tun.CreateTUNWithRequestedGUID({0x27b825c,
0x4}, 0x0?, 0x0)
golang.zx2c4.com/wireguard@v0.0.0-20210427022245-097af6e1351b/tun/tun_windows.go:75
+0x4d fp=0xc000a39c50 sp=0xc000a39bd8 pc=0x1f3384d
golang.zx2c4.com/wireguard/tun.CreateTUN(...)
golang.zx2c4.com/wireguard@v0.0.0-20210427022245-097af6e1351b/tun/tun_windows.go:63
