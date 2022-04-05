Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D1BC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Apr 2022 23:55:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 5f92b7c6;
	Thu, 21 Apr 2022 23:48:53 +0000 (UTC)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 4612dbf8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Apr 2022 21:21:57 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id f18so358412edc.5
 for <wireguard@lists.zx2c4.com>; Tue, 05 Apr 2022 14:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5LvxJyw8hK/qlxyA7CHFbULMcRQnTykb1NrBCLfcWfM=;
 b=Wa2ocR2VhbCrhJxGUB2kuv+8AGzm9oS3E2LN7ZU9A4uzD9uKOIMhzAm9i1dRDAGMQu
 oT0QFYJSppmRO+QN7e4r1/QQsNxa0kSywUnB9oGJDh/GOvdrP9u+HXuEFZ7XHkxsRk/z
 OU8X93creEpL9b/Vpv/fgCouwJj7aZJZOGbRaU7MAzACly56+RtlNyvZ8Gbwn6IoycL9
 iDEkNXjuv+f0zdGyh6ur8nSw03IJ81rRLyOsof+h5rcME8Na71uTqX2asqhksdtKznAz
 yrq11w7XMhEVXDFdxpb9yKvMXvNgTTDtLdfMz4rLIAiYx2i4XIPgvI500R10RjSN8A56
 ggqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5LvxJyw8hK/qlxyA7CHFbULMcRQnTykb1NrBCLfcWfM=;
 b=Jhd0JAp4gIq4csDHoZSFwctR0O2kJK7tyZZ+uXQHQDdZHOlKw8dSkye9DBg37G+6Sv
 sYSH6PFIuypyWjTm+2fGamuZD/wUTZ6qaw9JN4uEr13a3xygv257R4VYLtbiWC7hiMAR
 XS9JohvYoAd7nR9uXVees0yrRVhTh2FIwuJb3N3Kc5WqyoUDXe0vKHH0S3/RjYtXDt2g
 7b6p+uYhUW7+szqWB2fM8sK9EIYRSHGSWtVkQqEqnfVuslOk1sfah2+gLMKxrdJHbHh6
 zsda3TzUYgSgenmhnEdBkP9endy0hxew+9jPlediOAdMzy0/pJmsKoG/t/iosZU/UkPA
 p+3w==
X-Gm-Message-State: AOAM530dmSbstov1KpS6J8hRWjjF4M4GLNq/N+sCy6N4OSyZ+wivKgXh
 gTj+HXo3/9Q2xu31bmt+y3ADy0s+FjQ=
X-Google-Smtp-Source: ABdhPJzsBg6+C68TYZLWa74Ys+iwrkxp2q7aj3uOQeh73MsUHuwTscX9yrGEriCYVR1Nte8GPjneCw==
X-Received: by 2002:aa7:cfda:0:b0:41c:bd28:a7da with SMTP id
 r26-20020aa7cfda000000b0041cbd28a7damr5526802edy.129.1649193717307; 
 Tue, 05 Apr 2022 14:21:57 -0700 (PDT)
Received: from localhost.localdomain ([90.252.121.147])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a17090624c500b006cee6661b6esm5910962ejb.10.2022.04.05.14.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 14:21:56 -0700 (PDT)
From: Charles-Francois Natali <cf.natali@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Jason@zx2c4.com,
	Charles-Francois Natali <cf.natali@gmail.com>
Subject: [PATCH] WireGuard: restrict packet handling to non-isolated CPUs.
Date: Tue,  5 Apr 2022 22:21:29 +0100
Message-Id: <20220405212129.2270-1-cf.natali@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 21 Apr 2022 23:48:42 +0000
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

WireGuard currently uses round-robin to dispatch the handling of
packets, handling them on all online CPUs, including isolated ones
(isolcpus).

This is unfortunate because it causes significant latency on isolated
CPUs - see e.g. below over 240 usec:

kworker/47:1-2373323 [047] 243644.756405: funcgraph_entry: |
process_one_work() {
    kworker/47:1-2373323 [047] 243644.756406: funcgraph_entry: |
wg_packet_decrypt_worker() {
[...]
    kworker/47:1-2373323 [047] 243644.756647: funcgraph_exit: 0.591 us | }
    kworker/47:1-2373323 [047] 243644.756647: funcgraph_exit: ! 242.655 us | }

Instead, restrict to non-isolated CPUs.

Example:

~# cat /sys/devices/system/cpu/isolated
3
~# /usr/share/doc/wireguard-tools/examples/ncat-client-server/client.sh
~# ping 192.168.4.1

Before - corresponding workqueues are executed on all CPUs:

~# trace-cmd record -p function -l wg_packet_decrypt_worker -- sleep 10
  plugin 'function'
CPU0 data recorded at offset=0x7d6000
    4096 bytes in size
CPU1 data recorded at offset=0x7d7000
    4096 bytes in size
CPU2 data recorded at offset=0x7d8000
    4096 bytes in size
CPU3 data recorded at offset=0x7d9000
    4096 bytes in size
~# trace-cmd report
cpus=4
     kworker/3:1-52    [003]    49.784353: function:
wg_packet_decrypt_worker
     kworker/0:1-17    [000]    50.782879: function:
wg_packet_decrypt_worker
     kworker/1:3-162   [001]    51.783044: function:
wg_packet_decrypt_worker
     kworker/2:1-56    [002]    52.782159: function:
wg_packet_decrypt_worker
     kworker/3:1-52    [003]    53.780919: function:
wg_packet_decrypt_worker
     kworker/0:0-6     [000]    54.781755: function:
wg_packet_decrypt_worker
     kworker/1:3-162   [001]    55.781273: function:
wg_packet_decrypt_worker
     kworker/2:1-56    [002]    56.781946: function:
wg_packet_decrypt_worker
     kworker/3:1-52    [003]    57.781010: function:
wg_packet_decrypt_worker
     kworker/0:0-6     [000]    58.782097: function:
wg_packet_decrypt_worker
~#

After - isolated CPU 3 is excluded:

~# trace-cmd record -p function -l wg_packet_decrypt_worker -- sleep 10
  plugin 'function'
CPU0 data recorded at offset=0x7d7000
    4096 bytes in size
CPU1 data recorded at offset=0x7d8000
    4096 bytes in size
CPU2 data recorded at offset=0x7d9000
    4096 bytes in size
CPU3 data recorded at offset=0x7da000
    0 bytes in size
~# trace-cmd report
CPU 3 is empty
cpus=4
     kworker/1:2-66    [001]   291.800063: function:
wg_packet_decrypt_worker
     kworker/2:2-143   [002]   292.800266: function:
wg_packet_decrypt_worker
     kworker/0:2-145   [000]   293.801778: function:
wg_packet_decrypt_worker
     kworker/1:4-261   [001]   294.803411: function:
wg_packet_decrypt_worker
     kworker/2:2-143   [002]   295.804068: function:
wg_packet_decrypt_worker
     kworker/0:2-145   [000]   296.806057: function:
wg_packet_decrypt_worker
     kworker/1:2-66    [001]   297.810686: function:
wg_packet_decrypt_worker
     kworker/2:2-143   [002]   298.811602: function:
wg_packet_decrypt_worker
     kworker/0:2-145   [000]   299.812790: function:
wg_packet_decrypt_worker
     kworker/1:4-261   [001]   300.813076: function:
wg_packet_decrypt_worker
~#

Signed-off-by: Charles-Francois Natali <cf.natali@gmail.com>
---
 drivers/net/wireguard/queueing.h | 59 +++++++++++++++++++++++++-------
 drivers/net/wireguard/receive.c  |  2 +-
 2 files changed, 48 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
index 583adb37e..106a2686c 100644
--- a/drivers/net/wireguard/queueing.h
+++ b/drivers/net/wireguard/queueing.h
@@ -11,6 +11,7 @@
 #include <linux/skbuff.h>
 #include <linux/ip.h>
 #include <linux/ipv6.h>
+#include <linux/sched/isolation.h>
 #include <net/ip_tunnels.h>
 
 struct wg_device;
@@ -102,16 +103,50 @@ static inline void wg_reset_packet(struct sk_buff *skb, bool encapsulating)
 	skb_reset_inner_headers(skb);
 }
 
-static inline int wg_cpumask_choose_online(int *stored_cpu, unsigned int id)
+/* We only want to dispatch work to housekeeping CPUs, ignoring isolated ones.
+ */
+static inline const struct cpumask *wg_cpumask_housekeeping(void)
+{
+	return housekeeping_cpumask(HK_FLAG_DOMAIN);
+}
+
+static inline int wg_cpumask_test_cpu(int cpu)
+{
+	return cpumask_test_cpu(cpu, cpu_online_mask) &&
+		cpumask_test_cpu(cpu, wg_cpumask_housekeeping());
+}
+
+static inline unsigned int wg_cpumask_first(void)
+{
+	return cpumask_first_and(cpu_online_mask, wg_cpumask_housekeeping());
+}
+
+static inline unsigned int wg_cpumask_next(int n)
+{
+	return cpumask_next_and(n, cpu_online_mask, wg_cpumask_housekeeping());
+}
+
+static inline unsigned int wg_cpumask_weight(void)
+{
+	int cpu;
+	int weight = 0;
+
+	for_each_cpu_and(cpu, cpu_online_mask, wg_cpumask_housekeeping()) {
+		++weight;
+	}
+
+	return weight;
+}
+
+static inline int wg_cpumask_choose_eligible(int *stored_cpu, unsigned int id)
 {
 	unsigned int cpu = *stored_cpu, cpu_index, i;
 
-	if (unlikely(cpu == nr_cpumask_bits ||
-		     !cpumask_test_cpu(cpu, cpu_online_mask))) {
-		cpu_index = id % cpumask_weight(cpu_online_mask);
-		cpu = cpumask_first(cpu_online_mask);
+	if (unlikely(cpu == nr_cpumask_bits || !wg_cpumask_test_cpu(cpu))) {
+		cpu_index = id % wg_cpumask_weight();
+		cpu = wg_cpumask_first();
 		for (i = 0; i < cpu_index; ++i)
-			cpu = cpumask_next(cpu, cpu_online_mask);
+			cpu = wg_cpumask_next(cpu);
 		*stored_cpu = cpu;
 	}
 	return cpu;
@@ -124,13 +159,13 @@ static inline int wg_cpumask_choose_online(int *stored_cpu, unsigned int id)
  * a bit slower, and it doesn't seem like this potential race actually
  * introduces any performance loss, so we live with it.
  */
-static inline int wg_cpumask_next_online(int *next)
+static inline int wg_cpumask_next_eligible(int *next)
 {
 	int cpu = *next;
 
-	while (unlikely(!cpumask_test_cpu(cpu, cpu_online_mask)))
-		cpu = cpumask_next(cpu, cpu_online_mask) % nr_cpumask_bits;
-	*next = cpumask_next(cpu, cpu_online_mask) % nr_cpumask_bits;
+	while (unlikely(!wg_cpumask_test_cpu(cpu)))
+		cpu = wg_cpumask_next(cpu) % nr_cpumask_bits;
+	*next = wg_cpumask_next(cpu) % nr_cpumask_bits;
 	return cpu;
 }
 
@@ -173,7 +208,7 @@ static inline int wg_queue_enqueue_per_device_and_peer(
 	/* Then we queue it up in the device queue, which consumes the
 	 * packet as soon as it can.
 	 */
-	cpu = wg_cpumask_next_online(next_cpu);
+	cpu = wg_cpumask_next_eligible(next_cpu);
 	if (unlikely(ptr_ring_produce_bh(&device_queue->ring, skb)))
 		return -EPIPE;
 	queue_work_on(cpu, wq, &per_cpu_ptr(device_queue->worker, cpu)->work);
@@ -188,7 +223,7 @@ static inline void wg_queue_enqueue_per_peer_tx(struct sk_buff *skb, enum packet
 	struct wg_peer *peer = wg_peer_get(PACKET_PEER(skb));
 
 	atomic_set_release(&PACKET_CB(skb)->state, state);
-	queue_work_on(wg_cpumask_choose_online(&peer->serial_work_cpu, peer->internal_id),
+	queue_work_on(wg_cpumask_choose_eligible(&peer->serial_work_cpu, peer->internal_id),
 		      peer->device->packet_crypt_wq, &peer->transmit_packet_work);
 	wg_peer_put(peer);
 }
diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receive.c
index 7b8df406c..2d5d903d0 100644
--- a/drivers/net/wireguard/receive.c
+++ b/drivers/net/wireguard/receive.c
@@ -572,7 +572,7 @@ void wg_packet_receive(struct wg_device *wg, struct sk_buff *skb)
 			goto err;
 		}
 		atomic_inc(&wg->handshake_queue_len);
-		cpu = wg_cpumask_next_online(&wg->handshake_queue.last_cpu);
+		cpu = wg_cpumask_next_eligible(&wg->handshake_queue.last_cpu);
 		/* Queues up a call to packet_process_queued_handshake_packets(skb): */
 		queue_work_on(cpu, wg->handshake_receive_wq,
 			      &per_cpu_ptr(wg->handshake_queue.worker, cpu)->work);
-- 
2.30.2

