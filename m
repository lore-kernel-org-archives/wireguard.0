Return-Path: <SRS0=h/53=5C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23405C1975A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Mar 2020 18:35:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 877B020714
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Mar 2020 18:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=aixah.de header.i=@aixah.de header.b="qYOVR1ge"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 877B020714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aixah.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93f67a31;
	Tue, 17 Mar 2020 18:28:52 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fcf01126
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Mar 2020 18:28:49 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 48hhfv0WFtzQlGH;
 Tue, 17 Mar 2020 19:35:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aixah.de; s=MBO0001;
 t=1584470101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GbQs187cRZTOkAW0RbjP8Imy6caFzFJOfI8sBA8Gp3g=;
 b=qYOVR1gePDx3IN3GNZyE5RoMuu9m/8HobKLP9Ag2nmP6rGipFCXdiIDJT0Jk05MUiKlBF6
 YsuCK9kFmU+zSUlg8rOw8fq20QqOctU9vJDlqfqBffrJtqDU0qe69/voED1KRi3EQWoLkP
 R0NK6JwJxf+EQI6obD4BaiH7h1z6mDGkPfZPT6nbXMUUr8Eg34OKVclouBYm2mg+ES4t5P
 4faMjTmpacBgiwAC//L4kua4uZxOr5G13VUiD0X7d3sFWYRj4lENA+qMYgHEHPe6KkwT10
 HtB3Ny8O2O6UmjPOQK6Vv/RSJ4xUpAMegYz8zTTNGccBCpxRD0roFUDOqN2TxA==
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id dd02i1FohIeS; Tue, 17 Mar 2020 19:35:00 +0100 (CET)
Date: Tue, 17 Mar 2020 18:34:59 +0000
From: Luis Ressel <aranea@aixah.de>
To: David Steinn Geirsson <david@isnic.is>
Cc: wireguard@lists.zx2c4.com
Subject: Re: 'wg syncconf' and interface addresses
Message-ID: <20200317183459.4m4zlie3w3ga2lrv@vega>
Mail-Followup-To: David Steinn Geirsson <david@isnic.is>,
 wireguard@lists.zx2c4.com
References: <582744509.1200952.1584461614719.JavaMail.zimbra@sirona.isnic.is>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <582744509.1200952.1584461614719.JavaMail.zimbra@sirona.isnic.is>
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

On Tue, Mar 17, 2020 at 04:13:34PM +0000, David Steinn Geirsson wrote:
> Is Address a valid key for WireGuard configuration, and if so should the wg tool not parse and apply those changes as well?

The wg-quick script uses an extension of the wg config file format, with
config keys such as Address which aren't recognized by wg.

If you wish to use a config file with both wg-quick and wg, you can use
the "wg-quick strip" verb to remove wg-quick options from the config
file. In some shells such as bash, this can be done quite comfortably:
$ wg syncconf wg0 <(wg-quick strip wg0)

Cheers,
Luis
