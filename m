Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ed33325
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 13:00:46 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9be5240
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 13:00:46 +0000 (UTC)
Received: from hyper1.noris.net ([62.128.1.62] helo=[10.6.0.3])
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1ec9rJ-000AZC-O9
 for wireguard@lists.zx2c4.com; Thu, 18 Jan 2018 14:03:57 +0100
Subject: Re: passtos patch
To: wireguard@lists.zx2c4.com
References: <4dc5f671-790e-88df-5483-ee00716d570e@zenit.ru>
 <CAKXLc7cAs1fQ49F1ez_--ednQM6=voJEfPGmapBX8wS=XPGvEQ@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <77d34157-cbe4-8085-7168-9a0e5fe52505@urlichs.de>
Date: Thu, 18 Jan 2018 14:03:56 +0100
MIME-Version: 1.0
In-Reply-To: <CAKXLc7cAs1fQ49F1ez_--ednQM6=voJEfPGmapBX8wS=XPGvEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 18.01.2018 12:56, Kalin KOZHUHAROV wrote:
> a workaround would be to bunch a
> few wg tunnels (even bridge them at both ends?), use fwmark and mangle
> the TOS with iptables/ift...

So instead of outside information being visible by way of the TOS field
it's now visible by way of different UDP ports we're talking to.

I don't see any advantage here.

In fact I don't see much advantage of passing TOS out in the first
place. Either you have a reliable transit network with short queues, or
you don't. In the former case TOS is useless. In the latter case you
have other problems which a TOS field cannot fix anyway. (OK, this is a
bit more black+white than the Real World, but …)

-- 
-- Matthias Urlichs
