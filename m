Return-Path: <SRS0=S6z6=OR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB45EC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 16:37:47 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD0C061074
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 16:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD0C061074
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorlab.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b23efef4;
	Mon, 27 Sep 2021 16:37:45 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id be9db0b4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Sep 2021 16:37:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E75403200681;
 Mon, 27 Sep 2021 12:37:39 -0400 (EDT)
Received: from imap46 ([10.202.2.96])
 by compute3.internal (MEProxy); Mon, 27 Sep 2021 12:37:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorlab.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=j4qTM
 NYlPRVLrxq3YyVP1Dp+tYwOlRq1DsUXwhwIwjA=; b=gioTaUh+MKcearr7ynVkQ
 NRv6ABOxP54BaoHouHmHpfthGeLgzoqYcOcYp7F3CQPHgsvMMD+xfyfdQldogE4+
 XocZrERdNvVFFTJEbMh+oiL0ttvjGIdmMHtGiu3oUWZOJBiviiXlkHr1/j50FNP+
 DNGp2PAaXMOwTO4V8ObP58CYyfEVteu6RB5BGzN/5hmpPbX9GFIUPyePXq5IwmrF
 wEY7XdzLW1X4tFCgq5hILnsds9W0i8ATNSQFMSfd340IdvGaT/d/NtEUnMGOWFG9
 wwF4WI2nHDRZMQsBytcBsI4aI3QBnT3HmiOhSp1V6El/4G/YQVuSn0pVKWVXBfT9
 g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=j4qTMNYlPRVLrxq3YyVP1Dp+tYwOlRq1DsUXwhwIw
 jA=; b=uL7jUdLIufiWzOuWMvEPeL4Md/8whfI34i0g21bN9r1jyDNZeM2Q2dwbU
 bbcYTlAkPIKMroHWjR8l54JUHKbQgEc6QytwctcNa6asfGVB5f94LT6049msyqBJ
 mQT2eJ71W8FJDePMEqQxuVya2r6jOqUmXuzKN7jHUTWmNx15XEVJg2WusoPqSP4M
 8EATpsZdqAd1Nz1/7t//x+/POYR5MONDNyDWXXQFLL2WSLz/C6R3nz6EsxebWprq
 uiQrOuW0bv3dMwPDpM9jqt3NEdOSIEwV098j1Js4vaIaQtCDYPpIRt9QjEXrraKb
 i1woAHGJ84rBtjm3w4Qja+EuXb/ww==
X-ME-Sender: <xms:UvNRYTHF3U81KEZSRzL_HhwHXdEYnrE0h2nCZwAEHDyz9GWhR1Yl8A>
 <xme:UvNRYQUYuc-Q4bcnufNCu5Csv4VWurhbFAYBWBjdonuRJTr51gSm86TWXQNNs2TEM
 eQBj7T3zDkmTaCP8VU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejkedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepufht
 rghruehrihhllhhirghnthcuoegtohguvghrsehpohhorhhlrggsrdgtohhmqeenucggtf
 frrghtthgvrhhnpeffgeetfedvueetlefhvedttdeihefgtdethfegueetheeugfekuedv
 ffejieevhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegtohguvghrsehpohhorhhlrggsrdgtohhm
X-ME-Proxy: <xmx:UvNRYVIQYC-6B8GIq3ZfZ4QpNTNfewm-5OAkJWo1Gp8KJ5088Xm_Lg>
 <xmx:UvNRYRELDOehPp2ekGsbi9LB5w3L0IBuazxS6A9RyPeQOD-L4Cdk9Q>
 <xmx:UvNRYZXAAWCll9QGOD7_7hWDMAS6M3y1SvpRi0ffjalW6Yzzpb2rmg>
 <xmx:U_NRYYBmRMCjP9tefgo4UuO36iOJYgsqPS3rXpluRIRm_nGXJe4hyw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E29F51EE0074; Mon, 27 Sep 2021 12:37:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1303-gb2406efd75-fm-20210922.002-gb2406efd
Mime-Version: 1.0
Message-Id: <f69bd6c2-0b56-47b7-b793-835791b4e585@www.fastmail.com>
In-Reply-To: <87tui6yozj.fsf@ungleich.ch>
References: <XhEJRjPvvlk57PFUWApI0RPX2-dCuDbQ9RYxw9Y5GxzMs8YEpwVc4U-fR3avC-NT1X2UlBNQerMkOxgqrue_EEOtyZR18V329KuKev_i3aE=@protonmail.com>
 <877df2d5px.fsf@ungleich.ch> <20210927071130.GA13681@wolff.to>
 <20210927123439.7a551913@nvm> <20210927091435.GA10234@wolff.to>
 <20210927143628.36c2ceab@nvm> <20210927102157.GA23755@wolff.to>
 <d071a9ed-a1cf-4b4c-85ba-8a918a6e331a@www.fastmail.com>
 <87tui6yozj.fsf@ungleich.ch>
Date: Mon, 27 Sep 2021 16:37:18 +0000
From: StarBrilliant <coder@poorlab.com>
To: "Nico Schottelius" <nico.schottelius@ungleich.ch>
Cc: wireguard@lists.zx2c4.com
Subject: Re: WireGuard with obfuscation support
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

On Mon, Sep 27, 2021, at 15:59, Nico Schottelius wrote:
>=20
> StarBrilliant <coder@poorlab.com> writes:
>=20
> > On Mon, Sep 27, 2021, at 10:21, Bruno Wolff III wrote:
> >> If your ISP is blocking your Wireguard traffic call them up and com=
plain.
> >
> > All ISPs in China is blocking Wireguard traffic. If you call any of
> > them up, you will end up in jail. There was a case where one user su=
ed
> > their ISP for blocking Google, and got prosecuted until disappear in
> > public.
> > [...]
>=20
> I'm not sure how much wireguard depends on the IP/UDP layers, but
> assuming it only uses it for payload, maybe it makes sense to
> wrap wireguard into HTTP, HTTPS, SMTP (+TLS), IMAP(S) or even DNS
> (slow). I am aware that there is a variety of tools out there that
> handle some of the tunnel ideas.
>=20
> Given that all of these approaches are actually rather trivial to
> implement, is there any easy way to grab the outgoing wireguard packets
> without the need of creating n artifical local UDP endpoints?
>=20

For your first question: There have been multiple success stories for pl=
uggable obfuscation layers: One from Tor Project, another from V2Ray. Th=
ey proved even if any single obfuscation is not mature, as long as new o=
bfuscation plugins emerge way way faster than their statistical model tr=
aining speed, this cat-and-mouse game can win. So no worries about this =
question.

For the second question: This is very important because current Wireguar=
d has huge pain with obfuscation plugins.
* Firstly, Wireguard cannot bind to localhost only. Using iptables to re=
strict access does not avoid port number wasting.
* Second, Wireguard can't use Unix socket for transport -- there are onl=
y 65535 UDP ports, it is not economic to waste a dozen of them just for =
connecting to an obfuscation plugin located at localhost.
* Last but not least, Wireguard relies on certain end-to-end features: I=
f the a fragmented IP packet arrives, which is a feature that some obfus=
cation plugin relies on, Wireguard's kernel implementation will behave s=
trangely. Also Wireguard needs to know the endpoint IP address to perfor=
m roaming.

Previously we prefer to patch the Go version because the above three iss=
ues are almost impossible to solve in kernel space. But the Wireguard up=
stream is going to deprecate the Go version on Linux platforms, which wo=
uld not be a good news for the obfuscation world.

If Wireguard supports listening onto a Unix socket and plugin protocols =
like =E2=80=9CHAProxy protocol=E2=80=9D, or =E2=80=9CTor FTE protocol=E2=
=80=9D or =E2=80=9CShadowsocks SIP003 protocol=E2=80=9D (not sure which =
can work with UDP), then obfuscation plugins can happily work with Wireg=
uard.
