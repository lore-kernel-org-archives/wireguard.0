Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E30CCD4F21
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 May 2026 18:49:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0b440b14;
	Wed, 13 May 2026 18:49:22 +0000 (UTC)
Received: from earth.rso.bg (earth.rso.bg [46.4.68.198])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id c473f6c1
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 May 2026 16:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pavel.sh;
 s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:To:
 From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ip859mSnw5qcUi7SBGmPhD7MSnxCEcqTVPV5G+Gqxx8=; b=Xr1x46J9U6WilC2xcr6VjTeHro
 veBWwlPBN5piDJ62QVihD8dsv4EjMLlir8cYfgztRexz0OkRLM6U/leQ0s6qCZo45SfI7hWgR7IQI
 ZVJKPbik19+Ph68sTzlHD7iJ93WyTyBiLrIJZ7oBTK/KgN+oHxkcHk9y1t00DGxNAJQAKhh+VvEbH
 k89x9rJ3dYSBVjb20zuBcWGmslsdlQk9myUztuHX7bbNaFMwnLURxpDAeT0alK5VvuEz6nS/ps5Zg
 yPVXwctHGwa5NBL/hL67o3xaNiduEFVwN+9ZZssb4ifBEzMjiNLawp/p241m1wmVURmrKziS2H9xs
 jsSVW52Q==;
Received: from [127.0.0.1] (port=39498 helo=earth.rso.bg)
 by earth.rso.bg with esmtpa (Exim 4.96.2)
 (envelope-from <me@pavel.sh>) id 1wNCVf-0030vl-0N
 for wireguard@lists.zx2c4.com; Wed, 13 May 2026 19:32:35 +0300
MIME-Version: 1.0
Date: Wed, 13 May 2026 19:32:35 +0300
From: me@pavel.sh
To: wireguard@lists.zx2c4.com
Subject: [PATCH] feat: add Import from Clipboard and Paste/Type config options
User-Agent: Roundcube Webmail/1.6.9
Message-ID: <fea610b6dbf24abfc0d5c5fbf1799120@pavel.sh>
X-Sender: me@pavel.sh
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - earth.rso.bg
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - pavel.sh
X-Get-Message-Sender-Via: earth.rso.bg: authenticated_id: me@pavel.sh
X-Authenticated-Sender: earth.rso.bg: me@pavel.sh
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Approved-At: Wed, 13 May 2026 18:49:18 +0000
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

Changes:
- AddTunnelsSheet: two new buttons + REQUEST_CLIPBOARD / REQUEST_TEXT
- TunnelListFragment: handles both new request methods; showSnackbar
  promoted to internal so PasteConfigDialogFragment can call it
- PasteConfigDialogFragment: new dialog fragment with auto-fill and
  inline validation
- dialog_paste_config.xml: monospace multi-line TextInputEditText
- add_tunnels_bottom_sheet.xml: two new Material buttons wired up
- strings.xml: all new user-visible strings added
---
 .../android/fragment/AddTunnelsSheet.kt       |  18 ++++
 .../fragment/PasteConfigDialogFragment.kt     | 102 ++++++++++++++++++
 .../android/fragment/TunnelListFragment.kt    |  25 ++++-
 .../res/layout/add_tunnels_bottom_sheet.xml   |  60 +++++++++--
 .../main/res/layout/dialog_paste_config.xml   |  35 ++++++
 ui/src/main/res/values/strings.xml            |   8 ++
 6 files changed, 241 insertions(+), 7 deletions(-)
 create mode 100644 
ui/src/main/java/com/wireguard/android/fragment/PasteConfigDialogFragment.kt
 create mode 100644 ui/src/main/res/layout/dialog_paste_config.xml

diff --git 
a/ui/src/main/java/com/wireguard/android/fragment/AddTunnelsSheet.kt 
b/ui/src/main/java/com/wireguard/android/fragment/AddTunnelsSheet.kt
index 161709c3..c0e10afd 100644
--- a/ui/src/main/java/com/wireguard/android/fragment/AddTunnelsSheet.kt
+++ b/ui/src/main/java/com/wireguard/android/fragment/AddTunnelsSheet.kt
@@ -68,6 +68,14 @@ class AddTunnelsSheet : BottomSheetDialogFragment() {
                     dismiss()
                     onRequestScanQRCode()
                 }
+               
 dialog.findViewById<View>(R.id.create_from_clipboard)?.setOnClickListener 
{
+                    dismiss()
+                    onRequestImportFromClipboard()
+                }
+               
 dialog.findViewById<View>(R.id.create_from_text)?.setOnClickListener {
+                    dismiss()
+                    onRequestImportFromText()
+                }
             }
         })
         val gradientDrawable = GradientDrawable().apply {
@@ -93,11 +101,21 @@ class AddTunnelsSheet : BottomSheetDialogFragment() 
{
         setFragmentResult(REQUEST_KEY_NEW_TUNNEL, Bundle().apply { 
putString(REQUEST_METHOD, REQUEST_SCAN) })
     }
 
+    private fun onRequestImportFromClipboard() {
+        setFragmentResult(REQUEST_KEY_NEW_TUNNEL, Bundle().apply { 
putString(REQUEST_METHOD, REQUEST_CLIPBOARD) })
+    }
+
+    private fun onRequestImportFromText() {
+        setFragmentResult(REQUEST_KEY_NEW_TUNNEL, Bundle().apply { 
putString(REQUEST_METHOD, REQUEST_TEXT) })
+    }
+
     companion object {
         const val REQUEST_KEY_NEW_TUNNEL = "request_new_tunnel"
         const val REQUEST_METHOD = "request_method"
         const val REQUEST_CREATE = "request_create"
         const val REQUEST_IMPORT = "request_import"
         const val REQUEST_SCAN = "request_scan"
+        const val REQUEST_CLIPBOARD = "request_clipboard"
+        const val REQUEST_TEXT = "request_text"
     }
 }
diff --git 
a/ui/src/main/java/com/wireguard/android/fragment/PasteConfigDialogFragment.kt 
b/ui/src/main/java/com/wireguard/android/fragment/PasteConfigDialogFragment.kt
new file mode 100644
index 00000000..f6e86236
--- /dev/null
+++ 
b/ui/src/main/java/com/wireguard/android/fragment/PasteConfigDialogFragment.kt
@@ -0,0 +1,102 @@
+/*
+ * Copyright © 2017-2025 WireGuard LLC. All Rights Reserved.
+ * SPDX-License-Identifier: Apache-2.0
+ */
+package com.wireguard.android.fragment
+
+import android.app.Dialog
+import android.content.ClipboardManager
+import android.content.Context
+import android.os.Bundle
+import android.text.Editable
+import android.text.TextWatcher
+import android.view.LayoutInflater
+import android.widget.Button
+import androidx.appcompat.app.AlertDialog
+import androidx.fragment.app.DialogFragment
+import androidx.lifecycle.lifecycleScope
+import com.google.android.material.textfield.TextInputEditText
+import com.google.android.material.textfield.TextInputLayout
+import com.wireguard.android.R
+import com.wireguard.android.util.TunnelImporter
+import kotlinx.coroutines.launch
+
+/**
+ * Dialog that lets the user paste or manually type a WireGuard config 
INI block.
+ * Fields ([Interface] / [Peer] sections) are auto-detected from the 
input text.
+ * On "Import", the config is validated and handed to [TunnelImporter].
+ */
+class PasteConfigDialogFragment : DialogFragment() {
+
+    override fun onCreateDialog(savedInstanceState: Bundle?): Dialog {
+        val inflater = LayoutInflater.from(requireContext())
+        val view = inflater.inflate(R.layout.dialog_paste_config, null)
+
+        val textInputLayout = 
view.findViewById<TextInputLayout>(R.id.config_text_input_layout)
+        val editText = 
view.findViewById<TextInputEditText>(R.id.config_edit_text)
+
+        // Pre-fill from clipboard if it looks like a WireGuard config
+        val clipboard = 
requireContext().getSystemService(Context.CLIPBOARD_SERVICE) as 
ClipboardManager
+        val clipText = 
clipboard.primaryClip?.getItemAt(0)?.coerceToText(requireContext())?.toString()
+        if (!clipText.isNullOrBlank() && 
looksLikeWireGuardConfig(clipText)) {
+            editText.setText(clipText)
+        }
+
+        val dialog = AlertDialog.Builder(requireContext())
+            .setTitle(R.string.paste_config_dialog_title)
+            .setView(view)
+            .setPositiveButton(R.string.paste_config_import, null) // 
set below to prevent auto-dismiss on error
+            .setNegativeButton(android.R.string.cancel, null)
+            .create()
+
+        dialog.setOnShowListener {
+            val importButton: Button = 
dialog.getButton(AlertDialog.BUTTON_POSITIVE)
+
+            // Validate on every keystroke — highlight error inline
+            editText.addTextChangedListener(object : TextWatcher {
+                override fun beforeTextChanged(s: CharSequence?, start: 
Int, count: Int, after: Int) = Unit
+                override fun onTextChanged(s: CharSequence?, start: 
Int, before: Int, count: Int) = Unit
+                override fun afterTextChanged(s: Editable?) {
+                    textInputLayout.error = null
+                    importButton.isEnabled = !s.isNullOrBlank()
+                }
+            })
+            importButton.isEnabled = !editText.text.isNullOrBlank()
+
+            importButton.setOnClickListener {
+                val configText = 
editText.text?.toString().orEmpty().trim()
+                if (configText.isEmpty()) {
+                    textInputLayout.error = 
getString(R.string.paste_config_empty_error)
+                    return@setOnClickListener
+                }
+                lifecycleScope.launch {
+                    TunnelImporter.importTunnel(parentFragmentManager, 
configText) { message ->
+                        // Show result via the parent fragment's 
snackbar mechanism
+                        (parentFragment as? TunnelListFragment)?.let {
+                            it.showSnackbar(message)
+                        }
+                    }
+                }
+                dismiss()
+            }
+        }
+
+        return dialog
+    }
+
+    companion object {
+        /**
+         * Heuristic: a string contains at least one [Interface] or 
[Peer] section header
+         * and at least one key = value pair typical of WireGuard 
configs.
+         */
+        fun looksLikeWireGuardConfig(text: String): Boolean {
+            val hasSection = text.contains("[Interface]", ignoreCase = 
true) ||
+                text.contains("[Peer]", ignoreCase = true)
+            val hasKeyValue = text.contains("PrivateKey", ignoreCase = 
true) ||
+                text.contains("PublicKey", ignoreCase = true) ||
+                text.contains("Address", ignoreCase = true) ||
+                text.contains("Endpoint", ignoreCase = true)
+            return hasSection && hasKeyValue
+        }
+    }
+}
diff --git 
a/ui/src/main/java/com/wireguard/android/fragment/TunnelListFragment.kt 
b/ui/src/main/java/com/wireguard/android/fragment/TunnelListFragment.kt
index 119b6afe..6ade6279 100644
--- 
a/ui/src/main/java/com/wireguard/android/fragment/TunnelListFragment.kt
+++ 
b/ui/src/main/java/com/wireguard/android/fragment/TunnelListFragment.kt
@@ -4,6 +4,8 @@
  */
 package com.wireguard.android.fragment
 
+import android.content.ClipboardManager
+import android.content.Context
 import android.content.Intent
 import android.content.res.Resources
 import android.os.Bundle
@@ -122,6 +124,15 @@ class TunnelListFragment : BaseFragment() {
                                    
 .setPrompt(getString(R.string.qr_code_hint))
                             )
                         }
+
+                        AddTunnelsSheet.REQUEST_CLIPBOARD -> {
+                            onRequestImportFromClipboard()
+                        }
+
+                        AddTunnelsSheet.REQUEST_TEXT -> {
+                            PasteConfigDialogFragment()
+                                .show(childFragmentManager, 
"PASTE_CONFIG")
+                        }
                     }
                 }
                 bottomSheet.showNow(childFragmentManager, 
"BOTTOM_SHEET")
@@ -154,6 +165,18 @@ class TunnelListFragment : BaseFragment() {
         }
     }
 
+    private fun onRequestImportFromClipboard() {
+        val clipboard = 
requireContext().getSystemService(Context.CLIPBOARD_SERVICE) as 
ClipboardManager
+        val text = 
clipboard.primaryClip?.getItemAt(0)?.coerceToText(requireContext())?.toString()
+        if (text.isNullOrBlank()) {
+            showSnackbar(getString(R.string.clipboard_empty_error))
+            return
+        }
+        lifecycleScope.launch {
+            TunnelImporter.importTunnel(parentFragmentManager, text) { 
showSnackbar(it) }
+        }
+    }
+
     private fun onTunnelDeletionFinished(count: Int, throwable: 
Throwable?) {
         val message: String
         val ctx = activity ?: Application.get()
@@ -194,7 +217,7 @@ class TunnelListFragment : BaseFragment() {
         }
     }
 
-    private fun showSnackbar(message: CharSequence) {
+    internal fun showSnackbar(message: CharSequence) {
         val binding = binding
         if (binding != null)
             Snackbar.make(binding.mainContainer, message, 
Snackbar.LENGTH_LONG)
diff --git a/ui/src/main/res/layout/add_tunnels_bottom_sheet.xml 
b/ui/src/main/res/layout/add_tunnels_bottom_sheet.xml
index 0ad1ef23..c2224f83 100644
--- a/ui/src/main/res/layout/add_tunnels_bottom_sheet.xml
+++ b/ui/src/main/res/layout/add_tunnels_bottom_sheet.xml
@@ -42,22 +42,22 @@
         android:layout_marginEnd="@dimen/normal_margin"
         android:layout_marginRight="@dimen/normal_margin"
         android:nextFocusUp="@id/create_from_file"
-        android:nextFocusDown="@id/create_empty"
-        android:nextFocusForward="@id/create_empty"
+        android:nextFocusDown="@id/create_from_clipboard"
+        android:nextFocusForward="@id/create_from_clipboard"
         android:text="@string/create_from_qr_code"
         android:textAlignment="viewStart"
         android:textColor="?attr/colorOnSurface"
         app:icon="@drawable/ic_action_scan_qr_code"
         app:iconPadding="@dimen/bottom_sheet_icon_padding"
         app:iconTint="?attr/colorSecondary"
-        app:layout_constraintBottom_toBottomOf="@+id/create_empty"
+       
 app:layout_constraintBottom_toTopOf="@+id/create_from_clipboard"
         app:layout_constraintEnd_toEndOf="parent"
         app:layout_constraintStart_toStartOf="parent"
         app:layout_constraintTop_toBottomOf="@+id/create_from_file"
         app:rippleColor="?attr/colorSecondary" />
 
     <com.google.android.material.button.MaterialButton
-        android:id="@+id/create_empty"
+        android:id="@+id/create_from_clipboard"
         style="@style/Widget.Material3.Button.TextButton.Icon"
         android:layout_width="match_parent"
         android:layout_height="@dimen/bottom_sheet_item_height"
@@ -66,16 +66,64 @@
         android:layout_marginEnd="@dimen/normal_margin"
         android:layout_marginRight="@dimen/normal_margin"
         android:nextFocusUp="@id/create_from_qrcode"
-        android:text="@string/create_empty"
+        android:nextFocusDown="@id/create_from_text"
+        android:nextFocusForward="@id/create_from_text"
+        android:text="@string/create_from_clipboard"
+        android:textAlignment="viewStart"
+        android:textColor="?attr/colorOnSurface"
+        app:icon="@drawable/ic_action_copy"
+        app:iconPadding="@dimen/bottom_sheet_icon_padding"
+        app:iconTint="?attr/colorSecondary"
+        app:layout_constraintBottom_toTopOf="@+id/create_from_text"
+        app:layout_constraintEnd_toEndOf="parent"
+        app:layout_constraintStart_toStartOf="parent"
+        app:layout_constraintTop_toBottomOf="@+id/create_from_qrcode"
+        app:rippleColor="?attr/colorSecondary" />
+
+    <com.google.android.material.button.MaterialButton
+        android:id="@+id/create_from_text"
+        style="@style/Widget.Material3.Button.TextButton.Icon"
+        android:layout_width="match_parent"
+        android:layout_height="@dimen/bottom_sheet_item_height"
+        android:layout_marginStart="@dimen/normal_margin"
+        android:layout_marginLeft="@dimen/normal_margin"
+        android:layout_marginEnd="@dimen/normal_margin"
+        android:layout_marginRight="@dimen/normal_margin"
+        android:nextFocusUp="@id/create_from_clipboard"
+        android:nextFocusDown="@id/create_empty"
+        android:nextFocusForward="@id/create_empty"
+        android:text="@string/create_from_text"
         android:textAlignment="viewStart"
         android:textColor="?attr/colorOnSurface"
         app:icon="@drawable/ic_action_edit"
         app:iconPadding="@dimen/bottom_sheet_icon_padding"
         app:iconTint="?attr/colorSecondary"
+        app:layout_constraintBottom_toTopOf="@+id/create_empty"
+        app:layout_constraintEnd_toEndOf="parent"
+        app:layout_constraintStart_toStartOf="parent"
+       
 app:layout_constraintTop_toBottomOf="@+id/create_from_clipboard"
+        app:rippleColor="?attr/colorSecondary" />
+
+    <com.google.android.material.button.MaterialButton
+        android:id="@+id/create_empty"
+        style="@style/Widget.Material3.Button.TextButton.Icon"
+        android:layout_width="match_parent"
+        android:layout_height="@dimen/bottom_sheet_item_height"
+        android:layout_marginStart="@dimen/normal_margin"
+        android:layout_marginLeft="@dimen/normal_margin"
+        android:layout_marginEnd="@dimen/normal_margin"
+        android:layout_marginRight="@dimen/normal_margin"
+        android:nextFocusUp="@id/create_from_text"
+        android:text="@string/create_empty"
+        android:textAlignment="viewStart"
+        android:textColor="?attr/colorOnSurface"
+        app:icon="@drawable/ic_action_add"
+        app:iconPadding="@dimen/bottom_sheet_icon_padding"
+        app:iconTint="?attr/colorSecondary"
         app:layout_constraintBottom_toBottomOf="parent"
         app:layout_constraintEnd_toEndOf="parent"
         app:layout_constraintStart_toStartOf="parent"
-        app:layout_constraintTop_toBottomOf="@+id/create_from_qrcode"
+        app:layout_constraintTop_toBottomOf="@+id/create_from_text"
         app:rippleColor="?attr/colorSecondary" />
 
 </androidx.constraintlayout.widget.ConstraintLayout>
diff --git a/ui/src/main/res/layout/dialog_paste_config.xml 
b/ui/src/main/res/layout/dialog_paste_config.xml
new file mode 100644
index 00000000..75ae5133
--- /dev/null
+++ b/ui/src/main/res/layout/dialog_paste_config.xml
@@ -0,0 +1,35 @@
+<?xml version="1.0" encoding="utf-8"?><!--
+  ~ Copyright © 2017-2025 WireGuard LLC. All Rights Reserved.
+  ~ SPDX-License-Identifier: Apache-2.0
+  -->
+<LinearLayout 
xmlns:android="http://schemas.android.com/apk/res/android"
+    android:layout_width="match_parent"
+    android:layout_height="wrap_content"
+    android:orientation="vertical"
+    android:paddingStart="@dimen/normal_margin"
+    android:paddingEnd="@dimen/normal_margin"
+    android:paddingTop="8dp"
+    android:paddingBottom="8dp">
+
+    <com.google.android.material.textfield.TextInputLayout
+        android:id="@+id/config_text_input_layout"
+        style="@style/Widget.Material3.TextInputLayout.OutlinedBox"
+        android:layout_width="match_parent"
+        android:layout_height="wrap_content"
+        android:hint="@string/paste_config_hint">
+
+        <com.google.android.material.textfield.TextInputEditText
+            android:id="@+id/config_edit_text"
+            android:layout_width="match_parent"
+            android:layout_height="wrap_content"
+            android:fontFamily="monospace"
+            android:gravity="top|start"
+            android:inputType="textMultiLine|textNoSuggestions"
+            android:minLines="10"
+            android:maxLines="20"
+            android:scrollbars="vertical"
+            android:textSize="12sp" />
+
+    </com.google.android.material.textfield.TextInputLayout>
+
+</LinearLayout>
diff --git a/ui/src/main/res/values/strings.xml 
b/ui/src/main/res/values/strings.xml
index 32e797e6..6b07c79b 100644
--- a/ui/src/main/res/values/strings.xml
+++ b/ui/src/main/res/values/strings.xml
@@ -97,8 +97,16 @@
     <string name="create_bin_dir_error">Cannot create local binary 
directory</string>
     <string name="create_downloads_file_error">Cannot create file in 
downloads directory</string>
     <string name="create_empty">Create from scratch</string>
+    <string name="create_from_clipboard">Import from clipboard</string>
     <string name="create_from_file">Import from file or 
archive</string>
     <string name="create_from_qr_code">Scan from QR code</string>
+    <string name="create_from_text">Paste or type config</string>
+    <string name="paste_config_dialog_title">Import tunnel 
configuration</string>
+    <string name="paste_config_hint">Paste or type your WireGuard 
config here…</string>
+    <string name="paste_config_import">Import</string>
+    <string name="paste_config_empty_error">Configuration text cannot 
be empty</string>
+    <string name="clipboard_empty_error">Clipboard does not contain any 
text</string>
+    <string name="clipboard_import_success">Tunnel imported from 
clipboard</string>
     <string name="create_output_dir_error">Cannot create output 
directory</string>
     <string name="create_temp_dir_error">Cannot create local temporary 
directory</string>
     <string name="create_tunnel">Create Tunnel</string>
-- 
2.43.0


