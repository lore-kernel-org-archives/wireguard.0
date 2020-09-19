Return-Path: <SRS0=EIBb=C5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SHORT_URL,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067ADC43465
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 20 Sep 2020 22:24:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 054F820874
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 20 Sep 2020 22:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 054F820874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=jhoward.fastmail.fm
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbb6598b;
	Sun, 20 Sep 2020 21:53:15 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4e1caf07
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Sep 2020 19:51:35 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 586C85C7
 for <wireguard@lists.zx2c4.com>; Sat, 19 Sep 2020 16:21:55 -0400 (EDT)
Received: from imap35 ([10.202.2.85])
 by compute1.internal (MEProxy); Sat, 19 Sep 2020 16:21:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.fm; h=
 mime-version:message-id:date:from:to:subject:content-type; s=
 fm1; bh=y7rO1GVaydJ/KJc4n3Oyqj8bpky1/1ltzx3GwVP0EIA=; b=i0bgeOjL
 r2dA4VU+x30eCBnMjjtqCUYv8wuTV3NKnncuKh572EhtYZXs26Nb5uk51svFzrYa
 jTKIxYYEbtnkgXSQe1BlzKV98zJnqpKdo5YG5TxIdK8dns/l/1HC7dLlWVJ1Q+Pt
 8eqMZ6DLRQ043ICzTwugVQfIGeh16PKLYW+x3f5v+ZSfTh4eXbK33xJgGyINL7BW
 2HI12WkQHhWsMk/j5L+/aB6SGYOLUHgls237oanq1L5Nkwszn294cVfSndpVxEPC
 X1ymc/U3ef9afjYmX5JQ70uRh2Rcu31T/S1YH46lttu/ZeeaNs2UFEor30icZw0c
 PUUTBvaykbxZFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=y7rO1GVaydJ/KJc4n3Oyqj8bpky1/
 1ltzx3GwVP0EIA=; b=RgEIhvrdMyrKFqyZSXZV5oxTDGtyZbtzzmqn9ijeAjKpn
 VipiyPDbdF6rRpnlfgLudP4UBJMAjhsR4PesdEE7xkq/JG/t3xEQ4skCM3JKbVIj
 uQHufy1Yrh9t93OCZz4Vk3JedDmXFgFlCYKiaO1+ooHsiZcRSbWYkA0C+jOmvrw3
 oNbmLzA2L/LnoEm/GvP1gOMNHchcN8kOw3j8PyhkIAbFsl3U1OikuOj9SbpxDEt6
 Xy9xjgFI5ejpm6ndxJE8ihrXXIVOH2P+VGU91vV20sn7jSEKnJjNZP6S6PcgsIg2
 C7wREq0CAzYsrCwQcNaDQ/fi5wVMhLhDewQI8GnJw==
X-ME-Sender: <xms:YmhmXwBs420FrEHY4Martw40xHukzWBZfkPbL5U8onKM97Vxv_mwUg>
 <xme:YmhmXygY0_QbBxZoeVSTRCV0jQF62-Z4VxNA7U28YdN4RzDj3fngIlYTpZ51vXol2
 Tc08A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdekgddugeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
 erredtnecuhfhrohhmpedflfgvrhgvmhihucfjohifrghrugdfuceofhhorhhumhesjhhh
 ohifrghrugdrfhgrshhtmhgrihhlrdhfmheqnecuggftrfgrthhtvghrnhepudetfefhvd
 eggeekgeduleeuuddvteduvdevffehtdeuleeiieektdekledufffgnecuffhomhgrihhn
 pedtgidtrdhsthenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehfohhruhhmsehjhhhofigrrhgurdhfrghsthhmrghilhdrfhhm
X-ME-Proxy: <xmx:YmhmXzmR1dFoml1rTgAkA5VkeXE9JGXDhB0cfKMVNHM3f--VPY_JAg>
 <xmx:YmhmX2x318sFhOI3hTSfPTA7iu_G__zXufddChbq9fbRLOQ6q3tiiw>
 <xmx:YmhmX1Sl3FtJ_wwTgcbdpRhNN2WlLILLHOIiFVFG8SYoQRbg9ZlSDw>
 <xmx:YmhmX8dWtZJY52MXOUR6ymLR6sJf5iDFEwEhy8HF0sWpTDvFr1EvOQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A50B114C086D; Sat, 19 Sep 2020 16:21:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-325-g8593b62-fm-20200916.004-g0f995879-bis
Mime-Version: 1.0
Message-Id: <82dd10dc-ee1d-45a7-a82c-1739e1048e5e@www.fastmail.com>
Date: Sat, 19 Sep 2020 13:21:34 -0700
From: "Jeremy Howard" <forum@jhoward.fastmail.fm>
To: wireguard@lists.zx2c4.com
Subject: Apparent Windows routing bug when switching between VPNs
Content-Type: text/plain
X-Mailman-Approved-At: Sun, 20 Sep 2020 23:53:13 +0200
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

I just started using wireguard, after using openvpn for quite a while. I've seen a semi-regular bug when using wireguard from Windows 10. I find if I switch from one vpn to another, by deactivating one and activating another, and then I switch back to the first one, I often find that I can no longer connect to servers in that 1st vpn. I get the handshake, but can't actually connect to anything after that - perhaps some issue with the Windows routing table?

Oddly, to fix it, I find that I have to edit the config in wireguard windows - e.g by changing the order of the lines in the text
Then I find I can connect again. Even rebooting doesn't fix it - only editing the config (e.g by changing the order of the lines) works.

It seems to happen with different servers in different locations, but here's a server conf dump if it helps:
https://0x0.st/ilqo.txt

Let me know if there's any other info I could provide.
