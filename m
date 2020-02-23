Return-Path: <SRS0=vIw3=43=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CF1C10F25
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Mar 2020 01:33:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A009A24655
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Mar 2020 01:33:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnhdjWO+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A009A24655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f98b63a;
	Tue, 10 Mar 2020 01:28:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65fb39b1
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 10:02:29 +0000 (UTC)
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15eb5f3d
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 10:02:29 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id l4so5340303ilj.1
 for <wireguard@lists.zx2c4.com>; Sun, 23 Feb 2020 02:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=zyuEK2GRUdSDpAHNVsLq61pNzUDfPIpx+nOsPjavsI0=;
 b=NnhdjWO+WCJ2vv54dTqojI4tOufgc1HMdECKvCUv3yl5sO0q3+884C70eyR2VtLKd9
 XxCVJWJeM/bKMRaj7e0KalJ0LCuEH4OqZJWRch5KOHcXYLAXf1IqhgVXBQP4ttCqA60V
 2hF9avbR2M+0mr56L5hiptzSCmtFYcRHtc0ZRcGNbRrr/ZxIiCPkCiFbNNIZG+fSoedM
 AldK7yy4r5mSj9xSRWb/jd2Sps8hEEtIjh6uPyoHRp6zubV98oLzvtoQOR54IYLegnJM
 lDkSB9y5bLBkGF3kvnnaaqeM8NvfggoExlcif3Ybizv1DpoR2D6fCzmMbprSAT7oAAHH
 TmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zyuEK2GRUdSDpAHNVsLq61pNzUDfPIpx+nOsPjavsI0=;
 b=Jpe1cgPKqCI/qrzGQSRiE/sl2JoUuX0jkx9SC+hOzNtVW5h0zLVt4Fz4HFODlQZWyM
 WLj9t28alo83hRWfC5L/nh8mzbqm3Wy7zhlYPnSaAfHh8IIFzxRZ2UA+2hKmUuPjnZ0s
 /PxivC154kzuSHtYDRJP0ysEcQfBNiRzCfOnVfXsbncKz58Ccme791u87fSLNE5tHLbP
 gcOyZhlSjSvN+uWDMaiQZGUiE9uawtsKE3I6uV+B8TU0F+bZpIsi5nV7d2wAqBiHzkvw
 /bM8/6hntOoKKIbABGA1KpAka980ATr9+JfaFbNY4t4RlfD1V4z9EUkHIAHjx7+xwcRf
 ZoeQ==
X-Gm-Message-State: APjAAAWfZp76epn5kY4W5o1zgUAK2LvGbibm7phPIJVaNTGGPd5szzyB
 bkNvxTLK4xdipKk3zLykRHtPs61s5NCPfnjw/rXRdeHS
X-Google-Smtp-Source: APXvYqxpzEWYnBI024hXoaYswerWCRDHOMNHI4kYgy2nAMtAwXwdRPyrzKw+U69u5Qytg8Ai0yhJn5urSRjqdnJZ4zw=
X-Received: by 2002:a92:ca82:: with SMTP id t2mr51316985ilo.242.1582452343470; 
 Sun, 23 Feb 2020 02:05:43 -0800 (PST)
MIME-Version: 1.0
From: Patrick Fitzgerald <paddyfitz@gmail.com>
Date: Sun, 23 Feb 2020 02:05:31 -0800
Message-ID: <CAEW+QQ6L1vLsunSOOJ910WQdHHNe_F4-tV3AwFpijtyrjgJRUg@mail.gmail.com>
Subject: wireguard-android Kotlin
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="000000000000ce7ee7059f3b6574"
X-Mailman-Approved-At: Tue, 10 Mar 2020 02:28:11 +0100
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

--000000000000ce7ee7059f3b6574
Content-Type: text/plain; charset="UTF-8"

Hi,
I've noticed the wireguard-android repo is written in Java.

Has there been much thought put into converting it to Kotlin?

There's an unofficial version of the Android client in Kotlin:

https://github.com/wlaotou/wireguard-kt

Would be glad to help out with the migration to Kotlin.


Cheers,
Patrick

--000000000000ce7ee7059f3b6574
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto">I&#39;ve noticed the wireguard-andro=
id repo is written in Java.=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Has there been much thought put into converting it to Kotlin?=C2=
=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">There&#39;s an unoff=
icial version of the Android client in Kotlin:</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto"><a href=3D"https://github.com/wlaotou/wireguard-kt">=
https://github.com/wlaotou/wireguard-kt</a><br></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Would be glad to help out with the migration to Kot=
lin.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Cheers,</div><div dir=3D"auto">Patrick</div></div>

--000000000000ce7ee7059f3b6574--
