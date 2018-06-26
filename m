Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d66930d9
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 08:08:47 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.vm.smurf.noris.de
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d24b29c4
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 08:08:46 +0000 (UTC)
Received: from hyper1.noris.net ([62.128.1.62] helo=[10.6.0.3])
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1fXj6P-000KOZ-0x
 for wireguard@lists.zx2c4.com; Tue, 26 Jun 2018 10:13:29 +0200
Subject: Re: wg addconf :: AllowedIPs gets deleted with the additions of peers
To: wireguard@lists.zx2c4.com
References: <a989a217-9e18-5e5f-2a97-fa3ac81ccb87@gmail.com>
 <8736xaod3b.fsf@toke.dk> <ff54875a-3630-52bd-5f45-1b8e8a182ae7@gmail.com>
 <87woummwlh.fsf@toke.dk> <b4b972dc-7852-4b43-0015-2963437e1de3@gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <d1f72e76-7477-5aa6-88c6-2908c4be68f5@urlichs.de>
Date: Tue, 26 Jun 2018 10:13:27 +0200
MIME-Version: 1.0
In-Reply-To: <b4b972dc-7852-4b43-0015-2963437e1de3@gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 26.06.2018 09:34, Adrian Sevcenco wrote:
> Then, how can i set a default allow everything for each peer? Should i
> make a different tunnel for each peer? 

Why would you want to? You need IP routing information for each peer,
just like you need their public key. You can't have two peers / networks
/ whatever with the same IP address or address range. That's always been
the case, wireguard or no wireguard.

-- 
-- Matthias Urlichs
