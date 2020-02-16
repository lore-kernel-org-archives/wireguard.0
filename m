Return-Path: <SRS0=0UwN=4E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A22C7619B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Feb 2020 15:52:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADB0520729
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Feb 2020 15:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADB0520729
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=usta.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f197ffea;
	Sun, 16 Feb 2020 15:50:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67117c95
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2020 15:50:22 +0000 (UTC)
Received: from scc-mailout-kit-01.scc.kit.edu (scc-mailout-kit-01.scc.kit.edu
 [IPv6:2a00:1398:9:f712::810d:e751])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c6bb99c
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2020 15:50:22 +0000 (UTC)
Received: from hekate.asta.kit.edu ([141.3.145.153] helo=hekate.usta.de)
 by scc-mailout-kit-01.scc.kit.edu with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (envelope-from <schwarze@usta.de>)
 id 1j3MDr-0007bB-GU; Sun, 16 Feb 2020 16:52:44 +0100
Received: from donnerwolke.asta.kit.edu ([141.3.145.61]
 helo=donnerwolke.usta.de) by hekate.usta.de with esmtp (Exim 4.92.2)
 (envelope-from <schwarze@usta.de>)
 id 1j3MDq-0006So-67; Sun, 16 Feb 2020 16:52:42 +0100
Received: from athene.asta.kit.edu ([141.3.145.60] helo=athene.usta.de)
 by donnerwolke.usta.de with esmtp (Exim 4.84_2)
 (envelope-from <schwarze@usta.de>)
 id 1j3MDq-0008PW-0c; Sun, 16 Feb 2020 16:52:42 +0100
Received: from localhost (athene.usta.de [local])
 by athene.usta.de (OpenSMTPD) with ESMTPA id 9c2c047f;
 Sun, 16 Feb 2020 16:52:42 +0100 (CET)
Date: Sun, 16 Feb 2020 16:52:41 +0100
From: Ingo Schwarze <schwarze@usta.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Stephen Gregoratto <dev@sgregoratto.me>, discuss@mandoc.bsd.lv,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH v2] Rewrite wg-quick.8 in mdoc
Message-ID: <20200216155241.GB82002@athene.usta.de>
References: <20200213044921.8115-1-dev@sgregoratto.me>
 <20200215004556.11766-1-dev@sgregoratto.me>
 <CAHmME9pF8QvnOLzRkF0YeATj_AmXALc-eNtyjnrz3yQUvrxV0w@mail.gmail.com>
 <20200216103252.ewt4agdpmvgpndid@BlackBox>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200216103252.ewt4agdpmvgpndid@BlackBox>
User-Agent: Mutt/1.12.2 (2019-09-21)
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

Hi,

i think Jason should simply commit Anthony's work because that's
what i verified in detail (given that it arrived a day earlier).
There is no point in attempting to merge large patches out of the
tree: that would be tedious and error-prone.

Just let Jason do the commits to his own repo.  Discussing commit
messages and adding signed-off lines is a waste of time.

Once the conversion is committed, people can submit smaller patches
to improve things further.  Those will be much easier to review.

Yours,
  Ingo
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
