Return-Path: <SRS0=qVad=5D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9BDC10DCE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Mar 2020 10:43:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CBCE2076C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Mar 2020 10:43:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=aixah.de header.i=@aixah.de header.b="Oyl49oKG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CBCE2076C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aixah.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9525478b;
	Wed, 18 Mar 2020 10:37:03 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c11c2b03
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Mar 2020 10:37:01 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 48j6880xQGzKmfb;
 Wed, 18 Mar 2020 11:43:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aixah.de; s=MBO0001;
 t=1584528198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0vOD26KXAvlFblaDE+9vSepgZZwSe5gKTe+Dm2zG8T4=;
 b=Oyl49oKG/Fxb2i52dryj5FmNx5YW8wb1H7WMkEFC1eZV5Mve2/JqY3VuBMNxWW5cGR83gg
 avnD092QCV7lWSIQLO0mAGaoNNXi0nJTCB4YDC4g/J9p3vinKaBu5IfYSEJQbX9tDXkLUX
 5m4t+AczqLtMYG/mDdXvwVI51STEWaokG2W11+9pcxaJ/ugqT/q6lwCnzWqRVEH1q3WWDZ
 uFRodShO4vsxamMdYHJ0Ey4uJgtcZrNPUH8J6Xe9V53fZ2a+HCItzSaTj0YhuILp6wGQN8
 5zuFU9Cn57laSzS3R1FCQu1KrQxtp83oqJccCVeEILTyyCoHpBMi3w5QkPoEyA==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id H4qVAcvd-HKH; Wed, 18 Mar 2020 11:43:17 +0100 (CET)
Date: Wed, 18 Mar 2020 10:43:15 +0000
From: Luis Ressel <aranea@aixah.de>
To: "J.R. Oldroyd" <wgrd@opal.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Logging
Message-ID: <20200318104315.q6wslbsh7gy2x3bk@vega>
Mail-Followup-To: "J.R. Oldroyd" <wgrd@opal.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20200315141659.771e0088@opal.com>
 <CAHmME9onNwD9+hw2LgzZg_OqN21mOPEyQ9wAsFGjTA6=mK7xgA@mail.gmail.com>
 <20200317083717.14719676@opal.com>
 <20200317181205.ar7762xdewbszu4q@vega>
 <20200318091442.0d45889a@opal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318091442.0d45889a@opal.com>
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

On Wed, Mar 18, 2020 at 09:14:42AM +0100, J.R. Oldroyd wrote:
> First, I should point out that the whole purpose of syslog(3) is
> to do the flexible directing of different daemons' logs to different
> places, including in chroots.

By design, syslog funnels all logs through a single socket. Separating
them again requires matching the contents of log messages, which is
inefficient and error-prone. Getting syslog to work in chroots can be
annoying, since it requires opening the logging socket before chrooting
(which requires support by the daemon), or providing a /dev/log socket
inside the chroot.

That said, I'm aware that syslog is more convenient in some setups, so
offering both stderr and syslog logging sounds reasonable to me.

Cheers,
Luis
