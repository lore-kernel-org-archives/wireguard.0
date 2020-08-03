Return-Path: <SRS0=XHON=BN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C58C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 16:31:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35DA720775
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 16:31:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="WwCbrXZx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35DA720775
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37683e97;
	Mon, 3 Aug 2020 16:06:50 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eb88f8c2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 16:06:46 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d78637b
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 16:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Z4I1NffPTsL8xnEB/DTjEFw8sUc=; b=WwCbrX
 Zx0ZnbygmDLDuouteFhOY2oAHGsDeF49NcrRr2hqq4xGVxQFzmoq7OE8RJd9ZDCN
 tJoqMMrO1vOYCsFZqiywDOuZssgzTgc7lDucsVli3ckzSi/SxYkX4Y10Sp8Wcudw
 GWr38CTSMvzHtAgqoefCCSey3bDsWJ8z5TCUt9KF9kt3HKqWwEtDXyy4DNKZ84id
 ZMlEPyVdB6XjXp9DBkIRhJs3H03Cn00Zt3C1/fGjBjLO8onp7D9OtjB7p13baY02
 EJ2Ctz/dQJihjG15uw7cwR+navN1VeWp1QCTf7EC2lv5ltiEgEQj+PN2KF07p9Ip
 XLTVxB50JpONhhZw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id be478525
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 16:06:46 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id l17so21408014ilq.13
 for <wireguard@lists.zx2c4.com>; Mon, 03 Aug 2020 09:31:01 -0700 (PDT)
X-Gm-Message-State: AOAM530CxWo3leYHeIhzX3HgO820F5RsuojhWXLEQ9I57JwoflA0dsS+
 89PMPGDFT/7KYe04kBtl76UEeDyZIaTQrogi5aY=
X-Google-Smtp-Source: ABdhPJyKtMLsXl32mtG5qyzatroOoqmWMzlT9ZVm2VcJD0iU7wTKcJkU07s5AP+iRzyHFLLgCwJownD18LAN7cJUXrc=
X-Received: by 2002:a92:ce12:: with SMTP id b18mr158804ilo.207.1596472260380; 
 Mon, 03 Aug 2020 09:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200803102808.GA1402387@zx2c4.com>
 <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
 <CAHmME9oLOSwC4_55cUZpHoXU+m8L=QQ20aDcn-ia5sWxQ+3nDA@mail.gmail.com>
 <d7506c2b3a5dce1c8c6c37c352f3ee50f6eed414.camel@noddingdog.org>
 <CAHmME9pA7qmK9Vg-W5Sa7O8y15H5cN0curQWG6=N5rU6TT3fVQ@mail.gmail.com>
In-Reply-To: <CAHmME9pA7qmK9Vg-W5Sa7O8y15H5cN0curQWG6=N5rU6TT3fVQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 3 Aug 2020 18:30:49 +0200
X-Gmail-Original-Message-ID: <CAHmME9oTLHTfRw+_QAqqZNb4=GCb1WnJaEBsm_tBhzJ7FzoFkA@mail.gmail.com>
Message-ID: <CAHmME9oTLHTfRw+_QAqqZNb4=GCb1WnJaEBsm_tBhzJ7FzoFkA@mail.gmail.com>
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
To: lists@noddingdog.org
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, unit193@ubuntu.com, 
 Andy Whitcroft <apw@canonical.com>, W.Jackson@dell.com
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

On Mon, Aug 3, 2020 at 6:28 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Mon, Aug 3, 2020 at 6:25 PM NoddingDog <lists@noddingdog.org> wrote:
> >
> > I'm sure I did apt update after removing the PPA, but just checked
> > again:
> >
> > apt update
> > apt install wireguard
> >
> > Same result - those gke kernels are included as dependencies and "will
> > be installed".
> >
> > Maybe Dell need to fix their bionic-oem repositories?
>
> Ooof, that sounds disastrous. Hopefully Andy is reading these emails
> and will fix this issue, but I'll poke him on IRC too.
>
> Could you send me the URLs for the repos your laptop is using? I'd
> like to double check the Release files on there. Perhaps just the
> contents of /etc/apt or similar, and the name of the kernel package
> your system uses?

Bingo:

zx2c4@bionicman:~$ apt-cache show linux-image-oem | grep Provides
zx2c4@bionicman:~$ apt-cache show linux-image-generic | grep Provides
Provides: wireguard-modules (= 1.0.20200611-1ubuntu1~18.04.1),
zfs-modules (= 0.7.5-1ubuntu16.9)

Indeed looks like maybe this was left out of linux-image-oem? That's
surprising, especially given the trials and tribulations we went
through initially to get this deployed to Dell customers.
