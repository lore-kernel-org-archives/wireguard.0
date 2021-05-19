Return-Path: <SRS0=r1yQ=KO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79D6EC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 May 2021 18:43:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 274B261059
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 May 2021 18:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 274B261059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01e24cf9;
	Wed, 19 May 2021 18:43:12 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [51.158.148.128])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b884d993
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 May 2021 18:43:11 +0000 (UTC)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id B812F1C5;
 Wed, 19 May 2021 18:43:10 +0000 (UTC)
Date: Wed, 19 May 2021 23:43:10 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Vicente Bergas <vicencb@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: lost connection on dynamic IP
Message-ID: <20210519234310.66ea294e@natsu>
In-Reply-To: <CAAMcf8BeGzUppFzfc2hF9KvpfU1DfSpncYv4AaK5Qf8_+fC-Rw@mail.gmail.com>
References: <CAAMcf8BeGzUppFzfc2hF9KvpfU1DfSpncYv4AaK5Qf8_+fC-Rw@mail.gmail.com>
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

On Tue, 18 May 2021 13:22:31 +0200
Vicente Bergas <vicencb@gmail.com> wrote:

> A server connected to the Internet through an ISP that provides a
> dynamic IP with NAT.

If it's NAT, then your server has no dedicated public IP? What do you update
to DNS, IP of the ISP's NAT pool (shared IP with many other customers)?

> I think the issue happens when the ISP on the server side shuts down
> the Internet connection for more than 1 hour! Then, it is restored
> with a new IP.
> inadyn detects the new IP and updates the DNS.
> At this point the Internet connection is operational again, but the
> client remains disconnected until rebooted.
>
> Is this scenario expected to work due to the "Built-in Roaming" ?

It might work, helped by PersistentKeepalive, and as long as the server and the
client don't change their IPs/ports *at the same time*. To protect against
that, or to improve resiliency in general (and assuming there's actually no NAT
at the server side after all), your client should resolve the DNS record for
the server periodically, and in case the IP changed, call "wg set [interface]
peer [key] endpoint [IP:port]".

-- 
With respect,
Roman
