Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEDEC28CBC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 22:25:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 075BA20753
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 22:25:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=althea.net header.i=@althea.net header.b="ViKHO+D8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IkClkNnB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 075BA20753
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=althea.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55a60c50;
	Wed, 6 May 2020 22:11:47 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ffe7aad0
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 22:11:44 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id C686B568
 for <wireguard@lists.zx2c4.com>; Wed,  6 May 2020 18:24:26 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute7.internal (MEProxy); Wed, 06 May 2020 18:24:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=althea.net; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=27dEIIe43TgCUOYKYoZIYzBdAXJOrZG
 VRt3EIsT8mkE=; b=ViKHO+D8c+OZbHuM9VOis6oIrco7jOaR0NTqn39dr/LSZeF
 sOF0TFdSXSxZPDAi8jwHx5dCUYySA01RtLjB4uLFETqBuNSoOEtmOWKgNRc2LvUh
 vtTyaUsqAmscOB13FoVq0p4wHczs7L8fKJ1pSi43UPVK6YZK9J8GEEBws3yM/BTP
 NfrB2hJQAYZjjsryMSRHu78B4Pyp+m+SwdWYnU2bLEQrGPEz2OYTUwAe6Qh8usCC
 wEy09BtsS3r/q1OBKph4siBx+5R0wBWGh3cGaEqcpbnpu5R8BZjfLvilsz+1sCf0
 zyPWKZTi6u3P2WqQnfT1QGwYFEBcDyG+3/ydbMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=27dEII
 e43TgCUOYKYoZIYzBdAXJOrZGVRt3EIsT8mkE=; b=IkClkNnBU6gbQ7HjDJzWi7
 O23vZ+RaCEGxVP4YdZ15aSXke3EywQ+m/Pv06TiB6pMkguWBaiG1zqmADCMn7mJ9
 4ndnZ48mps2ubPXUiUM9ORbjeo/a13sEYhVrpEeuewraiabbBatZEoD09ReYWP11
 4+XT6M1dRfUPmevjCK0bQ9Ta9DZY7/DknQ7SugLSEaWrJnLCaYySmexIt4GGAXy8
 AAvDrv48T+3XVLySll1jDy08p70qxxrPO8AUIho9vVy2YPCTpq/Aro6ho3Wptu+u
 q4Y8FY7YSgLCVJrqH9kIcimr5WfYZbWPbiSsJlRaZ/nbPHsfX4cKx8RzWQzoxXZw
 ==
X-ME-Sender: <xms:GjmzXt4TBUR7OFZL90Wm-7F628RLIkBz4ASmPS_a5DtNQhCiMoDoew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeelgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreertdenucfhrhhomhepfdfluhhsthhinhcumfhilhhprghtrhhitghkfdcuoehjuhhs
 thhinhesrghlthhhvggrrdhnvghtqeenucggtffrrghtthgvrhhnpeehgfekkefgieegtd
 dvleetjeethffhgfffveevffekkeeutdfhveegjeelgfejieenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjuhhsthhinhesrghlthhhvggrrd
 hnvght
X-ME-Proxy: <xmx:GjmzXlT-3-HGdrf-sSUen_d__IE91pb1UsBRY0uPASsUe70fZe4RIQ>
 <xmx:GjmzXqlhFWWn413YDHKmqb7JWNu6rrVBQ1F0i1frTbQ2hdIX8FFMOQ>
 <xmx:GjmzXhSPC_HWv1R9saoKkHsRDWcp7sD5uww3_KCZWNC_zEGYCGhORw>
 <xmx:GjmzXsm22d7iWM6GslTzzWawx6FFhqMX0fi6CmA2DJbIkHrvnPob2A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2AACCE011C; Wed,  6 May 2020 18:24:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <9c64d009-4c24-425f-9126-ba93279c208e@www.fastmail.com>
In-Reply-To: <CAHmME9qv2R1CBFAQ1xqM3eOtegLaZi=f7cfA26JS=8bGTLpPFg@mail.gmail.com>
References: <CAKmhVkoE_fL59VJqqXoGHX_S3E9+h=KwyNchWSBrEfPHrpNyoQ@mail.gmail.com>
 <71c12e22-c7b6-9753-cc44-aac0f51592ff@pallas.us>
 <CAKmhVkrRbb_KncDjhM6gMcJRpCrK6WcB1Ed=WfVhScDHw96Gjw@mail.gmail.com>
 <CAHmME9qv2R1CBFAQ1xqM3eOtegLaZi=f7cfA26JS=8bGTLpPFg@mail.gmail.com>
Date: Wed, 06 May 2020 18:24:03 -0400
From: "Justin Kilpatrick" <justin@althea.net>
To: wireguard@lists.zx2c4.com
Subject: Re: WireGuard over WireGuard
Content-Type: text/plain
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

> 1340 or 1360

Why two options? I've been using 1340 for a long time. 

-- 
  Justin Kilpatrick
  justin@althea.net

On Wed, May 6, 2020, at 6:00 PM, Jason A. Donenfeld wrote:
> On Wed, May 6, 2020 at 3:37 PM Mo Balaa <buddybalaa@gmail.com> wrote:
> >
> > Was hoping setting them both to automatic would just work; but after
> > some fiddling that appears to be the issue.
> >
> > What is the optimal MTU for the inner WireGuard tunnel if the outer
> > one is set 1420?
> 
> 1340 or 1360
>
