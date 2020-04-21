Return-Path: <SRS0=LfNZ=6Z=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE79C47255
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 06:23:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22512206A5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 11 May 2020 06:23:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=rfraile.eu header.i=@rfraile.eu header.b="ZtYtBPnn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22512206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rfraile.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63b22ac3;
	Mon, 11 May 2020 06:10:30 +0000 (UTC)
Received: from smtp-relay-01-3.dondominio.net (smtp-relay-01-3.dondominio.net
 [31.214.176.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2b9dda9e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Apr 2020 08:59:08 +0000 (UTC)
Received: from localhost (smtp-relay-local.scip.local [127.0.0.1])
 by smtp-relay.dondominio.com (Postfix) with SMTP id 798BA40996
 for <wireguard@lists.zx2c4.com>; Tue, 21 Apr 2020 11:09:49 +0200 (CEST)
Received: from mail-node.dondominio.com 
 by smtp-relay.dondominio.com (Postfix) with ESMTP id 25A9440C0B;
 Tue, 21 Apr 2020 11:09:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rfraile.eu; s=dddk;
 t=1587460188; bh=L/GxIKGZh1mWoeQD3gRZKAoydBaaXpBjkJgi0svScds=;
 h=Date:From:To:Subject:Message-ID:Content-Type;
 b=ZtYtBPnntV6qy7AKI8la9oqkQxAqgaSDc84UhvjKnuv6D2dJNR8gjDntwT6SaIdrt
 HrMD9a3cnAAK5iIS+NgP0ZmfR7u0icDD6x4KfWnNEvGuJb5eHGQZCex5UlqBt93FOL
 G+eXt89DCyrCnR0QfHIc668ZoP5c8taAfYHGtqYQ=
Received: from webmail.rfraile.eu (webmail-backend-03.scip.local
 [172.21.33.13]) (Authenticated sender: rfraile@rfraile.eu)
 by mail-node.dondominio.com (Postfix) with ESMTPA id 05A2D40B0E;
 Tue, 21 Apr 2020 11:09:48 +0200 (CEST)
Received: from 2.154.13.170.dyn.user.ono.com ([2.154.13.170])
 via webmail-ha-01.scip.local ([172.21.33.131]) by webmail.rfraile.eu
 with HTTP (HTTP/1.1 POST); Tue, 21 Apr 2020 11:09:48 +0200
MIME-Version: 1.0
Date: Tue, 21 Apr 2020 11:09:48 +0200
From: Ricardo Fraile <rfraile@rfraile.eu>
To: simon@rozman.si, virtualdxs@gmail.com, wireguard@lists.zx2c4.com
Subject: RE: Search Domain/DNS Suffix
User-Agent: DD Webmail
Message-ID: <f27176e3fc6ede8d04682a9b504df177@rfraile.eu>
X-Sender: rfraile@rfraile.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
 (mail-node.dondominio.com [0.0.0.0]); Tue, 21 Apr 2020 11:09:48 +0200 (CEST)
X-Mailman-Approved-At: Mon, 11 May 2020 08:10:29 +0200
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

Hi,

I tried to solve a similar issue on Linux a few months ago but sadly it 
wasn't merged to wg-quick:

https://www.mail-archive.com/wireguard@lists.zx2c4.com/msg04530.html

In my particular opinion, I think that this option is mandatory at the 
same level as DNS servers.

Regards,
