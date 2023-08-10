Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B223C27C53
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cee21824;
	Wed, 16 Aug 2023 22:19:07 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 966fb045
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2023 06:17:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B87F5FF806;
 Thu, 10 Aug 2023 06:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1691648271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tCIldS7LgLkPH6J7rOrlaq8d6ZCqBahmrHWXhqMCqrQ=;
 b=Jo6v7fsauFxEg0pgDs7l0RyOUOqAr1TIKTgcHJZmAD8dsHY0cAKbYXbcXKj5t/V+1feTy1
 ZHeivWFlH8RBiM/9sCPF+vzuQBeIBuL40kfYZdiHUuVAS98ocnGZzFY+7vPD/huMvuql6U
 A3iXMVmAB6X7Phi7XdbhXwH4SqdMCttpIDAqxHzYUFzNeW6dW/NsWSLiiw+BH9qlQQHwAe
 8mnrvYJYkyn3ZPvBW6YLfMpRLtfPLyxy98cMQRZSXt5R7XsUiOoixoP7P0xFLWp2jWNgRA
 3Jtko+zPAP4vjS4Cttq4iBDB1Ai1NmGjdMNd6ynYX0/U1EdvDtcV9YOWzs9LNg==
Date: Thu, 10 Aug 2023 08:17:43 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, jiri@resnulli.us, johannes@sipsolutions.net,
 Jason@zx2c4.com, alex.aring@gmail.com, stefan@datenfreihafen.org,
 krzysztof.kozlowski@linaro.org, jmaloy@redhat.com, ying.xue@windriver.com,
 floridsleeves@gmail.com, leon@kernel.org, jacob.e.keller@intel.com,
 wireguard@lists.zx2c4.com, linux-wpan@vger.kernel.org,
 tipc-discussion@lists.sourceforge.net
Subject: Re: [PATCH net-next 05/10] genetlink: use attrs from struct genl_info
Message-ID: <20230810081743.567abd78@xps-13>
In-Reply-To: <20230809182648.1816537-6-kuba@kernel.org>
References: <20230809182648.1816537-1-kuba@kernel.org>
 <20230809182648.1816537-6-kuba@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-Mailman-Approved-At: Wed, 16 Aug 2023 22:19:06 +0000
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

Hi Jakub,

kuba@kernel.org wrote on Wed,  9 Aug 2023 11:26:43 -0700:

> Since dumps carry struct genl_info now, use the attrs pointer
> use the attr pointer from genl_info and remove the one in

"use the attr pointer" is present twice

> struct genl_dumpit_info.
>=20
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

>  net/ieee802154/nl802154.c       | 4 ++--

Otherwise for wpan:

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
