Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2430C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 08:14:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79B0A20665
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 08:14:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhWF9M6G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79B0A20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f09194e8;
	Tue, 8 Jan 2019 08:10:35 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8c9ad60
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 08:10:32 +0000 (UTC)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aac11475
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 08:10:32 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id z10so1387147pgp.7
 for <wireguard@lists.zx2c4.com>; Tue, 08 Jan 2019 00:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lupQQddAf5kkqOliA6OH3wg3r9vrUzs0FxFwQFVgHFY=;
 b=fhWF9M6GwH+a5II87xpOf0spcDnIpT4/c8dzAAxRliU9WYBkhEhh8yZDzpnD0YjQfC
 3XqNEEZJLzgTbAY5h5VZGP/nKI6xilhwKqC7q8VHpXSHDOxMQ5tLYcjq3wqkbZuiYgdP
 /zRcgc/tg5KrrBYV7VbCNysSHqersMNY5IuGlDhojm7I262FaGO3p1wItfgEtNzDPv/B
 DZLO/QoCBAbYEz746YTUVxA21V16xcTurcRIFG/sNRUr4zHuX/Jye+Q296JqObsvlCEh
 2Ex3onScTAL07q3wlDYhdw6icYvxpjzlMEM2kC2i5b1Tozxx2S09WrJ1sw55ToQ34aot
 fH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lupQQddAf5kkqOliA6OH3wg3r9vrUzs0FxFwQFVgHFY=;
 b=Gx6adWsFlCLPx88i7EFJIjB5R4hHVRxrwnoKwgO9F3Hzks6y2P6+DHnDYQe6cm9BSg
 gdkHmnVb/WlSddLj8f4A20lBaMWSi4yU9u9q96gMT75rM4u1IGSPrgIf6F6qx5N6J79k
 1ePSyAuShZbo8vQ1cBP+Yej9IduC+vkawJyYp9qajdgx5h8XGc2n6x60TtbuQrWxcN3y
 NjMjKf2+UwtWm8asWIT8Kcs7kXvwjs/7tv4L06EY9+W7NxeMG9640sblmCW/YKnhKQd0
 sb6ufgC5YcYcHtXxiunnLMS9d3nr7OGAm+9tNS9v/Bml+99cpSLCTIe1Y6X1Vk8zs6at
 oR0w==
X-Gm-Message-State: AJcUukfE+A0jWSBOnH+kucvNd8UttoDaQDJE1AzqZpat2zO2RIvNc79j
 Zue6kChcwdRK3jrT3JfDuOvtn6MHw/Yjqm0jzeu5loKS
X-Google-Smtp-Source: ALg8bN7XdzzkGarni1sdHnd3buLXj3ftGONrtOx9LUlECQI2rwsOYjXvohsL7hpgZBvL/ymtH/qzCVeSHjMEuLpjVCI=
X-Received: by 2002:a63:4d0e:: with SMTP id a14mr683582pgb.408.1546935218956; 
 Tue, 08 Jan 2019 00:13:38 -0800 (PST)
MIME-Version: 1.0
References: <8ca3e6e3-174b-c19a-f502-76b1550c5a9d@oeg.com.au>
In-Reply-To: <8ca3e6e3-174b-c19a-f502-76b1550c5a9d@oeg.com.au>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Tue, 8 Jan 2019 09:13:27 +0100
Message-ID: <CAKXLc7cNKDPQrv0cT1jRYPoSYPq1=kdZVu4F+GpxTdykYEJOjA@mail.gmail.com>
Subject: Re: Traffic flow stopping
To: "Mike O'Connor" <mike@oeg.com.au>
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

Hello Mike,

On Tue, Jan 8, 2019 at 3:20 AM Mike O'Connor <mike@oeg.com.au> wrote:
> So I've been using Wireguard to route part of my class C to my home for
> about 4 months now, but for the last few days the traffic stops for a
> short while every few minutes.
>
Does it start on its own "after few minutes"?

> route part of my class C
>
Your configs show "allowed ips: 0.0.0.0/0, ::/0" that is you are
routing everything at wireguard level.
Or are you filtering/mangling in iptables ("fwmark: 0xca6c") only?

> I can not think of anything which has changed, turning OpenVPN back on
> fixes everything. I've tried reducing the keepalive thinking the NAT
> route could have been the issue but that has not help.
>
"turning OpenVPN back on" ?? What/where do you do that?

When ping fails, check your next hop:
ip route get 8.8.8.8

It may mess up your default route, examine network config before/after
"turning on OpenVPN"...
bash -c "ip addr; ip route; wg; cat /etc/resolv.conf; ip route get
8.8.8.8; ping -c3 8.8.8.8"

> Any ideas ? Any more tests or debug (if you tell me how) I could provide ?
>
Anything changing periodically like services that die and are
restarted, cronjobs?

Cheers,
Kalin.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
