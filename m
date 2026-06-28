Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE063CA5FFC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 09:24:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 57c84aba;
	Mon, 5 Oct 2026 06:59:47 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 6ab45c4f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 28 Jun 2026 20:38:45 +0000 (UTC)
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256;
 b=uKCtBt4Rp+KXAHSoj8dl0Bs60CfteJJZRP6SZJjbSnQCP9s9fvkKu8bsXWAg2XQl95SEe2N6T0TNOlrwIuRgBBiUrCZlCS4csx60Sat58g1nFWARGdfEcCwwtS2mOfhl8rkRAhGyAsUjeG3ZqkBcljQMu53mZQ2tV45tTcrp7afOn/CeYs9SDXzE7rTcr9WKj1+W8uMJs1pwj2Z0MoOTwzWmSniqs//UaQ3jFQwJK0ZebrCjco2SNbWPT3348d8ytFjJhg3CQoDqGsdAbUAKiPlqmmvlhseJ6lWf1+sGUIcIb7xVGGaNFQbiKcl5nUI2nja4SlyXkv9hSg/t2VyUfw==;
 s=purelymail2; d=rcpassos.me; v=1;
 bh=eVlNk3fd20VVp42Y7KTyhuYm+giDYVo7aA3aU9r8sjQ=;
 h=Received:From:To:Subject:Date; 
DKIM-Signature: a=rsa-sha256;
 b=W1YvhwjjkIiSmzuRoClUVpqDa8Buw27Rhq+r1PhBnTZWLgPsrblJXQ4RQcq5aFizquzQ8EMDmQ0oVmq9LlaeSMN9EkDAyLXItrybo9HnZS1c8DPWjLT8PJHFLGPsbaszDgC1aoN5gTokwin84hdZFTtSNyBSsdQzdPJgak78A55zRyuBl+UxUlUwHXS9pf9wcrLqoZj7ovcS5FTkPvuvwvIANEH3kapaP7YXlPrzu49Ls6EaKjaP2jXIsPWAPf6++fjHC22sYW68WkDYAWMJfqakCk3EpVo6e2Ya45v2bK6I5FfJwJ1ya0I1jEfcNoNdBolm3AgHa03OXP9g9yQMHw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=eVlNk3fd20VVp42Y7KTyhuYm+giDYVo7aA3aU9r8sjQ=;
 h=Feedback-ID:Received:From:To:Subject:Date; 
Feedback-ID: 45355:7809:null:purelymail
X-Pm-Original-To: wireguard@lists.zx2c4.com
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1919165294; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 28 Jun 2026 20:38:09 +0000 (UTC)
From: Rafael Passos <rafael@rcpassos.me>
To: rafael@rcpassos.me
Cc: Jason@zx2c4.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com,
 syzbot+9ca7674fa7521a3f1bc2@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, wireguard@lists.zx2c4.com
Subject: [PATCH] Wireguard: Fix data-race in rx/tx counter
Date: Sun, 28 Jun 2026 17:38:23 -0300
Message-ID: <20260628203823.144789-1-rafael@rcpassos.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DJFTVX3FE7OD.2O8GTO84798T@rcpassos.me>
References: <DJFTVX3FE7OD.2O8GTO84798T@rcpassos.me>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
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

fixes data-race in {rx/tx}_bytes counter for wireguard connection.
these values were incremented inside a read_lock_bh block, but write
protections were missing. making them atomic was the simplest way out.
This was found by syzbot with kcsan.

Reported-by: syzbot+9ca7674fa7521a3f1bc2@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=3D9ca7674fa7521a3f1bc2
Signed-off-by: Rafael Passos <rafael@rcpassos.me>
---

Hi,

I am posting this patch to better ilustrate the discussion.
If this is a non-issue, its fine.
As I mentioned in the previous email, this issue was reported by syzbot,
but I was not able to reproduce it.
I am also aware atomic calls may introduce extra cost on older arm cpus.
I would like to hear from the community: would this an adequate solution ?

Thanks,

Rafael Passos



 drivers/net/wireguard/netlink.c | 4 ++--
 drivers/net/wireguard/peer.h    | 2 +-
 drivers/net/wireguard/receive.c | 2 +-
 drivers/net/wireguard/socket.c  | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlin=
k.c
index 1da7e98d0d509..ec66f79e46377 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -109,9 +109,9 @@ get_peer(struct wg_peer *peer, struct sk_buff *skb, str=
uct dump_ctx *ctx)
 =09=09=09    sizeof(last_handshake), &last_handshake) ||
 =09=09    nla_put_u16(skb, WGPEER_A_PERSISTENT_KEEPALIVE_INTERVAL,
 =09=09=09=09peer->persistent_keepalive_interval) ||
-=09=09    nla_put_u64_64bit(skb, WGPEER_A_TX_BYTES, peer->tx_bytes,
+=09=09    nla_put_u64_64bit(skb, WGPEER_A_TX_BYTES, atomic64_read(&peer->t=
x_bytes),
 =09=09=09=09      WGPEER_A_UNSPEC) ||
-=09=09    nla_put_u64_64bit(skb, WGPEER_A_RX_BYTES, peer->rx_bytes,
+=09=09    nla_put_u64_64bit(skb, WGPEER_A_RX_BYTES, atomic64_read(&peer->r=
x_bytes),
 =09=09=09=09      WGPEER_A_UNSPEC) ||
 =09=09    nla_put_u32(skb, WGPEER_A_PROTOCOL_VERSION, 1))
 =09=09=09goto err;
diff --git a/drivers/net/wireguard/peer.h b/drivers/net/wireguard/peer.h
index 718fb42bdac7e..01c4b80086759 100644
--- a/drivers/net/wireguard/peer.h
+++ b/drivers/net/wireguard/peer.h
@@ -49,7 +49,7 @@ struct wg_peer {
 =09struct work_struct transmit_handshake_work, clear_peer_work, transmit_p=
acket_work;
 =09struct cookie latest_cookie;
 =09struct hlist_node pubkey_hash;
-=09u64 rx_bytes, tx_bytes;
+=09atomic64_t rx_bytes, tx_bytes;
 =09struct timer_list timer_retransmit_handshake, timer_send_keepalive;
 =09struct timer_list timer_new_handshake, timer_zero_key_material;
 =09struct timer_list timer_persistent_keepalive;
diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receiv=
e.c
index eb8851113654f..500d86576c692 100644
--- a/drivers/net/wireguard/receive.c
+++ b/drivers/net/wireguard/receive.c
@@ -20,7 +20,7 @@
 static void update_rx_stats(struct wg_peer *peer, size_t len)
 {
 =09dev_sw_netstats_rx_add(peer->device->dev, len);
-=09peer->rx_bytes +=3D len;
+=09atomic64_add(len, &peer->rx_bytes);
 }
=20
 #define SKB_TYPE_LE32(skb) (((struct message_header *)(skb)->data)->type)
diff --git a/drivers/net/wireguard/socket.c b/drivers/net/wireguard/socket.=
c
index 0028ef17dc716..9e8a49b9078f2 100644
--- a/drivers/net/wireguard/socket.c
+++ b/drivers/net/wireguard/socket.c
@@ -179,7 +179,7 @@ int wg_socket_send_skb_to_peer(struct wg_peer *peer, st=
ruct sk_buff *skb, u8 ds)
 =09else
 =09=09dev_kfree_skb(skb);
 =09if (likely(!ret))
-=09=09peer->tx_bytes +=3D skb_len;
+=09=09atomic64_add(skb_len, &peer->tx_bytes);
 =09read_unlock_bh(&peer->endpoint_lock);
=20
 =09return ret;
--=20
2.53.0

