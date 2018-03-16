Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7bcb688
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 16:09:37 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [91.121.86.59])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58baecc7
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 16:09:37 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e9:9eff:fe8f:1bcf])
 by rin.romanrm.net (Postfix) with SMTP id 3760C403BA
 for <wireguard@lists.zx2c4.com>; Fri, 16 Mar 2018 16:20:14 +0000 (UTC)
Date: Fri, 16 Mar 2018 21:20:13 +0500
From: Roman Mamedov <rm@romanrm.net>
To: wireguard@lists.zx2c4.com
Subject: Re: Mixed MTU hosts on a network
Message-ID: <20180316212013.52a325ec@natsu>
In-Reply-To: <20180316155343.09a0f1bc@natsu>
References: <20180316142547.2ecb70de@natsu>
 <f8af81d0-631c-b74b-9491-94db61a250a2@noris.net>
 <20180316155343.09a0f1bc@natsu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, 16 Mar 2018 15:53:43 +0500
Roman Mamedov <rm@romanrm.net> wrote:

> But guess what, turns out that didn't work either. Tried both OUTPUT and
> POSTROUTING chains on the "mangle" table, and set-mss all the way down to
> 1220, no matter what, the iperf3 output looked the same as before.

Actually the iptables bit is easy to explain. Even if initial MSS is forced
to a low value on the sender, it's get negotiated back up to the maximum value
according to MTU on the receiver (changed both IPs since then):

21:13:38.641531 IP6 fd39:30::f5a8:e923:f8cd:24b5.40052 > fd39:30::e84f:942d:7f93:ddc1.5001: Flags [S], seq 2397878391, win 27200, options [mss 1220,sackOK,TS val 566161815 ecr 0,nop,wscale 9], length 0
21:13:38.641574 IP6 fd39:30::e84f:942d:7f93:ddc1.5001 > fd39:30::f5a8:e923:f8cd:24b5.40052: Flags [S.], seq 1221117548, ack 2397878392, win 26800, options [mss 1352,sackOK,TS val 2726162536 ecr 566161815,nop,wscale 9], length 0
21:13:38.716047 IP6 fd39:30::f5a8:e923:f8cd:24b5.40052 > fd39:30::e84f:942d:7f93:ddc1.5001: Flags [.], ack 1, win 54, options [nop,nop,TS val 566161889 ecr 2726162536], length 0
21:13:38.716444 IP6 fd39:30::f5a8:e923:f8cd:24b5.40052 > fd39:30::e84f:942d:7f93:ddc1.5001: Flags [P.], seq 1341:1605, ack 1, win 54, options [nop,nop,TS val 566161889 ecr 2726162536], length 264
21:13:38.716458 IP6 fd39:30::e84f:942d:7f93:ddc1.5001 > fd39:30::f5a8:e923:f8cd:24b5.40052: Flags [.], ack 1, win 55, options [nop,nop,TS val 2726162611 ecr 566161889,nop,nop,sack 1 {1341:1605}], length 0

So the other side really needs to have a proper MTU set. And the highest working
wg0 MTU on PPPoE turned out to be 1408, not 1412 as I assumed. As for why 1412
also works but only if set on the sender side, I've no explanation for that yet.

-- 
With respect,
Roman
