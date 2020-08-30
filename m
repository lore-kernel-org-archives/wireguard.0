Return-Path: <SRS0=dNI2=CI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE325C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 30 Aug 2020 09:01:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 335812071B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 30 Aug 2020 09:01:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ericlight.com header.i=@ericlight.com header.b="86dCY3NN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eS3/eYB5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 335812071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ericlight.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5416be0;
	Sun, 30 Aug 2020 08:33:35 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 58aeff3d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Aug 2020 08:33:33 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 087195C0158;
 Sun, 30 Aug 2020 05:01:15 -0400 (EDT)
Received: from imap7 ([10.202.2.57])
 by compute4.internal (MEProxy); Sun, 30 Aug 2020 05:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericlight.com;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type:content-transfer-encoding; s=fm3; bh=bS
 xsw4ufMmoqMFYU5aKIbNjTc4Qbhst+FSnk69baPFc=; b=86dCY3NNE1xsRL6YGE
 YHdmzwDAA57+sjywzi1o2EZeaJv/T3SOhNzPdVrV0zQak4M9qIb2qVyfh7zSyL+V
 W+nUKTwnNW/xnw/k8UvEIzsAxXOnrGZoEt4SpRAjZUiNjdC2dOPHvkGBVgIWERtu
 6+V86tR9M+Z6fxHXq1Ipj7Jqy3sjjsxviTZQZ7PVYlq+KjTD6HJ8V6OuwBSZsphp
 wl8/nHWBPXxrZ14Nrky20i4GGuaUCQyMSXOs+L79xqb4Z5TuSPNxhb3OhzYjFUqp
 FE1Q5/PXJwyoW3kb7mWwk0tkVYQZOtXuLGFxo4ai7wZo+chTIQKLBrCVuI8hN4TX
 9lsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=bSxsw4ufMmoqMFYU5aKIbNjTc4Qbhst+FSnk69baP
 Fc=; b=eS3/eYB5PBAtu/yXMN+hCfQjJX0YCZ0P5UfPlJ7pT+ygvzHn33aSA6v0h
 vd7wIbSw2hru4Dh9yPruv41CvYq09fl478QasavjKhzmq4l5P5XVDMfX9IaN34+8
 WazZYfpXSI77h5tfMR87Y7b8ItT8qtLlXtzfk1xfztc0lqN9rHVTS/XSkLDQdFHR
 C0MOhWanQgghpHJYnLbgH/3cwdhSB8CA2XMtWq6daHGOCD88EqKYD969zGtkHGC9
 boTkY5FICvSeDGOW4WnkvUhphZ7rfOj4jvxqS8Ds99W0jM5ybidgSaTpcBGAJE2w
 STwi5coA5Z1JMYLO3J1+b6lrBSlKw==
X-ME-Sender: <xms:2mpLXzWwBp6lrMBtTV3294Z0FVCB2xOjILsnpL85wroMhSfnyZH-Lg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeffedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedfgfhr
 ihgtucfnihhghhhtfdcuoegvrhhitgesvghrihgtlhhighhhthdrtghomheqnecuggftrf
 grthhtvghrnhepjeetkedvfffhgedutdejueejteetjeevtdfffefhgeehgfeuhfdvudej
 keeiffdunecuffhomhgrihhnpehsvghnthgvnhgtrdgvshenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegvrhhitgesvghrihgtlhhighhhthdr
 tghomh
X-ME-Proxy: <xmx:2mpLX7nA-vnCzK4ljD-8vj-P08OIGcctCQj68R9k67Q-w1exVb2xoA>
 <xmx:2mpLX_ac1sgP7ncWWr7KFKViRyZwyiJhvNxSErCTrQxafMdG5JjxZg>
 <xmx:2mpLX-VEEaAMeZgfetalu8Eo29Gn66TJe9kJFQrFlO5ZVe2rBd9Q8w>
 <xmx:22pLXyyn0hHPDsALBNVeWowrdKjeO3J1RyNNUqZRZwlM1NGFGUBCxA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B03CE1800A4; Sun, 30 Aug 2020 05:01:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-232-g4bdb081-fm-20200825.002-g4bdb081a
Mime-Version: 1.0
Message-Id: <f6af6006-10fa-40bf-a7b2-bd01b323e85d@www.fastmail.com>
In-Reply-To: <CA+oXxS0r9iMFC32SHweKEiersLVxNQrxopQs+EEsomwGyNGZgw@mail.gmail.com>
References: <f4484f4c-d744-48ad-b78f-c6005936d60e@www.fastmail.com>
 <CA+oXxS0r9iMFC32SHweKEiersLVxNQrxopQs+EEsomwGyNGZgw@mail.gmail.com>
Date: Sun, 30 Aug 2020 21:00:53 +1200
From: "Eric Light" <eric@ericlight.com>
To: "Aaron Bolton" <aaron@bukn.net>
Cc: wireguard@lists.zx2c4.com
Subject: Re: AllowedIPs
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Ah yep, I haven't done that before, but Quagga has made many appearance =
on this list... And you're right, that's pretty much the time when folks=
 stop working with wg-quick!  :-D=20

Good luck!

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Sun, 30 Aug 2020, at 20:56, Aaron Bolton wrote:
> Yes, this does thanks
>=20
> I plan on using Quagga for BGP over WireGuard tunnels so I guess I
> need to avoid wg-quick if that makes changes to the routing table and
> firewall as I want to manage those my self
>=20
> > On 30 Aug 2020, at 00:16, Eric Light <eric@ericlight.com> wrote:
> >
> > =EF=BB=BFI believe it's both, in a way.
> >
> > As far as wg is concerned, the AllowedIPs is effectively an ACL.  An=
y traffic hitting your wireguard interface from an IP not within the All=
owedIPs will either be dropped on decryption, or won't even be decrypted=
.  (It's one of these, but I can't remember which)
> >
> > On top of that, wg-quick interprets the AllowedIPs string and does o=
ther things, such as adding appropriate network routing (the second part=
 of your guess), as well as modifying any client firewall rules to permi=
t the traffic.
> >
> > Hope this helps  :)
> >
> > E
> >
> > --------------------------------------------
> > Q: Why is this email five sentences or less?
> > A: http://five.sentenc.es
> >
> >> On Sun, 30 Aug 2020, at 04:07, Aaron Bolton wrote:
> >> I=E2=80=99m trying to understand AllowedIPs better is it effectivel=
y a ACL
> >> that day what is allowed down the tunnel or is it mechanism to
> >> configure what addresses get routed down the tunnel?
> >>
> >> Thanks in advance
> >>
>
