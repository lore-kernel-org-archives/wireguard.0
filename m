Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5F7E9A75A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Mar 2026 10:42:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 96e1bd1a;
	Tue, 24 Mar 2026 10:42:27 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [2a0c:4d80:42:2001::664])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id bfd9e86e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Mar 2026 10:42:24 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1774348944; bh=LyF1N5iJwh1H/cA8AtTAo/rsNQ5gPtEv63rH8rFZJQQ=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=U3bHWtV9zHgO7RlOyCte2i9MXBaxUvaoQxmQXcF5KEc2Fd9jTOjvLmOtAdAr2laH+
 9k9Bf8e4LHuMNTlWw1v+0p0RxMCPoNqUh5MQLt2VpNaETeFNvOHRE58BpfRE1fo/ZH
 X8rGL4/sKfI8Y2UZnH1yKdX8CAuiLvcicU0WDTYyC8wrAkSG3KPLbuOjf+MwR6qLbE
 xxz1N4PkM9Cyf/Jm+SZ71GSw+e47NzohUXvD4KFop7DqTWQ8D7MITIj7BijejR5mjR
 MPtkAeeXPZBuI7RWTGcpj54eb04W4Q+nd7sfTXpV65MyuogHNhq8Q6wUH8pj3DjRwa
 +WMpehK5nTYjA==
To: sh0rch <sh0rch@iwl.dev>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: Re: gutd =?utf-8?Q?=E2=80=94?= WireGuard traffic obfuscator via
 TC/XDP eBPF (no kernel patches)
In-Reply-To: <GVXP251MB0790009AEBCBE7855DDCB5B28375A@GVXP251MB0790.EURP251.PROD.OUTLOOK.COM>
References: <GVXP251MB0790009AEBCBE7855DDCB5B28375A@GVXP251MB0790.EURP251.PROD.OUTLOOK.COM>
Date: Tue, 24 Mar 2026 11:42:23 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87qzp9mru8.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
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

> Would appreciate any feedback - especially on the BPF approach,

Cool project! A couple of comments on the BPF side:

- It looks like you're using libbpf_rs to load the BPF programs. Have
  you considered using the (pure rust) Aya library instead
  (https://github.com/aya-rs/aya)? If so, what was the reason for
  choosing the libbpf wrapper instead?

- From a quick look at the architecture doc, I don't understand why you
  need the veth pair? You're just rewriting packet contents, this could
  just as well be done in the TC hook (egress and ingress) of the
  physical NIC, and from the wireguard PoV it would just look like wg
  itself is speaking directly to the other tunnel peer?

-Toke
