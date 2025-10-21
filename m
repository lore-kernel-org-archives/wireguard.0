Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6E4CF3966
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 17:17:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28d29af8;
	Tue, 18 Nov 2025 17:32:43 +0000 (UTC)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 38677d9d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Oct 2025 17:49:50 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-33d28dbced5so4877449a91.2
 for <wireguard@lists.zx2c4.com>; Tue, 21 Oct 2025 10:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761068988; x=1761673788; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+q8Os3QV4AiQnNKQL40uNK7bo4U73YgmtqjVFwNJYtk=;
 b=IjRdXjeQ0wWi/ewTsOYXaYOJzD2ymHrdSbqVUekjYIMtALxQeq9k3auc7ZAO7ygW/2
 h52sqHKkdXFI9/rTaR+BLmWYmb+/mRG0unnuD6iJ07oO/TNhNzPP1L/Ne/1eKbZLH7ov
 smMMxndZndTDA+3uVh03CfXRMkoGoElF4qvhlGA9HDHUjzuBK2VfA/5dJYHvMqn6BBEm
 lgLXek8PjutyHHhYS1hAeCJvO3OMNMzvH7pcLlrDdZA7IDq+JGyVboYBb3/7UXcm0+aR
 M3dllzatvFBgFIp8E8wmVa4L9e6Q4CMuRKdqUM+9csLRiTnRoqAaCKf3i3qczPXAeh55
 OW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761068988; x=1761673788;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+q8Os3QV4AiQnNKQL40uNK7bo4U73YgmtqjVFwNJYtk=;
 b=E4qZmWCVUTb/68xgU/Rr8r7osGspNpH9wEbAuDG45h/e7PJLKmCYWEwA1X83f8dHH2
 EaV10qJbj/4jsd2SEV9ju5CWJLg5+32sKMK/OrIqDh3Dkyo2Fgv8xSxid96r38NSNRt+
 gwqYemQXdlS2baHFCh+pnXkEhhwf7DLXgYZKLaYxS4OmtPbOLFIpiaqpoz3eMaZaogi7
 bfy/W+gsEm0V3ovgFag6hvEPD56LgLou9FfdhgguTAT+B4oJH8zBtAiYso/LTT/Kq/9c
 DyxAqX3qSDNgyWAZJhxLPRq2svVTR9q7BfReyMSdQL9kokXDkzTxleSH2fginYF7V5q5
 IBpA==
X-Gm-Message-State: AOJu0YxQfQ/tqdUTl5dhpxmwvvZqMPHkPp9pL1F8J6Z0HSR91B6taJL1
 enFWxaXvqfPphAOhTTAHRfsUKZyKY91PRozMas4aVBUy1IIb8CMqK564L4D4S/qgLDo80XJawcV
 m95tbRfaMPSl8zQ/f3lElFWSuRetow+4=
X-Gm-Gg: ASbGncsdKQfYkn6rLbzSaexuzlAO7BRezEMO1fwoFR6/4PkQpVOQOFc0nvihqLRWy9/
 fGpcUpc/7QXsdmXkTJxfju41vjcr8SRZAGU7XgYwsrUZfS1aJDNBYF6RJ5OwOAtT3Fl3NyXVE/B
 MgrlMi+h2Vgkf6o19LQQZAYsjRgARh3vKJwJgzrsVc8+5Nwy/3MrM5vEQarYj843CTfPUKzlqmF
 k19lWYLF2951nVSgRqGeaxm4N0FmS50jL/bl4ceeKcISHDaT9hydoNK+wox6X2mi78v
X-Google-Smtp-Source: AGHT+IGOXQgu6lQWhFyf+t/CSA1diNM3SwVxnFnjh0utUblYzFhYLfjlWfGOvy2Gt+AOFXij58+2eNPtcHopEifHSlY=
X-Received: by 2002:a17:90b:3d87:b0:33b:b020:595e with SMTP id
 98e67ed59e1d1-33bcf8f78cfmr21160963a91.25.1761068988525; Tue, 21 Oct 2025
 10:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAHaCkmc_CrwBRj-Gji_td9S19oPg9U9-n8B4u8yTR4sPm9Vx7Q@mail.gmail.com>
In-Reply-To: <CAHaCkmc_CrwBRj-Gji_td9S19oPg9U9-n8B4u8yTR4sPm9Vx7Q@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 21 Oct 2025 10:49:36 -0700
X-Gm-Features: AS18NWAsfq3fhmrRaxV6XHiZww58Xefxp9cRzg3SYFrj93L49T-WggbE-aYzrZs
Message-ID: <CAEf4BzaKhqx+5O6k7i5naAxAhpPxBuWgy=ryFwkLzGROJxQbgw@mail.gmail.com>
Subject: Re: [PATCH] Fix up 'make versioncheck' issues
To: Jesper Juhl <jesperjuhl76@gmail.com>
Cc: wireguard@lists.zx2c4.com, linux-kselftest@vger.kernel.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Oct 20, 2025 at 7:09=E2=80=AFPM Jesper Juhl <jesperjuhl76@gmail.com=
> wrote:
>
> From d2e411b4cd37b1936a30d130e2b21e37e62e0cfb Mon Sep 17 00:00:00 2001
> From: Jesper Juhl <jesperjuhl76@gmail.com>
> Date: Tue, 21 Oct 2025 03:51:21 +0200
> Subject: [PATCH] [PATCH] Fix up 'make versioncheck' issues
>
> 'make versioncheck' currently flags a few files that don't need to
> needs it but doesn't include it. This patch fixes that up.
>
> Signed-Off-By: Jesper Juhl <jesperjuhl76@gmail.com>
> ---
> samples/bpf/spintest.bpf.c                                | 1 -
> tools/lib/bpf/bpf_helpers.h                               | 2 ++
> tools/testing/selftests/bpf/progs/dev_cgroup.c            | 1 -
> tools/testing/selftests/bpf/progs/netcnt_prog.c           | 2 --
> tools/testing/selftests/bpf/progs/test_map_lock.c         | 1 -
> tools/testing/selftests/bpf/progs/test_send_signal_kern.c | 1 -
> tools/testing/selftests/bpf/progs/test_spin_lock.c        | 1 -
> tools/testing/selftests/bpf/progs/test_tcp_estats.c       | 1 -
> tools/testing/selftests/wireguard/qemu/init.c             | 1 -
> 9 files changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/samples/bpf/spintest.bpf.c b/samples/bpf/spintest.bpf.c
> index cba5a9d507831..6278f6d0b731f 100644
> --- a/samples/bpf/spintest.bpf.c
> +++ b/samples/bpf/spintest.bpf.c
> @@ -5,7 +5,6 @@
>  * License as published by the Free Software Foundation.
>  */
> #include "vmlinux.h"
> -#include <linux/version.h>
> #include <bpf/bpf_helpers.h>
> #include <bpf/bpf_tracing.h>
>
> diff --git a/tools/lib/bpf/bpf_helpers.h b/tools/lib/bpf/bpf_helpers.h
> index 80c0285406561..393ce1063a977 100644
> --- a/tools/lib/bpf/bpf_helpers.h
> +++ b/tools/lib/bpf/bpf_helpers.h
> @@ -2,6 +2,8 @@
> #ifndef __BPF_HELPERS__
> #define __BPF_HELPERS__
>
> +#include <linux/version.h>
> +

this is libbpf's public API header, we are not adding linux/version.h
here. Linux version on which something was built has nothing to do
with the version of Linux on which the BPF program is actually
running. And BPF programs are most of the time intentionally Linux
version-agnostic.

[...]
