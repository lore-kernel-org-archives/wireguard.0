Return-Path: <SRS0=1Eb4=Z6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BD43C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Dec 2019 10:45:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04DB1206D6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Dec 2019 10:45:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="bR0cegrO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04DB1206D6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb47d41b;
	Sun, 8 Dec 2019 10:44:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e54948d
 for <wireguard@lists.zx2c4.com>; Sun, 8 Dec 2019 10:44:49 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa04e813
 for <wireguard@lists.zx2c4.com>; Sun, 8 Dec 2019 10:44:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4e1dfa9
 for <wireguard@lists.zx2c4.com>; Sun, 8 Dec 2019 09:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Zrk0yxOvzKSSxzObJLHBdVK/nRg=; b=bR0ceg
 rO+fdw+8IvBdyCuMLuC6vIhLWwElZp8oW3kDTeH08vnsR7BH1Wvd2utsl+tenYQC
 Thea9C4hKFQ5m53a1yUat0NqyK61o0aws/O6odrbe8vtC1xoTRundVrA4TD6oGYS
 XlunCwVZldWCmVneQIuVdqvVGsSNOQprxKXffpZn2GH7rJR1B9L4hfyxWVpyXuCo
 EP0KhijnnF7wgiq0zgkDMDBBM19G8YBSNFYzMIgt3fr7JMT6AwPFSQyOPJlkZt1G
 sCl7jqL2mM9/gD9/a0mdbi0hHh4YtQ0QPY8rUzSMrP59WGB7jGVoVZ0iHoYHN5CH
 J9vXoSYQZtE+6BlA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 753985a5
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Dec 2019 09:49:32 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id c16so3852134oic.3
 for <wireguard@lists.zx2c4.com>; Sun, 08 Dec 2019 02:44:48 -0800 (PST)
X-Gm-Message-State: APjAAAVnDlpAeUPjb4C5cNL/CSCc0GnEGCfClaCoYRWTMflMhkBKuFhB
 hkE1W2XrXMPxuP4i+lLTaYnLdhq5OO/7s+jMIjM=
X-Google-Smtp-Source: APXvYqw2xRrA44yrOmdN44yEmXsYnoKY2PKX8eXLBQGnWfxgHSsVeVL4PWjQUSCGHzEXQebRmHKOGq35tRwP6rw6YWw=
X-Received: by 2002:a05:6808:4cc:: with SMTP id
 a12mr4460806oie.115.1575801887812; 
 Sun, 08 Dec 2019 02:44:47 -0800 (PST)
MIME-Version: 1.0
References: <6c0d375eec6dddfcff8040df3a34e69a@cs.umd.edu>
 <dcf2a064-9800-8fcc-bd0c-3a604f8bd9bd@cs.umd.edu>
In-Reply-To: <dcf2a064-9800-8fcc-bd0c-3a604f8bd9bd@cs.umd.edu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 8 Dec 2019 11:44:35 +0100
X-Gmail-Original-Message-ID: <CAHmME9r4mgUzrqxJ7vEJZLqG7UVnQjAKrJSpDDF8h0hr7hnYBw@mail.gmail.com>
Message-ID: <CAHmME9r4mgUzrqxJ7vEJZLqG7UVnQjAKrJSpDDF8h0hr7hnYBw@mail.gmail.com>
Subject: Re: RHEL-8.1 backported a couple features breaking wireguard
 compilation.
To: Sergey Ivanov <seriv@cs.umd.edu>
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
Content-Type: multipart/mixed; boundary="===============1123201774281144406=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1123201774281144406==
Content-Type: multipart/alternative; boundary="000000000000c270c805992ef704"

--000000000000c270c805992ef704
Content-Type: text/plain; charset="UTF-8"

Thanks. The rhel backporting policy has generally been to not support older
point releases once new ones exist. So we'll move to supporting rhel 8.1
and drop 8.0. If you submit a properly formatted git patch with a sign off
line, I can apply it.

On Sun, Dec 8, 2019, 11:41 Sergey Ivanov <seriv@cs.umd.edu> wrote:

> Hi,
>
> on kernel 4.18.0-147.el8.x86_64 I am not able to compile
> https://git.zx2c4.com/WireGuard sources, tried tags 0.0.20191127 and
> 0.0.20191205 and master at 5eb87fb649.
>
> To compile it I did the following workaround:
>
> ===
>
>
> $ git diff
> diff --git a/src/compat/compat.h b/src/compat/compat.h
> index ab22fa4..6e034b5 100644
> --- a/src/compat/compat.h
> +++ b/src/compat/compat.h
> @@ -326,7 +326,7 @@ static inline int wait_for_random_bytes(void)
>   }
>   #endif
>
> -#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 0) && LINUX_VERSION_CODE
>  >= KERNEL_VERSION(4, 2, 0)
> +#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 0) && defined(ISRHEL8)
> && RHEL_MINOR < 1 && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 2, 0)
>   #include <linux/random.h>
>   #include <linux/slab.h>
>   struct rng_is_initialized_callback {
> @@ -831,7 +831,7 @@ static inline void skb_mark_not_on_list(struct
> sk_buff *skb)
>   }
>   #endif
>
> -#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 20, 0)
> +#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 20, 0) && (!defined(ISRHEL8)
> || RHEL_MINOR < 1)
>   #define NLA_EXACT_LEN NLA_UNSPEC
>   #endif
>   #if LINUX_VERSION_CODE < KERNEL_VERSION(5, 2, 0)
> ===
>
> --
>
>    Regards,
>
>    Sergey Ivanov
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000c270c805992ef704
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thanks. The rhel backporting policy has generally be=
en to not support older point releases once new ones exist. So we&#39;ll mo=
ve to supporting rhel 8.1 and drop 8.0. If you submit a properly formatted =
git patch with a sign off line, I can apply it.<br><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec 8, 2019, 11:41 Ser=
gey Ivanov &lt;<a href=3D"mailto:seriv@cs.umd.edu">seriv@cs.umd.edu</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
on kernel 4.18.0-147.el8.x86_64 I am not able to compile <br>
<a href=3D"https://git.zx2c4.com/WireGuard" rel=3D"noreferrer noreferrer" t=
arget=3D"_blank">https://git.zx2c4.com/WireGuard</a> sources, tried tags 0.=
0.20191127 and=C2=A0 <br>
0.0.20191205 and master at 5eb87fb649.<br>
<br>
To compile it I did the following workaround:<br>
<br>
=3D=3D=3D<br>
<br>
<br>
$ git diff<br>
diff --git a/src/compat/compat.h b/src/compat/compat.h<br>
index ab22fa4..6e034b5 100644<br>
--- a/src/compat/compat.h<br>
+++ b/src/compat/compat.h<br>
@@ -326,7 +326,7 @@ static inline int wait_for_random_bytes(void)<br>
=C2=A0=C2=A0}<br>
=C2=A0=C2=A0#endif<br>
<br>
-#if LINUX_VERSION_CODE &lt; KERNEL_VERSION(4, 19, 0) &amp;&amp; LINUX_VERS=
ION_CODE <br>
=C2=A0&gt;=3D KERNEL_VERSION(4, 2, 0)<br>
+#if LINUX_VERSION_CODE &lt; KERNEL_VERSION(4, 19, 0) &amp;&amp; defined(IS=
RHEL8) <br>
&amp;&amp; RHEL_MINOR &lt; 1 &amp;&amp; LINUX_VERSION_CODE &gt;=3D KERNEL_V=
ERSION(4, 2, 0)<br>
=C2=A0=C2=A0#include &lt;linux/random.h&gt;<br>
=C2=A0=C2=A0#include &lt;linux/slab.h&gt;<br>
=C2=A0=C2=A0struct rng_is_initialized_callback {<br>
@@ -831,7 +831,7 @@ static inline void skb_mark_not_on_list(struct <br>
sk_buff *skb)<br>
=C2=A0=C2=A0}<br>
=C2=A0=C2=A0#endif<br>
<br>
-#if LINUX_VERSION_CODE &lt; KERNEL_VERSION(4, 20, 0)<br>
+#if LINUX_VERSION_CODE &lt; KERNEL_VERSION(4, 20, 0) &amp;&amp; (!defined(=
ISRHEL8) <br>
|| RHEL_MINOR &lt; 1)<br>
=C2=A0=C2=A0#define NLA_EXACT_LEN NLA_UNSPEC<br>
=C2=A0=C2=A0#endif<br>
=C2=A0=C2=A0#if LINUX_VERSION_CODE &lt; KERNEL_VERSION(5, 2, 0)<br>
=3D=3D=3D<br>
<br>
-- <br>
<br>
=C2=A0=C2=A0 Regards,<br>
<br>
=C2=A0=C2=A0 Sergey Ivanov<br>
<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div></div></div>

--000000000000c270c805992ef704--

--===============1123201774281144406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1123201774281144406==--
