Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4378D10F40
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 01:54:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6432f52c;
	Mon, 18 Nov 2024 01:37:18 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2c4a3c6c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Sep 2024 18:46:58 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5365392cfafso4867908e87.0
 for <wireguard@lists.zx2c4.com>; Mon, 23 Sep 2024 11:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1727117217; x=1727722017; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o9SxBKtVnKUNRcU2l8i9+tr7LGseNTvA1HmjIgiJZ6c=;
 b=kbwWg4+w/OGDIJJfgTUcjzgC6DTtV+xgbC7E6OPU4TlzWMak1qmQ/48prKmKnWn4cL
 Mm78va3T3Cw9dfha8rv813F15cxcI2WZCgd+ypb8zMkpKPdAgTw0Y0uSUaCAxphrv/o2
 N2tpQCKJcIdabSSVBlMZyCf139rbeQ7JVQvhmtnzOUI969kTThKkO09kLSzo1IxF58uV
 Xb38xk1D7PpmQX6dh6u4ih4AUNZVX2mgenFIYCY6zfqm7eF5TeaPvMJfhkuIZ2plWIX6
 xDt5uAHCaZ6XEeowAbxWLqhlCtXkE32UoJ3Mn1hl/wYq5AkWs/IIbp6IyI3I0chuKKe1
 J9uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727117217; x=1727722017;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o9SxBKtVnKUNRcU2l8i9+tr7LGseNTvA1HmjIgiJZ6c=;
 b=Gpd1ud9JztO0ku5kVHMPGu1SoGoikTAy7aw65vN6YyClt0zVxx+lgKUVplWLIxCpDR
 owIXFpTtEHGA8LbZ+D4wXIYsWTnw2kUHUzn5/iTO4kdERKkFwcTa5ORqHAinm9vvxnZM
 D2+vLOtZ5fDEH/kMC7Ak7XLzVcNEEBqYoXgyCSjoEJTD6lvn+EHc+gZIZWQIMbDUbCVV
 RYAyfa/NHj+jMEam9J1g0CMAXdp0Azg0uAVnhclzMfwcRdyypj8y0MXOfiifsQi7mV0k
 OGpF0671Ut7sLOiFc09rDRGQmYeDQAWmx2Z86tqFcukEPOZjL/fqi8B45vHcwJUwvV3T
 gpTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwxnQVYlE4PbdizF6OrtTfwRuZBs+Nh0xIUu0P8WkkWDe5poQqqpoPxgvGA4WuXMj7Fj5whRT7rwc=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yzdp4xPpQbnRu+6LtHgN7/WE6ZTppMdhwJ4eddY7mbPZY6b7mi4
 qRy7mrRuElbWq87meFnNbKMvb6QHv4gXa/PuyJQNNF6wc4rVCukHxDmDUSfcijiDMhvFyDp17zI
 Ypq1P2b2SPM3GbStJaqoBha6XN/v/9mOO/YeJ
X-Google-Smtp-Source: AGHT+IEdUO93R9RfshiaEfkPtfC8Xl5uT3xw9/r+1yE0jsL1ViaO/11BK3hy0Now0uX6vpEhuQza2skF49C4GNi/gfc=
X-Received: by 2002:a05:6512:1293:b0:535:82eb:21d1 with SMTP id
 2adb3069b0e04-536ac34094fmr5590163e87.57.1727117217312; Mon, 23 Sep 2024
 11:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <CALrw=nGoSW=M-SApcvkP4cfYwWRj=z7WonKi6fEksWjMZTs81A@mail.gmail.com>
In-Reply-To: <CALrw=nGoSW=M-SApcvkP4cfYwWRj=z7WonKi6fEksWjMZTs81A@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 23 Sep 2024 20:46:44 +0200
Message-ID: <CANn89iJRoJQ5XXZxbC4mA=-N2sHyY8QNG-ftyQZT7w3RUw-g6w@mail.gmail.com>
Subject: Re: wireguard/napi stuck in napi_disable
To: Ignat Korchagin <ignat@cloudflare.com>
Cc: Jason@zx2c4.com, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, wireguard@lists.zx2c4.com, 
 netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 jiri@resnulli.us, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Sep 23, 2024 at 8:23=E2=80=AFPM Ignat Korchagin <ignat@cloudflare.c=
om> wrote:
>
> Hello,
>
> We run calico on our Kubernetes cluster, which uses Wireguard to
> encrypt in-cluster traffic [1]. Recently we tried to improve the
> throughput of the cluster and eliminate some packet drops we=E2=80=99re s=
eeing
> by switching on threaded NAPI [2] on these managed Wireguard
> interfaces. However, our Kubernetes hosts started to lock up once in a
> while.
>
> Analyzing one stuck host with drgn we were able to confirm that the
> code is just waiting in this loop [3] for the NAPI_STATE_SCHED bit to
> be cleared for the Wireguard peer napi instance, but that never
> happens for some reason. For context the full state of the stuck napi
> instance is 0b100110111. What makes things worse - this happens when
> calico removes a Wireguard peer, which happens while holding the
> global rtnl_mutex, so all the other tasks requiring that mutex get
> stuck as well.
>
> Full stacktrace of the =E2=80=9Clooping=E2=80=9D task:
>
> #0  context_switch (linux/kernel/sched/core.c:5380:2)
> #1  __schedule (linux/kernel/sched/core.c:6698:8)
> #2  schedule (linux/kernel/sched/core.c:6772:3)
> #3  schedule_hrtimeout_range_clock (linux/kernel/time/hrtimer.c:2311:3)
> #4  usleep_range_state (linux/kernel/time/timer.c:2363:8)
> #5  usleep_range (linux/include/linux/delay.h:68:2)
> #6  napi_disable (linux/net/core/dev.c:6477:4)
> #7  peer_remove_after_dead (linux/drivers/net/wireguard/peer.c:120:2)
> #8  set_peer (linux/drivers/net/wireguard/netlink.c:425:3)
> #9  wg_set_device (linux/drivers/net/wireguard/netlink.c:592:10)
> #10 genl_family_rcv_msg_doit (linux/net/netlink/genetlink.c:971:8)
> #11 genl_family_rcv_msg (linux/net/netlink/genetlink.c:1051:10)
> #12 genl_rcv_msg (linux/net/netlink/genetlink.c:1066:8)
> #13 netlink_rcv_skb (linux/net/netlink/af_netlink.c:2545:9)
> #14 genl_rcv (linux/net/netlink/genetlink.c:1075:2)
> #15 netlink_unicast_kernel (linux/net/netlink/af_netlink.c:1342:3)
> #16 netlink_unicast (linux/net/netlink/af_netlink.c:1368:10)
> #17 netlink_sendmsg (linux/net/netlink/af_netlink.c:1910:8)
> #18 sock_sendmsg_nosec (linux/net/socket.c:730:12)
> #19 __sock_sendmsg (linux/net/socket.c:745:16)
> #20 ____sys_sendmsg (linux/net/socket.c:2560:8)
> #21 ___sys_sendmsg (linux/net/socket.c:2614:8)
> #22 __sys_sendmsg (linux/net/socket.c:2643:8)
> #23 do_syscall_x64 (linux/arch/x86/entry/common.c:51:14)
> #24 do_syscall_64 (linux/arch/x86/entry/common.c:81:7)
> #25 entry_SYSCALL_64+0x9c/0x184 (linux/arch/x86/entry/entry_64.S:121)
>
> We have also noticed that a similar issue is observed, when we switch
> Wireguard threaded NAPI back to off: removing a Wireguard peer task
> may still spend a considerable amount of time in the above loop (and
> hold rtnl_mutex), however the host eventually recovers from this
> state.
>
> So the questions are:
> 1. Any ideas why NAPI_STATE_SCHED bit never gets cleared for the
> threaded NAPI case in Wireguard?
> 2. Is it generally a good idea for Wireguard to loop for an
> indeterminate amount of time, while holding the rtnl_mutex? Or can it
> be refactored?
>
> We have observed the problem on Linux 6.6.47 and 6.6.48. We did try to
> downgrade the kernel a couple of patch revisions, but it did not help
> and our logs indicate that at least the non-threaded prolonged holding
> of the rtnl_mutex is happening for a while now.
>
> [1]: https://docs.tigera.io/calico/latest/network-policy/encrypt-cluster-=
pod-traffic
> [2]: https://docs.kernel.org/networking/napi.html#threaded
> [3]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tre=
e/net/core/dev.c?h=3Dv6.6.48#n6476

Somehow wireguard continuously feeds packets without checking it
should not (IFF_UP or some other bit)

napi_schedule() detects NAPIF_STATE_DISABLE, and
napi_disable_pending() is also used
from __napi_poll() to avoid adding back the napi if the whole budget
was consumed.

Not sure, more debugging might be needed.
