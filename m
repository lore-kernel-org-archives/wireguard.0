Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbb817af
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 14:06:59 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.vm.smurf.noris.de
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a67a39f
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 14:06:59 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1fIx4q-000JnE-5H
 for wireguard@lists.zx2c4.com; Wed, 16 May 2018 16:06:49 +0200
Subject: Re: Cipher the private key in peers wg0.conf ?
To: wireguard@lists.zx2c4.com
References: <392763090.3358208.1526475207903.ref@mail.yahoo.com>
 <392763090.3358208.1526475207903@mail.yahoo.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <6e06ad4b-24f2-4d25-b52c-780f0f341d2e@urlichs.de>
Date: Wed, 16 May 2018 16:06:46 +0200
MIME-Version: 1.0
In-Reply-To: <392763090.3358208.1526475207903@mail.yahoo.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 16.05.2018 14:53, reiner otto wrote:
> Actually, in wg0.conf the private key is defined in clear text. Which allows dump of physical disk to grab it
> and to fake this client.
So? If you have physical access to the peer's (unencrypted) disk you can
do anything. Security is over.
> Wouldn't it be safer, to cipher the private key somehow ?
Where would you store the key for that?

If you need that kind of safety, encrypt the whole disk. Securing the
private key doesn't help if you can simply subvert the binary that
decrypts it.

-- 
-- Matthias Urlichs
