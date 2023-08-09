Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FB5C001B0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  9 Aug 2023 21:18:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b114ef1;
	Wed, 9 Aug 2023 21:18:17 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [2a01:4f8:242:246e::2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id df345732
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 9 Aug 2023 21:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=DxxrfxJdW+x6vHwwv13H/HcSziuw1ToHD20ksvqM8rE=; 
 t=1691615111; x=1692824711; b=XFzJ434gUl6zBCvg7HFUduqwJk83/Hpvz7FIQs7hR/vmUGk
 K0YgaSr1AGD0SernuIqtPST/OUqzoMkJ8imwJVnEdRppgrK5jMb1FrVzdk9vAWJ8O3H9OK476PI49
 GpW+TRFUVLMxlA7gZX9p3geavwDs42tA1S12ndVB3H0wjGQOYnl16WvBHdIxGxame3FtrsbcPfGkx
 8JyLt77puxSG+MYsMWtIMDX8vRPYhWR67huld81bVroH8r9ic+B62e7Zh0F7lbUf9mq438AW85A41
 HPIZch8Sv/603jBKuskLPo5HuIcgeiE9JcBILnXTIIJuA2ejxPYDVvuwD3CTqNZA==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.96) (envelope-from <johannes@sipsolutions.net>)
 id 1qTqMM-00F8EE-2i; Wed, 09 Aug 2023 23:04:51 +0200
Message-ID: <4e0b764736eafde134e52e7609c6ad351a5282ad.camel@sipsolutions.net>
Subject: Re: [PATCH net-next 05/10] genetlink: use attrs from struct genl_info
From: Johannes Berg <johannes@sipsolutions.net>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com, 
 jiri@resnulli.us, Jason@zx2c4.com, alex.aring@gmail.com,
 stefan@datenfreihafen.org,  miquel.raynal@bootlin.com,
 krzysztof.kozlowski@linaro.org, jmaloy@redhat.com,  ying.xue@windriver.com,
 floridsleeves@gmail.com, leon@kernel.org,  jacob.e.keller@intel.com,
 wireguard@lists.zx2c4.com, linux-wpan@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net
Date: Wed, 09 Aug 2023 23:04:47 +0200
In-Reply-To: <20230809182648.1816537-6-kuba@kernel.org>
References: <20230809182648.1816537-1-kuba@kernel.org>
 <20230809182648.1816537-6-kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-Mailman-Approved-At: Wed, 09 Aug 2023 21:18:16 +0000
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

On Wed, 2023-08-09 at 11:26 -0700, Jakub Kicinski wrote:
> Since dumps carry struct genl_info now, use the attrs pointer
> use the attr pointer from genl_info and remove the one in
> struct genl_dumpit_info.

Some parts of that commit message got duplicated.

Otherwise looks fine,
Reviewed-by: Johannes Berg <johannes@sipsolutions.net>

johannes
