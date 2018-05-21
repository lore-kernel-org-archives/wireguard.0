Return-Path: brunnre8@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1abe60d9
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 May 2018 12:35:04 +0000 (UTC)
Received: from mail-wm0-x236.google.com (mail-wm0-x236.google.com
 [IPv6:2a00:1450:400c:c09::236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d0c0b13
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 May 2018 12:35:04 +0000 (UTC)
Received: by mail-wm0-x236.google.com with SMTP id m129-v6so26247118wmb.3
 for <wireguard@lists.zx2c4.com>; Mon, 21 May 2018 05:36:01 -0700 (PDT)
Return-Path: <brunnre8@gmail.com>
Received: from gmail.com (adsl-178-39-227-80.adslplus.ch. [178.39.227.80])
 by smtp.gmail.com with ESMTPSA id z7-v6sm7120734edr.6.2018.05.21.05.35.59
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 May 2018 05:35:59 -0700 (PDT)
Date: Mon, 21 May 2018 14:35:58 +0200
From: Reto Brunner <brunnre8@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: Re: WG: Need for HW-clock independent timestamps
Message-ID: <20180521123558.qemdunuwgr4u7gsj@ghostArch.localdomain>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <403fa228-40e5-cbe4-4135-15b71cf76553@cgws.de>
 <20180521112235.v2ksniasmd36kern@ghostArch.localdomain>
 <97874cad-ac60-5a88-a384-f036f9688668@cgws.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <97874cad-ac60-5a88-a384-f036f9688668@cgws.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, May 21, 2018 at 01:52:34PM +0200, Axel Neumann wrote:
> yes, can be an option, but would only work in "normal" soft-shut-down
> cases, not in case of a hard reset or power cycle. A not-so-uncommon
> scenario for embedded home-network devices and community-network
> deployments. Especially when considering the first choice of a  normal
> user (desperately trying to fix its internet-via-WG tunnel connection):
> Power cycle the device.
But the same issue would be occurring if you used a counter instead.
At one point you *have* to write a checkpoint somewhere.

If you just want a single write cycle, then you loose the ability to graceful
handle unexpected shutdowns.

Even if you increment the counter by 10'000 when restoring it, who's to
say the device hasn't been running for several weeks before the
unexpected power cycle happened?
Even the +10'000 counter would then already be way smaller than the
*actual* counter from the servers perspective.
