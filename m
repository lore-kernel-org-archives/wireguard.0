Return-Path: <SRS0=eD45=PN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DE2C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Oct 2021 15:55:10 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2D9860E75
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Oct 2021 15:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2D9860E75
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=idndx.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6422d91d;
	Mon, 25 Oct 2021 15:51:41 +0000 (UTC)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2f43dd97
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Oct 2021 10:08:41 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 a15-20020a17090a688f00b001a132a1679bso2761211pjd.0
 for <wireguard@lists.zx2c4.com>; Thu, 21 Oct 2021 03:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idndx.com; s=google20201016;
 h=mime-version:from:date:message-id:subject:to;
 bh=s2ST1ME2C+3mxe9iVq+JmMxTCqQzi7vURBxURudbW7s=;
 b=gEPPKCBUHXrV+ilFfLa+JyAsU97W6KaDlxDYXUGwAY8fUULZUjJC/XD2EvUNR+Gy3/
 7E+Do1bLCz3bC9Zqt7gHqew/XsvAolgrIq32Am4aaZZcDJIV9K8UaqWGd0U7fC2/Rqf0
 y07eya0hnbfqRZkfXDkzoAS8p/iZk8rwR1iS9PR5/v7AlaHiBD8sTJDE87K1wURvX7NL
 HQhsQX22Lb2hIjCGwvWpYwgxAq9o5I3wAoLELessJRt0sUz1nHbDDOzbaHZfYhI+pUMi
 tiFGuHhVcBFzq3G7S9j7xAUtCaWb9D87Xv8omj2bqT7d5McWvgN3Prl4TALV0gtIeWLQ
 twlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=s2ST1ME2C+3mxe9iVq+JmMxTCqQzi7vURBxURudbW7s=;
 b=1PlbSXamdYvCIagF/CmK2ZPF5w9WbiJQIlNHZvvu4LXw0TUyMxewRLxmkeaNniHwIA
 60PArsW1I0VCRc+q0JBGhpet0n5Umz7mclMBz08VDx1j9GdT69lsiB6Ad9Qfbqvla7wB
 nI/tcsIh/uxRtb83u80F67vcvEiCOGMnFNOaLC/G3YhWd3j+0ggmPLAVjtbTD4C0qMRs
 8qgGbp6rSt3Onoc5hxtSOlWImdbZ3E85U0fCYH/vCEhAtg2mzb2uYdBAH9g3K7g773EK
 8tccKs/jxptlhJXHlBOcGqI5VzcckNLhIoB3/OHrDswrMk6DScnA64qznoIWKT/fAUnk
 WV6w==
X-Gm-Message-State: AOAM531eOFcN549vqdt0/ONL2mkNaArEi+Flot36Xs9z6riV7hWaeD02
 FHkVxKX2fTmz81+dPOkoQ1cKrjkCdCftqNt0dJFOEKsAOEPa
X-Google-Smtp-Source: ABdhPJxr+/LvSDm3s5QKAriqtSnbTL4jPWRaDwqUiCiHo/rwp/3ui+njaqVMHvpxXL+GqBiGviPqM/hSGEzIl/OO0h8=
X-Received: by 2002:a17:90b:1649:: with SMTP id
 il9mr5453770pjb.167.1634810919530; 
 Thu, 21 Oct 2021 03:08:39 -0700 (PDT)
MIME-Version: 1.0
From: Datong Sun <dndx@idndx.com>
Date: Thu, 21 Oct 2021 18:08:22 +0800
Message-ID: <CAC=S+V8EsFWv0Y6TfzgiqNok04B87hcTdzk_WZ1mqexMQpBR2w@mail.gmail.com>
Subject: [TOOLS-ANN] Phantun - Run WireGuard over obfuscated TCP connections
 without the penalty of UDP over TCP (alternative to udp2raw)
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 25 Oct 2021 15:51:40 +0000
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

Hi everyone,

Apologize in advance if you have already saw my posting in the
WireGuard subreddit. I am posting here again in a hope more people
would find Phantun to be useful for their WireGuard setup and attract
more contributors.

I would like to share a tool that I developed for converting UDP based
connections to fake TCP connections in case UDP is unavailable or
throttled. I have been running the tool with multiple WireGuard setup
for a while and it has been very stable.

Note that I primarily developed Phantun to work with WireGuard in a
UDP restricted environment, but it will work with any other UDP based
protocol as well.

The project is called Phantun. Source code, binary releases and
detailed README are available at: https://github.com/dndx/phantun

In comparison to udp2raw, Phantun was designed to solve some of the
performance issues that I encountered while using udp2raw. In
particular, Phantun is able to utilize multiple CPU cores
simultaneously and have a more predictable MTU overhead, while having
a much leaner codebase and focus only on protocol obfuscation.

Note that this is very different from UDP in TCP which could cause
significant performance penalty because of TCP retransmission and
congestion controls. Phantun simply replaces the UDP header from
WireGuard to TCP header with some sequence number mangling and ACKing
so packets will be regarded by NAT devices and L4 firewalls as valid
packets of a TCP stream. Therefore, all of the desirable properties of
UDP such as or of order delivery are fully preserved. It also means
this protocol will only work between two Phantun instances and will
not work if the other end is a real TCP stack (e.g. when going through
L7 or SOCKS5 proxies).

Please share your feedback and feel free to contribute!

Best regards,
Datong

-- 
Datong Sun
dndx@idndx.com
