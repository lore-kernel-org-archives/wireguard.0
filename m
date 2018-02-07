Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3c598d2
 for <wireguard@lists.zx2c4.com>; Wed, 7 Feb 2018 13:00:56 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dfe27035
 for <wireguard@lists.zx2c4.com>; Wed, 7 Feb 2018 13:00:56 +0000 (UTC)
Received: from hyper1.noris.net ([62.128.1.62] helo=[10.6.0.3])
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1ejPR1-000KrA-Dc
 for wireguard@lists.zx2c4.com; Wed, 07 Feb 2018 14:06:47 +0100
Subject: Re: wg-quick systemd service does not work directly after boot
To: wireguard@lists.zx2c4.com
References: <d2debbc5-fc31-2671-6790-0f33194b146f@posteo.de>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <3e901b97-c67f-728b-332b-b301bb466dba@urlichs.de>
Date: Wed, 7 Feb 2018 14:06:46 +0100
MIME-Version: 1.0
In-Reply-To: <d2debbc5-fc31-2671-6790-0f33194b146f@posteo.de>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 07.02.2018 12:54, Mytril wrote:
> The interface cannot resolve the dynamic domain, because the internet
> connection is not established at this moment.
>
> But i have also only a workaround to create wg0. I also start the wg at
> a later time.
>
> So i think this is not a bug, but rather a problem with the order of
> network connection startup.
Right. There cannot be a "correct" way of ordering wireguard vs. other
interfaces that works in all circumstances.

However, instead of sleeping, a dependency on network-online.target
might be more appropriate if wireguard needs to resolve a name.

-- 
-- Matthias Urlichs
