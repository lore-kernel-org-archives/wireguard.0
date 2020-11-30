Return-Path: <SRS0=v8Vx=FE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE3F4C63777
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Nov 2020 18:38:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5F0520725
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Nov 2020 18:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5F0520725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bestov.io
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 499d2435;
	Mon, 30 Nov 2020 18:31:50 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 86361f65
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Nov 2020 18:31:48 +0000 (UTC)
X-Originating-IP: 79.52.27.94
Received: from localhost (host-79-52-27-94.retail.telecomitalia.it
 [79.52.27.94]) (Authenticated sender: pbl@bestov.io)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 6698560005;
 Mon, 30 Nov 2020 18:38:06 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
From: "Riccardo Paolo Bestetti" <pbl@bestov.io>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, "Phillip McMahon"
 <phillip.mcmahon@gmail.com>
Date: Mon, 30 Nov 2020 19:34:43 +0100
Message-Id: <C7GTC7H55W80.1Q5G2J8EJOFZ4@enhorning>
In-Reply-To: <CAHmME9qAmJt7C7KefU9m-9NkqdmkkGWY34YFwNT0Qm-N_1Tkxw@mail.gmail.com>
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

On Sun Nov 29, 2020 at 9:59 PM CET, Jason A. Donenfeld wrote:
> Alright. Well, if you do think of good reasons why NCO is not a good
> match for unpriv'd WireGuard control, please let me know. The whole
> basis of going that route is the apparent intuition that these two
> types of things, network modification and tunnel up/down, are one and
> the same. But if you have in mind a way where the analogy breaks down,
I had actually never thought about this specifically before this
discussion, but after deploying v0.3 I realized that network
modification and tunnel up/down are /not/ one and the same!

It makes sense that an employee, or even I when running as a non-admin,
would be able to up/down interfaces; but not create, modify or delete
them. It's the same with software: a standard user cannot install it or
uninstall it, but [s]he can use it.

I think this model really works well. I'm happy with it.

Riccardo

