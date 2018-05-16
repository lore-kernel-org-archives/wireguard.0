Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6b247d0
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 07:14:00 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.vm.smurf.noris.de
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e832b6f
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 07:14:00 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1fIqdH-000Cb4-LW
 for wireguard@lists.zx2c4.com; Wed, 16 May 2018 09:13:56 +0200
Subject: Re: [ANNOUNCE] Alpha Snapshots of WireGuard for Android and macOS
To: wireguard@lists.zx2c4.com
References: <20180515225433.GA26432@zx2c4.com>
 <6f210e328bdca2d1a1ed1e3714b507ce571abc3f.camel@gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <955fe6b8-4e40-a3c3-c6a0-0050d3406913@urlichs.de>
Date: Wed, 16 May 2018 09:13:54 +0200
MIME-Version: 1.0
In-Reply-To: <6f210e328bdca2d1a1ed1e3714b507ce571abc3f.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 16.05.2018 09:10, Stefan Tatschner wrote:
> How can I debug this further?

Check the output of "ip rule".

-- 
-- Matthias Urlichs
