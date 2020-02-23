Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB01BC35671
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 11:38:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AB0C20637
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 11:38:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="WMlpmxYB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AB0C20637
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3041b758;
	Sun, 23 Feb 2020 11:34:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf2342d4
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 11:34:47 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2544f3b
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 11:34:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16d93ec4
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 11:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=7iDlHEN5SSK8y0h+xt68BqDrmvE=; b=WMlpmx
 YBEFEyrs/o1bntMHe6g/avTh80ZAaU7q5vRqxgYG5njNBXaWBIoXCe5KUl3/1YAz
 W1hwy1PC8kG//sha2632TbjkSxEYE0twJ7r6MaFQeNU106FhDcEaOn4w4t7Ibh7m
 muzAVEGr4U92wmZURlECA5DgwmPvtvTzVr3GlWa/mNILWVvJ+O3BPWIxNYhu6yby
 2E0xxFoyk30o7LKqcXiduQPJXmKW1x0QoHOiP7C4ICGMQOvlgEM9onOi0yPuuQom
 2lMCZbzgWNa79q2GZOnpd8nPVj1XbNUa4dybF873WtKy4CS5cuZ9MB6ycdfxXKpj
 v3kjbZ/VXKsMPfRA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eede1e06
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 11:34:47 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id j20so6243872otq.3
 for <wireguard@lists.zx2c4.com>; Sun, 23 Feb 2020 03:38:02 -0800 (PST)
X-Gm-Message-State: APjAAAXAi0f1a6eFChZ+iehq51ihbYOfq9DdTSYwAviLoTEk6CmoagRv
 +el3kaUBCZWBcvcg19Q43HSkzX8Pi0Xq0W5hyRA=
X-Google-Smtp-Source: APXvYqzEpm/gS52LZ9Vde4PjVpmkJBjOtbPQgJ1Oy7Hvj0Zo9IabJKVKBmI+E+CNcZYJcFynqOfBzeh0r2Km1eYfR5s=
X-Received: by 2002:a9d:674f:: with SMTP id w15mr36129273otm.243.1582457881764; 
 Sun, 23 Feb 2020 03:38:01 -0800 (PST)
MIME-Version: 1.0
References: <01F8520D-6F1E-4DFB-BC07-80D9838EF35D@libassi.se>
In-Reply-To: <01F8520D-6F1E-4DFB-BC07-80D9838EF35D@libassi.se>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 23 Feb 2020 12:37:48 +0100
X-Gmail-Original-Message-ID: <CAHmME9ozSn+f1s9+q4-L_PA+Q76YY81X8_P2i4jMhYM8Or-17Q@mail.gmail.com>
Message-ID: <CAHmME9ozSn+f1s9+q4-L_PA+Q76YY81X8_P2i4jMhYM8Or-17Q@mail.gmail.com>
Subject: Re: FreeBSD wireguard wg-quick remote IP address assignment is
 incorrect
To: Peter Libassi <peter@libassi.se>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

We tried this already and it didn't work. See the below commit.
Perhaps you can update that bug report you filed?

commit 2c6cabd73dfb23990c245250ef2e502bdb33d189
Author: Jason A. Donenfeld <Jason@zx2c4.com>
Date:   Thu Feb 28 19:03:11 2019 +0100

   wg-quick: freebsd: rebreak interface loopback, while fixing localhost

   The commit 7c833642 ("wg-quick: freebsd: allow loopback to work") was
   supposed to make things better, but actually it just started sending
   legitimate localhost traffic over the WireGuard interface, which is
   really quite bad.

   This reverts commit 7c833642dfa342218602ab18e7091e86408d2982.

   Reported-by: Matt Smith <matt.xtaz@gmail.com>
   Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

diff --git a/src/wg-quick/freebsd.bash b/src/wg-quick/freebsd.bash
index 93f1a3b7..e83dbef0 100755
--- a/src/wg-quick/freebsd.bash
+++ b/src/wg-quick/freebsd.bash
@@ -158,7 +158,7 @@ add_addr() {
       if [[ $1 == *:* ]]; then
               cmd ifconfig "$INTERFACE" inet6 "$1" alias
       else
-               cmd ifconfig "$INTERFACE" inet "$1" 127.0.0.1 alias
+               cmd ifconfig "$INTERFACE" inet "$1" "${1%%/*}" alias
       fi
}
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
