Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17FCCA5FFD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 09:24:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 851faf76;
	Mon, 5 Oct 2026 06:59:45 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id cc49a99a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jun 2026 19:34:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=T6m/C7En0hnNaKXDbFC9xFrB0WCEmrxA+Aj7cdIDRL9ulAFh2bJjlgHuR5ElSOLQfFc+m5XYzQiIEbhaR1PJapiZNyWPzU5b55QKScHdvYY3FbBzgZ3YKEqHAWqcAQC9Hp7ZpK+AIRSDCL3AMnWSPxcdky1oeLDxUd6d1q1vtcUZhSvFdf/JvrKWWayrRkTLeiKQUC1SKXGzgmw38u+eQ8ur3GfeIudFwdkZ4YloheucB6zT+gmDn2gG275UYNyO1/4BwP8XgkTBuMfot5vww0H//JEdtdrM2VDqPn6FuCz/c4cNLU2vT70DvHINY4axKwdiq2z9wZMY4Ak7UNUPtw==;
 s=purelymail1; d=rcpassos.me; v=1;
 bh=VQKtJkkEsax0s8nQV8C6c5S66vPEhwny0vyW6W7sYEo=;
 h=Received:Date:Subject:From:To; 
DKIM-Signature: a=rsa-sha256;
 b=nU3CWbKXFX0sXVdNteVleVU7L5fQur84nLtF4o8NVWE5yX2t1NT8R16nWP7MBaryuDNmNQvYD0fPSl9LxE+0ow+pxrvITymzKRIYxzMLwv3/+mgpEMREtY2VLmi+LbKnCwCoe7z+ydN8sHPJYyAswxp0sdNGXp/Lda5qkgF+wf8+PRaRFddmth76oKW7BTszEILTfGcI29NHDyCLkcU9f0a9CrMMx+XaGvOzi4fD43vSrly8JytzhTXFOO7zORV9Tges4XYb2wnsF6lllFfn/bkOylPlsqQmVXBtGTjQGhi2ua5aKG4yyKP1vd1TcMyf8Fj6cZ7+aE+pvtRoWWb/5Q==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=VQKtJkkEsax0s8nQV8C6c5S66vPEhwny0vyW6W7sYEo=;
 h=Feedback-ID:Received:Date:Subject:From:To; 
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: wireguard@lists.zx2c4.com
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1158097400; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 22 Jun 2026 19:34:30 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 16:34:33 -0300
Message-Id: <DJFTVX3FE7OD.2O8GTO84798T@rcpassos.me>
Subject: Re: [syzbot] [wireguard?] KCSAN: data-race in
 wg_socket_send_skb_to_peer / wg_socket_send_skb_to_peer (9)
From: "Rafael Passos" <rafael@rcpassos.me>
To: <Jason@zx2c4.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
 <edumazet@google.com>, <kuba@kernel.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <pabeni@redhat.com>,
 <syzkaller-bugs@googlegroups.com>, <wireguard@lists.zx2c4.com>, "syzbot"
 <syzbot+9ca7674fa7521a3f1bc2@syzkaller.appspotmail.com>
X-Mailer: aerc 0.21.0
References: <6a1d983b.b111c304.35cd64.0028.GAE@google.com>
In-Reply-To: <6a1d983b.b111c304.35cd64.0028.GAE@google.com>
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:59:44 +0000
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

I started investigating this KCSAN warning by syzbot, and would like to
ask a few questions.

On Mon Jun 1, 2026 at 11:33 AM -03, syzbot wrote:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KCSAN: data-race in wg_socket_send_skb_to_peer / wg_socket_send_skb_=
to_peer
>
> read-write to 0xffff88811af99028 of 8 bytes by task 310 on cpu 1:
>  wg_socket_send_skb_to_peer+0xe8/0x130 drivers/net/wireguard/socket.c:182
>  wg_socket_send_buffer_to_peer+0xf1/0x120 drivers/net/wireguard/socket.c:=
199
>  wg_packet_send_handshake_initiation drivers/net/wireguard/send.c:40 [inl=
ine]
>  wg_packet_handshake_send_worker+0x10d/0x160 drivers/net/wireguard/send.c=
:51
>  process_one_work kernel/workqueue.c:3314 [inline]
>  process_scheduled_works+0x4f0/0x9c0 kernel/workqueue.c:3397
>  worker_thread+0x58a/0x780 kernel/workqueue.c:3478
>  kthread+0x22a/0x280 kernel/kthread.c:436
>  ret_from_fork+0x146/0x330 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>
> read-write to 0xffff88811af99028 of 8 bytes by task 15360 on cpu 0:
>  wg_socket_send_skb_to_peer+0xe8/0x130 drivers/net/wireguard/socket.c:182
>  wg_packet_create_data_done drivers/net/wireguard/send.c:251 [inline]
>  wg_packet_tx_worker+0x12d/0x330 drivers/net/wireguard/send.c:276
>  process_one_work kernel/workqueue.c:3314 [inline]
>  process_scheduled_works+0x4f0/0x9c0 kernel/workqueue.c:3397
>  worker_thread+0x58a/0x780 kernel/workqueue.c:3478
>  kthread+0x22a/0x280 kernel/kthread.c:436
>  ret_from_fork+0x146/0x330 arch/x86/kernel/process.c:158
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>
> value changed: 0x0000000000000a2c -> 0x0000000000000ac0
>
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 0 UID: 0 PID: 15360 Comm: kworker/0:2 Tainted: G        W           =
syzkaller #0 PREEMPT(lazy)=20
> Tainted: [W]=3DWARN
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 04/18/2026
> Workqueue: wg-crypt-wg2 wg_packet_tx_worker

I tracked the change to this counter increment in `wg_socket_send_skb_to_pe=
er`

+++ b/drivers/net/wireguard/socket.c
@@ -179,7 +179,8 @@ int wg_socket_send_skb_to_peer(struct wg_peer *peer, st=
ruct sk_buff *skb, u8 ds)
 	else
 		dev_kfree_skb(skb);
 	if (likely(!ret))
->		peer->tx_bytes +=3D skb_len;  <- protected by a read_lock_bh only
 	read_unlock_bh(&peer->endpoint_lock);

It is protected by the read-part of a rwlock.
However, if the stack trace makes sense, this `wg_socket_send_skb_to_peer`
is being called after a handshake (wg_packet_send_handshake_initiation) and
a send worker call (wg_packet_tx_worker).

Does this make sense ? Are such calls possible to really hapen outside of f=
uzzing ?

Out of curiosity, I changed `tx_bytes` and `rx_bytes` from u64 to atomic64_=
t
in peer.h, and also the r/w ops in netlink.c, receive.c and socket.c files.
I ran the wireguard kselftest suite with and without this patch, and it
worked fine. Iperf results seem sine (on amd64).
I'm not sure if this should be the solution, or if this is even a real issu=
e in the first place.

Any comments ?

Eager to learn.
Thanks,

Rafael Passos
