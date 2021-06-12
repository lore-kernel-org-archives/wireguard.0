Return-Path: <SRS0=vW0l=LG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC85C48BE5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 12 Jun 2021 10:59:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1274361376
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 12 Jun 2021 10:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1274361376
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1fe79351;
	Sat, 12 Jun 2021 10:57:45 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3e961113
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 Jun 2021 10:57:43 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 8E23F240029
 for <wireguard@lists.zx2c4.com>; Sat, 12 Jun 2021 12:57:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1623495463; bh=z+g3z7BlpxcbZaEv89Lgz+aTl6JD67VvGmrzWevIYRs=;
 h=To:From:Subject:Date:From;
 b=GvWXqjyPwsOmvWVDdFYVbr7R+JiA+Nh+uk4Tinh/dmtJbkTSjsYoFFmJoijWPDk48
 z/kvTRzQCBeArQHPGPYpxSrm/WM7gehag08SMAnhSTTIjYLSrOMQiVYmm/f+RM3jL0
 sAjiQILQolH702gShc/RFkfdpM2FuQqEBaySJxsKrWwQHy9o/PBAmOKn74IMlRswut
 L2Lw7EoWhQeuz56DmtwU4aU3tCek4fsCz1BA+rpViNycTvfrBxHAnIKhXO/QOWFjNg
 YjT++8OOIlFDkbjkwn2d3zPX6lNspL4eai2p/GpjyWfkd0YGaiYvfqhvoqWACFfE27
 MVHRDOdxKzTog==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4G2F6V5BfGz9rxM
 for <wireguard@lists.zx2c4.com>; Sat, 12 Jun 2021 12:57:38 +0200 (CEST)
To: wireguard@lists.zx2c4.com
From: Eicke Herbertz <wolletd@posteo.de>
Subject: [wg-setup] my scripts to manage WireGuard networks
Message-ID: <e1911912-9c1c-5aca-95ab-ed8ab74624f4@posteo.de>
Date: Sat, 12 Jun 2021 10:57:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi folks,

I want to share with you my `wg-setup` project that I use to manage my
WireGuard servers and also setup Linux clients.
These are CLI tools written in Bash (with some awk, of course), which
already is a dependency of wg-quick. They are also aware of
systemd-networkd and will use it instead of wg-quick, if it's enabled.

It's main point is to keep the interface and config files in sync and to
enforce unique hostnames, which are embedded into comments and don't
depend on external files. I use this to generate DNS zones.

There's no additional transmission involved. The client setup script
generates a local key and prints a command that has to be executed on
the server manually or by any automation of choice.

Check out the setup example in the Readme:
https://github.com/WolleTD/wg-setup

---

Eicke Herbertz
