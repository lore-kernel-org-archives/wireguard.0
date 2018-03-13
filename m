Return-Path: condor@mailbox.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0812f65b
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Mar 2018 17:25:07 +0000 (UTC)
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37bb0c05
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Mar 2018 17:25:07 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id 3BA4642C4B
 for <wireguard@lists.zx2c4.com>; Tue, 13 Mar 2018 18:35:23 +0100 (CET)
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id WN9ouZeCL-jw for <wireguard@lists.zx2c4.com>;
 Tue, 13 Mar 2018 18:35:22 +0100 (CET)
Subject: Re: Multiple peers
To: wireguard@lists.zx2c4.com
References: <sw07RFheJeAt1YhiYncjYl7au2RKQqmg4fMvgZBN91qBmUxoSGX24JamLXZrSqMC0yvRvz3koe24Li8ini3tEP1h_3j5VF5IFrYwcOMXI0A=@protonmail.com>
From: condor+wireguard-mailinglist@mailbox.org
Message-ID: <2016b91a-4c7e-db4d-7e22-8a7efc9add39@mailbox.org>
Date: Tue, 13 Mar 2018 18:35:21 +0100
MIME-Version: 1.0
In-Reply-To: <sw07RFheJeAt1YhiYncjYl7au2RKQqmg4fMvgZBN91qBmUxoSGX24JamLXZrSqMC0yvRvz3koe24Li8ini3tEP1h_3j5VF5IFrYwcOMXI0A=@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Gianluca,

 > I wonder if I need to copy/paste all peers' public key on all the 
other peers' configuration, or I can just configure each peer to connect 
to the server and then allow peers talking with other peers passing 
through this server?

If you want each peer to have a 1:1 connection to each other peer, then 
– yes. But to maintain such a mesh will be quite a bit of work…

The easier solution should be to use the server as a hub. Make sure the 
AllowedIPs on the “clients” permit the subnet IP range you will be 
using, e.g. 192.168.10.0/24. The “server's” setting for AllowedIPs for 
each peer should reflect the single address (/32) you are setting as 
interface address on the peer's side.

To glue, add an iptables rule:
iptables -A FORWARD -i wg9 -o wg9 -j ACCEPT


Kind regards,
Peter
