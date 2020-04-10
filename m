Return-Path: <SRS0=O5R5=52=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	PDS_TONAME_EQ_TOLOCAL_SHORT,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F79AC2BB55
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 Apr 2020 08:01:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0487C20753
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 Apr 2020 08:01:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=aixah.de header.i=@aixah.de header.b="QzcMWfZH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0487C20753
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aixah.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa59fe17;
	Fri, 10 Apr 2020 07:52:03 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1912fefe
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Apr 2020 07:52:00 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 48z9SX1RsMzKmcD;
 Fri, 10 Apr 2020 10:01:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aixah.de; s=MBO0001;
 t=1586505674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qnScf4lhWyF+ngtUz2vnvIxGjnoGZ3xEqB2Mx6E4DLU=;
 b=QzcMWfZH02mLmp/xvikIbiEFuYDtb7mDyRc/jonplWzBcPMi8CCnN0BBp65vp8dVJEm6fA
 JD3YGshTbqgp7urRJdr+MMZQ0M4WrN26tb2GRN8VqpBWV8o31u/xpWIkqxuzu+gbwUp+Kf
 toLx7Vt4uuQgCCJ+IqTsIeoxNX8kem2gJgrjJ+xGUTP+JakGkGGDFlOURK1pmdjvVg0FR+
 QnLBXF3bChkiNrf5Fecvmzu0pkpCyJ8G4/frcGhsJthD42wPbT5wVt6uW9ax9uocBiW5ct
 dht1aXkGW7AIxkeBEvSVEPhcH3M5lyCsfdpzCgVv00zRnv83aBbK+6Q7oz9c7w==
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id nP7WZXc-uwrQ; Fri, 10 Apr 2020 10:01:13 +0200 (CEST)
Date: Fri, 10 Apr 2020 08:01:12 +0000
From: Luis Ressel <aranea@aixah.de>
To: xtus <xtus@nexmanti.net>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: wg set fail to update endpoint if traffic is flowing
Message-ID: <20200410080112.qyltsntafey7asdy@vega>
Mail-Followup-To: xtus <xtus@nexmanti.net>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
References: <i2UwKoKpd7CcDmlKuf5GHwFTjVhsyWaKbbI_QaLQ5yjGbpBkH7klwefEhR8B7TICn7B4uguk3sK23sExHYpQFUX9txdU-RDQR7w0bCuNj4E=@nexmanti.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <i2UwKoKpd7CcDmlKuf5GHwFTjVhsyWaKbbI_QaLQ5yjGbpBkH7klwefEhR8B7TICn7B4uguk3sK23sExHYpQFUX9txdU-RDQR7w0bCuNj4E=@nexmanti.net>
X-Rspamd-Queue-Id: 437B41772
X-Rspamd-Score: -2.91 / 15.00 / 15.00
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

On Tue, Mar 31, 2020 at 08:36:52AM +0000, xtus wrote:
> The set endpoint works only if no traffic is flowing.
> 
> Is this expected behavior?

Yes, it is. It's not that wg set fails to update the endpoint; rather,
the endpoint you've set is immediately overwritten again -- to support
seamless roaming, wg updates the endpoint every time it receives an
authenticated packet from a peer.


Luis
