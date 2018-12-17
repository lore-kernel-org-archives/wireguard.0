Return-Path: <SRS0=kUA2=O2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA17FC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 07:44:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 223012084D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 07:44:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=weiti.org header.i=@weiti.org header.b="j5bFwNi/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 223012084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=weiti.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13b68272;
	Mon, 17 Dec 2018 07:44:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42aa30c8
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 07:44:09 +0000 (UTC)
Received: from hub01.weiti.org (hub01.weiti.org [5.44.101.154])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71776faa
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 07:44:09 +0000 (UTC)
Received: from mail02.weiti.home (mail02.weiti.home [172.18.20.20])
 by hub01.weiti.org (Postfix) with ESMTPS id 6DCA4A0162
 for <wireguard@lists.zx2c4.com>; Mon, 17 Dec 2018 08:44:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weiti.org;
 s=mail201701; t=1545032665;
 bh=JJwpQpOQciUm4XShWV+TSJVo6J7u8E72f/gUciAf0+o=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=j5bFwNi/SBPRF474IavavH4gJSyY1oSeN7QY/JLqMTeosk7HXqie3x/0dXHeYoBBF
 j+Ljb+6x3Aye4Xrtswy4HaZt33Uwpb8PGzUrqzwc/CNLEvnOXWrSug6Ilscn6Z2M7w
 g/tA5rCH/DiWnsfQAb2criY8oXhO7xcPRkxtuY+M=
Received: from arch01.localdomain (arch01.weiti.home [172.18.20.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail02.weiti.home (Postfix) with ESMTPSA id AA42522276
 for <wireguard@lists.zx2c4.com>; Mon, 17 Dec 2018 08:44:24 +0100 (CET)
Date: Mon, 17 Dec 2018 08:44:23 +0100
From: Tim Weippert <weiti@weiti.org>
To: wireguard@lists.zx2c4.com
Subject: Re: [Question or Feature Request] Any wg1.conf option to limit peer
 IP as 1-to-1?
Message-ID: <20181217074423.GA18720@arch01.localdomain>
References: <CAKVinOVZ1nVJh8LvqGme5C27+R=AFBOxPKS22ckO7TEHsbc4-A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKVinOVZ1nVJh8LvqGme5C27+R=AFBOxPKS22ckO7TEHsbc4-A@mail.gmail.com>
Priority: normal
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Spamd-Bar: -
Authentication-Results: mail02.weiti.home;
 auth=pass smtp.auth=weiti@weiti.org smtp.mailfrom=weiti@weiti.org
X-Rspamd-Server: mail02
X-Rspamd-Queue-Id: AA42522276
X-Spamd-Result: default: False [-1.64 / 23.00]; RCPT_COUNT_ONE(0.00)[1];
 RCVD_TLS_ALL(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_NONE(0.00)[]; ARC_NA(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 BAYES_HAM(-2.54)[97.93%]; SUBJECT_ENDS_QUESTION(1.00)[];
 RCVD_COUNT_ZERO(0.00)[0]
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

Hi, 

On Mon, Dec 17, 2018 at 09:42:17AM +0800, KeXianbin(http://diyism.com) wrote:
> For example, my wg1.conf now:
> 
> [Interface]
> PrivateKey = uMoD1TRi+tRkEVF/B5VrXQwHMN3xC1eLVXNbLkkkkkk=
> Address = 10.1.0.1/32
> ListenPort = 21404
> MTU=1300
> PostUp = ip route add 10.1.0.0/24 dev wg1
> PostDown = ip route del 10.1.0.0/24

Why you add a routing to a /24 if you only want 1:1 links?
I think with this entry the routing decision isn't made by
wireguards "AllowedIPs" statement, it is accomplished by normal 
routing lookups and get send through the tunnel.

Is there a reason for the /24 routing?

> [Peer]
> PublicKey = Zd5jssxd4zj/4d6ZpOtClyD/8V2eGR7jpHM3jpppppp=
> EndPoint = 162.243.2.2:21403
> AllowedIPs = 10.1.0.3/32

This should normally do what you expected, but i think as stated above
the /24 routing is "disabling" the correct behaviour.

regards, 
tim
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
