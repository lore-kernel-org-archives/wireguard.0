Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47A2C04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:39:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D5C9206BF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:39:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=email.cz header.i=@email.cz header.b="BMcaMRTQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D5C9206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=email.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6e84921;
	Mon, 6 May 2019 20:39:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 287c4d1c
 for <wireguard@lists.zx2c4.com>; Sun, 7 Apr 2019 20:11:58 +0000 (UTC)
Received: from mxe1.seznam.cz (mxe1.seznam.cz [IPv6:2a02:598:a::78:34])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b959c2b
 for <wireguard@lists.zx2c4.com>; Sun, 7 Apr 2019 20:11:58 +0000 (UTC)
Received: from email.seznam.cz
 by email-smtpc2b.ko.seznam.cz (email-smtpc2b.ko.seznam.cz [10.53.13.45])
 id 77ba668384d9eb0373801f61; Sun, 07 Apr 2019 22:14:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=beta;
 t=1554668074; bh=jsEWpTHtt1dCf3m7AUhjE3KB32/WRROwqYFP25bYGy0=;
 h=Received:From:To:Subject:Date:Message-Id:Mime-Version:X-Mailer:
 Content-Type;
 b=BMcaMRTQxJMtwNcqv74aUKcw4U+ggAjPf3xaxS8fBHr9wuclKSRW2oydvKzOfChv3
 BM9XzmfA9hyT54YJ0147vZ47RBM+CiMbv+6UKe9YF2k9GEtIq1/1UKFhqJviLegb1Z
 65/iDsBp05JXxdZWkguzOuRJ4Ow9IcQQVUWwu2p0=
Received: from unknown ([::ffff:83.167.254.58])
 by email.seznam.cz (szn-ebox-4.5.351) with HTTP;
 Sun, 07 Apr 2019 22:14:31 +0200 (CEST)
From: <rybar92@email.cz>
To: <wireguard@lists.zx2c4.com>
Subject: Will the Windows application support Split tunneling?
Date: Sun, 07 Apr 2019 22:14:31 +0200 (CEST)
Message-Id: <3F{.4Ed}h.1SiY0uVPbT0.1Sgbed@seznam.cz>
Mime-Version: 1.0 (szn-mime-2.0.43)
X-Mailer: szn-ebox-4.5.351
X-Mailman-Approved-At: Mon, 06 May 2019 22:39:06 +0200
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
Content-Type: multipart/mixed; boundary="===============1773300654383195960=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1773300654383195960==
Content-Type: multipart/alternative;
	boundary="=_10b46a9252652e2549331fee=249c1594-2888-530a-b5f6-39ed1a7ab012_="

--=_10b46a9252652e2549331fee=249c1594-2888-530a-b5f6-39ed1a7ab012_=
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hello,




I would like to ask when your Windows application will be ready and if it =

will support Split Tunneling




Thank you.
--=_10b46a9252652e2549331fee=249c1594-2888-530a-b5f6-39ed1a7ab012_=
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div>Hello,</div><div><br></div><div>I would like to ask when =
your Windows application will be ready and if it will support Split Tunnel=
ing</div><div><br></div><div>Thank you.</div></body></html>
--=_10b46a9252652e2549331fee=249c1594-2888-530a-b5f6-39ed1a7ab012_=--


--===============1773300654383195960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1773300654383195960==--

