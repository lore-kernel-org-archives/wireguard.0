Return-Path: <SRS0=zPJk=RR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D8EC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 06:47:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F5422085A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2019 06:47:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9La/vld"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F5422085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a1b61d0;
	Thu, 14 Mar 2019 06:36:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e324d58b
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 06:36:07 +0000 (UTC)
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f47e1ba0
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 06:36:07 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id y6so4022926ioq.10
 for <wireguard@lists.zx2c4.com>; Wed, 13 Mar 2019 23:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X30nu43SwiSxw/jKTRyKiqsrCMzmW/GgUJRTMlgd9M4=;
 b=h9La/vld0NbCjLuqT13TTGPnerbkTDORyfRvoo4gz/RaXghqPw6b15SQ1GUOm8Ljw0
 FrvXE1dMyofLLgV56aBpJwD5qMILhd3puEsEd9NTL86j5GA3qIwURcO4rbqSftN/JYmm
 YxyGsKAXyA7wdaUFZ7ubA5PDkJPg9+OjyvQCWzTOuVQuN8V6ROfCsqqp8MVf6uFcmsl6
 GQToanL+sURzqykhsgCiPyKNAEKerRzdn4NNJJCcmkLnBS2U2IJ74I8cRPq/tX4AMz48
 VWcN8n11yuUQ4rEoxSIc4sAzabpeQQKpr2OPr3nUdhjz4FAyOTot162a8aUYLSzyxErg
 JFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X30nu43SwiSxw/jKTRyKiqsrCMzmW/GgUJRTMlgd9M4=;
 b=e9OYrDnIA8AU5bfe96yKccFD+lUJ61ndJQxrimP0vn7ZY/SHmyEiBSmJn2ni6Z76OK
 1mVIjCvxvBpdGUB5JwXbRQoJtdJRH/yFlss9QN+DpsQ+iwD3UtFi/0gtZcI30K4RXBmh
 RuG/MP8Mhb+WrdUSkJ6xm6X5zYsygLz4iwtO2lHK5wn4IfjL5EyI4zkk+PB4g2vgH+Zb
 bEcb8RgfNXWJ5XA5fE0hhjZQmV/66644K2COos8swtOeKRX0975TqfXcSuF2jfZBCBI+
 PNouNwxZ0KcXny+4n4U6KxXO+AcqTG+LqRAgrLhhT5POnABtH5gY5mZIFpuoVaO1qQpq
 9m4g==
X-Gm-Message-State: APjAAAUMggcF4DLDenudqIRhCpAeoidI1gNQqFJjnSmot6eQxGkqRvIM
 XTzkXvGrzk7Nph5FohWeoNjCwWnfc+j3SnUQ89tXi4hu
X-Google-Smtp-Source: APXvYqz3lqhn/Qmv6t5OCshw8v6KmjTGrdd8UKom9l7224+Q3/KRIcZ23gnJM7JWE45qCj0STNVXaFyxJlZnRW2oGJI=
X-Received: by 2002:a6b:6b1a:: with SMTP id g26mr9558805ioc.211.1552546053155; 
 Wed, 13 Mar 2019 23:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190313224643.17904-1-derrick@pallas.us>
In-Reply-To: <20190313224643.17904-1-derrick@pallas.us>
From: Triffid Hunter <triffid.hunter@gmail.com>
Date: Thu, 14 Mar 2019 14:47:22 +0800
Message-ID: <CACL3eKB7SLDoAbWc9+k5s4SE4jDKRu_FYSpUx0Co_83=cdfqog@mail.gmail.com>
Subject: Re: [PATCH 1/2] peer: add wg_peer_reset_keys
To: derrick@pallas.us
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
Content-Type: multipart/mixed; boundary="===============1838053658960261509=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1838053658960261509==
Content-Type: multipart/alternative; boundary="000000000000fef02f0584084be3"

--000000000000fef02f0584084be3
Content-Type: text/plain; charset="UTF-8"

This sounds interesting, as I often get long (10-30 minute) stalls where wg
is doing nothing but throwing keys back and forth. I'll let you know if it
helps when I have a chance to test properly.

On Thu, 14 Mar 2019 at 06:44, <derrick@pallas.us> wrote:

> From: Derrick Pallas <derrick@pallas.us>
>
> This function will clear the key state for the peer and reset its handshake
> timer.  This is useful, for instance, if it is known that the current key
> material is bad.  Currently, this happens when the private key is changed.
>
> Signed-off-by: Derrick Pallas <derrick@pallas.us>
> ---
>  src/peer.c | 14 ++++++++++++++
>  src/peer.h |  1 +
>  2 files changed, 15 insertions(+)
>
> diff --git a/src/peer.c b/src/peer.c
> index 996f40b..be244a4 100644
> --- a/src/peer.c
> +++ b/src/peer.c
> @@ -160,6 +160,20 @@ static void peer_remove_after_dead(struct wg_peer
> *peer)
>         wg_peer_put(peer);
>  }
>
> +void wg_peer_reset_keys(struct wg_peer *peer)
> +{
> +       if (unlikely(!peer))
> +               return;
> +       lockdep_assert_held(&peer->device->device_update_lock);
> +
> +       wg_noise_handshake_clear(&peer->handshake);
> +       wg_noise_keypairs_clear(&peer->keypairs);
> +       wg_cookie_checker_precompute_peer_keys(peer);
> +       atomic64_set(&peer->last_sent_handshake,
> +               ktime_get_boot_fast_ns() -
> +                       (u64)(REKEY_TIMEOUT + 1) * NSEC_PER_SEC);
> +}
> +
>  /* We have a separate "remove" function make sure that all active places
> where
>   * a peer is currently operating will eventually come to an end and not
> pass
>   * their reference onto another context.
> diff --git a/src/peer.h b/src/peer.h
> index 23af409..f85817f 100644
> --- a/src/peer.h
> +++ b/src/peer.h
> @@ -79,5 +79,6 @@ static inline struct wg_peer *wg_peer_get(struct wg_peer
> *peer)
>  void wg_peer_put(struct wg_peer *peer);
>  void wg_peer_remove(struct wg_peer *peer);
>  void wg_peer_remove_all(struct wg_device *wg);
> +void wg_peer_reset_keys(struct wg_peer *peer);
>
>  #endif /* _WG_PEER_H */
> --
> 2.19.2
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000fef02f0584084be3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This sounds interesting, as I often get long (10-30 minute=
) stalls where wg is doing nothing but throwing keys back and forth. I&#39;=
ll let you know if it helps when I have a chance to test properly.<br></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, 14 Mar 2019 at 06:44, &lt;<a href=3D"mailto:derrick@pallas.us">derrick@p=
allas.us</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">From: Derrick Pallas &lt;<a href=3D"mailto:derrick@pallas.us" targe=
t=3D"_blank">derrick@pallas.us</a>&gt;<br>
<br>
This function will clear the key state for the peer and reset its handshake=
<br>
timer.=C2=A0 This is useful, for instance, if it is known that the current =
key<br>
material is bad.=C2=A0 Currently, this happens when the private key is chan=
ged.<br>
<br>
Signed-off-by: Derrick Pallas &lt;<a href=3D"mailto:derrick@pallas.us" targ=
et=3D"_blank">derrick@pallas.us</a>&gt;<br>
---<br>
=C2=A0src/peer.c | 14 ++++++++++++++<br>
=C2=A0src/peer.h |=C2=A0 1 +<br>
=C2=A02 files changed, 15 insertions(+)<br>
<br>
diff --git a/src/peer.c b/src/peer.c<br>
index 996f40b..be244a4 100644<br>
--- a/src/peer.c<br>
+++ b/src/peer.c<br>
@@ -160,6 +160,20 @@ static void peer_remove_after_dead(struct wg_peer *pee=
r)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 wg_peer_put(peer);<br>
=C2=A0}<br>
<br>
+void wg_peer_reset_keys(struct wg_peer *peer)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (unlikely(!peer))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0lockdep_assert_held(&amp;peer-&gt;device-&gt;de=
vice_update_lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wg_noise_handshake_clear(&amp;peer-&gt;handshak=
e);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wg_noise_keypairs_clear(&amp;peer-&gt;keypairs)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0wg_cookie_checker_precompute_peer_keys(peer);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0atomic64_set(&amp;peer-&gt;last_sent_handshake,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ktime_get_boot_fast=
_ns() -<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(u64)(REKEY_TIMEOUT + 1) * NSEC_PER_SEC);<br>
+}<br>
+<br>
=C2=A0/* We have a separate &quot;remove&quot; function make sure that all =
active places where<br>
=C2=A0 * a peer is currently operating will eventually come to an end and n=
ot pass<br>
=C2=A0 * their reference onto another context.<br>
diff --git a/src/peer.h b/src/peer.h<br>
index 23af409..f85817f 100644<br>
--- a/src/peer.h<br>
+++ b/src/peer.h<br>
@@ -79,5 +79,6 @@ static inline struct wg_peer *wg_peer_get(struct wg_peer =
*peer)<br>
=C2=A0void wg_peer_put(struct wg_peer *peer);<br>
=C2=A0void wg_peer_remove(struct wg_peer *peer);<br>
=C2=A0void wg_peer_remove_all(struct wg_device *wg);<br>
+void wg_peer_reset_keys(struct wg_peer *peer);<br>
<br>
=C2=A0#endif /* _WG_PEER_H */<br>
-- <br>
2.19.2<br>
<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--000000000000fef02f0584084be3--

--===============1838053658960261509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1838053658960261509==--
