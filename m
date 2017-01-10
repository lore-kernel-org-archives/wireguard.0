Return-Path: jftucker@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1155b417
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jan 2017 03:37:59 +0000 (UTC)
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
 [209.85.192.195])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57929cf7
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Jan 2017 03:37:59 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y143so5535603pfb.1
 for <wireguard@lists.zx2c4.com>; Mon, 09 Jan 2017 19:47:39 -0800 (PST)
Return-Path: <jftucker@gmail.com>
From: James Tucker <jftucker@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] uapi: add bit-field padding for field alignment
Date: Mon,  9 Jan 2017 19:47:29 -0800
Message-Id: <20170110034729.40733-1-jftucker@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

The C language does not specify the layout behavior of bit-fields. As a
consequence, compilers are free to do interesting things with these
fields, including reorder, split, pick size, etc. In this case, it was
observed that on x64, gcc and clang were using only two bytes between
tx_bytes and num_ipmasks in wgpeer, causing interoperability issues.

While non-native clients (i.e. wireguard-go) could be fixed, the problem
will keep on giving, as the layouts can be changed by compiler flags and
architectures, which will make portability for all non-C implementations
extremely difficult. Compilers also do not document their behavior well
in this regard.

Signed-off-by: James Tucker <jftucker@gmail.com>
---
 src/uapi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/uapi.h b/src/uapi.h
index cd4b86b..bf38f48 100644
--- a/src/uapi.h
+++ b/src/uapi.h
@@ -107,6 +107,7 @@ struct wgpeer {
 
 	__u32 remove_me : 1; /* Set */
 	__u32 replace_ipmasks : 1; /* Set */
+	__u32 : 32-2; /* pad to force portable field size */
 
 	__u16 num_ipmasks; /* Get/Set */
 	__u16 persistent_keepalive_interval; /* Get/Set -- 0 = off, 0xffff = unset */
@@ -124,6 +125,7 @@ struct wgdevice {
 	__u32 replace_peer_list : 1; /* Set */
 	__u32 remove_private_key : 1; /* Set */
 	__u32 remove_preshared_key : 1; /* Set */
+	__u32 : 32-3; /* pad to force portable field size */
 
 	union {
 		__u16 num_peers; /* Get/Set */
-- 
2.11.0
