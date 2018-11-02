Return-Path: <SRS0=Sa1Q=NN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26802C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Nov 2018 07:25:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D6192082D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Nov 2018 07:25:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJOvAnqs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D6192082D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 355d8968;
	Fri, 2 Nov 2018 07:21:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dbb49cda
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 07:21:24 +0000 (UTC)
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73d7376d
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 07:21:24 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id d135so1568814qkc.12
 for <wireguard@lists.zx2c4.com>; Fri, 02 Nov 2018 00:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=B+Dq0e/fPHsh2HwUM+T02PsjC01u6JPUmomuyTgrjqY=;
 b=AJOvAnqsl29YsdnBCOKg8NZL+Jvm9hiHLajdVJvWqw1o3alceS4FeMvgk8ZALWNhoU
 MvG31m5ddAG/1XWg4bJuc0V5BLCfwXpkYETcjeOcpIDUtVodzM8IvPTnp2CaWP9H7v6b
 6EbkgzoD2F65onn8PIDHwDledlU2sEp6abkebzjk9VTVKxtmE8LlS3yE/z6O+EtCGULY
 ilQG4cuv9CvKtuEYfup4o9OQnI+QAPLVdSCcGZ+X2s35YsEwEQgh3wV62+QuCoA72s6Z
 sVR3oMJFYxiOb2ys68oO11UrgBjXWOXhjt/O0vvVfnHAyg3xaqJM03LfpFAPUxIhWEAq
 DLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=B+Dq0e/fPHsh2HwUM+T02PsjC01u6JPUmomuyTgrjqY=;
 b=fSiOCclTfN/SjOT4Ro73VbIbxv8+8kqZhnkguYqe+R/O0uKs6ASBKNKoWRwlydFlvk
 886135jKplNCSoJ7bGRt1VevdUJ47F969EYS8a3swKQtRKIA5Y4kyyJNvSWo0Brlq5/V
 5dk9GPmD8uEo8PnUb+ZquqqLQxpBeoTAuP2ZaUTobSnMJhyaD8PXYcvclidieD2M6b/g
 Kj7CrjlfhIRdEX3ZSOHUxX3H2PQ8XXwPf/Qk+XKJwJhEYdl0B0dL7qL/Kidk2aptAgt5
 Nbe8umz56lbuCnGQzcEKR7Kfc9VZHrOrfEUMNlQi617opevG0WUV0RkKQvLOaq5yVQ04
 lsqA==
X-Gm-Message-State: AGRZ1gKUsjR70TMCfJrAhNVRtgu0Xqv1sVY3iGqFuFlBuiILP7yZeIPx
 kPNQQfTF3+son0w4w0O4FN+41i9QjwTW9anIhYe6EZUM
X-Google-Smtp-Source: AJdET5faJv4LzLkiirjrx0sHKMu5T4Ma54+U28udTi0yaFkFpB8T/1za58l9KTz6nr+OtVbV8hqgUE4LYUP+va8FW4E=
X-Received: by 2002:a0c:ba24:: with SMTP id w36mr8673714qvf.60.1541143513488; 
 Fri, 02 Nov 2018 00:25:13 -0700 (PDT)
MIME-Version: 1.0
From: Laszlo KERTESZ <laszlo.kertesz@gmail.com>
Date: Fri, 2 Nov 2018 09:25:01 +0200
Message-ID: <CANcuY=qyERAxMcREiBJutdYbGX-tJPMhUdmxN_=TwQHiamiaNw@mail.gmail.com>
Subject: F Droid build 0.0.20181031 broken
To: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============0720499194311617986=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0720499194311617986==
Content-Type: multipart/alternative; boundary="000000000000ab63240579a96f8b"

--000000000000ab63240579a96f8b
Content-Type: text/plain; charset="UTF-8"

Hi,

The current FDroid build (version 0.0.20181031) is broken. The Gui starts
but it states "Unknown userspace Go version" and the tunnel activation
action results in an error.

--000000000000ab63240579a96f8b
Content-Type: text/html; charset="UTF-8"

<div dir="auto">Hi,<div dir="auto"><br></div><div dir="auto">The current FDroid build (version 0.0.20181031) is broken. The Gui starts but it states &quot;Unknown userspace Go version&quot; and the tunnel activation action results in an error.</div></div>

--000000000000ab63240579a96f8b--

--===============0720499194311617986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0720499194311617986==--
