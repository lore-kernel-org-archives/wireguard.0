Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04d00c6b
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jan 2018 14:57:35 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dfc5a3ac
 for <wireguard@lists.zx2c4.com>; Tue, 9 Jan 2018 14:57:35 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1eYvNU-000Ay3-Qp
 for wireguard@lists.zx2c4.com; Tue, 09 Jan 2018 15:59:48 +0100
Subject: Re: WireGuard in systemd-networkd
To: wireguard@lists.zx2c4.com
References: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <940e5f29-3108-b29b-56cc-9646cdc29a74@urlichs.de>
Date: Tue, 9 Jan 2018 15:59:47 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 09.01.2018 14:49, Jason A. Donenfeld wrote:
> Thanks to the wonderful work of Jörg Thalheim, WireGuard is now
> supported inside systemd-netword's .netdev files.

That's great. Thaks for doing the work.

Speaking of systemd, and almost completely offtopic: would somebody be
willing to add support for ppp/pppoe to systemd-networkd? that's still
missing …

-- 
-- Matthias Urlichs
