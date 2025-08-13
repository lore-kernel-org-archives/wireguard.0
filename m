Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23494D10371
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Nov 2025 01:33:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6cc5fecd;
	Wed, 26 Nov 2025 01:31:32 +0000 (UTC)
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b0c7bc1f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Aug 2025 22:41:43 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id 798A9EC00A0
 for <wireguard@lists.zx2c4.com>; Wed, 13 Aug 2025 18:41:42 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
 by phl-compute-09.internal (MEProxy); Wed, 13 Aug 2025 18:41:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 intuitiveexplanations.com; h=cc:content-transfer-encoding
 :content-type:content-type:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:subject:subject:to:to; s=fm3;
 t=1755124902; x=1755211302; bh=+5NddU7qqaNR1dWh39NkqRR0dhs+cmEN
 OLd4T4BmDBM=; b=BYH/4sN1RmutpbNcPNy94CsvcPSMt6ru07yPSXUr2RYA8N5b
 wxaSgxRlBOA2ugJ+7JJHYcZGrfJ0BQOq8T0M6NhPaLPHebL1qXtLkzDrwyrik3em
 DDqxJqFU95zYGemE8KOm3Mg82M1jGelK78ReIL/krOGUr880ExIeM4E89H/DgKxn
 JF5LeQUlDzLQIdFl20N4lsVuVAP8pLqJSe4RbKvy86dyPqwrdhM6k6KLymMdLCJl
 07CO+wTkH1Eo3EgCThO1RbgSpjjakFIFISKcfOwRJFbThZfM1QJuWC2mAsIPKsde
 s9QmVkGHpUGMJxNga8u85pgCV1NDioLWLiE1zQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1755124902; x=1755211302; bh=+5NddU7qqaNR1dWh39NkqRR0dhs+cmENOLd
 4T4BmDBM=; b=bNHFaxbWHszEvRJyJEFnAx3cxJwr1pQLerXj1ZaC3j7bMVP5Dnq
 KBkqD5kWGcaBwsTiPZoNUug9Y+pljGSKpdpHqXCFQBUGRJDVRziu85gJkIKUuvwc
 7uHekc0B8gZlWtsYNEx2Tcu68/XDM9QF+lE8HGivPnl2xrpUL5yl2/+3kYmvkMk+
 jssEXSkZPohGytdFLFaerWIIWm7ywtkC7o6vPoIM5QvFupLKn/hiFBX/LaUvducl
 an915tY0okw5gcHLzb8aS1IZZJXpmLa1bHscxxFPVG1xokaJRepFwOvvwo6RZ73b
 TUrPGyvOiVxIR+8Qn3sDJelUdS1g2RcC0dA==
X-ME-Sender: <xms:pRSdaN6U_XV08FEyNPuWOnKPBvt7RXSCRhCB_hxrnG3MMbcRhk2RJw>
 <xme:pRSdaK7yVRlGFIIQhkl8YXrjrVDrujB1rxHCyUt2tEfuGTz4E1UTs3T0nLSm93QA4
 Ja-QGHqZA8-Acelk4U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeelgeefucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucenucfjughrpefoggffhffvkffutgfgsehtjeertdertd
 dtnecuhfhrohhmpedftfgrughonhcutfhoshgsohhrohhughhhfdcuoehrrgguohhnsehi
 nhhtuhhithhivhgvvgigphhlrghnrghtihhonhhsrdgtohhmqeenucggtffrrghtthgvrh
 hnpefgvdetveehkeefvdfhvdefhfejudfhteevhfdtgfeihedvgeetffegjefgfeeukeen
 ucffohhmrghinhepfihirhgvghhurghrugdrtghomhdpiiigvdgtgedrtghomhdpphhroh
 gtuhhsthhoughisghushdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehrrgguohhnsehinhhtuhhithhivhgvvgigphhlrghnrghtih
 honhhsrdgtohhmpdhnsggprhgtphhtthhopedupdhmohguvgepshhmthhpohhuthdprhgt
 phhtthhopeifihhrvghguhgrrhgusehlihhsthhsrdiigidvtgegrdgtohhm
X-ME-Proxy: <xmx:pRSdaDw_RcVlTOQHRbS862GTokYQONxDeAVqRChhkrFoTsrr6aRhYg>
 <xmx:pRSdaPjJwClh9IlS10aubWu3htca6KkGTynd9sgRFFMrwUu6bvshFQ>
 <xmx:pRSdaIW71f593Ycy2X2heROnLi3qo9tBSaNSKAYvJXD2MMDlKDZoOg>
 <xmx:pRSdaB1fFcsSsDX5mTWIvZDPhHq-aInQ32rfmuO8QGn60NTEB_l4Pg>
 <xmx:phSdaDhKU0wktp_N-k08XYzOCG4-KVYvB6gOdTVyDvcqAzpuxj6EcMpE>
Feedback-ID: i64b94633:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id C83E57840B0; Wed, 13 Aug 2025 18:41:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 13 Aug 2025 15:41:21 -0700
From: "Radon Rosborough" <radon@intuitiveexplanations.com>
To: wireguard@lists.zx2c4.com
Message-Id: <98b75751-8cb9-46a1-93a5-fe70952b78ff@app.fastmail.com>
Subject: Incorrect behavior of "exclude private IPs" in Android app
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 26 Nov 2025 01:31:28 +0000
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

My understanding is that this mailing list serves as the issue tracker for Wireguard, based on my reading of https://www.wireguard.com/#about-the-project. Please redirect me to the appropriate destination if I'm in the wrong place.

The Wireguard Android app allows for the setting of an "Allowed IPs" list, which allows for tunneling only traffic destined to a subset of destinations. Since excluding local/private IPs from tunneling is a common use case for this, there is a built-in checkbox in the Android app for excluding private IPs. The checkbox populates a default list of CIDR ranges to exclude.

However, as far as I can tell, the value used by this checkbox is incorrect. It does not exclude the 127.0.0.0/8 address range, even though this is almost certainly not intended to be tunneled by a user. For example, consider a case where the user has forwarded the Wireguard port from a peer to Android over USB. Then the Wireguard Android app must be configured with a peer address of 127.0.0.1:51820. With the default checkbox settings, Wireguard will attempt to tunnel 127.0.0.1 to itself, and block all traffic, including DNS resolution.

The "Exclude private IPs" option was implemented in the Android app originally in https://lists.zx2c4.com/pipermail/wireguard/2018-July/003106.html, where the current list was proposed.

I found a website https://www.procustodibus.com/blog/2021/03/wireguard-allowedips-calculator/ which allows for the calculation of correct "Allowed IPs" settings. It also provides a suggested default value for the "Allowed IPs" option.

Here is what is currently in the app:
0.0.0.0/5, 8.0.0.0/7, 11.0.0.0/8, 12.0.0.0/6, 16.0.0.0/4, 32.0.0.0/3, 64.0.0.0/2, 128.0.0.0/3, 160.0.0.0/5, 168.0.0.0/6, 172.0.0.0/12, 172.32.0.0/11, 172.64.0.0/10, 172.128.0.0/9, 173.0.0.0/8, 174.0.0.0/7, 176.0.0.0/4, 192.0.0.0/9, 192.128.0.0/11, 192.160.0.0/13, 192.169.0.0/16, 192.170.0.0/15, 192.172.0.0/14, 192.176.0.0/12, 192.192.0.0/10, 193.0.0.0/8, 194.0.0.0/7, 196.0.0.0/6, 200.0.0.0/5, 208.0.0.0/4, /32

Here is the proposed alternative:
1.0.0.0/8, 2.0.0.0/7, 4.0.0.0/6, 8.0.0.0/7, 11.0.0.0/8, 12.0.0.0/6, 16.0.0.0/4, 32.0.0.0/3, 64.0.0.0/3, 96.0.0.0/4, 112.0.0.0/5, 120.0.0.0/6, 124.0.0.0/7, 126.0.0.0/8, 128.0.0.0/3, 160.0.0.0/5, 168.0.0.0/8, 169.0.0.0/9, 169.128.0.0/10, 169.192.0.0/11, 169.224.0.0/12, 169.240.0.0/13, 169.248.0.0/14, 169.252.0.0/15, 169.255.0.0/16, 170.0.0.0/7, 172.0.0.0/12, 172.32.0.0/11, 172.64.0.0/10, 172.128.0.0/9, 173.0.0.0/8, 174.0.0.0/7, 176.0.0.0/4, 192.0.0.0/9, 192.128.0.0/11, 192.160.0.0/13, 192.169.0.0/16, 192.170.0.0/15, 192.172.0.0/14, 192.176.0.0/12, 192.192.0.0/10, 193.0.0.0/8, 194.0.0.0/7, 196.0.0.0/6, 200.0.0.0/5, 208.0.0.0/4, 224.0.0.0/4, ::/1, 8000::/2, c000::/3, e000::/4, f000::/5, f800::/6, fe00::/9, fec0::/10, ff00::/8

What do you think? Is this an appropriate change to make, so that users have a higher likelihood of the "Exclude private IPs" option doing what they expect?

Thank you,
Radon Rosborough

PS. I am not subscribed to the development mailing list; so I would like to be copied on replies.
