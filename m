Return-Path: <SRS0=3Rrq=4D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F9AC7114D
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 19:41:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED2212082F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 19:41:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="R7SDBVlW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED2212082F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c8c583e;
	Sat, 15 Feb 2020 19:39:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20869b9b
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 19:39:40 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1428f5cd
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 19:39:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aba42cb6
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 19:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=WbqrSGI/HDPqAiTkY1rQPMyq7Lo=; b=R7SDBV
 lWLYXdtD3LEIniFuGrYKkhroV0zRopS3J7YC2YokFA41yoBU7vUbRN9UNUgRAi2i
 Rsl0Vsh8fScLqga7wS4ypnDAyihh20yb1gVGwyjU7er0AcZ+d7TKm9y7uhfGmJRV
 lM2oPbeEV7JPvrngmnvK90ALy3QdRPeMVkl1GTvzFB1befBDvJ8BlrSIQ1WIgM2k
 qg+7MMZxZ+vypD32KoiJAHArl6bjG8euHlAQINAyiWsyBZhkhfAOKLTgOcYV/UjC
 1qkiT3G3RzAF/O54NPfEochGUAl8jNn+0ex967cB749wYSC8lYCqiUdHVEy9gniw
 2KKd6Lr/ZToKMBgQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b395fb17
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 19:39:40 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id g64so12382267otb.13
 for <wireguard@lists.zx2c4.com>; Sat, 15 Feb 2020 11:41:56 -0800 (PST)
X-Gm-Message-State: APjAAAV/KRlglZZPpPFvC9pZV0KfMs1/u1LQYLB7GztlZO4QGbvC1XTP
 dQWtOqtecjqdXzR8nX5jD3PlSnAxBP49Trgf03U=
X-Google-Smtp-Source: APXvYqyJ417qp1S0nrvESriizB1ww+47qn9eThzH7W/kuu4EE4omh1+WzGTdGjNdxcMoyqdxN2ZwcGCWiXox/rnAOc0=
X-Received: by 2002:a9d:6a53:: with SMTP id h19mr7115589otn.120.1581795715897; 
 Sat, 15 Feb 2020 11:41:55 -0800 (PST)
MIME-Version: 1.0
References: <CAFOG8dP4+9=S69bgs53Xqdfi4bKyxayR_cuoFvXjyQQ08ujzwA@mail.gmail.com>
In-Reply-To: <CAFOG8dP4+9=S69bgs53Xqdfi4bKyxayR_cuoFvXjyQQ08ujzwA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 15 Feb 2020 20:41:44 +0100
X-Gmail-Original-Message-ID: <CAHmME9pkfWKaG_OZEPS5hWn=LU4H4zHM3fP3NXkbw5VYdQSbaw@mail.gmail.com>
Message-ID: <CAHmME9pkfWKaG_OZEPS5hWn=LU4H4zHM3fP3NXkbw5VYdQSbaw@mail.gmail.com>
Subject: Re: Starting tunnels without being admin on Windows
To: Lars Bonnesen <lars.bonnesen@gmail.com>
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

You can manipulate the wireguard tunnel service using the ordinary
windows service management utilities and command line tools. If you
want to create an unprivileged method for doing that, nothing is
stopping you. If you want to use the GUI manager that we ship, you can
only do that from an administrator desktop, but I doubt you'd want to
open a utility that powerful up to non-administrators.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
