Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB09ECA5FFD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 07:16:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 83d24b3e;
	Mon, 5 Oct 2026 06:56:16 +0000 (UTC)
Received: from forward103b.mail.yandex.net (forward103b.mail.yandex.net
 [2a02:6b8:c02:900:1:45:d181:d103])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 810c60de
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Jun 2026 07:47:22 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c24:b47:0:640:7767:0])
 by forward103b.mail.yandex.net (Yandex) with ESMTPS id 02066C00C4;
 Sun, 21 Jun 2026 10:47:22 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net (smtp)
 with ESMTPSA id KlPhbgfcLmI0-v9T2qmKx; 
 Sun, 21 Jun 2026 10:47:21 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sw4me.com; s=mail;
 t=1782028041; bh=0yNEpfKO3XezCeaYqmwclhyJRspdqbGe/r5HE2sX7kQ=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=KEt1b0uhDDyOohPYpS/AsvB3urV6LK1pCh6YyPu2mWxwhCA65jUzbnkYslr8kH5+k
 SNHeIooOrvxtWXaub7W5OtKPPlKy4EYxmxy8H6Rgcw83qs/ljSUQPzNQTl/GoxRSwF
 fL8iKbMnbSQL4fDj/SmyMxWUAzJgoHiaXf08uAF8=
Authentication-Results: mail-nwsmtp-smtp-production-main-98.sas.yp-c.yandex.net;
 dkim=pass header.i=@sw4me.com
From: Anton Kovalenko <anton@sw4me.com>
To: wireguard@lists.zx2c4.com
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Harsh Shandilya <me@msfjarvis.dev>, Anton Kovalenko <anton@sw4me.com>
Subject: [PATCH wireguard-android] ui: add import config from clipboard
Date: Sun, 21 Jun 2026 10:47:10 +0300
Message-Id: <20260621074710.1106438-1-anton@sw4me.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:55:46 +0000
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

Adds a fourth action to the add-tunnel bottom sheet that reads plain
text from the system clipboard and routes it through the existing
text-import path (validate, name, create) used for QR codes.

Signed-off-by: Anton Kovalenko <anton@sw4me.com>
---
The add-tunnel sheet currently offers file/archive, QR scan and
create-from-scratch. This adds a clipboard option for the common case
of getting a config as text over chat or email, routed through the
existing QR-text import path so validation, naming and storage are
unchanged.

Built and tested on Samsung S24 Ultra, Android 16: a valid config
imports and names correctly; empty or non-config clipboard shows the
expected error snackbar.

First patch I've sent to the list — happy to adjust style or approach.

Disclosure: this patch was written by Claude (Anthropic's AI), which I
reviewed, built and tested.

 .../android/fragment/AddTunnelsSheet.kt       |  9 +++++
 .../android/fragment/TunnelListFragment.kt    | 15 ++++++++
 .../wireguard/android/util/ClipboardUtils.kt  | 13 +++++++
 ui/src/main/res/drawable/ic_action_paste.xml  | 14 ++++++++
 .../res/layout/add_tunnels_bottom_sheet.xml   | 34 ++++++++++++++++---
 ui/src/main/res/values/strings.xml            |  2 ++
 6 files changed, 82 insertions(+), 5 deletions(-)
 create mode 100644 ui/src/main/res/drawable/ic_action_paste.xml

diff --git a/ui/src/main/java/com/wireguard/android/fragment/AddTunnelsSheet.kt b/ui/src/main/java/com/wireguard/android/fragment/AddTunnelsSheet.kt
index 161709c3..d5f01b40 100644
--- a/ui/src/main/java/com/wireguard/android/fragment/AddTunnelsSheet.kt
+++ b/ui/src/main/java/com/wireguard/android/fragment/AddTunnelsSheet.kt
@@ -64,6 +64,10 @@ class AddTunnelsSheet : BottomSheetDialogFragment() {
                     dismiss()
                     onRequestImportConfig()
                 }
+                dialog.findViewById<View>(R.id.create_from_clipboard)?.setOnClickListener {
+                    dismiss()
+                    onRequestImportFromClipboard()
+                }
                 dialog.findViewById<View>(R.id.create_from_qrcode)?.setOnClickListener {
                     dismiss()
                     onRequestScanQRCode()
@@ -89,6 +93,10 @@ class AddTunnelsSheet : BottomSheetDialogFragment() {
         setFragmentResult(REQUEST_KEY_NEW_TUNNEL, Bundle().apply { putString(REQUEST_METHOD, REQUEST_IMPORT) })
     }
 
+    private fun onRequestImportFromClipboard() {
+        setFragmentResult(REQUEST_KEY_NEW_TUNNEL, Bundle().apply { putString(REQUEST_METHOD, REQUEST_CLIPBOARD) })
+    }
+
     private fun onRequestScanQRCode() {
         setFragmentResult(REQUEST_KEY_NEW_TUNNEL, Bundle().apply { putString(REQUEST_METHOD, REQUEST_SCAN) })
     }
@@ -98,6 +106,7 @@ class AddTunnelsSheet : BottomSheetDialogFragment() {
         const val REQUEST_METHOD = "request_method"
         const val REQUEST_CREATE = "request_create"
         const val REQUEST_IMPORT = "request_import"
+        const val REQUEST_CLIPBOARD = "request_clipboard"
         const val REQUEST_SCAN = "request_scan"
     }
 }
diff --git a/ui/src/main/java/com/wireguard/android/fragment/TunnelListFragment.kt b/ui/src/main/java/com/wireguard/android/fragment/TunnelListFragment.kt
index 119b6afe..8bde6794 100644
--- a/ui/src/main/java/com/wireguard/android/fragment/TunnelListFragment.kt
+++ b/ui/src/main/java/com/wireguard/android/fragment/TunnelListFragment.kt
@@ -34,6 +34,7 @@ import com.wireguard.android.databinding.TunnelListFragmentBinding
 import com.wireguard.android.databinding.TunnelListItemBinding
 import com.wireguard.android.model.ObservableTunnel
 import com.wireguard.android.updater.SnackbarUpdateShower
+import com.wireguard.android.util.ClipboardUtils
 import com.wireguard.android.util.ErrorMessages
 import com.wireguard.android.util.QrCodeFromFileScanner
 import com.wireguard.android.util.TunnelImporter
@@ -83,6 +84,16 @@ class TunnelListFragment : BaseFragment() {
 
     private val snackbarUpdateShower = SnackbarUpdateShower(this)
 
+    private fun importFromClipboard() {
+        val context = context ?: return
+        val text = ClipboardUtils.readPlainText(context)
+        if (text.isNullOrBlank()) {
+            showSnackbar(getString(R.string.clipboard_no_text))
+            return
+        }
+        TunnelImporter.importTunnel(parentFragmentManager, text.toString()) { showSnackbar(it) }
+    }
+
     override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
         super.onViewCreated(view, savedInstanceState)
         if (savedInstanceState != null) {
@@ -114,6 +125,10 @@ class TunnelListFragment : BaseFragment() {
                             tunnelFileImportResultLauncher.launch("*/*")
                         }
 
+                        AddTunnelsSheet.REQUEST_CLIPBOARD -> {
+                            importFromClipboard()
+                        }
+
                         AddTunnelsSheet.REQUEST_SCAN -> {
                             qrImportResultLauncher.launch(
                                 ScanOptions()
diff --git a/ui/src/main/java/com/wireguard/android/util/ClipboardUtils.kt b/ui/src/main/java/com/wireguard/android/util/ClipboardUtils.kt
index 8968979f..76eb2b9a 100644
--- a/ui/src/main/java/com/wireguard/android/util/ClipboardUtils.kt
+++ b/ui/src/main/java/com/wireguard/android/util/ClipboardUtils.kt
@@ -6,6 +6,7 @@ package com.wireguard.android.util
 
 import android.content.ClipData
 import android.content.ClipboardManager
+import android.content.Context
 import android.os.Build
 import android.view.View
 import android.widget.TextView
@@ -18,6 +19,18 @@ import com.wireguard.android.R
  * Standalone utilities for interacting with the system clipboard.
  */
 object ClipboardUtils {
+    /**
+     * Returns the plain-text contents of the primary clip, or null if the
+     * clipboard is unavailable, empty, or holds no coercible text.
+     */
+    @JvmStatic
+    fun readPlainText(context: Context): CharSequence? {
+        val service = context.getSystemService<ClipboardManager>() ?: return null
+        val clip = service.primaryClip ?: return null
+        if (clip.itemCount == 0) return null
+        return clip.getItemAt(0).coerceToText(context)
+    }
+
     @JvmStatic
     fun copyTextView(view: View) {
         val data = when (view) {
diff --git a/ui/src/main/res/drawable/ic_action_paste.xml b/ui/src/main/res/drawable/ic_action_paste.xml
new file mode 100644
index 00000000..1841b21e
--- /dev/null
+++ b/ui/src/main/res/drawable/ic_action_paste.xml
@@ -0,0 +1,14 @@
+<?xml version="1.0" encoding="utf-8"?><!--
+  ~ Copyright © 2017-2025 WireGuard LLC. All Rights Reserved.
+  ~ SPDX-License-Identifier: Apache-2.0
+  -->
+<vector xmlns:android="http://schemas.android.com/apk/res/android"
+    android:width="24dp"
+    android:height="24dp"
+    android:tint="?attr/colorControlNormal"
+    android:viewportWidth="24"
+    android:viewportHeight="24">
+    <path
+        android:fillColor="#FFFFFFFF"
+        android:pathData="M19,2h-4.18C14.4,0.84 13.3,0 12,0S9.6,0.84 9.18,2H5C3.9,2 3,2.9 3,4v16c0,1.1 0.9,2 2,2h14c1.1,0 2,-0.9 2,-2L21,4c0,-1.1 -0.9,-2 -2,-2zM12,2c0.55,0 1,0.45 1,1s-0.45,1 -1,1 -1,-0.45 -1,-1 0.45,-1 1,-1zM19,20L5,20L5,4h2v3h10L17,4h2v16z" />
+</vector>
diff --git a/ui/src/main/res/layout/add_tunnels_bottom_sheet.xml b/ui/src/main/res/layout/add_tunnels_bottom_sheet.xml
index 0ad1ef23..310a2d75 100644
--- a/ui/src/main/res/layout/add_tunnels_bottom_sheet.xml
+++ b/ui/src/main/res/layout/add_tunnels_bottom_sheet.xml
@@ -18,22 +18,22 @@
         android:layout_marginLeft="@dimen/normal_margin"
         android:layout_marginEnd="@dimen/normal_margin"
         android:layout_marginRight="@dimen/normal_margin"
-        android:nextFocusDown="@id/create_from_qrcode"
-        android:nextFocusForward="@id/create_from_qrcode"
+        android:nextFocusDown="@id/create_from_clipboard"
+        android:nextFocusForward="@id/create_from_clipboard"
         android:text="@string/create_from_file"
         android:textAlignment="viewStart"
         android:textColor="?attr/colorOnSurface"
         app:icon="@drawable/ic_action_open"
         app:iconPadding="@dimen/bottom_sheet_icon_padding"
         app:iconTint="?attr/colorSecondary"
-        app:layout_constraintBottom_toTopOf="@+id/create_from_qrcode"
+        app:layout_constraintBottom_toTopOf="@+id/create_from_clipboard"
         app:layout_constraintEnd_toEndOf="parent"
         app:layout_constraintStart_toStartOf="parent"
         app:layout_constraintTop_toBottomOf="parent"
         app:rippleColor="?attr/colorSecondary" />
 
     <com.google.android.material.button.MaterialButton
-        android:id="@+id/create_from_qrcode"
+        android:id="@+id/create_from_clipboard"
         style="@style/Widget.Material3.Button.TextButton.Icon"
         android:layout_width="match_parent"
         android:layout_height="@dimen/bottom_sheet_item_height"
@@ -42,6 +42,30 @@
         android:layout_marginEnd="@dimen/normal_margin"
         android:layout_marginRight="@dimen/normal_margin"
         android:nextFocusUp="@id/create_from_file"
+        android:nextFocusDown="@id/create_from_qrcode"
+        android:nextFocusForward="@id/create_from_qrcode"
+        android:text="@string/create_from_clipboard"
+        android:textAlignment="viewStart"
+        android:textColor="?attr/colorOnSurface"
+        app:icon="@drawable/ic_action_paste"
+        app:iconPadding="@dimen/bottom_sheet_icon_padding"
+        app:iconTint="?attr/colorSecondary"
+        app:layout_constraintBottom_toTopOf="@+id/create_from_qrcode"
+        app:layout_constraintEnd_toEndOf="parent"
+        app:layout_constraintStart_toStartOf="parent"
+        app:layout_constraintTop_toBottomOf="@+id/create_from_file"
+        app:rippleColor="?attr/colorSecondary" />
+
+    <com.google.android.material.button.MaterialButton
+        android:id="@+id/create_from_qrcode"
+        style="@style/Widget.Material3.Button.TextButton.Icon"
+        android:layout_width="match_parent"
+        android:layout_height="@dimen/bottom_sheet_item_height"
+        android:layout_marginStart="@dimen/normal_margin"
+        android:layout_marginLeft="@dimen/normal_margin"
+        android:layout_marginEnd="@dimen/normal_margin"
+        android:layout_marginRight="@dimen/normal_margin"
+        android:nextFocusUp="@id/create_from_clipboard"
         android:nextFocusDown="@id/create_empty"
         android:nextFocusForward="@id/create_empty"
         android:text="@string/create_from_qr_code"
@@ -53,7 +77,7 @@
         app:layout_constraintBottom_toBottomOf="@+id/create_empty"
         app:layout_constraintEnd_toEndOf="parent"
         app:layout_constraintStart_toStartOf="parent"
-        app:layout_constraintTop_toBottomOf="@+id/create_from_file"
+        app:layout_constraintTop_toBottomOf="@+id/create_from_clipboard"
         app:rippleColor="?attr/colorSecondary" />
 
     <com.google.android.material.button.MaterialButton
diff --git a/ui/src/main/res/values/strings.xml b/ui/src/main/res/values/strings.xml
index 32e797e6..757c78c9 100644
--- a/ui/src/main/res/values/strings.xml
+++ b/ui/src/main/res/values/strings.xml
@@ -86,6 +86,7 @@
     <string name="error_no_qr_found">QR code not found in image</string>
     <string name="error_qr_checksum">QR code checksum verification failed</string>
     <string name="cancel">Cancel</string>
+    <string name="clipboard_no_text">No text on the clipboard</string>
     <string name="config_delete_error">Cannot delete configuration file %s</string>
     <string name="config_exists_error">Configuration for “%s” already exists</string>
     <string name="config_file_exists_error">Configuration file “%s” already exists</string>
@@ -97,6 +98,7 @@
     <string name="create_bin_dir_error">Cannot create local binary directory</string>
     <string name="create_downloads_file_error">Cannot create file in downloads directory</string>
     <string name="create_empty">Create from scratch</string>
+    <string name="create_from_clipboard">Import from clipboard</string>
     <string name="create_from_file">Import from file or archive</string>
     <string name="create_from_qr_code">Scan from QR code</string>
     <string name="create_output_dir_error">Cannot create output directory</string>
-- 
2.34.1

