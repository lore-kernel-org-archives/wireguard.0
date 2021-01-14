Return-Path: <SRS0=Ms3O=GR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4859FC433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Jan 2021 17:18:02 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB6F623B1A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Jan 2021 17:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB6F623B1A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bestov.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43fa72fc;
	Thu, 14 Jan 2021 17:17:58 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 318b8370
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Jan 2021 17:17:55 +0000 (UTC)
X-Originating-IP: 151.79.131.81
Received: from localhost (unknown [151.79.131.81])
 (Authenticated sender: pbl@bestov.io)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id F38D41C0024;
 Thu, 14 Jan 2021 17:17:53 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: Multiple Clients behind NAT
From: "Riccardo Paolo Bestetti" <pbl@bestov.io>
To: "Posegga, Joachim" <jp@sec.uni-passau.de>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Date: Thu, 14 Jan 2021 18:09:37 +0100
Message-Id: <C8J1PKLM140S.1TQXP9KUN0QDH@enhorning>
In-Reply-To: <f785012b2c5a49c7ba7f48f40b6ce62f@smith.sec.uni-passau.de>
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

On Wed Jan 13, 2021 at 9:14 PM CET, Posegga, Joachim wrote:
> I am trying to connect multiple wireguard clients behind the same
> NAT-Gateway to a Mikrotik server with a public IP. I am not yet sure
> where exactly the problem is, but it seems that only one client at a
> time can establish a tunnel.

I don't know much about Mikrotik, but my guess is that it's not
randomizing source ports for packets egressing the NAT.

If that's the case, since WireGuard uses the same port for both source
and destination, and since your clients are all connecting to the same
server (and thus port), then your NAT can't demux incoming packets, and
it just sends them all to the same client. (It probably picks the first
one that sends egress packets, until it hits some inactivity time-out).

You should look into your Mikrotik configuration, looking for a flag to
enable source address randomization in NAT (it's sometimes called
"masquerading").

Riccardo

