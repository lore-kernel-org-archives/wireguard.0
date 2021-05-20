Return-Path: <SRS0=veHU=KP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E39C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 May 2021 16:21:03 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EED5E611AE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 May 2021 16:21:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EED5E611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 794c94ea;
	Thu, 20 May 2021 16:21:00 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2f24b423
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 May 2021 16:20:58 +0000 (UTC)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 44445709;
 Thu, 20 May 2021 16:20:57 +0000 (UTC)
Date: Thu, 20 May 2021 21:20:56 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Vicente Bergas <vicencb@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: lost connection on dynamic IP
Message-ID: <20210520212056.1ddd3d5a@natsu>
In-Reply-To: <20210520111530.4568a14f@natsu>
References: <CAAMcf8BeGzUppFzfc2hF9KvpfU1DfSpncYv4AaK5Qf8_+fC-Rw@mail.gmail.com>
 <20210519234310.66ea294e@natsu>
 <CAAMcf8A9isAqhsXLHw1=8A6pyeDeXBPUan6s7_11_tDXJmg-jw@mail.gmail.com>
 <20210520111530.4568a14f@natsu>
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

On Thu, 20 May 2021 11:15:30 +0500
Roman Mamedov <rm@romanrm.net> wrote:

> > So, what do you mean is that wireguard does a single DNS resolution at
> > the beginning and further DNS resolutions need to be done elsewere. Is
> > that correct?
> 
> Yes.

I also remembered a case where just PersistentKeepalive won't save you, and
periodic DNS resolution on clients becomes mandatory. It is when the server's
physical location gets a power cut. On new boot-up (and router power-on) it
gets a new IP from the ISP, and has no idea where all the clients are. The
communication is broken until clients recheck the DNS record and update the
server's endpoint from that. WG does not do this on its own.

-- 
With respect,
Roman
