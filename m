Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31697C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 17 Jun 2022 11:43:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id bf251c84;
	Fri, 17 Jun 2022 11:39:58 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 77e15605
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Jun 2022 16:07:41 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id c2so19736399lfk.0
 for <wireguard@lists.zx2c4.com>; Wed, 15 Jun 2022 09:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tNfxMq9UgtuKtldX4mV/7xZWjbqV/s9Dqb++EMjK95g=;
 b=ftjlZYy+O2hW06ZbRMAZEd7BrMFAyl6ajo7gyTA28UqxGqMfCl7Qiyly939z4PU++i
 PCvW2gxifjxrFRDYruGVeBX8D3lrTdiDoZNAHPl4GQnITIlRbS28zjTZX18wr2YMg3+L
 HI3NZWA3pLA6NkrncEZeXHsSI86JvL1ALc7urqGg1hWFxvacPgb4qIVjX6PNAvPnwBGL
 cvxIf9NoGXhFOZpMFKWbsb3bb2d4jUhUY+g8V53EVf+iqrrNV0e0Yd0WMCKDnvwkYKUh
 W7YlplVC6fEkPZ1ZJYqM8APhAPFZUF1PQYNmY3VnKjfxtTcwVnVuUdheNsNXqP48liGC
 13gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tNfxMq9UgtuKtldX4mV/7xZWjbqV/s9Dqb++EMjK95g=;
 b=ApOMafOfdwOtIk5yERS3c40785Dnu/dGOAKrq2xcXkeji2wZckcxjKz6DeapL19rIt
 2bavr7dTZjqpoDRt7G/Qd05rD/+bICazVGQMp5fdU5zZAvfwreoyqcKtz7tMDzwoPyQ5
 ju1u+qNxqk4k2IYWOi/rxnSxrhwxio52uLYX9tg7h3xTOGOw6wihb/sH9ZOnuRVytm0z
 uCFD0jk6rwQxMtb/52ZJ3lz4eyIBmAwz3TqTzRykid9QO4047UPWkoccvI+lfRgRAEOp
 VS0VpMpzdyWhKlLFeY9F0hnc+Q0mK5uS5fcit1UIqU5k7L52C0KnlTaTlIBICyfLXkci
 ZcYg==
X-Gm-Message-State: AJIora/I4Z8Lik0Q0Iitw0sZcW8Shbzt7exk00PbizkXLPDFsjhxJakO
 IEh2hgErf5rVEdj/bUKKCspLazLphiX1rAlE
X-Google-Smtp-Source: AGRyM1uDEZYyDOXA86OiCPVAQwrXrE5EFR+/0mzDJZjjr2XT4YPT2migW9kIyUkgT5dZn8RG2p2pgA==
X-Received: by 2002:a05:6512:280b:b0:47b:531:8299 with SMTP id
 cf11-20020a056512280b00b0047b05318299mr141270lfb.296.1655309260103; 
 Wed, 15 Jun 2022 09:07:40 -0700 (PDT)
Received: from localhost.localdomain ([217.72.11.142])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a194953000000b0047b0f2d7650sm1843632lfj.271.2022.06.15.09.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 09:07:39 -0700 (PDT)
From: Stepan Rabotkin <epicstyt@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Stepan Rabotkin <epicstyt@gmail.com>
Subject: [PATCH] feat: add search to app list
Date: Wed, 15 Jun 2022 19:07:05 +0300
Message-Id: <20220615160705.898-1-epicstyt@gmail.com>
X-Mailer: git-send-email 2.32.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 17 Jun 2022 11:39:46 +0000
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
 .../android/fragment/AppListDialogFragment.kt | 39 +++++++++++++------
 .../res/layout/app_list_dialog_fragment.xml   | 15 +++++++
 ui/src/main/res/values/strings.xml            |  1 +
 3 files changed, 44 insertions(+), 11 deletions(-)

diff --git a/ui/src/main/java/com/wireguard/android/fragment/AppListDialogFragment.kt b/ui/src/main/java/com/wireguard/android/fragment/AppListDialogFragment.kt
index 1a40a1c..e9b4cf6 100644
--- a/ui/src/main/java/com/wireguard/android/fragment/AppListDialogFragment.kt
+++ b/ui/src/main/java/com/wireguard/android/fragment/AppListDialogFragment.kt
@@ -11,6 +11,7 @@ import android.widget.Button
 import android.widget.Toast
 import androidx.appcompat.app.AlertDialog
 import androidx.core.os.bundleOf
+import androidx.core.widget.doAfterTextChanged
 import androidx.databinding.Observable
 import androidx.fragment.app.DialogFragment
 import androidx.fragment.app.setFragmentResult
@@ -28,7 +29,8 @@ import kotlinx.coroutines.launch
 import kotlinx.coroutines.withContext
 
 class AppListDialogFragment : DialogFragment() {
-    private val appData = ObservableKeyedArrayList<String, ApplicationData>()
+    private val appList: MutableList<ApplicationData> = ArrayList()
+    private val appListFiltered = ObservableKeyedArrayList<String, ApplicationData>()
     private var currentlySelectedApps = emptyList<String>()
     private var initiallyExcluded = false
     private var button: Button? = null
@@ -39,14 +41,13 @@ class AppListDialogFragment : DialogFragment() {
         val pm = activity.packageManager
         lifecycleScope.launch(Dispatchers.Default) {
             try {
-                val applicationData: MutableList<ApplicationData> = ArrayList()
                 withContext(Dispatchers.IO) {
                     val packageInfos = pm.getPackagesHoldingPermissions(arrayOf(Manifest.permission.INTERNET), 0)
                     packageInfos.forEach {
                         val packageName = it.packageName
                         val appInfo = it.applicationInfo
                         val appData = ApplicationData(appInfo.loadIcon(pm), appInfo.loadLabel(pm).toString(), packageName, currentlySelectedApps.contains(packageName))
-                        applicationData.add(appData)
+                        appList.add(appData)
                         appData.addOnPropertyChangedCallback(object : Observable.OnPropertyChangedCallback() {
                             override fun onPropertyChanged(sender: Observable?, propertyId: Int) {
                                 if (propertyId == BR.selected)
@@ -55,10 +56,10 @@ class AppListDialogFragment : DialogFragment() {
                         })
                     }
                 }
-                applicationData.sortWith(compareBy(String.CASE_INSENSITIVE_ORDER) { it.name })
+                appList.sortWith(compareBy(String.CASE_INSENSITIVE_ORDER) { it.name })
                 withContext(Dispatchers.Main.immediate) {
-                    appData.clear()
-                    appData.addAll(applicationData)
+                    appListFiltered.clear()
+                    appListFiltered.addAll(appList)
                 }
             } catch (e: Throwable) {
                 withContext(Dispatchers.Main.immediate) {
@@ -78,7 +79,7 @@ class AppListDialogFragment : DialogFragment() {
     }
 
     private fun setButtonText() {
-        val numSelected = appData.count { it.isSelected }
+        val numSelected = appList.count { it.isSelected }
         button?.text = if (numSelected == 0)
             getString(R.string.use_all_applications)
         else when (tabs?.selectedTabPosition) {
@@ -106,15 +107,19 @@ class AppListDialogFragment : DialogFragment() {
         alertDialogBuilder.setNegativeButton(R.string.cancel) { dialog, _ -> dialog.dismiss() }
         alertDialogBuilder.setNeutralButton(R.string.toggle_all) { _, _ -> }
         binding.fragment = this
-        binding.appData = appData
+        binding.appData = appListFiltered
         loadData()
+        binding.appSearchText.doAfterTextChanged {
+            appListFiltered.clear()
+            appListFiltered.addAll(filter(it.toString()))
+        }
         val dialog = alertDialogBuilder.create()
         dialog.setOnShowListener {
             button = dialog.getButton(AlertDialog.BUTTON_POSITIVE)
             setButtonText()
             dialog.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener { _ ->
-                val selectAll = appData.none { it.isSelected }
-                appData.forEach {
+                val selectAll = appList.none { it.isSelected }
+                appList.forEach {
                     it.isSelected = selectAll
                 }
             }
@@ -122,9 +127,21 @@ class AppListDialogFragment : DialogFragment() {
         return dialog
     }
 
+    private fun filter(s: String): MutableList<ApplicationData> {
+        val resultData: MutableList<ApplicationData> = ArrayList()
+
+        for (app in appList) {
+            if (app.name.lowercase().contains(s)) {
+                resultData.add(app)
+            }
+        }
+
+        return resultData
+    }
+
     private fun setSelectionAndDismiss() {
         val selectedApps: MutableList<String> = ArrayList()
-        for (data in appData) {
+        for (data in appList) {
             if (data.isSelected) {
                 selectedApps.add(data.packageName)
             }
diff --git a/ui/src/main/res/layout/app_list_dialog_fragment.xml b/ui/src/main/res/layout/app_list_dialog_fragment.xml
index 4503de1..572996d 100644
--- a/ui/src/main/res/layout/app_list_dialog_fragment.xml
+++ b/ui/src/main/res/layout/app_list_dialog_fragment.xml
@@ -40,6 +40,21 @@
                 android:text="@string/include_in_tunnel" />
         </com.google.android.material.tabs.TabLayout>
 
+        <com.google.android.material.textfield.TextInputLayout
+            android:id="@+id/app_search_layout"
+            android:layout_width="match_parent"
+            android:layout_height="wrap_content"
+            android:padding="10dp">
+
+            <com.google.android.material.textfield.TextInputEditText
+                android:id="@+id/app_search_text"
+                android:layout_width="match_parent"
+                android:layout_height="wrap_content"
+                android:hint="@string/search"
+                android:imeOptions="actionDone" />
+
+        </com.google.android.material.textfield.TextInputLayout>
+
         <FrameLayout
             android:layout_width="match_parent"
             android:layout_height="match_parent"
diff --git a/ui/src/main/res/values/strings.xml b/ui/src/main/res/values/strings.xml
index 6c09019..80967ad 100644
--- a/ui/src/main/res/values/strings.xml
+++ b/ui/src/main/res/values/strings.xml
@@ -237,4 +237,5 @@
     <string name="biometric_prompt_private_key_title">Authenticate to view private key</string>
     <string name="biometric_auth_error">Authentication failure</string>
     <string name="biometric_auth_error_reason">Authentication failure: %s</string>
+    <string name="search">Search</string>
 </resources>
-- 
2.32.0.windows.2

