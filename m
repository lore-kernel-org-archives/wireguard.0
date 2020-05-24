Return-Path: <SRS0=/LYe=7G=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73003C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 May 2020 02:15:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD88D20759
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 May 2020 02:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD88D20759
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ebe852f0;
	Sun, 24 May 2020 01:59:53 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 23 May 2020 18:01:39 -0600
References: <CAHmME9oX+8HoK_wAoc5oR9rWenYz4ki8EK+NebQEV2ALZDSrdg@mail.gmail.com>
 <CAEg-Je8HRbwymZqxZJ8ZyGPk3yAG_R9bg7doeO4SdJ_h6Ni-9g@mail.gmail.com>
 <CAHmME9oTr0NF7UUgsxcmqj_R8bQ1HyYH0tpQdtyq84zPou338Q@mail.gmail.com>
 <CAEg-Je8=PEek1d9ZvK9Fqnbm4TOzZU4hKvFL0zVd6k2w0ionvQ@mail.gmail.com>
In-Reply-To: <CAEg-Je8=PEek1d9ZvK9Fqnbm4TOzZU4hKvFL0zVd6k2w0ionvQ@mail.gmail.com>
Message-ID: <CAHmME9rOs221DN_KC4N0MJ+L9grX9Yx1fjypKM9qT-ixgo9oHA@mail.gmail.com>
Subject: Re: Adding Debian, Ubuntu, OpenSUSE, RHEL, CentOS kernels to
 WireGuard CI: Seeking URLs
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Neal Gompa <ngompa13@gmail.com>
Cc: unit193@ubuntu.com, Daniel Kahn Gillmor <dkg@fifthhorseman.net>, 
 Andy Whitcroft <apw@canonical.com>,
 Ubuntu Kernel Team <kernel-team@lists.ubuntu.com>, 
 Martin Hauke <mardnh@gmx.de>, Joe Doss <joe@solidadmin.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Carl George <carl@redhat.com>
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

On Sat, May 23, 2020 at 5:50 AM Neal Gompa <ngompa13@gmail.com> wrote:
>
> On Sat, May 23, 2020 at 3:21 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > Hi Neal,
> >
> > Thanks for these very helpful instructions. In trying to implement
> > this, one snag I encountered was that the .src.rpm file has inside of
> > it the linux-{version}.tar.xz file that I actually want. Is there
> > anywhere on the internet that hosts these .tar.xz files directly?
> >
>
> There *is*, but that starts getting into using the CentOS Git system
> more directly. Per your original email, you weren't interested in that
> path, so I didn't go there.

Well, one trick is that most web git viewers (such as cgit) can
produce a tarball on the fly from a URL. Something like this exist
here?
