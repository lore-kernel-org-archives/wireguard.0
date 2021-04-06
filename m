Return-Path: <SRS0=ZwbF=JD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9490C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Apr 2021 22:15:47 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3934661279
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Apr 2021 22:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3934661279
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e51a1a9;
	Tue, 6 Apr 2021 22:15:44 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7050c168
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Apr 2021 22:15:42 +0000 (UTC)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 3425B59E;
 Tue,  6 Apr 2021 22:15:41 +0000 (UTC)
Date: Wed, 7 Apr 2021 03:15:40 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Giovanni Francesco <thelinuxguy@mail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: NAT to NAT peers - 'EndPoint' IP data sharing among peers of
 the same key?
Message-ID: <20210407031540.6fbd6789@natsu>
In-Reply-To: <trinity-3510980c-c0ee-4d02-bcf5-8b7d2a708cda-1617424060455@3c-app-mailcom-lxa15>
References: <trinity-3510980c-c0ee-4d02-bcf5-8b7d2a708cda-1617424060455@3c-app-mailcom-lxa15>
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

On Sat, 3 Apr 2021 06:27:40 +0200
Giovanni Francesco <thelinuxguy@mail.com> wrote:

> Hi, I am looking to understand if "EndPoint" IP data may be shared among peers within the tunnel?
> 
> The question may sound confusing, let me explain my setup.
> 
> I have a static IPv4 wireguard server (let's call it "A" peer) which has two downstream WG clients peers "B" and "C" on remote networks with dynamic WAN IPs (roaming).
> In my current configuration all my clients "B" and "C" have a single peer "A" - therefore all traffic must always go to "A" - "A" is in a datacenter in another country.
> 
> "B" and "C" have dynamic every changing IP "EndPoint" information, in my current setup this is not a problem because "A" is a static host.
> 
> If "B" and "C" are connected to "A" - is it possible for me to make B and C peers of eachother without "EndPoint" ?
> In other words, if B public key is a peer of C and vise versa would its connection to "A" share the IP addresses ("EndPoint" or where to go) downstream to "B" and "C" so they can establish direct connectivity or would traffic always need to continue to traverse via "A"?

No, peer A will not tell peer B the current IP/port of peer C.

Check out other tools, for instance Tinc can do this, but not WG.

-- 
With respect,
Roman
