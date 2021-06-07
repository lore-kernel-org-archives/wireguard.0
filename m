Return-Path: <SRS0=oHCC=LC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 081EAC47082
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jun 2021 10:59:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1150C61285
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jun 2021 10:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1150C61285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccd744dc;
	Tue, 8 Jun 2021 10:57:23 +0000 (UTC)
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [2607:f8b0:4864:20::933])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9c61b632
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Jun 2021 16:02:27 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id d13so9299286uav.5
 for <wireguard@lists.zx2c4.com>; Mon, 07 Jun 2021 09:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=8TH/BWQThYiPzEVLEMXIWkjuSjreo1jBP/MYpxibwFg=;
 b=tpcKUfy7EcWw9uUOj8PDLN1BM9saK1ZOcpA+tpOB/BBhg0poW1x1dA35y8YJqzriAD
 7FMwP50RMvaabrNtxO3RKTHakPMz+25bM+MtvXNs+mnnkBkBWVk15dAX8QzsLvoHcWt3
 0UyITrTbtbKOM+/9lx+QQSgVWfLrdM1U+YuzL8NhEvSpL9GI8LNpM7wN85+3yIZyVbtz
 t66tVMlYQQgHNX1i7EAUhnI4nHUAMZ6xRth6XDpQ6sHyovEu4vqn6ENl6hpW6krJGnGk
 Sz5kqKGR6v5lLszeqXassdjE8fqQbrzz3YcfAyQAmZl2jqsPrvPaWdWNpautOJ13jKjV
 hBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=8TH/BWQThYiPzEVLEMXIWkjuSjreo1jBP/MYpxibwFg=;
 b=oLJN9Xi6BgoRvuOzknya5aAqNMCPJTGfH3T+Fdv85DagDerYtICB6KEF3yLfzeydag
 yX+OY0JmsCqGRC52tQkuAFDuJH7zDOGkCGG+51XPnBff5pA7g0x1ZckmLVScT+nQgW8C
 2V6IQx2oPYjAN99LthcDiJ3ByrFF49BzSlSABpAZhZep3As3LCxvWRVQZO3BIck64KPe
 KE62IYgfTX/0Hn3RGMPseJj0q2oLWymRBJI7d40sEpPW6gwRP2jnOA/Wdpw9i6vR4HX0
 7XRg9FdLf8peGp/wSKcNviwVCIREqCY0T8xyjVuMIUVQ4Y5al4Q718+Ym/JrbLhT1m9m
 iCVA==
X-Gm-Message-State: AOAM531h20HqEWuvgcaoB6C5/YcbOx1pb92vQUTUZaAxxh+K92gzK3qr
 4TKLVhG2FY8B1TqMnXIGqKRmMhdGiF8qb3IQZ/l/CiUlqVU=
X-Google-Smtp-Source: ABdhPJwHbkjRaHP7hz0ZoKst7uc77mCW218GoZcQ8lFAPCEL7goc9aM79jsFYMDV6OErbeh36FVv7PUlFXaxIdFv1Ew=
X-Received: by 2002:ab0:3a1:: with SMTP id 30mr10225254uau.94.1623081746194;
 Mon, 07 Jun 2021 09:02:26 -0700 (PDT)
MIME-Version: 1.0
From: zhengmian hu <huzhengmian@gmail.com>
Date: Mon, 7 Jun 2021 12:02:16 -0400
Message-ID: <CAAntei_4-bdocSED1vNkG94oe0AL33RVA6s1w5DT2Q13NLH=7Q@mail.gmail.com>
Subject: Cannot use localhost as endpoint for wireguard-windows
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 08 Jun 2021 10:57:21 +0000
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

I might encounter the same problem as
https://lists.zx2c4.com/pipermail/wireguard/2020-August/005801.html
When endpoint is set as 127.0.0.1:51820, the log shows like follows:

[TUN] [xxx] peer(xxx) Received handshake response
[TUN] [xxx] peer(xxx) - Retrying handshake because we stopped hearing
back after 15 seconds.
[TUN] [xxx] peer(xxx) - Sending handshake initiation
[TUN] [xxx] peer(xxx) - Handshake did not complete after 5 seconds,
retrying (try 2)
[TUN] [xxx] peer(xxx) - Sending handshake initiation
[TUN] [xxx] peer(xxx) - Handshake did not complete after 5 seconds,
retrying (try 4)
...

In Wireshark, I can see that only the first handshake initiation
package is sent. There are no following packages even if the log shows
"Sending handshake initiation".

However, when I use another ip of the local computer for the endpoint,
e.g. 192.168.1.2, everything works fine.

Is it a known bug of wireguard-windows? Is there any existing formal
description on the scope of this bug? Is there any way to bypass this
problem?
