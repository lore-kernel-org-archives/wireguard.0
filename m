Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DBCC636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 20:42:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6139ac8d;
	Sun, 19 Feb 2023 20:42:56 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [91.121.86.59])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4c7f2042
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 20:42:53 +0000 (UTC)
Received: from nvm (nvm.home.romanrm.net [IPv6:fd39::101])
 by len.romanrm.net (Postfix) with SMTP id 3456A4017B;
 Sun, 19 Feb 2023 20:42:53 +0000 (UTC)
Date: Mon, 20 Feb 2023 01:42:52 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: tlhackque <tlhackque@yahoo.com>, wireguard@lists.zx2c4.com
Subject: Re: Source IP incorrect on multi homed systems
Message-ID: <20230220014252.21178988@nvm>
In-Reply-To: <87o7pp76a2.fsf@ungleich.ch>
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch>
 <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
 <bdeefdd3-d821-591f-b5fc-701be0e345fb@yahoo.com>
 <c2bc4ed2-e8c5-ff68-9fe8-c59c8be2804c@yahoo.com>
 <87o7pp76a2.fsf@ungleich.ch>
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

On Sun, 19 Feb 2023 21:18:34 +0100
Nico Schottelius <nico.schottelius@ungleich.ch> wrote:

> If I am not mistaken that would mean in practice:
> 
>    if orignal_pkg.ip_dst == one_of_my_ips then
>       return_pkg.ip.src = orignal_pkg.ip_dst
>       return_pkg.ip.dst = orignal_pkg.ip_src
>    fi
> 
> For me that sounds like a sane approach (aside from
> my very simplified algorithm).

Except there is no request and response in WG, and as such no original or
return packet. Another peer contacts you, then some time later you contact the
other peer. Or the other way round.

WG-wise what will need to be done is to store in the each peer's information
structure the local IP that we are supposed to use for communication with that
peer; and updating it when receiving packets from the peer, using the
destination of those. So you would see a "Local IP" in each "peer" section
when doing a "wg show".

Also, until there is such IP initially stored, it will have to be some default
outgoing IP of the system towards that peer. BTW, how would this work in your
setup, what if not the peer contacts you first, but your machine needs to
contact the peer?

-- 
With respect,
Roman
