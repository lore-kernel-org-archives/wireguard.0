Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3D1C4360F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:20:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8232121A4A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8232121A4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alemacorp.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2fab133;
	Sun, 17 Feb 2019 01:11:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd9a07e8
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Jan 2019 02:46:11 +0000 (UTC)
Received: from gateway20.websitewelcome.com (gateway20.websitewelcome.com
 [192.185.58.11])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8748caa2
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Jan 2019 02:46:10 +0000 (UTC)
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway20.websitewelcome.com (Postfix) with ESMTP id C034F400C69AB
 for <wireguard@lists.zx2c4.com>; Mon, 21 Jan 2019 20:51:03 -0600 (CST)
Received: from gator4053.hostgator.com ([192.185.4.64]) by cmsmtp with SMTP
 id lm9XgWT1NYTGMlm9XgFIYl; Mon, 21 Jan 2019 20:51:03 -0600
X-Authority-Reason: nr=8
Received: from [68.183.18.65] (port=63603 helo=DESKTOPK7NPB4H)
 by gator4053.hostgator.com with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.91)
 (envelope-from <mbrocato@alemacorp.com>) id 1glm9V-002Yq7-7E
 for wireguard@lists.zx2c4.com; Mon, 21 Jan 2019 20:51:03 -0600
From: <mbrocato@alemacorp.com>
To: <wireguard@lists.zx2c4.com>
Subject: Issues in Wireguard
Date: Tue, 22 Jan 2019 10:50:56 +0800
Message-ID: <002601d4b1fd$4e6151b0$eb23f510$@alemacorp.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="----=_NextPart_000_0027_01D4B240.5C84DFD0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdSx/F6kMpL+QPqkTAKS1Fa/s3C8XQ==
Content-Language: en-us
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4053.hostgator.com
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - alemacorp.com
X-BWhitelist: no
X-Source-IP: 68.183.18.65
X-Source-L: No
X-Exim-ID: 1glm9V-002Yq7-7E
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (DESKTOPK7NPB4H) [68.183.18.65]:63603
X-Source-Auth: mbrocato@alemacorp.com
X-Email-Count: 1
X-Source-Cap: bWFyaW87bWFyaW87Z2F0b3I0MDUzLmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Approved-At: Sun, 17 Feb 2019 02:11:46 +0100
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multipart message in MIME format.

------=_NextPart_000_0027_01D4B240.5C84DFD0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0028_01D4B240.5C84DFD0"


------=_NextPart_001_0028_01D4B240.5C84DFD0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

 

As I'm used to use github and here is quite different I'm guessing this is
the way to report issues.

I'm in China using a Samsung s9 SM-9600/DS Root (magisk) with the latest
version of wireguard at the moment running on Algo deployment in Digital
Ocean; never had problems before with any other phone but with the latest
installation wireguard keep crashing. Find attached the log from the app, I
have tested the same version in a Samsung S5 and a Huawei P20 lite and no
issues there.

 

Mario


------=_NextPart_001_0028_01D4B240.5C84DFD0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal>Hello,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>As I&#8217;m =
used to use github and here is quite different I&#8217;m guessing this =
is the way to report issues.<o:p></o:p></p><p =
class=3DMsoNormal>I&#8217;m in China using a Samsung s9 SM-9600/DS Root =
(magisk) with the latest version of wireguard at the moment running on =
Algo deployment in Digital Ocean; never had problems before with any =
other phone but with the latest installation wireguard keep crashing. =
Find attached the log from the app, I have tested the same version in a =
Samsung S5 and a Huawei P20 lite and no issues there.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Mario<o:p></o:p></p></div></body></html>
------=_NextPart_001_0028_01D4B240.5C84DFD0--

------=_NextPart_000_0027_01D4B240.5C84DFD0
Content-Type: text/plain;
	name="wireguard-log.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="wireguard-log.txt"

--------- beginning of main=0A=
01-18 23:06:35.178  6470  6470 I zygote64: Rejecting re-init on =
previously-failed class =
java.lang.Class<androidx.core.view.ViewCompat$OnUnhandledKeyEventListener=
Wrapper>: java.lang.NoClassDefFoundError: Failed resolution of: =
Landroid/view/View$OnUnhandledKeyEventListener;=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.setContentView(int) =
(AppCompatDelegateImpl.java:466)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.setContentView(int) =
(AppCompatActivity.java:140)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
com.wireguard.android.activity.MainActivity.onCreate(android.os.Bundle) =
(MainActivity.java:74)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.app.Activity.performCreate(android.os.Bundle) =
(Activity.java:7183)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.app.Instrumentation.callActivityOnCreate(android.app.Activity, =
android.os.Bundle) (Instrumentation.java:1220)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2908)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:06:35.178  6470  6470 I zygote64: Caused by: =
java.lang.ClassNotFoundException: Didn't find class =
"android.view.View$OnUnhandledKeyEventListener" on path: =
DexPathList[[zip file =
"/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk"],=
nativeLibraryDirectories=3D[/data/app/com.wireguard.android-ZpU3pfh-wtYZ6=
zCM0NHoLA=3D=3D/lib/arm64, =
/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk!/li=
b/arm64-v8a, /system/lib64, /vendor/lib64]]=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at java.lang.Class =
dalvik.system.BaseDexClassLoader.findClass(java.lang.String) =
(BaseDexClassLoader.java:93)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String, boolean) =
(ClassLoader.java:379)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String) (ClassLoader.java:312)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.setContentView(int) =
(AppCompatDelegateImpl.java:466)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.setContentView(int) =
(AppCompatActivity.java:140)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
com.wireguard.android.activity.MainActivity.onCreate(android.os.Bundle) =
(MainActivity.java:74)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.app.Activity.performCreate(android.os.Bundle) =
(Activity.java:7183)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.app.Instrumentation.callActivityOnCreate(android.app.Activity, =
android.os.Bundle) (Instrumentation.java:1220)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2908)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:06:35.178  6470  6470 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:06:35.178  6470  6470 I zygote64: =0A=
01-18 23:06:35.179  6470  6470 I zygote64: Rejecting re-init on =
previously-failed class =
java.lang.Class<androidx.core.view.ViewCompat$OnUnhandledKeyEventListener=
Wrapper>: java.lang.NoClassDefFoundError: Failed resolution of: =
Landroid/view/View$OnUnhandledKeyEventListener;=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.setContentView(int) =
(AppCompatDelegateImpl.java:466)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.setContentView(int) =
(AppCompatActivity.java:140)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
com.wireguard.android.activity.MainActivity.onCreate(android.os.Bundle) =
(MainActivity.java:74)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.app.Activity.performCreate(android.os.Bundle) =
(Activity.java:7183)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.app.Instrumentation.callActivityOnCreate(android.app.Activity, =
android.os.Bundle) (Instrumentation.java:1220)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2908)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:06:35.179  6470  6470 I zygote64: Caused by: =
java.lang.ClassNotFoundException: Didn't find class =
"android.view.View$OnUnhandledKeyEventListener" on path: =
DexPathList[[zip file =
"/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk"],=
nativeLibraryDirectories=3D[/data/app/com.wireguard.android-ZpU3pfh-wtYZ6=
zCM0NHoLA=3D=3D/lib/arm64, =
/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk!/li=
b/arm64-v8a, /system/lib64, /vendor/lib64]]=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at java.lang.Class =
dalvik.system.BaseDexClassLoader.findClass(java.lang.String) =
(BaseDexClassLoader.java:93)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String, boolean) =
(ClassLoader.java:379)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String) (ClassLoader.java:312)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.setContentView(int) =
(AppCompatDelegateImpl.java:466)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.setContentView(int) =
(AppCompatActivity.java:140)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
com.wireguard.android.activity.MainActivity.onCreate(android.os.Bundle) =
(MainActivity.java:74)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.app.Activity.performCreate(android.os.Bundle) =
(Activity.java:7183)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.app.Instrumentation.callActivityOnCreate(android.app.Activity, =
android.os.Bundle) (Instrumentation.java:1220)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2908)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:06:35.179  6470  6470 I zygote64: =0A=
01-18 23:06:35.179  6470  6470 I zygote64: Rejecting re-init on =
previously-failed class =
java.lang.Class<androidx.core.view.ViewCompat$OnUnhandledKeyEventListener=
Wrapper>: java.lang.NoClassDefFoundError: Failed resolution of: =
Landroid/view/View$OnUnhandledKeyEventListener;=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:06:35.179  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.setContentView(int) =
(AppCompatDelegateImpl.java:466)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.setContentView(int) =
(AppCompatActivity.java:140)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
com.wireguard.android.activity.MainActivity.onCreate(android.os.Bundle) =
(MainActivity.java:74)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.app.Activity.performCreate(android.os.Bundle) =
(Activity.java:7183)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.app.Instrumentation.callActivityOnCreate(android.app.Activity, =
android.os.Bundle) (Instrumentation.java:1220)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2908)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:06:35.180  6470  6470 I zygote64: Caused by: =
java.lang.ClassNotFoundException: Didn't find class =
"android.view.View$OnUnhandledKeyEventListener" on path: =
DexPathList[[zip file =
"/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk"],=
nativeLibraryDirectories=3D[/data/app/com.wireguard.android-ZpU3pfh-wtYZ6=
zCM0NHoLA=3D=3D/lib/arm64, =
/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk!/li=
b/arm64-v8a, /system/lib64, /vendor/lib64]]=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at java.lang.Class =
dalvik.system.BaseDexClassLoader.findClass(java.lang.String) =
(BaseDexClassLoader.java:93)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String, boolean) =
(ClassLoader.java:379)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String) (ClassLoader.java:312)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.setContentView(int) =
(AppCompatDelegateImpl.java:466)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.setContentView(int) =
(AppCompatActivity.java:140)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
com.wireguard.android.activity.MainActivity.onCreate(android.os.Bundle) =
(MainActivity.java:74)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.app.Activity.performCreate(android.os.Bundle) =
(Activity.java:7183)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.app.Instrumentation.callActivityOnCreate(android.app.Activity, =
android.os.Bundle) (Instrumentation.java:1220)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2908)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:06:35.180  6470  6470 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:06:35.180  6470  6470 I zygote64: =0A=
--------- beginning of events=0A=
01-18 23:06:35.223  6470  6470 I am_on_resume_called: =
[0,com.wireguard.android.activity.MainActivity,LAUNCH_ACTIVITY]=0A=
01-18 23:06:35.229  6470  8524 D OpenGLRenderer: HWUI GL Pipeline=0A=
01-18 23:06:35.233  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
setView =3D DecorView@388d2d6[MainActivity] TM=3Dtrue MM=3Dfalse=0A=
01-18 23:06:35.237  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
dispatchAttachedToWindow=0A=
01-18 23:06:35.250  6470  6470 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:06:35.250  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
Relayout returned: old=3D[0,0][0,0] new=3D[0,0][1080,2220] result=3D0x7 =
surface=3D{valid=3Dtrue 538614435840} changed=3Dtrue=0A=
01-18 23:06:35.257  6470  8524 I OpenGLRenderer: Initialized EGL, =
version 1.4=0A=
01-18 23:06:35.257  6470  8524 D OpenGLRenderer: Swap behavior 2=0A=
01-18 23:06:35.259  6470  8524 D libGLESv1: STS_GLApi : DTS, ODTC are =
not allowed for Package : com.wireguard.android=0A=
01-18 23:06:35.260  6470  8524 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:06:35.260  6470  8524 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d6fc1daa0=0A=
01-18 23:06:35.305  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
MSG_RESIZED_REPORT: frame=3DRect(0, 0 - 1080, 2220) ci=3DRect(0, 72 - 0, =
144) vi=3DRect(0, 72 - 0, 144) or=3D1=0A=
01-18 23:06:35.305  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:06:35.307  6470  6470 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@74fd40e nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:06:35.307  6470  6470 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:06:35.321  6470  6470 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@6dbe2f nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:06:36.959  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:06:37.083  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:06:38.012  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:06:38.076  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:06:38.947  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:06:39.038  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:06:39.072  6470  6470 I am_on_paused_called: =
[0,com.wireguard.android.activity.MainActivity,handlePauseActivity]=0A=
01-18 23:06:39.102  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:06:39.134  6470  8524 D OpenGLRenderer: eglDestroySurface =3D =
0x7d6fc1daa0=0A=
01-18 23:06:39.134  6470  8524 D OpenGLRenderer: endAllActiveAnimators =
on 0x7d5b2b2000 (RippleDrawable) with handle 0x7d5a3cecc0=0A=
01-18 23:06:39.138  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:06:39.530  6470  6470 I am_on_stop_called: =
[0,com.wireguard.android.activity.MainActivity,handleStopActivity]=0A=
01-18 23:06:41.323  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x1 surface=3D{valid=3Dfalse 0} changed=3Dfalse=0A=
01-18 23:06:41.331  6470  6470 I am_on_resume_called: =
[0,com.wireguard.android.activity.MainActivity,RESUME_ACTIVITY]=0A=
01-18 23:06:41.345  6470  6470 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:06:41.345  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x7 surface=3D{valid=3Dtrue 538614435840} changed=3Dtrue=0A=
01-18 23:06:41.351  6470  8524 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:06:41.351  6470  8524 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d6fc1daa0=0A=
01-18 23:06:41.351  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:06:41.352  6470  6470 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@25f5cbe nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:06:41.352  6470  6470 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:07:03.582  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:07:03.698  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:07:04.207  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:07:04.273  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:07:04.909  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:07:05.000  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:07:05.017  6470  6470 I menu_item_selected: [0,Settings]=0A=
01-18 23:07:05.035  6470  6470 I am_on_paused_called: =
[0,com.wireguard.android.activity.MainActivity,handlePauseActivity]=0A=
01-18 23:07:05.067  6470  6470 I am_on_resume_called: =
[0,com.wireguard.android.activity.SettingsActivity,LAUNCH_ACTIVITY]=0A=
01-18 23:07:05.070  6470  6470 D ViewRootImpl@8b06aa0[SettingsActivity]: =
setView =3D DecorView@b5a5659[SettingsActivity] TM=3Dtrue MM=3Dfalse=0A=
01-18 23:07:05.071  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:07:05.073  6470  6470 V InputMethodManager: Not IME target =
window, ignoring=0A=
01-18 23:07:05.073  6470  6470 D ViewRootImpl@8b06aa0[SettingsActivity]: =
dispatchAttachedToWindow=0A=
01-18 23:07:05.081  6470  6470 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:07:05.081  6470  6470 D ViewRootImpl@8b06aa0[SettingsActivity]: =
Relayout returned: old=3D[0,0][0,0] new=3D[0,0][1080,2220] result=3D0x7 =
surface=3D{valid=3Dtrue 537987031040} changed=3Dtrue=0A=
01-18 23:07:05.087  6470  8524 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:07:05.087  6470  8524 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d6fc1f5d0=0A=
01-18 23:07:05.128  6470  6470 D ViewRootImpl@8b06aa0[SettingsActivity]: =
MSG_RESIZED_REPORT: frame=3DRect(0, 0 - 1080, 2220) ci=3DRect(0, 72 - 0, =
144) vi=3DRect(0, 72 - 0, 144) or=3D1=0A=
01-18 23:07:05.128  6470  6470 D ViewRootImpl@8b06aa0[SettingsActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:07:05.132  6470  6470 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@ee811ae nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:07:05.132  6470  6470 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:07:05.146  6470  8524 D OpenGLRenderer: eglDestroySurface =3D =
0x7d6fc1daa0=0A=
01-18 23:07:05.146  6470  8524 D OpenGLRenderer: endAllActiveAnimators =
on 0x7d5b3a8000 (RippleDrawable) with handle 0x7d5a3ce9a0=0A=
01-18 23:07:05.149  6470  6470 D ViewRootImpl@ba346f1[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:07:05.538  6470  6470 I am_on_stop_called: =
[0,com.wireguard.android.activity.MainActivity,handleStopActivity]=0A=
01-18 23:07:10.887  6470  6470 D ViewRootImpl@8b06aa0[SettingsActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:07:10.986  6470  6470 D ViewRootImpl@8b06aa0[SettingsActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:07:11.019  6470  6470 I am_on_paused_called: =
[0,com.wireguard.android.activity.SettingsActivity,handlePauseActivity]=0A=
01-18 23:07:11.047  6470  6470 D ViewRootImpl@8b06aa0[SettingsActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:07:11.175  6470  8524 D OpenGLRenderer: eglDestroySurface =3D =
0x7d6fc1f5d0=0A=
01-18 23:07:11.175  6470  8524 D OpenGLRenderer: endAllActiveAnimators =
on 0x7d42909800 (RippleDrawable) with handle 0x7d5a3ce6a0=0A=
01-18 23:07:11.179  6470  6470 D ViewRootImpl@8b06aa0[SettingsActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:07:12.185  6470  6470 I am_on_stop_called: =
[0,com.wireguard.android.activity.SettingsActivity,handleStopActivity]=0A=
01-18 23:07:12.202  6470  6470 D ViewRootImpl@8b06aa0[SettingsActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dfalse=0A=
01-18 23:07:28.719  6470  6514 W zygote64: Long monitor contention with =
owner AsyncTask #2 (6509) at int =
libcore.io.Linux.readBytes(java.io.FileDescriptor, java.lang.Object, =
int, int)(Linux.java:-2) waiters=3D0 in void =
java.lang.UNIXProcess$ProcessPipeInputStream.processExited() for 14.223s=0A=
01-18 23:07:28.720  6470  6514 I dvm_lock_sample: =
[com.wireguard.android,0,process =
reaper,14223,UNIXProcess.java,-1,Linux.java,-2,100]=0A=
01-18 23:07:28.723  6470  6509 W WireGuard/RootShell: Root check did not =
return correct UID: null=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: Unable to =
import tunnel: Tunnel =E2=80=9Cmariobrocatousa=E2=80=9D already exists=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: =
java9.util.concurrent.CompletionException: =
java.lang.IllegalArgumentException: Tunnel =
=E2=80=9Cmariobrocatousa=E2=80=9D already exists=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
java9.util.concurrent.CompletableFuture.reportJoin(CompletableFuture.java=
:403)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
java9.util.concurrent.CompletableFuture.getNow(CompletableFuture.java:205=
2)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.fragment.TunnelListFragment.lambda$null$1(TunnelLis=
tFragment.java:177)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.fragment.-$$Lambda$TunnelListFragment$8xg1FnWGiJ3-S=
s2OewtP3mhABxo.accept(Unknown Source:10)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
java9.util.concurrent.CompletableFuture.uniWhenComplete(CompletableFuture=
.java:848)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
java9.util.concurrent.CompletableFuture.uniWhenCompleteStage(CompletableF=
uture.java:873)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
java9.util.concurrent.CompletableFuture.whenComplete(CompletableFuture.ja=
va:2242)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.fragment.TunnelListFragment.lambda$importTunnel$2(T=
unnelListFragment.java:172)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.fragment.-$$Lambda$TunnelListFragment$w2gE-dixaCGvN=
ZH2W1rvuopRuZQ.accept(Unknown Source:10)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
java9.util.concurrent.CompletableFuture.uniWhenComplete(CompletableFuture=
.java:848)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
java9.util.concurrent.CompletableFuture$UniWhenComplete.tryFire(Completab=
leFuture.java:825)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
java9.util.concurrent.CompletableFuture.postComplete(CompletableFuture.ja=
va:504)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
java9.util.concurrent.CompletableFuture.complete(CompletableFuture.java:2=
065)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.util.AsyncWorker.lambda$null$3(AsyncWorker.java:46)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.util.-$$Lambda$AsyncWorker$IcRxFMjG2f4ymEMel6a--8uy=
RtU.run(Unknown Source:4)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
android.os.Handler.handleCallback(Handler.java:789)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
android.os.Handler.dispatchMessage(Handler.java:98)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
android.os.Looper.loop(Looper.java:164)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
android.app.ActivityThread.main(ActivityThread.java:6938)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
java.lang.reflect.Method.invoke(Native Method)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
com.android.internal.os.Zygote$MethodAndArgsCaller.run(Zygote.java:327)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
com.android.internal.os.ZygoteInit.main(ZygoteInit.java:1374)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: Caused =
by: java.lang.IllegalArgumentException: Tunnel =
=E2=80=9Cmariobrocatousa=E2=80=9D already exists=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.model.TunnelManager.create(TunnelManager.java:81)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.fragment.TunnelListFragment.lambda$importTunnel$0(T=
unnelListFragment.java:156)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.fragment.-$$Lambda$TunnelListFragment$jKQSIed0Jzvlm=
akG8NjJ4Ld0_NA.get(Unknown Source:10)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.util.AsyncWorker.lambda$supplyAsync$5(AsyncWorker.j=
ava:45)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.util.-$$Lambda$AsyncWorker$wP6ZO_lwMWxn1CVpUfnLV0bf=
A18.run(Unknown Source:6)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
android.os.AsyncTask$SerialExecutor$1.run(AsyncTask.java:245)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java=
:1162)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.jav=
a:636)=0A=
01-18 23:07:28.874  6470  6470 E WireGuard/TunnelListFragment: 	at =
java.lang.Thread.run(Thread.java:764)=0A=
01-18 23:07:28.926  6470  6477 I zygote64: Do partial code cache =
collection, code=3D30KB, data=3D26KB=0A=
01-18 23:07:28.926  6470  6477 I zygote64: After code cache collection, =
code=3D27KB, data=3D24KB=0A=
01-18 23:07:28.926  6470  6477 I zygote64: Increasing code cache =
capacity to 128KB=0A=
01-18 23:07:45.638 13458 13458 W SELinux : SELinux =
selinux_android_compute_policy_index : Policy Index[2],  =
Con:u:r:zygote:s0 RAM:SEPF_SM-G965F_8.0.0_0017, [-1 -1 -1 -1 0 1]=0A=
01-18 23:07:45.639 13458 13458 I SELinux : SELinux: =
seapp_context_lookup: seinfo=3Duntrusted, level=3Ds0:c512,c768, =
pkgname=3Dcom.wireguard.android =0A=
01-18 23:07:45.710 13458 13474 D libEGL  : loaded =
/vendor/lib64/egl/libGLES_mali.so=0A=
01-18 23:07:45.755 13458 13458 I zygote64: Rejecting re-init on =
previously-failed class =
java.lang.Class<androidx.core.view.ViewCompat$OnUnhandledKeyEventListener=
Wrapper>: java.lang.NoClassDefFoundError: Failed resolution of: =
Landroid/view/View$OnUnhandledKeyEventListener;=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.view.View =
androidx.appcompat.app.AppCompatDelegateImpl.findViewById(int) =
(AppCompatDelegateImpl.java:403)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.view.View =
androidx.appcompat.app.AppCompatActivity.findViewById(int) =
(AppCompatActivity.java:191)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.view.View =
androidx.fragment.app.FragmentActivity$HostCallbacks.onFindViewById(int) =
(FragmentActivity.java:1038)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.moveToState(androidx.fragment.a=
pp.Fragment, int, int, int, boolean) (FragmentManager.java:1444)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.moveFragmentToExpectedState(and=
roidx.fragment.app.Fragment) (FragmentManager.java:1784)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.moveToState(int, boolean) =
(FragmentManager.java:1852)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.dispatchStateChange(int) =
(FragmentManager.java:3269)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.dispatchActivityCreated() =
(FragmentManager.java:3229)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentController.dispatchActivityCreated() =
(FragmentController.java:201)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentActivity.onStart() =
(FragmentActivity.java:620)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.onStart() =
(AppCompatActivity.java:178)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
android.app.Instrumentation.callActivityOnStart(android.app.Activity) =
(Instrumentation.java:1340)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
android.app.Activity.performStart() (Activity.java:7200)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2918)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:07:45.755 13458 13458 I zygote64: Caused by: =
java.lang.ClassNotFoundException: Didn't find class =
"android.view.View$OnUnhandledKeyEventListener" on path: =
DexPathList[[zip file =
"/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk"],=
nativeLibraryDirectories=3D[/data/app/com.wireguard.android-ZpU3pfh-wtYZ6=
zCM0NHoLA=3D=3D/lib/arm64, =
/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk!/li=
b/arm64-v8a, /system/lib64, /vendor/lib64]]=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at java.lang.Class =
dalvik.system.BaseDexClassLoader.findClass(java.lang.String) =
(BaseDexClassLoader.java:93)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String, boolean) =
(ClassLoader.java:379)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String) (ClassLoader.java:312)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:07:45.755 13458 13458 I zygote64:   at android.view.View =
androidx.appcompat.app.AppCompatDelegateImpl.findViewById(int) =
(AppCompatDelegateImpl.java:403)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
androidx.appcompat.app.AppCompatActivity.findViewById(int) =
(AppCompatActivity.java:191)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
androidx.fragment.app.FragmentActivity$HostCallbacks.onFindViewById(int) =
(FragmentActivity.java:1038)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.moveToState(androidx.fragment.a=
pp.Fragment, int, int, int, boolean) (FragmentManager.java:1444)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.moveFragmentToExpectedState(and=
roidx.fragment.app.Fragment) (FragmentManager.java:1784)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.moveToState(int, boolean) =
(FragmentManager.java:1852)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.dispatchStateChange(int) =
(FragmentManager.java:3269)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.dispatchActivityCreated() =
(FragmentManager.java:3229)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentController.dispatchActivityCreated() =
(FragmentController.java:201)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentActivity.onStart() =
(FragmentActivity.java:620)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.onStart() =
(AppCompatActivity.java:178)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.app.Instrumentation.callActivityOnStart(android.app.Activity) =
(Instrumentation.java:1340)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.app.Activity.performStart() (Activity.java:7200)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2918)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:07:45.756 13458 13458 I zygote64: =0A=
01-18 23:07:45.756 13458 13458 I zygote64: Rejecting re-init on =
previously-failed class =
java.lang.Class<androidx.core.view.ViewCompat$OnUnhandledKeyEventListener=
Wrapper>: java.lang.NoClassDefFoundError: Failed resolution of: =
Landroid/view/View$OnUnhandledKeyEventListener;=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
androidx.appcompat.app.AppCompatDelegateImpl.findViewById(int) =
(AppCompatDelegateImpl.java:403)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
androidx.appcompat.app.AppCompatActivity.findViewById(int) =
(AppCompatActivity.java:191)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
androidx.fragment.app.FragmentActivity$HostCallbacks.onFindViewById(int) =
(FragmentActivity.java:1038)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.moveToState(androidx.fragment.a=
pp.Fragment, int, int, int, boolean) (FragmentManager.java:1444)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.moveFragmentToExpectedState(and=
roidx.fragment.app.Fragment) (FragmentManager.java:1784)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.moveToState(int, boolean) =
(FragmentManager.java:1852)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.dispatchStateChange(int) =
(FragmentManager.java:3269)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.dispatchActivityCreated() =
(FragmentManager.java:3229)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentController.dispatchActivityCreated() =
(FragmentController.java:201)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentActivity.onStart() =
(FragmentActivity.java:620)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.onStart() =
(AppCompatActivity.java:178)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.app.Instrumentation.callActivityOnStart(android.app.Activity) =
(Instrumentation.java:1340)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.app.Activity.performStart() (Activity.java:7200)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2918)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:07:45.756 13458 13458 I zygote64: Caused by: =
java.lang.ClassNotFoundException: Didn't find class =
"android.view.View$OnUnhandledKeyEventListener" on path: =
DexPathList[[zip file =
"/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk"],=
nativeLibraryDirectories=3D[/data/app/com.wireguard.android-ZpU3pfh-wtYZ6=
zCM0NHoLA=3D=3D/lib/arm64, =
/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk!/li=
b/arm64-v8a, /system/lib64, /vendor/lib64]]=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at java.lang.Class =
dalvik.system.BaseDexClassLoader.findClass(java.lang.String) =
(BaseDexClassLoader.java:93)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String, boolean) =
(ClassLoader.java:379)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String) (ClassLoader.java:312)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
androidx.appcompat.app.AppCompatDelegateImpl.findViewById(int) =
(AppCompatDelegateImpl.java:403)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
androidx.appcompat.app.AppCompatActivity.findViewById(int) =
(AppCompatActivity.java:191)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.view.View =
androidx.fragment.app.FragmentActivity$HostCallbacks.onFindViewById(int) =
(FragmentActivity.java:1038)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.moveToState(androidx.fragment.a=
pp.Fragment, int, int, int, boolean) (FragmentManager.java:1444)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.moveFragmentToExpectedState(and=
roidx.fragment.app.Fragment) (FragmentManager.java:1784)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.moveToState(int, boolean) =
(FragmentManager.java:1852)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.dispatchStateChange(int) =
(FragmentManager.java:3269)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.dispatchActivityCreated() =
(FragmentManager.java:3229)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentController.dispatchActivityCreated() =
(FragmentController.java:201)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentActivity.onStart() =
(FragmentActivity.java:620)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.onStart() =
(AppCompatActivity.java:178)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.app.Instrumentation.callActivityOnStart(android.app.Activity) =
(Instrumentation.java:1340)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.app.Activity.performStart() (Activity.java:7200)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2918)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:07:45.756 13458 13458 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:07:45.757 13458 13458 I zygote64: =0A=
01-18 23:07:45.757 13458 13458 I zygote64: Rejecting re-init on =
previously-failed class =
java.lang.Class<androidx.core.view.ViewCompat$OnUnhandledKeyEventListener=
Wrapper>: java.lang.NoClassDefFoundError: Failed resolution of: =
Landroid/view/View$OnUnhandledKeyEventListener;=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.View =
androidx.appcompat.app.AppCompatDelegateImpl.findViewById(int) =
(AppCompatDelegateImpl.java:403)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.View =
androidx.appcompat.app.AppCompatActivity.findViewById(int) =
(AppCompatActivity.java:191)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.View =
androidx.fragment.app.FragmentActivity$HostCallbacks.onFindViewById(int) =
(FragmentActivity.java:1038)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.moveToState(androidx.fragment.a=
pp.Fragment, int, int, int, boolean) (FragmentManager.java:1444)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.moveFragmentToExpectedState(and=
roidx.fragment.app.Fragment) (FragmentManager.java:1784)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.moveToState(int, boolean) =
(FragmentManager.java:1852)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.dispatchStateChange(int) =
(FragmentManager.java:3269)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.dispatchActivityCreated() =
(FragmentManager.java:3229)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentController.dispatchActivityCreated() =
(FragmentController.java:201)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentActivity.onStart() =
(FragmentActivity.java:620)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.onStart() =
(AppCompatActivity.java:178)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.app.Instrumentation.callActivityOnStart(android.app.Activity) =
(Instrumentation.java:1340)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.app.Activity.performStart() (Activity.java:7200)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2918)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:07:45.757 13458 13458 I zygote64: Caused by: =
java.lang.ClassNotFoundException: Didn't find class =
"android.view.View$OnUnhandledKeyEventListener" on path: =
DexPathList[[zip file =
"/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk"],=
nativeLibraryDirectories=3D[/data/app/com.wireguard.android-ZpU3pfh-wtYZ6=
zCM0NHoLA=3D=3D/lib/arm64, =
/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk!/li=
b/arm64-v8a, /system/lib64, /vendor/lib64]]=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at java.lang.Class =
dalvik.system.BaseDexClassLoader.findClass(java.lang.String) =
(BaseDexClassLoader.java:93)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String, boolean) =
(ClassLoader.java:379)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String) (ClassLoader.java:312)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.View =
androidx.appcompat.app.AppCompatDelegateImpl.findViewById(int) =
(AppCompatDelegateImpl.java:403)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.View =
androidx.appcompat.app.AppCompatActivity.findViewById(int) =
(AppCompatActivity.java:191)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.view.View =
androidx.fragment.app.FragmentActivity$HostCallbacks.onFindViewById(int) =
(FragmentActivity.java:1038)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.moveToState(androidx.fragment.a=
pp.Fragment, int, int, int, boolean) (FragmentManager.java:1444)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.moveFragmentToExpectedState(and=
roidx.fragment.app.Fragment) (FragmentManager.java:1784)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.moveToState(int, boolean) =
(FragmentManager.java:1852)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.dispatchStateChange(int) =
(FragmentManager.java:3269)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentManagerImpl.dispatchActivityCreated() =
(FragmentManager.java:3229)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentController.dispatchActivityCreated() =
(FragmentController.java:201)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.fragment.app.FragmentActivity.onStart() =
(FragmentActivity.java:620)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.onStart() =
(AppCompatActivity.java:178)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.app.Instrumentation.callActivityOnStart(android.app.Activity) =
(Instrumentation.java:1340)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.app.Activity.performStart() (Activity.java:7200)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2918)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:07:45.757 13458 13458 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:07:45.757 13458 13458 I zygote64: =0A=
01-18 23:07:45.788 13458 13458 I am_on_resume_called: =
[0,com.wireguard.android.activity.SettingsActivity,LAUNCH_ACTIVITY]=0A=
01-18 23:07:45.797 13458 13485 D OpenGLRenderer: HWUI GL Pipeline=0A=
01-18 23:07:45.802 13458 13458 D ViewRootImpl@fc3a113[SettingsActivity]: =
setView =3D DecorView@e049549[SettingsActivity] TM=3Dtrue MM=3Dfalse=0A=
01-18 23:07:45.806 13458 13458 V InputMethodManager: Not IME target =
window, ignoring=0A=
01-18 23:07:45.807 13458 13458 D ViewRootImpl@fc3a113[SettingsActivity]: =
dispatchAttachedToWindow=0A=
01-18 23:07:45.815 13458 13458 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:07:45.815 13458 13458 D ViewRootImpl@fc3a113[SettingsActivity]: =
Relayout returned: old=3D[0,0][0,0] new=3D[0,0][1080,2220] result=3D0x7 =
surface=3D{valid=3Dtrue 538619895808} changed=3Dtrue=0A=
01-18 23:07:45.819 13458 13485 I OpenGLRenderer: Initialized EGL, =
version 1.4=0A=
01-18 23:07:45.819 13458 13485 D OpenGLRenderer: Swap behavior 2=0A=
01-18 23:07:45.824 13458 13485 D libGLESv1: STS_GLApi : DTS, ODTC are =
not allowed for Package : com.wireguard.android=0A=
01-18 23:07:45.825 13458 13485 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:07:45.825 13458 13485 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d5c2b13b0=0A=
01-18 23:07:45.854 13458 13458 D ViewRootImpl@fc3a113[SettingsActivity]: =
MSG_RESIZED_REPORT: frame=3DRect(0, 0 - 1080, 2220) ci=3DRect(0, 72 - 0, =
144) vi=3DRect(0, 72 - 0, 144) or=3D1=0A=
01-18 23:07:45.854 13458 13458 D ViewRootImpl@fc3a113[SettingsActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:07:45.856 13458 13458 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@974fdea nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:07:45.856 13458 13458 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:07:45.893 13458 13458 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@92998db nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:07:47.119 13458 13458 D ViewRootImpl@fc3a113[SettingsActivity]: =
ViewPostIme key 0=0A=
01-18 23:07:47.256 13458 13458 D ViewRootImpl@fc3a113[SettingsActivity]: =
ViewPostIme key 1=0A=
01-18 23:07:47.265 13458 13458 I am_on_paused_called: =
[0,com.wireguard.android.activity.SettingsActivity,handlePauseActivity]=0A=
01-18 23:07:47.318 13458 13458 I am_on_resume_called: =
[0,com.wireguard.android.activity.MainActivity,LAUNCH_ACTIVITY]=0A=
01-18 23:07:47.324 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
setView =3D DecorView@facedab[MainActivity] TM=3Dtrue MM=3Dfalse=0A=
01-18 23:07:47.326 13458 13458 D ViewRootImpl@fc3a113[SettingsActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:07:47.330 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
dispatchAttachedToWindow=0A=
01-18 23:07:47.341 13458 13458 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:07:47.341 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
Relayout returned: old=3D[0,0][0,0] new=3D[0,0][1080,2220] result=3D0x7 =
surface=3D{valid=3Dtrue 538190532608} changed=3Dtrue=0A=
01-18 23:07:47.343 13458 13485 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:07:47.343 13458 13485 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d5c2b4880=0A=
01-18 23:07:47.364 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
MSG_RESIZED_REPORT: frame=3DRect(0, 0 - 1080, 2220) ci=3DRect(0, 72 - 0, =
144) vi=3DRect(0, 72 - 0, 144) or=3D1=0A=
01-18 23:07:47.364 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:07:47.376 13458 13458 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@28095bd nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:07:47.376 13458 13458 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:07:47.390 13458 13485 D OpenGLRenderer: eglDestroySurface =3D =
0x7d5c2b13b0=0A=
01-18 23:07:47.393 13458 13458 D ViewRootImpl@fc3a113[SettingsActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:07:47.787 13458 13458 I am_on_stop_called: =
[0,com.wireguard.android.activity.SettingsActivity,destroy]=0A=
01-18 23:07:47.820 13458 13458 D ViewRootImpl@fc3a113[SettingsActivity]: =
dispatchDetachedFromWindow=0A=
01-18 23:07:47.820 13458 13458 D InputEventReceiver: channel 'e397eb8 =
com.wireguard.android/com.wireguard.android.activity.SettingsActivity =
(client)' ~ Disposing input event receiver.=0A=
01-18 23:07:47.820 13458 13458 D InputEventReceiver: channel 'e397eb8 =
com.wireguard.android/com.wireguard.android.activity.SettingsActivity =
(client)' ~NativeInputEventReceiver.=0A=
01-18 23:07:48.113 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:07:48.245 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:07:49.301 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:07:49.423 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:07:49.451 13458 13458 I am_on_paused_called: =
[0,com.wireguard.android.activity.MainActivity,handlePauseActivity]=0A=
01-18 23:07:49.477 13458 13485 I OpenGLRenderer: prepareTree =
mLayerUpdateQueue is not empty, size =3D 1=0A=
01-18 23:07:49.477 13458 13485 I OpenGLRenderer: name =3D =
LabeledFloatingActionButton, size (120, 120)=0A=
01-18 23:07:49.478 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:07:49.512 13458 13485 D OpenGLRenderer: eglDestroySurface =3D =
0x7d5c2b4880=0A=
01-18 23:07:49.512 13458 13485 D OpenGLRenderer: endAllActiveAnimators =
on 0x7d5c262c00 (RippleDrawable) with handle 0x7d5b5445a0=0A=
01-18 23:07:49.520 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:07:49.929 13458 13458 I am_on_stop_called: =
[0,com.wireguard.android.activity.MainActivity,handleStopActivity]=0A=
01-18 23:07:53.360 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x1 surface=3D{valid=3Dfalse 0} changed=3Dfalse=0A=
01-18 23:07:53.365 13458 13458 I am_on_resume_called: =
[0,com.wireguard.android.activity.MainActivity,RESUME_ACTIVITY]=0A=
01-18 23:07:53.375 13458 13458 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:07:53.375 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x7 surface=3D{valid=3Dtrue 538190532608} changed=3Dtrue=0A=
01-18 23:07:53.378 13458 13485 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:07:53.378 13458 13485 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d4ebd6230=0A=
01-18 23:07:53.378 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:07:53.379 13458 13458 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@ff5a29 nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:07:53.379 13458 13458 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:07:57.678 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:07:58.193 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:07:58.804 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:07:59.036 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:07:59.312 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:07:59.578 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:08:00.504 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:08:01.540 13458 13458 I am_on_paused_called: =
[0,com.wireguard.android.activity.MainActivity,handlePauseActivity]=0A=
01-18 23:08:01.560 13458 13458 I am_on_resume_called: =
[0,com.wireguard.android.activity.MainActivity,LAUNCH_ACTIVITY]=0A=
01-18 23:08:01.563 13458 13458 D ViewRootImpl@f9b43e0[MainActivity]: =
setView =3D DecorView@30a5699[MainActivity] TM=3Dtrue MM=3Dfalse=0A=
01-18 23:08:01.568 13458 13463 I zygote64: Do partial code cache =
collection, code=3D24KB, data=3D28KB=0A=
01-18 23:08:01.568 13458 13463 I zygote64: After code cache collection, =
code=3D24KB, data=3D28KB=0A=
01-18 23:08:01.568 13458 13463 I zygote64: Increasing code cache =
capacity to 128KB=0A=
01-18 23:08:01.570 13458 13458 D ViewRootImpl@f9b43e0[MainActivity]: =
dispatchAttachedToWindow=0A=
01-18 23:08:01.578 13458 13458 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:08:01.578 13458 13458 D ViewRootImpl@f9b43e0[MainActivity]: =
Relayout returned: old=3D[0,0][0,0] new=3D[0,0][1080,2220] result=3D0x7 =
surface=3D{valid=3Dtrue 537980678144} changed=3Dtrue=0A=
01-18 23:08:01.581 13458 13485 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:08:01.581 13458 13485 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d4ebd6820=0A=
01-18 23:08:01.585 13458 13458 D ViewRootImpl@f9b43e0[MainActivity]: =
MSG_RESIZED_REPORT: frame=3DRect(0, 0 - 1080, 2220) ci=3DRect(0, 72 - 0, =
144) vi=3DRect(0, 72 - 0, 144) or=3D1=0A=
01-18 23:08:01.585 13458 13458 D ViewRootImpl@f9b43e0[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:08:01.586 13458 13458 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@4f63240 nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:08:01.586 13458 13458 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:08:01.620 13458 13485 D OpenGLRenderer: eglDestroySurface =3D =
0x7d4ebd6230=0A=
01-18 23:08:01.624 13458 13458 D ViewRootImpl@47063fa[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:08:02.015 13458 13458 I am_on_stop_called: =
[0,com.wireguard.android.activity.MainActivity,handleStopActivity]=0A=
01-18 23:08:03.062 13458 13458 D ViewRootImpl@f9b43e0[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:08:03.211 13458 13458 D ViewRootImpl@f9b43e0[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:08:03.812 13458 13458 D ViewRootImpl@f9b43e0[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:08:03.896 13458 13458 D ViewRootImpl@f9b43e0[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:08:03.923 13458 13458 I am_on_paused_called: =
[0,com.wireguard.android.activity.MainActivity,handlePauseActivity]=0A=
01-18 23:08:03.933 13458 13458 D ViewRootImpl@f9b43e0[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:08:03.941 13458 13485 I OpenGLRenderer: prepareTree =
mLayerUpdateQueue is not empty, size =3D 6=0A=
01-18 23:08:03.942 13458 13485 I OpenGLRenderer: name =3D =
AppCompatTextView, size (419, 81)=0A=
01-18 23:08:03.942 13458 13485 I OpenGLRenderer: name =3D =
AppCompatTextView, size (437, 81)=0A=
01-18 23:08:03.942 13458 13485 I OpenGLRenderer: name =3D =
AppCompatTextView, size (527, 81)=0A=
01-18 23:08:03.942 13458 13485 I OpenGLRenderer: name =3D =
LabeledFloatingActionButton, size (120, 120)=0A=
01-18 23:08:03.942 13458 13485 I chatty  : uid=3D10169(u0_a169) =
identical 1 line=0A=
01-18 23:08:03.942 13458 13485 I OpenGLRenderer: name =3D =
LabeledFloatingActionButton, size (120, 120)=0A=
01-18 23:08:04.026 13458 13485 D OpenGLRenderer: eglDestroySurface =3D =
0x7d4ebd6820=0A=
01-18 23:08:04.026 13458 13485 D OpenGLRenderer: endAllActiveAnimators =
on 0x7d422d3000 (RippleDrawable) with handle 0x7d5b2e82c0=0A=
01-18 23:08:04.026 13458 13485 D OpenGLRenderer: endAllActiveAnimators =
on 0x7d422d2400 (RippleDrawable) with handle 0x7d67f33d40=0A=
01-18 23:08:04.031 13458 13458 D ViewRootImpl@f9b43e0[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:08:04.431 13458 13458 I am_on_stop_called: =
[0,com.wireguard.android.activity.MainActivity,handleStopActivity]=0A=
01-18 23:08:04.946 13458 13458 D ViewRootImpl@f9b43e0[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x1 surface=3D{valid=3Dfalse 0} changed=3Dfalse=0A=
01-18 23:08:04.947 13458 13458 I am_on_resume_called: =
[0,com.wireguard.android.activity.MainActivity,RESUME_ACTIVITY]=0A=
01-18 23:08:04.970 13458 13458 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:08:04.970 13458 13458 D ViewRootImpl@f9b43e0[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x7 surface=3D{valid=3Dtrue 537980678144} changed=3Dtrue=0A=
01-18 23:08:04.972 13458 13485 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:08:04.972 13458 13485 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d4ebd6820=0A=
01-18 23:08:04.973 13458 13458 D ViewRootImpl@f9b43e0[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:08:04.973 13458 13458 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@f3f6317 nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:08:04.973 13458 13458 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:08:06.827 13458 13458 I am_on_paused_called: =
[0,com.wireguard.android.activity.MainActivity,handlePauseActivity]=0A=
01-18 23:08:06.828 13458 13458 D ViewRootImpl@f9b43e0[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:08:06.841 13458 13458 I am_on_stop_called: =
[0,com.wireguard.android.activity.MainActivity,handleStopActivity]=0A=
01-18 23:08:06.852 13458 13485 D OpenGLRenderer: eglDestroySurface =3D =
0x7d4ebd6820=0A=
01-18 23:08:06.855 13458 13458 D ViewRootImpl@f9b43e0[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:08:06.972 13458 13458 D ViewRootImpl@f9b43e0[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x1 surface=3D{valid=3Dfalse 0} changed=3Dfalse=0A=
01-18 23:08:09.981 13764 13764 W SELinux : SELinux =
selinux_android_compute_policy_index : Policy Index[2],  =
Con:u:r:zygote:s0 RAM:SEPF_SM-G965F_8.0.0_0017, [-1 -1 -1 -1 0 1]=0A=
01-18 23:08:09.982 13764 13764 I SELinux : SELinux: =
seapp_context_lookup: seinfo=3Duntrusted, level=3Ds0:c512,c768, =
pkgname=3Dcom.wireguard.android =0A=
01-18 23:08:10.067 13764 13780 D libEGL  : loaded =
/vendor/lib64/egl/libGLES_mali.so=0A=
01-18 23:08:36.485 13764 13764 I zygote64: Rejecting re-init on =
previously-failed class =
java.lang.Class<androidx.core.view.ViewCompat$OnUnhandledKeyEventListener=
Wrapper>: java.lang.NoClassDefFoundError: Failed resolution of: =
Landroid/view/View$OnUnhandledKeyEventListener;=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.setContentView(int) =
(AppCompatDelegateImpl.java:466)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.setContentView(int) =
(AppCompatActivity.java:140)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at void =
com.wireguard.android.activity.MainActivity.onCreate(android.os.Bundle) =
(MainActivity.java:74)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at void =
android.app.Activity.performCreate(android.os.Bundle) =
(Activity.java:7183)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at void =
android.app.Instrumentation.callActivityOnCreate(android.app.Activity, =
android.os.Bundle) (Instrumentation.java:1220)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2908)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:08:36.485 13764 13764 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:08:36.485 13764 13764 I zygote64: Caused by: =
java.lang.ClassNotFoundException: Didn't find class =
"android.view.View$OnUnhandledKeyEventListener" on path: =
DexPathList[[zip file =
"/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk"],=
nativeLibraryDirectories=3D[/data/app/com.wireguard.android-ZpU3pfh-wtYZ6=
zCM0NHoLA=3D=3D/lib/arm64, =
/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk!/li=
b/arm64-v8a, /system/lib64, /vendor/lib64]]=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at java.lang.Class =
dalvik.system.BaseDexClassLoader.findClass(java.lang.String) =
(BaseDexClassLoader.java:93)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String, boolean) =
(ClassLoader.java:379)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String) (ClassLoader.java:312)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.setContentView(int) =
(AppCompatDelegateImpl.java:466)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.setContentView(int) =
(AppCompatActivity.java:140)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
com.wireguard.android.activity.MainActivity.onCreate(android.os.Bundle) =
(MainActivity.java:74)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.app.Activity.performCreate(android.os.Bundle) =
(Activity.java:7183)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.app.Instrumentation.callActivityOnCreate(android.app.Activity, =
android.os.Bundle) (Instrumentation.java:1220)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2908)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:08:36.486 13764 13764 I zygote64: =0A=
01-18 23:08:36.486 13764 13764 I zygote64: Rejecting re-init on =
previously-failed class =
java.lang.Class<androidx.core.view.ViewCompat$OnUnhandledKeyEventListener=
Wrapper>: java.lang.NoClassDefFoundError: Failed resolution of: =
Landroid/view/View$OnUnhandledKeyEventListener;=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.setContentView(int) =
(AppCompatDelegateImpl.java:466)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.setContentView(int) =
(AppCompatActivity.java:140)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
com.wireguard.android.activity.MainActivity.onCreate(android.os.Bundle) =
(MainActivity.java:74)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.app.Activity.performCreate(android.os.Bundle) =
(Activity.java:7183)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.app.Instrumentation.callActivityOnCreate(android.app.Activity, =
android.os.Bundle) (Instrumentation.java:1220)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2908)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:08:36.486 13764 13764 I zygote64: Caused by: =
java.lang.ClassNotFoundException: Didn't find class =
"android.view.View$OnUnhandledKeyEventListener" on path: =
DexPathList[[zip file =
"/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk"],=
nativeLibraryDirectories=3D[/data/app/com.wireguard.android-ZpU3pfh-wtYZ6=
zCM0NHoLA=3D=3D/lib/arm64, =
/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk!/li=
b/arm64-v8a, /system/lib64, /vendor/lib64]]=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at java.lang.Class =
dalvik.system.BaseDexClassLoader.findClass(java.lang.String) =
(BaseDexClassLoader.java:93)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String, boolean) =
(ClassLoader.java:379)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String) (ClassLoader.java:312)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.setContentView(int) =
(AppCompatDelegateImpl.java:466)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.setContentView(int) =
(AppCompatActivity.java:140)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
com.wireguard.android.activity.MainActivity.onCreate(android.os.Bundle) =
(MainActivity.java:74)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.app.Activity.performCreate(android.os.Bundle) =
(Activity.java:7183)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.app.Instrumentation.callActivityOnCreate(android.app.Activity, =
android.os.Bundle) (Instrumentation.java:1220)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2908)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:08:36.486 13764 13764 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:08:36.486 13764 13764 I zygote64: =0A=
01-18 23:08:36.487 13764 13764 I zygote64: Rejecting re-init on =
previously-failed class =
java.lang.Class<androidx.core.view.ViewCompat$OnUnhandledKeyEventListener=
Wrapper>: java.lang.NoClassDefFoundError: Failed resolution of: =
Landroid/view/View$OnUnhandledKeyEventListener;=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.setContentView(int) =
(AppCompatDelegateImpl.java:466)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.setContentView(int) =
(AppCompatActivity.java:140)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
com.wireguard.android.activity.MainActivity.onCreate(android.os.Bundle) =
(MainActivity.java:74)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.app.Activity.performCreate(android.os.Bundle) =
(Activity.java:7183)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.app.Instrumentation.callActivityOnCreate(android.app.Activity, =
android.os.Bundle) (Instrumentation.java:1220)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2908)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:08:36.487 13764 13764 I zygote64: Caused by: =
java.lang.ClassNotFoundException: Didn't find class =
"android.view.View$OnUnhandledKeyEventListener" on path: =
DexPathList[[zip file =
"/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk"],=
nativeLibraryDirectories=3D[/data/app/com.wireguard.android-ZpU3pfh-wtYZ6=
zCM0NHoLA=3D=3D/lib/arm64, =
/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk!/li=
b/arm64-v8a, /system/lib64, /vendor/lib64]]=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at java.lang.Class =
dalvik.system.BaseDexClassLoader.findClass(java.lang.String) =
(BaseDexClassLoader.java:93)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String, boolean) =
(ClassLoader.java:379)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String) (ClassLoader.java:312)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.setContentView(int) =
(AppCompatDelegateImpl.java:466)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.setContentView(int) =
(AppCompatActivity.java:140)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
com.wireguard.android.activity.MainActivity.onCreate(android.os.Bundle) =
(MainActivity.java:74)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.app.Activity.performCreate(android.os.Bundle) =
(Activity.java:7183)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.app.Instrumentation.callActivityOnCreate(android.app.Activity, =
android.os.Bundle) (Instrumentation.java:1220)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2908)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:08:36.487 13764 13764 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:08:36.487 13764 13764 I zygote64: =0A=
01-18 23:08:36.523 13764 13764 I am_on_resume_called: =
[0,com.wireguard.android.activity.MainActivity,LAUNCH_ACTIVITY]=0A=
01-18 23:08:36.528 13764 13974 D OpenGLRenderer: HWUI GL Pipeline=0A=
01-18 23:08:36.531 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
setView =3D DecorView@414612d[MainActivity] TM=3Dtrue MM=3Dfalse=0A=
--------- beginning of system=0A=
01-18 23:08:36.535 13764 13764 W Activity: AppLock checkAppLockState =
locked:false verifying:false pkgName =3D com.wireguard.android =
isInMultiWindowMode:false=0A=
01-18 23:08:36.537 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
dispatchAttachedToWindow=0A=
01-18 23:08:36.547 13764 13764 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:08:36.547 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
Relayout returned: old=3D[0,0][0,0] new=3D[0,0][1080,2220] result=3D0x7 =
surface=3D{valid=3Dtrue 538616127488} changed=3Dtrue=0A=
01-18 23:08:36.550 13764 13974 I OpenGLRenderer: Initialized EGL, =
version 1.4=0A=
01-18 23:08:36.550 13764 13974 D OpenGLRenderer: Swap behavior 2=0A=
01-18 23:08:36.553 13764 13974 D libGLESv1: STS_GLApi : DTS, ODTC are =
not allowed for Package : com.wireguard.android=0A=
01-18 23:08:36.554 13764 13974 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:08:36.554 13764 13974 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d6fc1dd20=0A=
01-18 23:08:36.560 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
MSG_RESIZED_REPORT: frame=3DRect(0, 0 - 1080, 2220) ci=3DRect(0, 72 - 0, =
144) vi=3DRect(0, 72 - 0, 144) or=3D1=0A=
01-18 23:08:36.560 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:08:36.561 13764 13764 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@8bd2a09 nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:08:36.561 13764 13764 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:08:36.593 13764 13764 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@939231a nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:08:37.483 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:08:37.647 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:08:39.178 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:08:39.275 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:08:39.305 13764 13764 I am_on_paused_called: =
[0,com.wireguard.android.activity.MainActivity,handlePauseActivity]=0A=
01-18 23:08:39.313 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:08:39.422 13764 13974 D OpenGLRenderer: eglDestroySurface =3D =
0x7d6fc1dd20=0A=
01-18 23:08:39.422 13764 13974 D OpenGLRenderer: endAllActiveAnimators =
on 0x7d59954800 (RippleDrawable) with handle 0x7d588b6ac0=0A=
01-18 23:08:39.427 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:08:39.832 13764 13764 I am_on_stop_called: =
[0,com.wireguard.android.activity.MainActivity,handleStopActivity]=0A=
01-18 23:08:40.478 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x1 surface=3D{valid=3Dfalse 0} changed=3Dfalse=0A=
01-18 23:08:40.480 13764 13764 I am_on_resume_called: =
[0,com.wireguard.android.activity.MainActivity,RESUME_ACTIVITY]=0A=
01-18 23:08:40.495 13764 13764 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:08:40.495 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x7 surface=3D{valid=3Dtrue 538616127488} changed=3Dtrue=0A=
01-18 23:08:40.498 13764 13974 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:08:40.498 13764 13974 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d6fc1dd20=0A=
01-18 23:08:40.499 13764 13764 W Activity: AppLock checkAppLockState =
locked:false verifying:false pkgName =3D com.wireguard.android =
isInMultiWindowMode:false=0A=
01-18 23:08:40.499 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:08:40.499 13764 13764 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@5524235 nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:08:40.499 13764 13764 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:08:43.387 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:08:43.542 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:08:44.798 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:08:44.903 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:08:44.933 13764 13764 I am_on_paused_called: =
[0,com.wireguard.android.activity.MainActivity,handlePauseActivity]=0A=
01-18 23:08:44.954 13764 13764 D ScrollView: initGoToTop=0A=
01-18 23:08:44.969 13764 13764 I am_on_resume_called: =
[0,com.wireguard.android.activity.TunnelCreatorActivity,LAUNCH_ACTIVITY]=0A=
01-18 23:08:44.973 13764 13764 D =
ViewRootImpl@3c18ea[TunnelCreatorActivity]: setView =3D =
DecorView@82a17db[TunnelCreatorActivity] TM=3Dtrue MM=3Dfalse=0A=
01-18 23:08:44.974 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:08:44.977 13764 13769 I zygote64: Do partial code cache =
collection, code=3D28KB, data=3D25KB=0A=
01-18 23:08:44.977 13764 13769 I zygote64: After code cache collection, =
code=3D28KB, data=3D25KB=0A=
01-18 23:08:44.977 13764 13769 I zygote64: Increasing code cache =
capacity to 128KB=0A=
01-18 23:08:44.980 13764 13764 D =
ViewRootImpl@3c18ea[TunnelCreatorActivity]: dispatchAttachedToWindow=0A=
01-18 23:08:44.989 13764 13764 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:08:44.989 13764 13764 D =
ViewRootImpl@3c18ea[TunnelCreatorActivity]: Relayout returned: =
old=3D[0,0][0,0] new=3D[0,0][1080,2220] result=3D0x7 =
surface=3D{valid=3Dtrue 538157158400} changed=3Dtrue=0A=
01-18 23:08:44.991 13764 13974 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:08:44.991 13764 13974 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d6fc1f850=0A=
01-18 23:08:44.992 13764 13764 D ScrollView:  onsize change changed =0A=
01-18 23:08:44.999 13764 13764 W Activity: AppLock checkAppLockState =
locked:false verifying:false pkgName =3D com.wireguard.android =
isInMultiWindowMode:false=0A=
01-18 23:08:45.003 13764 13764 I zygote64: Deoptimizing void =
androidx.appcompat.widget.AppCompatTextHelper.updateTypefaceAndStyle(andr=
oid.content.Context, androidx.appcompat.widget.TintTypedArray) due to =
JIT inline cache=0A=
01-18 23:08:45.092 13764 13764 D =
ViewRootImpl@3c18ea[TunnelCreatorActivity]: MSG_RESIZED_REPORT: =
frame=3DRect(0, 0 - 1080, 2220) ci=3DRect(0, 72 - 0, 144) vi=3DRect(0, =
72 - 0, 144) or=3D1=0A=
01-18 23:08:45.092 13764 13764 D =
ViewRootImpl@3c18ea[TunnelCreatorActivity]: MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:08:45.103 13764 13974 I OpenGLRenderer: prepareTree =
mLayerUpdateQueue is not empty, size =3D 1=0A=
01-18 23:08:45.103 13764 13974 I OpenGLRenderer: name =3D =
LabeledFloatingActionButton, size (120, 120)=0A=
01-18 23:08:45.116 13764 13764 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@ee811ae nm : =
com.wireguard.android =
ic=3Dcom.android.internal.widget.EditableInputConnection@8c6bb4f=0A=
01-18 23:08:45.116 13764 13764 V InputMethodManager: =
getMaxLengthForEditText InputFilter =3D java.lang.NoSuchMethodException: =
getMaxLength []=0A=
01-18 23:08:45.117 13764 13764 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:08:45.126 13764 13764 W View    : =
dispatchProvideAutofillStructure(): not laid out, ignoring=0A=
01-18 23:08:45.128 13764 13764 I AssistStructure: Flattened final assist =
data: 7064 bytes, containing 1 windows, 26 views=0A=
01-18 23:08:45.134 13764 13974 D OpenGLRenderer: eglDestroySurface =3D =
0x7d6fc1dd20=0A=
01-18 23:08:45.134 13764 13974 I OpenGLRenderer: destroy =
mLayerUpdateQueue is not empty, size =3D 1=0A=
01-18 23:08:45.134 13764 13974 I OpenGLRenderer: name =3D =
LabeledFloatingActionButton, size (120, 120)=0A=
01-18 23:08:45.134 13764 13974 D OpenGLRenderer: endAllActiveAnimators =
on 0x7d59955000 (RippleDrawable) with handle 0x7d67e83f20=0A=
01-18 23:08:45.137 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:08:45.419 13764 13764 D =
ViewRootImpl@3c18ea[TunnelCreatorActivity]: MSG_RESIZED: frame=3DRect(0, =
0 - 1080, 2220) ci=3DRect(0, 72 - 0, 891) vi=3DRect(0, 72 - 0, 891) =
or=3D1=0A=
01-18 23:08:45.440 13764 13764 D =
ViewRootImpl@3c18ea[TunnelCreatorActivity]: Relayout returned: =
old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] result=3D0x1 =
surface=3D{valid=3Dtrue 538157158400} changed=3Dfalse=0A=
01-18 23:08:45.441 13764 13764 D ScrollView:  onsize change changed =0A=
01-18 23:08:45.505 13764 13764 I am_on_stop_called: =
[0,com.wireguard.android.activity.MainActivity,handleStopActivity]=0A=
01-18 23:08:46.892 13764 13764 D =
ViewRootImpl@3c18ea[TunnelCreatorActivity]: The input has been finished =
in ImeInputStage.=0A=
01-18 23:08:46.978 13764 13764 D =
ViewRootImpl@3c18ea[TunnelCreatorActivity]: The input has been finished =
in ImeInputStage.=0A=
01-18 23:08:47.019 13764 13764 D =
ViewRootImpl@3c18ea[TunnelCreatorActivity]: MSG_RESIZED: frame=3DRect(0, =
0 - 1080, 2220) ci=3DRect(0, 72 - 0, 144) vi=3DRect(0, 72 - 0, 144) =
or=3D1=0A=
01-18 23:08:47.026 13764 13764 D =
ViewRootImpl@3c18ea[TunnelCreatorActivity]: Relayout returned: =
old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] result=3D0x1 =
surface=3D{valid=3Dtrue 538157158400} changed=3Dfalse=0A=
01-18 23:08:47.029 13764 13764 D ScrollView:  onsize change changed =0A=
01-18 23:08:47.620 13764 13764 D =
ViewRootImpl@3c18ea[TunnelCreatorActivity]: ViewPostIme key 0=0A=
01-18 23:08:47.775 13764 13764 D =
ViewRootImpl@3c18ea[TunnelCreatorActivity]: ViewPostIme key 1=0A=
01-18 23:08:47.783 13764 13764 I am_on_paused_called: =
[0,com.wireguard.android.activity.TunnelCreatorActivity,handlePauseActivi=
ty]=0A=
01-18 23:08:47.794 13764 13764 D =
ViewRootImpl@3c18ea[TunnelCreatorActivity]: MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:08:47.798 13764 13764 I am_on_resume_called: =
[0,com.wireguard.android.activity.MainActivity,RESUME_ACTIVITY]=0A=
01-18 23:08:47.812 13764 13764 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:08:47.812 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x7 surface=3D{valid=3Dtrue 538616127488} changed=3Dtrue=0A=
01-18 23:08:47.814 13764 13974 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:08:47.814 13764 13974 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d598dd0c0=0A=
01-18 23:08:47.815 13764 13764 W Activity: AppLock checkAppLockState =
locked:false verifying:false pkgName =3D com.wireguard.android =
isInMultiWindowMode:false=0A=
01-18 23:08:47.815 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:08:47.816 13764 13764 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@66935 nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:08:47.816 13764 13764 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:08:47.823 13764 13974 I OpenGLRenderer: prepareTree =
mLayerUpdateQueue is not empty, size =3D 1=0A=
01-18 23:08:47.823 13764 13974 I OpenGLRenderer: name =3D =
LabeledFloatingActionButton, size (120, 120)=0A=
01-18 23:08:47.840 13764 13974 D OpenGLRenderer: eglDestroySurface =3D =
0x7d6fc1f850=0A=
01-18 23:08:47.844 13764 13764 D =
ViewRootImpl@3c18ea[TunnelCreatorActivity]: Relayout returned: =
old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] result=3D0x5 =
surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:08:48.249 13764 13764 I am_on_stop_called: =
[0,com.wireguard.android.activity.TunnelCreatorActivity,destroy]=0A=
01-18 23:08:48.270 13764 13764 D =
ViewRootImpl@3c18ea[TunnelCreatorActivity]: dispatchDetachedFromWindow=0A=
01-18 23:08:48.270 13764 13764 D InputEventReceiver: channel 'bef60ab =
com.wireguard.android/com.wireguard.android.activity.TunnelCreatorActivit=
y (client)' ~ Disposing input event receiver.=0A=
01-18 23:08:48.270 13764 13764 D InputEventReceiver: channel 'bef60ab =
com.wireguard.android/com.wireguard.android.activity.TunnelCreatorActivit=
y (client)' ~NativeInputEventReceiver.=0A=
01-18 23:08:48.747 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:08:48.904 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:08:52.499 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:08:52.661 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:08:52.684 13764 13764 I am_on_paused_called: =
[0,com.wireguard.android.activity.MainActivity,handlePauseActivity]=0A=
01-18 23:08:52.698 13764 13764 I DecodeHintManager: Hints from the =
Intent: {}=0A=
01-18 23:08:52.721 13764 13764 I am_on_resume_called: =
[0,com.journeyapps.barcodescanner.CaptureActivity,LAUNCH_ACTIVITY]=0A=
01-18 23:08:52.723 13764 13764 D ViewRootImpl@4da2588[CaptureActivity]: =
setView =3D DecorView@7819b21[CaptureActivity] TM=3Dtrue MM=3Dfalse=0A=
01-18 23:08:52.723 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:08:52.724 13764 13764 D ViewRootImpl@4da2588[CaptureActivity]: =
dispatchAttachedToWindow=0A=
01-18 23:08:52.730 13764 13764 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:08:52.730 13764 13764 D ViewRootImpl@4da2588[CaptureActivity]: =
Relayout returned: old=3D[0,0][0,0] new=3D[0,0][1080,2076] result=3D0x7 =
surface=3D{valid=3Dtrue 538157740032} changed=3Dtrue=0A=
01-18 23:08:52.732 13764 13974 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2076]-format:1=0A=
01-18 23:08:52.732 13764 13974 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d6fc1dd20=0A=
01-18 23:08:52.735 13764 13764 D SurfaceView: BG show() =
Surface(name=3DBackground for - SurfaceView - =
com.wireguard.android/com.journeyapps.barcodescanner.CaptureActivity@bf94=
b46@0) android.view.SurfaceView{bf94b46 V.E...... ......ID 0,0-1080,2076}=0A=
01-18 23:08:52.749 13764 13764 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:08:52.749 13764 13764 D SurfaceView: surfaceCreated 1 =
android.view.SurfaceView{bf94b46 V.E...... ......ID 0,0-1080,2076}=0A=
01-18 23:08:52.749 13764 13764 D SurfaceView: surfaceChanged (1080,2076) =
1 android.view.SurfaceView{bf94b46 V.E...... ......ID 0,0-1080,2076}=0A=
01-18 23:08:52.750 13764 13764 D CameraPreview: pause()=0A=
01-18 23:08:52.750 13764 13764 I am_on_paused_called: =
[0,com.journeyapps.barcodescanner.CaptureActivity,handlePauseActivity]=0A=
01-18 23:08:52.764 13764 13764 W Activity: AppLock checkAppLockState =
locked:false verifying:false pkgName =3D com.wireguard.android =
isInMultiWindowMode:false=0A=
01-18 23:08:52.764 13764 13764 D ViewRootImpl@4da2588[CaptureActivity]: =
MSG_RESIZED_REPORT: frame=3DRect(0, 0 - 1080, 2076) ci=3DRect(0, 0 - 0, =
0) vi=3DRect(0, 72 - 0, 0) or=3D1=0A=
01-18 23:08:52.764 13764 13764 D ViewRootImpl@4da2588[CaptureActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:08:52.764 13764 13764 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@c389107 nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:08:52.764 13764 13764 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:08:52.768 13764 13764 D ViewRootImpl@4da2588[CaptureActivity]: =
Relayout returned: old=3D[0,0][1080,2076] new=3D[0,0][1080,2076] =
result=3D0x3 surface=3D{valid=3Dtrue 538157740032} changed=3Dfalse=0A=
01-18 23:08:52.786 13764 13764 D ViewRootImpl@4da2588[CaptureActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:08:52.933 13764 13974 D OpenGLRenderer: eglDestroySurface =3D =
0x7d598dd0c0=0A=
01-18 23:08:52.933 13764 13974 D OpenGLRenderer: endAllActiveAnimators =
on 0x7d59954c00 (RippleDrawable) with handle 0x7d5887fc60=0A=
01-18 23:08:52.937 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:08:52.944 13764 13764 D ViewRootImpl@4da2588[CaptureActivity]: =
MSG_RESIZED: frame=3DRect(0, 0 - 1080, 2076) ci=3DRect(0, 0 - 0, 0) =
vi=3DRect(0, 0 - 0, 0) or=3D1=0A=
01-18 23:08:53.340 13764 13764 I am_on_stop_called: =
[0,com.wireguard.android.activity.MainActivity,handleStopActivity]=0A=
01-18 23:08:54.241 13764 13764 D ViewRootImpl@4da2588[CaptureActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:08:54.242 13764 13764 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@2b01234 nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:08:54.242 13764 13764 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:08:54.245 13764 13764 D CameraPreview: resume()=0A=
01-18 23:08:54.246 13764 14114 D CameraInstance: Opening camera=0A=
01-18 23:08:54.265 13764 13764 D SensorManager: registerListener :: 1, =
LSM6DSL Acceleration Sensor, 200000, 0,  =0A=
01-18 23:08:54.267 13764 13764 D CameraPreview: resume()=0A=
01-18 23:08:54.267 13764 13764 W CameraPreview: initCamera called twice=0A=
01-18 23:08:54.270 13764 13764 D SensorManager: unregisterListener ::   =0A=
01-18 23:08:54.275 13764 13764 D SensorManager: registerListener :: 1, =
LSM6DSL Acceleration Sensor, 200000, 0,  =0A=
01-18 23:08:54.276 13764 13764 I am_on_resume_called: =
[0,com.journeyapps.barcodescanner.CaptureActivity,RESUME_ACTIVITY]=0A=
01-18 23:08:54.278 13764 13764 W Activity: AppLock checkAppLockState =
locked:false verifying:false pkgName =3D com.wireguard.android =
isInMultiWindowMode:false=0A=
01-18 23:08:54.360 13764 14114 D CameraInstance: Configuring camera=0A=
01-18 23:08:54.360 13764 14114 I CameraManager: Camera Display =
Orientation: 90=0A=
01-18 23:08:54.361 13764 14114 I CameraManager: Initial camera =
parameters: =
preview-size=3D1920x1080;video-size=3D1920x1080;preferred-preview-size-fo=
r-video=3D1920x1080;preview-size-values=3D1920x1080,1440x1080,1088x1088,1=
280x720,1056x704,1024x768,960x720,800x450,720x720,720x480,640x480,352x288=
,320x240,256x144,176x144;video-size-values=3D3840x2160,3264x1836,2880x216=
0,2560x1440,2160x2160,2048x1152,1920x1080,1440x1080,1088x1088,1280x720,10=
56x704,1024x768,960x720,800x450,720x720,720x480,640x480,352x288,320x240,2=
56x144,176x144;preview-format=3Dyuv420sp;preview-format-values=3Dyuv420p,=
yuv420sp;preview-frame-rate=3D30;preview-fps-range=3D7000,30000;preview-f=
ps-range-values=3D(15000,15000),(10000,24000),(24000,24000),(7000,30000),=
(10000,30000),(15000,30000),(30000,30000);preview-frame-rate-values=3D15,=
24,30;picture-size=3D4032x3024;picture-size-values=3D4032x3024,4032x2268,=
3024x3024,3984x2988,3840x2160,3264x2448,3264x1836,2976x2976,2880x2160,256=
0x1440,2160x2160,2048x1152,1920x1080,1440x1080,1088x1088,1280x720,1056x70=
4,1024x768,960x720,800x450,720x720,720x480,640x480,352x288,320x240;pictur=
e-format=3Djpeg;picture-format-values=3Djpeg;jpeg-thumbnail-width=3D512;j=
peg-thumbnail-height=3D384;jpeg-thumbnail-size-values=3D0x0,384x384,512x2=
88,512x384;jpeg-thumbnail-quality=3D90;jpeg-quality=3D90;rotation=3D0;whi=
tebalance=3Dauto;whitebalance-values=3Dauto,incandescent,fluorescent,dayl=
ight,cloudy-daylight;effect=3Dnone;effect-values=3Dnone,mono,negative,sep=
ia,posterize,aqua;antibanding=3Dauto;antibanding-values=3Doff,auto;flash-=
mode=3Doff;flash-mode-values=3Doff,auto,on,torch;focus-mode=3Dauto;focus-=
mode-values=3Dinfinity,auto,continuous-video,continuous-picture;max-num-f=
ocus-areas=3D1;focus-areas=3D(0,0,0,0,0);focal-length=3D4.3;horizontal-vi=
ew-angle=3D66.5614;vertical-view-angle=3D52.4244;exposure-compensation=3D=
0;max-exposure-compensation=3D20;min-exposure-compensation=3D-20;exposure=
-compensation-step=3D0.1;auto-exposure-lock=3Dfalse;auto-exposure-lock-su=
pported=3Dtrue;auto-whitebalance-lock=3Dfalse;auto-whitebalance-lock-supp=
orted=3Dtrue;max-num-metering-areas=3D1;metering-areas=3D(0,0,0,0,0);zoom=
=3D0;max-zoom=3D99;zoom-ratios=3D100,107,114,121,128,135,142,149,156,163,=
170,177,184,191,198,206,213,220,227,234,241,248,255,262,269,276,283,290,2=
97,305,312,319,326,333,340,347,354,361,368,375,382,389,396,404,411,418,42=
5,432,439,446,453,460,467,474,481,488,495,503,510,517,524,531,538,545,552=
,559,566,573,580,587,594,602,609,616,623,630,637,644,651,658,665,672,679,=
686,693,701,708,715,722,729,736,743,750,757,764,771,778,785,792,799;zoom-=
supported=3Dtrue;smooth-zoom-supported=3Dfalse;focus-distances=3DInfinity=
,Infinity,Infinity;max-num-detected-faces-hw=3D16;max-num-detected-faces-=
sw=3D0;video-frame-format=3Dandroid-opaque;recording-hint=3Dfalse;video-s=
tabilization=3Dfalse;video-stabilization-supported=3Dfalse;video-snapshot=
-supported=3Dfalse=0A=
01-18 23:08:54.361 13764 14114 I CameraConfiguration: Requesting focus =
mode value from among: [auto]=0A=
01-18 23:08:54.361 13764 14114 I CameraConfiguration: Supported focus =
mode values: [infinity, auto, continuous-video, continuous-picture]=0A=
01-18 23:08:54.361 13764 14114 I CameraConfiguration: Can set focus mode =
to: auto=0A=
01-18 23:08:54.361 13764 14114 I CameraConfiguration: Focus mode already =
set to auto=0A=
01-18 23:08:54.361 13764 14114 I CameraConfiguration: Requesting flash =
mode value from among: [off]=0A=
01-18 23:08:54.361 13764 14114 I CameraConfiguration: Supported flash =
mode values: [off, auto, on, torch]=0A=
01-18 23:08:54.362 13764 14114 I CameraConfiguration: Can set flash mode =
to: off=0A=
01-18 23:08:54.362 13764 14114 I CameraConfiguration: Flash mode already =
set to off=0A=
01-18 23:08:54.362 13764 14114 I PreviewScalingStrategy: Viewfinder =
size: 2076x1080=0A=
01-18 23:08:54.362 13764 14114 I PreviewScalingStrategy: Preview in =
order of preference: [1920x1080, 1280x720, 1440x1080, 1056x704, 800x450, =
1024x768, 960x720, 720x480, 1088x1088, 640x480, 720x720, 256x144, =
352x288, 320x240, 176x144]=0A=
01-18 23:08:54.362 13764 14114 I CameraManager: Final camera parameters: =
video-size=3D1920x1080;preferred-preview-size-for-video=3D1920x1080;previ=
ew-size-values=3D1920x1080,1440x1080,1088x1088,1280x720,1056x704,1024x768=
,960x720,800x450,720x720,720x480,640x480,352x288,320x240,256x144,176x144;=
video-size-values=3D3840x2160,3264x1836,2880x2160,2560x1440,2160x2160,204=
8x1152,1920x1080,1440x1080,1088x1088,1280x720,1056x704,1024x768,960x720,8=
00x450,720x720,720x480,640x480,352x288,320x240,256x144,176x144;preview-fo=
rmat=3Dyuv420sp;preview-format-values=3Dyuv420p,yuv420sp;preview-frame-ra=
te=3D30;preview-fps-range=3D7000,30000;preview-fps-range-values=3D(15000,=
15000),(10000,24000),(24000,24000),(7000,30000),(10000,30000),(15000,3000=
0),(30000,30000);preview-frame-rate-values=3D15,24,30;picture-size=3D4032=
x3024;picture-size-values=3D4032x3024,4032x2268,3024x3024,3984x2988,3840x=
2160,3264x2448,3264x1836,2976x2976,2880x2160,2560x1440,2160x2160,2048x115=
2,1920x1080,1440x1080,1088x1088,1280x720,1056x704,1024x768,960x720,800x45=
0,720x720,720x480,640x480,352x288,320x240;picture-format=3Djpeg;picture-f=
ormat-values=3Djpeg;jpeg-thumbnail-width=3D512;jpeg-thumbnail-height=3D38=
4;jpeg-thumbnail-size-values=3D0x0,384x384,512x288,512x384;jpeg-thumbnail=
-quality=3D90;jpeg-quality=3D90;rotation=3D0;whitebalance=3Dauto;whitebal=
ance-values=3Dauto,incandescent,fluorescent,daylight,cloudy-daylight;effe=
ct=3Dnone;effect-values=3Dnone,mono,negative,sepia,posterize,aqua;antiban=
ding=3Dauto;antibanding-values=3Doff,auto;flash-mode=3Doff;flash-mode-val=
ues=3Doff,auto,on,torch;focus-mode=3Dauto;focus-mode-values=3Dinfinity,au=
to,continuous-video,continuous-picture;max-num-focus-areas=3D1;focus-area=
s=3D(0,0,0,0,0);focal-length=3D4.3;horizontal-view-angle=3D66.5614;vertic=
al-view-angle=3D52.4244;exposure-compensation=3D0;max-exposure-compensati=
on=3D20;min-exposure-compensation=3D-20;exposure-compensation-step=3D0.1;=
auto-exposure-lock=3Dfalse;auto-exposure-lock-supported=3Dtrue;auto-white=
balance-lock=3Dfalse;auto-whitebalance-lock-supported=3Dtrue;max-num-mete=
ring-areas=3D1;metering-areas=3D(0,0,0,0,0);zoom=3D0;max-zoom=3D99;zoom-r=
atios=3D100,107,114,121,128,135,142,149,156,163,170,177,184,191,198,206,2=
13,220,227,234,241,248,255,262,269,276,283,290,297,305,312,319,326,333,34=
0,347,354,361,368,375,382,389,396,404,411,418,425,432,439,446,453,460,467=
,474,481,488,495,503,510,517,524,531,538,545,552,559,566,573,580,587,594,=
602,609,616,623,630,637,644,651,658,665,672,679,686,693,701,708,715,722,7=
29,736,743,750,757,764,771,778,785,792,799;zoom-supported=3Dtrue;smooth-z=
oom-supported=3Dfalse;focus-distances=3DInfinity,Infinity,Infinity;max-nu=
m-detected-faces-hw=3D16;max-num-detected-faces-sw=3D0;video-frame-format=
=3Dandroid-opaque;recording-hint=3Dfalse;video-stabilization=3Dfalse;vide=
o-stabilization-supported=3Dfalse;video-snapshot-supported=3Dfalse;previe=
w-size=3D1920x1080=0A=
01-18 23:08:54.365 13764 13764 I CenterCropStrategy: Preview: 1080x1920; =
Scaled: 1167x2076; Want: 1080x2076=0A=
01-18 23:08:54.369 13764 13764 D SurfaceView: BG show() =
Surface(name=3DBackground for - SurfaceView - =
com.wireguard.android/com.journeyapps.barcodescanner.CaptureActivity@bf94=
b46@0) android.view.SurfaceView{bf94b46 V.E...... ......ID =
-43,0-1124,2076}=0A=
01-18 23:08:54.386 13764 13764 D SurfaceView: surfaceChanged (1167,2076) =
1 android.view.SurfaceView{bf94b46 V.E...... ......ID -43,0-1124,2076}=0A=
01-18 23:08:54.386 13764 13764 I CameraPreview: Starting preview=0A=
01-18 23:08:54.386 13764 14114 D CameraInstance: Starting preview=0A=
01-18 23:08:54.409 13764 13764 D ViewRootImpl@4da2588[CaptureActivity]: =
Relayout returned: old=3D[0,0][1080,2076] new=3D[0,0][1080,2076] =
result=3D0x1 surface=3D{valid=3Dtrue 538157740032} changed=3Dfalse=0A=
01-18 23:08:54.487 13764 14114 I AutoFocusManager: Current focus mode =
'auto'; use auto focus? true=0A=
01-18 23:08:55.158 13764 13769 I zygote64: Do partial code cache =
collection, code=3D58KB, data=3D46KB=0A=
01-18 23:08:55.159 13764 13769 I zygote64: After code cache collection, =
code=3D55KB, data=3D45KB=0A=
01-18 23:08:55.159 13764 13769 I zygote64: Increasing code cache =
capacity to 256KB=0A=
01-18 23:08:55.971 13764 13774 I zygote64: Background concurrent copying =
GC freed 2534(260KB) AllocSpace objects, 8(11MB) LOS objects, 49% free, =
6MB/13MB, paused 7.101ms total 37.262ms=0A=
01-18 23:08:56.298 13764 13774 I zygote64: Background concurrent copying =
GC freed 782(160KB) AllocSpace objects, 8(11MB) LOS objects, 49% free, =
6MB/13MB, paused 6.507ms total 45.591ms=0A=
01-18 23:08:56.458 13764 13774 I zygote64: Background concurrent copying =
GC freed 729(160KB) AllocSpace objects, 8(11MB) LOS objects, 49% free, =
7MB/14MB, paused 6.791ms total 44.878ms=0A=
01-18 23:08:57.099 13764 13774 I zygote64: Background concurrent copying =
GC freed 486(144KB) AllocSpace objects, 8(11MB) LOS objects, 50% free, =
6MB/13MB, paused 5.469ms total 38.786ms=0A=
01-18 23:08:57.338 13764 13774 I zygote64: Background concurrent copying =
GC freed 730(160KB) AllocSpace objects, 8(11MB) LOS objects, 49% free, =
6MB/13MB, paused 6.493ms total 43.505ms=0A=
01-18 23:08:57.537 13764 13774 I zygote64: Background concurrent copying =
GC freed 732(160KB) AllocSpace objects, 8(11MB) LOS objects, 49% free, =
6MB/13MB, paused 5.147ms total 38.135ms=0A=
01-18 23:08:57.778 13764 13774 I zygote64: Background concurrent copying =
GC freed 729(160KB) AllocSpace objects, 8(11MB) LOS objects, 49% free, =
6MB/13MB, paused 5.472ms total 43.399ms=0A=
01-18 23:08:57.989 13764 13774 I zygote64: Background concurrent copying =
GC freed 729(160KB) AllocSpace objects, 8(11MB) LOS objects, 49% free, =
7MB/14MB, paused 5.932ms total 50.462ms=0A=
01-18 23:08:58.140 13764 13774 I zygote64: Background concurrent copying =
GC freed 729(160KB) AllocSpace objects, 8(11MB) LOS objects, 49% free, =
7MB/14MB, paused 6.471ms total 49.956ms=0A=
01-18 23:08:58.295 13764 13774 I zygote64: Background concurrent copying =
GC freed 726(160KB) AllocSpace objects, 8(11MB) LOS objects, 49% free, =
7MB/14MB, paused 6.266ms total 44.326ms=0A=
01-18 23:08:58.454 13764 13774 I zygote64: Background concurrent copying =
GC freed 729(160KB) AllocSpace objects, 8(11MB) LOS objects, 49% free, =
7MB/14MB, paused 5.592ms total 45.242ms=0A=
01-18 23:08:58.465 13764 13764 D ViewRootImpl@4da2588[CaptureActivity]: =
ViewPostIme key 0=0A=
01-18 23:08:58.608 13764 13764 D ViewRootImpl@4da2588[CaptureActivity]: =
ViewPostIme key 1=0A=
01-18 23:08:58.619 13764 13764 D CameraPreview: pause()=0A=
01-18 23:08:58.619 13764 14114 D CameraInstance: Closing camera=0A=
01-18 23:08:58.624 13764 13764 D SensorManager: unregisterListener ::   =0A=
01-18 23:08:58.859 13764 13764 I am_on_paused_called: =
[0,com.journeyapps.barcodescanner.CaptureActivity,handlePauseActivity]=0A=
01-18 23:08:58.884 13764 13764 D CameraInstance: Camera is closed, not =
requesting preview=0A=
01-18 23:08:58.885 13764 13764 D ViewRootImpl@4da2588[CaptureActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:08:58.886 13764 13764 I am_on_resume_called: =
[0,com.wireguard.android.activity.MainActivity,RESUME_ACTIVITY]=0A=
01-18 23:08:58.906 13764 13764 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:08:58.906 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x7 surface=3D{valid=3Dtrue 538372931584} changed=3Dtrue=0A=
01-18 23:08:58.908 13764 13974 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:08:58.908 13764 13974 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d6fc1f8a0=0A=
01-18 23:08:58.909 13764 13764 W Activity: AppLock checkAppLockState =
locked:false verifying:false pkgName =3D com.wireguard.android =
isInMultiWindowMode:false=0A=
01-18 23:08:58.909 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:08:58.909 13764 13764 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@2561da0 nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:08:58.909 13764 13764 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:08:58.930 13764 13764 D SurfaceView: BG show() =
Surface(name=3DBackground for - SurfaceView - =
com.wireguard.android/com.journeyapps.barcodescanner.CaptureActivity@bf94=
b46@0) android.view.SurfaceView{bf94b46 V.E...... ........ =
-43,0-1124,2076}=0A=
01-18 23:08:58.930 13764 13764 D SurfaceView: surfaceDestroyed 1 =
android.view.SurfaceView{bf94b46 V.E...... ........ -43,0-1124,2076}=0A=
01-18 23:08:58.931 13764 13764 D SurfaceView: BG destroy() =
Surface(name=3DBackground for - SurfaceView - =
com.wireguard.android/com.journeyapps.barcodescanner.CaptureActivity@bf94=
b46@0) android.view.SurfaceView{bf94b46 V.E...... ........ =
-43,0-1124,2076}=0A=
01-18 23:08:58.932 13764 13974 D OpenGLRenderer: eglDestroySurface =3D =
0x7d6fc1dd20=0A=
01-18 23:08:58.936 13764 13764 D ViewRootImpl@4da2588[CaptureActivity]: =
Relayout returned: old=3D[0,0][1080,2076] new=3D[0,0][1080,2076] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:08:59.384 13764 13764 I am_on_stop_called: =
[0,com.journeyapps.barcodescanner.CaptureActivity,destroy]=0A=
01-18 23:08:59.387 13764 13764 D ViewRootImpl@4da2588[CaptureActivity]: =
dispatchDetachedFromWindow=0A=
01-18 23:08:59.388 13764 13764 D InputEventReceiver: channel '266f9ba =
com.wireguard.android/com.journeyapps.barcodescanner.CaptureActivity =
(client)' ~ Disposing input event receiver.=0A=
01-18 23:08:59.388 13764 13764 D InputEventReceiver: channel '266f9ba =
com.wireguard.android/com.journeyapps.barcodescanner.CaptureActivity =
(client)' ~NativeInputEventReceiver.=0A=
01-18 23:09:01.077 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:09:01.199 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:09:01.199 13764 13764 I menu_item_selected: [0,Settings]=0A=
01-18 23:09:01.214 13764 13764 I am_on_paused_called: =
[0,com.wireguard.android.activity.MainActivity,handlePauseActivity]=0A=
01-18 23:09:01.238 13764 13764 I am_on_resume_called: =
[0,com.wireguard.android.activity.SettingsActivity,LAUNCH_ACTIVITY]=0A=
01-18 23:09:01.241 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
setView =3D DecorView@9d4e27e[SettingsActivity] TM=3Dtrue MM=3Dfalse=0A=
01-18 23:09:01.242 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:09:01.243 13764 13764 V InputMethodManager: Not IME target =
window, ignoring=0A=
01-18 23:09:01.243 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
dispatchAttachedToWindow=0A=
01-18 23:09:01.249 13764 13764 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:09:01.249 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
Relayout returned: old=3D[0,0][0,0] new=3D[0,0][1080,2220] result=3D0x7 =
surface=3D{valid=3Dtrue 538158014464} changed=3Dtrue=0A=
01-18 23:09:01.250 13764 13974 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:09:01.250 13764 13974 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d6fc1dd20=0A=
01-18 23:09:01.270 13764 13764 W Activity: AppLock checkAppLockState =
locked:false verifying:false pkgName =3D com.wireguard.android =
isInMultiWindowMode:false=0A=
01-18 23:09:01.271 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
MSG_RESIZED_REPORT: frame=3DRect(0, 0 - 1080, 2220) ci=3DRect(0, 72 - 0, =
144) vi=3DRect(0, 72 - 0, 144) or=3D1=0A=
01-18 23:09:01.271 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:09:01.272 13764 13764 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@b765c2f nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:09:01.272 13764 13764 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:09:01.303 13764 13974 D OpenGLRenderer: eglDestroySurface =3D =
0x7d6fc1f8a0=0A=
01-18 23:09:01.303 13764 13974 D OpenGLRenderer: endAllActiveAnimators =
on 0x7d59956800 (RippleDrawable) with handle 0x7d5887f7a0=0A=
01-18 23:09:01.306 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:09:01.692 13764 13764 I am_on_stop_called: =
[0,com.wireguard.android.activity.MainActivity,handleStopActivity]=0A=
01-18 23:09:09.208 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:09:09.291 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:09:09.318 13764 13764 I am_on_paused_called: =
[0,com.wireguard.android.activity.SettingsActivity,handlePauseActivity]=0A=
01-18 23:09:09.325 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:09:10.621 13764 13783 W WireGuard/RootShell: Root check did not =
return correct UID: null=0A=
01-18 23:09:10.622 13764 13785 W zygote64: Long monitor contention with =
owner AsyncTask #2 (13783) at int =
libcore.io.Linux.readBytes(java.io.FileDescriptor, java.lang.Object, =
int, int)(Linux.java:-2) waiters=3D0 in void =
java.lang.UNIXProcess$ProcessPipeInputStream.processExited() for 437ms=0A=
01-18 23:09:10.622 13764 13785 I dvm_lock_sample: =
[com.wireguard.android,0,process =
reaper,437,UNIXProcess.java,-1,Linux.java,-2,87]=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: Unable to =
import tunnel: Tunnel =E2=80=9Cmariobrocatousa=E2=80=9D already exists=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: =
java9.util.concurrent.CompletionException: =
java.lang.IllegalArgumentException: Tunnel =
=E2=80=9Cmariobrocatousa=E2=80=9D already exists=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
java9.util.concurrent.CompletableFuture.reportJoin(CompletableFuture.java=
:403)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
java9.util.concurrent.CompletableFuture.getNow(CompletableFuture.java:205=
2)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.fragment.TunnelListFragment.lambda$null$1(TunnelLis=
tFragment.java:177)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.fragment.-$$Lambda$TunnelListFragment$8xg1FnWGiJ3-S=
s2OewtP3mhABxo.accept(Unknown Source:10)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
java9.util.concurrent.CompletableFuture.uniWhenComplete(CompletableFuture=
.java:848)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
java9.util.concurrent.CompletableFuture.uniWhenCompleteStage(CompletableF=
uture.java:873)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
java9.util.concurrent.CompletableFuture.whenComplete(CompletableFuture.ja=
va:2242)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.fragment.TunnelListFragment.lambda$importTunnel$2(T=
unnelListFragment.java:172)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.fragment.-$$Lambda$TunnelListFragment$w2gE-dixaCGvN=
ZH2W1rvuopRuZQ.accept(Unknown Source:10)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
java9.util.concurrent.CompletableFuture.uniWhenComplete(CompletableFuture=
.java:848)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
java9.util.concurrent.CompletableFuture$UniWhenComplete.tryFire(Completab=
leFuture.java:825)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
java9.util.concurrent.CompletableFuture.postComplete(CompletableFuture.ja=
va:504)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
java9.util.concurrent.CompletableFuture.complete(CompletableFuture.java:2=
065)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.util.AsyncWorker.lambda$null$3(AsyncWorker.java:46)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.util.-$$Lambda$AsyncWorker$IcRxFMjG2f4ymEMel6a--8uy=
RtU.run(Unknown Source:4)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
android.os.Handler.handleCallback(Handler.java:789)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
android.os.Handler.dispatchMessage(Handler.java:98)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
android.os.Looper.loop(Looper.java:164)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
android.app.ActivityThread.main(ActivityThread.java:6938)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
java.lang.reflect.Method.invoke(Native Method)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
com.android.internal.os.Zygote$MethodAndArgsCaller.run(Zygote.java:327)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
com.android.internal.os.ZygoteInit.main(ZygoteInit.java:1374)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: Caused =
by: java.lang.IllegalArgumentException: Tunnel =
=E2=80=9Cmariobrocatousa=E2=80=9D already exists=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.model.TunnelManager.create(TunnelManager.java:81)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.fragment.TunnelListFragment.lambda$importTunnel$0(T=
unnelListFragment.java:156)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.fragment.-$$Lambda$TunnelListFragment$jKQSIed0Jzvlm=
akG8NjJ4Ld0_NA.get(Unknown Source:10)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.util.AsyncWorker.lambda$supplyAsync$5(AsyncWorker.j=
ava:45)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
com.wireguard.android.util.-$$Lambda$AsyncWorker$wP6ZO_lwMWxn1CVpUfnLV0bf=
A18.run(Unknown Source:6)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
android.os.AsyncTask$SerialExecutor$1.run(AsyncTask.java:245)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java=
:1162)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.jav=
a:636)=0A=
01-18 23:09:10.674 13764 13764 E WireGuard/TunnelListFragment: 	at =
java.lang.Thread.run(Thread.java:764)=0A=
01-18 23:09:10.721 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:09:10.721 13764 13764 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@7a7d0a0 nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:09:10.722 13764 13764 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:09:10.730 13764 13764 I am_on_resume_called: =
[0,com.wireguard.android.activity.SettingsActivity,RESUME_ACTIVITY]=0A=
01-18 23:09:10.742 13764 13764 W Activity: AppLock checkAppLockState =
locked:false verifying:false pkgName =3D com.wireguard.android =
isInMultiWindowMode:false=0A=
01-18 23:09:15.516 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:09:15.588 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:09:16.190 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:09:16.281 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:09:29.211 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:09:29.307 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:09:32.909 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:09:32.990 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:09:33.012 13764 13764 I am_on_paused_called: =
[0,com.wireguard.android.activity.SettingsActivity,handleRelaunchActivity=
]=0A=
01-18 23:09:33.013 13764 13764 I am_on_stop_called: =
[0,com.wireguard.android.activity.SettingsActivity,destroy]=0A=
01-18 23:09:33.018 13764 13764 V Configuration:  needToUpdateOverlays=0A=
01-18 23:09:33.018 13764 13764 I chatty  : uid=3D10169(u0_a169) =
identical 2 lines=0A=
01-18 23:09:33.018 13764 13764 V Configuration:  needToUpdateOverlays=0A=
01-18 23:09:33.032 13764 13764 I am_on_resume_called: =
[0,com.wireguard.android.activity.SettingsActivity,handleRelaunchActivity=
]=0A=
01-18 23:09:33.032 13764 13769 I zygote64: Do full code cache =
collection, code=3D124KB, data=3D86KB=0A=
01-18 23:09:33.032 13764 13769 I zygote64: After code cache collection, =
code=3D95KB, data=3D55KB=0A=
01-18 23:09:33.037 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x1 surface=3D{valid=3Dtrue 538158014464} changed=3Dfalse=0A=
01-18 23:09:33.059 13764 13764 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@c2d531e nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:09:33.059 13764 13764 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:09:33.061 13764 13764 W Activity: AppLock checkAppLockState =
locked:false verifying:false pkgName =3D com.wireguard.android =
isInMultiWindowMode:false=0A=
01-18 23:09:36.585 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
ViewPostIme key 0=0A=
01-18 23:09:36.786 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
ViewPostIme key 1=0A=
01-18 23:09:36.794 13764 13764 I am_on_paused_called: =
[0,com.wireguard.android.activity.SettingsActivity,handlePauseActivity]=0A=
01-18 23:09:36.809 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:09:36.812 13764 13764 D ViewRootImpl@d3b4c44[MainActivity]: =
dispatchDetachedFromWindow=0A=
01-18 23:09:36.812 13764 13764 D InputEventReceiver: channel '44a83d5 =
com.wireguard.android/com.wireguard.android.activity.MainActivity =
(client)' ~ Disposing input event receiver.=0A=
01-18 23:09:36.812 13764 13764 D InputEventReceiver: channel '44a83d5 =
com.wireguard.android/com.wireguard.android.activity.MainActivity =
(client)' ~NativeInputEventReceiver.=0A=
01-18 23:09:36.832 13764 13764 I am_on_resume_called: =
[0,com.wireguard.android.activity.MainActivity,handleRelaunchActivity]=0A=
01-18 23:09:36.835 13764 13764 D ViewRootImpl@cebafe2[MainActivity]: =
setView =3D DecorView@abcef73[MainActivity] TM=3Dtrue MM=3Dfalse=0A=
01-18 23:09:36.837 13764 13764 V InputMethodManager: Not IME target =
window, ignoring=0A=
01-18 23:09:36.838 13764 13764 D ViewRootImpl@cebafe2[MainActivity]: =
dispatchAttachedToWindow=0A=
01-18 23:09:36.846 13764 13764 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:09:36.846 13764 13764 D ViewRootImpl@cebafe2[MainActivity]: =
Relayout returned: old=3D[0,0][0,0] new=3D[0,0][1080,2220] result=3D0x7 =
surface=3D{valid=3Dtrue 538402123776} changed=3Dtrue=0A=
01-18 23:09:36.849 13764 13974 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:09:36.849 13764 13974 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d4c8bc4b0=0A=
01-18 23:09:36.850 13764 13769 I zygote64: Do partial code cache =
collection, code=3D103KB, data=3D69KB=0A=
01-18 23:09:36.850 13764 13769 I zygote64: After code cache collection, =
code=3D103KB, data=3D69KB=0A=
01-18 23:09:36.850 13764 13769 I zygote64: Increasing code cache =
capacity to 512KB=0A=
01-18 23:09:36.859 13764 13764 W Activity: AppLock checkAppLockState =
locked:false verifying:false pkgName =3D com.wireguard.android =
isInMultiWindowMode:false=0A=
01-18 23:09:36.872 13764 13764 D ViewRootImpl@cebafe2[MainActivity]: =
MSG_RESIZED_REPORT: frame=3DRect(0, 0 - 1080, 2220) ci=3DRect(0, 72 - 0, =
144) vi=3DRect(0, 72 - 0, 144) or=3D1=0A=
01-18 23:09:36.872 13764 13764 D ViewRootImpl@cebafe2[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:09:36.880 13764 13764 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@1d4866 nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:09:36.880 13764 13764 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:09:36.894 13764 13974 D OpenGLRenderer: eglDestroySurface =3D =
0x7d6fc1dd20=0A=
01-18 23:09:36.897 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:09:37.282 13764 13764 I am_on_stop_called: =
[0,com.wireguard.android.activity.SettingsActivity,destroy]=0A=
01-18 23:09:37.285 13764 13764 D ViewRootImpl@a6cac39[SettingsActivity]: =
dispatchDetachedFromWindow=0A=
01-18 23:09:37.285 13764 13764 D InputEventReceiver: channel 'e699764 =
com.wireguard.android/com.wireguard.android.activity.SettingsActivity =
(client)' ~ Disposing input event receiver.=0A=
01-18 23:09:37.285 13764 13764 D InputEventReceiver: channel 'e699764 =
com.wireguard.android/com.wireguard.android.activity.SettingsActivity =
(client)' ~NativeInputEventReceiver.=0A=
01-18 23:09:39.369 13764 13764 D ViewRootImpl@cebafe2[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:09:39.437 13764 13764 D ViewRootImpl@cebafe2[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:09:39.451 13764 13764 D VpnService: prepare function with =
android vpn context is called for non knox vpn profile=0A=
01-18 23:09:44.504 13764 13764 D ViewRootImpl@cebafe2[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:09:47.905 13764 13764 D ViewRootImpl@cebafe2[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:09:48.816 13764 13764 D ViewRootImpl@cebafe2[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:09:48.898 13764 13764 D ViewRootImpl@cebafe2[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:09:49.383 13764 13764 D ViewRootImpl@cebafe2[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:09:49.499 13764 13764 D ViewRootImpl@cebafe2[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:09:53.822 13764 13764 D ViewRootImpl@cebafe2[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:09:54.152 13764 13764 D ViewRootImpl@cebafe2[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:09:55.507 13764 13764 I am_on_paused_called: =
[0,com.wireguard.android.activity.MainActivity,handlePauseActivity]=0A=
01-18 23:09:55.508 13764 13764 D ViewRootImpl@cebafe2[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:09:55.521 13764 13764 I am_on_stop_called: =
[0,com.wireguard.android.activity.MainActivity,handleStopActivity]=0A=
01-18 23:09:55.534 13764 13974 D OpenGLRenderer: eglDestroySurface =3D =
0x7d4c8bc4b0=0A=
01-18 23:09:55.540 13764 13764 D ViewRootImpl@cebafe2[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:09:55.578 13764 13764 D ViewRootImpl@cebafe2[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x1 surface=3D{valid=3Dfalse 0} changed=3Dfalse=0A=
01-18 23:09:59.338 14387 14387 W SELinux : SELinux =
selinux_android_compute_policy_index : Policy Index[2],  =
Con:u:r:zygote:s0 RAM:SEPF_SM-G965F_8.0.0_0017, [-1 -1 -1 -1 0 1]=0A=
01-18 23:09:59.339 14387 14387 I SELinux : SELinux: =
seapp_context_lookup: seinfo=3Duntrusted, level=3Ds0:c512,c768, =
pkgname=3Dcom.wireguard.android =0A=
01-18 23:09:59.512 14387 14402 D libEGL  : loaded =
/vendor/lib64/egl/libGLES_mali.so=0A=
01-18 23:10:02.310 14387 14387 V Configuration:  needToUpdateOverlays=0A=
01-18 23:10:02.310 14387 14387 V Configuration:  needToUpdateOverlays=0A=
01-18 23:10:02.327 14387 14387 I zygote64: Rejecting re-init on =
previously-failed class =
java.lang.Class<androidx.core.view.ViewCompat$OnUnhandledKeyEventListener=
Wrapper>: java.lang.NoClassDefFoundError: Failed resolution of: =
Landroid/view/View$OnUnhandledKeyEventListener;=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.setContentView(int) =
(AppCompatDelegateImpl.java:466)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.setContentView(int) =
(AppCompatActivity.java:140)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
com.wireguard.android.activity.MainActivity.onCreate(android.os.Bundle) =
(MainActivity.java:74)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.app.Activity.performCreate(android.os.Bundle) =
(Activity.java:7183)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.app.Instrumentation.callActivityOnCreate(android.app.Activity, =
android.os.Bundle) (Instrumentation.java:1220)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2908)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:10:02.327 14387 14387 I zygote64: Caused by: =
java.lang.ClassNotFoundException: Didn't find class =
"android.view.View$OnUnhandledKeyEventListener" on path: =
DexPathList[[zip file =
"/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk"],=
nativeLibraryDirectories=3D[/data/app/com.wireguard.android-ZpU3pfh-wtYZ6=
zCM0NHoLA=3D=3D/lib/arm64, =
/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk!/li=
b/arm64-v8a, /system/lib64, /vendor/lib64]]=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at java.lang.Class =
dalvik.system.BaseDexClassLoader.findClass(java.lang.String) =
(BaseDexClassLoader.java:93)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String, boolean) =
(ClassLoader.java:379)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String) (ClassLoader.java:312)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.setContentView(int) =
(AppCompatDelegateImpl.java:466)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.setContentView(int) =
(AppCompatActivity.java:140)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
com.wireguard.android.activity.MainActivity.onCreate(android.os.Bundle) =
(MainActivity.java:74)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.app.Activity.performCreate(android.os.Bundle) =
(Activity.java:7183)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.app.Instrumentation.callActivityOnCreate(android.app.Activity, =
android.os.Bundle) (Instrumentation.java:1220)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2908)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:10:02.327 14387 14387 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:10:02.327 14387 14387 I zygote64: =0A=
01-18 23:10:02.328 14387 14387 I zygote64: Rejecting re-init on =
previously-failed class =
java.lang.Class<androidx.core.view.ViewCompat$OnUnhandledKeyEventListener=
Wrapper>: java.lang.NoClassDefFoundError: Failed resolution of: =
Landroid/view/View$OnUnhandledKeyEventListener;=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.setContentView(int) =
(AppCompatDelegateImpl.java:466)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.setContentView(int) =
(AppCompatActivity.java:140)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
com.wireguard.android.activity.MainActivity.onCreate(android.os.Bundle) =
(MainActivity.java:74)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.app.Activity.performCreate(android.os.Bundle) =
(Activity.java:7183)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.app.Instrumentation.callActivityOnCreate(android.app.Activity, =
android.os.Bundle) (Instrumentation.java:1220)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2908)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:10:02.328 14387 14387 I zygote64: Caused by: =
java.lang.ClassNotFoundException: Didn't find class =
"android.view.View$OnUnhandledKeyEventListener" on path: =
DexPathList[[zip file =
"/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk"],=
nativeLibraryDirectories=3D[/data/app/com.wireguard.android-ZpU3pfh-wtYZ6=
zCM0NHoLA=3D=3D/lib/arm64, =
/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk!/li=
b/arm64-v8a, /system/lib64, /vendor/lib64]]=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at java.lang.Class =
dalvik.system.BaseDexClassLoader.findClass(java.lang.String) =
(BaseDexClassLoader.java:93)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String, boolean) =
(ClassLoader.java:379)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String) (ClassLoader.java:312)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.setContentView(int) =
(AppCompatDelegateImpl.java:466)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.setContentView(int) =
(AppCompatActivity.java:140)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
com.wireguard.android.activity.MainActivity.onCreate(android.os.Bundle) =
(MainActivity.java:74)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.app.Activity.performCreate(android.os.Bundle) =
(Activity.java:7183)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.app.Instrumentation.callActivityOnCreate(android.app.Activity, =
android.os.Bundle) (Instrumentation.java:1220)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2908)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:10:02.328 14387 14387 I zygote64: =0A=
01-18 23:10:02.328 14387 14387 I zygote64: Rejecting re-init on =
previously-failed class =
java.lang.Class<androidx.core.view.ViewCompat$OnUnhandledKeyEventListener=
Wrapper>: java.lang.NoClassDefFoundError: Failed resolution of: =
Landroid/view/View$OnUnhandledKeyEventListener;=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.setContentView(int) =
(AppCompatDelegateImpl.java:466)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.setContentView(int) =
(AppCompatActivity.java:140)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
com.wireguard.android.activity.MainActivity.onCreate(android.os.Bundle) =
(MainActivity.java:74)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.app.Activity.performCreate(android.os.Bundle) =
(Activity.java:7183)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.app.Instrumentation.callActivityOnCreate(android.app.Activity, =
android.os.Bundle) (Instrumentation.java:1220)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2908)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:10:02.328 14387 14387 I zygote64: Caused by: =
java.lang.ClassNotFoundException: Didn't find class =
"android.view.View$OnUnhandledKeyEventListener" on path: =
DexPathList[[zip file =
"/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk"],=
nativeLibraryDirectories=3D[/data/app/com.wireguard.android-ZpU3pfh-wtYZ6=
zCM0NHoLA=3D=3D/lib/arm64, =
/data/app/com.wireguard.android-ZpU3pfh-wtYZ6zCM0NHoLA=3D=3D/base.apk!/li=
b/arm64-v8a, /system/lib64, /vendor/lib64]]=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at java.lang.Class =
dalvik.system.BaseDexClassLoader.findClass(java.lang.String) =
(BaseDexClassLoader.java:93)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String, boolean) =
(ClassLoader.java:379)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at java.lang.Class =
java.lang.ClassLoader.loadClass(java.lang.String) (ClassLoader.java:312)=0A=
01-18 23:10:02.328 14387 14387 I zygote64:   at void =
androidx.core.view.ViewCompat.setBackground(android.view.View, =
android.graphics.drawable.Drawable) (ViewCompat.java:2341)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at void =
androidx.appcompat.widget.ActionBarContainer.<init>(android.content.Conte=
xt, android.util.AttributeSet) (ActionBarContainer.java:62)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance0(java.lang.Object[]) =
(Constructor.java:-2)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at java.lang.Object =
java.lang.reflect.Constructor.newInstance(java.lang.Object[]) =
(Constructor.java:334)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.createView(java.lang.String, =
java.lang.String, android.util.AttributeSet) (LayoutInflater.java:647)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:790)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.createViewFromTag(android.view.View, =
java.lang.String, android.content.Context, android.util.AttributeSet) =
(LayoutInflater.java:730)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at void =
android.view.LayoutInflater.rInflate(org.xmlpull.v1.XmlPullParser, =
android.view.View, android.content.Context, android.util.AttributeSet, =
boolean) (LayoutInflater.java:863)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at void =
android.view.LayoutInflater.rInflateChildren(org.xmlpull.v1.XmlPullParser=
, android.view.View, android.util.AttributeSet, boolean) =
(LayoutInflater.java:824)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(org.xmlpull.v1.XmlPullParser, =
android.view.ViewGroup, boolean) (LayoutInflater.java:515)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup, =
boolean) (LayoutInflater.java:423)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at android.view.View =
android.view.LayoutInflater.inflate(int, android.view.ViewGroup) =
(LayoutInflater.java:374)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at android.view.ViewGroup =
androidx.appcompat.app.AppCompatDelegateImpl.createSubDecor() =
(AppCompatDelegateImpl.java:607)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.ensureSubDecor() =
(AppCompatDelegateImpl.java:518)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at void =
androidx.appcompat.app.AppCompatDelegateImpl.setContentView(int) =
(AppCompatDelegateImpl.java:466)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at void =
androidx.appcompat.app.AppCompatActivity.setContentView(int) =
(AppCompatActivity.java:140)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at void =
com.wireguard.android.activity.MainActivity.onCreate(android.os.Bundle) =
(MainActivity.java:74)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at void =
android.app.Activity.performCreate(android.os.Bundle) =
(Activity.java:7183)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at void =
android.app.Instrumentation.callActivityOnCreate(android.app.Activity, =
android.os.Bundle) (Instrumentation.java:1220)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at android.app.Activity =
android.app.ActivityThread.performLaunchActivity(android.app.ActivityThre=
ad$ActivityClientRecord, android.content.Intent) =
(ActivityThread.java:2908)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at void =
android.app.ActivityThread.handleLaunchActivity(android.app.ActivityThrea=
d$ActivityClientRecord, android.content.Intent, java.lang.String) =
(ActivityThread.java:3030)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at void =
android.app.ActivityThread.-wrap11(android.app.ActivityThread, =
android.app.ActivityThread$ActivityClientRecord, android.content.Intent, =
java.lang.String) (ActivityThread.java:-1)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at void =
android.app.ActivityThread$H.handleMessage(android.os.Message) =
(ActivityThread.java:1696)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at void =
android.os.Handler.dispatchMessage(android.os.Message) (Handler.java:105)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at void =
android.os.Looper.loop() (Looper.java:164)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at void =
android.app.ActivityThread.main(java.lang.String[]) =
(ActivityThread.java:6938)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at java.lang.Object =
java.lang.reflect.Method.invoke(java.lang.Object, java.lang.Object[]) =
(Method.java:-2)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at void =
com.android.internal.os.Zygote$MethodAndArgsCaller.run() =
(Zygote.java:327)=0A=
01-18 23:10:02.329 14387 14387 I zygote64:   at void =
com.android.internal.os.ZygoteInit.main(java.lang.String[]) =
(ZygoteInit.java:1374)=0A=
01-18 23:10:02.329 14387 14387 I zygote64: =0A=
01-18 23:10:02.364 14387 14387 I am_on_resume_called: =
[0,com.wireguard.android.activity.MainActivity,LAUNCH_ACTIVITY]=0A=
01-18 23:10:02.376 14387 14429 D OpenGLRenderer: HWUI GL Pipeline=0A=
01-18 23:10:02.380 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
setView =3D DecorView@ba346f1[MainActivity] TM=3Dtrue MM=3Dfalse=0A=
01-18 23:10:02.381 14387 14387 W Activity: AppLock checkAppLockState =
locked:false verifying:false pkgName =3D com.wireguard.android =
isInMultiWindowMode:false=0A=
01-18 23:10:02.385 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
dispatchAttachedToWindow=0A=
01-18 23:10:02.396 14387 14387 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:10:02.396 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
Relayout returned: old=3D[0,0][0,0] new=3D[0,0][1080,2220] result=3D0x7 =
surface=3D{valid=3Dtrue 538616127488} changed=3Dtrue=0A=
01-18 23:10:02.400 14387 14429 I OpenGLRenderer: Initialized EGL, =
version 1.4=0A=
01-18 23:10:02.400 14387 14429 D OpenGLRenderer: Swap behavior 2=0A=
01-18 23:10:02.404 14387 14429 D libGLESv1: STS_GLApi : DTS, ODTC are =
not allowed for Package : com.wireguard.android=0A=
01-18 23:10:02.405 14387 14429 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:10:02.405 14387 14429 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d6fc1de60=0A=
01-18 23:10:02.413 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
MSG_RESIZED_REPORT: frame=3DRect(0, 0 - 1080, 2220) ci=3DRect(0, 72 - 0, =
144) vi=3DRect(0, 72 - 0, 144) or=3D1=0A=
01-18 23:10:02.414 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:10:02.414 14387 14387 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@f1dfa0d nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:10:02.414 14387 14387 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:10:02.444 14387 14387 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@74fd40e nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:10:04.237 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:10:04.290 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:10:10.441 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:10:10.579 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:10:11.466 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:10:11.614 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:10:11.639 14387 14387 I am_on_paused_called: =
[0,com.wireguard.android.activity.MainActivity,handlePauseActivity]=0A=
01-18 23:10:11.646 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:10:11.736 14387 14429 D OpenGLRenderer: eglDestroySurface =3D =
0x7d6fc1de60=0A=
01-18 23:10:11.736 14387 14429 D OpenGLRenderer: endAllActiveAnimators =
on 0x7d5ac76000 (RippleDrawable) with handle 0x7d59dca900=0A=
01-18 23:10:11.755 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:10:12.146 14387 14387 I am_on_stop_called: =
[0,com.wireguard.android.activity.MainActivity,handleStopActivity]=0A=
01-18 23:10:12.624 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x1 surface=3D{valid=3Dfalse 0} changed=3Dfalse=0A=
01-18 23:10:12.629 14387 14387 I am_on_resume_called: =
[0,com.wireguard.android.activity.MainActivity,RESUME_ACTIVITY]=0A=
01-18 23:10:12.644 14387 14387 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:10:12.644 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x7 surface=3D{valid=3Dtrue 538616127488} changed=3Dtrue=0A=
01-18 23:10:12.646 14387 14387 W Activity: AppLock checkAppLockState =
locked:false verifying:false pkgName =3D com.wireguard.android =
isInMultiWindowMode:false=0A=
01-18 23:10:12.646 14387 14429 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:10:12.646 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:10:12.646 14387 14429 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d6fc1de60=0A=
01-18 23:10:12.646 14387 14387 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@f87a779 nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:10:12.646 14387 14387 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:10:32.220 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:10:32.308 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:10:32.312 14387 14387 I menu_item_selected: [0,Settings]=0A=
01-18 23:10:32.327 14387 14387 I am_on_paused_called: =
[0,com.wireguard.android.activity.MainActivity,handlePauseActivity]=0A=
01-18 23:10:32.351 14387 14387 I am_on_resume_called: =
[0,com.wireguard.android.activity.SettingsActivity,LAUNCH_ACTIVITY]=0A=
01-18 23:10:32.354 14387 14387 D ViewRootImpl@d9c121e[SettingsActivity]: =
setView =3D DecorView@a2d0aff[SettingsActivity] TM=3Dtrue MM=3Dfalse=0A=
01-18 23:10:32.354 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:10:32.355 14387 14387 V InputMethodManager: Not IME target =
window, ignoring=0A=
01-18 23:10:32.355 14387 14387 D ViewRootImpl@d9c121e[SettingsActivity]: =
dispatchAttachedToWindow=0A=
01-18 23:10:32.361 14387 14387 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:10:32.361 14387 14387 D ViewRootImpl@d9c121e[SettingsActivity]: =
Relayout returned: old=3D[0,0][0,0] new=3D[0,0][1080,2220] result=3D0x7 =
surface=3D{valid=3Dtrue 538178543616} changed=3Dtrue=0A=
01-18 23:10:32.362 14387 14429 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:10:32.362 14387 14429 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d6fc1f080=0A=
01-18 23:10:32.383 14387 14387 W Activity: AppLock checkAppLockState =
locked:false verifying:false pkgName =3D com.wireguard.android =
isInMultiWindowMode:false=0A=
01-18 23:10:32.385 14387 14387 D ViewRootImpl@d9c121e[SettingsActivity]: =
MSG_RESIZED_REPORT: frame=3DRect(0, 0 - 1080, 2220) ci=3DRect(0, 72 - 0, =
144) vi=3DRect(0, 72 - 0, 144) or=3D1=0A=
01-18 23:10:32.393 14387 14387 D ViewRootImpl@d9c121e[SettingsActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:10:32.399 14387 14387 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@fb07658 nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:10:32.399 14387 14387 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:10:32.413 14387 14429 D OpenGLRenderer: eglDestroySurface =3D =
0x7d6fc1de60=0A=
01-18 23:10:32.413 14387 14429 D OpenGLRenderer: endAllActiveAnimators =
on 0x7d5ad86000 (RippleDrawable) with handle 0x7d59dca6e0=0A=
01-18 23:10:32.417 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:10:32.800 14387 14387 I am_on_stop_called: =
[0,com.wireguard.android.activity.MainActivity,handleStopActivity]=0A=
01-18 23:10:35.241 14387 14387 D ViewRootImpl@d9c121e[SettingsActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:10:35.339 14387 14387 D ViewRootImpl@d9c121e[SettingsActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:10:36.652 14387 14387 D ViewRootImpl@d9c121e[SettingsActivity]: =
ViewPostIme key 0=0A=
01-18 23:10:36.746 14387 14387 D ViewRootImpl@d9c121e[SettingsActivity]: =
ViewPostIme key 1=0A=
01-18 23:10:36.752 14387 14387 I am_on_paused_called: =
[0,com.wireguard.android.activity.SettingsActivity,handlePauseActivity]=0A=
01-18 23:10:36.763 14387 14387 D ViewRootImpl@d9c121e[SettingsActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:10:36.764 14387 14387 I am_on_resume_called: =
[0,com.wireguard.android.activity.MainActivity,RESUME_ACTIVITY]=0A=
01-18 23:10:36.777 14387 14387 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:10:36.777 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x7 surface=3D{valid=3Dtrue 538616127488} changed=3Dtrue=0A=
01-18 23:10:36.778 14387 14429 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:10:36.778 14387 14429 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d6fc1de60=0A=
01-18 23:10:36.780 14387 14387 W Activity: AppLock checkAppLockState =
locked:false verifying:false pkgName =3D com.wireguard.android =
isInMultiWindowMode:false=0A=
01-18 23:10:36.780 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:10:36.781 14387 14387 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@bb63ab3 nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:10:36.781 14387 14387 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:10:36.805 14387 14429 D OpenGLRenderer: eglDestroySurface =3D =
0x7d6fc1f080=0A=
01-18 23:10:36.809 14387 14387 D ViewRootImpl@d9c121e[SettingsActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:10:37.215 14387 14387 I am_on_stop_called: =
[0,com.wireguard.android.activity.SettingsActivity,destroy]=0A=
01-18 23:10:37.230 14387 14387 D ViewRootImpl@d9c121e[SettingsActivity]: =
dispatchDetachedFromWindow=0A=
01-18 23:10:37.230 14387 14387 D InputEventReceiver: channel '9f99522 =
com.wireguard.android/com.wireguard.android.activity.SettingsActivity =
(client)' ~ Disposing input event receiver.=0A=
01-18 23:10:37.230 14387 14387 D InputEventReceiver: channel '9f99522 =
com.wireguard.android/com.wireguard.android.activity.SettingsActivity =
(client)' ~NativeInputEventReceiver.=0A=
01-18 23:10:38.063 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:10:38.898 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:10:39.098 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:10:39.102 14387 14392 I zygote64: Do partial code cache =
collection, code=3D30KB, data=3D26KB=0A=
01-18 23:10:39.103 14387 14392 I zygote64: After code cache collection, =
code=3D30KB, data=3D26KB=0A=
01-18 23:10:39.103 14387 14392 I zygote64: Increasing code cache =
capacity to 128KB=0A=
01-18 23:10:39.348 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:10:39.807 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
ViewPostIme pointer 0=0A=
01-18 23:10:39.900 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
ViewPostIme pointer 1=0A=
01-18 23:10:39.912 14387 14387 I menu_item_selected: [0,Settings]=0A=
01-18 23:10:39.924 14387 14387 I am_on_paused_called: =
[0,com.wireguard.android.activity.MainActivity,handlePauseActivity]=0A=
01-18 23:10:39.942 14387 14387 I am_on_resume_called: =
[0,com.wireguard.android.activity.SettingsActivity,LAUNCH_ACTIVITY]=0A=
01-18 23:10:39.946 14387 14387 D ViewRootImpl@12600b8[SettingsActivity]: =
setView =3D DecorView@7b68e91[SettingsActivity] TM=3Dtrue MM=3Dfalse=0A=
01-18 23:10:39.946 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:10:39.947 14387 14387 V InputMethodManager: Not IME target =
window, ignoring=0A=
01-18 23:10:39.947 14387 14387 D ViewRootImpl@12600b8[SettingsActivity]: =
dispatchAttachedToWindow=0A=
01-18 23:10:39.953 14387 14387 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:10:39.953 14387 14387 D ViewRootImpl@12600b8[SettingsActivity]: =
Relayout returned: old=3D[0,0][0,0] new=3D[0,0][1080,2220] result=3D0x7 =
surface=3D{valid=3Dtrue 538179293184} changed=3Dtrue=0A=
01-18 23:10:39.955 14387 14429 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:10:39.955 14387 14429 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d6fc1f080=0A=
01-18 23:10:39.970 14387 14387 W Activity: AppLock checkAppLockState =
locked:false verifying:false pkgName =3D com.wireguard.android =
isInMultiWindowMode:false=0A=
01-18 23:10:39.973 14387 14387 D ViewRootImpl@12600b8[SettingsActivity]: =
MSG_RESIZED_REPORT: frame=3DRect(0, 0 - 1080, 2220) ci=3DRect(0, 72 - 0, =
144) vi=3DRect(0, 72 - 0, 144) or=3D1=0A=
01-18 23:10:39.973 14387 14387 D ViewRootImpl@12600b8[SettingsActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:10:39.974 14387 14387 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@904945c nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:10:39.974 14387 14387 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:10:39.995 14387 14429 D OpenGLRenderer: eglDestroySurface =3D =
0x7d6fc1de60=0A=
01-18 23:10:39.996 14387 14429 D OpenGLRenderer: endAllActiveAnimators =
on 0x7d5ad86000 (RippleDrawable) with handle 0x7d4d5d85a0=0A=
01-18 23:10:39.999 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:10:40.400 14387 14387 I am_on_stop_called: =
[0,com.wireguard.android.activity.MainActivity,handleStopActivity]=0A=
01-18 23:10:41.756 14387 14392 I zygote64: Do partial code cache =
collection, code=3D62KB, data=3D48KB=0A=
01-18 23:10:41.757 14387 14392 I zygote64: After code cache collection, =
code=3D62KB, data=3D48KB=0A=
01-18 23:10:41.757 14387 14392 I zygote64: Increasing code cache =
capacity to 256KB=0A=
01-18 23:10:42.373 14387 14387 D ViewRootImpl@12600b8[SettingsActivity]: =
ViewPostIme key 0=0A=
01-18 23:10:42.425 14387 14387 D ViewRootImpl@12600b8[SettingsActivity]: =
ViewPostIme key 1=0A=
01-18 23:10:42.431 14387 14387 I am_on_paused_called: =
[0,com.wireguard.android.activity.SettingsActivity,handlePauseActivity]=0A=
01-18 23:10:42.442 14387 14387 D ViewRootImpl@12600b8[SettingsActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:10:42.443 14387 14387 I am_on_resume_called: =
[0,com.wireguard.android.activity.MainActivity,RESUME_ACTIVITY]=0A=
01-18 23:10:42.456 14387 14387 V Surface : sf_framedrop debug : 0x4f4c, =
game : false, logging : 0=0A=
01-18 23:10:42.456 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x7 surface=3D{valid=3Dtrue 538616127488} changed=3Dtrue=0A=
01-18 23:10:42.457 14387 14429 D mali_winsys: EGLint =
new_window_surface(egl_winsys_display *, void *, EGLSurface, EGLConfig, =
egl_winsys_surface **, egl_color_buffer_format *, EGLBoolean) returns =
0x3000,  [1080x2220]-format:1=0A=
01-18 23:10:42.457 14387 14429 D OpenGLRenderer: eglCreateWindowSurface =
=3D 0x7d6fc1de60=0A=
01-18 23:10:42.458 14387 14387 W Activity: AppLock checkAppLockState =
locked:false verifying:false pkgName =3D com.wireguard.android =
isInMultiWindowMode:false=0A=
01-18 23:10:42.458 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 1=0A=
01-18 23:10:42.459 14387 14387 V InputMethodManager: Starting input: =
tba=3Dandroid.view.inputmethod.EditorInfo@74f6365 nm : =
com.wireguard.android ic=3Dnull=0A=
01-18 23:10:42.459 14387 14387 I InputMethodManager: startInputInner - =
mService.startInputOrWindowGainedFocus=0A=
01-18 23:10:42.484 14387 14429 D OpenGLRenderer: eglDestroySurface =3D =
0x7d6fc1f080=0A=
01-18 23:10:42.489 14387 14387 D ViewRootImpl@12600b8[SettingsActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:10:42.659 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
ViewPostIme key 0=0A=
01-18 23:10:42.808 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
ViewPostIme key 1=0A=
01-18 23:10:42.812 14387 14387 I am_on_paused_called: =
[0,com.wireguard.android.activity.MainActivity,handlePauseActivity]=0A=
01-18 23:10:42.825 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
MSG_WINDOW_FOCUS_CHANGED 0=0A=
01-18 23:10:42.885 14387 14429 D OpenGLRenderer: eglDestroySurface =3D =
0x7d6fc1de60=0A=
01-18 23:10:42.904 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
Relayout returned: old=3D[0,0][1080,2220] new=3D[0,0][1080,2220] =
result=3D0x5 surface=3D{valid=3Dfalse 0} changed=3Dtrue=0A=
01-18 23:10:43.239 14387 14387 I am_on_stop_called: =
[0,com.wireguard.android.activity.MainActivity,destroy]=0A=
01-18 23:10:43.246 14387 14387 D ViewRootImpl@82ade98[MainActivity]: =
dispatchDetachedFromWindow=0A=
01-18 23:10:43.246 14387 14387 D InputEventReceiver: channel '2d222c0 =
com.wireguard.android/com.wireguard.android.activity.MainActivity =
(client)' ~ Disposing input event receiver.=0A=
01-18 23:10:43.246 14387 14387 D InputEventReceiver: channel '2d222c0 =
com.wireguard.android/com.wireguard.android.activity.MainActivity =
(client)' ~NativeInputEventReceiver.=0A=
01-18 23:10:43.250 14387 14387 I am_on_stop_called: =
[0,com.wireguard.android.activity.SettingsActivity,destroy]=0A=
01-18 23:10:43.258 14387 14387 D ViewRootImpl@12600b8[SettingsActivity]: =
dispatchDetachedFromWindow=0A=
01-18 23:10:43.258 14387 14387 D InputEventReceiver: channel 'fe53748 =
com.wireguard.android/com.wireguard.android.activity.SettingsActivity =
(client)' ~ Disposing input event receiver.=0A=
01-18 23:10:43.258 14387 14387 D InputEventReceiver: channel 'fe53748 =
com.wireguard.android/com.wireguard.android.activity.SettingsActivity =
(client)' ~NativeInputEventReceiver.=0A=
01-18 23:11:00.000 14387 14405 W WireGuard/RootShell: Root check did not =
return correct UID: null=0A=
01-18 23:12:00.558 14387 14847 W WireGuard/RootShell: Root check did not =
return correct UID: null=0A=
01-18 23:12:00.558 14387 14407 W zygote64: Long monitor contention with =
owner AsyncTask #5 (14847) at int =
libcore.io.Linux.readBytes(java.io.FileDescriptor, java.lang.Object, =
int, int)(Linux.java:-2) waiters=3D0 in void =
java.lang.UNIXProcess$ProcessPipeInputStream.processExited() for 425ms=0A=
01-18 23:12:00.564 14387 14407 I dvm_lock_sample: =
[com.wireguard.android,0,process =
reaper,425,UNIXProcess.java,-1,Linux.java,-2,85]=0A=

------=_NextPart_000_0027_01D4B240.5C84DFD0
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

------=_NextPart_000_0027_01D4B240.5C84DFD0--

