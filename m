Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93A4C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Apr 2022 11:58:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0c4ca4a6;
	Thu, 14 Apr 2022 11:58:24 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id ce1adfff
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Apr 2022 11:58:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4C0B161B6B
 for <wireguard@lists.zx2c4.com>; Thu, 14 Apr 2022 11:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B36DC385A1
 for <wireguard@lists.zx2c4.com>; Thu, 14 Apr 2022 11:58:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="U63Cq0fl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649937497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0+tyDdaud0kiRmw8JRN89CzIpjI4CklQbrxH74flBhI=;
 b=U63Cq0fl5eBV+Bco0G7lzZ9CpSjnbV3gIrnLyWveyQB4k2Bgzzu3oIYzMk+d4Q0ieovZ92
 O9ogC+fJ+dqpF6Df1TFUQWZPzuGaTaoLoH1QU0kYLajCg55r78TUmpHaN+ffHcfOhEBk24
 R276B/heUPweH4/IfWwDDNnXE/uUZeA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 42c00147
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Apr 2022 11:58:17 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-2ec05db3dfbso52398887b3.7
 for <wireguard@lists.zx2c4.com>; Thu, 14 Apr 2022 04:58:17 -0700 (PDT)
X-Gm-Message-State: AOAM530ej/fqVc9S9OxJDt5OVcFLi5jB5IzMltcdPtJO7sMjHCP3C6vm
 ZSYinm3Zd8as9aEpxpKA26dpHvzkmioF7FeD/gw=
X-Google-Smtp-Source: ABdhPJw5pFFo3/eGiTk3uI3THl4Do92diVuSvMWAn3JON0H3IzibadXY4xzo3Jp01LIaTcrdhee3BfMGV1MYR9QYmIM=
X-Received: by 2002:a81:1d4:0:b0:2eb:1b10:f43e with SMTP id
 203-20020a8101d4000000b002eb1b10f43emr1685819ywb.100.1649937495961; Thu, 14
 Apr 2022 04:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220414104458.3097244-1-razor@blackwall.org>
 <20220414104458.3097244-2-razor@blackwall.org>
In-Reply-To: <20220414104458.3097244-2-razor@blackwall.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 14 Apr 2022 13:58:04 +0200
X-Gmail-Original-Message-ID: <CAHmME9qZyz26gnfcZCjAiLhYqZ9LwJN1VZ+3rgGmhxJYrGvZCw@mail.gmail.com>
Message-ID: <CAHmME9qZyz26gnfcZCjAiLhYqZ9LwJN1VZ+3rgGmhxJYrGvZCw@mail.gmail.com>
Subject: Re: [PATCH net 1/2] wireguard: device: fix metadata_dst xmit null
 pointer dereference
To: Nikolay Aleksandrov <razor@blackwall.org>
Cc: Netdev <netdev@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Martynas Pumputis <m@lambda.lt>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi Nikolay,

On Thu, Apr 14, 2022 at 12:45 PM Nikolay Aleksandrov
<razor@blackwall.org> wrote:
> When we try to transmit an skb with md_dst attached through wireguard
> we hit a null pointer dereference[1] in wg_xmit() due to the use of
> dst_mtu() which calls into dst_blackhole_mtu() which in turn tries to
> dereference dst->dev. Since wireguard doesn't use md_dsts we should use
> skb_valid_dst() which checks for DST_METADATA flag and if it's set then
> fallback to wireguard's device mtu. That gives us the best chance of
> transmitting the packet, otherwise if the blackhole netdev is used we'd
> get ETH_MIN_MTU.

Thanks for the patch. Will queue up this patch #1 in the wireguard
tree and send it out to net.git not before too long.

Jason
