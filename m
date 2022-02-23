Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F07C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Feb 2022 05:21:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3d066f02;
	Wed, 23 Feb 2022 05:21:40 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by lists.zx2c4.com (OpenSMTPD) with ESMTPS id acec2139
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Feb 2022 05:21:37 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7E3465C00F9
 for <wireguard@lists.zx2c4.com>; Wed, 23 Feb 2022 00:21:36 -0500 (EST)
Received: from imap42 ([10.202.2.92])
 by compute2.internal (MEProxy); Wed, 23 Feb 2022 00:21:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natulte.net; h=
 cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=Xe5akwHg6HNePisS7hbXIZW9dHz9NCFT7V4+AW
 hf5qM=; b=aPu8m0szFEozZF2DLIT+GRets0PQdA2/ATqHPzQkS4qr96ya/NCmfw
 p3yuNQDNayKOvwRhyMdrjsqEkchyhJGxgMVo5TQaR3cYPrhuxQHO0xysf+2Haeg0
 YsSBTJho0BOtPIPWW0RSbiJS1p7SdqRMU2RIe605v957SXcj6bJZtSj6qxQ33FPh
 mcLSbqZuWqSa+/bKLC8MO/IgBx7dU/f/+rJ5zNU4ZdelUEhI5J7EzFgyq9V00kPq
 maZQWbAEM9lpsvNffq5jGM7m2RCwnfYi7Yk8JwaLeVkPTnhrovU8n8XbawRHG6gg
 ip+62gNzX6vaDHl+LCqyFpP53POZ+rQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Xe5akwHg6HNePisS7
 hbXIZW9dHz9NCFT7V4+AWhf5qM=; b=RAkpBJgL808Yzevza1+vIq5nYMFEJxwDo
 9ihWYu9d4gVzK0DBCJLBk5eN76Cgil7Dlo3FXgPesh8ziYYaBfThsTbRU/kQybel
 Yqwv2rcWLqP+9knH5hzI6YOlJ239qDmvdfm9wHdRWCbEkg40+wopTmPGkJgOFd6A
 +2+0ehaN1c06hBj1v6JLpTQXfL7GDVmiAg4xBLNHhkA1AfbIaICOABnKLZXbUehr
 pIzKV946YyxCHuaywhY50rcAfw5pR+smwoN0pB3WRLYSb+s7BJ+aCyqH+w56Wjzc
 KtPXRkTlFBI/XsPbWjhFLxdT3vjy3y6efVH5WDZVhaFv3QS7KXmHw==
X-ME-Sender: <xms:X8QVYl1ORAypbCYRs2kDyVejkBVjQrcwU-ozxBtNUvYVe1Ap1cDvQA>
 <xme:X8QVYsEHL8MxV_zjy_RUZUbM8LWaVuVfqOq0fTJYY7d_aMWabt6uAh3ZlsCaKJ7pa
 yqzDJo0lG6Th3o_9Vw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeelgdekvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreertdenucfhrhhomhepfdffrghvihguucetnhguvghrshhonhdfuceouggrvhgvsehn
 rghtuhhlthgvrdhnvghtqeenucggtffrrghtthgvrhhnpeelhfekvdduueekuddtgfffge
 eugfdvjeeiieelkedvhfefffelveeujefhieelieenucffohhmrghinhepmhgrihhlqdgr
 rhgthhhivhgvrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepuggrvhgvsehnrghtuhhlthgvrdhnvght
X-ME-Proxy: <xmx:X8QVYl4LStezQsRQ3zV661OJhvvqab5Z459QeZ9cofGEr1omoFGVIw>
 <xmx:X8QVYi23SHRYjgYRMMAQsGJ1jhQu6C-5pLCspldqRim60ES79AcbXQ>
 <xmx:X8QVYoEwSPeCaiuKWqqvxIxaRdK4XMziBOSDaEnzT8avBasW6V93RQ>
 <xmx:YMQVYsDX6XJJJiL7HnvuonnUU9Im9phA-JZvuNreBSDX-vhUCCWiHQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 70D652180085; Wed, 23 Feb 2022 00:21:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <ce7bf534-d8d5-41cc-ac46-483fe2d3088a@www.fastmail.com>
In-Reply-To: <20220222024443.1efe2c02@nvm>
References: <nezEceJdtFCD_k8UXUzZUbcLJaTaAPGZWw50RGCGmGJd1kfQ9uVfFzuiv9eXFrM9vidRFDjl-xXyV3iIypSBiMX4kDsPcEMP-2mAH_YfXag=@protonmail.com>
 <de1ed6a8-89cd-ec19-40c5-27f6893f4b17@msgid.tls.msk.ru>
 <Mailbird-87f65eb5-1417-4955-ae28-858c7511900b@gmail.com>
 <6ba013e9-05db-17bc-995b-11ef1f279c91@msgid.tls.msk.ru>
 <20220222005710.705a7023@nvm> <20220222024443.1efe2c02@nvm>
Date: Tue, 22 Feb 2022 21:21:15 -0800
From: "David Anderson" <dave@natulte.net>
To: wireguard@lists.zx2c4.com
Subject: Re: WireGuard Windows should have default MTU of 1280.
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

FWIW, a variety of cloud providers have a leaky abstraction, where they expose an MTU slightly below 1500 to their VMs due to encapsulation they use internally, and not using jumbo frames for various reasons. For example, Google Compute Engine VMs have an MTU of 1460b before WireGuard.

So, if you blindly set your MTU to "1500 minus exactly WireGuard overhead", it'll mysteriously break in those cloud environments (unless you get lucky with PMTUD saving the day, but I tend to assume it got broken by a misguided firewall). It's a common stumbling block I've seen many people hit when deploying WireGuard to cloudy environments that aren't AWS or on-premises systems (which tend to have well-behaved MTUs and jumbo frames on the wire, empirically).

Unfortunately dropping the wg MTU all the way to 1280 can break stuff differently, for people running encapsulation _inside_ WireGuard, because then their inner packet size is smaller than the mandated minimum for IPv6. So, short of building OOB MTU discovery into WireGuard (a-la QUIC - a reasonably big complexity bump), there's no one size fits all default that'll make everyone happy, I fear.

- Dave

On Mon, Feb 21, 2022, at 13:44, Roman Mamedov wrote:
> On Tue, 22 Feb 2022 00:57:10 +0500
> Roman Mamedov <rm@romanrm.net> wrote:
> 
> > On Mon, 21 Feb 2022 22:16:22 +0300
> > Michael Tokarev <mjt@tls.msk.ru> wrote:
> > 
> > > 21.02.2022 22:11, Michael Adams wrote:
> > > > Throwing in my two cents: I was using MTU 1280 on Tinc a few years back, for IPv6 VPN support on Windows & Linux. It's good practice.
> > > 
> > > Lemme guess. The OP is routing wg packets over IPv6?  Can this be
> > > the problem here, because V6 has larger overhead so that 1420 is
> > > too large to fit into 1500 bytes together with IPv6 header?
> > 
> > 1420 is picked specifically so that it fits into a 1500 byte packet with IPv6.
> > 
> > If you run WG exclusively over IPv4, you can use up to 1432.
> 
> Correction: 1440.
> 
> https://www.mail-archive.com/wireguard@lists.zx2c4.com/msg01856.html
> 
> I'm just used to subtracting 8 everywhere, because my ISP *does* use PPPoE. :)
> 
> -- 
> With respect,
> Roman
> 
