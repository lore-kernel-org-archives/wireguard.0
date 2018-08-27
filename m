Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 300a8780
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Aug 2018 14:43:03 +0000 (UTC)
Received: from netz.smurf.noris.de (2001:780:107:8:83::
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fce86248
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Aug 2018 14:43:03 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1fuIvf-000FdU-DP
 for wireguard@lists.zx2c4.com; Mon, 27 Aug 2018 16:55:43 +0200
Subject: Re: Getting IPv6 route advertisements to work over WG
To: wireguard@lists.zx2c4.com
References: <20180827171426.7c4ec614@natsu>
 <8c7ad33a-b1bc-1993-e442-836230f4bf37@gmail.com>
 <20180827185329.1a7bb24a@natsu>
 <AM5PR0802MB2450F5F2541FA58DF48E5D28FF0B0@AM5PR0802MB2450.eurprd08.prod.outlook.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <f67cb9ce-70d0-0b2c-64b7-04b3c0397702@urlichs.de>
Date: Mon, 27 Aug 2018 16:55:41 +0200
MIME-Version: 1.0
In-Reply-To: <AM5PR0802MB2450F5F2541FA58DF48E5D28FF0B0@AM5PR0802MB2450.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 27.08.2018 16:46, Riccardo Paolo Bestetti wrote:
> The tunnel could be initially established with no tunnel addresses,

It could also be initially established with one non-forwarded tunnel
address, allowing you to converse through the tunnel with standard
tools, and without adding unnecessary complexity to WG.

Also, keep in mind that you need an initial off-link transaction anyway,
to exchange public keys. You can exchange whatever else needs exchanging
at the same time.

-- 
-- Matthias Urlichs
