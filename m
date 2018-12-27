Return-Path: <SRS0=sk/S=PE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFCCC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Dec 2018 19:23:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA5B1208E4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Dec 2018 19:23:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="Y0YsBNlR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gXfRE0o5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA5B1208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a72c8b53;
	Thu, 27 Dec 2018 19:21:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id edae9b61
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Dec 2018 19:21:45 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a449a313
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Dec 2018 19:21:45 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 04A142207F;
 Thu, 27 Dec 2018 14:23:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 27 Dec 2018 14:23:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=H
 x9E+Ac4Z7IZRxBVja37KrYC+fKNxjjTf5HsIeyXedQ=; b=Y0YsBNlRUBB+Y37OG
 VGPxuPMBELMHwnDQyY6ChqqZj8PsFDvzTzapxY40OzLxVGZWWQsQC7whVFz3jKmV
 zy1Hqmb1Rfmui/eAlrB+VGv5S3m+gstJFIwR5aXnJz8oG/SknKFDgdKitpa/O95z
 1gFxqOfCAZH1iJ5ntV5XxNf4I8G9YQbjsNSgwjelsUxtXUlKXpkcX6s1k4xOf8n0
 EgThkWQfVLbn3WzrtbD3nUJelHOK55Bsi2rcvVM6UkkmAMycRFizm+iiaiIAeDb/
 i56Ygp67cSoyTSuLyjZG8LgjUzcDbwbTSU/XwoZ+ll1l5TvLjCaqpSG4E+hwIJ8o
 XFVyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=Hx9E+Ac4Z7IZRxBVja37KrYC+fKNxjjTf5HsIeyXe
 dQ=; b=gXfRE0o5srFTu3qPCm1+d93gFL7N5X9RBMjcs0atG2OGdIejM1b6PU7vW
 rCb7ffDymCoUCfd6xghUazTYrPZLJ1uDrljAUc4GrMEfvS6XutSmEzr+KXmmF7Ur
 7S7iebec4eAOt93yRimaPw3s3UJ97hQntxcJVv2BtYoyYN4c5OVmfGCgET/8VXHS
 /BcyddOBjTCDBkVKomXP3xOrQP/B+kBpop7IAu3hlMZjiUVhabClJtleGoZwdPxO
 8lfORwj9xNm9ANeO13uDPo5Go6Plngap8h1S0q41+KmAu6hCUKbUoyBrFRCoF8GQ
 9NNjMmHy1MT3fVV7GMVJJL7qfghHg==
X-ME-Sender: <xms:qyYlXA4MaBQBsKiQ3xmxhgbEZt2oc9CYPXYJ6iQomVoa5wV0YJ37aQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrtdefgdeifeculddtuddrgedtkedrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtje
 ertddtfeejnecuhfhrohhmpefurghmuhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhes
 shhhohhllhgrnhgurdhorhhgqeenucfkphepleelrdduleekrdduleelrddugeegnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgnecu
 vehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:qyYlXNs9W4D7eeNxb6ksr6GGI2rSXwPGMDoWetL27jmo7vuqY1P0CQ>
 <xmx:qyYlXE9W1m-3iQYOm41cpi2gAAxlgugcMZSkjNwqU_PgM3aDE6S-Ug>
 <xmx:qyYlXHnVnbh2qVc3vw5GpgARCrFDyXLJYcL69A4fHzRjXDKV1ozxgA>
 <xmx:qyYlXJ1Q_RZ7kG-UBHThvwmhNsucn_wfhyVduvrRc1ENkfuKSKegjQ>
Received: from [192.168.17.162] (unknown [99.198.199.144])
 by mail.messagingengine.com (Postfix) with ESMTPA id 56058100E5;
 Thu, 27 Dec 2018 14:23:23 -0500 (EST)
Subject: Re: Behaviour of multiple Allowed-IPs 0.0.0.0/0 or ::0/0?
To: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>,
 wireguard@lists.zx2c4.com
References: <443f1c88-5c11-36cb-859c-c7105d68cd19@bartschnet.de>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <a9fe85ff-8d0a-be05-59a8-6775ab392933@sholland.org>
Date: Thu, 27 Dec 2018 13:23:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <443f1c88-5c11-36cb-859c-c7105d68cd19@bartschnet.de>
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

On 12/27/18 10:27, Rene 'Renne' Bartsch, B.Sc. Informatics wrote:
> how does Wireguard behave with multiple peers with Allowed-IPs 0.0.0.0/0 or 
> ::0/0?

That's not allowed. To quote the WireGuard homepage: "when sending packets, the
list of allowed IPs behaves as a sort of routing table, and when receiving
packets, the list of allowed IPs behaves as a sort of access control list."

If two peers had the same network "0.0.0.0/0" in AllowedIPs, how would you
choose which peer to send packets to? You can't, so WireGuard prohibits
duplicating AllowedIPs networks across peers. If you add "0.0.0.0/0" to the
AllowedIPs of one peer, it is removed from the AllowedIPs of every other peer.
(So the end result is that the last peer in the configuration file ends up with
the AllowedIPs of 0.0.0.0/0).

If you have static allocation of internal IP addresses, then you don't want
AllowedIPs of 0.0.0.0/0. If Host A is always assigned IP 10.1.2.3, then its
AllowedIPs only need to be 10.1.2.3. Host B can have AllowedIPs of 10.1.2.4 etc.
and they don't overlap.

On the other hand, if you want to do dynamic routing or multipath, the best
solution for now is to have a separate WireGuard interface for each peer. Then
you can use 0.0.0.0/0, because routing decisions are made at the kernel routing
layer, not by WireGuard.

Hope that helps,
Samuel
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
