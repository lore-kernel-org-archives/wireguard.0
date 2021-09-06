Return-Path: <SRS0=0dHh=N4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED42BC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Sep 2021 15:51:18 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94D20600CC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Sep 2021 15:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94D20600CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=tootai.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9954edb2;
	Mon, 6 Sep 2021 15:51:15 +0000 (UTC)
Received: from mail1.tootai.net (mail1.tootai.net [213.239.227.108])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0c027ea
 for <wireguard@lists.zx2c4.com>; Mon, 6 Sep 2021 15:51:09 +0000 (UTC)
Received: from mail1.tootai.net (localhost [127.0.0.1])
 by mail1.tootai.net (Postfix) with ESMTP id 14FD160818A8
 for <wireguard@lists.zx2c4.com>; Mon,  6 Sep 2021 17:51:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1630943469; bh=tDtiSf30YVOq0KoiZUAxwHJ9HWmieRTsn8J9Jtujj2g=;
 h=To:From:Subject:Date:From;
 b=hPz3rBugHRKN4GwirW7iZvkv+YlMJ94T8mwkhNe8limkk88n1TSbRjL/YuqOkFoD2
 410K7fe1MzxhO3S2c8UkAqqBfT/b5m1dkEzvxXkDdnTbpwmPOd79xU/vUiKNjGJqHf
 9gmAkrizHUWP+ZUHeN9Ia1LNuTaGtlrYtb/esDns=
Received: from [IPv6:2a01:729:16e:10::24] (unknown [IPv6:2a01:729:16e:10::24])
 by mail1.tootai.net (Postfix) with ESMTPA id D2D1A6081880
 for <wireguard@lists.zx2c4.com>; Mon,  6 Sep 2021 17:51:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tootai.net; s=mail;
 t=1630943468; bh=tDtiSf30YVOq0KoiZUAxwHJ9HWmieRTsn8J9Jtujj2g=;
 h=To:From:Subject:Date:From;
 b=f3UXB5NSLTqocGP0lt5qtFJ7qwvHbpG7ItJxYR/fnQ3T43snRf3N74/0BFl79fhRf
 oqxVcyr21Jf9fdhCNXkj2P+7ulalgWFqbQfz65/sUmUQD+rwrajfUa+2+O7QgfuUzN
 7Z1J/UNo5BlP+H52uhlH8DJU5B0T0P9/9jwFYhno=
To: wireguard@lists.zx2c4.com
From: Daniel <tech@tootai.net>
Subject: WG ipv6tunnel - ipv4 and ipv6 issues
Message-ID: <e490b0c3-ef5f-2725-e1a5-5cdc1b10da2e@tootai.net>
Date: Mon, 6 Sep 2021 17:51:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP
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

Hi list,

I setup a wg connection using only ipv6 addresses for wg IFACE. One end 
is fd99:1234:beef:cafe::10:1/64 -named S1- other one being 
fd99:1234:beef:cafe::70:1/64 -named S2- Each end can ping or ssh to the 
other one.

1. I would like to pass ipv4 traffic inside so I add on S1

sudo ip r add 10.0.70.0/24 via inet6 fd99:1234:beef:cafe::70:1 dev wig0

Destination server has a virbr0 bridge (kvm libvirt) with 2 addresses: 
10.0.70.1/32 and fd99:1234:beef:cafe::70:ff1/120

 From S1 I can ping or ssh the ipv6 address from virbr0 but get no 
answer when pinging or ssh the ipv4 address despite the fact that 
wig0@S2 get's the original traffic (tcpdump -ni wig0)

2. VMs from server S2 have ipv6 addresses like 
fd99:1234:beef:cafe::70:ff1[2-9]/120 They can ping S2 and virbr0 ipv6 
addresses but are not reachable from S1 nor they can ping ipv6 endpoints 
behind S1 (network fd53:9b48:337:8b38::/64) despite the fact that route 
exist

fd53:9b48:337:8b38::/64 via fd99:1234:beef:cafe::10:1 dev wig0 metric 
1024 pref medium

and there is no problem from S2. From iptables vue wig0 is accepted in 
INPUT, FORWARD and OUTPUT on S2. Both servers are running Debian11 with 
5.10 kernel.

What am I missing here ?


-- 
Daniel
