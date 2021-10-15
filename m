Return-Path: <SRS0=FZ0+=PD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43AF8C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Oct 2021 10:14:38 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E28B760F5D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 15 Oct 2021 10:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E28B760F5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a385ceb3;
	Fri, 15 Oct 2021 10:14:34 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 41715eea
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Oct 2021 10:14:32 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1634292872; bh=noy+tkLDtBUxCm7oIZ7rNXYpnWf0pueuO+I7+2xGbhU=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=cGFI4Zwv6/yGGrx1fA/BRmiKWK3qPZhs73Sv8b/0goMyJUTKVE2rP4M9AbmBvXJa6
 KiaOFud+3GGe4gXS6f/y/SUpOuIRysKLBSjnlKgCYCkZo7nov7czCNLf9+3K7kxhtu
 qw45dFfmp6qBpP95e2tqg88fOoqlLK1WleHZeyzaH+2TuseZeLziqRlSKV62PlEH+y
 /WUOBeDvxnQZKI3O53FK1NpeJ43q/LBbfnJPJvEKOBhyi+qOaWsYUN95p98d+mjt8B
 +k6gYXJTxKV+OinrRNrzlRjE5+lr3T2iTPWAamFfpsNWoOy4bOpMQZOnu/ai4tu39l
 muG+Oqx0ffzuw==
To: Svenne Krap <svenne@kracon.dk>, wireguard@lists.zx2c4.com
Subject: Re: Source IP for multihomed peer
In-Reply-To: <d0e1773d-80d5-7676-7943-2eff8d57beaa@kracon.dk>
References: <d0e1773d-80d5-7676-7943-2eff8d57beaa@kracon.dk>
Date: Fri, 15 Oct 2021 12:14:31 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87ee8m1to8.fsf@toke.dk>
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

> 2) Is there any way to force the source ip of the connection from boxA 
> to always use address boxA1 ?

In theory this should be possible to enforce via policy routing. Just
tried this on a simple veth setup:

# ip a add 10.11.1.1/24 dev veth0
# ip a add 10.11.2.1/24 dev veth0
# ping 10.11.1.2 -c 1
12:09:22.385888 IP 10.11.1.1 > 10.11.1.2: ICMP echo request, id 15, seq 1, length 64
12:09:22.385903 IP 10.11.1.2 > 10.11.1.1: ICMP echo reply, id 15, seq 1, length 64

# ip r add 10.11.1.2 src 10.11.2.1 dev veth0
# ping 10.11.1.2 -c 1
12:09:53.251386 IP 10.11.2.1 > 10.11.1.2: ICMP echo request, id 16, seq 1, length 64
12:09:53.251403 IP 10.11.1.2 > 10.11.2.1: ICMP echo reply, id 16, seq 1, length 64

I think this ought to work for wireguard's source selection as well. If
you don't have a particular destination, you should be able to do
something similar based on sports with ip-rule using the wireguard
source port:

# ip rule add sport 1234 lookup 100
# ip route add table 100 default via 1.2.3.4 src 3.4.5.6

That last bit I didn't test, though...

-Toke
