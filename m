Return-Path: <SRS0=OFCv=PC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85CF6C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 18:40:45 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B58F611C0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Oct 2021 18:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B58F611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorlab.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6b954a4;
	Thu, 14 Oct 2021 18:40:42 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 73fd50f2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Oct 2021 18:40:41 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 44ED732009EF
 for <wireguard@lists.zx2c4.com>; Thu, 14 Oct 2021 14:40:39 -0400 (EDT)
Received: from imap46 ([10.202.2.96])
 by compute3.internal (MEProxy); Thu, 14 Oct 2021 14:40:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorlab.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=8Gc5RVpnx5/6d3JESV3Kx0dCOQM9DFM
 hrS+HJRaeHRY=; b=Bx6ASWifI7xa0rPCAj5e5Z0UbqUDfKjDyeGK8Bxmk4+h8I7
 A3vyJTmEwfwT08K7ZOMpSVuE3Nhj3itnr4tMl7INTxeNNiq4mTjPiF/gLGiCVDJ0
 /Q2RMMskj/8V7P5wV9ZRHt0iDHu5tf0q4S/D3sJBvxcgGQ8evKYJkPPUQSFCMhsL
 hBJu8Wj0bkkzJaWuy9aJW+Ckkq+H7DDe2kTt7fadTQPnz33tQnJYIkjrir8PfCiZ
 rtYvOgUS59MLUViMXghFCk0m/vsMiwE6iT1WOzurKuT6FutMufnPX2jhRLBKlYvr
 IPKv46GMgYJPW9SPriFcHTAUaEscm1YlVu3dJvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=8Gc5RV
 pnx5/6d3JESV3Kx0dCOQM9DFMhrS+HJRaeHRY=; b=SOv7ucTWJbp5y0X45jQM/P
 g3OlXC6OmfYI8FyPlf3hGNbZtA+R9zKkrOLS/WdzYezQAoXy3pCHT3PdfMWEjbT2
 b6XRSRzGBaYJB8mykFjPAnx30BQPL4NBcoOm+ZMzKkgngTituihFwngWE69+X+gq
 xwxoFFaMGVpnvG7vHDkhgcpJpF+RhgDSImBv6Hr+M2sw4DEGBus2c+G9fKnGUMv9
 +p2ztPmn1t+81SQkXQmb19BFDb1g1t2hRfa0D20xISR0/tJ6B9j4Uuq4ly6zmMK6
 RIHYY2G4prsd1M0p+VIBboJYgIZCuL6V07barr0NPjNLHM9E5qTzlH0cSHN3YZkg
 ==
X-ME-Sender: <xms:pnloYdDIiIjuFgyMc-1US4p2FCe1Y9U6WmyXrlfFzKlcySwEQ70zwQ>
 <xme:pnloYbh8Xs6fSB8lvkSEzAx355ijgQsA35HjcVYgtVyEQgOBB0s7XIurMpF3VjKXu
 rgTvYwpaGgIsPwvipg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdduvddguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
 dtredtreertdenucfhrhhomhepufhtrghruehrihhllhhirghnthcuoegtohguvghrsehp
 ohhorhhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefftdfhudekgfefffeufeeile
 ejhfejhfeliedtudeuteeigfetteegheduieduudenucffohhmrghinhepmhhitghrohhs
 ohhfthdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpegtohguvghrsehpohhorhhlrggsrdgtohhm
X-ME-Proxy: <xmx:pnloYYnCSEO7Fxy3DJOgXQv00RTf4hR_kPEAxFv2IuL3vgrhCNuONA>
 <xmx:pnloYXxW8W14QVYg4Z7fJtaSwi-Nk-NYe4VD2zlL5Sh8C7uTRS5qGQ>
 <xmx:pnloYST_CCJG2OVjtHmIgi_LKqQLkVLswuA26-Jicd7XtzJSg-UYQA>
 <xmx:pnloYZd9u1AQyKsiJZMZTO_RHvW9FJOkUOWkZX_TWvaUI2qnCYxbrw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9C1FA1EE0078; Thu, 14 Oct 2021 14:40:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1345-g8441cd7852-fm-20211006.001-g8441cd78
Mime-Version: 1.0
Message-Id: <b1b2fc28-fee0-4801-ac42-fcd8d985e837@www.fastmail.com>
In-Reply-To: <PH0PR05MB79629688EB84BF07A2AEF54F99B89@PH0PR05MB7962.namprd05.prod.outlook.com>
References: <SA1PR05MB79668D58D886BB8D36F558FE99B29@SA1PR05MB7966.namprd05.prod.outlook.com>
 <CAHmME9pu=syh5zkig=e1KFQKMvCYfu6e+BhKENdwZARCrpss7Q@mail.gmail.com>
 <PH0PR05MB7962AD22BE333E844C0A79B799B69@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9pgbxyAxgBAfgLMVquzmPC9fiBzjWhQ5zJV+3bR2aR9dQ@mail.gmail.com>
 <PH0PR05MB79623EC9C12B4AE732B04E9299B79@PH0PR05MB7962.namprd05.prod.outlook.com>
 <CAHmME9q3j=2HG-4v5tpHRM9DCKpw+5iSMyzu30jAUHS1r=eDHw@mail.gmail.com>
 <PH0PR05MB79629688EB84BF07A2AEF54F99B89@PH0PR05MB7962.namprd05.prod.outlook.com>
Date: Thu, 14 Oct 2021 18:40:02 +0000
From: StarBrilliant <coder@poorlab.com>
To: wireguard@lists.zx2c4.com
Subject: Re: Windows Log Output to Event Viewer or Text File
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

On Thu, Oct 14, 2021, at 17:41, Frank Wayne wrote:
> On Wed, Oct 13, 2021, at 18:16, Jason A. Donenfeld wrote:
> > Event Logging appears to be rather slow and clunky [...]

In fact, Windows Event Logging has two APIs: ETW and WPP.
The ETW API is, indeed, slow and clunky.
However, the WPP API is very high-performance. The trace function in Windows native TCP stack is implemented with WPP. 

If someone like Frank has the time and ability, they could check this MSDN documentation and try to implement it:
https://docs.microsoft.com/en-us/windows-hardware/drivers/devtest/wpp-software-tracing
However, I also think this feature is *not* a prioritized task, at least for average users.

I am not sure if I get Jason's idea: Is current Wireguard driver using a ring buffer of 2,048 messages for logging?
I am not sure if it has a notify mechanism: Otherwise, the userspace collector will have to poll the logs. Polling too fast consumes power, polling too slow may skip messages.


Best wishes,
StarBrilliant
