Return-Path: <SRS0=mwgs=BA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3235C433E3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 14:01:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B8B02064B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 14:01:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cagir.me header.i=@cagir.me header.b="iKjzlYhq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B8B02064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cagir.me
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efee9257;
	Tue, 21 Jul 2020 13:36:53 +0000 (UTC)
Received: from dal3relay242.mxroute.com (dal3relay242.mxroute.com
 [64.40.27.242])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 998ae896
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jul 2020 12:50:21 +0000 (UTC)
Received: from filter003.mxroute.com ([168.235.111.26]
 168-235-111-26.cloud.ramnode.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by dal3relay242.mxroute.com (ZoneMTA) with ESMTPSA id 17371815b6d00055e6.002
 for <wireguard@lists.zx2c4.com>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Tue, 21 Jul 2020 13:12:49 +0000
X-Zone-Loop: 324fe9c8f3b55f53691a107c64afa3b8eaefaf935f35
X-Originating-IP: [168.235.111.26]
Received: from echo.mxrouting.net (echo.mxrouting.net [116.202.222.109])
 by filter003.mxroute.com (Postfix) with ESMTPS id E275060010;
 Tue, 21 Jul 2020 13:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cagir.me;
 s=x; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
 In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gDS8atxRiKNknWpO7zn3pPsMrrOQT1rYg2ugCPfO3cI=; b=iKjzlYhqXonZhI+uXvPUNhHc6G
 oWZz27oAY7TbrOPX7tmc6a3EQ4j6DejasehagMaqJiLpm44vi30f8mcaqimLvGqlmNreyC/xTzaHx
 pSdENZr4cHxCPKYT1Z/TeIiyhCkxiYRgCm/EaauthHcBvvGOBjn4PYnrM2EwjSCBdWfxjK27nRPMM
 72hAGp4TSEuTFGKX1VuRFYNmAl8sPmkQ4U2djY8lBdqcwv7ZGgJxwXM0VfHHAtfWHucA6a3Kujjt0
 0N6ekzarkxicwAQbb0Kb/jIoAvOGjYwpQpR4ga/XN3Q5yvjDOc9/3D68BjwKcdpbnBs+SUd/490jy
 /KgvZmow==;
MIME-Version: 1.0
Date: Tue, 21 Jul 2020 15:12:48 +0200
From: =?UTF-8?Q?Hasan_Berkay_=C3=87a=C4=9F=C4=B1r?= <berkay@cagir.me>
To: Adam Cooper <adam@acpr.dev>
Cc: wireguard@lists.zx2c4.com
Subject: Re: MacOS IPv6 not functioning without custom static route
In-Reply-To: <CAN00TTomuZoagZF2McBkDW1ZimSouN-jnDLm+Hq7OKeH-sF9zg@mail.gmail.com>
References: <CAN00TTomuZoagZF2McBkDW1ZimSouN-jnDLm+Hq7OKeH-sF9zg@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.7
Message-ID: <165a92238115e99b03740768d843a20f@cagir.me>
X-Sender: berkay@cagir.me
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-AuthUser: berkay@cagir.me
X-Mailman-Approved-At: Tue, 21 Jul 2020 15:36:50 +0200
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

On 15/07/2020 14:14, Adam Cooper wrote:
> ...
> Probably worth mentioning that I tried to replace ::/0 with ::/1,
> 8000::/1 but that just results in completely broken connectivity in
> IPv6 and IPv4 - which may be another issue in and of itself.

Did you try only having "::/1, 8000::/1" in the AllowedIPs option? I had 
a default route creation issue myself where I'm only trying to tunnel 
IPv6 through; and having this actually solved it.

$ netstat -nr
Routing tables
Internet:
...
Internet6:
Destination                             Gateway                         
Flags         Netif Expire
::/1                                    link#14                         
UCS           utun2
default                                 fe80::%utun0                    
UGcI          utun0
default                                 fe80::%utun1                    
UGcI          utun1
default                                 fe80::%utun3                    
UGcI          utun3
default                                 [ public IPv6 ]                 
UGcI          utun2

If just "::/1, 8000::/1" solves the IPv6 issue, I guess you can give it 
a try with "0.0.0.0/0, ::/1, 8000::/1" to see if both routes are created 
properly?

Best,
Berkay
