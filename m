Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A4ED49220
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:24:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7928929;
	Mon, 18 Nov 2024 12:38:30 +0000 (UTC)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [2607:f8b0:4864:20::443])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 80616067
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Sep 2024 18:23:27 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id
 d2e1a72fcca58-7179069d029so3405706b3a.2
 for <wireguard@lists.zx2c4.com>; Mon, 23 Sep 2024 11:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google09082023; t=1727115806; x=1727720606;
 darn=lists.zx2c4.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zA6f+caa340QDccXGTS1GWN1iuzfH3l7a+cwfvycMmk=;
 b=IEtZMiDZzbApRhdofKNMhI7YNj42wo7CwsdCCimOMVfsy1ETnSIaWUv/DS1EQ/yoRP
 NQ0s21hfMnDEDs+ilyvwLhXKG2aXx4Tpttik4EVjJj4fcGSjTz1isDOABPyX81wTUE0Q
 ScIi8/Tkezz32P6qlHiQHtLxuCGPQtqIPM2Yo190pDh9h89SV1D47BjUL9lCzxeErVji
 7c2b/9PHJYc6O1JnAquwUQd24DJKivXi8H4Cw9aKT3Zd0b8fOuQql7EMa/kiVaUjxbeR
 E5mFUpgcnb+chzzPqjfexOwcpq+X5WmgWqklSyWJUFhnUvzWhUY3RBPi7BpS9zJb50Fl
 hZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727115806; x=1727720606;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zA6f+caa340QDccXGTS1GWN1iuzfH3l7a+cwfvycMmk=;
 b=lgA9tMLY3Zh/UIlUIYwpXk3Fedu5fq0OeS2gEHZWQYG8yVoVOvaIEnHRv0OFy6+3V7
 18CqwsK433h11UkQIz+wLGgyE6mBrlY1lrDilQdZWSX1dChhtE0TJiwFRmBWpKwsKeL4
 9CVqo5xk4PCaVDZA2ibbgPFMvIczD/UMNX1Dy1E2QqC84VKDtP+M+fMKrJALET/4uCnR
 gRMLMWsbr/0Wq2auW3o/Eylob30ExnaVm8cNk1hdc1arLx8MiJ2fYrg8Dl245YK/oz1U
 C7mATN4N0x/fH430ruq+Q/6Ic1YB7jLCwKumaoYNJ+cw4XFWNbysOWu5QJM80bTAZ2rW
 UhiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2RPLmnpcqwa+lcajz3hFNsCUTBgo8gcDP9jBwaw7NExVDV68f6HURKav19T0KqMFGnrhvACl9FP8=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwZXOoBsxbqWo49Y5QiDYZOccPt6pB5KlXX6/u3QNTxm2xTFDXn
 0RIP+8cY1047AAZSfT0tNDV7hztgCvCpIoqiNEDtzUJPrFAOghXel1eMwuv3VoRGxI+u+iSKD+C
 Phe7gvLJ8ky8yUhHXiFqSP6WyJ4NBFJDuiAjHdw==
X-Google-Smtp-Source: AGHT+IH3bigHzH2R776hscI3skYNxcIcWD21EWCuNBmJKsmsmHU4RJMBTlK7knv154edWRFX7jq5IIAUWbOvQoML+QM=
X-Received: by 2002:a05:6a00:4612:b0:706:b10c:548a with SMTP id
 d2e1a72fcca58-7199c9f0bc4mr17606705b3a.22.1727115805726; Mon, 23 Sep 2024
 11:23:25 -0700 (PDT)
MIME-Version: 1.0
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Mon, 23 Sep 2024 19:23:14 +0100
Message-ID: <CALrw=nGoSW=M-SApcvkP4cfYwWRj=z7WonKi6fEksWjMZTs81A@mail.gmail.com>
Subject: wireguard/napi stuck in napi_disable
To: Jason@zx2c4.com, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 wireguard@lists.zx2c4.com, netdev <netdev@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, jiri@resnulli.us, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:38:13 +0000
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

We run calico on our Kubernetes cluster, which uses Wireguard to
encrypt in-cluster traffic [1]. Recently we tried to improve the
throughput of the cluster and eliminate some packet drops we=E2=80=99re see=
ing
by switching on threaded NAPI [2] on these managed Wireguard
interfaces. However, our Kubernetes hosts started to lock up once in a
while.

Analyzing one stuck host with drgn we were able to confirm that the
code is just waiting in this loop [3] for the NAPI_STATE_SCHED bit to
be cleared for the Wireguard peer napi instance, but that never
happens for some reason. For context the full state of the stuck napi
instance is 0b100110111. What makes things worse - this happens when
calico removes a Wireguard peer, which happens while holding the
global rtnl_mutex, so all the other tasks requiring that mutex get
stuck as well.

Full stacktrace of the =E2=80=9Clooping=E2=80=9D task:

#0  context_switch (linux/kernel/sched/core.c:5380:2)
#1  __schedule (linux/kernel/sched/core.c:6698:8)
#2  schedule (linux/kernel/sched/core.c:6772:3)
#3  schedule_hrtimeout_range_clock (linux/kernel/time/hrtimer.c:2311:3)
#4  usleep_range_state (linux/kernel/time/timer.c:2363:8)
#5  usleep_range (linux/include/linux/delay.h:68:2)
#6  napi_disable (linux/net/core/dev.c:6477:4)
#7  peer_remove_after_dead (linux/drivers/net/wireguard/peer.c:120:2)
#8  set_peer (linux/drivers/net/wireguard/netlink.c:425:3)
#9  wg_set_device (linux/drivers/net/wireguard/netlink.c:592:10)
#10 genl_family_rcv_msg_doit (linux/net/netlink/genetlink.c:971:8)
#11 genl_family_rcv_msg (linux/net/netlink/genetlink.c:1051:10)
#12 genl_rcv_msg (linux/net/netlink/genetlink.c:1066:8)
#13 netlink_rcv_skb (linux/net/netlink/af_netlink.c:2545:9)
#14 genl_rcv (linux/net/netlink/genetlink.c:1075:2)
#15 netlink_unicast_kernel (linux/net/netlink/af_netlink.c:1342:3)
#16 netlink_unicast (linux/net/netlink/af_netlink.c:1368:10)
#17 netlink_sendmsg (linux/net/netlink/af_netlink.c:1910:8)
#18 sock_sendmsg_nosec (linux/net/socket.c:730:12)
#19 __sock_sendmsg (linux/net/socket.c:745:16)
#20 ____sys_sendmsg (linux/net/socket.c:2560:8)
#21 ___sys_sendmsg (linux/net/socket.c:2614:8)
#22 __sys_sendmsg (linux/net/socket.c:2643:8)
#23 do_syscall_x64 (linux/arch/x86/entry/common.c:51:14)
#24 do_syscall_64 (linux/arch/x86/entry/common.c:81:7)
#25 entry_SYSCALL_64+0x9c/0x184 (linux/arch/x86/entry/entry_64.S:121)

We have also noticed that a similar issue is observed, when we switch
Wireguard threaded NAPI back to off: removing a Wireguard peer task
may still spend a considerable amount of time in the above loop (and
hold rtnl_mutex), however the host eventually recovers from this
state.

So the questions are:
1. Any ideas why NAPI_STATE_SCHED bit never gets cleared for the
threaded NAPI case in Wireguard?
2. Is it generally a good idea for Wireguard to loop for an
indeterminate amount of time, while holding the rtnl_mutex? Or can it
be refactored?

We have observed the problem on Linux 6.6.47 and 6.6.48. We did try to
downgrade the kernel a couple of patch revisions, but it did not help
and our logs indicate that at least the non-threaded prolonged holding
of the rtnl_mutex is happening for a while now.

[1]: https://docs.tigera.io/calico/latest/network-policy/encrypt-cluster-po=
d-traffic
[2]: https://docs.kernel.org/networking/napi.html#threaded
[3]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/=
net/core/dev.c?h=3Dv6.6.48#n6476
