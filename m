Return-Path: <SRS0=YN3W=RD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B43BEC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 18:49:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40D52218B0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 18:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40D52218B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4f923ae;
	Thu, 28 Feb 2019 18:39:35 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9e75145
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 18:39:33 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [91.121.75.85])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17cf625e
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 18:39:33 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id BDD1820394;
 Thu, 28 Feb 2019 18:49:13 +0000 (UTC)
Date: Thu, 28 Feb 2019 23:49:13 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "STR ." <strykar@hotmail.com>
Subject: Re: Help calculate MTU, ISP's 1448
Message-ID: <20190228234913.61927412@natsu>
In-Reply-To: <DM6PR12MB3401FF1DE04A62EAD84F2C74BB7B0@DM6PR12MB3401.namprd12.prod.outlook.com>
References: <DM6PR12MB3401FF1DE04A62EAD84F2C74BB7B0@DM6PR12MB3401.namprd12.prod.outlook.com>
MIME-Version: 1.0
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Tue, 26 Feb 2019 12:39:50 +0000
"STR ." <strykar@hotmail.com> wrote:

> I have Fiber to our apartment complex basement, from there Cat6 runs to
> each apartment. The ISP/apartment service provider suggests an MTU of
> 1448, which I set for the PPPoE interface on my OpenWRT router.

It could be that your ISP meant this as the pre-PPPoE MTU, so 1448 on ethX
link, but 1440 inside PPPoE.

> I read 
> https://lists.zx2c4.com/pipermail/wireguard/2017-December/002201.html
> which comes to (assuming 1500 byte MTU) to 60 bytes (IPv6) to 80 bytes less to account for Wireguard protocol overhead.
> 
> Using this info, I tried an MTU of both (1448-80=1368) and (1448-
> 60=1388).
> As my ISP assigns only IPv4, I expected an MTU of 1388 to work, which I
> set on the Wireguard interface in OpenWRT.
> 
> However, when set to 1388, almost everything works except any Google
> related sites like Maps, Gmail, YT etc.
> When set to 1368, everything works and it's the way I have it setup
> right now.

Try 1380 for a bit.

> What am I missing here?
> Why won't Google sites load via my WG VPN when the MTU is set to 1388?
> 
> If it helps, I host the WG server on Google's cloud platform and was
> informed that GCP has an MTU of 1460 bytes.

Are you setting the same (lower of the two maximums) MTU on both ends of the
wireguard tunnel? (You should)

-- 
With respect,
Roman
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
