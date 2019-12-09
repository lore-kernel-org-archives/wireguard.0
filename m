Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C78ADC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 14:26:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 204B1206E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 14:26:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fastmail.net header.i=@fastmail.net header.b="nZAk4lsy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Wj5DbHF5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 204B1206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fastmail.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b4fb705;
	Mon, 9 Dec 2019 14:25:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eadf0051
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 14:25:50 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6938ba5
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 14:25:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A6BCF22B25
 for <wireguard@lists.zx2c4.com>; Mon,  9 Dec 2019 09:25:49 -0500 (EST)
Received: from imap34 ([10.202.2.84])
 by compute4.internal (MEProxy); Mon, 09 Dec 2019 09:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.net; h=
 mime-version:message-id:date:from:to:subject:content-type; s=
 fm2; bh=PVID392IjQg7l7Cnjt5E8FbvMavqBfbGuDZI+xJy9TY=; b=nZAk4lsy
 XOk+LLm/HL86S/Kk2JTNwS7aH4VjFvK17hTYhVQINd/I7VL+nip+RimXbdx3KPi3
 xF+B4Ba9h6naMZC6iCPEM8fb2sXQyTmnHLxUtXlQRUrUR3DCJSJ/lZArjwZ8Bs0/
 63l6hX29+Z15AbAa5ojl4qyitWXT+nEKb7kO1RLCM+0/Ud8ETOFr33VFIylvU4SI
 i0dktB10Ybp2mHZDxU0fhOVZUpwwnHFu6De0QRlVX31TiRV++SHyrNfFs5gPflwk
 Hh59L/rQVPEkHwafZTUV/Z52GLdnAURBRc4HrVLRc50Px1dDZQaf3WBw5t2xThrP
 WfJ1LRPyxfNCfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=PVID392IjQg7l7Cnjt5E8FbvMavqB
 fbGuDZI+xJy9TY=; b=Wj5DbHF5X1bZ4YnfK+VOMe+41mRQL36XOPz67DfoIxQT2
 iqYsQICFOEspkA+EEFSvH4vgydIR+3H3Myvql0RHqjCw6Ch4UVbBYiGXpPulu1OR
 gxjvlXPLAoDbeUbOqo480D/SMdCbMCUcGb5/vVp7ebaLs6J5vSrfB3WnOZR0cyCp
 OCLDhWJblFJrjmoe2mn0glQ2VkcQ0V/O/KHJh0I+gD302Q0ebEEC/XE9aFuXaatz
 qUixnb7aj1wer1AVJCzay3tcsWL1Dss79DrgrpChjSnVtCBBWryBC8NQLZ6EsOGX
 Uw+LB1UCnucB64nsgWFG6cxaCdc3MeJOuXWZBrolA==
X-ME-Sender: <xms:bVnuXXqT5u_s4Qtm5eZk1ciJu9RzO3e6lkjMySNtdnXQcL7Yb_ZhfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeltddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
 erredtnecuhfhrohhmpehlohhgtggrsghinhesfhgrshhtmhgrihhlrdhnvghtnecuffho
 mhgrihhnpehlfihnrdhnvghtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehlohhgtggrsg
 hinhesfhgrshhtmhgrihhlrdhnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:bVnuXdyVxmaIJILbJgxwCG5XJ8HsdY01hXIRgCQydMKFmlUvjOMOow>
 <xmx:bVnuXQDDS0TcFooMdJ231GKEResXorwxdlbFdxtRh-p4pBv5LaTEBQ>
 <xmx:bVnuXUOi0HxNpd8LO7kqEAdbbhbudjdBo0MGetMMcxwALjnBx1wsiA>
 <xmx:bVnuXVi35T75dtluKKrVHjrawLreCX2ddIqX4N5LwN_9ejncEpKMiw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5651C1460061; Mon,  9 Dec 2019 09:25:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-612-g13027cc-fmstable-20191203v1
Mime-Version: 1.0
Message-Id: <c75aaac4-52bf-4759-aa0b-b67266af4361@www.fastmail.com>
Date: Mon, 09 Dec 2019 09:25:29 -0500
From: logcabin@fastmail.net
To: wireguard@lists.zx2c4.com
Subject: Is this a concern
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Or could it be handled by pre-routing in wg-quick (if it isn't already):

https://lwn.net/Articles/806546/
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
