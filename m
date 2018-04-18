Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05b6e076
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 21:08:28 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22799010
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Apr 2018 21:08:28 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1f8uIh-000GeA-9a
 for wireguard@lists.zx2c4.com; Wed, 18 Apr 2018 23:07:35 +0200
Subject: Re: [HACK] UDP tunneling over TCP for WireGuard
To: wireguard@lists.zx2c4.com
References: <24602785.LeAoNilrza@aoi.marionegri.it>
 <CAK_h9uELREbrKdphB_oQNTNpQDGgucr4HZ6-RLqM-DKwJV73bg@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <e1c2b089-399d-bb31-1fa7-01dac91f5bd1@urlichs.de>
Date: Wed, 18 Apr 2018 23:07:34 +0200
MIME-Version: 1.0
In-Reply-To: <CAK_h9uELREbrKdphB_oQNTNpQDGgucr4HZ6-RLqM-DKwJV73bg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,
> /usr/bin/socat -t600 -T600 -d -d UDP4-LISTEN:51821 tcp4:ENDPOINT_IP:

socat does not mark packet boundaries, which are essential. Thus, this
will not and can never work reliably.

Use a program that adds packet boundaries (i.e. packet length words, PPP
encoding, whatever).
socat alone cannot do this.

-- 
-- Matthias Urlichs
