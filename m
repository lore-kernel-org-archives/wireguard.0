Return-Path: <SRS0=dNI2=CI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62937C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 30 Aug 2020 10:05:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8596520714
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 30 Aug 2020 10:05:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ericlight.com header.i=@ericlight.com header.b="W50s25wy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bMDeU904"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8596520714
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ericlight.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 556cc32e;
	Sun, 30 Aug 2020 09:36:52 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 399e849e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Aug 2020 09:36:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EDD8A5C0179;
 Sun, 30 Aug 2020 06:04:30 -0400 (EDT)
Received: from imap7 ([10.202.2.57])
 by compute4.internal (MEProxy); Sun, 30 Aug 2020 06:04:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericlight.com;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :cc:subject:content-type:content-transfer-encoding; s=fm3; bh=mU
 6jNedjgvkajv6RlO3oFqgMI0L4hfw27YG2eCPIRX8=; b=W50s25wyDH54L17+Wj
 r3IQnSKu0jJo4dGVAMVYBM1cFuJe79dWak2x1GtV3chFkzwu/j2IX501eoSDRfNi
 Dbem4Je6EsvcXYBjKMHxVY30B4BWGG/9OKA+HYjXKR3zppvITdtKU1hr/Un7r+Ey
 xJ0Z88yzwHCrONcAoyWuBSjUB8KXl7sLkB363JahvArvLYPxyKgz+b/lBaOmhlQf
 Nlt2NLz1bxdnBUI/xXEg8gsYkixnYcxnLu9tsDDrcTi2GzRkKTB0XxzZAGsx2X19
 h7NRFKTOMyUBIdBA+0rpFd4VdmJtpFaCVC2z7sDPfGPisRJ7azPiVa+YUPwFiPg8
 /ftA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=mU6jNedjgvkajv6RlO3oFqgMI0L4hfw27YG2eCPIR
 X8=; b=bMDeU904BX2HVUfKanDr9rlNXTSUCORE76sus5yiq40oq5aNabzMmRP1i
 Qs6luag1Y3xSmNdPytt1wCXjMUJ4H9KtqH3l4j3pS2xhWQ3ZE/W3TeE5siJHfGlg
 vrUpqoD8T0XiRVtMz/OId/oTNubmE7EvbWV5Z6eB2rVCi+ecSL+MmvbvxZgjbr9g
 aQ6g9YgJp1cWCPtfJmYaEqrUWpKDu8HNFG/fcd1Ef5skjzFSE9Z0CtrGjttb2RWp
 8clU3TPgl5fyze159XrTbtZ06ltkywT3PGhqyqlSId9DRDjmxhnfkYQjHLKRr4ij
 w/TBl+7dP0AEhF7ycXAPVAUFp+otQ==
X-ME-Sender: <xms:rnlLX9m9Hl10YDiTuaimKeLIA1TaMiIabhs8NGw4ti9f6yQFcfPhiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeffedgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedfgfhr
 ihgtucfnihhghhhtfdcuoegvrhhitgesvghrihgtlhhighhhthdrtghomheqnecuggftrf
 grthhtvghrnhepjeetkedvfffhgedutdejueejteetjeevtdfffefhgeehgfeuhfdvudej
 keeiffdunecuffhomhgrihhnpehsvghnthgvnhgtrdgvshenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegvrhhitgesvghrihgtlhhighhhthdr
 tghomh
X-ME-Proxy: <xmx:rnlLX43nqb7j3m9L6XxKkRFj2Wyo64tcxEaVGhMcvDfiJSftdkPLlQ>
 <xmx:rnlLXzqdvIfafYwcVOio0Cjb-MmPOFg_hzXKmqSoCsQ9OQNO_zej1w>
 <xmx:rnlLX9l57MLj4kvXBMww9RtEYtE-dbnmzSgqfSQwm9m3vFSKZd_PkQ>
 <xmx:rnlLX5CDYgxgtOK1je92wx9qIVZjABM_X_hSxSsVCell_H6jN8Yl1Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6CF401800A4; Sun, 30 Aug 2020 06:04:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-232-g4bdb081-fm-20200825.002-g4bdb081a
Mime-Version: 1.0
Message-Id: <1a76542e-9c69-4b3b-a006-89d53bd9282c@www.fastmail.com>
In-Reply-To: <001b01d67eb3$a7d0e7e0$f772b7a0$@bukn.net>
References: <f4484f4c-d744-48ad-b78f-c6005936d60e@www.fastmail.com>
 <CA+oXxS0r9iMFC32SHweKEiersLVxNQrxopQs+EEsomwGyNGZgw@mail.gmail.com>
 <f6af6006-10fa-40bf-a7b2-bd01b323e85d@www.fastmail.com>
 <001b01d67eb3$a7d0e7e0$f772b7a0$@bukn.net>
Date: Sun, 30 Aug 2020 22:04:08 +1200
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

Probably worth having a poke around the source code for wg-quick; it's j=
ust bash, and it can really show you what's happening far better than I =
can! :)=20

If you have a look at the "up" and "down" commands in there, you should =
learn everything you need to know.=20

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Sun, 30 Aug 2020, at 21:55, Aaron Bolton wrote:
> What would be best way to bring up and down the wireguard interface=20=

> without using wg-quick=20
>=20
> -----Original Message-----
> From: Eric Light <eric@ericlight.com>=20
> Sent: 30 August 2020 10:01
> To: Aaron Bolton <aaron@bukn.net>
> Cc: wireguard@lists.zx2c4.com
> Subject: Re: AllowedIPs
>=20
> Ah yep, I haven't done that before, but Quagga has made many appearanc=
e=20
> on this list... And you're right, that's pretty much the time when=20
> folks stop working with wg-quick!  :-D=20
>=20
> Good luck!
>=20
> E
>=20
> --------------------------------------------
> Q: Why is this email five sentences or less?
> A: http://five.sentenc.es
>=20
> On Sun, 30 Aug 2020, at 20:56, Aaron Bolton wrote:
> > Yes, this does thanks
> >=20
> > I plan on using Quagga for BGP over WireGuard tunnels so I guess I=20=

> > need to avoid wg-quick if that makes changes to the routing table an=
d=20
> > firewall as I want to manage those my self
> >=20
> > > On 30 Aug 2020, at 00:16, Eric Light <eric@ericlight.com> wrote:
> > >
> > > =EF=BB=BFI believe it's both, in a way.
> > >
> > > As far as wg is concerned, the AllowedIPs is effectively an ACL. =20=

> > > Any traffic hitting your wireguard interface from an IP not within=
=20
> > > the AllowedIPs will either be dropped on decryption, or won't even=
=20
> > > be decrypted.  (It's one of these, but I can't remember which)
> > >
> > > On top of that, wg-quick interprets the AllowedIPs string and does=
 other things, such as adding appropriate network routing (the second pa=
rt of your guess), as well as modifying any client firewall rules to per=
mit the traffic.
> > >
> > > Hope this helps  :)
> > >
> > > E
> > >
> > > --------------------------------------------
> > > Q: Why is this email five sentences or less?
> > > A: http://five.sentenc.es
> > >
> > >> On Sun, 30 Aug 2020, at 04:07, Aaron Bolton wrote:
> > >> I=E2=80=99m trying to understand AllowedIPs better is it effectiv=
ely a ACL=20
> > >> that day what is allowed down the tunnel or is it mechanism to=20=

> > >> configure what addresses get routed down the tunnel?
> > >>
> > >> Thanks in advance
> > >>
> >
>=20
>
