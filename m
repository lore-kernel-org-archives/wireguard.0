Return-Path: <SRS0=mzR4=ED=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623BAC55178
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Oct 2020 03:23:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 467E32242B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Oct 2020 03:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 467E32242B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef6708d8;
	Wed, 28 Oct 2020 03:21:09 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7db4b6e9
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Oct 2020 03:21:07 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C8F30128D;
 Tue, 27 Oct 2020 23:22:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 27 Oct 2020 23:22:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=L
 Te3SpZjQ+Tgp/IVj1s+mlAEg33ibkgqGH9/7pdf2N4=; b=EJKZmNdRtQ5PYWS86
 BIoL3tKNCEd/6Uz+MVd5QuwMFsw+oN7gBfqVUJlmfzGq2+myQB4JvewL9FXzEjag
 N3fTkbEIzS2ZVVPLq7kDza99a0ERQAFrQ9Z/zlj1COxjKWwC9vq4OlhE4ju68B5a
 liQVKoZU2ZHeaOY/0wYbBXOmdnVW6e6UYIvAMKmCLfrjwQqOYYcCI1fne8mopFPE
 ZLkac6fcEPFWNBrx1/BdxwqqNEeqstWV3vx+QWmkdi7ztMsBAWl0lWlsd6Hyjzpr
 Vyrbp8cUQv79Ns/ARSyJl5CGTN6SjtuNEucF+G2IEn1IqOQSrsPRQRi7rROeTOy5
 a/fcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=LTe3SpZjQ+Tgp/IVj1s+mlAEg33ibkgqGH9/7pdf2
 N4=; b=YSn+qZwyE0fyBPAwikFkJEVm3hUzVMU1j1XpUxuLD9Jya+zSP3W57G9il
 1pqwRMAyNgXBNanzCYLjUI/h3XWxdHozbs2Hq1/X18vTxP6XySCHZvzBnxQyePtv
 l/9Yac63NOyMuksttzPqRIDT6GY+cvSkFRiaiuOQJdxY/0eLUW+TVMTfSPqF6UHV
 TMvs+9IJpBb06pAWBUX3GRXUEeMNTjBfJZUWK1YOwWFGkW+77JRpQEiiLbn0/mE2
 S3RhwckphbCNq297C/3vfArcrcKBjEUVMAqXiaiOno/AjVCCU24Etq4tg4E04DCw
 JFHcZ0KHwnAIdiOJW7ZmGOdcVU6dA==
X-ME-Sender: <xms:B-SYXxeY1uEuuIuMb_FsCDgh5-QZByZugPORVdM0Zy2SN4W5OHl4nQ>
 <xme:B-SYX_OHLWRgpI_nOQNtCK-NlDRh0rNF90YF-vlFu5FFYdkTTgTxn0x8k2KcWupc8
 Wt8E9mDsK45efuIKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrledtgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpeekvdehueeiuedvteejfeeviefgieekuefgfeeigfdutefgudejfedu
 jefhkeekffenucffohhmrghinhepfhhlohhsshhkrdhorhhgnecukfhppeejtddrudefhe
 drudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:B-SYX6iM65Qg6PH7YolW7JgZiAIsPPRVQwlLVYbdpaa6pRs9XgFM1Q>
 <xmx:B-SYX68_bagewkvzJZyqck_Um-eAyGlpiUXRh9hLkqgvPZRlUAdAJg>
 <xmx:B-SYX9sbU5G2R0k5pLAd4X2Mp49KwLW0ooGrlh4lBRF_4VdwalKhkA>
 <xmx:B-SYXy6mMTTNm0Yj8TZEoGTbNSJOwwlVwQQRqsGXtP6GQccLagBp2w>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id EE60C3280060;
 Tue, 27 Oct 2020 23:22:46 -0400 (EDT)
Subject: Re: Using WG to route between two LANs
To: Dashamir Hoxha <dashohoxha@gmail.com>, wireguard@lists.zx2c4.com
References: <CAMucfLzDBf_AEqDrNsQXCN1gb0C-39c-HnJGBuKJktxYZa2KQg@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <10a379b2-fa4a-a178-7f5f-43e5b111be6e@sholland.org>
Date: Tue, 27 Oct 2020 22:22:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAMucfLzDBf_AEqDrNsQXCN1gb0C-39c-HnJGBuKJktxYZa2KQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hello,

On 10/22/20 10:43 AM, Dashamir Hoxha wrote:
> I have created a network as shown in this diagram:
> https://cloud.flossk.org/s/ZsLtNLsxmo8rxPD
> 
> The red arrows show the WG connections. Only the server has a public IP.
> From client1 I can ping to the internet and also to client4: `ping 192.168.0.3`
> However I cannot ping to the LAN IP of client4: `ping 172.26.0.2`
> 
> My ultimate goal is to be able to ping from client2 on LAN1 to client5 on LAN2
> (both of which have no WG configuration and interface), routing through
> the WG network (client1 --> server <-- client4).
> 
> Is this possible? I think that it should work, with proper routing,
> but I am not able
> to figure out the proper configurations. Has anybody tried something like this?
> Do you have any suggestions or advice?

Yes, this is possible. You need:
 - LAN1 needs to be in the AllowedIPs for client1 on the server
 - LAN2 needs to be in the AllowedIPs for client4 on the server
 - A route on client1 to LAN2: ip route add 172.26.0.0/16 dev wg0
 - A route on client4 to LAN1: ip route add 172.25.0.0/16 dev wg0
 - Routes on the server to both LANS (same as above)

A gateway for the routes is not needed. Once Linux passes the packet to the
WireGuard interface, cryptokey routing (AllowedIPs) is used.

You do not need any NAT.

Cheers,
Samuel
