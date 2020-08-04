Return-Path: <SRS0=m2o5=BO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CCAC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Aug 2020 13:27:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5D0B2067D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Aug 2020 13:27:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Wkwph5bD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5D0B2067D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c0e9863;
	Tue, 4 Aug 2020 13:02:12 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a8e353fe
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Aug 2020 13:02:09 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b82e75bf
 for <wireguard@lists.zx2c4.com>; Tue, 4 Aug 2020 13:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=Lg0S9IjSTr7Q
 UIxf7SHcE9ZYkeE=; b=Wkwph5bDl2N/PhZ1isxFJJH1SSlcNmG3Zs1Cn9sFko9u
 irPrcdoVE7RVnb9KfR7GVO4uDUzjc0oFL8G6b8PSL62/y+kB1svmnHSkmro5zYsp
 fAgwuFYJKEa9dgCI9WbgQWb6RN8wlyUc0yFmUKV8lweUOWoLE9Vr8fBa1Fas6qKg
 esb5n8wjfw4jNuSaLmJ4SXcv6QTS1En8gYMT8vBAJ9WytKObYDfRWXX1orJVtTqb
 J+Bgw+JgQ19cUgothmXkmCVkr3Bv+8S9nmRtqcWh97V6cuGauHdllqNtUAinrFph
 VwBP43UZBfzgpDckVPp/LAGSSVNHgaZ3eT9X9k46Fg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e396b17b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Aug 2020 13:02:08 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id p13so5684115ilh.4
 for <wireguard@lists.zx2c4.com>; Tue, 04 Aug 2020 06:26:29 -0700 (PDT)
X-Gm-Message-State: AOAM532A7YOo4CPnL/I9Bp6FsbmZJ/1tIl4HwqpVrklBa9Rrr1YmmHyc
 jfYZEG+8Am0yk/tG6Of+rENL4V7ddAVzJPuuGp0=
X-Google-Smtp-Source: ABdhPJzRPiNiTFO2pmdqJCAanWhMv0m4z/22oRo43Ci7pnNwFTumDzK3Nnml7K1TdljTDVPOnmWOgl1pxIA5YNkG5Kg=
X-Received: by 2002:a92:d392:: with SMTP id o18mr5041983ilo.224.1596547588799; 
 Tue, 04 Aug 2020 06:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200803102808.GA1402387@zx2c4.com>
 <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
 <CAHmME9oLOSwC4_55cUZpHoXU+m8L=QQ20aDcn-ia5sWxQ+3nDA@mail.gmail.com>
 <d7506c2b3a5dce1c8c6c37c352f3ee50f6eed414.camel@noddingdog.org>
 <CAHmME9pA7qmK9Vg-W5Sa7O8y15H5cN0curQWG6=N5rU6TT3fVQ@mail.gmail.com>
 <532c74129f32cffd53c71b87858929f800c2f87b.camel@noddingdog.org>
 <20200803164249.GA781003@zx2c4.com> <20200804123658.GE6317@brain>
In-Reply-To: <20200804123658.GE6317@brain>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 4 Aug 2020 15:26:17 +0200
X-Gmail-Original-Message-ID: <CAHmME9pqn_=Ui3CJnF3r=cyjpJN1zNYD=0v=Kczr5kUKhZjJsw@mail.gmail.com>
Message-ID: <CAHmME9pqn_=Ui3CJnF3r=cyjpJN1zNYD=0v=Kczr5kUKhZjJsw@mail.gmail.com>
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
To: Andy Whitcroft <apw@canonical.com>
Cc: NoddingDog <lists@noddingdog.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>, unit193@ubuntu.com,
 W.Jackson@dell.com
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

On Tue, Aug 4, 2020 at 2:37 PM Andy Whitcroft <apw@canonical.com> wrote:
>
> On Mon, Aug 03, 2020 at 06:42:49PM +0200, Jason A. Donenfeld wrote:
> > Looks like we're all set for these kernels:
> >
> > zx2c4@bionicman:~$ apt-cache show linux-image-* | grep -C5 "^Source: li=
nux-meta" | grep -B10 "^Provides: .*wireguard-modules" | grep ^Package:
> > Package: linux-image-generic
> > Package: linux-image-aws
> > Package: linux-image-azure
> > Package: linux-image-azure-edge
> > Package: linux-image-gcp
> > Package: linux-image-kvm
> > Package: linux-image-lowlatency
> > Package: linux-image-virtual
> > Package: linux-image-aws-edge
> > Package: linux-image-aws-lts-18.04
> > Package: linux-image-gcp-edge
> > Package: linux-image-generic-hwe-18.04
> > Package: linux-image-generic-hwe-18.04-edge
> > Package: linux-image-gke-5.4
> > Package: linux-image-lowlatency-hwe-18.04
> > Package: linux-image-lowlatency-hwe-18.04-edge
> > Package: linux-image-oracle
> > Package: linux-image-oracle-edge
> > Package: linux-image-virtual-hwe-18.04
> > Package: linux-image-virtual-hwe-18.04-edge
> > Package: linux-image-gke-5.3
> >
> > But we are not all set for these kernels:
> >
> > zx2c4@bionicman:~$ comm -23 <(apt-cache show linux-image-* | grep -C5 "=
^Source: linux-meta" | grep ^Package: | sort | uniq) <(apt-cache show linux=
-image-* | grep -C5 "^Source: linux-meta" | grep -B10 "^Provides: .*wiregua=
rd-modules" | grep ^Package: | sort | uniq)
> > Package: linux-image-azure-lts-18.04
> > Package: linux-image-extra-virtual
> > Package: linux-image-extra-virtual-hwe-16.04
> > Package: linux-image-extra-virtual-hwe-16.04-edge
> > Package: linux-image-extra-virtual-hwe-18.04
> > Package: linux-image-extra-virtual-hwe-18.04-edge
> > Package: linux-image-gcp-lts-18.04
> > Package: linux-image-generic-hwe-16.04
> > Package: linux-image-generic-hwe-16.04-edge
> > Package: linux-image-gke
> > Package: linux-image-gke-4.15
> > Package: linux-image-gke-5.0
> > Package: linux-image-gkeop-5.3
> > Package: linux-image-gkeop-5.4
> > Package: linux-image-lowlatency-hwe-16.04
> > Package: linux-image-lowlatency-hwe-16.04-edge
> > Package: linux-image-oem
> > Package: linux-image-oem-osp1
> > Package: linux-image-oracle-lts-18.04
> > Package: linux-image-virtual-gkeop-5.0
> > Package: linux-image-virtual-hwe-16.04
> > Package: linux-image-virtual-hwe-16.04-edge
> >
> > Appears that the "oem" kernel is part of the bad list.
>
> This list is somewhat inaccurate as about half of those are transitional
> packages an not expected to actually have provides.  linux-oem is
> unfortuantly converted but misses its linux-meta-oem changes.  This is
> being sorted out.  The remaining are being reviewed.

Thanks for clarifying. So we're now certain about linux-meta-oem (aka
Dell's kernel) being broken. Could you keep the list updated if you're
able to confirm that others are broken too?

Jason
