Return-Path: <SRS0=1oQw=5P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16ECCC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:17:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5403F20733
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:17:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="hcUAEyrq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5403F20733
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0c7f392;
	Mon, 30 Mar 2020 02:09:10 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8da195d0
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 02:09:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d99aa27
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 02:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=s4shi4
 ZVWiz92TZ+o6Sj7jwFM44=; b=hcUAEyrqE3c51OUwTXJj+BVySgMwXWhwREeQc/
 RIKurHgAfHkSrQ5zbdGZyxmMhRT/fLbFhxuxdEKy9yDsAasvtaphL1ruSFrQrDQ8
 aihvo78sPZOKQHRlKKnw1b8CkWXU9tbfJhPrBQYpoKEu6lBg7QlNMeC9mM9FjoI+
 wP2uxEVWMG27R7937GTimthoFGs1ZCBId6MRWSLJKCXpfBfh6bwKvj5dQLriYFFl
 C3CpOzl+iOEitOha7fRshpytwzIv0j/1CcdUCNka7tRNcmkrO02XHyH+cnU06mZJ
 CuGMJAUq//D4odB/5iMVvu6jFc0araRKoGUO6frIR6Xs/YtQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 76ea52b5
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 02:09:04 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id o3so10540709ioh.2
 for <wireguard@lists.zx2c4.com>; Sun, 29 Mar 2020 19:16:55 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3JeDMZgZwTkJYua7LV4kLECUtSYlDnXWb5O2IiMUe4vgUCD8C3
 fYtcwrWlk2i1sHyIEQpb5oNwGBTydywgcdNgneQ=
X-Google-Smtp-Source: ADFU+vvSl2Xx/HxMX3Cgop4EpUxhl5B+SmVC05RHjdrqsvQc7zMmkGEyTOrq05cTSug5aV6axxvHjdm2BVzta3CuBe0=
X-Received: by 2002:a5d:954c:: with SMTP id a12mr8590881ios.25.1585534614416; 
 Sun, 29 Mar 2020 19:16:54 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 29 Mar 2020 20:16:43 -0600
X-Gmail-Original-Message-ID: <CAHmME9qOpDeraWo5rM31EWQW574KEduRBTL-+0A2ZyqBNDeYkg@mail.gmail.com>
Message-ID: <CAHmME9qOpDeraWo5rM31EWQW574KEduRBTL-+0A2ZyqBNDeYkg@mail.gmail.com>
Subject: [ANNOUNCE] WireGuard 1.0.0 for Linux 5.6 Released
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Earlier this evening, Linus released [1] Linus 5.6, which contains our
first release of WireGuard. This is quite exciting. It means that
kernels from here on out will have WireGuard built-in by default. And
for those of you who were scared away prior by the "dOnT uSe tHiS
k0de!!1!" warnings everywhere, you now have something more stable to
work with.

The last several weeks of 5.6 development and stabilization have been
exciting, with our codebase undergoing a quick security audit [3], and
some real headway in terms of getting into distributions.

We'll also continue to maintain our wireguard-linux-compat [2]
backports repo for older kernels. On the backports front, WireGuard
was backported to Ubuntu 20.04 (via wireguard-linux-compat) [4] and
Debian Buster (via a real backport to 5.5.y) [5]. I'm also maintaining
real backports, not via the compat layer, to 5.4.y [6] and 5.5.y [7],
and we'll see where those wind up; 5.4.y is an LTS release.

Meanwhile, the usual up-to-date distributions like Arch, Gentoo, and
Fedora 32 will be getting WireGuard automatically by virtue of having
5.6, and I expect these to increase in number over time.

Enjoy!
Jason


[1] https://lore.kernel.org/lkml/CAHk-=wi9ZT7Stg-uSpX0UWQzam6OP9Jzz6Xu1CkYu1cicpD5OA@mail.gmail.com/
[2] https://git.zx2c4.com/wireguard-linux-compat/
[3] https://lore.kernel.org/netdev/20200319003047.113501-1-Jason@zx2c4.com/
[4] https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/focal/tree/debian/dkms-versions?h=master-next
[5] https://salsa.debian.org/kernel-team/linux/-/tree/master/debian%2Fpatches%2Ffeatures%2Fall%2Fwireguard
[6] https://git.zx2c4.com/wireguard-linux/log/?h=backport-5.4.y
[7] https://git.zx2c4.com/wireguard-linux/log/?h=backport-5.5.y
