Return-Path: <SRS0=kH4x=QG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FB5C282D7
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 30 Jan 2019 16:55:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4129A2086C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 30 Jan 2019 16:55:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="gtQUrpoi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4129A2086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3040d96c;
	Wed, 30 Jan 2019 16:49:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1e47bfe
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Jan 2019 16:49:44 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b5f04fc
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Jan 2019 16:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=Content-Transfer-Encoding:MIME-Version:Date:
 Message-ID:From:To:Subject:content-disposition;
 bh=tYl6B3I1WyaDGwSVd8SFpHAFyvgEo6w1tkWJwoitkWU=; b=gtQUrpoi3yRaOSF4YNtDw+xNOo
 XADM3RvOK5qzrtRrAYM+6L1QPWRy8YcVFee1HHqkFzEovEXc/vvsb6W93a4ifOWXqU3Uv1pSwm4kv
 ahEv44BmmDke+CLJSZ24XxYukfmP5oL+rNGVV2a/d4z6f8FjnC6oBMnsQTIOzBYSX4KWPSxo54z4j
 MrOeKFB755OX3poXO5IDva38ktwVpjytq7SUW4bHG6oXgDZE+tZ8HWdM/Orvi2BV4W/QKaX//Hsv5
 Q5bGt/pKF6rIuvnqDf6mXj9FM6KFcOUqlSq6sc2jZyIeSwYvty+UPVhPOCU/MY7n/pSIl5w63dhJG
 5BxF50n/S+fOS22su7skk0rpLRfnpo92HrmNMlneehioVfRE2kCljWbJeXKWRGo1ThVHwOrn+vToa
 0f1/zVtAK2SNSsLHcMpd5Kk3QVaYH8YqK5KDpV6qLLW9R3X6/NRUpn1aZRNeRsYcptkDN8VyunG0I
 cGSlCH6m02+UuOFt1E8CgNZjmsFXgdraz2mlj0Kc7rZjMxHeQLC//VrO1AThlLfJWpl+RVidfn65V
 N7t+LA18yXN6sDNgcbDgfFYb8MqtNsUelH5oJOq5vEw/YT5wUriff8uRWJqIhbtG15HuI0eH6ojcE
 +uuoPaq2b2DvI49geHEhJYzdbBSI3aIHJYZItrFgg=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1got9H-0000q4-Q6
 with ESMTPSA (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 for wireguard@lists.zx2c4.com; Wed, 30 Jan 2019 17:55:41 +0100
Subject: Re: wirehub - decentralized, peer-to-peer and secure overlay networks
 built with WireGuard
To: wireguard@lists.zx2c4.com
References: <CADjxVNq-PPTrzd9qDZK+ZFF8v70eme8n87xBK-77e=PNMGCQwg@mail.gmail.com>
 <CAJQSx3aQLGT9Hr=3NNTnrvq2JJCqiJ2vkV092n_zCN2LNjP-1Q@mail.gmail.com>
 <CADjxVNrNNbRpanwm4ZEOLbY_e4FEohP=2YzpQFXe28JiHzj-yQ@mail.gmail.com>
 <CADjxVNp8JsMGfULG7pzJt3Cjbn9RzXyFmA1kx+vggr4J03nHcw@mail.gmail.com>
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Message-ID: <49a6d952-5f2e-afce-e503-47fbebba8ac0@bartschnet.de>
Date: Wed, 30 Jan 2019 17:55:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CADjxVNp8JsMGfULG7pzJt3Cjbn9RzXyFmA1kx+vggr4J03nHcw@mail.gmail.com>
Content-Language: de-DE
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>



Am 30.01.19 um 16:46 schrieb Gawen ARAB:
> Hey Rene,
> 
>  > I suggest to use a cryptographically generated IPv6 address (128-bit hash of Wiregurad public key with first n bits replaced by a Wireguard-specific IPv6 prefix)
>  > for routing and management purposes. Adding a reverse-lookup IPv6-address -> Wireguard public key via DHT would allow a public IPv6 overlay network
>  > with authorization via firewall rules. Nodes should also be able to announce their subnets via DHT.
> 
> I agree. I plan to use the subnet ORCHID as defined by RFC 4843.
> See command `wh orchid`.
> 

Great! :-)

RFC 4843 has been obsoleted by RFC 7343. Please use RFC 7343 instead and re-use as much cryptographic code of Wireguard as possible to reduce possible bugs and weaknesses.

I suggest to omit the custom UDP protocol and libpcap by adding an ORCHIDv2 address to the wireguard network device and run the DHT via a port of the ORCHIDv2 address.
That way you can easily calculate the ORCHIDv2 address of a peer from the public key and connect the DHT.


Regards,

Renne
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
