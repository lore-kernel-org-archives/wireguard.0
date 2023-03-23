Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B4FC6FD1C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Mar 2023 14:20:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9582c811;
	Thu, 23 Mar 2023 14:20:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5865c948
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Mar 2023 14:20:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D651462670;
 Thu, 23 Mar 2023 14:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CAC9C433D2;
 Thu, 23 Mar 2023 14:20:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="iAvGtKIh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1679581203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=s6+xdLTbapnWkgsW7EozVwLRORONjfmL95XQwljG6l8=;
 b=iAvGtKIh27IEjOBMB6mSve6aO5RDutAB85Tn1lGTpf1SLfAfXOGEyVofdhAFVHRKqfU0La
 g993F4mWH1kVBY3GL34w4levO/CpLuzhCQLmTDEAjgxuKwPjG8l1f+5XnQz06vqQcYeFJ7
 j38zO1H3wDEjNdSQlfUkZqHguf4KPKI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c4e2264b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 23 Mar 2023 14:20:03 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: samuel@sholland.org,
	me@msfjarvis.dev,
	wireguard@lists.zx2c4.com
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH android] ui: set selected tunnel after creating fragments
Date: Thu, 23 Mar 2023 15:19:57 +0100
Message-Id: <20230323141957.3200896-1-Jason@zx2c4.com>
MIME-Version: 1.0
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

I'm not sure why that comment (Samuel's) was there saying it was
necessary. Given it's been async for a long while, this wasn't
guaranteed anyway. So let's get rid of it and see what happens. Screen
rotation seems fine thus far.

Cc: Samuel Holland <samuel@sholland.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
Samuel -- CC'ing this to you in case you remember anything.

 .../com/wireguard/android/activity/BaseActivity.kt    | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/ui/src/main/java/com/wireguard/android/activity/BaseActivity.kt b/ui/src/main/java/com/wireguard/android/activity/BaseActivity.kt
index 204a5a80..8f0855ea 100644
--- a/ui/src/main/java/com/wireguard/android/activity/BaseActivity.kt
+++ b/ui/src/main/java/com/wireguard/android/activity/BaseActivity.kt
@@ -7,9 +7,7 @@ package com.wireguard.android.activity
 import android.os.Bundle
 import androidx.databinding.CallbackRegistry
 import androidx.databinding.CallbackRegistry.NotifierCallback
-import androidx.lifecycle.Lifecycle
 import androidx.lifecycle.lifecycleScope
-import androidx.lifecycle.repeatOnLifecycle
 import com.wireguard.android.Application
 import com.wireguard.android.model.ObservableTunnel
 import kotlinx.coroutines.launch
@@ -33,6 +31,8 @@ abstract class BaseActivity : ThemeChangeAwareActivity() {
     }
 
     override fun onCreate(savedInstanceState: Bundle?) {
+        super.onCreate(savedInstanceState)
+
         // Restore the saved tunnel if there is one; otherwise grab it from the arguments.
         val savedTunnelName = when {
             savedInstanceState != null -> savedInstanceState.getString(KEY_SELECTED_TUNNEL)
@@ -41,13 +41,8 @@ abstract class BaseActivity : ThemeChangeAwareActivity() {
         }
         if (savedTunnelName != null)
             lifecycleScope.launch {
-                repeatOnLifecycle(Lifecycle.State.CREATED) {
-                    selectedTunnel = Application.getTunnelManager().getTunnels()[savedTunnelName]
-                }
+                selectedTunnel = Application.getTunnelManager().getTunnels()[savedTunnelName]
             }
-
-        // The selected tunnel must be set before the superclass method recreates fragments.
-        super.onCreate(savedInstanceState)
     }
 
     override fun onSaveInstanceState(outState: Bundle) {
-- 
2.40.0

