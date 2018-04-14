Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b922b27
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 15:48:19 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 436fb320
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 15:48:19 +0000 (UTC)
Date: Sat, 14 Apr 2018 11:01:47 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: Matthias Urlichs <matthias@urlichs.de>
Subject: Re: Using WG for transport security in a p2p network
Message-ID: <20180414160147.GA14141@wolff.to>
References: <CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com>
 <1a0ce6c1-4f62-509f-8d8e-9f0821d6f465@urlichs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <1a0ce6c1-4f62-509f-8d8e-9f0821d6f465@urlichs.de>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Apr 05, 2018 at 09:13:03 +0200,
  Matthias Urlichs <matthias@urlichs.de> wrote:
>Hi,<https://tools.ietf.org/html/draft-hohendorf-secure-sctp-25>
>>
>> Another option would be to run insecure QUIC or SCTP on top of WireGuard,
>You cannot run SCTP on the Internet anyway. Too many routers block
>anything that's not TCP/UDP/ICMP.

The tunnelled traffic is going to be UDP. If he controls everything from 
the tunnel endpoints to the traffic endpoints he can make sure SCTP isn't 
blocked.
