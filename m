Return-Path: joerg@higgsboson.tk
Received: from mail.higgsboson.tk (mail.higgsboson.tk [148.251.132.243])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f7453be
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Oct 2016 17:30:53 +0000 (UTC)
Received: from [192.168.42.25] (ip-2-201-3-34.web.vodafone.de [2.201.3.34])
 by mail.higgsboson.tk (Postfix) with ESMTPSA id 443CB2F3EC
 for <wireguard@lists.zx2c4.com>; Fri, 21 Oct 2016 17:31:58 +0000 (UTC)
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@higgsboson.tk>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Message-ID: <2a3c259f-6479-8f22-c426-bec54635bd8d@higgsboson.tk>
Date: Fri, 21 Oct 2016 19:31:56 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------22FB28246EA68774E461EEA4"
Subject: [WireGuard] [PATCH] uapi.h: public_key field is a getter
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------22FB28246EA68774E461EEA4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Jörg Thalheim <joerg@higgsboson.tk>
---
 src/uapi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)



--------------22FB28246EA68774E461EEA4
Content-Type: text/x-patch;
 name="0001-uapi.h-public_key-field-is-a-getter.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-uapi.h-public_key-field-is-a-getter.patch"

diff --git a/src/uapi.h b/src/uapi.h
index 6c6971e..69dfee3 100644
--- a/src/uapi.h
+++ b/src/uapi.h
@@ -113,7 +113,7 @@ struct wgpeer {
 struct wgdevice {
 	char interface[IFNAMSIZ]; /* Get */
 
-	__u8 public_key[WG_KEY_LEN]; /* Get/Set */
+	__u8 public_key[WG_KEY_LEN]; /* Get */
 	__u8 private_key[WG_KEY_LEN]; /* Get/Set */
 	__u8 preshared_key[WG_KEY_LEN]; /* Get/Set */
 


--------------22FB28246EA68774E461EEA4--
