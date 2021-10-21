Return-Path: <SRS0=eD45=PN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562C3C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Oct 2021 15:55:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CFBA60E75
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Oct 2021 15:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CFBA60E75
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6c66045;
	Mon, 25 Oct 2021 15:52:12 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 608eb2b7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Oct 2021 12:37:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 868AE1FD4F;
 Thu, 21 Oct 2021 12:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634819833; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Np8kYZ20rw6yGLe2w7ZwsAh4OKPraEEOMIxOlg87KPE=;
 b=ot1WKH3szUP+Zwe2ssmXm8tXDPsq/ZbihdJxOdU6OvcG2VYrz4k2JEQId9PPmwPJ7kNniv
 f7KcO9NpVc+ls9LOqhFISgTJDTvQbeodecN4QMtJT/psFNTRb4kbzGrhhKbnWtJbDtha9v
 e2WGQUT9M7XND31cQ6KbW27oWi79Ilk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634819833;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Np8kYZ20rw6yGLe2w7ZwsAh4OKPraEEOMIxOlg87KPE=;
 b=kGN8w1egTyoZBU+Hmx2xGUm3JC62MjrNxAo9yoWdLvj5g8xUChYIpDnPZxDxDae6S/qvsY
 Owg0PW01wh0vNDDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 75B2413AA1;
 Thu, 21 Oct 2021 12:37:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WhqTHPlecWEKCAAAMHmgww
 (envelope-from <dwagner@suse.de>); Thu, 21 Oct 2021 12:37:13 +0000
Date: Thu, 21 Oct 2021 14:37:13 +0200
From: Daniel Wagner <dwagner@suse.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: daniel.wagner@suse.com, WireGuard mailing list <wireguard@lists.zx2c4.com>,
 faustin@fala.red
Subject: Re: Build wireguard-linux-compat on SLES15 (s390x)
Message-ID: <20211021123713.a5l6uwfbkx2wxx7j@carbon.lan>
References: <YWFuczOf1dM3B4Pt@falared> <YW6ljZ3yvGsv9Njq@falared>
 <CAHmME9off=sXrL0hjkGvOgJUtJx6oCvhdAycHT=bTQfUtQjO=w@mail.gmail.com>
 <YW/awIN8jqUF0DPk@falared>
 <CAHmME9oL7UNWKbX3ZF-U_O+a9Kwn9gwsexzDQo9gngjhEdgc8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9oL7UNWKbX3ZF-U_O+a9Kwn9gwsexzDQo9gngjhEdgc8Q@mail.gmail.com>
X-Mailman-Approved-At: Mon, 25 Oct 2021 15:52:11 +0000
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

Hi,

On Wed, Oct 20, 2021 at 11:56:49AM -0600, Jason A. Donenfeld wrote:
> Do you think you could chime in here regarding the apparent absence of
> wireguard on s390x? The thread began as a discussion of building it
> yourself there, but I'm wondering why it isn't already there, seeing
> as it's on the other archs.

Sure, let me try to figure out what's happening. I usually try to stay
away from them the distro making business, so it's a bit of a closed
book for me.

> On Wed, Oct 20, 2021 at 3:01 AM Faustin Lammler <faustin@fala.red> wrote:
> >
> > Hi Jason!
> >
> > "Jason A. Donenfeld" <Jason@zx2c4.com>,
> > 19/10/2021 – 17:51:01 (-0600):
> >
> > > Isn't WireGuard already in the SLES kernel?
> >
> > My understanding is that it should, that's why I was surprised to have
> > to build it. But apparently not.
> >
> > This may be related to a specific kernel from IBM LinuxONE cloud
> > infrastructure?
> >
> > | $ uname -r
> > | 5.3.18-24.86-default

This is SLE15-SP2 and the corresponding branch has the patches and the
s390x config does have CONFIG_WIREGUARD=m. So this looks good.

  https://github.com/openSUSE/kernel-source/tree/SLE15-SP2/patches.suse

grep for bsc#1169021 to see the list.

> > But again, my knowledge of SLES is very limited (and s390x architecture
> > even more) so I don't have any idea why this was needed.
> >
> > I'll be happy to help you if you need me to do some tests on the
> > machine.

I see the module is marked as not supported in supported.conf. After
looking at our spec file, I think the modules is packaged into the
kernel-extra rpm. At it might be that you need to enable the not
supported modules explicitly:

from https://github.com/openSUSE/kernel-source/blob/master/rpm/kernel-binary.spec.in

%if 0%{?sle_version} >= 150000
    # By default, loading unsupported modules is disabled on SLE through
    # /etc/modprobe.d/10-unsupported-modules.conf from the suse-module-tools
    # package.
    # modules in kernel-$flavor-extra don't have the supported flag set,
    # yet loading them should be possible if the package is installed.
    # CAUTION PACKAGERS: The file content below must not change between
    # kernel versions, otherwise file conflicts might arise with
    # multiversion(kernel).

    mkdir -p %buildroot/etc/modprobe.d
    cat >%buildroot/etc/modprobe.d/20-kernel-%{build_flavor}-extra.conf <<EOF
# This file overrides the default from 10-unsupported-modules.conf.
# This is necessary to load kernel modules from the
# kernel-%{build_flavor}-extra package.
#
# WARNING: loading unsupported modules may compromise SLE support.
# Please read the comments in 10-unsupported-modules.conf.
allow_unsupported_modules 1
EOF
    echo "%%dir /etc/modprobe.d" >> %my_builddir/kernel-extra.files
    echo '%%config(noreplace) /etc/modprobe.d/20-kernel-%{build_flavor}-extra.conf' >> %my_builddir/kernel-extra.files
%endif

HTH,
Daniel
