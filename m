Return-Path: <SRS0=hnh8=DE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E37C4346E
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 27 Sep 2020 17:51:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCAC923718
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 27 Sep 2020 17:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCAC923718
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=employees.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00784c3b;
	Sun, 27 Sep 2020 17:19:14 +0000 (UTC)
Received: from clarinet.employees.org (clarinet.employees.org [198.137.202.74])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bc73b6bc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 27 Sep 2020 17:19:12 +0000 (UTC)
Received: by clarinet.employees.org (Postfix, from userid 1736)
 id 041444E11B9B; Sun, 27 Sep 2020 17:50:30 +0000 (UTC)
Date: Sun, 27 Sep 2020 18:50:29 +0100
From: Derek Fawcus <dfawcus+lists-wireguard@employees.org>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Interest in adding multicast support to Wireguard?
Message-ID: <20200927175029.GB90330@clarinet.employees.org>
References: <9b4ba85a-633a-04ed-ca15-eb29d476cd57@pallas.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b4ba85a-633a-04ed-ca15-eb29d476cd57@pallas.us>
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

Various routers have support for running PIM (and IGMP/MLD)
in NBMA mode, whereby individual hosts and joins/leave for
such are tracked, rather than depend upon a shared broadcast
medium.

This is used for mcast over Frame Relay, ATM, etc
which are inherently NBMA.

ISTM that wg should also be modelled as NBMA, and as such
the same sorts of approaches should be taken.

DF
