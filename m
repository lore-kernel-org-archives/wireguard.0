Return-Path: brunnre8@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2cbbeb36
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 May 2018 11:21:44 +0000 (UTC)
Received: from mail-wm0-x232.google.com (mail-wm0-x232.google.com
 [IPv6:2a00:1450:400c:c09::232])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2126dfce
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 May 2018 11:21:43 +0000 (UTC)
Received: by mail-wm0-x232.google.com with SMTP id a137-v6so11686269wme.1
 for <wireguard@lists.zx2c4.com>; Mon, 21 May 2018 04:22:40 -0700 (PDT)
Return-Path: <brunnre8@gmail.com>
Received: from gmail.com (adsl-178-39-227-80.adslplus.ch. [178.39.227.80])
 by smtp.gmail.com with ESMTPSA id a20-v6sm7256594eda.82.2018.05.21.04.22.37
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 May 2018 04:22:37 -0700 (PDT)
Date: Mon, 21 May 2018 13:22:35 +0200
From: Reto Brunner <brunnre8@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: Re: WG: Need for HW-clock independent timestamps
Message-ID: <20180521112235.v2ksniasmd36kern@ghostArch.localdomain>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <403fa228-40e5-cbe4-4135-15b71cf76553@cgws.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <403fa228-40e5-cbe4-4135-15b71cf76553@cgws.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, May 21, 2018 at 12:07:38PM +0200, Axel Neumann wrote:
> entirely superfluous. As discussed earlier [3] it can be achieved with
> essentially one file-system write operation each boot.

You might as well achieve the same with the timestamp.
Just add a pre-shutdown hook, which touches a file.
Restore the system clock to this upon boot (which may very well be off
but who cares).

After the wg tunnel is back up, sync with any NTP server you trust and you
are back up and running.

What is the advantage of doing it with a counter?
I fail to see the benefit.
