Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7EEC54E65
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 432b11df;
	Tue, 20 May 2025 19:42:33 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4a683881
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Mar 2025 20:14:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8ECE5A471BC;
 Wed, 12 Mar 2025 20:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21ECFC4CEDD;
 Wed, 12 Mar 2025 20:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741810496;
 bh=g1sFQOH1vPx9lrAH9SnoezGldeEVl4lvcdztzHQTJQM=;
 h=From:To:Cc:Subject:Date:From;
 b=OFn15q3V51I45tB11gIJbA7lTjNOXPMlMTcbf2BddQlXzu75hspiWs8j4ox33V1Hg
 9tA8oi9VKsliX9W0YM7TsNgOhxnqojnncAhKzjIwHK8gqUDKiowtX7BEgTUOFli7J/
 ej31iIfZ4kA5r0hSr22Q6M7O3fscKcFgdMeNmLztdWqzoj0wC4WT8xxGxPATXQ3pn4
 +hAaBk0JNBTmBKXxrRvawYiDQZaUVeZDacHz9KOgZnIe4u/iUVwkFgzd+Ifw2/0Fss
 pqjybBn3mMtxE6X9x6GduGbIL3zRpBZ1ixqvDQGrLDySVAb/UGQNsvdLC2ZbDb1wW7
 cWMgqnKONaDWw==
From: Kees Cook <kees@kernel.org>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: Kees Cook <kees@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Subject: [PATCH v2] wireguard: Add __nonstring annotations for unterminated
 strings
Date: Wed, 12 Mar 2025 13:14:51 -0700
Message-Id: <20250312201447.it.157-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4243; i=kees@kernel.org;
 h=from:subject:message-id; bh=g1sFQOH1vPx9lrAH9SnoezGldeEVl4lvcdztzHQTJQM=;
 b=owGbwMvMwCVmps19z/KJym7G02pJDOkXX1tPD95lfe6z11TDfzl7S1V6uT2N3ORrNnoKc+7fW
 mXgmB7VUcrCIMbFICumyBJk5x7n4vG2Pdx9riLMHFYmkCEMXJwCMBHvaYwM0+Z+anhwaO87nSqx
 BfJhqxcz3pi2w+bhZyGB5uClp206djAyLPv04EfStB6JU3OOcE5hdfwqyFWTtSdk2Q/1y0xrwzJ
 Z+QA=
X-Developer-Key: i=kees@kernel.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
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

When a character array without a terminating NUL character has a static
initializer, GCC 15's -Wunterminated-string-initialization will only
warn if the array lacks the "nonstring" attribute[1]. Mark the arrays
with __nonstring to correctly identify the char array as "not a C string"
and thereby eliminate the warning:

../drivers/net/wireguard/cookie.c:29:56: warning: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (9 chars into 8 available) [-Wunterminated-string-initialization]
   29 | static const u8 mac1_key_label[COOKIE_KEY_LABEL_LEN] = "mac1----";
      |                                                        ^~~~~~~~~~
../drivers/net/wireguard/cookie.c:30:58: warning: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (9 chars into 8 available) [-Wunterminated-string-initialization]
   30 | static const u8 cookie_key_label[COOKIE_KEY_LABEL_LEN] = "cookie--";
      |                                                          ^~~~~~~~~~
../drivers/net/wireguard/noise.c:28:38: warning: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (38 chars into 37 available) [-Wunterminated-string-initialization]
   28 | static const u8 handshake_name[37] = "Noise_IKpsk2_25519_ChaChaPoly_BLAKE2s";
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../drivers/net/wireguard/noise.c:29:39: warning: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (35 chars into 34 available) [-Wunterminated-string-initialization]
   29 | static const u8 identifier_name[34] = "WireGuard v1 zx2c4 Jason@zx2c4.com";
      |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The arrays are always used with their fixed size, so use __nonstring.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=117178 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 v2: Improve commit log, add cookie nonstrings too
 v1: https://lore.kernel.org/lkml/20250310222249.work.154-kees@kernel.org/
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: wireguard@lists.zx2c4.com
Cc: netdev@vger.kernel.org
---
 drivers/net/wireguard/cookie.c | 4 ++--
 drivers/net/wireguard/noise.c  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireguard/cookie.c b/drivers/net/wireguard/cookie.c
index f89581b5e8cb..94d0a7206084 100644
--- a/drivers/net/wireguard/cookie.c
+++ b/drivers/net/wireguard/cookie.c
@@ -26,8 +26,8 @@ void wg_cookie_checker_init(struct cookie_checker *checker,
 }
 
 enum { COOKIE_KEY_LABEL_LEN = 8 };
-static const u8 mac1_key_label[COOKIE_KEY_LABEL_LEN] = "mac1----";
-static const u8 cookie_key_label[COOKIE_KEY_LABEL_LEN] = "cookie--";
+static const u8 mac1_key_label[COOKIE_KEY_LABEL_LEN] __nonstring = "mac1----";
+static const u8 cookie_key_label[COOKIE_KEY_LABEL_LEN] __nonstring = "cookie--";
 
 static void precompute_key(u8 key[NOISE_SYMMETRIC_KEY_LEN],
 			   const u8 pubkey[NOISE_PUBLIC_KEY_LEN],
diff --git a/drivers/net/wireguard/noise.c b/drivers/net/wireguard/noise.c
index 202a33af5a72..7eb9a23a3d4d 100644
--- a/drivers/net/wireguard/noise.c
+++ b/drivers/net/wireguard/noise.c
@@ -25,8 +25,8 @@
  * <- e, ee, se, psk, {}
  */
 
-static const u8 handshake_name[37] = "Noise_IKpsk2_25519_ChaChaPoly_BLAKE2s";
-static const u8 identifier_name[34] = "WireGuard v1 zx2c4 Jason@zx2c4.com";
+static const u8 handshake_name[37] __nonstring = "Noise_IKpsk2_25519_ChaChaPoly_BLAKE2s";
+static const u8 identifier_name[34] __nonstring = "WireGuard v1 zx2c4 Jason@zx2c4.com";
 static u8 handshake_init_hash[NOISE_HASH_LEN] __ro_after_init;
 static u8 handshake_init_chaining_key[NOISE_HASH_LEN] __ro_after_init;
 static atomic64_t keypair_counter = ATOMIC64_INIT(0);
-- 
2.34.1

