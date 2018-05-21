Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6eeff9dd
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 May 2018 15:34:26 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.vm.smurf.noris.de
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1364226e
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 May 2018 15:34:25 +0000 (UTC)
Subject: Re: WG: Need for HW-clock independent timestamps
To: Bruno Wolff III <bruno@wolff.to>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <403fa228-40e5-cbe4-4135-15b71cf76553@cgws.de>
 <20180521112235.v2ksniasmd36kern@ghostArch.localdomain>
 <97874cad-ac60-5a88-a384-f036f9688668@cgws.de>
 <20180521123558.qemdunuwgr4u7gsj@ghostArch.localdomain>
 <8fc246f8-7662-2fd2-f6ee-93d6802a37f0@urlichs.de>
 <20180521145618.GA3199@wolff.to>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <c1fb2c8b-12f1-7e98-8291-a63c1eb91682@urlichs.de>
Date: Mon, 21 May 2018 17:34:42 +0200
MIME-Version: 1.0
In-Reply-To: <20180521145618.GA3199@wolff.to>
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

On 21.05.2018 16:56, Bruno Wolff III wrote:
> If you want to go that route, you should just treat it as a two part
> number. One for a boot count, that would get incremented every boot
> and saved and a low order part that is reset to 0 at every boot.
That'd work for me, though I prefer to use an opaque number /
base64string-of-12-bytes that doesn't look like it means something.
> Note that this scheme leaks information to the peer.

Rebooting is likely to leak that information anyway, because the peer
sees a period with no packets from you (also, it can't ping you)
followed by a possibly-premature re-key (depending on how long your boot
process takes).

I might also wonder why you'd peer with somebody whom you don't trust
not to collect and/or abuse the information that you just rebooted …

-- 
-- Matthias Urlichs
