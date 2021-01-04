Return-Path: <SRS0=t67z=GH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF171C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 20:10:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0663221BE5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 20:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0663221BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7406a084;
	Mon, 4 Jan 2021 19:59:14 +0000 (UTC)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7cbb952d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 19:49:31 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id y17so33369255wrr.10
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jan 2021 12:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=IlbKJsFDQkwc5R2W/k44xSm2kvmnk759kvTKx2mpf8M=;
 b=A9rQkMiZ5NBUUtDpZL/ZSjBWb9fK7LxN/NShQ12SytDgHkIUE3aJaHN6uIA1RSDZKe
 cWOF7hY0GYTTWSlOG1J4xa+O1A1Uap8kO5mdtbjcNno2scaB1LmMKjBIFfjldLzlbENd
 7ysRC3YUqMRXFwSTEBqLilTwV5ptgeYLY6YlFZ+tkxa5u6JoiNhlY8a01wwsHlujAaQV
 f9VsqIJXzvcrKmTtTlLA21on4vSE1r0xrDjxCy1rN1WygaPJqmh7z7CT1cH6vhFhCuuV
 f1LqdFyZYYt1CtvGhwCOf6jPTYOyTkmYyVceOjntqWWIuLXUrNwyk2KGrN5MWwH6dlB9
 XEQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=IlbKJsFDQkwc5R2W/k44xSm2kvmnk759kvTKx2mpf8M=;
 b=XMg8kgfjsPkUlE3Lmhe90hmI623QIbLJTzC3abYIb7JJchWvveOp0MQtGJjpY4uBvc
 MjXgHGJRrzvAoBtaBR0nhzsqT03EJLwDPdqI3r8TRnJPoPtAz3CQZLHaAN80DTVD9O69
 Fk1dzrHRlRaTNvdSBOiIoZxhUNNDi5D1vDSLG3lozdCvqWRcxmn5AJMeqc5CYySqm3kN
 Bf0fyf9+cCHlR5juTLH/GfnrW1/9GKAPeElfujjNiBgUa+rCWvM5qTkqAjjbv7f5IzE3
 eoRoQcbIbyleSjoEuxYawkoS0OdPFoX7spFit7YTRfbBgIgAvEajRKfOncoiImFIDLYr
 aqZA==
X-Gm-Message-State: AOAM531s1ktQkuTUy+r1HGuutkJWOTYQK/cOu1xo2GZfFyMZiVKJ05nB
 8tLe7Jyzl9ZaLpcYHFJunOBR+yS7YBxFEA==
X-Google-Smtp-Source: ABdhPJwLhvEiGgWdHXuWJr6gJSW73ueq8gWEtAW0f2q7ADhXQhkUoMpVWe8GcLfGwMiomyY02TVQlQ==
X-Received: by 2002:adf:a4cc:: with SMTP id h12mr81957607wrb.391.1609790423579; 
 Mon, 04 Jan 2021 12:00:23 -0800 (PST)
Received: from [192.168.0.166] ([46.211.85.138])
 by smtp.gmail.com with ESMTPSA id j15sm96910847wrr.85.2021.01.04.12.00.22
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 12:00:23 -0800 (PST)
To: wireguard@lists.zx2c4.com
From: =?UTF-8?B?0JXQstCz0LXQvdC40Lkg0JPQu9GD0YnQtdC90LrQvg==?=
 <ev.glushenko@gmail.com>
Subject: Wireguard metric problem Openwrt(19.07.5 Stable) + Mwan3
Message-ID: <3d722cc4-bd0b-b127-f0a0-08bd12c002bd@gmail.com>
Date: Mon, 4 Jan 2021 22:00:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Mon, 04 Jan 2021 20:59:13 +0100
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

There was a problem using wireguard on OpenWrt(19.07.5 Stable) with 
mwan3 package and dynamic routing. The system is configured according to 
the fail over principle.
There are two interfaces (wan and wanb(LTE)) wan interface is the main 
one and everything works fine with it.
But when wan is disabled, all traffic is redirected to wanb, but the 
wireguard continues to use the wan interface, since it has a wan 
interface metric 10 and a wanb metric 20.
All internet user traffic is going out from wan or wanb interface.
On wan
WGClient(10.66.66.3)--VPS(212.x.x.x 10.66.66.1)-wan (172.17.165.64)- 
Openwrt(10.66.66.2 192.168.0.1)-LAN(192.168.0.0/24)
or when wan is down
WGClient(10.66.66.3)--VPS(212.x.x.x 10.66.66.1)-wanb (192.168.8.1)- 
Openwrt(10.66.66.2 192.168.0.1)-LAN(192.168.0.0/24)
WG Client access to only lan without Internet throw VPS.
All work fine on wan ! But when wan down and up wanb ping 10.66.66.1 
100% lost but lan clients is going to the internet normal.
When i disable wan interface ping 10.66.66.1  ok on wanb.

Output of "ip route list table 1-250"
Table 1:
default via 172.17.165.1 dev eth0.2 metric 10
10.66.66.0/24 dev wg proto static scope link
172.17.165.0/24 dev eth0.2 proto static scope link metric 10
192.168.0.0/24 dev br-lan proto kernel scope link src 192.168.0.1
192.168.8.0/24 dev eth2 proto static scope link metric 20
212.x.x.x via 192.168.8.1 dev eth2 proto static metric 20
Table 2:
default via 192.168.8.1 dev eth2 metric 20
10.66.66.0/24 dev wg proto static scope link
172.17.165.0/24 dev eth0.2 proto static scope link metric 10
192.168.0.0/24 dev br-lan proto kernel scope link src 192.168.0.1
192.168.8.0/24 dev eth2 proto static scope link metric 20
212.x.x.x via 192.168.8.1 dev eth2 proto static metric 20
