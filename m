Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b16f5bf9
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 07:11:01 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.vm.smurf.noris.de
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06d26a5f
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 07:11:01 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1fIqaS-000CYk-El
 for wireguard@lists.zx2c4.com; Wed, 16 May 2018 09:11:01 +0200
Subject: Re: Need for HW-clock independent timestamps
To: wireguard@lists.zx2c4.com
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
 <489c2f57-574a-1223-9c4d-266904e52c94@gmail.com>
 <20180515202126.yw57deh6st5ebnk6@kowloon>
 <CAKXLc7drht4CVexsCTXwHe-Z_RyFghAhQsXom=z9dtQuxQU48Q@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <80879e37-f981-434b-e7ea-b512ce202894@urlichs.de>
Date: Wed, 16 May 2018 09:10:58 +0200
MIME-Version: 1.0
In-Reply-To: <CAKXLc7drht4CVexsCTXwHe-Z_RyFghAhQsXom=z9dtQuxQU48Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 15.05.2018 22:49, Kalin KOZHUHAROV wrote:
> [1]  Can anyone point me to the piece in code that shows that
> precision? In other words, how far apart can 2 peers' clocks be and
> still connect.

Infinite.

Seriously. The timestamp field is essentially a counter. It just counts
up in rather large time-based increments and happens to be seeded with
the current time, in the current implementation that is. If you forego
all of that, seed it with one, and make sure that there'll never be a
decrement (for instance by saving the current value + a trillion after
every reboot – you don't reboot a router often enough to endanger your
flash that way) you're all set.

-- 
-- Matthias Urlichs
