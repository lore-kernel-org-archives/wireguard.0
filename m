Return-Path: <SRS0=e3Y3=QZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B537C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 03:00:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91892218D8
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Feb 2019 03:00:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwBfASMu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91892218D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 379f4b0a;
	Mon, 18 Feb 2019 02:51:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44611c99
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Feb 2019 02:51:38 +0000 (UTC)
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 903e6eb7
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Feb 2019 02:51:36 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id y20so17614682qtm.13
 for <wireguard@lists.zx2c4.com>; Sun, 17 Feb 2019 18:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=fnUqaysej/YfqxOTs/icON7ieooDSFqnGbuAMGzIzZE=;
 b=YwBfASMuafANabSeqiivSI5YoSMEaN3yir6/5Eq2Wf6FkDj1STd4DXwTJeXA8GXv8h
 5v0WQTdjOm7iztynsABErmAtQkwvP6Sl7Bn7SSdqd009Y1U9AMGTFlEhBfbAjqUdcm3F
 yvGEVH7oPtD8t/jO+N6aIVn3puwAcVB19SdqJ6E+AReAckbl70uv7oGirmqqSdsltMyc
 3o52yhNWfom2h6RZrAMadQeMfaRSKlYpxDAYE12VE9BsBtpWLdDxR/HnkkMvsgvZemoh
 4lssT6X0gRCd2Y5DkVxb6H3yrQYWMc2mzxAwBN0RoqNuzofKA3S+dQOwpJb0GVBiOX4h
 II4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fnUqaysej/YfqxOTs/icON7ieooDSFqnGbuAMGzIzZE=;
 b=XULDdmXTbTGyEv4kMzPwyE0SWZdQFhi6vm3LryQvUB8uWQ4Z72cm+rNlfaAUCRXdPe
 bIpRoKPGMn7RNZpAfMJQ9AnP4/X8WDhic0j/uvW1HIdqOpWoMeMm5J+V1sKKQ7Klcnfs
 t/4u/uGpNgoNUMabEHn1yBCjOsYkWeBVqtJ3m4dy0kauV+mKetmMPbKTf2Wv40aBFqR8
 suzBVfchr/fhV+iJh8xtIRN+Ms2nv6EadM9lHESoNYJzra2hm7EjQ3wqMLLtz0UKt7i+
 RnWOuJpRJivERP6KZySkubNnv6swFAY2mqHSbJJh3xqoSDxt+XHKwRlqo/a/rdV6Tw76
 dNrQ==
X-Gm-Message-State: AHQUAub9/dyqAvek3710QUheqsrm3Xl4k5qv1o1MxS6zSN0mXAS+7R2O
 fpcj0wfJEQ6dfdrl+6SOBCDDEJmCJm8fr4ahDtzJkQ==
X-Google-Smtp-Source: AHgI3IZ/PP/OS5bONZojMrawJE4U9yWRUvx3SO60mHcEl9QQdSH3C5wusrG0obv27TF8xFpqfzZn2Sl+fdZyWueeWCk=
X-Received: by 2002:ac8:3519:: with SMTP id y25mr16974335qtb.35.1550458797651; 
 Sun, 17 Feb 2019 18:59:57 -0800 (PST)
MIME-Version: 1.0
From: Ryan Whelan <rcwhelan@gmail.com>
Date: Sun, 17 Feb 2019 21:59:46 -0500
Message-ID: <CAM3m09Qfi3a+zZ6KKxxT0q7rDopUYhYFX9JT-wSgsLvQCELY7A@mail.gmail.com>
Subject: Netlink Protocol
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============1815113776491154633=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1815113776491154633==
Content-Type: multipart/alternative; boundary="000000000000df7aec058222514c"

--000000000000df7aec058222514c
Content-Type: text/plain; charset="UTF-8"

I'm assuming the in-kernel version of wiregaurd on Linux configured via
Netlink- if so, is the protocol documented?

thanks

--000000000000df7aec058222514c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m assuming the in-kernel version of wiregaurd on Lin=
ux configured via Netlink- if so, is the protocol documented?=C2=A0<div><br=
></div><div>thanks</div></div>

--000000000000df7aec058222514c--

--===============1815113776491154633==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1815113776491154633==--
