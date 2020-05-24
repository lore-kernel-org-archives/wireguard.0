Return-Path: <SRS0=/LYe=7G=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAED6C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 May 2020 02:15:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8797220759
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 May 2020 02:15:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkcjIPGN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8797220759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 769a3ddf;
	Sun, 24 May 2020 01:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4vNhzsJiI+mIOA6h12itBv1JGu4dNjEWfmCatAqeGvQ=;
 b=WkcjIPGN1JUpIwyzWm2Z2fLIyQV/U5gAJOIthXYazQRZSZWAFqx1xZw5TlHiafhsX/
 CfSk2Jd4YE//aUDA+W3atUtfqxeYVsqyYYFnFzRbagllVdBsUl6Uab9+Djdyx9iNQjQa
 RcfHkZ8OrpgZXJ5sxh3AyYE2YecZQKQUwf4OBpd/Hg9ChN/2hiIKZrGx4ArHJi/I3IQL
 lG5YTICVFLwIo9MX8izB81hNFIOwBvEfbG02kjIm5IyyKNAIwCgZaMz5r4agG5rMn2jD
 dqDy+Cf27s/bv4Y0+DCJStx23BeT52czyD4uoR0lNm6ttFsy6xdqnXTGGNHRSJPWbOxu
 h+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4vNhzsJiI+mIOA6h12itBv1JGu4dNjEWfmCatAqeGvQ=;
 b=phOUlv+GIvJp8/v9eYAG/fwuhosGR1HbOe3H7mKpTDxjRMzFy+S4VB/QD+eLrLdUBQ
 jtLDagCVXf8tDFDRF97xoJfH9Bv4LLtM3/jNIjgBTIFc/n3htaaHAlIywoG+nuY0iW5Q
 l9wnrrzpLp2ikHUvfHoyKV452kNFDnq3NFFo8R6xcKWu9tzUzEq50GRTSLHczQ/mWq+w
 8qQEtwtsjb2TiE4/81x/gPAZqno4dDDaXpqzoLgQmPG79fr5/XnvQSyARFmn81qo/MYV
 UvPPSWxVjDegBNjvlpjIZuoo34IZzmXwjUE/dj9MVHtDs7iTGU/1ISCgBer4d58G9I0q
 +85A==
X-Gm-Message-State: AOAM532IntMhH63fE3Vf6WYrgN4Cmojy/hm3rafnrnBgmEQFeaI+qJOu
 9O+J2NyZSf7z9e2V2qbPckMk/uoikaQ50pI+haD+bTUuHNY=
X-Received: by 2002:a02:3b45:: with SMTP id i5mr11900922jaf.47.1590279671473; 
 Sat, 23 May 2020 17:21:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9oX+8HoK_wAoc5oR9rWenYz4ki8EK+NebQEV2ALZDSrdg@mail.gmail.com>
 <CAEg-Je8HRbwymZqxZJ8ZyGPk3yAG_R9bg7doeO4SdJ_h6Ni-9g@mail.gmail.com>
 <CAHmME9oTr0NF7UUgsxcmqj_R8bQ1HyYH0tpQdtyq84zPou338Q@mail.gmail.com>
 <CAEg-Je8=PEek1d9ZvK9Fqnbm4TOzZU4hKvFL0zVd6k2w0ionvQ@mail.gmail.com>
 <CAHmME9rOs221DN_KC4N0MJ+L9grX9Yx1fjypKM9qT-ixgo9oHA@mail.gmail.com>
In-Reply-To: <CAHmME9rOs221DN_KC4N0MJ+L9grX9Yx1fjypKM9qT-ixgo9oHA@mail.gmail.com>
From: Neal Gompa <ngompa13@gmail.com>
Date: Sat, 23 May 2020 20:20:35 -0400
Message-ID: <CAEg-Je9S3VaTxQSxiCrL_0odK3D1T=MeQ6kcaXBz=ouO4yQK5g@mail.gmail.com>
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

On Sat, May 23, 2020 at 8:01 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Sat, May 23, 2020 at 5:50 AM Neal Gompa <ngompa13@gmail.com> wrote:
> >
> > On Sat, May 23, 2020 at 3:21 AM Jason A. Donenfeld <Jason@zx2c4.com> wr=
ote:
> > >
> > > Hi Neal,
> > >
> > > Thanks for these very helpful instructions. In trying to implement
> > > this, one snag I encountered was that the .src.rpm file has inside of
> > > it the linux-{version}.tar.xz file that I actually want. Is there
> > > anywhere on the internet that hosts these .tar.xz files directly?
> > >
> >
> > There *is*, but that starts getting into using the CentOS Git system
> > more directly. Per your original email, you weren't interested in that
> > path, so I didn't go there.
>
> Well, one trick is that most web git viewers (such as cgit) can
> produce a tarball on the fly from a URL. Something like this exist
> here?

So, CentOS uses a Dist-Git[1] system, which means the part that is
actually tracked in git is the packaging files, and there's an
associated binary repo reference stored in the Git repo for fetching
binary artifacts. Dist-Git is the common ancestor to virtually all
current approaches to storing binaries efficiently alongside a Git
repo (Git-Annex and Git LFS came much later).

It seems it's possible to do this without having to use Git itself
(which is better than with git-annex and git-lfs), but it's a bit
cumbersome...

The way that you'd fetch the tarball in this scenario would be to
something like the following:

1. Get the tags via API, but with commits:

$ curl --silent --header "Content-Type: application/json" \
https://git.centos.org/api/0/rpms/kernel/git/tags?with_commits=3Dtrue \
| jq '.["tags"] '

This gives you now a JSON dictionary with the tags as keys and the
associated commit as values.

2. Get the corresponding commit and fetch the .kernel.metadata file
containing the lookaside references:

$ curl --silent
https://git.centos.org/rpms/kernel/raw/${kernel_tag_commit}/f/.kernel.metad=
ata \
> kernel_sources

3. Fetch the source matching to your kernel source package:

$ wget https://git.centos.org/sources/kernel/${rel}/${kernel_src_checksum} =
\
--output-document=3D${kernel_src_filename}

The $kernel_src_checksum and $kernel_src_filename would be populated
from the entries in the kernel_sources files you downloaded earlier.

Note: $rel is either "c7" or "c8" depending on which one you're trying to g=
et.


[1]: https://github.com/release-engineering/dist-git





--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
