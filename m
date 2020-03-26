Return-Path: <SRS0=1oQw=5P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C933C2D0EE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:24:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 152B320578
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:24:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=mutualaid.info header.i=@mutualaid.info header.b="Mo8ySo0E";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Jd6ogpLx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 152B320578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mutualaid.info
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a50b958b;
	Mon, 30 Mar 2020 02:10:51 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 01197481
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Mar 2020 01:24:32 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 9A6083F9
 for <wireguard@lists.zx2c4.com>; Wed, 25 Mar 2020 21:31:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 25 Mar 2020 21:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mutualaid.info;
 h=from:content-type:content-transfer-encoding:mime-version
 :subject:message-id:date:to; s=fm1; bh=Lrvjao2TV+W79XHcadOrOjJnj
 PEeXi9Qi/lHoa7J4FY=; b=Mo8ySo0EzYlSPb8htnFWaHD54K5GF5gQkcunU7rtC
 e83ywZftXAl2S/lHmNV+B4yiasxH1JVLE9QmeBgjVxQlftpUzZoVYhtRZuAkm+do
 UybtMd63g7f6x74JuXTaO5v2xSYjHbR4eE8U6XrrDJgupP0SptYdoVSjxF3ies7z
 w6vAcXk384cozrn2Tm9hLLVWaKc7CPttkXkwipk0ZUCUl1RH+UBgukjx5a31/YsV
 xfu/vR5yB4sq79f9Rc3XubXwRk3faKkMiIRTLYNcX096wzUMjkj70mXFQPl2TCYg
 WFo2OCRKh3sUyAdLHlalxKYJT60FEaV8vR1YSnRLg2cuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Lrvjao
 2TV+W79XHcadOrOjJnjPEeXi9Qi/lHoa7J4FY=; b=Jd6ogpLxoxPENA8+uDwFDr
 e100QbL8/7oJtOrEJhn3cMWJ+TcCCcsB6m9yv9GelqtPgk6Gl0QuDOCFRP+1Up+0
 MDNBLd0DgYBeFUYSWYn2vzUWZybeanlzDlpiBCq0YPtLX6Lu8mQF1lZYh/p/cYXy
 i+NQxpGx2FbqAg66qftHTKWLCRavRcG6eKB3RU4Xuo/P+BMQs3Iu2nQ6COPNbv+6
 B6nrUPlO0rwE7ChJoXpDpCrix5IbYl0+RpH2rcvrl3wfrxjLKVNKpNXRKAdPff3K
 wb6hbE6n9RQVqGsrlSKq6SPMKk3To0N4wpf0X43nBxE8ZznQawJxciJmI4fAirJQ
 ==
X-ME-Sender: <xms:BQZ8XjYTiM30vi2OVSxMuWGpqX47ueQAa_9K95q5MbWR-abC3pfNMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehhedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhtgfgggfukfffvffosehtqhhmtd
 hhtdejnecuhfhrohhmpeeurhhirghnuceosghrihgrnhesmhhuthhurghlrghiugdrihhn
 fhhoqeenucffohhmrghinhepiiigvdgtgedrtghomhenucfkphepuddtkedrvddtrdektd
 drieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 sghrihgrnhesmhhuthhurghlrghiugdrihhnfhho
X-ME-Proxy: <xmx:BQZ8XhW3JeKSXOsPiaidA987hYzACMKzptjn5IE38RGco9pV2VTCPw>
 <xmx:BQZ8XiBFkl0YunNup1FXJxxitG15nkHaRYQIf67dHNOl9Y4G-xU4jA>
 <xmx:BQZ8XtKexRsgERmAsGkDiThbPzUx8ov0y-UC9EyhEPS045DMXyhp8g>
 <xmx:BgZ8Xq98vea8PDKOFooWm3wx_mOZMQ3X02iwS2gv3hXjEZAzX92d_Q>
Received: from [172.17.100.110] (pool-108-20-80-64.bstnma.east.verizon.net
 [108.20.80.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id A64013280059
 for <wireguard@lists.zx2c4.com>; Wed, 25 Mar 2020 21:31:49 -0400 (EDT)
From: Brian <brian@mutualaid.info>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Support for running as non-root user on OpenBSD with WG_TUN_FD?
Message-Id: <B5A44FC5-FCE3-4A6C-BA82-77173CC2B42C@mutualaid.info>
Date: Wed, 25 Mar 2020 21:31:49 -0400
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3608.40.2.2.4)
X-Mailman-Approved-At: Mon, 30 Mar 2020 04:10:43 +0200
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

Hi there,

=46rom what I can find, I should be able to run wireguard-go as a =
non-root user on OpenBSD, as long as I set the MTU on the interface to =
1420 before starting WireGuard: =
https://git.zx2c4.com/wireguard-go/commit/?id=3D4d5819183e218e040fa0a73df5=
60b4a4a9a768d7

I have the tun2 interface configured with the MTU set to 1420. However, =
I=E2=80=99m seeing the following error when actually running =
wireguard-go as the non-root user:

ERROR: (tun2) 2020/03/24 22:47:37 Failed to create TUN device: open =
/dev/tun2: permission denied

I don=E2=80=99t know Go very well, but it seems like main.go calls the =
CreateTUN function, and CreateTUN (in tun_openbsd.go) tries to open =
/dev/tun2 in read-write mode? There seems to be an option to set the =
WG_TUN_FD environment variable, so that CreateTUNFromFile gets called =
instead of CreateTUN, but I don=E2=80=99t understand how to properly get =
a file descriptor in this context.

Thanks for any insight anyone can provide!

-Brian=
