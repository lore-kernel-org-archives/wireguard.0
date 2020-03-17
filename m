Return-Path: <SRS0=h/53=5C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5705CC2BB1D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Mar 2020 17:24:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED3AC20663
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Mar 2020 17:24:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="Ui/bLRDi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED3AC20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=riseup.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10b45358;
	Tue, 17 Mar 2020 17:18:04 +0000 (UTC)
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ab564b49
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Mar 2020 01:45:54 +0000 (UTC)
Received: from bell.riseup.net (unknown [10.0.1.178])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "*.riseup.net",
 Issuer "Sectigo RSA Domain Validation Secure Server CA" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 48hGPZ6Sp2zFcZ4
 for <wireguard@lists.zx2c4.com>; Mon, 16 Mar 2020 18:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1584409922; bh=yrEw0nCwtw0jpiRAg1xFkhQBO0XJk1SnvH08nRJ+atU=;
 h=Date:From:To:Subject:From;
 b=Ui/bLRDi10wFosn3ZjivsVc5b9iV62rs2A/GdnAA3Zvi7NLn/atC+ZxqaxDviir/S
 SlybiOLuwpJVHKW6+rqJI96oJfyr14Sovsd54R6EgRaKrraNRcoQtYQ3G6T5tazbxk
 dI4bWVEQI5AdK2SaXYzDvV7DfrTU81gQFgU7jU/4=
X-Riseup-User-ID: 508EA070DB7354C7F5B45F383AD8D118EC81BD9A9ECB5E932E8351284ADF4225
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by bell.riseup.net (Postfix) with ESMTPSA id 48hGPY6sFzzJsZ4
 for <wireguard@lists.zx2c4.com>; Mon, 16 Mar 2020 18:52:01 -0700 (PDT)
Date: Mon, 16 Mar 2020 21:52:01 -0400
From: Sukhbir Singh <yamailinglist@riseup.net>
To: wireguard@lists.zx2c4.com
Subject: Adding comments for a peer through wg set
Message-ID: <20200317015201.GA384449@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 17 Mar 2020 18:18:02 +0100
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

Hi,

When adding a new peer through `wg set', it seems like there is no way
to include comments in the parameters. To solve this, the hack I use
involves making sure SaveConfig is set in wg0.conf, adding the peer,
`wg-quick save' and then appending the desired comment to the end of the
wg0.conf file. This helps me add the peer without taking down the tunnel
and also saves it to the config.

Is there a better way? Note that I tried adding the comments to the
different parameters (using "#") but it didn't work as expected.

What's the reason for adding comments? So as to keep some notes about
the peer I added, like "[Peer] ... # laptop config". So if there is a
better solution for key management, please do share.

Thanks.

-- 
Sukhbir
