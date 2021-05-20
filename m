Return-Path: <SRS0=veHU=KP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129ECC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 May 2021 06:15:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FD32610CC
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 20 May 2021 06:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FD32610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5b5fb51;
	Thu, 20 May 2021 06:15:33 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [51.158.148.128])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9fef58b2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 May 2021 06:15:32 +0000 (UTC)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 462CD633;
 Thu, 20 May 2021 06:15:31 +0000 (UTC)
Date: Thu, 20 May 2021 11:15:30 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Vicente Bergas <vicencb@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: lost connection on dynamic IP
Message-ID: <20210520111530.4568a14f@natsu>
In-Reply-To: <CAAMcf8A9isAqhsXLHw1=8A6pyeDeXBPUan6s7_11_tDXJmg-jw@mail.gmail.com>
References: <CAAMcf8BeGzUppFzfc2hF9KvpfU1DfSpncYv4AaK5Qf8_+fC-Rw@mail.gmail.com>
 <20210519234310.66ea294e@natsu>
 <CAAMcf8A9isAqhsXLHw1=8A6pyeDeXBPUan6s7_11_tDXJmg-jw@mail.gmail.com>
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

On Thu, 20 May 2021 00:28:08 +0200
Vicente Bergas <vicencb@gmail.com> wrote:

> There is a public IP assigned to the router. The IP is dynamic, so, it
> can change from time to time, but, once assigned, it is exclusive to
> the router.
> There is no carrier-grade NAT.
> I've configured the router to forward the wireguard port to the
> server, so, it is like the server is directly connected to the
> Internet.
> I think the PersistentKeepalive on the server side is not required. Is it?

I believe it is. Consider the server public IP has changed. The server sends
no Keepalives. The client sends them to the server's old IP. The whole thing
broke.

> So, what do you mean is that wireguard does a single DNS resolution at
> the beginning and further DNS resolutions need to be done elsewere. Is
> that correct?

Yes.

-- 
With respect,
Roman
