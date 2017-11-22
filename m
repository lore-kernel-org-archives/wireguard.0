Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31c1b5df
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 16:34:38 +0000 (UTC)
Received: from netz.smurf.noris.de (netz.smurf.noris.de [213.95.21.43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4846426b
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 16:34:38 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by netz.extern.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1eHY3O-0004Gw-0E
 for wireguard@lists.zx2c4.com; Wed, 22 Nov 2017 16:39:15 +0000
Subject: Re: roaming and ddns dynamic ip
To: wireguard@lists.zx2c4.com
References: <CAC6SzHKVvOEZYXiuK-O6jMN=OOPjfogq2bbeHnYA1xoLew-OcQ@mail.gmail.com>
 <CAHmME9qmZCt7GDeXZtDBwSeg2z1Md9UQENbNo5TXvSqWion9rA@mail.gmail.com>
 <CAC6SzHJ_xHN5fCn2mQ=xrx2Uz6YbZLoHE6As0bwE1SmzprCn+g@mail.gmail.com>
 <D8DF2FC5-F5BF-474E-B774-C0FF4D993DB9@lonnie.abelbeck.com>
 <CAC6SzHKzraOBNh0B9C9PUojSJy2r2XvfqehzEnmzzK5GJeuG6w@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <1894f6f6-25bf-206b-24da-59187e6114fe@urlichs.de>
Date: Wed, 22 Nov 2017 17:39:13 +0100
MIME-Version: 1.0
In-Reply-To: <CAC6SzHKzraOBNh0B9C9PUojSJy2r2XvfqehzEnmzzK5GJeuG6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 22.11.2017 17:00, d tbsky wrote:
> when client is behind firewall via nat to internet, and server has
> dynamic ip, I don't think keepalive will help. since the changed
> server can not connect to client, it needs client to initial the
> connection. under openvpn, keepalive can detect broken link and try to
> restart itself, then client can reconnect to server automatically.

That situation calls for userspace (on the client) to monitor the
connection and update the peer address, if it changed.

The kernel side's job would be to be sufficiently monitor-able via
netlink – polling is evil – so that a userspace tool can actually do this.

-- 
-- Matthias Urlichs
