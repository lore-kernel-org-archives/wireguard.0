Return-Path: <SRS0=KrVi=4C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90790C2BA83
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 11:13:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E02B2082F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 11:13:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4hmJT2x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E02B2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e060cae;
	Fri, 14 Feb 2020 11:10:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b384bfb7
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 11:10:41 +0000 (UTC)
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2e0846b
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 11:10:41 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id 77so8771159oty.6
 for <wireguard@lists.zx2c4.com>; Fri, 14 Feb 2020 03:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3NaJnv6fbOcB2lHWl7SSVeroHzTe7NWzKCdnR/2lcVQ=;
 b=H4hmJT2xrzxu0xTL7gR5JAt4K/q+38zvv2GRMcpHDI+rUYBL2BZ1YY3MBM334F774U
 Ezr2HgOvQUUOu9jUuk1EjvXt8uoaxQda2n0S4TYNrXITZ52D76zzD6XQDSN2mPFq0ZQn
 TgaRjj7lVFPVW2DOMhBjaXehNMRozOlGKKuYARQzVL/SOjCcIyPvLTiahqYoZcXkHTZ8
 EvZ0kal2WYoZIFSmdN52Rc+71sqI9lWDRkGU+3U1d9SLzDmx91M+z1zox6qvHURxmJ8U
 /bWMiCK8vvxjo9/5zzPI4m/YnRMFYYX5berKGa0/PJehh9yPB99K42qYfTI0153gT9tk
 RI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3NaJnv6fbOcB2lHWl7SSVeroHzTe7NWzKCdnR/2lcVQ=;
 b=MV1ZT5fkxMNtsiRpQvmfZ+A+zr/wvuwXbc0Qc4J4dwO74Fae6Thfy8qECe2xRTMQdX
 SQOTmYK46BJB1Ye9ehR2I5s3ujJzxk41hLgongUuuX9kZE66uhPFsFA1l8HCYuvliys4
 D1IirRlLBEfKYCyO6xNpPxetrhyDxrWlgU2693tNBvZTO/HqPqZ1djcVxQBLl5sQBrDK
 69jX5xKggAy5PbkQmt6L8mq7n8NWKIn4OV3s3z2TfiLsu8iOTk8g1aQzuwOBNo6FZM+G
 NvuuBFDc/LbcUqc0Hc7kdk6iar8xs0KLeFcBxy2MrZx8c9bHasmnVPyeKKEHm6EZk83A
 eY9w==
X-Gm-Message-State: APjAAAWCNb/lgiw5JOuk5KnZE4p92u8oL7EtXmvjuD3VoVbj7calWErE
 PcTsAbxe1yDSw1EO0rANqksbmZ7F5DNIJHyrrqA=
X-Google-Smtp-Source: APXvYqz6o0xfBbzF83BT69HIaxm+DMfDjSPruGMwDzvnLxKX/KZCOSPsZAkpqyoPjx26jgyVjmNMlPUGcfpkmqemmOQ=
X-Received: by 2002:a05:6830:1e2b:: with SMTP id
 t11mr1842522otr.81.1581678766791; 
 Fri, 14 Feb 2020 03:12:46 -0800 (PST)
MIME-Version: 1.0
References: <20200207200035.69579-1-hristo@venev.name>
 <CAHmME9owUFjKsW=oGWeziQk8rjPm4cMrArJQ=nDP8+793w5PsA@mail.gmail.com>
In-Reply-To: <CAHmME9owUFjKsW=oGWeziQk8rjPm4cMrArJQ=nDP8+793w5PsA@mail.gmail.com>
From: =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
Date: Fri, 14 Feb 2020 13:12:35 +0200
Message-ID: <CAPWNY8UryuZY_RV7PKOUkgoe03ua-g=7Vq+YOoyqBzPRBwkwfw@mail.gmail.com>
Subject: Re: [PATCH] Implement reading keys from stdin.
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============8560527453127242513=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8560527453127242513==
Content-Type: multipart/alternative; boundary="0000000000000b1e7d059e874922"

--0000000000000b1e7d059e874922
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 9, 2020 at 12:23 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Thank for the patch, and nice hanging with you at FOSDEM.
>
> Trying to get a handle on the use case for this. Is this so that you
> can put the private key and the preshared key in a single file
> together? Is there a situation where the shell redirection trick
> doesn't cut it? For example:
>
> wg set wg0 private-key <(head -n 1 bothkeys) preshared-key <(tail -n 1
> bothkeys)
>

I would guess there are shells which don't have the <(cmd) bashism...

--=20
Mantas Mikul=C4=97nas

--0000000000000b1e7d059e874922
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Feb 9, 2020 at 12:23 AM Jason A. =
Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wr=
ote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Thank for the patch, and nice hanging with you at FOSDEM.<b=
r>
<br>
Trying to get a handle on the use case for this. Is this so that you<br>
can put the private key and the preshared key in a single file<br>
together? Is there a situation where the shell redirection trick<br>
doesn&#39;t cut it? For example:<br>
<br>
wg set wg0 private-key &lt;(head -n 1 bothkeys) preshared-key &lt;(tail -n =
1 bothkeys)<br></blockquote><div><br></div><div>I would guess there are she=
lls which don&#39;t have the &lt;(cmd) bashism...</div></div><div><br></div=
>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Mantas =
Mikul=C4=97nas</div></div></div>

--0000000000000b1e7d059e874922--

--===============8560527453127242513==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8560527453127242513==--
