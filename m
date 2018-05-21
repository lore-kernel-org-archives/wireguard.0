Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1b6a85b
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 May 2018 13:52:27 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.vm.smurf.noris.de
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e641429
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 May 2018 13:52:27 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1fKlFP-0005tF-1t
 for wireguard@lists.zx2c4.com; Mon, 21 May 2018 15:53:11 +0200
Subject: Re: WG: Need for HW-clock independent timestamps
To: wireguard@lists.zx2c4.com
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <403fa228-40e5-cbe4-4135-15b71cf76553@cgws.de>
 <20180521112235.v2ksniasmd36kern@ghostArch.localdomain>
 <97874cad-ac60-5a88-a384-f036f9688668@cgws.de>
 <20180521123558.qemdunuwgr4u7gsj@ghostArch.localdomain>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <8fc246f8-7662-2fd2-f6ee-93d6802a37f0@urlichs.de>
Date: Mon, 21 May 2018 15:53:10 +0200
MIME-Version: 1.0
In-Reply-To: <20180521123558.qemdunuwgr4u7gsj@ghostArch.localdomain>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 21.05.2018 14:35, Reto Brunner wrote:
> If you just want a single write cycle, then you loose the ability to graceful
> handle unexpected shutdowns.
Why?
> Even if you increment the counter by 10'000 when restoring it, who's to
> say the device hasn't been running for several weeks before the
> unexpected power cycle happened?

So increment the counter by a trillion instead. It's large enough and
you're not going to send a trillion packets before the next reboot.

-- 
-- Matthias Urlichs
