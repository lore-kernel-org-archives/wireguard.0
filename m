Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B86C636CC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 19 Feb 2023 21:50:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19522865;
	Sun, 19 Feb 2023 21:49:00 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:2:2:0:c8ff:fe68:bf1c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e46622ae
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2023 21:48:56 +0000 (UTC)
Received: from nb3.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 656841FDCB;
 Sun, 19 Feb 2023 22:48:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1676843316;
 bh=itLcksUeOXhOAPLVnd4DJvkcNoRW8+Gq2jyNDLIoNNk=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=ksqSfTGUjddPpaPBH9hlu2xGsB19JcYVCCSL+/VkyzBPrj5j29M4azoQcl0gJGUmM
 EqfGEyLhty3iCIRfwHKp9M80gNinJIUlQ64M3MHhFB8tmD0+2Whpc8k24C9seGttNv
 SQZpMpn6VaoJZEzjCJc6XfNj5QAdkXMFE2pbH1wo0e2+QEGOuxWZ1X9XJHCzhXxaRO
 QVITOjLIQzNgPe6hOYyUnHT/CNJCPA/DxwGvctFM1F9s2PNZSm7/OzdLb4/+5MEDyt
 pqH9C5sC4OBQPq27CWKY6qYX+Na5xoDOUatO+tnjAuXjytupkpU/OeWD4v2AtLjEV0
 R6z50JUXXQAcA==
Received: by nb3.localdomain (Postfix, from userid 1000)
 id 8893614C0119; Sun, 19 Feb 2023 22:48:55 +0100 (CET)
References: <875yby83n2.fsf@ungleich.ch>
 <2ed829aaed9fec59ac2a9b32c4ce0a9005b8d8b850be81c81a226791855fe4eb@mu.id>
 <87ttzhc0jt.fsf@ungleich.ch>
 <7d7bc930-65d9-f13e-cedc-e0451407be85@chil.at>
 <CAJJxGdGSYR_mofRVpZDQsifjZJXXSNNsPqUV-RfWDMO0N2P2dQ@mail.gmail.com>
 <bdeefdd3-d821-591f-b5fc-701be0e345fb@yahoo.com>
 <c2bc4ed2-e8c5-ff68-9fe8-c59c8be2804c@yahoo.com>
 <87o7pp76a2.fsf@ungleich.ch> <20230220014252.21178988@nvm>
User-agent: mu4e 1.8.9; emacs 28.2
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Roman Mamedov <rm@romanrm.net>
Cc: Nico Schottelius <nico.schottelius@ungleich.ch>, tlhackque
 <tlhackque@yahoo.com>, wireguard@lists.zx2c4.com
Subject: Re: Source IP incorrect on multi homed systems
Date: Sun, 19 Feb 2023 22:19:23 +0100
In-reply-to: <20230220014252.21178988@nvm>
Message-ID: <87h6vh72d4.fsf@ungleich.ch>
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


Hey Roman,

Roman Mamedov <rm@romanrm.net> writes:

> On Sun, 19 Feb 2023 21:18:34 +0100
> Nico Schottelius <nico.schottelius@ungleich.ch> wrote:
>
>> If I am not mistaken that would mean in practice:
>>
>>    if orignal_pkg.ip_dst == one_of_my_ips then
>>       return_pkg.ip.src = orignal_pkg.ip_dst
>>       return_pkg.ip.dst = orignal_pkg.ip_src
>>    fi
>>
>> For me that sounds like a sane approach (aside from
>> my very simplified algorithm).
>
> Except there is no request and response in WG, and as such no original or
> return packet. Another peer contacts you, then some time later you contact the
> other peer. Or the other way round.
>
> WG-wise what will need to be done is to store in the each peer's information
> structure the local IP that we are supposed to use for communication with that
> peer; and updating it when receiving packets from the peer, using the
> destination of those. So you would see a "Local IP" in each "peer" section
> when doing a "wg show".

That is very interesting, thanks for the insight. Reading above
paragraph, I was having a very similar thought that we need to record
the local IP.

> Also, until there is such IP initially stored, it will have to be some default
> outgoing IP of the system towards that peer. BTW, how would this work in your
> setup, what if not the peer contacts you first, but your machine needs to
> contact the peer?

So far this situation doesn't exist for us, because only servers are
multi homed.

However, having an option to specify something a local address in each peer
section would probably be a good solution to disambiguate it and if not
specified, use the default, as in whatever other processes are using
that don't define it explicitly - i.e. follow the process of least
surprise.

Best regards,

Nico

--
Sustainable and modern Infrastructures by ungleich.ch
