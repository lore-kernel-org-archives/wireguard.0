Return-Path: <SRS0=/ntC=GS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 579BEC433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Jan 2021 15:28:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9EA422473
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Jan 2021 15:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9EA422473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bestov.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 011c1bcc;
	Fri, 15 Jan 2021 15:25:27 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f7bda156
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jan 2021 15:25:25 +0000 (UTC)
X-Originating-IP: 151.79.131.81
Received: from localhost (unknown [151.79.131.81])
 (Authenticated sender: pbl@bestov.io)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 9540C20018;
 Fri, 15 Jan 2021 15:25:23 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
From: "Riccardo Paolo Bestetti" <pbl@bestov.io>
To: "Maarten de Vries" <maarten@de-vri.es>, "Posegga, Joachim"
 <jp@sec.uni-passau.de>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: Re: Multiple Clients behind NAT
Date: Fri, 15 Jan 2021 16:22:05 +0100
Message-Id: <C8JU1RTQOKUE.3NQU5QRW2L5VI@enhorning>
In-Reply-To: <275695ad-bc63-01a6-18d0-6e9f410ec352@de-vri.es>
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

On Fri Jan 15, 2021 at 3:21 PM CET, Maarten de Vries wrote:
> WireGuard doesn't have to use the same local port for all clients. In
> fact, if you don't give a ListenPort explicitly, an ephemeral port is
> assigned. This could theoretically still conflict between clients on
This is correct. I mistakenly thought that, by default, WireGuard used
the target port as a source port as well (when available). Ephemeral
makes more sense & is also what really happens.

So yes, Joachim should both fix the NAT and drop ListenPort from his
clients.

Riccardo

