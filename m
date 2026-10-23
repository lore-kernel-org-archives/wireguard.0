Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF14606A323
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 23 Oct 2026 21:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=scfG51gt
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 5efc526b;
	Fri, 23 Oct 2026 21:21:20 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 34729be8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Oct 2026 21:21:19 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6b1ab2ad719so2081516a12.3
 for <wireguard@lists.zx2c4.com>; Fri, 23 Oct 2026 14:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792790479; x=1793395279; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=P3+vPFilegD5XMYU285qnlFx4MsfbGooi6fa2UmfoR4=;
 b=scfG51gtMKzqhXuZnCyLs+n+4z6o/rrTliNvlZM/6AC7zkk+5FKmBlhsrPSy6ufuAN
 ULiFMeAdWwJLegDrX4X7cogVcBXIEOZJQWK6bJul3ETjGidObmqhsfZNjqQ45pS1vz/g
 8MkIAT5Xrsp54zToDxOwRtrbfKDTofCDaPE4kKq4aVd7rI9FU9dXdzq8UGRT8V4ZA6Zm
 sIYtXLMAnIH/GKB4vZDGxW6V1i88JwJmct0sCZPFW7f7Scm6oYGnbWKiFmA/PbhMoDEh
 zua35aJyL0LbDuuLqesHxDkBrkDgs+J+rzNav1kS9XYU5/Irl09W8hVNbSfkiV7Qd99K
 iXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792790479; x=1793395279;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=P3+vPFilegD5XMYU285qnlFx4MsfbGooi6fa2UmfoR4=;
 b=rohge+nxHJiqgI6c0dEQmk/Cns7oG1UQSlKFx5TfUIJvk/c2gnKb+0x2+0yIA/QlLr
 cmhC2/GTEDobZTO1vuCMCv+kmWq32kt36ldAGiB13MVrK32nz7oW1EFAyHd4jw2SDedY
 vaAjonUGi/QO8qFv1TJGEK1/EiCes2ZnGkEAzW7eV1jTkySaOibnsvWEjMOLh2JkSI2L
 51H+HuKP8ne8U2ejC7qjzaOfJarEXFi/Cii69hwQvdYB594DTgO30smEQs2OUm+eN94n
 jOGBIrtOqJHniwaW8HkrBdp0NoLTNMIfpHAVsWpR+iabsk0SnUSbtDcsDLFGGw/L+Xvj
 41jw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxqnRkJIvP0dBguU75uCuUTue8FhQ7G4yCxf/LAmThCHgtjlYVuKt6PN8SwB2/CqkUHXfLWSHZm1RY=@lists.zx2c4.com
X-Gm-Message-State: AFq9FYLsJF4t3g5V9tMXXzwnmfM4hDkRvPhMiP7Lz/hlOZ3eht5AKWlZ
 2x+zWZzTZDOxhHqMRTIO2+AMVV936YdWeU0getl6EKP/afdlWggq25eo
X-Gm-Gg: AYBFou2CldB+ZP15eJ8OJTGizDHNYyjsPNk32aJ1phKXPkg7gu0lHM0L+89cv54IZ5B
 C4P0YAZfqKzt+s1UBdC5hENIQpKPkQkq6Vhb+SdXXjrQ3vlxP+yf24ePS9kdLHENgjI4wKkn2oH
 TeU0O7+4AOHNA90PKpuZLtf176qcZvDFoQ2tF688fQX9AeENgBeXQL3/QAIJpYKrWlpzU+7zkUG
 MYUrTCNCx8+Lo7JDGzUTVGAWS8bwAwb6K5muwMDUcMozg3/g44MWm99rLXI5C3YWRHMO2Kmm8rk
 adRlvCF4XXN6pBr/PpSehe+yAB0yebWEDEz3H0PokWNErII3zG5VkN+PCB6jB9673PLaEpe/5xi
 v5uLOm20uFyR/p+fnlRHZCrLvaOCBeLX4ICXlWVxBb+ClhiofLRMvzEYn140Yc1cY0NTxQ5It77
 xfXrHaNMs6kBGu/R8qVA2wY3ZItG0tjMoXRVSWYAb1Ch/umhPSeKlcF1tg6Wn7s6MMiME+vLXVd
 JjI7pv8ctNy+IYUuHRpx6IuNGOWFYsEpNqbJm2SJLjMj7M/3pWir3g3cDu+TvZvef5wmQ8ohbUv
 tVODeA==
X-Received: by 2002:a17:907:94cf:b0:c2e:3f49:df04 with SMTP id
 a640c23a62f3a-c46bdaf8b27mr17306266b.1.1792790478675; 
 Fri, 23 Oct 2026 14:21:18 -0700 (PDT)
Received: from Mac ([188.163.8.107]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd79eb05sm8156266b.79.2026.10.23.14.21.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 23 Oct 2026 14:21:18 -0700 (PDT)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next] wireguard: run crypto in the peers' NAPI polls
 on single-CPU systems
Date: Sat, 24 Oct 2026 00:21:17 +0300
Message-ID: <20261023212117.3135-1-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

WireGuard parallelises crypto over CPUs with packet_crypt_wq and restores
order through the per-peer queues. With one possible CPU the workqueue
cannot add parallelism, but every packet still pays for the hand-offs:
on transmit the encrypt worker and then the per-peer transmit worker, on
receive the decrypt worker before the peer's NAPI poll, each a context
switch. On a Realtek RTL8196E (Lexra RLX4181, about 400 MHz) the kernel
PC profiler put about 22% of CPU time on context switches, about 0.85
per tunnelled packet, and throughput hardly depended on packet size.

When num_possible_cpus() == 1, a static key makes both directions use
NAPI instead:

- Transmit: wg_packet_create_data() puts the packet list on the peer's
  tx_queue in entries of at most 8 packets for a new per-peer TX NAPI,
  whose poll encrypts and sends entries within its budget. A sending
  task runs one budget of that NAPI itself, so it pays for its own
  encryption and cannot outrun softirq; from softirq the NAPI is only
  scheduled.
- Receive: wg_packet_consume_data() puts the packet on rx_queue as
  UNCRYPTED and schedules the peer's NAPI, whose poll now decrypts it.

The TX NAPI and a sending task encrypt at most 16 packets per turn, so
crypto on a slow CPU comes in bounded pieces and NET_RX keeps
interleaving with the NIC. The receive NAPI keeps the default weight: on
the board below, a weight of 16 cost 11% of TCP receive throughput,
because GRO on the tunnel flushed four times as often. Owning the NAPI
while encrypting also means a routing loop through the device cannot
recurse into the encryption path: a nested ndo_start_xmit finds the NAPI
owned and only queues. Under overload the work moves to ksoftirqd as for
any NAPI driver.

The per-peer queues, their ordering and their reference handling are
unchanged; systems with more than one possible CPU keep the workqueue
path and only pay for a static branch.

Measured on the RTL8196E with Linux 6.18.54, iperf3 on the board, a
wired peer, 11 x 30 s TCP runs per direction and 5 x 15 s UDP runs,
medians:

                                      before        after
  TCP to the board                    9.44 Mbit/s   18.84 Mbit/s
  TCP from the board                  8.18 Mbit/s   13.79 Mbit/s
  UDP from the board, 1380 B          777 pps       921 pps
  UDP from the board, 64 B            858 pps       1253 pps
  UDP to the board, 905 pps offered   903 pps       905 pps
    CPU busy                          100%          96%
  context switches per packet (TCP)   1.12 / 0.91   0.08 / 0.08
  ping through the tunnel, TCP load   108 ms        31 ms

UDP floods far above capacity gave too much run-to-run variance in both
kernels to compare.

In the WireGuard selftest VM on net-next (x86 KVM, two namespaces, iperf3
for 10 s, medians of 3), with one vCPU TCP goes from 3.41 to 3.65 Gbit/s
over IPv4 and from 3.34 to 3.62 Gbit/s over IPv6, with no
retransmissions either way. With four vCPUs, where this change only adds
a static branch, both kernels are within noise (6.06 and 6.10 Gbit/s).

On one CPU a UDP flood between the two namespaces now loses about 54% of
the packets, where it lost 0-6% before. The sender encrypts in its own
context and all receive work runs in softirq, so the sender outruns the
receiver, as it does without WireGuard: plain UDP over a veth pair loses
61% on the same guest. Before, the crypt workqueue throttled the sender.

I developed this change with an AI coding assistant (Anthropic's
Claude). It wrote most of the code and of this changelog from my
direction and ran the selftests and the board and VM measurements
above; I reviewed the result and take responsibility for it.

Signed-off-by: Andrii Pasichnyk <apasichnik9@gmail.com>
---
RFC: the approach is the question; the open points are below.

This applies on top of "wireguard: peer: free packets left on the per-peer
queues on removal", which is still pending:
https://lore.kernel.org/netdev/20261003201625.4572-1-apasichnik9@gmail.com/

Open questions:

- Is a static key on num_possible_cpus() == 1 the right condition, or
  would a module parameter or a per-device setting be preferred?

- A sending task takes ownership of the TX NAPI with
  napi_schedule_prep(), runs one turn of it and releases it with
  napi_complete_done(), outside a NAPI poll. That serialises it against
  the poll and against nested transmits without a new lock, but it uses
  NAPI ownership as a serialisation primitive from process context,
  which is unusual. The alternative is a per-peer bit taken with
  test_and_set_bit() for the sending task's turn, with NAPI used only
  for deferred work; with one CPU and bottom halves off during the turn,
  the bit only has to exclude nesting. Which would you prefer?

- 16 packets per transmit turn and 8 per queue entry were picked for a
  400 MHz CPU. Should they scale with anything?

Tested on net-next d8674294a: tools/testing/selftests/wireguard with 4
CPUs (workqueue path) and 1 CPU (NAPI path); W=1 and sparse report
nothing new on arm64, x86_64 and x86_64 with SMP=n. Board numbers are
from Linux 6.18.54, where the patch applies unchanged.

 drivers/net/wireguard/main.c     |   1 +
 drivers/net/wireguard/peer.c     |   9 +++
 drivers/net/wireguard/peer.h     |   2 +-
 drivers/net/wireguard/queueing.c |   8 +++
 drivers/net/wireguard/queueing.h |  21 ++++++
 drivers/net/wireguard/receive.c  |  21 +++++-
 drivers/net/wireguard/send.c     | 111 +++++++++++++++++++++++++++++++
 7 files changed, 169 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireguard/main.c b/drivers/net/wireguard/main.c
index a00671b..517bbf7 100644
--- a/drivers/net/wireguard/main.c
+++ b/drivers/net/wireguard/main.c
@@ -32,6 +32,7 @@ static int __init wg_mod_init(void)
 		goto err_peer;
 #endif
 	wg_noise_init();
+	wg_crypt_inline_init();
 
 	ret = wg_peer_init();
 	if (ret < 0)
diff --git a/drivers/net/wireguard/peer.c b/drivers/net/wireguard/peer.c
index 3e08898..9865586 100644
--- a/drivers/net/wireguard/peer.c
+++ b/drivers/net/wireguard/peer.c
@@ -56,6 +56,11 @@ struct wg_peer *wg_peer_create(struct wg_device *wg,
 	set_bit(NAPI_STATE_NO_BUSY_POLL, &peer->napi.state);
 	netif_napi_add(wg->dev, &peer->napi, wg_packet_rx_poll);
 	napi_enable(&peer->napi);
+	if (wg_crypt_is_inline()) {
+		netif_napi_add_tx_weight(wg->dev, &peer->tx_napi, wg_packet_tx_poll,
+					 WG_INLINE_TX_WEIGHT);
+		napi_enable(&peer->tx_napi);
+	}
 	list_add_tail(&peer->peer_list, &wg->peer_list);
 	INIT_LIST_HEAD(&peer->allowedips_list);
 	wg_pubkey_hashtable_add(wg->peer_hashtable, peer);
@@ -141,6 +146,10 @@ static void peer_remove_after_dead(struct wg_peer *peer)
 	 * here from process context.
 	 */
 	netif_napi_del(&peer->napi);
+	if (wg_crypt_is_inline()) {
+		napi_disable(&peer->tx_napi);
+		netif_napi_del(&peer->tx_napi);
+	}
 	/* A NAPI being disabled completes after at most one more poll, which
 	 * may leave packets on rx_queue that still hold references.
 	 */
diff --git a/drivers/net/wireguard/peer.h b/drivers/net/wireguard/peer.h
index 718fb42..999096a 100644
--- a/drivers/net/wireguard/peer.h
+++ b/drivers/net/wireguard/peer.h
@@ -62,7 +62,7 @@ struct wg_peer {
 	struct rcu_head rcu;
 	struct list_head peer_list;
 	struct list_head allowedips_list;
-	struct napi_struct napi;
+	struct napi_struct napi, tx_napi;
 	u64 internal_id;
 };
 
diff --git a/drivers/net/wireguard/queueing.c b/drivers/net/wireguard/queueing.c
index 26d235d..133fb2f 100644
--- a/drivers/net/wireguard/queueing.c
+++ b/drivers/net/wireguard/queueing.c
@@ -6,6 +6,14 @@
 #include "queueing.h"
 #include <linux/skb_array.h>
 
+DEFINE_STATIC_KEY_FALSE(wg_crypt_inline);
+
+void __init wg_crypt_inline_init(void)
+{
+	if (num_possible_cpus() == 1)
+		static_branch_enable(&wg_crypt_inline);
+}
+
 struct multicore_worker __percpu *
 wg_packet_percpu_multicore_worker_alloc(work_func_t function, void *ptr)
 {
diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
index 663b19b..a96aa88 100644
--- a/drivers/net/wireguard/queueing.h
+++ b/drivers/net/wireguard/queueing.h
@@ -12,6 +12,7 @@
 #include <linux/ip.h>
 #include <linux/ipv6.h>
 #include <net/ip_tunnels.h>
+#include <linux/jump_label.h>
 
 struct wg_device;
 struct wg_peer;
@@ -20,6 +21,24 @@ struct crypt_queue;
 struct prev_queue;
 struct sk_buff;
 
+/* With a single possible CPU the crypt workqueue cannot add parallelism and
+ * only costs context switches, so crypto runs in the peers' NAPI polls.
+ */
+DECLARE_STATIC_KEY_FALSE(wg_crypt_inline);
+static inline bool wg_crypt_is_inline(void)
+{
+	return static_branch_unlikely(&wg_crypt_inline);
+}
+
+/* Packets the TX NAPI, or a sending task, encrypts per turn. The receive
+ * NAPI keeps the default weight: a smaller one flushes GRO more often and
+ * costs more than it saves.
+ */
+#define WG_INLINE_TX_WEIGHT 16
+/* Longest packet list queued as one entry, so one entry stays short. */
+#define WG_INLINE_TX_BATCH 8
+void wg_crypt_inline_init(void);
+
 /* queueing.c APIs: */
 int wg_packet_queue_init(struct crypt_queue *queue, work_func_t function,
 			 unsigned int len);
@@ -48,6 +67,8 @@ void wg_packet_send_staged_packets(struct wg_peer *peer);
 /* Workqueue workers: */
 void wg_packet_handshake_send_worker(struct work_struct *work);
 void wg_packet_tx_worker(struct work_struct *work);
+/* NAPI poll function, used when wg_crypt_is_inline(): */
+int wg_packet_tx_poll(struct napi_struct *napi, int budget);
 void wg_packet_encrypt_worker(struct work_struct *work);
 
 enum packet_state {
diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receive.c
index 824bbef..a58d1bf 100644
--- a/drivers/net/wireguard/receive.c
+++ b/drivers/net/wireguard/receive.c
@@ -448,9 +448,14 @@ int wg_packet_rx_poll(struct napi_struct *napi, int budget)
 	if (unlikely(budget <= 0))
 		return 0;
 
-	while ((skb = wg_prev_queue_peek(&peer->rx_queue)) != NULL &&
-	       (state = atomic_read_acquire(&PACKET_CB(skb)->state)) !=
-		       PACKET_STATE_UNCRYPTED) {
+	while ((skb = wg_prev_queue_peek(&peer->rx_queue)) != NULL) {
+		state = atomic_read_acquire(&PACKET_CB(skb)->state);
+		if (state == PACKET_STATE_UNCRYPTED) {
+			if (!wg_crypt_is_inline())
+				break;
+			state = likely(decrypt_packet(skb, PACKET_CB(skb)->keypair)) ?
+				PACKET_STATE_CRYPTED : PACKET_STATE_DEAD;
+		}
 		wg_prev_queue_drop_peeked(&peer->rx_queue);
 		keypair = PACKET_CB(skb)->keypair;
 		free = true;
@@ -523,6 +528,16 @@ static void wg_packet_consume_data(struct wg_device *wg, struct sk_buff *skb)
 	if (unlikely(READ_ONCE(peer->is_dead)))
 		goto err;
 
+	if (wg_crypt_is_inline()) {
+		/* Decrypted later by the peer's NAPI poll, within its budget. */
+		atomic_set_release(&PACKET_CB(skb)->state, PACKET_STATE_UNCRYPTED);
+		if (unlikely(!wg_prev_queue_enqueue(&peer->rx_queue, skb)))
+			goto err;
+		napi_schedule(&peer->napi);
+		rcu_read_unlock_bh();
+		return;
+	}
+
 	ret = wg_queue_enqueue_per_device_and_peer(&wg->decrypt_queue, &peer->rx_queue, skb,
 						   wg->packet_crypt_wq);
 	if (unlikely(ret == -EPIPE))
diff --git a/drivers/net/wireguard/send.c b/drivers/net/wireguard/send.c
index 67d0147..38e0c7e 100644
--- a/drivers/net/wireguard/send.c
+++ b/drivers/net/wireguard/send.c
@@ -308,6 +308,111 @@ void wg_packet_encrypt_worker(struct work_struct *work)
 	}
 }
 
+/* Encrypt and send queued entries until about @budget packets are done. */
+static int wg_packet_tx_send(struct wg_peer *peer, int budget)
+{
+	struct noise_keypair *keypair;
+	struct sk_buff *first, *skb, *next;
+	enum packet_state state;
+	int work_done = 0;
+
+	while (work_done < budget &&
+	       (first = wg_prev_queue_peek(&peer->tx_queue)) != NULL) {
+		wg_prev_queue_drop_peeked(&peer->tx_queue);
+		keypair = PACKET_CB(first)->keypair;
+		state = PACKET_STATE_CRYPTED;
+		skb_list_walk_safe(first, skb, next) {
+			++work_done;
+			if (likely(encrypt_packet(skb, keypair))) {
+				wg_reset_packet(skb, true);
+			} else {
+				state = PACKET_STATE_DEAD;
+				break;
+			}
+		}
+		if (likely(state == PACKET_STATE_CRYPTED))
+			wg_packet_create_data_done(peer, first);
+		else
+			kfree_skb_list(first);
+		wg_noise_keypair_put(keypair, false);
+		wg_peer_put(peer);
+	}
+	return work_done;
+}
+
+int wg_packet_tx_poll(struct napi_struct *napi, int budget)
+{
+	struct wg_peer *peer = container_of(napi, struct wg_peer, tx_napi);
+	int work_done;
+
+	if (unlikely(budget <= 0))
+		return 0;
+
+	work_done = wg_packet_tx_send(peer, budget);
+	/* An entry of several packets may overrun the budget by a few. */
+	if (work_done >= budget)
+		return budget;
+	napi_complete_done(napi, work_done);
+	return work_done;
+}
+
+/* A sending task runs one budget of the TX NAPI itself, so it pays for its
+ * own encryption and is paced by it instead of outrunning softirq; the rest
+ * is left to the NAPI. A transmit nested inside, as in a routing loop, finds
+ * the NAPI owned and only queues, so encryption cannot recurse.
+ */
+static void wg_packet_tx_kick(struct wg_peer *peer)
+{
+	if (in_serving_softirq()) {
+		napi_schedule(&peer->tx_napi);
+		return;
+	}
+	if (!napi_schedule_prep(&peer->tx_napi))
+		return;
+	if (wg_packet_tx_send(peer, WG_INLINE_TX_WEIGHT) >= WG_INLINE_TX_WEIGHT)
+		__napi_schedule(&peer->tx_napi);
+	else
+		napi_complete_done(&peer->tx_napi, 0);
+}
+
+/* Queue the list in entries of at most WG_INLINE_TX_BATCH packets for the
+ * TX NAPI, which encrypts and sends them within its budget. The first entry
+ * takes over the caller's keypair and peer references.
+ */
+static void wg_packet_queue_inline(struct wg_peer *peer, struct sk_buff *first)
+{
+	struct noise_keypair *keypair = PACKET_CB(first)->keypair;
+	struct sk_buff *entry = first, *skb, *rest;
+	bool queued = false;
+	unsigned int n;
+
+	/* Keep the keypair alive until every entry has its own reference. */
+	wg_noise_keypair_get(keypair);
+	while (entry) {
+		for (skb = entry, n = 1; skb->next && n < WG_INLINE_TX_BATCH; ++n)
+			skb = skb->next;
+		rest = skb->next;
+		skb->next = NULL;
+		if (queued) {
+			PACKET_CB(entry)->keypair = wg_noise_keypair_get(keypair);
+			wg_peer_get(peer);
+		}
+		atomic_set_release(&PACKET_CB(entry)->state, PACKET_STATE_UNCRYPTED);
+		if (unlikely(!wg_prev_queue_enqueue(&peer->tx_queue, entry))) {
+			wg_noise_keypair_put(PACKET_CB(entry)->keypair, false);
+			wg_peer_put(peer);
+			kfree_skb_list(entry);
+			kfree_skb_list(rest);
+			break;
+		}
+		queued = true;
+		entry = rest;
+	}
+	if (queued)
+		wg_packet_tx_kick(peer);
+	wg_noise_keypair_put(keypair, false);
+}
+
 static void wg_packet_create_data(struct wg_peer *peer, struct sk_buff *first)
 {
 	struct wg_device *wg = peer->device;
@@ -317,6 +422,12 @@ static void wg_packet_create_data(struct wg_peer *peer, struct sk_buff *first)
 	if (unlikely(READ_ONCE(peer->is_dead)))
 		goto err;
 
+	if (wg_crypt_is_inline()) {
+		wg_packet_queue_inline(peer, first);
+		rcu_read_unlock_bh();
+		return;
+	}
+
 	ret = wg_queue_enqueue_per_device_and_peer(&wg->encrypt_queue, &peer->tx_queue, first,
 						   wg->packet_crypt_wq);
 	if (unlikely(ret == -EPIPE))
-- 
2.53.0

