Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF3BC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 11:08:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6846D2077B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 11:08:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYZ3co6y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6846D2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c743a76;
	Mon, 9 Dec 2019 11:07:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89a1425f
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 12:23:51 +0000 (UTC)
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35c8baf6
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Nov 2019 12:23:51 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id l20so19885536oie.10
 for <wireguard@lists.zx2c4.com>; Wed, 27 Nov 2019 04:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=aD07CxVDmL6+dExGVlxeQnXIm4kopZhDzCs3+gGhBHc=;
 b=RYZ3co6y2U9CtAQsQ33qqbrSjKDuiUJT7ym31kxWaSFEbIFj90L1hD4KMj6ztjF6Sq
 pdChgPK5o29hlFda+nE39v/baIaGcq8q+gcB7VQLNtWnJ8pUYZxGCip8qqjmZo81kypp
 V+t7qsATSh5hdJTqdVUvRArS3S6725HLolcvQs8fKpmkSuLLM4v8eeM4c8pWgG/8ADFL
 hx0coAcaRf11B1xmCUk8Xk7xZo7ifXk5fVLKenf71TziuiICZ2LYEYajsJAjQoEpMqGy
 z3DKuYHRpU6RaXMlsaXzRFPTOkaJ4P6R0G2yEpYEFL2tcmkLuk0ZIwsUI8cyu9faiHoy
 OxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aD07CxVDmL6+dExGVlxeQnXIm4kopZhDzCs3+gGhBHc=;
 b=A8JWUNbgTcGw1d76POIt8YyyMqNmaE0vEcqQsirrkBgru1nYgYcK1SqBVKBF36LN5D
 Ft9Kyrs7J7h7Y5A0ZsUWF44+1/p1u6kFyHwxgiGoag2eG6xwNid3BaHOFen0s/huRQFl
 GM0dvFHNQ57U8EllusZidteFQyXLbqT+EkFZecx/5K9bPnxDzctK0l61lMU5COqKEtLU
 xQV23oMK8q5SWOrgxp9L+rOzM3pkScoFEQLDwiTGUXrbebfXVZE4XIqXn79WMd5qCBmG
 3H2hUbB4z1EIYWEp7y3fj+sZu2GOmrKduZPeAXLChSc5N2ApW5iPQAgJ51TuSI5/OuQY
 Jycw==
X-Gm-Message-State: APjAAAVKHGZfSOGPBQSI/9Uyd8PiAkBWRL7GDLf3s4nPhrL0OFdRyrz2
 B9c2OUtz5X5Y4cgnkLK73aovxJn1V6CDd66A8cP9Mw4nCMU=
X-Google-Smtp-Source: APXvYqw3kIVMYv6OFVkZr+MnduitAuHKkLHCZ/yR0hx+0mTiwemagMKvGsANTSf6taVL4P0wJU5KhyrSZOxG0VDb4Hg=
X-Received: by 2002:a05:6808:4cf:: with SMTP id
 a15mr3785308oie.132.1574857430019; 
 Wed, 27 Nov 2019 04:23:50 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
Date: Wed, 27 Nov 2019 14:23:39 +0200
Message-ID: <CAPWNY8WG1mYJfFPUDQ7KYjnYccJ0zGu0ULMbKn3UXsxqDV3Vrg@mail.gmail.com>
Subject: Android feature request: import from URL
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 09 Dec 2019 12:07:58 +0100
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
Content-Type: multipart/mixed; boundary="===============7908106530560599757=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7908106530560599757==
Content-Type: multipart/alternative; boundary="000000000000b0357405985311ac"

--000000000000b0357405985311ac
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Would it be possible for the Wireguard Android app to import profiles
directly from an URL in a webpage? I imagine this could be implemented by
recognizing URLs like "wireguard:" or "wireguard://" followed by a
Base64-encoded config blob, similar in style to "data:" URIs.

A few other VPN applications also support adding VPN profiles directly from
an URL (e.g. strongSwan recognizes https://*.sswan JSON files); this would
be simpler than downloading and importing a file and doesn't require a
second device the way QR-codes do. (I'm trying to create a self-service VPN
system for students, and want the provisioning process to be as
straightforward as possible.)

--=20
Mantas Mikul=C4=97nas

--000000000000b0357405985311ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><div><br></div><div>Would it be possible for th=
e Wireguard Android app to import profiles directly from an URL in a webpag=
e? I imagine this could be implemented by recognizing=C2=A0URLs like &quot;=
wireguard:&quot; or &quot;wireguard://&quot; followed by a Base64-encoded c=
onfig blob, similar in style to &quot;data:&quot; URIs.</div><div><br></div=
><div>A few other VPN applications also support adding VPN profiles directl=
y from an URL (e.g. strongSwan recognizes https://*.sswan JSON files); this=
 would be simpler than downloading and importing a file and doesn&#39;t req=
uire a second device the way QR-codes do. (I&#39;m trying to create a self-=
service VPN system for students, and want the provisioning process to be as=
 straightforward as possible.)</div><div><div><div><br></div>-- <br><div di=
r=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div=
 dir=3D"ltr">Mantas Mikul=C4=97nas</div></div></div></div></div></div>

--000000000000b0357405985311ac--

--===============7908106530560599757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7908106530560599757==--
