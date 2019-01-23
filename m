Return-Path: <SRS0=esD3=P7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AE9C282C0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Jan 2019 13:21:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0686521848
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Jan 2019 13:21:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHVRCTAQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0686521848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 378c100b;
	Wed, 23 Jan 2019 13:15:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8bf0239
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Jan 2019 13:15:41 +0000 (UTC)
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2c6f720
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Jan 2019 13:15:41 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id i7so2220744qtj.10
 for <wireguard@lists.zx2c4.com>; Wed, 23 Jan 2019 05:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=HDaNVIC+w/GzFckuTUccXDuQdjq/wDYIOjrCEHO0js0=;
 b=SHVRCTAQrCHZsf5cXWSYcRBjtVjFZutbvMuul8VX9ZXsFUu9OwA09TYwSXq+la6WCK
 6m//uyHX98/gqEnL5fv0+N/gqQq1oF0o+jwAAqX6kRDmZKKHNMllYJEfAF5nme/vsaei
 TZxPbXcVCE638OxgHPgOZyuj0kllyHiTIbsvhdSYw1L1dpERefbQhTTewNlc1ENOWZTf
 g5S/bdW9nVAh63uJEgJ57LCzqVDqcD2xTX3COo88FWkGEBJEq57P//FuUPb1cse2JyL3
 UOCGmBAxCGTZaGNuQxHylhM5iMCqYVogArPsdQCE+0qtmqWS2gh5Y0AthzhKbFVJT+++
 hYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=HDaNVIC+w/GzFckuTUccXDuQdjq/wDYIOjrCEHO0js0=;
 b=Jtc7zkj4Q5UYYiFeOh2vULt9b2zY2z1I0MfeAmjEh4iwrDf/daxRN63HivmO2VYR4X
 VQvUYpqH29ssn0B0jNcT5JhY62r3xjlKFEcO0Yi7LevYHGPreD/TvOzS0oSHjT86Esfu
 xxbkbW8pEJZ+5hp89ieEpF+d9GbL+raReHFoz9+05MM6L7k63nZ8jXBzIvxQNlwbudGR
 LEVAl9X8/fVUaDNVv8IZtodDJlRZmFwlX0kL17nHSiy0PPiRikVy9atBcmsx/E+p36Ot
 coDcsbVjLYofHAJ3vrcQhNx+i/p9DaD/yrO68hFEx1VS3/AyEgScRhsiKktSci61fM7N
 dOcw==
X-Gm-Message-State: AJcUukce37BGlKSHmWqVihZ4Aw7FIDnj2VThvBmwYBvUVMemfmi/UhT8
 gd3EfPAAVyifO8oQk+JTS+2gkK4nDf1lPw3+U4KD2A==
X-Google-Smtp-Source: ALg8bN5mBQVn9Nx9nj1p7j9brCrC7EpeFePOGeDfxWjZyBs0WWPgN5K0POUsBJtsUdMH8ajiLlwZFdKv0ndlqbfxKy4=
X-Received: by 2002:a0c:99d9:: with SMTP id y25mr1859959qve.133.1548249645379; 
 Wed, 23 Jan 2019 05:20:45 -0800 (PST)
MIME-Version: 1.0
From: Laszlo KERTESZ <laszlo.kertesz@gmail.com>
Date: Wed, 23 Jan 2019 15:20:33 +0200
Message-ID: <CANcuY=rHWH7=yOXSv5iMcnN_8tsX4_MAJdorsTZLfuF7ZD1j7g@mail.gmail.com>
Subject: Clients lose connection until the interface is restarted somehow if
 server changes IP address
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
Content-Type: multipart/mixed; boundary="===============7744146884184843250=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7744146884184843250==
Content-Type: multipart/alternative; boundary="00000000000022f3f305801ff63c"

--00000000000022f3f305801ff63c
Content-Type: text/plain; charset="UTF-8"

Hi,

I have a wireguard server that runs on a computer that has a dynamic real
ip address. It also has a dynamic DNS address that is updated if the IP
changes.
The clients connecting to it work but if the ip address is changed, they
will still try to connect the old IP address. If i restart the wireguard
interface (ip link up/down etc) the connection is established again.

The solution would be that in case of connection loss the DNS name to be
updated periodically instead of just trying the old address.
Can this be done?

--00000000000022f3f305801ff63c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I have a wireguard serve=
r that runs on a computer that has a dynamic real ip address. It also has a=
 dynamic DNS address that is updated if the IP changes.</div><div>The clien=
ts connecting to it work but if the ip address is changed, they will still =
try to connect the old IP address. If i restart the wireguard interface (ip=
 link up/down etc) the connection is established again.</div><div><br></div=
><div>The solution would be that in case of connection loss the DNS name to=
 be updated periodically instead of just trying the old address.</div><div>=
Can this be done?<br></div></div>

--00000000000022f3f305801ff63c--

--===============7744146884184843250==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7744146884184843250==--
