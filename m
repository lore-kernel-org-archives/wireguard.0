Return-Path: <SRS0=05Nk=RM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB83C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  9 Mar 2019 00:16:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3A12206DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  9 Mar 2019 00:16:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="a5jgQnI1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m44Z7MUv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3A12206DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c82e1065;
	Sat, 9 Mar 2019 00:05:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b62cdc16
 for <wireguard@lists.zx2c4.com>; Sat, 9 Mar 2019 00:05:49 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dacbcf3e
 for <wireguard@lists.zx2c4.com>; Sat, 9 Mar 2019 00:05:49 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id AB07E22038;
 Fri,  8 Mar 2019 19:16:35 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 08 Mar 2019 19:16:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=t
 lPmR1gFhj20oI/i1jU55SVobjkgMgZLtfmXB5eoueI=; b=a5jgQnI1QUpd08Dz6
 zNbqSODe4Sa1rLGKJ3YGN7H6GRT9RZBg/g0cIDswf/qXXh+AIeq3xjmJgbOS7PWA
 k+x1+IafZgj8wEXhcw/FJONGmeC1pUF3+knT5oEifEgoRKhonCfBbtM5zPsvrMOZ
 ISBxDIeN86+qVR4S52OJnUko3iTUsky4uzkQf5YGdu/MbGtioenKJTfHZfB8O6R4
 3PtCGgbllFfstSBTd443IYU24zsquAueCtSFwSzijOSKAe6J7z6uMp8gedzCPbXN
 +gFYd1tH5B1cS3INm2WxLV7x2AG7aXmfpzZtG/01vfgRHzZ+dDKgjIlXhSRGlKy+
 Swj7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=tlPmR1gFhj20oI/i1jU55SVobjkgMgZLtfmXB5eou
 eI=; b=m44Z7MUvBzGNauPKqhkmTZgxS7qYsRBYeT9ipiJ9m51D1ogLiq2s5ng5a
 sq42Woq9cxcfFicQQFlCatgTPKxgJz8A/GpI/PykjlCTMcB55+sl/RIRv00ih07O
 3DhzYfVhrKha6VBHY/9+D8G4Rc9dt/XhZVeFp+z4sKVua7t7RzLXsFXh/u+jCnKc
 jQ0sd7/5JhlD3ztC61KA536o5iOcSyb1ODXwxybhCF6oLW2j2LqFlOlVjl2HRDXP
 Vnf7ZLDbHTef41yQ3rBV2MRugza8LXFjqNlrJwoyFDthYNe2jKkG6aJ2dmkvkhfR
 9V56ZcdEZcz4umqnZqBzj4odnOSTA==
X-ME-Sender: <xms:4gWDXI4t1H0paoNTcnVljfKEX4yr_9OVshA1GPlsiVScaB_BbZ-SuQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrgedugddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucffoh
 hmrghinhepnhhfthgrsghlvghsrdhorhhgnecukfhppeejtddrudefhedrudegkedrudeh
 udenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdroh
 hrghenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:4gWDXLSQR7m-61fXYU6koHxrbzwtf7cTUOXFI4rDewLIdggtlKV_1w>
 <xmx:4gWDXAsUIUnXFHoDl7YvQTvcJU270uLwsLxxTgHxftN8Pf7bMkkaRQ>
 <xmx:4gWDXFYhMuPHvIiWd3lhb7sCyAVcJbcPhaYi5NYARGivTwxA35BdOw>
 <xmx:4wWDXDiv770uT3ADFjQU9Au5alhN_6mGVer7jWI3GtCYq1q0pvLTMw>
Received: from [192.168.50.162]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 74DBA10310;
 Fri,  8 Mar 2019 19:16:34 -0500 (EST)
Subject: Re: Single CPU core bottleneck caused by high site-to-site traffic
To: Xiaozhou Liu <liuxiaozhou@bytedance.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20190228190512.6209-1-kallisti5@unixzen.com>
 <CAHmME9rQ-cKSV8o-sg3fJU4Uu6r5daC=Hx4mC-4OKGA8Z8hg7w@mail.gmail.com>
 <20190302042419.gv3ldcooxzbf4veq@bytedancedeMacBook-Air.local>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <d1e49305-3748-9f8f-737d-1a4eeb495b5a@sholland.org>
Date: Fri, 8 Mar 2019 18:16:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190302042419.gv3ldcooxzbf4veq@bytedancedeMacBook-Air.local>
Content-Language: en-US
Cc: zhangyongsu@bytedance.com, wangdongdong.6@bytedance.com,
 duanxiongchun@bytedance.com, wireguard@lists.zx2c4.com, wangjian@bytedance.com
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

On 03/01/19 22:24, Xiaozhou Liu wrote:
> Hi Jason and the list,
> 
> Here at our corporate network we run some inner site-to-site VPNs using
> WireGuard. Thanks for giving out such a beautiful software to the world.
> 
> Recently we encountered some noticeable network latency during peak traffic
> time. Although the traffic is pretty huge, the WireGuard box is far from
> running out of any of its resources: CPU, memory, network bandwidth, etc.
> 
> It turns out that the bottleneck is caused by the single UDP connection
> between the sites, which cannot be routed to different CPU cores by RSS
> on receiving. The total CPU usage is not high, but one of the cores can
> reach 100%.
> 
> Maybe we can improve this by:
> 
>   embedding more endpoints in one peer so that the VPN tunnel can run
>   multiple UDP flows instead of one. Hence, the single huge UDP flow is
>   effectively broken down to some smaller ones which can be received by
>   multiple queues of the NIC and then later processed by more CPU cores.
>   It will not break current users because the single UDP connection is
>   still provided as the default configuration.

While a native solution would be nice, you should be able to do this today with
nftables. Dynamically rewrite the port number on a portion of the outgoing
packets, and redirect that additional port to the main port on the receive side.
This (untested) is based on the examples in the nftables wiki[1]:

$ nft add rule nat output ip daddr $OTHER_PEER udp dport $MAIN_PORT \
	dnat to $PEER : numgen inc mod 2 map { \
               0 : $MAIN_PORT ,\
               1 : $ALT_PORT \
	}
$ nft add rule nat prerouting ip daddr $MY_IP udp dport $ALT_PORT \
	redirect to $MAIN_PORT

[1]: https://wiki.nftables.org/wiki-nftables/index.php/Load_balancing

> It is also possible to set up multiple wg interfaces and more connections
> explicitly. But it would make the network administration much more complex.
> 
> We are planning to make a working demo of this idea but we would like to
> hear from you first.
> 
> Any idea or comment is appreciated.
> 
> 
> Thanks,
> Xiaozhou

Regards,
Samuel

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
