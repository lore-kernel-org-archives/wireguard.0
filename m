Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 341D3C43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 20:34:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDCD12086A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 20:34:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="xdNsbofz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDCD12086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f04150d6;
	Mon, 19 Nov 2018 20:27:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e6979a2
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 20:27:29 +0000 (UTC)
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2af0b1d5
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 20:27:29 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id w25so28173510otm.13
 for <wireguard@lists.zx2c4.com>; Mon, 19 Nov 2018 12:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=PB5hcQFZMIGc1aLnMs72FIVuEr0w/VC9aneiv9Jm5Nk=;
 b=xdNsbofz5kfzLgL2tfgDi0pm+PWerNqAwJFeZVyIm9mjWg7+v9vATdbmyTlHcLHyMN
 o/anQnDbW4F/B6txBTgtU3fvWDHgi3u2Dno5TEMsQB9W/6SHUyLUjuHJ92Jdc02U46q3
 5pxlAWnBL5X8Ca1Tp6jA6THAeZwg7Ps/eMoiYIfTsCd01OcRenCymr3OFcThxTZ2yN/N
 EhVFZQkjPEHLs1lVC9P89FQE3OHOBstfSiY9aHhQSCcQgVwb6qbMtM+l6RTJignIVGZy
 kdPZJVmk9CU8UDw2QxUCedDuPfOoYcZ7AE6ynpbEVR2pjy8KVIsNCMbMjMgOjn8vHEnX
 +dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PB5hcQFZMIGc1aLnMs72FIVuEr0w/VC9aneiv9Jm5Nk=;
 b=l0m/f6WnVXZP22FJE9C7p1bE1pN+XQH7D+o4UCR9tq+OXQKcUFLr9I1TZEXUBCYGn+
 7dhYATcvxrKbR6TV30PSXjOlny2UEVq3qPxDvZ3gjODbMgEfhNW18TvEbvgfSb7umdH/
 0eG3QKEIDXnAB9ZP3y9dWvvGshkjcmEa+PEBXmOnMfc/g8YnmTA0bk7zhIVR4ltcsDcL
 oXrHzk38MDP9wKYKTJ+Q0uMsQNkVXkJKFA2hfgXTGFX+Wo8W1VvF7evRrWVoQkqVwrBF
 7D8jP+LS036Mo3sqCwh/mXYLi2FK8onR6/a4jXdU6+Sec23shLzQ7hQAgu8QffaFoJyp
 cuMw==
X-Gm-Message-State: AGRZ1gIqvtkpqu5E+yB8YBagCvJocKprdIFYX9AKN6woYHfsvE0L6YFV
 adWW2mAwjnJiUsGd+3s4Sr//tLjZEg0x8QatVG+E7cc2ibA=
X-Google-Smtp-Source: AJdET5dO0QnI+aGuyzkjiNQOfApoXAkyS8mXqAFU/zUr2lIsvxy9Dy+z0IsRngyjxbu7osCbKCqcGUjugWZrLD/Sapo=
X-Received: by 2002:a9d:27e3:: with SMTP id c90mr13278119otb.21.1542659610158; 
 Mon, 19 Nov 2018 12:33:30 -0800 (PST)
MIME-Version: 1.0
From: John <graysky@archlinux.us>
Date: Mon, 19 Nov 2018 15:33:19 -0500
Message-ID: <CAO_nJAZ5fSSFtH1p8Ad=FD22ic9_kDAMkhWpL4vTxDh=4g3J8g@mail.gmail.com>
Subject: Seeking suggestions for a WG port to use with restrictive public wifi
 networks
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Use case: WG VPN server (linux) and iOS clients (I mention that
because the solution need to just-work with the iOS WG client without
extra steps for ease).

Goal: identify a port on which to run WG that has a good chance of
being open to clients on both LTE and public WiFi networks.

I currently run OpenVPN on 80/tcp which works for the vast majority of
networks.  I'd like to switch over to WG.

I found that port 123 is not very compatible with the public networks
I tend to use.  Port 53 seems to work on WiFi, but does not ork due to
Verizon actively blocking traffic on it.  I tried a few higher numbers
including 51820 and 41185 but they seem to be blocked.  I also tried a
few standard service ports including: 80, 443, and 1194 but all of
which failed to connect.

Should I stick with the "standard" udp service ports for my
trial-and-error based approach?  Wikipedia has an article that lists
many of these (List_of_TCP_and_UDP_port_numbers).  Any suggestions are
welcomed.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
