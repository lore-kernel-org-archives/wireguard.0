Return-Path: <SRS0=u0A/=QA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B95AC282C3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 11:02:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C2C9218A2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 11:02:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mullvad-net.20150623.gappssmtp.com header.i=@mullvad-net.20150623.gappssmtp.com header.b="t8WFGLlD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C2C9218A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mullvad.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63b7dbf0;
	Thu, 24 Jan 2019 10:57:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3900a1d
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 10:56:58 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d11217ae
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 10:56:57 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id b11so2655578wmj.1
 for <wireguard@lists.zx2c4.com>; Thu, 24 Jan 2019 03:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mullvad-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=zVWATxJnH2/xK7g3uko64vcQKL3R4npycrdifDSj9Tc=;
 b=t8WFGLlDXnP2trtLwVSSlhx0IC+NDiF+lhcKLFJF5cBcc5Ch384k2KqbFoncxlpcoa
 8j9pTVQjWbUnKimbIRgbScVhedsAmOm5+ovkpb1xyO+6dnjcqNkk9jnoywdO3jQP3HK8
 QtlztHCQn3UguAaEo0CSDI1LL+W14XW1hsfD1YyRrRzLmlD8uVhDSTL0Euouue79L7UP
 F8bj3z4k0GQSn942UmqU/aNN/Gg36x9dz5h3hduZzzj+/eWl0kLySwtR3YSs8mYku/un
 JS9WAwswf3Hn1fJxKfqf8SXvzuV6ZIWECrJjjX5jysulVIqHn8H/LzhU3Xx/1JT9+Seq
 HV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=zVWATxJnH2/xK7g3uko64vcQKL3R4npycrdifDSj9Tc=;
 b=ukaBcVzk9NCG/Kvm8yuvFlRCjVPWRl/ExUay0TQjMIF+Yo27I0IVtdAFz0JB2crLua
 vfY+u86t11x55MgjLXNdBzWj8CqjctbLLspMDth5rxu4bntSSgZeURD3oQFs3dsg2vz+
 wrmjGowaSqfum5B/nUuxASJ4Ljmq1iKEbBM5C8ppv+u7VyYqOpvou8540qYw5QG+VTwn
 zF0c0lNhfAROA/w/GsBtVKmc+KP7WMI1SBTk0FgOMARpoo2elNmF1D5M9pa2qPtd9sey
 UOa9L/HO96yZYpKNdkbm9mJUALXEW2ETGfwk7rpiNDq7SFPdb/MTV03qmFmc7mqX+/bl
 x7UQ==
X-Gm-Message-State: AJcUukftIw3818jN03U51wTKgERVU09F4jC1LcrR2SpUi/FviVgwJJQ9
 j5SoAZI7zDhJxEZDbbPSo+insXca3sw1bcwcwGxaKzuixD7yXg==
X-Google-Smtp-Source: ALg8bN4VBQ9BG0HYs8BX/ChTciL8J8yX0W0k/DMbzzyJxMJWAxMKBcXHqu4CUoSxxWD20ZhbT2AOaLYXFg3kcdojdN0=
X-Received: by 2002:a1c:c60e:: with SMTP id w14mr2285598wmf.18.1548327727486; 
 Thu, 24 Jan 2019 03:02:07 -0800 (PST)
MIME-Version: 1.0
References: <168C4A39-3DFB-4AD8-839B-BA7C4D8D8F40@gmail.com>
In-Reply-To: <168C4A39-3DFB-4AD8-839B-BA7C4D8D8F40@gmail.com>
From: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>
Date: Thu, 24 Jan 2019 12:01:54 +0100
Message-ID: <CANTUoecQ71BaE-38-qk4CQRXPRTabEEedmsybQb==Y9jaa6epg@mail.gmail.com>
Subject: Re: Rohde & Schwarz Adds Emerging WireGuard VPN Protocol to its Deep
 Packet Inspection (DPI) Software Library, R&S(R) PACE 2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Deep Packet Inspection is the term used to describe detailed
inspection of network traffic.

A firewall might allow, block, or log traffic based on source or
destination IP address. Or it might do so by looking at TCP and UDP
headers inside the IP packet frame. Or, the firewall will even look at
the payload inside a TCP or UDP packet frame, and that is called Deep
Packet Inspection.

WireGuard uses UDP, and by looking at the payload of those UDP packets
it is trivial to distinguish from other protocols. An experienced
network sysadmin could write you a firewall rule that blocks WireGuard
in a few minutes. Obfuscation is not a goal of WireGuard, so this not
a problem for WireGuard, the project.

It will however be a problem for those blocked by this equipment. Like
all technology, this DPI equipment is a double-edged sword. Will it be
sold to a government so they can block privacy-seeking dissidents from
using WireGuard, or will it be sold to an organization that has a more
legitimate need to block WireGuard traffic?

The solution is to use an obfuscation protocol that encapsulates
WireGuard, just like Tor users in censored countries do.

Cheers,
Fredrik
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
