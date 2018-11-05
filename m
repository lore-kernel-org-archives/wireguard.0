Return-Path: <SRS0=DDek=NQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2F7C0044C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Nov 2018 23:49:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA32A20827
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Nov 2018 23:49:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fastmail.fm header.i=@fastmail.fm header.b="ue19sITY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EtWeOH6k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA32A20827
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fastmail.fm
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c0cca69;
	Mon, 5 Nov 2018 23:45:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b58e7c0
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 23:45:12 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23ed1640
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 23:45:12 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5146C22952;
 Mon,  5 Nov 2018 18:49:28 -0500 (EST)
Received: from web3 ([10.202.2.213])
 by compute7.internal (MEProxy); Mon, 05 Nov 2018 18:49:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
 message-id:from:to:mime-version:content-transfer-encoding
 :content-type:subject:date:in-reply-to:references; s=fm1; bh=F2Y
 IuKuvW9iGgBIVuP2ftT395oC/E9bdLSMCdMA9nDw=; b=ue19sITYzKSel1JFhtH
 kb2qejeY324+0SwYeVEsXbSNUFqMWGJH66ZkKZXVasQbDQM0OUgEPmNXRhfok1sU
 7s/vS/aDoeiwHKFBkVWNAPaKH3s2iIYKyrFNhPvABY5EXdiNZHfvJoFyY3T9fy8k
 cUDgZdDOZ7wfEXhdt30Rdy2CS3WNY/4vwvTAbL2o7qnKYF/g4C0NasE/G8VZbfI2
 XrXcMLqaZGcbANMffiUT/jnLQVBOyfPTqwuAdqhZ2tNp6lZhsTn9ujg6+GRgiDeV
 S00qOvnG6po6JJaSE/rIHAAohwZHkywdKyAh7I1+2RSh4flNLsfttmg5TEgtm+6s
 l2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=F2YIuKuvW9iGgBIVuP2ftT395oC/E9bdLSMCdMA9n
 Dw=; b=EtWeOH6kX55+v+TZNUvO1t8Y9SYHJdx3pt3uM/8cEpAj13CBUVrzyRGV8
 mF3g+3BHRzXUfMwFTssIrQob9lCl52VJ4XeNMWWIPxs6wEhnr7JQqiilFTAwPHSb
 YWgr7T1h5JiPnA3jZB73daBOz8WG4OPkFSU/5/ptivXEmy/B6rKLL2mbu/I0bggl
 OVmuWY4ZG7StBpLtALJLTs8d0+XnL5eq+2hLxGzJGsZROTuSYoVbMnTmNbfldoRl
 8xDAXSjb+bOUF6xihc/yiB82y3j4p+JG8NpWJZXgocwSkp2DK3zS2y9WkLNEeZae
 Z0n2KE+RNfF0M5NTAcJ95dJMboa6w==
X-ME-Sender: <xms:CNfgW_b8wFOiZ8qCy2GQPv7XKoEPaiOIwDT9-CPVS9ixB1qqT5psxg>
X-ME-Proxy: <xmx:CNfgW9bcyvCd0R_bGFQbSuvxZOyEZ_NoGuLo863D3iWHQbesr0w3xA>
 <xmx:CNfgWyWU6hnG5OXank8FR5dx0m3pG1tJjlcp3Gw2AKk46YQsewZgvA>
 <xmx:CNfgW3jP3FuBf0LQ8t-ZgVWuV2onud79P0dj-TKQUI7mqPqA6Oappw>
 <xmx:CNfgW4URom-s2ZtItNIS8B_loAIfcq0kKRUHTcQEtws-MGzglZ7bvg>
 <xmx:CNfgW2Om73ta9PT4iOtAaZ0ZEcGXXccgmaJgl5TZynOlFUxv6RvH8w>
 <xmx:CNfgW377i5vTR-5G2-vMUZSChIJgCp5GFJ5zjSNZXPG5IzZDsaN9Yg>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id D917A9E540; Mon,  5 Nov 2018 18:49:27 -0500 (EST)
Message-Id: <1541461767.984337.1566772032.45EC8BF7@webmail.messagingengine.com>
From: nnet <nnet@fastmail.fm>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface - ajax-d469da0c
Subject: Re: WireGuard for iOS - TestFlight
Date: Mon, 05 Nov 2018 15:49:27 -0800
In-Reply-To: <CAHmME9p5bjmP8qSapvf1vmiMAk3BAkONjwXev3O_QtGYM=k3QQ@mail.gmail.com>
References: <CAHmME9p5bjmP8qSapvf1vmiMAk3BAkONjwXev3O_QtGYM=k3QQ@mail.gmail.com>
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

Hi,

Thank you for an iOS client!

On switching WiFi <-> LTE ( Google Fi / T-Mobile / 464XLAT) I get:

WireGuardNetworkExtension ... - Failed to send handshake initiation write udp4 ... : sento: network is unreachable

Switching the tunnel off/on Active results in a tunnel over the new network.

Do you expect there to be any issue here 464XLAT? Do you have the same issue witching WiFi <-> LTE?

Thanks!

On Mon, Nov 5, 2018, at 1:27 PM, Jason A. Donenfeld wrote:
> Hey folks,
> 
> For the last few weeks, Roopesh and I have been hard at work on the
> WireGuard for iOS app. Today we're happy to share a
> likely-buggy-and-broken TestFlight that you can run on your phone:
> <https://testflight.apple.com/join/63I19SDT>. As usual, use at your
> own risk, especially since it's alpha quality.
> 
> Please let us know about any bugs as you find them -- you can send
> them to me or to team@wireguard.com. Our current TODO list lives here
> [1], linked via the main project TODO list [2], and if you're an iOS
> person and want to contribute code, we'd be happy to have you on
> board.
> 
> The app costs $3.99 and requires an email address to sign up; we
> manage all your tunnels for you in the cloud. JUST KIDDING! Like the
> rest of WireGuard, the iOS app is free and open source [3]. I make
> this rather tasteless joke, because of the rather surprising
> quantities of people encouraging me to do the iOS stuff as proprietary
> paid software, because "apple users will pay" or because "open source
> is cool, but iphone folks don't care about it so you can get away with
> charging" or because "none of the other vpn players are doing open
> source mobile implementations" or even because "apple is more likely
> to accept paid software into its app store" and so on and so forth.
> But, as usual, I much prefer for this to be a community project than a
> closed one, and so like everything else, it's FLOSS.
> 
> Enjoy! And do let us know about the bugs as you run into them. I'm
> sure there are plenty.
> 
> Regards,
> Jason
> 
> [1] 
> https://docs.google.com/document/d/1BnzImOF8CkungFnuRlWhnEpY2OmEHSckat62aZ6LYGY
> [2] https://www.wireguard.com/todo/
> [3] https://git.zx2c4.com/wireguard-ios/
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
