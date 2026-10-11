Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E257B606A31A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Oct 2026 05:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror header.d=gmail.com header.i=@gmail.com header.a=rsa-sha1 header.s=20251104 header.b=rDioTWgz
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f8489716;
	Mon, 26 Oct 2026 05:28:41 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 168925e9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Oct 2026 10:23:31 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2e81738d24eso8759855ad.1
 for <wireguard@lists.zx2c4.com>; Sun, 11 Oct 2026 03:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791714208; x=1792319008; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/pPRjimeEtxmh2P3t5S8/c4gUxkBAEeUK/IaL4NUFWU=;
 b=rDioTWgzhpsqe0U/PQN5lOqIENAbtxxdh7hjH9P6brItibjPRaomLuRKAtEwmVXA6X
 9avp4OmDVyO6TeKNxdyAbrYS0KC87PIxHaStLL+fXecdrjkcizzlE9DYqIPQQeaY+yeH
 FaQsQ813qwsTkU/eiUDhO1Ffd4jr/0Msp2R+BeMFlBLRVfir+2RVUqwTLPoCoOV8NzDY
 tLbbG3sWZGz6+Me81ChSXAZE5J1vypKvBqHJz+PeWtNJZeyzD3co9KyOL9Vcg6VfQ0HG
 O95rKH9Qgb9MkrCLv0KS5LlwNhhixeLeDXbgmy6oVF/YigyTVOa+E4JT+y8xDkwapq0V
 Rujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791714208; x=1792319008;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/pPRjimeEtxmh2P3t5S8/c4gUxkBAEeUK/IaL4NUFWU=;
 b=rZ7OEF5kwjwrwXgibY42+fGiJz8+UZWDDcN2x9OuKesBzThE21NFtHxgiNcgcaMogb
 fgjBZ1L9YUscbbPIwEL9m9TUjMnPTerQqzCOa3HwZKYaOkixa1jx3Q8b7DOE14j2w/1x
 Ub5vmjsHPxc4L4myvCJrZxhjjPHklRkC7peiI1Lch6OWxfiqRE8p6LCeIFIYQUbVUr02
 euVjyDhuUDHQX/dVMfEd5nQySgE4Qlk8cz02+SeaG8i9DQg62UX2jyz+bG89zfIUP15B
 Lu+Pt69MZjXyLa23wWgx2zZQUaZDWrjZzk9eTMA13X6WL8Kv9tZjOYQJ2rkUcXCRnSQi
 602g==
X-Forwarded-Encrypted: i=1;
 AKwUvBzF1bf7obzguUthx8kwYwq1ugp4u0QWK95MvT6B7qudBQOOXbsyaj5C4NbxHbO3gj10ZA5eLt9ojXA=@lists.zx2c4.com
X-Gm-Message-State: AFq9FYL+RaJAwwCpV3WsAIRLKiHB1aauGt2M88DtbKj/QUuYQfqvPwDA
 oza4dHtqjy5fWtAVlfy2FmRfb5Nz/iyYFmaTJM3IyaSQX/lGmL1MWsJc
X-Gm-Gg: AYBFou0jJAi2QBTzgayLQpaAR6n724kzcZnvsQRjh+IOmpcnQz+BJ4+9PIb6Qk1Q0NG
 38ymtVGulptKVKcVP/VLYwu0tNeWEJh1GVdWhV7lx7UHSuUvR70+oNI1Pt0/Dc39qkurfUSi+23
 4djfc1v+OsUtue/ptrn/qVoQtveYjjg1AKU8/kvEXk1adXQx6QFgCnIXKUPigl1cmZR0QCaGnBP
 CwDlV5/5nmT7gSiDYTopf6E2PXHyhAXVOYeOrMrDDpTJI75pGTdCtputCXoAmFYfYfeW28EQzKR
 tzhU+nXoCZV9ZcuuogVAehjvkhcyIwOf/q2zS+LL2ztPcj+3EMgXM72C1pVhV3Mgccq0PxfWOsr
 NzpYFBMn4QD/VQw9MnGgNYcjN4Cm1sUirnFt1b3Rw/iXb/8Fsf7N9s3f0XghVGIlG+DJ+KExCbJ
 iBskxXMlqSQ5fH879D578ZQZZdXONIWP8qkqjfLZbbsG2gKulHASXFEHBe6VinCHiu8RWC8KSsj
 tel4Y0uGio=
X-Received: by 2002:a17:902:f78c:b0:2e5:98d7:821e with SMTP id
 d9443c01a7336-2e8428207f8mr61319815ad.7.1791714208455; 
 Sun, 11 Oct 2026 03:23:28 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45a:16c8::245:79])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e8422e1643sm31643955ad.70.2026.10.11.03.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2026 03:23:27 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>,
 syzbot+de9701a2cad597c14d34@syzkaller.appspotmail.com
Subject: [PATCH net] wireguard: mark racy persistent_keepalive_interval
 accesses
Date: Sun, 11 Oct 2026 17:23:22 +0700
Message-ID: <20261011102322.355167-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 26 Oct 2026 05:28:33 +0000
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
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

wg_set_device_doit() updates peer->persistent_keepalive_interval under
device_update_lock, while the RX/TX paths read it locklessly in
wg_timers_any_authenticated_packet_traversal() and in the persistent
keepalive timer. KCSAN reports the race:

  BUG: KCSAN: data-race in set_peer / wg_timers_any_authenticated_packet_traversal

  write to ... by task 3648 on cpu 1:
   set_peer+0x...  drivers/net/wireguard/netlink.c:457
   wg_set_device_doit+0x...
  read to ... by task 3652 on cpu 0:
   wg_timers_any_authenticated_packet_traversal+0x...  timers.c:217
   wg_packet_consume_data_done+0x...
   wg_packet_rx_poll+0x...

The race is benign, but the reader also loads the field twice, so the
zero check and the timer expiry computation can see different values.
Load it once with READ_ONCE() and mark the writer and the other
lockless reader accordingly.

Reported-by: syzbot+de9701a2cad597c14d34@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=de9701a2cad597c14d34
Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
---
 drivers/net/wireguard/netlink.c | 3 ++-
 drivers/net/wireguard/timers.c  | 8 +++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlink.c
index 1da7e98d0d50..fafe2900c92b 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -454,7 +454,8 @@ static int set_peer(struct wg_device *wg, struct nlattr **attrs)
 			persistent_keepalive_interval &&
 			netif_running(wg->dev);
 
-		peer->persistent_keepalive_interval = persistent_keepalive_interval;
+		WRITE_ONCE(peer->persistent_keepalive_interval,
+			   persistent_keepalive_interval);
 		if (send_keepalive)
 			wg_packet_send_keepalive(peer);
 	}
diff --git a/drivers/net/wireguard/timers.c b/drivers/net/wireguard/timers.c
index 4016a3065602..c4697e8522b3 100644
--- a/drivers/net/wireguard/timers.c
+++ b/drivers/net/wireguard/timers.c
@@ -140,7 +140,7 @@ static void wg_expired_send_persistent_keepalive(struct timer_list *timer)
 	struct wg_peer *peer = timer_container_of(peer, timer,
 						  timer_persistent_keepalive);
 
-	if (likely(peer->persistent_keepalive_interval))
+	if (likely(READ_ONCE(peer->persistent_keepalive_interval)))
 		wg_packet_send_keepalive(peer);
 }
 
@@ -214,9 +214,11 @@ void wg_timers_session_derived(struct wg_peer *peer)
  */
 void wg_timers_any_authenticated_packet_traversal(struct wg_peer *peer)
 {
-	if (peer->persistent_keepalive_interval)
+	u16 interval = READ_ONCE(peer->persistent_keepalive_interval);
+
+	if (interval)
 		mod_peer_timer(peer, &peer->timer_persistent_keepalive,
-			jiffies + peer->persistent_keepalive_interval * HZ);
+			jiffies + interval * HZ);
 }
 
 void wg_timers_init(struct wg_peer *peer)
-- 
2.43.0

