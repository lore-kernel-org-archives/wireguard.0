Return-Path: <SRS0=/LYe=7G=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6975C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 May 2020 00:30:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DE1D20787
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 May 2020 00:30:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuqSDmjs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DE1D20787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0c3d5aa;
	Sun, 24 May 2020 00:15:01 +0000 (UTC)
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [2607:f8b0:4864:20::d44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 86d9216c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 May 2020 06:52:51 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id c16so13930255iol.3
 for <wireguard@lists.zx2c4.com>; Sat, 23 May 2020 00:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WjHpHgAjje/A/A8/0/SiKvdTUJ4EN2zjq+GNMxNLVh0=;
 b=HuqSDmjss9V/T26crSn3SXLwGDeVLdAss69a2g2G7fz2Jm8RMlkH4FvclvdCwUMerz
 X2vHNbN1M3liA7uGewslFvWNG0UQlypXTOZSdb9u2MN79OfCJPwdO5GzjA2VIKff4scc
 JVeKxOyCe2mlkF+o0MRqeCae7tFz8CPYr+IoJMIbFKK6SoqEhTkMRXYpZjZHynfkIMK4
 Iw/o0Bzu6fY9wawMxZ9KZ8PDz9HPT2zLGpCwuPRUqV9Nrg1EorAstYYJ1VWFzS3yzGeX
 gO73SxZBJyKrBTbDP/9qjFdVbV7e6KM8EHIkxeTV0GKwrdKC4KFyQJwGrpZmT+hVW+yG
 cSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WjHpHgAjje/A/A8/0/SiKvdTUJ4EN2zjq+GNMxNLVh0=;
 b=rJBODmwhqM06wdsKr4e/km43hPKVGzxtHML7J87HfJ/xFmwkpF1UJvn7Ha7ZtJzIzK
 w5c+rAEltEsmZ0W8ha6om6nx0kfTNrbnxkLJ+PQCNuEpfjktongIWhC+YWFLI+F4Y7pX
 jASOSI/UhObgio4jVEkEoDyyJ74DyzRkQ0mt7xnjCJyQff84bBDQCGvvTpJQBM2bOQR5
 zTcjDZOyAFxUEosLTTIswnXyDdeE91bzi/T6XIOrCghA3XSp8jgsjC5Csn5Fly8mTUcm
 NFVNieHgAeB6LZFE7CALeXQGKhASEw5NC6qGhgEmPRiBw8bELiefXp3zW/koJ1nWAAa7
 s/AQ==
X-Gm-Message-State: AOAM531r6VdE1z4jfBpgsDUhhre5NWc6LjobP9vwVMWpGtbaW6X0L+A5
 yeR/6AYURpCcmJI+mCrXdEUnlARzOKUJp332jsI=
X-Google-Smtp-Source: ABdhPJzsQhL/RKzsZoS+XGOwVSpLTf6ZrrqkGx0HSxum3hAnQkz4UZFVJtl+j2gpW4lBb5/DYyyNX1SC8s8LsfzHFCU=
X-Received: by 2002:a02:3b45:: with SMTP id i5mr9121972jaf.47.1590217660641;
 Sat, 23 May 2020 00:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9oX+8HoK_wAoc5oR9rWenYz4ki8EK+NebQEV2ALZDSrdg@mail.gmail.com>
In-Reply-To: <CAHmME9oX+8HoK_wAoc5oR9rWenYz4ki8EK+NebQEV2ALZDSrdg@mail.gmail.com>
From: Neal Gompa <ngompa13@gmail.com>
Date: Sat, 23 May 2020 03:07:04 -0400
Message-ID: <CAEg-Je8HRbwymZqxZJ8ZyGPk3yAG_R9bg7doeO4SdJ_h6Ni-9g@mail.gmail.com>
Subject: Re: Adding Debian, Ubuntu, OpenSUSE, RHEL, CentOS kernels to
 WireGuard CI: Seeking URLs
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: unit193@ubuntu.com, Daniel Kahn Gillmor <dkg@fifthhorseman.net>, 
 Andy Whitcroft <apw@canonical.com>,
 Ubuntu Kernel Team <kernel-team@lists.ubuntu.com>, 
 Martin Hauke <mardnh@gmx.de>, Joe Doss <joe@solidadmin.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Carl George <carl@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 24 May 2020 02:14:59 +0200
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

On Fri, May 22, 2020 at 4:05 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi distro kernel maintainers,
>
> I currently have build.wireguard.com churning away at every new kernel
> release between 3.10 and 5.5 for each and every wireguard-linux-compat
> commit, making sure that we don't break anything. It's a pretty CPU
> intensive, but it means we don't break mainline kernels ever when
> releasing. Scroll down to the bottom to see what I mean.
>
> This is not the case, however, with distro kernels, which differ
> notoriously from mainline in surprising ways. There's been some
> breakage, and unless we do something about it, I imagine there will
> continue to be much breakage. Because so many users use Linux via your
> kernels, it seems imperative that we support these well. And with
> distros like Ubuntu now supporting WireGuard directly through
> wireguard-linux-compat, it seems ever more important that we minimize
> breakage so as to not create release delays downstream of us.
>
> At the moment, wireguard-linux-compat supports:
> - Debian oldoldstable (8), oldstable (9), stable (10), testing (11), sid
> - Ubuntu 14.04, 16.04, 18.04, 19.04, 19.10, 20.04
> - OpenSUSE 42, 15, 15.2 (leap)
> - RHEL 7.8, 8.2
> - CentOS 8.1
>
> The logic here is that we support the latest single kernel for each
> major supported release of these distros. For example, on Debian
> stable, we support 4.19.0-9 but not 4.19.0-8 anymore.
>
> I'd like to put these on build.wireguard.com to mitigate breakage. In
> order to make this happen, I'll need two things:
> - A URL I can scape that will give me the latest kernel versions for
> relevant distros.
> - A URL I can construct using a selected version to download a boring
> kernel source tarball.
> I would prefer to not involve git, if possible, and for these URLs to
> point to the sources for actual kernels that are shipping as the
> standard latest-kernel for each of the above releases.
>
> If you can provide those pieces of information for my CI scripts, it
> seems likely that we can drastically reduce breakage for your
> distribution frankenkernels. If you cannot provide that, but other
> distros can, I will probably naturally prioritize support for those
> other distros that make maintenance easier, simply as a matter of
> habit rather than something intentional.
>

For CentOS kernels, you can query the kernel builds that have been
made for CentOS 7 and CentOS 8 by requesting the list of tags from the
kernel package[1].

The Pagure API[2] provides a straightforward way to do this, even with
curl and jq:

$ curl --silent --header "Content-Type: application/json" \
https://git.centos.org/api/0/rpms/kernel/git/tags | jq '.["tags"] '

This will return a JSON list of tags. For CentOS 7, you'd want the
tags beginning with "imports/c7/". For CentOS 8, you'd want the tags
beginning with "imports/c8/". The string after the prefix is the NVR
(name-version-release) of the package, and is the main part of the
Source RPM file name. The highest NVR in each tag namespace is the
latest package. There are various ways to do the comparison, but the
simplest one would be to sort them with the highest number on top, as
the numbers are guaranteed to numerically advance. I'm not good with
jq, so I couldn't figure out how to do it as a one-liner.

Sources are shipped in the form of Source RPMs and pushed to the
CentOS Vault[3][4]. Sources are archived at each CentOS point release,
meaning that you need to be aware of the CentOS point release where
the kernel was shipped.

So for example, for CentOS 7.8, you'd be looking at the following
locations for source packages:
* http://vault.centos.org/7.8.2003/os/Source/SPackages/
* http://vault.centos.org/7.8.2003/updates/Source/SPackages/

CentOS 8.1 is a bit simpler, with only the one location:
http://vault.centos.org/8.1.1911/BaseOS/Source/SPackages/

With the information from the API and knowing the location of where
the packages are, you can fetch a kernel source package like so:

$ wget http://vault.centos.org/8.1.1911/BaseOS/Source/SPackages/${kernel_ve=
rsion_release}.src.rpm

All the stuff in the source RPM is enough to rebuild the kernel. If
you just want to grab the tarball inside, then you can grab it by
unpacking the Source RPM and grabbing the tarball inside.


[1]: https://git.centos.org/rpms/kernel
[2]: https://pagure.io/api
[3]: http://vault.centos.org/7.8.2003/
[4]: http://vault.centos.org/8.1.1911/



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
