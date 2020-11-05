Return-Path: <SRS0=Vb0R=EP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA98C4741F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:58:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C0BC2074F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Nov 2020 22:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C0BC2074F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gnumonks.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id defe9056;
	Mon, 9 Nov 2020 22:40:27 +0000 (UTC)
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org
 [2001:780:45:1d:225:90ff:fe52:c662])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 763098c1
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Nov 2020 07:57:13 +0000 (UTC)
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.89)
 (envelope-from <laforge@gnumonks.org>)
 id 1kaaBh-00065B-1j; Thu, 05 Nov 2020 09:00:05 +0100
Received: from laforge by localhost.localdomain with local (Exim 4.94)
 (envelope-from <laforge@gnumonks.org>)
 id 1kaaAB-004eo7-DZ; Thu, 05 Nov 2020 08:58:31 +0100
Date: Thu, 5 Nov 2020 08:58:31 +0100
From: Harald Welte <laforge@gnumonks.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 osmocom-net-gprs@lists.osmocom.org, wireguard@lists.zx2c4.com,
 Steffen Klassert <steffen.klassert@secunet.com>
Subject: Re: [PATCH net-next v2 06/10] gtp: switch to dev_get_tstats64
Message-ID: <20201105075831.GD1078888@nataraja>
References: <059fcb95-fba8-673e-0cd6-fb26e8ed4861@gmail.com>
 <52d228fe-9ed3-7cd0-eebc-051c38b5e45f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52d228fe-9ed3-7cd0-eebc-051c38b5e45f@gmail.com>
X-Mailman-Approved-At: Mon, 09 Nov 2020 23:40:11 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Looks good to me.

On Wed, Nov 04, 2020 at 03:27:47PM +0100, Heiner Kallweit wrote:
> Replace ip_tunnel_get_stats64() with the new identical core fucntion
> dev_get_tstats64().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Acked-by: Harald Welte <laforge@gnumonks.org>

-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
