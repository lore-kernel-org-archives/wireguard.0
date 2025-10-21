Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E7ACF58FE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 21:44:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81b0ceec;
	Tue, 18 Nov 2025 17:33:37 +0000 (UTC)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 72923238
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Oct 2025 02:09:09 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-2698384978dso36109285ad.0
 for <wireguard@lists.zx2c4.com>; Mon, 20 Oct 2025 19:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761012547; x=1761617347; darn=lists.zx2c4.com;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=RSHZrMdT1rNKLCfHO0WzHkGQXMBPH1VXE0UZcdITjiE=;
 b=WsZ5H4LUnaz4788sh9tiwPGkpIUh4Gj2kx/apqahXsFyS3Yr2MF5JI7TtnmiKgnbpV
 R2cnpfAaAXy3LnBijz3qfOj31fbNJmyRsQJrv/Nw+4O2GUv9kOAmX72jhQgNJS5RvttK
 l6npd8l904Nbweif+hXT9kQmaul6RGeqXHrCMl11OzrBvINgRDm8rDOuCXyKa7gso39q
 KB/GdkkRnMbk9Ov5y8Z1sv3DRStb3TlAeP7flzZoK6BxeeTJJJ4Mbs1OyzjzATrp7B21
 Pt/dHcBsSy9xOfaJ1B26UpciACKn/VCvH4n+gyPMPEipc35msOxCfRNoMRHvM1pcClry
 ACaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761012547; x=1761617347;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RSHZrMdT1rNKLCfHO0WzHkGQXMBPH1VXE0UZcdITjiE=;
 b=ThOdLuw8Sg1wMxZFHJpn23un5mpGpbcUcya93VchDZHDs9kGVDSi8/GVldlhBgUBo6
 pKh5S0itheM+aVom++H8OtvpbqrAuPxF1WxFFCsSxx4CU3Mur/CoygekSr0XFoqGFmDQ
 ktc6HGBz8m4X1mE81oksKZCT+si/tS1mt5nXTBa7cLw/x6tIyBG2r8I10z6+fMQcmZ5y
 4/ZpBBPnFUDmFfDLmBu58oHeUvJ3jtC59JpIRF3cHgnW+r9ML/zfXpnIJ3L20rwwpoL1
 tYHoJYSuVrYRrXkNg/sHR3sDFQPjPEQwLddlbw5PUNocsmrpz9+Pxynh3Zvg4Lr+G/OO
 rWJg==
X-Gm-Message-State: AOJu0YyN4crwp5z0EuC9XR0EWxQhfO1Ng53QUDQL+6YVrtkZiN3Lp3tX
 AT/Xo+wMQr5fGP79g/2LS6tAdpHQEZ/v8gZh8UEqCBW6O5H3YOe3uVE1ixf1jQzvzYbwrx9lW2c
 NlEZabJfm0Eqs5wpHVJ++DGzAwhC/TSgr8/7b
X-Gm-Gg: ASbGncsAqIoQSDjUK1D30qVz/xgpY3F0YCmW50PpmJcBXolvcpBI60L7SvJMO8FLc46
 dNdMDyzRrMi/+15E3/4OSJKzdmIc9lgx5TUgzpWWMpRQ75S8R5/EhALupf6CzpynwnnqBNRNlHc
 DqQSIc9Tni4w5H/E3qdrNdU0SnBvu7t436f26rx5RZXCMOVTOvhLpWzaCY+n0XmTYQOpQU4BB4Q
 A/QL9ALDuPmp2RladOLUflx3ZunmnD5gTWFTHo/93MooC+X7hx0O+G1mgQmoqVMteKq8g==
X-Google-Smtp-Source: AGHT+IGI6nmhwmy6qVV/5p98VPbodX2KbY/ejETa/NKy48hQF8/IWksWUPDrLNOcGYbgqzWaEnpoxE+cPeFDLYDBOeI=
X-Received: by 2002:a17:902:d501:b0:28e:7fce:667e with SMTP id
 d9443c01a7336-290c9cbc6d2mr196330075ad.17.1761012547292; Mon, 20 Oct 2025
 19:09:07 -0700 (PDT)
MIME-Version: 1.0
From: Jesper Juhl <jesperjuhl76@gmail.com>
Date: Tue, 21 Oct 2025 04:08:31 +0200
X-Gm-Features: AS18NWCV60O9H_TfISsqY7ZnWFD9f_H8XtVJP2DI992D3PQ7BXcUyCc296_2jFs
Message-ID: <CAHaCkmc_CrwBRj-Gji_td9S19oPg9U9-n8B4u8yTR4sPm9Vx7Q@mail.gmail.com>
Subject: [PATCH] Fix up 'make versioncheck' issues
To: wireguard@lists.zx2c4.com, linux-kselftest@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Jesper Juhl <jesperjuhl76@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:16 +0000
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

From d2e411b4cd37b1936a30d130e2b21e37e62e0cfb Mon Sep 17 00:00:00 2001
From: Jesper Juhl <jesperjuhl76@gmail.com>
Date: Tue, 21 Oct 2025 03:51:21 +0200
Subject: [PATCH] [PATCH] Fix up 'make versioncheck' issues

'make versioncheck' currently flags a few files that don't need to
needs it but doesn't include it. This patch fixes that up.

Signed-Off-By: Jesper Juhl <jesperjuhl76@gmail.com>
---
samples/bpf/spintest.bpf.c                                | 1 -
tools/lib/bpf/bpf_helpers.h                               | 2 ++
tools/testing/selftests/bpf/progs/dev_cgroup.c            | 1 -
tools/testing/selftests/bpf/progs/netcnt_prog.c           | 2 --
tools/testing/selftests/bpf/progs/test_map_lock.c         | 1 -
tools/testing/selftests/bpf/progs/test_send_signal_kern.c | 1 -
tools/testing/selftests/bpf/progs/test_spin_lock.c        | 1 -
tools/testing/selftests/bpf/progs/test_tcp_estats.c       | 1 -
tools/testing/selftests/wireguard/qemu/init.c             | 1 -
9 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/samples/bpf/spintest.bpf.c b/samples/bpf/spintest.bpf.c
index cba5a9d507831..6278f6d0b731f 100644
--- a/samples/bpf/spintest.bpf.c
+++ b/samples/bpf/spintest.bpf.c
@@ -5,7 +5,6 @@
 * License as published by the Free Software Foundation.
 */
#include "vmlinux.h"
-#include <linux/version.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_tracing.h>

diff --git a/tools/lib/bpf/bpf_helpers.h b/tools/lib/bpf/bpf_helpers.h
index 80c0285406561..393ce1063a977 100644
--- a/tools/lib/bpf/bpf_helpers.h
+++ b/tools/lib/bpf/bpf_helpers.h
@@ -2,6 +2,8 @@
#ifndef __BPF_HELPERS__
#define __BPF_HELPERS__

+#include <linux/version.h>
+
/*
 * Note that bpf programs need to include either
 * vmlinux.h (auto-generated from BTF) or linux/types.h
diff --git a/tools/testing/selftests/bpf/progs/dev_cgroup.c
b/tools/testing/selftests/bpf/progs/dev_cgroup.c
index c1dfbd2b56fc9..4c4e747bf827a 100644
--- a/tools/testing/selftests/bpf/progs/dev_cgroup.c
+++ b/tools/testing/selftests/bpf/progs/dev_cgroup.c
@@ -6,7 +6,6 @@
 */

#include <linux/bpf.h>
-#include <linux/version.h>
#include <bpf/bpf_helpers.h>

SEC("cgroup/dev")
diff --git a/tools/testing/selftests/bpf/progs/netcnt_prog.c
b/tools/testing/selftests/bpf/progs/netcnt_prog.c
index f9ef8aee56f16..3cf6b7a27a34a 100644
--- a/tools/testing/selftests/bpf/progs/netcnt_prog.c
+++ b/tools/testing/selftests/bpf/progs/netcnt_prog.c
@@ -1,7 +1,5 @@
// SPDX-License-Identifier: GPL-2.0
#include <linux/bpf.h>
-#include <linux/version.h>
-
#include <bpf/bpf_helpers.h>
#include "netcnt_common.h"

diff --git a/tools/testing/selftests/bpf/progs/test_map_lock.c
b/tools/testing/selftests/bpf/progs/test_map_lock.c
index 1c02511b73cdb..982bdbf0dba6b 100644
--- a/tools/testing/selftests/bpf/progs/test_map_lock.c
+++ b/tools/testing/selftests/bpf/progs/test_map_lock.c
@@ -1,7 +1,6 @@
// SPDX-License-Identifier: GPL-2.0
// Copyright (c) 2019 Facebook
#include <linux/bpf.h>
-#include <linux/version.h>
#include <bpf/bpf_helpers.h>

#define VAR_NUM 16
diff --git a/tools/testing/selftests/bpf/progs/test_send_signal_kern.c
b/tools/testing/selftests/bpf/progs/test_send_signal_kern.c
index 176a355e30624..e70b191162359 100644
--- a/tools/testing/selftests/bpf/progs/test_send_signal_kern.c
+++ b/tools/testing/selftests/bpf/progs/test_send_signal_kern.c
@@ -1,7 +1,6 @@
// SPDX-License-Identifier: GPL-2.0
// Copyright (c) 2019 Facebook
#include <vmlinux.h>
-#include <linux/version.h>
#include <bpf/bpf_helpers.h>

struct task_struct *bpf_task_from_pid(int pid) __ksym;
diff --git a/tools/testing/selftests/bpf/progs/test_spin_lock.c
b/tools/testing/selftests/bpf/progs/test_spin_lock.c
index d8d77bdffd3d2..9bcee268f828b 100644
--- a/tools/testing/selftests/bpf/progs/test_spin_lock.c
+++ b/tools/testing/selftests/bpf/progs/test_spin_lock.c
@@ -1,7 +1,6 @@
// SPDX-License-Identifier: GPL-2.0
// Copyright (c) 2019 Facebook
#include <linux/bpf.h>
-#include <linux/version.h>
#include <bpf/bpf_helpers.h>
#include "bpf_misc.h"

diff --git a/tools/testing/selftests/bpf/progs/test_tcp_estats.c
b/tools/testing/selftests/bpf/progs/test_tcp_estats.c
index e2ae049c2f850..eb0e55ba3f284 100644
--- a/tools/testing/selftests/bpf/progs/test_tcp_estats.c
+++ b/tools/testing/selftests/bpf/progs/test_tcp_estats.c
@@ -34,7 +34,6 @@
#include <string.h>
#include <linux/bpf.h>
#include <linux/ipv6.h>
-#include <linux/version.h>
#include <sys/socket.h>
#include <bpf/bpf_helpers.h>

diff --git a/tools/testing/selftests/wireguard/qemu/init.c
b/tools/testing/selftests/wireguard/qemu/init.c
index 3e49924dd77e8..20d8d3192f75c 100644
--- a/tools/testing/selftests/wireguard/qemu/init.c
+++ b/tools/testing/selftests/wireguard/qemu/init.c
@@ -24,7 +24,6 @@
#include <sys/sysmacros.h>
#include <sys/random.h>
#include <linux/random.h>
-#include <linux/version.h>

__attribute__((noreturn)) static void poweroff(void)
{
--
2.51.1
