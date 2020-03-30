Return-Path: <SRS0=1oQw=5P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EFDC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 05:13:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2842A206F6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 05:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2842A206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spam-fetish.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8038c3d;
	Mon, 30 Mar 2020 05:05:19 +0000 (UTC)
Received: from mailout-02.maxonline.de (mailout-02.maxonline.de [81.24.66.23])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7c51cf13
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 05:05:17 +0000 (UTC)
Received: from web03-01.max-it.de (web03-01.max-it.de [81.24.64.215])
 by mailout-02.maxonline.de (Postfix) with ESMTPS id D73F592B
 for <wireguard@lists.zx2c4.com>; Mon, 30 Mar 2020 07:13:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by web03-01.max-it.de (Postfix) with ESMTP id C7EE628A2AC
 for <wireguard@lists.zx2c4.com>; Mon, 30 Mar 2020 07:13:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at web03-01.max-it.de
Received: from web03-01.max-it.de ([127.0.0.1])
 by localhost (web03-01.max-it.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id WTFY1LCjFR_T for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 07:13:06 +0200 (CEST)
Received: from [172.24.68.132] (unknown [81.24.66.208])
 (Authenticated sender: m.muenz@spam-fetish.org)
 by web03-01.max-it.de (Postfix) with ESMTPA id 81A7328A0D5
 for <wireguard@lists.zx2c4.com>; Mon, 30 Mar 2020 07:13:06 +0200 (CEST)
Subject: Re: [ANNOUNCE] WireGuard 1.0.0 for Linux 5.6 Released
To: wireguard@lists.zx2c4.com
References: <CAHmME9qOpDeraWo5rM31EWQW574KEduRBTL-+0A2ZyqBNDeYkg@mail.gmail.com>
From: "Muenz, Michael" <m.muenz@spam-fetish.org>
Message-ID: <dc684a08-340b-5a3c-1a70-06f8a0ac6c58@spam-fetish.org>
Date: Mon, 30 Mar 2020 07:13:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9qOpDeraWo5rM31EWQW574KEduRBTL-+0A2ZyqBNDeYkg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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

Am 30.03.2020 um 04:16 schrieb Jason A. Donenfeld:
> Hi folks,
>
> Earlier this evening, Linus released [1] Linus 5.6, which contains our
> first release of WireGuard. This is quite exciting. It means that
> kernels from here on out will have WireGuard built-in by default. And
> for those of you who were scared away prior by the "dOnT uSe tHiS
> k0de!!1!" warnings everywhere, you now have something more stable to
> work with.
>
> The last several weeks of 5.6 development and stabilization have been
> exciting, with our codebase undergoing a quick security audit [3], and
> some real headway in terms of getting into distributions.
>
> We'll also continue to maintain our wireguard-linux-compat [2]
> backports repo for older kernels. On the backports front, WireGuard
> was backported to Ubuntu 20.04 (via wireguard-linux-compat) [4] and
> Debian Buster (via a real backport to 5.5.y) [5]. I'm also maintaining
> real backports, not via the compat layer, to 5.4.y [6] and 5.5.y [7],
> and we'll see where those wind up; 5.4.y is an LTS release.
>
> Meanwhile, the usual up-to-date distributions like Arch, Gentoo, and
> Fedora 32 will be getting WireGuard automatically by virtue of having
> 5.6, and I expect these to increase in number over time.
>
> Enjoy!
> Jason
>
Hi Jason,


Congrats to this awesom release! I never thought it would walk in that fast.

This will enormously speed up the spread of WireGuard and I'm hoping 
that nobody forgets to keep the code generic so all features will be 
available on every operating system, like FreeBSD (I maintain the plugin 
for OPNsense Firewall). Bit afraid with this hype it will be like FRR 
where most fancy features are linux-only and we (BSD users) can only use 
the basics.

Thanks and keep on rocking! :)


Michael

