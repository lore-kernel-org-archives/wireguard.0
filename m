Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bab6e4a7
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 18:19:06 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c662f315
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 18:19:06 +0000 (UTC)
Subject: Re: Using WG for transport security in a p2p network
To: Bruno Wolff III <bruno@wolff.to>
References: <CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com>
 <1a0ce6c1-4f62-509f-8d8e-9f0821d6f465@urlichs.de>
 <20180414160147.GA14141@wolff.to>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <f0d98fa8-245f-1de1-2e90-9f84113d781a@urlichs.de>
Date: Sat, 14 Apr 2018 20:33:14 +0200
MIME-Version: 1.0
In-Reply-To: <20180414160147.GA14141@wolff.to>
Content-Type: text/plain; charset=utf-8
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 14.04.2018 18:01, Bruno Wolff III wrote:
> On Thu, Apr 05, 2018 at 09:13:03 +0200,
>  Matthias Urlichs <matthias@urlichs.de> wrote:
>> Hi,<https://tools.ietf.org/html/draft-hohendorf-secure-sctp-25>
>>>
>>> Another option would be to run insecure QUIC or SCTP on top of
>>> WireGuard,
>> You cannot run SCTP on the Internet anyway. Too many routers block
>> anything that's not TCP/UDP/ICMP.
>
> The tunnelled traffic is going to be UDP. If he controls everything
> from the tunnel endpoints to the traffic endpoints he can make sure
> SCTP isn't blocked.

I know. That was kindof my point. Sorry if I didn't write that more clearly.

-- 
-- Matthias Urlichs
