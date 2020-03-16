Return-Path: <SRS0=hP/g=5B=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B15C4C0044D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Mar 2020 05:05:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E954B20663
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Mar 2020 05:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E954B20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33cba907;
	Mon, 16 Mar 2020 04:59:49 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [2001:41d0:1:8b3b::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f47e8d32
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Mar 2020 04:59:46 +0000 (UTC)
Received: from natsu (natsu.40.romanrm.net
 [IPv6:fd39:aa:c499:6515:e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id 94B62404EA;
 Mon, 16 Mar 2020 05:05:47 +0000 (UTC)
Date: Mon, 16 Mar 2020 10:05:46 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Torsten Krah <krah.tm@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Endpoint address dns resolution - option to prefer IPv6 or IPv4
Message-ID: <20200316100546.6ba3fdf6@natsu>
In-Reply-To: <CAN2Hv7DZgokROQeeacjhYAgBYrV57nk7Oh_japjuLT1=dOu5Xg@mail.gmail.com>
References: <327df26ff0e515425bc0b18084117b7ae065d97b.camel@gmail.com>
 <CAADpXXY7ajNwRoF1sivACxUfFj-SpWf6o6+1Uq2N0XzEp3bvTw@mail.gmail.com>
 <CAN2Hv7DZgokROQeeacjhYAgBYrV57nk7Oh_japjuLT1=dOu5Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sat, 14 Mar 2020 15:51:51 +0100
Torsten Krah <krah.tm@gmail.com> wrote:

> resend to the list:
> 
> Hm, sorry I don't get the message. Imho its down to the user. I can
> choose to use ping or ping6 or tell e.g. java via a system property to
> prefer IPv4 if dual stack is available.
> 
> In wireguard I can force ipv6 only by writing an ipv6 address in the
> endpoint, but via dns ... how to choose which one I prefer?

If it is so important to you to force one or the other, then make separate DNS
records for IPv4 and IPv6, server4.example.com, server6.example.com.

-- 
With respect,
Roman
