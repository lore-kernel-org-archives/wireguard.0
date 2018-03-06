Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d9db883
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 22:50:51 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d3e670a
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 22:50:51 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1etLYa-000A8d-Pm
 for wireguard@lists.zx2c4.com; Tue, 06 Mar 2018 23:59:41 +0100
Subject: Re: Roaming between IPv4 and IPv6?
To: wireguard@lists.zx2c4.com
References: <871sgwna50.fsf@toke.dk>
 <CAHmME9oF2TUQiO=xCeoMD2ajbG+16netREXD3YCem=j7HmwkoA@mail.gmail.com>
 <87y3j4luw4.fsf@toke.dk>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <db1cb140-af48-bc7b-801e-e2419f17761c@urlichs.de>
Date: Tue, 6 Mar 2018 23:59:39 +0100
MIME-Version: 1.0
In-Reply-To: <87y3j4luw4.fsf@toke.dk>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 06.03.2018 23:08, Toke Høiland-Jørgensen wrote:
> I think the idea of configuring both v4 and v6 on startup and caching
> them is a reasonable idea. Maybe even configure all available addresses
> when doing the initial DNS lookup? Or is that awkward to do?

Frankly, IMHO that's a userspace problem. I don't want to see the kernel
driver burdened with complicated timeout logic, multiple address caching
and timeouts, and whatnot. Discovering which address is still reachable
when a link fails, re-checking DNS (you really should not use a resolved
address beyond its DNS timeout, esp. not when it fails to work), and all
those sundry tasks do not belong in the kernel.

-- 
-- Matthias Urlichs
