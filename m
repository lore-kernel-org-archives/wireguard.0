Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4DEC35240
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 01:53:24 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11E30206D5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 01:53:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=quickfox.ru header.i=@quickfox.ru header.b="jxQn5MjT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11E30206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=quickfox.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20557f72;
	Thu, 30 Jan 2020 01:53:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a024c5b1
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Jan 2020 06:47:42 +0000 (UTC)
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1caa4b09
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Jan 2020 06:47:42 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id y19so1456683lfl.9
 for <wireguard@lists.zx2c4.com>; Wed, 22 Jan 2020 22:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quickfox.ru; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YkbNJmccvM/DJOaKtzKDLlRKYOHQ1igAI+hcSoDtGSE=;
 b=jxQn5MjTUz4WUmhEa06iLxBFqdEWE/uP8c35oFw6XfE98Bg8KZlBldo5l6ODQ+g/Se
 HcOMENxTmDfK7UkSJWq5syL8KfQzogWyw8M+JoXIAkixQU+pbn9gJFWzwC8ltC9r71Mg
 BnOL5kYuRTD3yzWrGvEr3Ap07XIIeQ3bVVbig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YkbNJmccvM/DJOaKtzKDLlRKYOHQ1igAI+hcSoDtGSE=;
 b=U5yD1mpzm5+s9ygsSGt/hUDeiwI1Um6oIIbQX3kR4IJhYqDTMz5f53ZtnAs+VPHKgM
 NHDQfGCLOQrJ0MllThw27IL0ygbrY5+l59PCH+Jigl57JhKfMfe4P8+mIkd++PEUgFZV
 8OCfKN4Jcgk9wfLTy8U18BRkSuGIGmTt77arQeq5QJPXD+xv69oK8T7vUEM+BBk516cc
 cMFwQcP60Z+kIsoI0UawehZsnhk//rp/9oHF5DyJNXqpk4uo09e5sG1eE3KutkWEiyAz
 Yr5Bnz1BB+JDmzCNJgf66X65R9ngoK+6ZVKzVuog0nAz23hZDBe7zxGD6ZSG5+/AStbJ
 QA4A==
X-Gm-Message-State: APjAAAWpR4IswBcuCY9jpd4Az4hlTIYr0wbgt8Rj0a1oLXcaZ+CWMHJr
 Att74tIUfoAxcGgKDGyz1SVzE/+TBL1nm4BrW4s6oZ+steXtgg==
X-Google-Smtp-Source: APXvYqzziwN+uysdLqXHqyjZ/GUn1Il5+ZVlEu2tVx82R0YxAxWML43lV1oROr+hPmey9yViVWu4eouDBFMlDxvk8/c=
X-Received: by 2002:a19:2213:: with SMTP id i19mr3878789lfi.83.1579762059994; 
 Wed, 22 Jan 2020 22:47:39 -0800 (PST)
MIME-Version: 1.0
References: <CA+hAYV=67S+3d0g+eQ9AZHok=AdvmBsd2XpOFSEcJ=aozjK9PA@mail.gmail.com>
 <aaf2a265-f53e-f6d2-09d7-e83497578a81@zx2c4.com>
In-Reply-To: <aaf2a265-f53e-f6d2-09d7-e83497578a81@zx2c4.com>
From: Andrey Kupreychik <foxel@quickfox.ru>
Date: Thu, 23 Jan 2020 13:47:28 +0700
Message-ID: <CA+hAYVnPDw_t9dRm8CEZeF+iDXQyPAGosfzLCQiY+izF9jMNag@mail.gmail.com>
Subject: Re: Bug report: WireGuard client not setting underlying network on
 Android Pie
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Thu, 30 Jan 2020 02:53:15 +0100
Cc: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============7992035623897817711=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7992035623897817711==
Content-Type: multipart/alternative; boundary="0000000000006a7e0b059cc904a8"

--0000000000006a7e0b059cc904a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi.

I'm not good enough in Android development to say for sure. I found a
similar bud fixed different ways:
OpenVPN:
https://github.com/schwabe/ics-openvpn/blob/450e99c135ebabbf911d6880e39811d=
88454cdd1/main/src/main/java/de/blinkt/openvpn/core/OpenVPNService.java#L87=
7
Outline:
https://github.com/Jigsaw-Code/outline-client/commit/3a9dad6a3cbe962cb10e44=
3cfea21c929e98ef32

Since OpenVPN uses the same I suppose it should help. But looks like it
should still be wrapped with an Android version check.

=D1=87=D1=82, 16 =D1=8F=D0=BD=D0=B2. 2020 =D0=B3. =D0=B2 01:29, Jason A. Do=
nenfeld <Jason@zx2c4.com>:

> Hi Andrey,
>
> Thanks for the bug report.
>
> On 1/13/20 12:00 AM, Andrey Kupreychik wrote:
> > My Android phone running wireguard VPN threats it as a metered
> > connection and does not do anything it should do on Wi-Fi only
> >
> > What I found is this discussion
> > https://issuetracker.google.com/issues/114309459
> > I've looked thru the GitHub mirror code and found no evidance of
> > setUnderlyingNetworks called in WireGuard client code.
> >
> > As seen in the issue tracker link above, it's needed in order to take
> > advantage of this
> > (
> https://developer.android.com/about/versions/pie/android-9.0-changes-all#=
network-capabilities-vpn)
>
> > behavior change. As described in the issue tracker link, this prevents
> > Pie devices from properly using unmetered WiFi networks.
>
> Are you suggesting something like the below? According to the docs, the
> null value is the "default", and the others don't fit the wireguard
> model. Are you saying we should still be calling this anyway because the
> android system is expecting it?
>
>  From 4ae0e9688e4edfdad06e6db49f414a95c5663d07 Mon Sep 17 00:00:00 2001
> From: "Jason A. Donenfeld" <Jason@zx2c4.com>
> Date: Wed, 15 Jan 2020 13:25:56 -0500
> Subject: [PATCH] GoBackend: set empty underlying networks
>
> https://lists.zx2c4.com/pipermail/wireguard/2020-January/004859.html
> https://issuetracker.google.com/issues/114309459
>
> https://developer.android.com/about/versions/pie/android-9.0-changes-all#=
network-capabilities-vpn
>
> Apparently we need to call this at least once.
>
> Reported-by: Andrey Kupreychik <foxel@quickfox.ru>
> ---
>   app/src/main/java/com/wireguard/android/backend/GoBackend.java | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git
> a/app/src/main/java/com/wireguard/android/backend/GoBackend.java
> b/app/src/main/java/com/wireguard/android/backend/GoBackend.java
> index 3e8e1ec..3c4c893 100644
> --- a/app/src/main/java/com/wireguard/android/backend/GoBackend.java
> +++ b/app/src/main/java/com/wireguard/android/backend/GoBackend.java
> @@ -224,6 +224,7 @@ public final class GoBackend implements Backend {
>
>               currentTunnel =3D tunnel;
>
> +            service.setUnderlyingNetworks(null);
>               service.protect(wgGetSocketV4(currentTunnelHandle));
>               service.protect(wgGetSocketV6(currentTunnelHandle));
>           } else {
> --
> 2.24.1
>
>
> Regards,
> Jason
>


--=20
Andrey Kupreychik <foxel@quickfox.ru>
http://foxel.quickfox.ru

--0000000000006a7e0b059cc904a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi.<div><br></div><div>I&#39;m not good enough in Android =
development to say for sure. I found a similar bud fixed different ways:</d=
iv><div>OpenVPN:=C2=A0<a href=3D"https://github.com/schwabe/ics-openvpn/blo=
b/450e99c135ebabbf911d6880e39811d88454cdd1/main/src/main/java/de/blinkt/ope=
nvpn/core/OpenVPNService.java#L877">https://github.com/schwabe/ics-openvpn/=
blob/450e99c135ebabbf911d6880e39811d88454cdd1/main/src/main/java/de/blinkt/=
openvpn/core/OpenVPNService.java#L877</a></div><div>Outline:=C2=A0<a href=
=3D"https://github.com/Jigsaw-Code/outline-client/commit/3a9dad6a3cbe962cb1=
0e443cfea21c929e98ef32">https://github.com/Jigsaw-Code/outline-client/commi=
t/3a9dad6a3cbe962cb10e443cfea21c929e98ef32</a><br></div><div><br></div><div=
>Since OpenVPN uses the same I suppose it should help. But looks like it sh=
ould still be wrapped with an Android version check.</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D1=87=D1=82, 16 =
=D1=8F=D0=BD=D0=B2. 2020 =D0=B3. =D0=B2 01:29, Jason A. Donenfeld &lt;<a hr=
ef=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt;:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Hi Andrey,<br>
<br>
Thanks for the bug report.<br>
<br>
On 1/13/20 12:00 AM, Andrey Kupreychik wrote:<br>
&gt; My Android phone running wireguard VPN threats it as a metered <br>
&gt; connection and does not do anything it should do on Wi-Fi only<br>
&gt; <br>
&gt; What I found is this discussion <br>
&gt; <a href=3D"https://issuetracker.google.com/issues/114309459" rel=3D"no=
referrer" target=3D"_blank">https://issuetracker.google.com/issues/11430945=
9</a><br>
&gt; I&#39;ve looked thru the GitHub mirror code and found no evidance of <=
br>
&gt; setUnderlyingNetworks called in WireGuard client code.<br>
&gt; <br>
&gt; As seen in the issue tracker link above, it&#39;s needed in order to t=
ake <br>
&gt; advantage of this <br>
&gt; (<a href=3D"https://developer.android.com/about/versions/pie/android-9=
.0-changes-all#network-capabilities-vpn" rel=3D"noreferrer" target=3D"_blan=
k">https://developer.android.com/about/versions/pie/android-9.0-changes-all=
#network-capabilities-vpn</a>) <br>
&gt; behavior change. As described in the issue tracker link, this prevents=
 <br>
&gt; Pie devices from properly using unmetered WiFi networks.<br>
<br>
Are you suggesting something like the below? According to the docs, the <br=
>
null value is the &quot;default&quot;, and the others don&#39;t fit the wir=
eguard <br>
model. Are you saying we should still be calling this anyway because the <b=
r>
android system is expecting it?<br>
<br>
=C2=A0From 4ae0e9688e4edfdad06e6db49f414a95c5663d07 Mon Sep 17 00:00:00 200=
1<br>
From: &quot;Jason A. Donenfeld&quot; &lt;<a href=3D"mailto:Jason@zx2c4.com"=
 target=3D"_blank">Jason@zx2c4.com</a>&gt;<br>
Date: Wed, 15 Jan 2020 13:25:56 -0500<br>
Subject: [PATCH] GoBackend: set empty underlying networks<br>
<br>
<a href=3D"https://lists.zx2c4.com/pipermail/wireguard/2020-January/004859.=
html" rel=3D"noreferrer" target=3D"_blank">https://lists.zx2c4.com/pipermai=
l/wireguard/2020-January/004859.html</a><br>
<a href=3D"https://issuetracker.google.com/issues/114309459" rel=3D"norefer=
rer" target=3D"_blank">https://issuetracker.google.com/issues/114309459</a>=
<br>
<a href=3D"https://developer.android.com/about/versions/pie/android-9.0-cha=
nges-all#network-capabilities-vpn" rel=3D"noreferrer" target=3D"_blank">htt=
ps://developer.android.com/about/versions/pie/android-9.0-changes-all#netwo=
rk-capabilities-vpn</a><br>
<br>
Apparently we need to call this at least once.<br>
<br>
Reported-by: Andrey Kupreychik &lt;<a href=3D"mailto:foxel@quickfox.ru" tar=
get=3D"_blank">foxel@quickfox.ru</a>&gt;<br>
---<br>
=C2=A0 app/src/main/java/com/wireguard/android/backend/GoBackend.java | 1 +=
<br>
=C2=A0 1 file changed, 1 insertion(+)<br>
<br>
diff --git <br>
a/app/src/main/java/com/wireguard/android/backend/GoBackend.java <br>
b/app/src/main/java/com/wireguard/android/backend/GoBackend.java<br>
index 3e8e1ec..3c4c893 100644<br>
--- a/app/src/main/java/com/wireguard/android/backend/GoBackend.java<br>
+++ b/app/src/main/java/com/wireguard/android/backend/GoBackend.java<br>
@@ -224,6 +224,7 @@ public final class GoBackend implements Backend {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 currentTunnel =3D tunnel;<=
br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 service.setUnderlyingNetworks(nu=
ll);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 service.protect(wgGetSocke=
tV4(currentTunnelHandle));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 service.protect(wgGetSocke=
tV6(currentTunnelHandle));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
-- <br>
2.24.1<br>
<br>
<br>
Regards,<br>
Jason<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Andrey Kupreychik &lt;<a href=
=3D"mailto:foxel@quickfox.ru" target=3D"_blank">foxel@quickfox.ru</a>&gt;<b=
r><a href=3D"http://foxel.quickfox.ru" target=3D"_blank">http://foxel.quick=
fox.ru</a></div></div>

--0000000000006a7e0b059cc904a8--

--===============7992035623897817711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7992035623897817711==--
