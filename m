Return-Path: <SRS0=JnmV=AK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87998C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 10:53:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1033623884
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 29 Jun 2020 10:53:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=althea.net header.i=@althea.net header.b="QFxw7/8e";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OwFKc6xm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1033623884
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=althea.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8dfee5e2;
	Mon, 29 Jun 2020 10:33:41 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 79eb1df3
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Jun 2020 10:33:38 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 35C255C0140
 for <wireguard@lists.zx2c4.com>; Mon, 29 Jun 2020 06:53:17 -0400 (EDT)
Received: from imap9 ([10.202.2.59])
 by compute7.internal (MEProxy); Mon, 29 Jun 2020 06:53:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=althea.net; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm1; bh=i1AN/
 3bMaRPWZIn/H3UOoQ9ClQ0rEzWxbyjqD9Fy3g0=; b=QFxw7/8exsbAignXa1r9u
 68prgJgns+SKhtAalkKUtODwyHT8SqHWYBHbBJrW3is/yOamLoV4BwPRNumbGe6M
 30P6rw89WT0/swwE/nYFbfczbhek7MeOAbyJrc4WqhYXk2hb8CYVx1CTz/dGNe0T
 ij0E/UmKl9C45HPptsi+WMbnUIdgI9kq5SFMluFl2BiSxOlOlKXpVGW4iheOzOEb
 +Mlao+iMXKnaI+cJBuhrsT27+5uv+rmGQk1wO/9wyYrN9Q1C4hz6Pe8OK2UUKsZM
 j06Q+n2VJZGYV44eel/2FVeG/fGrk1KPx1W6sfVcwnSB49sEAjbTmgC4cjyDTrKj
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=i1AN/3bMaRPWZIn/H3UOoQ9ClQ0rEzWxbyjqD9Fy3
 g0=; b=OwFKc6xmPCwTdbtI0jxsiT8Odc9Z29ijUc9LkfSeU2B+2mLITMhttiz5O
 PD2Op8MudImXE4ep58UeLFRIPJoh6p8tzKyyhOP3KTzxcrik1w7hgsPsLorCFvE1
 iiONaZeXg6wDH+yNOvP2qjfZfVzSMgRp4gRrCo5909EzO7gQI3pSdSdIum/6k4RY
 zfvijMEkz2IQ3h7JdKK4zJiIEV2lRp8oVpKi8dXxBsJlwtUfUEymIB8pkqmsRuRy
 jhJafTad76MOIf0lb4KiTSdLje+D0YUxO7QA5UmxGytppqSqPW20RBQIk7K1pk3W
 N9xEERfQthScvst219R5IJV2Ee13Q==
X-ME-Sender: <xms:HMj5XvqwaTkcPzsWyXz72Ct6v6skRVyAMcUrxrZbcpKN7lbeHxN48Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudelkedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
 hqredtreerjeenucfhrhhomhepfdfluhhsthhinhcumfhilhhprghtrhhitghkfdcuoehj
 uhhsthhinhesrghlthhhvggrrdhnvghtqeenucggtffrrghtthgvrhhnpeevieekvdejke
 fhveeiueettdeuteeffeehgfeutddtjefhhefhvdegheeggfefgeenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjuhhsthhinhesrghlthhhvg
 grrdhnvght
X-ME-Proxy: <xmx:HMj5XpoSb6Hi6jlyP7pja8R386WSoIkU6aGjYJojx91KClN3peOVEA>
 <xmx:HMj5XsOfWTDb3SeEmK-jDwo002E76oKloLkqTY8bQobDORAJKAcpEQ>
 <xmx:HMj5Xi6kWcJWQ0ZeoMOU4RtiQrCjHYy3xu56QAB4QbqTWYTV2g_fog>
 <xmx:Hcj5XtKj9dBDtPp4UK6j3U4LFs_JPKrc9dcIUk6CkEzOK7RthIUdow>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9CEAC1C005F; Mon, 29 Jun 2020 06:53:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-576-gfe2cd66-fm-20200629.001-gfe2cd668
Mime-Version: 1.0
Message-Id: <25d0c31b-bd93-4267-a757-686685c772a8@www.fastmail.com>
In-Reply-To: <20200629153118.4d72f447@natsu>
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
 <20171205035352.01ffe1f5@vega.skynet.aixah.de>
 <CAHmME9ouUNV4pc7qwr4bO-5bEecFc1U64PF13ExgmYnH9q45tw@mail.gmail.com>
 <20200624153706.3yngzzslepqh7q54@ws.flokli.de>
 <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
 <CAMaqUZ0nTL9mbYEifHP-sc8kQ6ehAOOWfmEb7ARNfZWWDkv4eA@mail.gmail.com>
 <875zbai32e.fsf@toke.dk> <20200629153118.4d72f447@natsu>
Date: Mon, 29 Jun 2020 06:52:56 -0400
From: "Justin Kilpatrick" <justin@althea.net>
To: wireguard@lists.zx2c4.com
Subject: Re: Standardized IPv6 ULA from PublicKey
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

I'm assigning fe80 addresses derived from device MAC addresses for my ow=
n Babel + WireGuard use case.

To chip in on this I don't think WireGuard should add any 'auto-magical'=
 behavior into it's core code. There are significant advantages to keepi=
ng core WireGuard ultra lean and pushing complexity into configuration s=
cripts and separate programs.

That being said adding an fe80 address as a standard for setup scripts (=
wg-quick) seems like a good idea.

--=20
  Justin Kilpatrick
  justin@althea.net

On Mon, Jun 29, 2020, at 6:31 AM, Roman Mamedov wrote:
> On Mon, 29 Jun 2020 12:22:49 +0200
> Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk> wrote:
>=20
> > Reid Rankin <reidrankin@gmail.com> writes:
> >=20
> > > Each IPv6 network device is *required* to have a link-local
> > > address by the RFC
> >=20
> > Given this
>=20
> What you quoted is the shakiest statement of the entire proposal. Migh=
t be a
> cool idea and all, but I don't think RFCs say anything about "requirin=
g" that
> for point-to-point L3 interfaces, where there's no functioning multica=
st or
> broadcast to begin with. And it doesn't seem nice that submitter is tr=
ying to
> skew facts in their favor like that.
>=20
> --=20
> With respect,
> Roman
>
