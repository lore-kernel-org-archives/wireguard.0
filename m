Return-Path: <SRS0=gmne=R2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B7EC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:02:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41253213F2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:02:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=comcastmailservice.net header.i=@comcastmailservice.net header.b="WJoPUxhV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41253213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jgibbons.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f37b640b;
	Sat, 23 Mar 2019 00:01:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc9a1437
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Mar 2019 01:01:49 +0000 (UTC)
Received: from resqmta-po-02v.sys.comcast.net (resqmta-po-02v.sys.comcast.net
 [IPv6:2001:558:fe16:19:96:114:154:161])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 986ae59b
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Mar 2019 01:01:49 +0000 (UTC)
Received: from resomta-po-05v.sys.comcast.net ([96.114.154.229])
 by resqmta-po-02v.sys.comcast.net with ESMTP
 id 6khIhgj9TFWKM6m5whEXWg; Thu, 21 Mar 2019 01:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=comcastmailservice.net; s=20180828_2048; t=1553130128;
 bh=3K8PC5tbF2ZwtJHIXdj/klRzg9u5+53R/8Cz0NgDlGA=;
 h=Received:Received:From:Content-Type:Mime-Version:Subject:
 Message-Id:Date:To;
 b=WJoPUxhVS8vxBcShb6rlRPW159XeogSgcI9DJ1QwNFQiRaMmkzC26iMB3/xl2Qnwy
 KsZGrJlPfH51eP58RfBnrWUyUDIDYhCDkKnvdSdWanlqziU6GL3CYXP4zJFjRVcbfE
 CJu/hwl9vZXwdTmD4rrpFOP4oCxmoc8tfGSDIvUGdEoKkd529sPEIWGiI+rX1zmSbY
 cBkSNSXb2bArowK5Tkw3gJbSwI4AqzrvXAn+9Ba+7zdnzB4KKAoeanXJfduNQdsBcQ
 QME66slElDnWnEz3O2Fr+Rxy8R4JtK10yDUknUltJVXgeFP60aP+RpL/YMTaAP/g+k
 1vLvHgNMpiBpQ==
Received: from [192.168.141.12] ([108.20.200.126])
 by resomta-po-05v.sys.comcast.net with ESMTPA
 id 6m5mhdgSm5czH6m5phP397; Thu, 21 Mar 2019 01:02:06 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgedutddrieejgddvlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucevohhmtggrshhtqdftvghsihdpqfgfvfdppffquffrtefokffrnecuuegrihhlohhuthemuceftddtnecunecujfgurhephfgtgfgguffkfffvofesthhqmhdthhdtvdenucfhrhhomhepkhgrrhhoghcuoehkrghrohhgsehjghhisggsohhnshdrtghomheqnecukfhppedutdekrddvtddrvddttddruddvieenucfrrghrrghmpehhvghloheplgduledvrdduieekrddugedurdduvdgnpdhinhgvthepuddtkedrvddtrddvtddtrdduvdeipdhmrghilhhfrhhomhepkhgrrhhoghesjhhgihgssghonhhsrdgtohhmpdhrtghpthhtohepfihirhgvghhurghrugeslhhishhtshdriiigvdgtgedrtghomhenucevlhhushhtvghrufhiiigvpedt
X-Xfinity-VMeta: sc=0;st=legit
From: karog <karog@jgibbons.com>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Traffic routing with pf
Message-Id: <D4AEDD34-6DEF-4C4A-8542-ECCD260428E1@jgibbons.com>
Date: Wed, 20 Mar 2019 21:01:58 -0400
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.102.3)
X-Mailman-Approved-At: Sat, 23 Mar 2019 01:01:10 +0100
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

Marc,

You might only need to turn on ip forwarding. As a command try:

To read the current value:

sysctl net.inet.ip.forwarding

To set the value:

sudo sysctl net.inet.ip.forwarding=1

To set it on boot, create the file

/private/etc/sysctl.conf

with contents

net.inet.ip.forwarding=1


You will also need a route on your router to direct packets with destination on your wireguard subnet to go the the Mac Mini's ip address.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
