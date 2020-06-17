Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558CCC433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:19:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02F97207DD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:19:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ericlight.com header.i=@ericlight.com header.b="DmNx7/P+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Jr6Fvi1O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02F97207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ericlight.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64912cf8;
	Wed, 17 Jun 2020 08:00:40 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a443bc78
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 08:00:37 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 3277452A
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 04:18:40 -0400 (EDT)
Received: from imap7 ([10.202.2.57])
 by compute4.internal (MEProxy); Wed, 17 Jun 2020 04:18:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericlight.com;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=uJIj/uTI/ibuc56/obtVGbRCyjdiBha
 aHit5jHNz4Q0=; b=DmNx7/P+X5Ut8YdOf0g4VCgCyBSYoO3tlmQXjbZAo6yRMRt
 xzgXmRah+tX8TE3shUdcu6QIDejubDTI4VsUM5kc7icNDlGH8BShbiNJnbfcCY61
 HL24JfoeRD8f3/8Q3LEmWuhRKtrKjIDm/x4ynefoGDEqs9dK28zVezLQHximrNrL
 KiD4OC/X5FglQHCcl/8nGGqUx5HekvbKoRxO8G7KfqmwpaJjS0EbGKuJNHA4xrOc
 lGsurShZxHePCsFpVaakWjpPOok3SSzwDfa1mS+Q33jJ29jGjbYDsA3kLubtopjx
 JtdGUfv504oinqhPybItds5+QlMGNr7RS3/jXQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=uJIj/u
 TI/ibuc56/obtVGbRCyjdiBhaaHit5jHNz4Q0=; b=Jr6Fvi1OeczKXHpthumrbS
 eN/+4FxCLjxCy3QG0zrJ+w2EgKWnpm4erS02BrvMu01rbePQEnOewtkEeLlGWjPD
 prfZh54fIgaTN27zyJkH/CfAHyfdL1uT3u0FYaMGDqghr9tX1rJkZbXk1W5sJUck
 GuEMq4CYgaAjD2SpyP2pmrwko+MwoFI5tWTG8Owq10U7RkbVMOT5cF0Hkwk5UzVz
 HyXQWgbsF4AopevyZE8YSnq8LfFGq6g3G+CFLr7gLkBNNJYQmDF6js5U9WK7/2a6
 uT8R0ZBvOOWUafiJzYZ0yZoeVGAoeHWMR9submVyP4+loqx8erTrKqXUcuYm/+UA
 ==
X-ME-Sender: <xms:39HpXmxNQA_dJjzv7WJxD66Llh4Pke7WcC2hhj1IJq4drng4qU6djw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejvddgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpedfgfhrihgtucfnihhghhhtfdcuoegvrhhitgesvghrihgt
 lhhighhhthdrtghomheqnecuggftrfgrthhtvghrnhepveduuedtveelieevheehjeelle
 dugeffvdekgefhheekheefvefhtdfhudelheeunecuffhomhgrihhnpehsvghnthgvnhgt
 rdgvshenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 gvrhhitgesvghrihgtlhhighhhthdrtghomh
X-ME-Proxy: <xmx:39HpXiQbdpNx8oueHyD1qvrfoXo_PDbD8Mdhq1k0X91uMRyKMrj4pA>
 <xmx:39HpXoU-PBrf7Z_faFcX3l__Rj0YveBQs0V9fKuo1n_cxAYTp2zATQ>
 <xmx:39HpXsiIUYmz7wZgA5m_r7r2DZ23gwhdZkbXxrPak3LIWOQWnm0HdQ>
 <xmx:39HpXh7ltW9iPbIu9HBpAW_rPLp6sXu3DVIZl4gfocH1BIfzHffNPw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9AEF2180091; Wed, 17 Jun 2020 04:18:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-529-g3ee424a-fm-20200611.001-g3ee424a1
Mime-Version: 1.0
Message-Id: <529d5a4a-bef4-41c4-9f99-36b3d5f6c941@www.fastmail.com>
In-Reply-To: <29f7ec55-3a4b-42df-91f8-5204179639f5@www.fastmail.com>
References: <20200528184510.51675-1-contact@garrit.xyz>
 <CAHmME9pt7itFsXQnU=9LeRrcT5Yh7gd97bghOA-5a-nCvo85UQ@mail.gmail.com>
 <29f7ec55-3a4b-42df-91f8-5204179639f5@www.fastmail.com>
Date: Wed, 17 Jun 2020 20:18:17 +1200
From: "Eric Light" <eric@ericlight.com>
To: wireguard@lists.zx2c4.com
Subject: Re: [PATCH] wg-quick: add restart command
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

Sorry, failure to complete my thought before I sent:

"wg-quick wg0 restart" fits much more tightly with the familiar "service x restart" pattern.

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Wed, 17 Jun 2020, at 20:16, Eric Light wrote:
> As a purely Debian user, the 'service x restart' pattern is far more 
> memorable than the syncconf method.  I know personal preference isn't a 
> great reason to add a knob, but Garrit's method is probably going to be 
> much more familiar to many users.
> 
> As to _when_ you'd need this... during a config update as you 
> mentioned, but possibly also to easily generate logs for 
> troubleshooting a config I suppose?
> 
> E
> 
> --------------------------------------------
> Q: Why is this email five sentences or less?
> A: http://five.sentenc.es
> 
> On Wed, 17 Jun 2020, at 19:47, Jason A. Donenfeld wrote:
> > Thanks for the patchset. I'm wondering what the intended use case of
> > this is. When do you need to set the interface down and then
> > immediately up again? Most changes to the config file can be reflected
> > with a more simple:
> > 
> > wg syncconf wg0 <(wg-quick strip wg0)
> >
>
