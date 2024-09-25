Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F24BD49221
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:47:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c6ad247;
	Mon, 18 Nov 2024 12:38:34 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 58118cdb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2024 15:06:36 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-53659867cbdso10203858e87.3
 for <wireguard@lists.zx2c4.com>; Wed, 25 Sep 2024 08:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google09082023; t=1727276796; x=1727881596;
 darn=lists.zx2c4.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KiTz7kgecrlqOcQOw0Qwa9iZTNZzfgTIlV+IOVwZltc=;
 b=Dkctqud5RqD68pojQ3jWZbJJDGUu78Z2qQrrwpvLjL5zMOubEJygO9Fv9CojtNbM1n
 CDrfq+5OIK4nSMfZ8spoCNru8Sy61ApfhlmhJFSYFJAGqSc8xmazbhTitjZmuUpPExdB
 qgRb8YWweVzBq2wP2PVUWiiKCEqxfkP95dZsbDdZ5pkPWiCIymSOSVjvEgl1oANSV6L0
 gV21kZ0mi9UQ0awCFbW3r34dpfpvqTTq8xXRtTljSVZgmtlwdQP4E+k9Qktykw88VHue
 vHcI6CzyVzc9nJdstS6NmC/Z82zAwicMbjKuRb52LqhlSJTIt+4xwmps0JXQSsWrlXPL
 Lpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727276796; x=1727881596;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KiTz7kgecrlqOcQOw0Qwa9iZTNZzfgTIlV+IOVwZltc=;
 b=lBTySWKGm4kA+CYIIirpZh9bViP/87ddFeUZjkpcuHmsc4UBMAsBK5QwyF9zosZRvC
 QE50WFIhD+/vGbMOG5z7730de37IaYMPX6rc2cLk//KjKE4w63DWJS0zl/xJTagu5KWS
 d06cDkXrtN3BHdZt8mPdG6zf0NQoWnN/UhAO7x1r0bCGAlva+txfOLuF6+d2Byh2B6m0
 OoUtnewo1zvlk3O4vtX6feMeOMLyU0bVuugWH6CXdMA4iG802ViTPY2FdphjsCZUvFtF
 PGrOJjYBu4eiBRZMxCnAkhjMxpCpYdxQaQh6nntqYsM+yxpNUXCU7FMI+wt5gUGwIxn3
 0crw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX0CyTfl1+sOxMha8OZ1a3tCMCsxZIeqC3RXBkiRc9HLahGPogtXByq7yrTpcJOhzB/m2116OpCss=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxllsJvqH3t9t9Ie356U/h1eToFeqV6FqNCUQQ+ql4cH73vz9IM
 ibtlUx/7gBCMYIL8NJaML20PSRHD1Pg1E24VC8PveOu+nV9QULxdI9xt57p2S2wbpKYc1Wgztkm
 KKU860eiraI3JFLssI/4NjM7Hu3JVbgTrubHK+Q==
X-Google-Smtp-Source: AGHT+IE3yw3jrNgYkX7FHY5DrVTXk+hwVKWMFflu+TBKnjpbuRsc0AXaAfafd1KbL9E0TNJs8uC8Hi0hgXlQqu32i4I=
X-Received: by 2002:a05:6512:33d2:b0:536:7377:7d23 with SMTP id
 2adb3069b0e04-5387755cf84mr2904074e87.40.1727276795803; Wed, 25 Sep 2024
 08:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <CALrw=nGoSW=M-SApcvkP4cfYwWRj=z7WonKi6fEksWjMZTs81A@mail.gmail.com>
 <CALrw=nEoT2emQ0OAYCjM1d_6Xe_kNLSZ6dhjb5FxrLFYh4kozA@mail.gmail.com>
In-Reply-To: <CALrw=nEoT2emQ0OAYCjM1d_6Xe_kNLSZ6dhjb5FxrLFYh4kozA@mail.gmail.com>
From: Daniel Dao <dqminh@cloudflare.com>
Date: Wed, 25 Sep 2024 16:06:24 +0100
Message-ID: <CA+wXwBTT74RErDGAnj98PqS=wvdh8eM1pi4q6tTdExtjnokKqA@mail.gmail.com>
Subject: Re: wireguard/napi stuck in napi_disable
To: Ignat Korchagin <ignat@cloudflare.com>
Cc: Jason@zx2c4.com, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 wireguard@lists.zx2c4.com, netdev <netdev@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, jiri@resnulli.us, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 kernel-team <kernel-team@cloudflare.com>, Tejun Heo <tj@kernel.org>
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

On Mon, Sep 23, 2024 at 10:33=E2=80=AFPM Ignat Korchagin <ignat@cloudflare.=
com> wrote:
>
> On Mon, Sep 23, 2024 at 7:23=E2=80=AFPM Ignat Korchagin <ignat@cloudflare=
.com> wrote:
> >
> > Hello,
> >
> > We run calico on our Kubernetes cluster, which uses Wireguard to
> > encrypt in-cluster traffic [1]. Recently we tried to improve the
> > throughput of the cluster and eliminate some packet drops we=E2=80=99re=
 seeing
> > by switching on threaded NAPI [2] on these managed Wireguard
> > interfaces. However, our Kubernetes hosts started to lock up once in a
> > while.
> >
> > Analyzing one stuck host with drgn we were able to confirm that the
> > code is just waiting in this loop [3] for the NAPI_STATE_SCHED bit to
> > be cleared for the Wireguard peer napi instance, but that never
> > happens for some reason. For context the full state of the stuck napi
> > instance is 0b100110111. What makes things worse - this happens when
> > calico removes a Wireguard peer, which happens while holding the
> > global rtnl_mutex, so all the other tasks requiring that mutex get
> > stuck as well.
> >
> > Full stacktrace of the =E2=80=9Clooping=E2=80=9D task:
> >
> > #0  context_switch (linux/kernel/sched/core.c:5380:2)
> > #1  __schedule (linux/kernel/sched/core.c:6698:8)
> > #2  schedule (linux/kernel/sched/core.c:6772:3)
> > #3  schedule_hrtimeout_range_clock (linux/kernel/time/hrtimer.c:2311:3)
> > #4  usleep_range_state (linux/kernel/time/timer.c:2363:8)
> > #5  usleep_range (linux/include/linux/delay.h:68:2)
> > #6  napi_disable (linux/net/core/dev.c:6477:4)
> > #7  peer_remove_after_dead (linux/drivers/net/wireguard/peer.c:120:2)
> > #8  set_peer (linux/drivers/net/wireguard/netlink.c:425:3)
> > #9  wg_set_device (linux/drivers/net/wireguard/netlink.c:592:10)
> > #10 genl_family_rcv_msg_doit (linux/net/netlink/genetlink.c:971:8)
> > #11 genl_family_rcv_msg (linux/net/netlink/genetlink.c:1051:10)
> > #12 genl_rcv_msg (linux/net/netlink/genetlink.c:1066:8)
> > #13 netlink_rcv_skb (linux/net/netlink/af_netlink.c:2545:9)
> > #14 genl_rcv (linux/net/netlink/genetlink.c:1075:2)
> > #15 netlink_unicast_kernel (linux/net/netlink/af_netlink.c:1342:3)
> > #16 netlink_unicast (linux/net/netlink/af_netlink.c:1368:10)
> > #17 netlink_sendmsg (linux/net/netlink/af_netlink.c:1910:8)
> > #18 sock_sendmsg_nosec (linux/net/socket.c:730:12)
> > #19 __sock_sendmsg (linux/net/socket.c:745:16)
> > #20 ____sys_sendmsg (linux/net/socket.c:2560:8)
> > #21 ___sys_sendmsg (linux/net/socket.c:2614:8)
> > #22 __sys_sendmsg (linux/net/socket.c:2643:8)
> > #23 do_syscall_x64 (linux/arch/x86/entry/common.c:51:14)
> > #24 do_syscall_64 (linux/arch/x86/entry/common.c:81:7)
> > #25 entry_SYSCALL_64+0x9c/0x184 (linux/arch/x86/entry/entry_64.S:121)
> >

Looking at this further to understand why the napi state would be 0b1001101=
11
which decoded to: SCHED | MISSED | DISABLE | LISTED | NO_BUSY_POLL | THREAD=
ED,
I think this is a problem with MISSED wakeup in napi threaded mode.

napi_complete_done calls __napi_schedule when state has `NAPIF_STATE_MISSED=
`,
but in 6.6, it does not set NAPI_STATE_SCHED_THREADED when the napi thread =
is
running, and since the thread is running, wakeup does not do anything. Ther=
efore
we missed the chance to do another poll, and if we race with napi_disable t=
hen
the state will be SCHED | MISSED | DISABLE, and we stuck.

However it looks like the following commit resolves that situation for us

commit 56364c910691f6d10ba88c964c9041b9ab777bd6
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date:   Mon Mar 25 08:40:28 2024 +0100

    net: Remove conditional threaded-NAPI wakeup based on task state.

As long as we always set SCHED_THREADED, the next loop in napi thread will =
do
the right thing and clear SCHED, letting napi_disable complete.

We are testing 6.6 with this patch, and haven't seen any similar lockups so=
 far.

> > We have also noticed that a similar issue is observed, when we switch
> > Wireguard threaded NAPI back to off: removing a Wireguard peer task
> > may still spend a considerable amount of time in the above loop (and
> > hold rtnl_mutex), however the host eventually recovers from this
> > state.

However, these lockups become much more prominent now. Here is the
stack trace of
peer_remove_after_dead

#0  context_switch (/cfsetup_build/build/linux/kernel/sched/core.c:5380:2)
#1  __schedule (/cfsetup_build/build/linux/kernel/sched/core.c:6699:8)
#2  schedule (/cfsetup_build/build/linux/kernel/sched/core.c:6773:3)
#3  schedule_timeout (/cfsetup_build/build/linux/kernel/time/timer.c:2143:3=
)
#4  do_wait_for_common
(/cfsetup_build/build/linux/kernel/sched/completion.c:95:14)
#5  __wait_for_common
(/cfsetup_build/build/linux/kernel/sched/completion.c:116:12)
#6  wait_for_common (/cfsetup_build/build/linux/kernel/sched/completion.c:1=
27:9)
#7  wait_for_completion
(/cfsetup_build/build/linux/kernel/sched/completion.c:148:2)
#8  __flush_workqueue (/cfsetup_build/build/linux/kernel/workqueue.c:3196:2=
)
#9  peer_remove_after_dead
(/cfsetup_build/build/linux/drivers/net/wireguard/peer.c:116:2)
#10 set_peer (/cfsetup_build/build/linux/drivers/net/wireguard/netlink.c:42=
5:3)
#11 wg_set_device
(/cfsetup_build/build/linux/drivers/net/wireguard/netlink.c:592:10)
#12 genl_family_rcv_msg_doit
(/cfsetup_build/build/linux/net/netlink/genetlink.c:971:8)
#13 genl_family_rcv_msg
(/cfsetup_build/build/linux/net/netlink/genetlink.c:1051:10)
#14 genl_rcv_msg (/cfsetup_build/build/linux/net/netlink/genetlink.c:1066:8=
)
#15 netlink_rcv_skb (/cfsetup_build/build/linux/net/netlink/af_netlink.c:25=
44:9)
#16 genl_rcv (/cfsetup_build/build/linux/net/netlink/genetlink.c:1075:2)
#17 netlink_unicast_kernel
(/cfsetup_build/build/linux/net/netlink/af_netlink.c:1342:3)
#18 netlink_unicast
(/cfsetup_build/build/linux/net/netlink/af_netlink.c:1368:10)
#19 netlink_sendmsg (/cfsetup_build/build/linux/net/netlink/af_netlink.c:19=
10:8)
#20 sock_sendmsg_nosec (/cfsetup_build/build/linux/net/socket.c:730:12)
#21 __sock_sendmsg (/cfsetup_build/build/linux/net/socket.c:745:16)
#22 ____sys_sendmsg (/cfsetup_build/build/linux/net/socket.c:2590:8)
#23 ___sys_sendmsg (/cfsetup_build/build/linux/net/socket.c:2644:8)
#24 __sys_sendmsg (/cfsetup_build/build/linux/net/socket.c:2673:8)
#25 do_syscall_x64 (/cfsetup_build/build/linux/arch/x86/entry/common.c:51:1=
4)
#26 do_syscall_64 (/cfsetup_build/build/linux/arch/x86/entry/common.c:81:7)
#27 entry_SYSCALL_64+0x9c/0x184
(/cfsetup_build/build/linux/arch/x86/entry/entry_64.S:121)
#28 0x41262e

drgn shows that we are waiting to for completion of work for
wg_packet_tx_worker,
which is destined for a completely different peer than the peer we
want to remove.

*(struct worker *)0xffff888107f640c0 =3D {
        .entry =3D (struct list_head){
                .next =3D (struct list_head *)0x0,
                .prev =3D (struct list_head *)0xffff8897e0cb1f50,
        },
        .hentry =3D (struct hlist_node){
                .next =3D (struct hlist_node *)0x0,
                .pprev =3D (struct hlist_node **)0xffff8897e0cb1f50,
        },
        .current_work =3D (struct work_struct *)0xffff8881a32638d0,
        .current_func =3D (work_func_t)wg_packet_tx_worker+0x0 =3D
0xffffffffc0f6ca40,
        .current_pwq =3D (struct pool_workqueue *)0xffff88812bca6400,
        .current_at =3D (u64)3491257913,
        .current_color =3D (unsigned int)4,
        .sleeping =3D (int)0,
        .last_func =3D (work_func_t)wg_packet_tx_worker+0x0 =3D 0xffffffffc=
0f6ca40,
        .scheduled =3D (struct list_head){
                .next =3D (struct list_head *)0xffff8881a32638d8,
                .prev =3D (struct list_head *)0xffff8881a32638d8,
        },
        .task =3D (struct task_struct *)0xffff888472a08000,
        .pool =3D (struct worker_pool *)0xffff8897e0cb1cc0,
        .node =3D (struct list_head){
                .next =3D (struct list_head *)0xffff888107f64360,
                .prev =3D (struct list_head *)0xffff888107f645a0,
        },
        .last_active =3D (unsigned long)4409382646,
        .flags =3D (unsigned int)64,
        .id =3D (int)1,
        .desc =3D (char [32])"wg-crypt-wireguard.cali",
        .rescue_wq =3D (struct workqueue_struct *)0x0,
}

This can take a very long time especially if the peers produce/receive
as fast as it
can, as in our test setup. We setup some metrics with bpftrace to measure t=
he
duration of peer_remove_after_dead and wg_packet_tx_worker and got the foll=
owing
measurements after a long wait time.

@duration_ms[peer_remove_after_dead]:
[512K, 1M)             1 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@=
@@@|
@duration_ms[wg_packet_tx_worker]:
[0]               744612 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@=
@@@|
[1]                   20 |                                                 =
   |
[2, 4)                 2 |                                                 =
   |
[4, 8)                 2 |                                                 =
   |
[16, 32)               2 |                                                 =
   |
[256K, 512K)           1 |                                                 =
   |
[2M, 4M)               1 |                                                 =
   |

We can see that peer_remove_after_dead took between 512s to 1000s to comple=
te,
while wg_packet_tx_worker can take up to [2000s, 4000s) to complete, which =
is an
awfully long time.

Daniel

> >
> > So the questions are:
> > 1. Any ideas why NAPI_STATE_SCHED bit never gets cleared for the
> > threaded NAPI case in Wireguard?
> > 2. Is it generally a good idea for Wireguard to loop for an
> > indeterminate amount of time, while holding the rtnl_mutex? Or can it
> > be refactored?
>
> I've been also trying to reproduce this issue with a script [1]. While
> I could not reproduce the complete lockup I've been able to confirm
> that peer_remove_after_dead() may take multiple seconds to execute -
> all while holding the rtnl_mutex. Below is bcc-tools funclatency
> output from a freshly compiled mainline (6.11):
>
> # /usr/share/bcc/tools/funclatency peer_remove_after_dead
> Tracing 1 functions for "peer_remove_after_dead"... Hit Ctrl-C to end.
> ^C
>                nsecs                         : count     distribution
>                    0 -> 1                    : 0        |                =
    |
>                    2 -> 3                    : 0        |                =
    |
>                    4 -> 7                    : 0        |                =
    |
>                    8 -> 15                   : 0        |                =
    |
>                   16 -> 31                   : 0        |                =
    |
>                   32 -> 63                   : 0        |                =
    |
>                   64 -> 127                  : 0        |                =
    |
>                  128 -> 255                  : 0        |                =
    |
>                  256 -> 511                  : 0        |                =
    |
>                  512 -> 1023                 : 0        |                =
    |
>                 1024 -> 2047                 : 0        |                =
    |
>                 2048 -> 4095                 : 0        |                =
    |
>                 4096 -> 8191                 : 0        |                =
    |
>                 8192 -> 16383                : 0        |                =
    |
>                16384 -> 32767                : 0        |                =
    |
>                32768 -> 65535                : 0        |                =
    |
>                65536 -> 131071               : 0        |                =
    |
>               131072 -> 262143               : 0        |                =
    |
>               262144 -> 524287               : 68       |**              =
    |
>               524288 -> 1048575              : 658      |****************=
****|
>              1048576 -> 2097151              : 267      |********        =
    |
>              2097152 -> 4194303              : 68       |**              =
    |
>              4194304 -> 8388607              : 124      |***             =
    |
>              8388608 -> 16777215             : 182      |*****           =
    |
>             16777216 -> 33554431             : 72       |**              =
    |
>             33554432 -> 67108863             : 34       |*               =
    |
>             67108864 -> 134217727            : 22       |                =
    |
>            134217728 -> 268435455            : 11       |                =
    |
>            268435456 -> 536870911            : 2        |                =
    |
>            536870912 -> 1073741823           : 2        |                =
    |
>           1073741824 -> 2147483647           : 1        |                =
    |
>           2147483648 -> 4294967295           : 0        |                =
    |
>           4294967296 -> 8589934591           : 1        |                =
    |
>
> avg =3D 14251705 nsecs, total: 21548578415 nsecs, count: 1512
>
> Detaching...
>
> So we have cases where it takes 2 or even 8 seconds to remove a single
> peer, which is definitely not great considering we're holding a global
> lock.
>
> > We have observed the problem on Linux 6.6.47 and 6.6.48. We did try to
> > downgrade the kernel a couple of patch revisions, but it did not help
> > and our logs indicate that at least the non-threaded prolonged holding
> > of the rtnl_mutex is happening for a while now.
> >
> > [1]: https://docs.tigera.io/calico/latest/network-policy/encrypt-cluste=
r-pod-traffic
> > [2]: https://docs.kernel.org/networking/napi.html#threaded
> > [3]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/t=
ree/net/core/dev.c?h=3Dv6.6.48#n6476
>
> Ignat
>
> [1]: https://gist.githubusercontent.com/ignatk/4505d96e02815de3aa5649c4aa=
7c3fca/raw/177e4eab9f491024db6488cd0ea1cbba2d5579b4/wg.sh
