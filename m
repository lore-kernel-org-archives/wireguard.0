Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AF5C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 May 2022 13:02:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9f58b475;
	Sat, 21 May 2022 13:02:44 +0000 (UTC)
Received: from sainfoin-smtp-out.extra.cea.fr (sainfoin-smtp-out.extra.cea.fr
 [132.167.192.228])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5fd45936
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 May 2022 13:02:43 +0000 (UTC)
Received: from pisaure.intra.cea.fr (pisaure.intra.cea.fr [132.166.88.21])
 by sainfoin-sys.extra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0) with
 ESMTP id 24LD2g7d002956
 for <wireguard@lists.zx2c4.com>; Sat, 21 May 2022 15:02:42 +0200
Received: from pisaure.intra.cea.fr (localhost [127.0.0.1])
 by localhost (Postfix) with SMTP id A98B6203019
 for <wireguard@lists.zx2c4.com>; Sat, 21 May 2022 15:02:42 +0200 (CEST)
Received: from muguet1-smtp-out.intra.cea.fr (muguet1-smtp-out.intra.cea.fr
 [132.166.192.12])
 by pisaure.intra.cea.fr (Postfix) with ESMTP id A04062028AB
 for <wireguard@lists.zx2c4.com>; Sat, 21 May 2022 15:02:42 +0200 (CEST)
Received: from [10.11.240.54] ([10.11.240.54])
 by muguet1-sys.intra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0) with ESMTP
 id 24LD2gxa012434
 for <wireguard@lists.zx2c4.com>; Sat, 21 May 2022 15:02:42 +0200
Message-ID: <9466bb1d-d6ee-4428-8132-a87f9db644c9@cea.fr>
Date: Sat, 21 May 2022 15:02:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
To: wireguard@lists.zx2c4.com
Content-Language: en-US
From: Dimitri Papadopoulos <dimitri.papadopoulos@cea.fr>
Subject: [PATCH] Fix typos found by codespell
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

---
  driver/wintun.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/driver/wintun.c b/driver/wintun.c
index f3eea05..ad4b16b 100644
--- a/driver/wintun.c
+++ b/driver/wintun.c
@@ -49,7 +49,7 @@
          ((((ULONG)(x)&0x000000ff) << 24) | (((ULONG)(x)&0x0000ff00) << 
8) | (((ULONG)(x)&0x00ff0000) >> 8) | \
           (((ULONG)(x)&0xff000000) >> 24))
  #else
-#    error "Unable to determine endianess"
+#    error "Unable to determine endianness"
  #endif

  #define TUN_MEMORY_TAG HTONL('wtun')
@@ -107,7 +107,7 @@ typedef struct _TUN_REGISTER_RINGS_32
          /* Size of the ring */
          ULONG RingSize;

-        /* 32-bit addres of client allocated ring */
+        /* 32-bit address of client allocated ring */
          ULONG Ring;

          /* On send: An event created by the client the Wintun signals 
after it moves the Tail member of the send ring.
-- 
2.34.1
