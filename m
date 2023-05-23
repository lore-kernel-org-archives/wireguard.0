Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B8CC7EE26
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 May 2023 15:53:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 967839bc;
	Tue, 23 May 2023 15:52:31 +0000 (UTC)
Received: from secgw1.intern.tuwien.ac.at (secgw1.intern.tuwien.ac.at
 [2001:629:1005:30::71])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5eeadb76
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 May 2023 13:00:10 +0000 (UTC)
Received: from totemomail (localhost [127.0.0.1])
 by secgw1.intern.tuwien.ac.at (8.14.7/8.14.7) with ESMTP id 34ND0ALh002330
 for <wireguard@lists.zx2c4.com>; Tue, 23 May 2023 15:00:10 +0200
Received: from localhost ([127.0.0.1])
 by totemomail (Totemo SMTP Server) with SMTP ID 772
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 May 2023 15:00:10 +0200 (CEST)
Received: from edge19b.intern.tuwien.ac.at (edge19b.intern.tuwien.ac.at
 [IPv6:2001:629:1005:30::46])
 by secgw1.intern.tuwien.ac.at (8.14.7/8.14.7) with ESMTP id 34ND09Sa002312
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <wireguard@lists.zx2c4.com>; Tue, 23 May 2023 15:00:09 +0200
Received: from mbx19d.intern.tuwien.ac.at (2001:629:1005:30::84) by
 edge19b.intern.tuwien.ac.at (2001:629:1005:30::46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 23 May 2023 15:00:09 +0200
Received: from [IPV6:2001:629:3200:547:3e97:eff:fe06:513e]
 (2001:629:3200:547:3e97:eff:fe06:513e) by mbx19d.intern.tuwien.ac.at
 (2001:629:1005:30::84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 23 May
 2023 15:00:09 +0200
Message-ID: <cda0cb9a-e222-2328-9982-d53daffbbf19@cvl.tuwien.ac.at>
Date: Tue, 23 May 2023 15:00:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: <wireguard@lists.zx2c4.com>
From: Theodor Mittermair <tmittermair@cvl.tuwien.ac.at>
Organization: TU Wien E193-1 CVL
Subject: Odd behaviour with wireguard on windows when using subnets in
 AllowedIPs
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: mbx19d.intern.tuwien.ac.at (2001:629:1005:30::84) To
 mbx19d.intern.tuwien.ac.at (2001:629:1005:30::84)
X-Mailman-Approved-At: Tue, 23 May 2023 15:52:29 +0000
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

Hi!

I already asked about this on https://web.libera.chat/#wireguard and was told to post to the mailing list.


tl;dr: under windows when using multiple subnets different from /0 or /32, they are treated as networks with broadcast adresses, makeing certain addresses not be tunneled as expected.

long story:


Preface (i changed details to avoid privacy conflicts, but to the best of my knowledge, that should not change the results):

Under my administration is a public /24 network, lets call it 1.2.3.0/24.
There is a wireguard server, assume it's address is 1.2.3.66.
In the network are some ssh servers which are not publicly reachable from outside the network, as well as a http(s) server on 1.2.3.79 which is generally reachable from everywhere.

It is the goal to tunnel only necessary addresses to the wireguard server, such that a client can access the internal ssh servers, but it is expected that the generally available http(s) server continues to be reachable.


To archieve this, I have client configurations that generally look like this:

==== ==== ==== ====
[Interface]
PrivateKey=clientprivkey
Address=10.20.0.4/32

[Peer]
PublicKey=serverpubkey
AllowedIPs=1.2.3.0/26
AllowedIPs=1.2.3.64/31
AllowedIPs=1.2.3.67/32
AllowedIPs=1.2.3.72/29
AllowedIPs=1.2.3.80/28
AllowedIPs=1.2.3.96/27
AllowedIPs=1.2.3.128/25
Endpoint=1.2.3.66:51820
PersistentKeepalive=15
==== ==== ==== ====

Reason for the ugly list of AllowedIPs of course is, if i just wrote "AllowedIPs=1.2.3.0/24" that would attempt to tunnel all traffic including the tunnel traffic that should go to the wireguard server through the tunnel.
While i hoped that this might work by the same magic that makes "AllowedIPs=0.0.0.0/0" work, experiments showed that a single "AllowedIPs=1.2.3.0/24" does not work on linux.

These configurations successfully connect to the wireguard server on both windows and linux and provide atleast _some_ functionality.
On linux, this config seems to work as i desire.
On windows, i can reach atleast one of the ssh internal ssh servers that would not be accessible without the tunneling, but, the http(s) server on .79 is not reachable anymore.
If i attempt to enter the webservers url or it's ip address in chrome on windows, i get an error "ERR_ADDRESS_INVALID" as long as the wireguard tunnel is active.

For debugging purposes i replaced "AllowedIPs=1.2.3.72/29" with "AllowedIPs=1.2.3.79/32" (ignoring the lost hosts for a moment), which makes it work (read as: i can access the http service on .79 as expected).

Out of curiosity, i tried to replace all AllowedIPs with a single "AllowedIPs=1.2.3.0/24" on windows (which was not functional under linux) and suprisingly that worked (means: ssh and http works as expected).

Further online reading brought up the "Table=off" option in the "[Interface]" section. When used with the sample configuration above, it makes it work on windows as well (though i have no reasonable explanation).
The same config with "Table=off" does not work at all on linux (understandable, since the routes to the subnets just aren't added anymore at all).

What at one point dawned on me, is that .79 is the last address of the .72/29 block, i.e. it's broadcast address.
That would also kind of explain the error my browser showed me in a way (since it's not really a thing to connect to a broadcast address over http i think).
The theory is somewhat verified by obtaining the same result when attempting to connect to other "broadcast" addresses (e.g.: 1.2.3.127) while the wireguard tunnel is active.


Conclusion:
I am now somewhat stuck with two variations (AllowedIPs netlist vs net/24 & Table=auto vs Table=off), which both make the config work on windows OR linux, but never fully functionally on both at the same time.
Because i would like to distribute a number of client configurations to unknown-OS-users, it would be strongly preferred to have one config that works regardless of client OS.
I _could_ just list each addresses in the /24 as a /32 and be done, but thats really awfull (and makes the config parser that does the pretty colors on windows hang for quite some seconds).
Am i missing something or did i find somewhat of a bug?


best regards
Theodor Mittermair
