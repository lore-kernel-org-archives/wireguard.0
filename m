Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5B7CA5FCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 08:16:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 8660423d;
	Mon, 5 Oct 2026 06:56:22 +0000 (UTC)
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 720e05e6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jun 2026 04:05:31 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=0GPurAgoscQL7fB+ONd5+MFsYGU2jzBSAuTe2tAay+1vJsdlBtYx2V0kb+K6Js1ZTfJgjIQFELXlITnrPjNwGyeiW+Nv3UjpEQX8OOe0cIYdp0rBH1P2Rt+xS09gCr3KNE1d1IWZKnQNYbeuZ4Sdmu4j4WIIliutXE3TZYoFykazv6IETkOnSS2tQ8ji0m74Pzti8A0KscTRX4/jVg1wvHIGKk2Jwd2UGobecF0HBiXd4xK8/wKZjajM7VXHiH7u24ZffUthJG7ANUYoW+3+aGeha+Z4y8MOEs7jo1sPEX8tgh36G7cIlYmVobPR56ADuqZxG0YQWpb2YCSeslwQlw==;
 s=purelymail2; d=msfjarvis.dev; v=1;
 bh=99v/8YZVKBm0hPI0Rb5uMgKrCb7rXman8+Cg+XV/p1U=;
 h=Received:Date:Subject:To:From; 
DKIM-Signature: a=rsa-sha256;
 b=f3NeQlLVTNJXvQkb3bwFd26QJqKLSGuQiIe3d6AC0fu9C4WndrQe5QZ8fdBOpcc+QOsNx+xpvHrT0wk7EItC8mxnzckOREpIIi7MoqX9nLSFOG8j0sT8iFWdfkULwfuU6vewguN5vWtI5eOlhR3NAVOvGlpdmWZIHBkcA+JpywPgrmKWygtEn9ipYw14tBHpV+Ge4h4pkDsd2pa83QrLYrSsJEx1v5CW/1D0+LK+Y6TJj9AIK4kiJ1dD3rwdTBPOGZrnbwOBWU8AIwfcBigSz1NmD17ixwaWettX6k90aM+050Q0QU+FmUynfDZM0d5tU8AsdHfuIrzBdICH6rJ/sQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=99v/8YZVKBm0hPI0Rb5uMgKrCb7rXman8+Cg+XV/p1U=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
Feedback-ID: 322:138:null:purelymail
X-Pm-Original-To: wireguard@lists.zx2c4.com
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1771676622; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 04:05:27 +0000 (UTC)
Message-ID: <41772cd9-8632-454f-b2a5-dae297398109@msfjarvis.dev>
Date: Mon, 29 Jun 2026 09:34:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH wireguard-android] ui: add import config from clipboard
To: Anton Kovalenko <anton@sw4me.com>, wireguard@lists.zx2c4.com
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>
References: <20260621074710.1106438-1-anton@sw4me.com>
Content-Language: en-US
From: Harsh Shandilya <me@msfjarvis.dev>
In-Reply-To: <20260621074710.1106438-1-anton@sw4me.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
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

On 21-06-2026 13:17, Anton Kovalenko wrote:
> Adds a fourth action to the add-tunnel bottom sheet that reads plain
> text from the system clipboard and routes it through the existing
> text-import path (validate, name, create) used for QR codes.
>=20
> Signed-off-by: Anton Kovalenko <anton@sw4me.com>
> ---
> The add-tunnel sheet currently offers file/archive, QR scan and
> create-from-scratch. This adds a clipboard option for the common case
> of getting a config as text over chat or email, routed through the
> existing QR-text import path so validation, naming and storage are
> unchanged.
>=20
> Built and tested on Samsung S24 Ultra, Android 16: a valid config
> imports and names correctly; empty or non-config clipboard shows the
> expected error snackbar.
>=20
> First patch I've sent to the list =E2=80=94 happy to adjust style or appr=
oach.
>=20
> Disclosure: this patch was written by Claude (Anthropic's AI), which I
> reviewed, built and tested.
>=20
>   .../android/fragment/AddTunnelsSheet.kt       |  9 +++++
>   .../android/fragment/TunnelListFragment.kt    | 15 ++++++++
>   .../wireguard/android/util/ClipboardUtils.kt  | 13 +++++++
>   ui/src/main/res/drawable/ic_action_paste.xml  | 14 ++++++++
>   .../res/layout/add_tunnels_bottom_sheet.xml   | 34 ++++++++++++++++---
>   ui/src/main/res/values/strings.xml            |  2 ++
>   6 files changed, 82 insertions(+), 5 deletions(-)
>   create mode 100644 ui/src/main/res/drawable/ic_action_paste.xml
>=20
> diff --git a/ui/src/main/java/com/wireguard/android/fragment/AddTunnelsSh=
eet.kt b/ui/src/main/java/com/wireguard/android/fragment/AddTunnelsSheet.kt
> index 161709c3..d5f01b40 100644
> --- a/ui/src/main/java/com/wireguard/android/fragment/AddTunnelsSheet.kt
> +++ b/ui/src/main/java/com/wireguard/android/fragment/AddTunnelsSheet.kt
> @@ -64,6 +64,10 @@ class AddTunnelsSheet : BottomSheetDialogFragment() {
>                       dismiss()
>                       onRequestImportConfig()
>                   }
> +                dialog.findViewById<View>(R.id.create_from_clipboard)?.s=
etOnClickListener {
> +                    dismiss()
> +                    onRequestImportFromClipboard()
> +                }
>                   dialog.findViewById<View>(R.id.create_from_qrcode)?.set=
OnClickListener {
>                       dismiss()
>                       onRequestScanQRCode()
> @@ -89,6 +93,10 @@ class AddTunnelsSheet : BottomSheetDialogFragment() {
>           setFragmentResult(REQUEST_KEY_NEW_TUNNEL, Bundle().apply { putS=
tring(REQUEST_METHOD, REQUEST_IMPORT) })
>       }
>  =20
> +    private fun onRequestImportFromClipboard() {
> +        setFragmentResult(REQUEST_KEY_NEW_TUNNEL, Bundle().apply { putSt=
ring(REQUEST_METHOD, REQUEST_CLIPBOARD) })
> +    }
> +
>       private fun onRequestScanQRCode() {
>           setFragmentResult(REQUEST_KEY_NEW_TUNNEL, Bundle().apply { putS=
tring(REQUEST_METHOD, REQUEST_SCAN) })
>       }
> @@ -98,6 +106,7 @@ class AddTunnelsSheet : BottomSheetDialogFragment() {
>           const val REQUEST_METHOD =3D "request_method"
>           const val REQUEST_CREATE =3D "request_create"
>           const val REQUEST_IMPORT =3D "request_import"
> +        const val REQUEST_CLIPBOARD =3D "request_clipboard"
>           const val REQUEST_SCAN =3D "request_scan"
>       }
>   }
> diff --git a/ui/src/main/java/com/wireguard/android/fragment/TunnelListFr=
agment.kt b/ui/src/main/java/com/wireguard/android/fragment/TunnelListFragm=
ent.kt
> index 119b6afe..8bde6794 100644
> --- a/ui/src/main/java/com/wireguard/android/fragment/TunnelListFragment.=
kt
> +++ b/ui/src/main/java/com/wireguard/android/fragment/TunnelListFragment.=
kt
> @@ -34,6 +34,7 @@ import com.wireguard.android.databinding.TunnelListFrag=
mentBinding
>   import com.wireguard.android.databinding.TunnelListItemBinding
>   import com.wireguard.android.model.ObservableTunnel
>   import com.wireguard.android.updater.SnackbarUpdateShower
> +import com.wireguard.android.util.ClipboardUtils
>   import com.wireguard.android.util.ErrorMessages
>   import com.wireguard.android.util.QrCodeFromFileScanner
>   import com.wireguard.android.util.TunnelImporter
> @@ -83,6 +84,16 @@ class TunnelListFragment : BaseFragment() {
>  =20
>       private val snackbarUpdateShower =3D SnackbarUpdateShower(this)
>  =20
> +    private fun importFromClipboard() {
> +        val context =3D context ?: return
> +        val text =3D ClipboardUtils.readPlainText(context)
> +        if (text.isNullOrBlank()) {
> +            showSnackbar(getString(R.string.clipboard_no_text))
> +            return
> +        }
> +        TunnelImporter.importTunnel(parentFragmentManager, text.toString=
()) { showSnackbar(it) }
> +    }
> +
>       override fun onViewCreated(view: View, savedInstanceState: Bundle?)=
 {
>           super.onViewCreated(view, savedInstanceState)
>           if (savedInstanceState !=3D null) {
> @@ -114,6 +125,10 @@ class TunnelListFragment : BaseFragment() {
>                               tunnelFileImportResultLauncher.launch("*/*"=
)
>                           }
>  =20
> +                        AddTunnelsSheet.REQUEST_CLIPBOARD -> {
> +                            importFromClipboard()
> +                        }
> +
>                           AddTunnelsSheet.REQUEST_SCAN -> {
>                               qrImportResultLauncher.launch(
>                                   ScanOptions()
> diff --git a/ui/src/main/java/com/wireguard/android/util/ClipboardUtils.k=
t b/ui/src/main/java/com/wireguard/android/util/ClipboardUtils.kt
> index 8968979f..76eb2b9a 100644
> --- a/ui/src/main/java/com/wireguard/android/util/ClipboardUtils.kt
> +++ b/ui/src/main/java/com/wireguard/android/util/ClipboardUtils.kt
> @@ -6,6 +6,7 @@ package com.wireguard.android.util
>  =20
>   import android.content.ClipData
>   import android.content.ClipboardManager
> +import android.content.Context
>   import android.os.Build
>   import android.view.View
>   import android.widget.TextView
> @@ -18,6 +19,18 @@ import com.wireguard.android.R
>    * Standalone utilities for interacting with the system clipboard.
>    */
>   object ClipboardUtils {
> +    /**
> +     * Returns the plain-text contents of the primary clip, or null if t=
he
> +     * clipboard is unavailable, empty, or holds no coercible text.
> +     */
> +    @JvmStatic
> +    fun readPlainText(context: Context): CharSequence? {
> +        val service =3D context.getSystemService<ClipboardManager>() ?: =
return null
> +        val clip =3D service.primaryClip ?: return null
> +        if (clip.itemCount =3D=3D 0) return null
> +        return clip.getItemAt(0).coerceToText(context)
> +    }
> +
>       @JvmStatic
>       fun copyTextView(view: View) {
>           val data =3D when (view) {
> diff --git a/ui/src/main/res/drawable/ic_action_paste.xml b/ui/src/main/r=
es/drawable/ic_action_paste.xml
> new file mode 100644
> index 00000000..1841b21e
> --- /dev/null
> +++ b/ui/src/main/res/drawable/ic_action_paste.xml
> @@ -0,0 +1,14 @@
> +<?xml version=3D"1.0" encoding=3D"utf-8"?><!--
> +  ~ Copyright =C2=A9 2017-2025 WireGuard LLC. All Rights Reserved.
> +  ~ SPDX-License-Identifier: Apache-2.0
> +  -->
> +<vector xmlns:android=3D"http://schemas.android.com/apk/res/android"
> +    android:width=3D"24dp"
> +    android:height=3D"24dp"
> +    android:tint=3D"?attr/colorControlNormal"
> +    android:viewportWidth=3D"24"
> +    android:viewportHeight=3D"24">
> +    <path
> +        android:fillColor=3D"#FFFFFFFF"
> +        android:pathData=3D"M19,2h-4.18C14.4,0.84 13.3,0 12,0S9.6,0.84 9=
.18,2H5C3.9,2 3,2.9 3,4v16c0,1.1 0.9,2 2,2h14c1.1,0 2,-0.9 2,-2L21,4c0,-1.1=
 -0.9,-2 -2,-2zM12,2c0.55,0 1,0.45 1,1s-0.45,1 -1,1 -1,-0.45 -1,-1 0.45,-1 =
1,-1zM19,20L5,20L5,4h2v3h10L17,4h2v16z" />
> +</vector>
> diff --git a/ui/src/main/res/layout/add_tunnels_bottom_sheet.xml b/ui/src=
/main/res/layout/add_tunnels_bottom_sheet.xml
> index 0ad1ef23..310a2d75 100644
> --- a/ui/src/main/res/layout/add_tunnels_bottom_sheet.xml
> +++ b/ui/src/main/res/layout/add_tunnels_bottom_sheet.xml
> @@ -18,22 +18,22 @@
>           android:layout_marginLeft=3D"@dimen/normal_margin"
>           android:layout_marginEnd=3D"@dimen/normal_margin"
>           android:layout_marginRight=3D"@dimen/normal_margin"
> -        android:nextFocusDown=3D"@id/create_from_qrcode"
> -        android:nextFocusForward=3D"@id/create_from_qrcode"
> +        android:nextFocusDown=3D"@id/create_from_clipboard"
> +        android:nextFocusForward=3D"@id/create_from_clipboard"
>           android:text=3D"@string/create_from_file"
>           android:textAlignment=3D"viewStart"
>           android:textColor=3D"?attr/colorOnSurface"
>           app:icon=3D"@drawable/ic_action_open"
>           app:iconPadding=3D"@dimen/bottom_sheet_icon_padding"
>           app:iconTint=3D"?attr/colorSecondary"
> -        app:layout_constraintBottom_toTopOf=3D"@+id/create_from_qrcode"
> +        app:layout_constraintBottom_toTopOf=3D"@+id/create_from_clipboar=
d"
>           app:layout_constraintEnd_toEndOf=3D"parent"
>           app:layout_constraintStart_toStartOf=3D"parent"
>           app:layout_constraintTop_toBottomOf=3D"parent"
>           app:rippleColor=3D"?attr/colorSecondary" />
>  =20
>       <com.google.android.material.button.MaterialButton
> -        android:id=3D"@+id/create_from_qrcode"
> +        android:id=3D"@+id/create_from_clipboard"
>           style=3D"@style/Widget.Material3.Button.TextButton.Icon"
>           android:layout_width=3D"match_parent"
>           android:layout_height=3D"@dimen/bottom_sheet_item_height"
> @@ -42,6 +42,30 @@
>           android:layout_marginEnd=3D"@dimen/normal_margin"
>           android:layout_marginRight=3D"@dimen/normal_margin"
>           android:nextFocusUp=3D"@id/create_from_file"
> +        android:nextFocusDown=3D"@id/create_from_qrcode"
> +        android:nextFocusForward=3D"@id/create_from_qrcode"
> +        android:text=3D"@string/create_from_clipboard"
> +        android:textAlignment=3D"viewStart"
> +        android:textColor=3D"?attr/colorOnSurface"
> +        app:icon=3D"@drawable/ic_action_paste"
> +        app:iconPadding=3D"@dimen/bottom_sheet_icon_padding"
> +        app:iconTint=3D"?attr/colorSecondary"
> +        app:layout_constraintBottom_toTopOf=3D"@+id/create_from_qrcode"
> +        app:layout_constraintEnd_toEndOf=3D"parent"
> +        app:layout_constraintStart_toStartOf=3D"parent"
> +        app:layout_constraintTop_toBottomOf=3D"@+id/create_from_file"
> +        app:rippleColor=3D"?attr/colorSecondary" />
> +
> +    <com.google.android.material.button.MaterialButton
> +        android:id=3D"@+id/create_from_qrcode"
> +        style=3D"@style/Widget.Material3.Button.TextButton.Icon"
> +        android:layout_width=3D"match_parent"
> +        android:layout_height=3D"@dimen/bottom_sheet_item_height"
> +        android:layout_marginStart=3D"@dimen/normal_margin"
> +        android:layout_marginLeft=3D"@dimen/normal_margin"
> +        android:layout_marginEnd=3D"@dimen/normal_margin"
> +        android:layout_marginRight=3D"@dimen/normal_margin"
> +        android:nextFocusUp=3D"@id/create_from_clipboard"
>           android:nextFocusDown=3D"@id/create_empty"
>           android:nextFocusForward=3D"@id/create_empty"
>           android:text=3D"@string/create_from_qr_code"
> @@ -53,7 +77,7 @@
>           app:layout_constraintBottom_toBottomOf=3D"@+id/create_empty"
>           app:layout_constraintEnd_toEndOf=3D"parent"
>           app:layout_constraintStart_toStartOf=3D"parent"
> -        app:layout_constraintTop_toBottomOf=3D"@+id/create_from_file"
> +        app:layout_constraintTop_toBottomOf=3D"@+id/create_from_clipboar=
d"
>           app:rippleColor=3D"?attr/colorSecondary" />
>  =20
>       <com.google.android.material.button.MaterialButton
> diff --git a/ui/src/main/res/values/strings.xml b/ui/src/main/res/values/=
strings.xml
> index 32e797e6..757c78c9 100644
> --- a/ui/src/main/res/values/strings.xml
> +++ b/ui/src/main/res/values/strings.xml
> @@ -86,6 +86,7 @@
>       <string name=3D"error_no_qr_found">QR code not found in image</stri=
ng>
>       <string name=3D"error_qr_checksum">QR code checksum verification fa=
iled</string>
>       <string name=3D"cancel">Cancel</string>
> +    <string name=3D"clipboard_no_text">No text on the clipboard</string>
>       <string name=3D"config_delete_error">Cannot delete configuration fi=
le %s</string>
>       <string name=3D"config_exists_error">Configuration for =E2=80=9C%s=
=E2=80=9D already exists</string>
>       <string name=3D"config_file_exists_error">Configuration file =E2=80=
=9C%s=E2=80=9D already exists</string>
> @@ -97,6 +98,7 @@
>       <string name=3D"create_bin_dir_error">Cannot create local binary di=
rectory</string>
>       <string name=3D"create_downloads_file_error">Cannot create file in =
downloads directory</string>
>       <string name=3D"create_empty">Create from scratch</string>
> +    <string name=3D"create_from_clipboard">Import from clipboard</string=
>
>       <string name=3D"create_from_file">Import from file or archive</stri=
ng>
>       <string name=3D"create_from_qr_code">Scan from QR code</string>
>       <string name=3D"create_output_dir_error">Cannot create output direc=
tory</string>

The code looks fine at a cursory glance but I'm not sure about the=20
WireGuard project's current policy around LLM-generated code. I'll defer=20
to Jason to make a call on that before I pull the patch down for testing=20
and a proper review.

--
Harsh Shandilya
