Return-Path: <SRS0=n59I=76=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655B6C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:13:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C67520679
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jun 2020 08:13:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="ITRTD119"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C67520679
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a359d2b;
	Wed, 17 Jun 2020 07:55:51 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 107586bd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 07:55:49 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 152c23ac
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 07:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=vq1nGnlrEhitEsRNXgdwS6k8gU4=; b=ITRTD1
 19AzZZqJk1WJJkjCaLB1A4s/92gOSnsKKVInEeZAsLjMlInpwSYl3wMPI8O6EI6f
 LVnkgr1+aXP1tZtLsMaQoYbEAPva83I3yZT3q1+MYK+dLVDaceQBAoLDi1yLR1IM
 Z2z7RYG/zj1d9e7ooZ2JwrCsDrB6UFpd9iK8nJnX0rsWHYcbBoTD6O3r/kXVcJ7T
 a9s/FGn+MyGnOTxQ7TcDdRLGgxzj58RkQO3SibBycRn8566aqBq1V8xBlNXYJ7NF
 QbkXwsILZtcPouZ74loxj0zoZxpsT/dDXN1asogzl+rnQfFwT1Hfch7EKUmjoacr
 f0u/HL7WTl1XsvPQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a21fadfe
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jun 2020 07:55:48 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id r2so1766424ioo.4
 for <wireguard@lists.zx2c4.com>; Wed, 17 Jun 2020 01:13:52 -0700 (PDT)
X-Gm-Message-State: AOAM533PcGgLCptWJfTDkKDJ/5ZJC1uPuaUpzjDv99S9CC+MfuXd1LFb
 Ttbkj46Q3GTRVMAnS6ynBGIFWAwjggW82r5PjRQ=
X-Google-Smtp-Source: ABdhPJy5mxmp0pctnD/7rk+9x8i0J2m2/izAh569OIbLJPD0Qwlb4+D6VqLWLt7AShv/2o9hfBe3wCSV84z7LWXtQN0=
X-Received: by 2002:a6b:4e1a:: with SMTP id c26mr6994041iob.25.1592381631989; 
 Wed, 17 Jun 2020 01:13:51 -0700 (PDT)
MIME-Version: 1.0
References: <56455548-76ff-1f8e-9aff-e0bd45d8daa3@gmail.com>
In-Reply-To: <56455548-76ff-1f8e-9aff-e0bd45d8daa3@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Jun 2020 02:13:41 -0600
X-Gmail-Original-Message-ID: <CAHmME9r_vFvTGb8WWKzC_RRnfJMjDLu23_jim8OAniOaC2prbA@mail.gmail.com>
Message-ID: <CAHmME9r_vFvTGb8WWKzC_RRnfJMjDLu23_jim8OAniOaC2prbA@mail.gmail.com>
Subject: Re: Problems with Ubuntu 16.04 kernels and wireguard 1.0.20200611
To: Gregory ORIOL <fortin81@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Andy Whitcroft <apw@canonical.com>, unit193@ubuntu.com, 
 Ubuntu Kernel Team <kernel-team@lists.ubuntu.com>
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

Hi Gregory,

On Wed, Jun 17, 2020 at 2:01 AM Gregory ORIOL <fortin81@gmail.com> wrote:
> Since commit e24c9a9265af40781fa27b5de11dd5b78925c5be to
> wireguard-linux-compat with a fix for some Ubuntu versions, we are
> experiencing a problem with some older, but still LTS, versions of
> Ubuntu 16.04: older kernels 4.4.0-148, 4.4.0-166 fail to build with
> wireguard 1.0.20200611
>
> So, any system running an (or still having an installed) "older" kernel
> and doing an apt upgrade to install wireguard 1.0.20200611 would fail
> during the wireguard dkms step, while trying to build wireguard for all
> the kernels available.
>
> The problem gets more problematic when a newer kernel 4.4.0-184 gets
> installed with the same apt upgrade: then, trying to downgrade wireguard
> also fails; none of the 1.0.20200611 or 1.0.20200520 versions work
> anymore with this combination of old/new kernels...
>
> To recap :
> # wireguard 1.0.20200520
>  - ok with kernels 4.4.0-148, 4.4.0-166
>  - fails with kernel 4.4.0-184
> # wireguard 1.0.20200611
>  - fails with kernels 4.4.0-148, 4.4.0-166
>  - ok with kernel 4.4.0-184
>
> (nb: we see it now with -184 but it could have started with an earlier
> version)
>
> We could partially fix this by manually getting each deb/src and doing
> dkms install:
> dkms install wireguard/1.0.20200520 -k 4.4.0-148-generic
> dkms install wireguard/1.0.20200611 -k 4.4.0-184-generic
> ...
> But apt upgrade is still broken.
>
> While we could boot onto the newer kernel and remove the older ones to
> get rid of the problem, this situation would prevent from having a
> "previous working" kernel on the system, which is not very safe.
>
> Could there be a fix for this made to wireguard-linux-compat for those
> versions?

Unfortunately, I don't have a super good solution for you right now.
The wireguard-linux-compat repo is developed against the latest Ubuntu
kernels that they put out once every three weeks. You can see them
being tested at the bottom of
<https://www.wireguard.com/build-status/>. The backport against
upstream mainline kernels is z-granular (for an x.y.z versioning
scheme), but Ubuntu's release cycle and versioning scheme is a bit too
chaotic to make it reasonable to try to manage all the differences
between their kernels every three weeks. So for distro kernels --
Ubuntu, RHEL, Debian, etc -- we typically just develop against the
latest one, and try to make sure that we release it at the right time
so users aren't caught with no working version. This means,
unfortunately, that when there are badly breaking changes, like in
this last cycle, you have to uninstall the old kernels or mask them
from dkms, in order to get dkms to avoid building for them and only
building for the new kernel. There might be other more complicated
solutions that closely track version dependencies or do compile time
feature probing, but that comes with a maintenance burden far too
arduous for a distro frankenkernel.

But there is hope!

Canonical is adding WireGuard to 18.04 and 16.04, and this is coming
in two steps:

Step 1) The wireguard-dkms and wireguard-tools packages will be added
to the package archives, so that you won't have to use the PPA. This
means that Canonical's kernel team will include wireguard-dkms in
their development tests, so that they won't accidentally ship kernels
with build breakage, like what you experienced last week.

Step 2) The wireguard-dkms package will get built by Canonical,
signed, and shipped alongside the other modules, so that you won't
have to install wireguard-dkms, and it will just come out of the box
with the normal kernel updates. This is already the case with 20.04
and 19.10. They're working on it now for 18.04, and I really really
hope to see that happen by the next cycle. And maybe if we ask apw
(CC'd) nicely, he'll even do it for 16.04 too.

Regards,
Jason
