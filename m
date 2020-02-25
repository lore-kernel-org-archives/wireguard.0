Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AF0C4BA06
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 23:15:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD8532176D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 23:15:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="uxP5/kCF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD8532176D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81bd9910;
	Tue, 25 Feb 2020 23:10:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dcc084c2
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 23:10:47 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ac55c11
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 23:10:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80b14202
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 23:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=5RR2IXndJ6KBZCm20OIGp7q32XU=; b=uxP5/k
 CFNai7mXwmtkBUL77IpoQLCCdXzktF8CSu3u6lg3IkhjtrVCijZs0lmmeou0ixL/
 hlpQq2K+c+iHZn3Qa0uoAFD0PvlJ3OoUNixUvuVRoQYsoP58rMpZF0pleuvKFO1T
 RzZjM03h1slaCIKjDXYqUBPMzA0RJHRmVntxziExdVC1ZuW5rl3aheUYPhagWr9m
 IHmEoeNhyRbMQWz8De3UVK8Jv7PRF/DVgJY4zfy60XcaajTcK799USl2k5b0KnzJ
 USODqEwsysJBEmPmVqf8uaDPE70lseB/KOQx2HBeAnOouc81BiQ5K9pvReWza0to
 n07uDzdVRkN/YSTw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5700edb8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 23:10:46 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id q84so1103374oic.4
 for <wireguard@lists.zx2c4.com>; Tue, 25 Feb 2020 15:14:20 -0800 (PST)
X-Gm-Message-State: APjAAAVE5dfP0L70+ISE9KT8hvBFkj2iAzb9ERIEIm7wKVDKne+Ygz7/
 iVrLhBcnLypQPxQw901VxacObF3ahl/QMvJwGjw=
X-Google-Smtp-Source: APXvYqxdZcuGs8IsrKqCimyeqz4gOipPoxV69jawT9LbiY0i9iOOpchhUsStWeIEzDRhWO4/+C6ok0eeJLku1ylaS5w=
X-Received: by 2002:a05:6808:a8a:: with SMTP id
 q10mr969064oij.66.1582672460035; 
 Tue, 25 Feb 2020 15:14:20 -0800 (PST)
MIME-Version: 1.0
References: <CA+zF5m=eFUxsg+7nQCjYEmM-6rGdsOnov3a5VkC+me6iM7Y+yQ@mail.gmail.com>
In-Reply-To: <CA+zF5m=eFUxsg+7nQCjYEmM-6rGdsOnov3a5VkC+me6iM7Y+yQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 26 Feb 2020 07:14:08 +0800
X-Gmail-Original-Message-ID: <CAHmME9psPiU3CzK=jhjP3y8eE2UuoB0V9UafT2Pic8bcvcp33Q@mail.gmail.com>
Message-ID: <CAHmME9psPiU3CzK=jhjP3y8eE2UuoB0V9UafT2Pic8bcvcp33Q@mail.gmail.com>
Subject: Re: [PATCH][wireguard-android] fix formatBytes to be able to display
 gibibytes
To: =?UTF-8?Q?Fran=C3=A7ois_Guerraz?= <kubrick@fgv6.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============2977978326039334687=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2977978326039334687==
Content-Type: multipart/alternative; boundary="000000000000c6bba7059f6ea54c"

--000000000000c6bba7059f6ea54c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks. Can you resend this with your Signed-off-by line?

On Wed, Feb 26, 2020, 07:12 Fran=C3=A7ois Guerraz <kubrick@fgv6.net> wrote:

> The default type for literal numerals is int, not long it, therefore
> 1024*1024*1024*1024
> overflows and
>     bytes < 1024*1024*1024*1024
> is always false.
> Therefore, GiBi is never displayed and switches to TiBi immediately.
> ---
> diff --git
> a/app/src/main/java/com/wireguard/android/fragment/TunnelDetailFragment.j=
ava
>
> b/app/src/main/java/com/wireguard/android/fragment/TunnelDetailFragment.j=
ava
> index 57e0d8e..bc0726a 100644
> ---
> a/app/src/main/java/com/wireguard/android/fragment/TunnelDetailFragment.j=
ava
> +++
> b/app/src/main/java/com/wireguard/android/fragment/TunnelDetailFragment.j=
ava
> @@ -115,7 +115,7 @@ public class TunnelDetailFragment extends BaseFragmen=
t
> {
>              return
> getContext().getString(R.string.transfer_kibibytes, bytes/1024.0);
>          else if (bytes < 1024*1024*1024)
>              return
> getContext().getString(R.string.transfer_mibibytes,
> bytes/(1024.0*1024.0));
> -        else if (bytes < 1024*1024*1024*1024)
> +        else if (bytes < 1024*1024*1024*1024L)
>              return
> getContext().getString(R.string.transfer_gibibytes,
> bytes/(1024.0*1024.0*1024.0));
>          return getContext().getString(R.string.transfer_tibibytes,
> bytes/(1024.0*1024.0*1024.0)/1024.0);
>      }
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000c6bba7059f6ea54c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks. Can you resend this with your Signed-off-by line?=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed, Feb 26, 2020, 07:12 Fran=C3=A7ois Guerraz &lt;<a href=3D"mailto:kub=
rick@fgv6.net">kubrick@fgv6.net</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">The default type for literal numerals is int, not long it, th=
erefore<br>
1024*1024*1024*1024<br>
overflows and<br>
=C2=A0 =C2=A0 bytes &lt; 1024*1024*1024*1024<br>
is always false.<br>
Therefore, GiBi is never displayed and switches to TiBi immediately.<br>
---<br>
diff --git a/app/src/main/java/com/wireguard/android/fragment/TunnelDetailF=
ragment.java<br>
b/app/src/main/java/com/wireguard/android/fragment/TunnelDetailFragment.jav=
a<br>
index 57e0d8e..bc0726a 100644<br>
--- a/app/src/main/java/com/wireguard/android/fragment/TunnelDetailFragment=
.java<br>
+++ b/app/src/main/java/com/wireguard/android/fragment/TunnelDetailFragment=
.java<br>
@@ -115,7 +115,7 @@ public class TunnelDetailFragment extends BaseFragment =
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
getContext().getString(R.string.transfer_kibibytes, bytes/1024.0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (bytes &lt; 1024*1024*1024)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
getContext().getString(R.string.transfer_mibibytes,<br>
bytes/(1024.0*1024.0));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (bytes &lt; 1024*1024*1024*1024)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (bytes &lt; 1024*1024*1024*1024L)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
getContext().getString(R.string.transfer_gibibytes,<br>
bytes/(1024.0*1024.0*1024.0));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return getContext().getString(R.string.tr=
ansfer_tibibytes,<br>
bytes/(1024.0*1024.0*1024.0)/1024.0);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div>

--000000000000c6bba7059f6ea54c--

--===============2977978326039334687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2977978326039334687==--
