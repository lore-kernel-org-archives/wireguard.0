Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476DCC072A2
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Nov 2023 13:57:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36bfea5e;
	Sun, 19 Nov 2023 13:34:54 +0000 (UTC)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 824e0419
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 7 Oct 2023 22:47:20 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-538575a38ffso5485782a12.1
 for <wireguard@lists.zx2c4.com>; Sat, 07 Oct 2023 15:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696718839; x=1697323639; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ff2iXSB8IrTT7T3lWCDZ4qSdrWPr4XM+ss5qEJFHMGM=;
 b=jgNmxXJ+iUpjbf2AMwxbTSc155ycndum/zfzhuXmko9lMywp9uUgSEuuoGgpabb40V
 0vWztZ0fSRerOgZFC3/5DOFOAfxHRQ5h9xz5E71GEzeLNQ8McGp1r4CwfC1W1TQr9V0K
 XGetnUVekSkBaz7LEOn/sHoMFbYw275LauHUGPzrKoGlpitw/NkhYO667xy0T9p10DEo
 Y/zvYsiA246haL+oA7gF0rm1BD25fziGbNM4YpuoG1YsrwKzS138cYzzYtGYB1T1MGhQ
 oTmUhoTDpwPe4HFrBbNy+hy9j80CAW2wCBB9/IRFcawdDEG8lzm0l49O/V2VvCW1Elv1
 eQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696718839; x=1697323639;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ff2iXSB8IrTT7T3lWCDZ4qSdrWPr4XM+ss5qEJFHMGM=;
 b=Z5Fv7hZizHBkgUe5DBnClrTmYe7h6wFWfTSfu9oYYhfc5QSWomOp3dwAuCJcdtEnhV
 QwtJxtD4mzkeyuUrglh688O0cSw6UgTWJA35105TTuWljOZvW5F6b6wN2cqvxGoU5M7W
 VwIw0zFfkyuvdHlhcXUfKZe/dLa3xFFZMGOqW0xVilyNsnzC6VJostzmRq/6cJySxiBD
 0efRGX72wrfsmnHjdg/6of9bFHxw3foC9UTD2rbAj2U4eX6rCU5aQCBpj9oUemeBAJ0y
 lCOrz+8MLUjQXI7xvMaiOWUE91zvpyFtyHsXiBPe5+WRtww/FQLf4uqaZNVOxYOCTL0Q
 Z4IQ==
X-Gm-Message-State: AOJu0YzbLaA4YjJSZBSdfvcnk6dFujeSQr2x/JBDcBcWFN/8fs/eY6zv
 ur3ZZ1vswlDrGkLElghHHKZcJ3CNfNkVdAJ+HMX0QAyhoXY=
X-Google-Smtp-Source: AGHT+IG4O3D1V9Y4+B1S6lmppoXkLZ3HTSxAE5IZIWUAEsYaKu0RkLdPF5hvKsogTyEbWihw/x/AHMNWFlLDPjaHBf4=
X-Received: by 2002:a05:6402:31e5:b0:538:8949:9dff with SMTP id
 dy5-20020a05640231e500b0053889499dffmr9918181edb.27.1696718839415; Sat, 07
 Oct 2023 15:47:19 -0700 (PDT)
MIME-Version: 1.0
From: Jan Noha <nohajc@gmail.com>
Date: Sun, 8 Oct 2023 00:46:43 +0200
Message-ID: <CAEqCujJ7bck6w0UiKdwXFfH6R+RWgALZg5JUxEuQupUgPRHQPg@mail.gmail.com>
Subject: UAPI socket for the macOS sandboxed Wireguard app
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 19 Nov 2023 13:34:52 +0000
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

Hello,

I want to submit a series of patches concerning Wireguard on macOS.

If it's ok, I will just link to a github PR which links to three other
PRs (in wireguard-apple, wireguard-go and wireguard-tools).

https://github.com/WireGuard/wgctrl-go/pull/143

Let me explain what this is about. I've been trying to automate
Wireguard tunnel configuration for some P2P use cases and I wanted to
use wgctrl-go library for the task.

This already works fine on Linux and Windows. On macOS, it's a bit
more complicated. If you only use CLI for creating tun interfaces
(using wireguard from homebrew for example), it also works.
Specifically, wgctrl-go communicates with the wireguard user-space
daemon via a unix domain socket located in /var/run/wireguard/ (this
is referred to as UAPI in the code).

However, if you want to use Wireguard from the App Store - which has
some other advantages besides the UI (such as on-demand VPN and
generally nice OS integration) - it comes as a sandboxed Network
Extension. Currently, it does not expose any UAPI socket, so wgctrl-go
cannot be used to configure it.

The socket can be opened except it has to be inside the sandbox home
directory. There is no problem connecting to it from "outside" using
cli tools which are not sandboxed themselves.

That's basically what I did here. Changes were needed in
wireguard-apple and wireguard-go to open the socket in a
macOS-specific location, then I updated wgctrl-go and wireguard-tools
(so that wg commands work too) to look for UAPI sockets in both the
sandbox location and the default one.

If you're interested in discussing this topic further, I'll look
forward to any feedback.

Thank you,
Jan Noha
