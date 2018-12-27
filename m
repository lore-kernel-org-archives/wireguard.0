Return-Path: <SRS0=sk/S=PE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C461CC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Dec 2018 19:07:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57103214C6
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Dec 2018 19:07:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="TPHft8Oh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="N1q/F0q7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57103214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2921d15e;
	Thu, 27 Dec 2018 19:05:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65407e65
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Dec 2018 19:05:25 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89915eb2
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Dec 2018 19:05:17 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B5B3722085;
 Thu, 27 Dec 2018 14:06:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 27 Dec 2018 14:06:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=G
 PMPFDkc4chD7iW83QvCeWXvFtq7MBAkYMYOquEHArY=; b=TPHft8OhyFVSkvGgf
 R+sPSOrfwMxVS1AS2Dl7GDnr1FyNeF8onKdhaK5qRXSsdwsBxoQU1sVhC8DzlzdM
 FihKv31bx9THT/IXpLt5zpNnQ7z/KaiaPXhlz16wTxQAFFAD8i89zZWxi5LR+TSw
 D9my93jKrNrHurQebq2jyrqEbljdxofLk/dW4zOIL1AOPJtjRDcAOmj6qrEtOi+3
 37HTm+V3k4mNk6NnQ0TLvkQmFkA/zqZMDN3aukja+EjaOFFtnB8PvkQ7gHPKQl8L
 PG8LD1zsopI4bVwHBnWMtfkBOABEWLH4U/gpC904cWIVh3Ko8AYbZCENQXVhScNF
 bTenw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=GPMPFDkc4chD7iW83QvCeWXvFtq7MBAkYMYOquEHA
 rY=; b=N1q/F0q7bq+MbgbN8HTsi2bPkbSNxd7UWCFP04nzrM2nrTLPcNoCAm2X3
 mTm7ZuI7LiRSMDAlPEWdSheBMK5+JN4sYoGF+tWwsDtHCHv/dcitI/0HbmYNoEyp
 ZwUC2/ZevfZI9no5GOC9YkrFefs1B50dOJf640uAPx6w/5Fgpc/ejnNqOv6LRLkY
 h7hG3p8cvl7jYd2lROsrxj1Dq9zTFTOzCpOvzH0KsXlq5WeE1ZY9eed+++aTDJVK
 YhQubh7c0HfeKWrjmO5L5glUWNMgENYRiclhftNHvYDWoNsk771PI3kLFV+9Wf27
 icWDiZwSxDPbJyN8wf7cKEIBm16eg==
X-ME-Sender: <xms:ziIlXCz6bV4e0tTdDvsCJj-QUY3AOGkIGXolnh4UTYkKiHptgA5IdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrtdefgdeitdculddtuddrgedtkedrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtje
 ertddtfeejnecuhfhrohhmpefurghmuhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhes
 shhhohhllhgrnhgurdhorhhgqeenucfkphepleelrdduleekrdduleelrddugeegnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgnecu
 vehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ziIlXJCC4BXcBDv3KuGqsfUHrXUUyd3cGbnVzrGdlBrVJ4wpJtjSyw>
 <xmx:ziIlXNrh2c6iySHHZIQgLByUmqkP8BxHkpCG9TmC3JjsC6dQafcXRg>
 <xmx:ziIlXHRWAg-rPL9Hzf_3dnThaA9kQdWs1cfp97wqKg_CgG6pwICGhQ>
 <xmx:zyIlXEnlLWvMQB2I75Me_JG960TWh7zIhwWAsx3yWdsIYoYI_Ndk5g>
Received: from [192.168.17.162] (unknown [99.198.199.144])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4EEFB10087;
 Thu, 27 Dec 2018 14:06:54 -0500 (EST)
Subject: Re: wg-quick: Separate files for interface and peer definitions?
To: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>,
 wireguard@lists.zx2c4.com
References: <5c712311-26d6-f2e2-d941-aec6881b67e9@bartschnet.de>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <fbeed46d-2011-68a5-a932-8a9348a4d9ca@sholland.org>
Date: Thu, 27 Dec 2018 13:06:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <5c712311-26d6-f2e2-d941-aec6881b67e9@bartschnet.de>
Content-Language: en-US
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

On 12/27/18 10:19, Rene 'Renne' Bartsch, B.Sc. Informatics wrote:
> we want to distribute the same file with peer definitions to all Wireguard 
> peers.
> 
> Is there any way in wg-quick to use one configuration file for the interface 
> definition and another file for the definition of peers?

In a way, yes. You can call `wg addconf` from a wg-quick PostUp hook to include
another configuration file containing only peers. However, the recommended way
of doing this if you are using a configuration management system
(puppet/ansible/salt/etc.) is to use a template that will concatenate the
interface configuration and peer definitions into one file.

Note that WireGuard will ignore a peer whose public key matches the interface's
private key. So you can distribute a single list of peers everywhere. Only the
[Interface] section needs to be customized per machine.

Hope that helps,
Samuel
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
