Return-Path: <SRS0=0UwN=4E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9246BC2BA83
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Feb 2020 15:55:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33A3C20729
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Feb 2020 15:55:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fP+v6gHJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33A3C20729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff39bc0e;
	Sun, 16 Feb 2020 15:52:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43133d07
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2020 15:52:01 +0000 (UTC)
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae4e9325
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2020 15:52:01 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id m13so17531258edb.6
 for <wireguard@lists.zx2c4.com>; Sun, 16 Feb 2020 07:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=eg4HvmfWY0VoOWdtwbWc0Gbh3fDgGwCgI6LnvF7zUDs=;
 b=fP+v6gHJ58RqMdoeIGta0hUk74/GdyXXNRy8fz8ZCxI8ofUV9p1rfx31wek8bSmuZo
 Yga+uwDYrE/5aRi7MohLUbU4BrC1wamRjAksj1O9diEuvKcsRs5U9DlmqiX0o67zVB36
 CK84G9ZtFca7Rr+KLhw+KZOKbDVHhFXsHaxEht/vj28/LiXxf0NT+4y1w+M5nzDqruRy
 fxxvupY0owh1+hFpYU+EqV78I5TZpzAXJypCB1TrKEdZYwz/3dH37qJIW7le1A1ul/1z
 u4cCUrahs9fJLwHOiaScb+mkJIOcsk8JG7XtL7Dle8WPXi4yPs7CdOdb8UxrDFQONEKM
 63oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=eg4HvmfWY0VoOWdtwbWc0Gbh3fDgGwCgI6LnvF7zUDs=;
 b=feRUDtFPtGdvtU8xJ4V8TugiB7mFv5kZVvn1vJk8IuU+0aoIDL4jz5fNVSfZkfctgb
 v5a+PochE2u398Pb2a9DZ2mw6OEwlxFgH2Kx/TmkthPDpEzYir3EcpdknZzS/qy5pUru
 6eGoz+eukceg+V07jDkq7ITEmkt6YJ12EoydZNXwz84pR6l4xdKAwH5XLkyWEG0Z6qaW
 4HVamkFLthgmMRucn0G6pTLSRSjF0K65guLEXPohE0G6sJ1JTTFZPpsHmXuVf5wcdf8V
 H+1l6tH68vB8CUeDYmdusjk6sX3EP88K295e8WjHKruhuoaGj/Zfrn52BFK7Aq/n4AqT
 uNDA==
X-Gm-Message-State: APjAAAWHHteYKgm8x+Hxym3SMfFwBmPHhpLYTn1FZe6sp5mDRVFvKSlk
 ZhNC86D/Rey4jUVrcAfMGbYUIPsXuwQd2oeMEYmmOa+qfRU=
X-Google-Smtp-Source: APXvYqy1/zGlywEwh/j4D0tmxnl0cih0/WLslLT1ue+ML+eSD+cgBiZU7MA8/5Aoz234n1qEEHXDzeMma6wiTDNmsbw=
X-Received: by 2002:a17:906:b819:: with SMTP id
 dv25mr11707529ejb.211.1581868463018; 
 Sun, 16 Feb 2020 07:54:23 -0800 (PST)
MIME-Version: 1.0
References: <20200209173058.11647-1-sebcbi1@gmail.com>
 <CAHmME9qAnHWuS9Xk6Tka5PBF2uqjDxEZaPhScWziWd9j9oPS5g@mail.gmail.com>
In-Reply-To: <CAHmME9qAnHWuS9Xk6Tka5PBF2uqjDxEZaPhScWziWd9j9oPS5g@mail.gmail.com>
From: Sebastien LEBEAU <sebcbi1@gmail.com>
Date: Sun, 16 Feb 2020 17:54:12 +0200
Message-ID: <CAE+b=LQYkqiuF0bBFvsYGY7ta+J1hvyDhge2SsQ1A6DjfbKPcQ@mail.gmail.com>
Subject: Re: [PATCH] Change "Deselect All" to "Toggle All" in Excluded apps
 settings
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2543260012950115362=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2543260012950115362==
Content-Type: multipart/alternative; boundary="000000000000d1d78a059eb373eb"

--000000000000d1d78a059eb373eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: S=C3=A9bastien LEBEAU <sebcbi1@gmail.com>
---
 .../com/wireguard/android/fragment/AppListDialogFragment.java | 4 ++--
 app/src/main/res/values-it/strings.xml                        | 2 +-
 app/src/main/res/values-ru/strings.xml                        | 2 +-
 app/src/main/res/values/strings.xml                           | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git
a/app/src/main/java/com/wireguard/android/fragment/AppListDialogFragment.ja=
va
b/app/src/main/java/com/wireguard/android/fragment/AppListDialogFragment.ja=
va
index 67059c7..c513d47 100644
---
a/app/src/main/java/com/wireguard/android/fragment/AppListDialogFragment.ja=
va
+++
b/app/src/main/java/com/wireguard/android/fragment/AppListDialogFragment.ja=
va
@@ -98,7 +98,7 @@ public class AppListDialogFragment extends DialogFragment
{

         alertDialogBuilder.setPositiveButton(R.string.set_exclusions,
(dialog, which) -> setExclusionsAndDismiss());
         alertDialogBuilder.setNegativeButton(R.string.cancel, (dialog,
which) -> dialog.dismiss());
-        alertDialogBuilder.setNeutralButton(R.string.deselect_all,
(dialog, which) -> {
+        alertDialogBuilder.setNeutralButton(R.string.toggle_all, (dialog,
which) -> {
         });

         binding.setFragment(this);
@@ -109,7 +109,7 @@ public class AppListDialogFragment extends
DialogFragment {
         final AlertDialog dialog =3D alertDialogBuilder.create();
         dialog.setOnShowListener(d ->
dialog.getButton(DialogInterface.BUTTON_NEUTRAL).setOnClickListener(view ->
{
             for (final ApplicationData app : appData)
-                app.setExcludedFromTunnel(false);
+                app.setExcludedFromTunnel(!app.isExcludedFromTunnel());
         }));
         return dialog;
     }
diff --git a/app/src/main/res/values-it/strings.xml
b/app/src/main/res/values-it/strings.xml
index 2aba5f8..b37d792 100644
--- a/app/src/main/res/values-it/strings.xml
+++ b/app/src/main/res/values-it/strings.xml
@@ -66,7 +66,7 @@
     <string name=3D"dark_theme_summary_on">Stai usando il tema scuro
(notte)</string>
     <string name=3D"dark_theme_title">Usa tema scuro</string>
     <string name=3D"delete">Elimina</string>
-    <string name=3D"deselect_all">Deseleziona tutto</string>
+    <string name=3D"toggle_all">Inverti tutto</string>
     <string name=3D"dns_servers">Server DNS</string>
     <string name=3D"edit">Modifica</string>
     <string name=3D"endpoint">Endpoint</string>
diff --git a/app/src/main/res/values-ru/strings.xml
b/app/src/main/res/values-ru/strings.xml
index 2f2c03b..00b96fb 100644
--- a/app/src/main/res/values-ru/strings.xml
+++ b/app/src/main/res/values-ru/strings.xml
@@ -66,7 +66,7 @@
     <string name=3D"dark_theme_summary_on">=D0=92 =D0=B4=D0=B0=D0=BD=D0=BD=
=D1=8B=D0=B9 =D0=BC=D0=BE=D0=BC=D0=B5=D0=BD=D1=82 =D0=B8=D1=81=D0=BF=D0=BE=
=D0=BB=D1=8C=D0=B7=D1=83=D0=B5=D1=82=D1=81=D1=8F
=D1=82=D0=B5=D0=BC=D0=BD=D0=B0=D1=8F (=D0=BD=D0=BE=D1=87=D0=BD=D0=B0=D1=8F)=
 =D1=82=D0=B5=D0=BC=D0=B0</string>
     <string name=3D"dark_theme_title">=D0=98=D1=81=D0=BF=D0=BE=D0=BB=D1=8C=
=D0=B7=D0=BE=D0=B2=D0=B0=D1=82=D1=8C =D1=82=D0=B5=D0=BC=D0=BD=D1=83=D1=8E =
=D1=82=D0=B5=D0=BC=D1=83</string>
     <string name=3D"delete">=D0=A3=D0=B4=D0=B0=D0=BB=D0=B8=D1=82=D1=8C</st=
ring>
-    <string name=3D"deselect_all">=D0=A1=D0=BD=D1=8F=D1=82=D1=8C =D0=B2=D1=
=8B=D0=B4=D0=B5=D0=BB=D0=B5=D0=BD=D0=BD=D0=BE=D0=B5</string>
+    <string name=3D"toggle_all">=D0=98=D0=BD=D0=B2=D0=B5=D1=80=D1=82=D0=B8=
=D1=80=D0=BE=D0=B2=D0=B0=D1=82=D1=8C =D0=B2=D1=81=D0=B5</string>
     <string name=3D"dns_servers">DNS-=D1=81=D0=B5=D1=80=D0=B2=D0=B5=D1=80=
=D1=8B</string>
     <string name=3D"edit">=D0=A0=D0=B5=D0=B4=D0=B0=D0=BA=D1=82=D0=B8=D1=80=
=D0=BE=D0=B2=D0=B0=D1=82=D1=8C</string>
     <string name=3D"endpoint">=D0=9A=D0=BE=D0=BD=D0=B5=D1=87=D0=BD=D0=B0=
=D1=8F =D1=82=D0=BE=D1=87=D0=BA=D0=B0</string>
diff --git a/app/src/main/res/values/strings.xml
b/app/src/main/res/values/strings.xml
index 336cd4e..89a32c0 100644
--- a/app/src/main/res/values/strings.xml
+++ b/app/src/main/res/values/strings.xml
@@ -66,7 +66,7 @@
     <string name=3D"dark_theme_summary_on">Currently using dark (night)
theme</string>
     <string name=3D"dark_theme_title">Use dark theme</string>
     <string name=3D"delete">Delete</string>
-    <string name=3D"deselect_all">Deselect All</string>
+    <string name=3D"toggle_all">Toggle All</string>
     <string name=3D"dns_servers">DNS servers</string>
     <string name=3D"edit">Edit</string>
     <string name=3D"endpoint">Endpoint</string>
--=20
2.25.0

--000000000000d1d78a059eb373eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br>Signed-off-by: S=C3=A9bastien LEBEAU =
&lt;<a href=3D"mailto:sebcbi1@gmail.com">sebcbi1@gmail.com</a>&gt;<br>---<b=
r>=C2=A0.../com/wireguard/android/fragment/AppListDialogFragment.java | 4 +=
+--<br>=C2=A0app/src/main/res/values-it/strings.xml =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>=C2=
=A0app/src/main/res/values-ru/strings.xml =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>=C2=A0app/src=
/main/res/values/strings.xml =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>=C2=A04 files chang=
ed, 5 insertions(+), 5 deletions(-)<br><br>diff --git a/app/src/main/java/c=
om/wireguard/android/fragment/AppListDialogFragment.java b/app/src/main/jav=
a/com/wireguard/android/fragment/AppListDialogFragment.java<br>index 67059c=
7..c513d47 100644<br>--- a/app/src/main/java/com/wireguard/android/fragment=
/AppListDialogFragment.java<br>+++ b/app/src/main/java/com/wireguard/androi=
d/fragment/AppListDialogFragment.java<br>@@ -98,7 +98,7 @@ public class App=
ListDialogFragment extends DialogFragment {<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0alertDialogBuilder.setPositiveButton(R.string.set_exclusio=
ns, (dialog, which) -&gt; setExclusionsAndDismiss());<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0alertDialogBuilder.setNegativeButton(R.string.cancel, (dia=
log, which) -&gt; dialog.dismiss());<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0alertD=
ialogBuilder.setNeutralButton(R.string.deselect_all, (dialog, which) -&gt; =
{<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0alertDialogBuilder.setNeutralButton(R.str=
ing.toggle_all, (dialog, which) -&gt; {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0});<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0binding.setFragment(t=
his);<br>@@ -109,7 +109,7 @@ public class AppListDialogFragment extends Dia=
logFragment {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0final AlertDialog dialog=
 =3D alertDialogBuilder.create();<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dial=
og.setOnShowListener(d -&gt; dialog.getButton(DialogInterface.BUTTON_NEUTRA=
L).setOnClickListener(view -&gt; {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0for (final ApplicationData app : appData)<br>- =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0app.setExcludedFromTunnel(false);<=
br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0app.setExcluded=
FromTunnel(!app.isExcludedFromTunnel());<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0}));<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return dialog;<br>=C2=A0 =C2=
=A0 =C2=A0}<br>diff --git a/app/src/main/res/values-it/strings.xml b/app/sr=
c/main/res/values-it/strings.xml<br>index 2aba5f8..b37d792 100644<br>--- a/=
app/src/main/res/values-it/strings.xml<br>+++ b/app/src/main/res/values-it/=
strings.xml<br>@@ -66,7 +66,7 @@<br>=C2=A0 =C2=A0 =C2=A0&lt;string name=3D&=
quot;dark_theme_summary_on&quot;&gt;Stai usando il tema scuro (notte)&lt;/s=
tring&gt;<br>=C2=A0 =C2=A0 =C2=A0&lt;string name=3D&quot;dark_theme_title&q=
uot;&gt;Usa tema scuro&lt;/string&gt;<br>=C2=A0 =C2=A0 =C2=A0&lt;string nam=
e=3D&quot;delete&quot;&gt;Elimina&lt;/string&gt;<br>- =C2=A0 =C2=A0&lt;stri=
ng name=3D&quot;deselect_all&quot;&gt;Deseleziona tutto&lt;/string&gt;<br>+=
 =C2=A0 =C2=A0&lt;string name=3D&quot;toggle_all&quot;&gt;Inverti tutto&lt;=
/string&gt;<br>=C2=A0 =C2=A0 =C2=A0&lt;string name=3D&quot;dns_servers&quot=
;&gt;Server DNS&lt;/string&gt;<br>=C2=A0 =C2=A0 =C2=A0&lt;string name=3D&qu=
ot;edit&quot;&gt;Modifica&lt;/string&gt;<br>=C2=A0 =C2=A0 =C2=A0&lt;string =
name=3D&quot;endpoint&quot;&gt;Endpoint&lt;/string&gt;<br>diff --git a/app/=
src/main/res/values-ru/strings.xml b/app/src/main/res/values-ru/strings.xml=
<br>index 2f2c03b..00b96fb 100644<br>--- a/app/src/main/res/values-ru/strin=
gs.xml<br>+++ b/app/src/main/res/values-ru/strings.xml<br>@@ -66,7 +66,7 @@=
<br>=C2=A0 =C2=A0 =C2=A0&lt;string name=3D&quot;dark_theme_summary_on&quot;=
&gt;=D0=92 =D0=B4=D0=B0=D0=BD=D0=BD=D1=8B=D0=B9 =D0=BC=D0=BE=D0=BC=D0=B5=D0=
=BD=D1=82 =D0=B8=D1=81=D0=BF=D0=BE=D0=BB=D1=8C=D0=B7=D1=83=D0=B5=D1=82=D1=
=81=D1=8F =D1=82=D0=B5=D0=BC=D0=BD=D0=B0=D1=8F (=D0=BD=D0=BE=D1=87=D0=BD=D0=
=B0=D1=8F) =D1=82=D0=B5=D0=BC=D0=B0&lt;/string&gt;<br>=C2=A0 =C2=A0 =C2=A0&=
lt;string name=3D&quot;dark_theme_title&quot;&gt;=D0=98=D1=81=D0=BF=D0=BE=
=D0=BB=D1=8C=D0=B7=D0=BE=D0=B2=D0=B0=D1=82=D1=8C =D1=82=D0=B5=D0=BC=D0=BD=
=D1=83=D1=8E =D1=82=D0=B5=D0=BC=D1=83&lt;/string&gt;<br>=C2=A0 =C2=A0 =C2=
=A0&lt;string name=3D&quot;delete&quot;&gt;=D0=A3=D0=B4=D0=B0=D0=BB=D0=B8=
=D1=82=D1=8C&lt;/string&gt;<br>- =C2=A0 =C2=A0&lt;string name=3D&quot;desel=
ect_all&quot;&gt;=D0=A1=D0=BD=D1=8F=D1=82=D1=8C =D0=B2=D1=8B=D0=B4=D0=B5=D0=
=BB=D0=B5=D0=BD=D0=BD=D0=BE=D0=B5&lt;/string&gt;<br>+ =C2=A0 =C2=A0&lt;stri=
ng name=3D&quot;toggle_all&quot;&gt;=D0=98=D0=BD=D0=B2=D0=B5=D1=80=D1=82=D0=
=B8=D1=80=D0=BE=D0=B2=D0=B0=D1=82=D1=8C =D0=B2=D1=81=D0=B5&lt;/string&gt;<b=
r>=C2=A0 =C2=A0 =C2=A0&lt;string name=3D&quot;dns_servers&quot;&gt;DNS-=D1=
=81=D0=B5=D1=80=D0=B2=D0=B5=D1=80=D1=8B&lt;/string&gt;<br>=C2=A0 =C2=A0 =C2=
=A0&lt;string name=3D&quot;edit&quot;&gt;=D0=A0=D0=B5=D0=B4=D0=B0=D0=BA=D1=
=82=D0=B8=D1=80=D0=BE=D0=B2=D0=B0=D1=82=D1=8C&lt;/string&gt;<br>=C2=A0 =C2=
=A0 =C2=A0&lt;string name=3D&quot;endpoint&quot;&gt;=D0=9A=D0=BE=D0=BD=D0=
=B5=D1=87=D0=BD=D0=B0=D1=8F =D1=82=D0=BE=D1=87=D0=BA=D0=B0&lt;/string&gt;<b=
r>diff --git a/app/src/main/res/values/strings.xml b/app/src/main/res/value=
s/strings.xml<br>index 336cd4e..89a32c0 100644<br>--- a/app/src/main/res/va=
lues/strings.xml<br>+++ b/app/src/main/res/values/strings.xml<br>@@ -66,7 +=
66,7 @@<br>=C2=A0 =C2=A0 =C2=A0&lt;string name=3D&quot;dark_theme_summary_o=
n&quot;&gt;Currently using dark (night) theme&lt;/string&gt;<br>=C2=A0 =C2=
=A0 =C2=A0&lt;string name=3D&quot;dark_theme_title&quot;&gt;Use dark theme&=
lt;/string&gt;<br>=C2=A0 =C2=A0 =C2=A0&lt;string name=3D&quot;delete&quot;&=
gt;Delete&lt;/string&gt;<br>- =C2=A0 =C2=A0&lt;string name=3D&quot;deselect=
_all&quot;&gt;Deselect All&lt;/string&gt;<br>+ =C2=A0 =C2=A0&lt;string name=
=3D&quot;toggle_all&quot;&gt;Toggle All&lt;/string&gt;<br>=C2=A0 =C2=A0 =C2=
=A0&lt;string name=3D&quot;dns_servers&quot;&gt;DNS servers&lt;/string&gt;<=
br>=C2=A0 =C2=A0 =C2=A0&lt;string name=3D&quot;edit&quot;&gt;Edit&lt;/strin=
g&gt;<br>=C2=A0 =C2=A0 =C2=A0&lt;string name=3D&quot;endpoint&quot;&gt;Endp=
oint&lt;/string&gt;<br>-- <br>2.25.0<br><br><br></div><br></div>

--000000000000d1d78a059eb373eb--

--===============2543260012950115362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2543260012950115362==--
