Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B849C4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 Dec 2021 23:01:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 795e8a78;
	Fri, 10 Dec 2021 22:58:31 +0000 (UTC)
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [2607:f8b0:4864:20::830])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 2eea8c8c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Dec 2021 15:36:29 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id n15so5705902qta.0
 for <wireguard@lists.zx2c4.com>; Thu, 09 Dec 2021 07:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exys-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=qf4NYrVDbVjzv0i3iehsoBckl2bzJqUnE8sBYNwXox0=;
 b=0h9TGKR7rFz+uyEa76BeUW4xaya7G/uQ8G49eZRqWif4UlBDhUWWIftUu3HUNAe1tV
 Qa5UPlaHUiB1rR1nsJDMwPw0/QBAIOqyvFhHLEZpWNHkUTSDMijFfLGWfU/QcS5I1vw9
 YjxIi2HOX3z2BvcSHFUkudDXRrxkeXjmpQ8Qj9AYUG8G+RYy6P1GaiCRY25tgaXRVAJs
 Bj8kEDBH+Z7ZGV4XpRKe/Foqz+LpPS6AhFLXsk72H5PsH2/JXAbs5K6chhVKG5YR+j1n
 zhl4lzJ8leXLvGU52BDCGIf5yjmKq+9FS7/R9YiOTBy2EajpgiPJH9Kkm9GBerdHhvgI
 sJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qf4NYrVDbVjzv0i3iehsoBckl2bzJqUnE8sBYNwXox0=;
 b=wWWrE0uqOvpRvdDlEdRKq6eb7V8PM6HgPt94jMf2s9wpTHi+JGwbQImDRejeyy/Lm2
 Rx0sapvNA6hV11j6cbH2lnEf1ARzmHjioRI5Q+n6PSFpzj99dz6oTLdhKk82S0Mhbhfr
 KSfsxxb1GsFOX4TBWbc/diKdwMM/M3bsXS3bfy7hnAmcxWWCfi3pFvPo2SbGZ8JkEIPd
 p4x+haDp1xRQ9+z1dIZxdmbl8qhFL1x2+M4hxGOxrwwOd4YptJmpghd21btotsf4gPIf
 gyI+zIN5T2wx5SoXTRqUS4N9vJqTAoAe6ECrfP0RXr3ii18DrVIlYDq82hmDhUOrkLgf
 RPgg==
X-Gm-Message-State: AOAM530ZJgVyFGW6kt8eBIl9UApqNWBAWs6GxAObhfx5vgZK6FQQxCZQ
 wDpIaisvwNh5Nx7GkdQECVBwxkL6jgalzQbh095i4OAZM865FA==
X-Google-Smtp-Source: ABdhPJx0P/9KJYsP+ffMQCFQ215xZ1ZNUbxoQLDMUIw4oH+e+SmFXWOFHFYJaBfMmOBGvKpzS7CjHCAS9cAEFUq6UTg=
X-Received: by 2002:ac8:5cc4:: with SMTP id s4mr18294882qta.505.1639064188366; 
 Thu, 09 Dec 2021 07:36:28 -0800 (PST)
MIME-Version: 1.0
From: Arvid Picciani <aep@exys.org>
Date: Thu, 9 Dec 2021 16:36:17 +0100
Message-ID: <CACD9L=CAinAO0CHRR25-sEoxCqNp_8BCqU9kJLK-Wzt++oy4bg@mail.gmail.com>
Subject: separate allowedips from routing for multipath
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 10 Dec 2021 22:58:27 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
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

Hey,

i'm considering using wireguard for a system where there can be
multiple routes to an ip.

The nearest solution i can think of is constantly changing the peer
AllowedIps from userspace and load a large list of routes into it. But
the challenge is that this is used for both routing decisions AND
policy decisions.

let's say we have 3 machines A1, A2, B and a machine that moves around V

V is currently connected via layer2 at A1,
B has V in AllowedIps for peer A1, so that any packet for V is routed to A1

now we connect V to A2 instead
we need to move the AllowedIps entry from A1 to A2 so that a packet
for V is routed to A2
old packets still arriving FROM V through A1 are now dropped

This wouldnt be an issue if AllowedIps could be separated from the
routing decision somehow.

I could have a wg interface per peer so i can do the routing using
regular linux tools, but wg doesnt like reusing the same port for
multiple wg endpoints. We'll eventually run out of ports.

I suppose port reuse is intentionally not allowed?

thanks
Arvid
