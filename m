Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DBAC35250
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 07:08:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A052B21741
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 07:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A052B21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lists.m7n.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94c668af;
	Sat, 8 Feb 2020 07:06:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d26838e
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 07:06:38 +0000 (UTC)
Received: from bond.m7n.se (bond.m7n.se [IPv6:2a00:1a28:1251:46:246:28:121:1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f745e6fe
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 07:06:38 +0000 (UTC)
Received: from [IPv6:2001:470:de17:1200:a527:314c:b41c:1fcd] (unknown
 [IPv6:2001:470:de17:1200:a527:314c:b41c:1fcd])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by bond.m7n.se (Postfix) with ESMTPSA id 3FE75600A1D7;
 Sat,  8 Feb 2020 07:07:53 +0000 (UTC)
Date: Sat, 08 Feb 2020 08:07:50 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <CABW-WNP=WfUcLaex2bMPAv4FX6hUmt4==CXx=nT3=K0NbHqE_g@mail.gmail.com>
References: <CABW-WNP=WfUcLaex2bMPAv4FX6hUmt4==CXx=nT3=K0NbHqE_g@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: BGP over multiple wireguard vpn link
To: wireguard@lists.zx2c4.com,Roberto 007 <mikit77777@gmail.com>
From: Mikma <mikma.wg@lists.m7n.se>
Message-ID: <89606802-23A4-4796-8A81-BE2B9B24F806@lists.m7n.se>
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



On 17 January 2020 11:53:57 CET, Roberto 007 <mikit77777@gmail.com> wrote:
>Hello Wireguard team,
>
>I would like to test multiple VPN links with BGP which is for
>controlling
>traffic.
>I have no problem to make BGP over multiple links but once I tried to
>ping
>then I found a problem because I cannot set Allowed-IPs 0.0.0.0/0 to
>all
>the wireguard links.

I guess you are using wg-quick. Add "Table = off" to stop wg-quick from adding routes, and add the static routes you need (for the addresses used by the bgp connections) in your routing daemon or somewhere else.

/Mikma
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
