Return-Path: <SRS0=XHON=BN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58802C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 16:29:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF9B520719
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 16:29:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="irUS/PYN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF9B520719
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 574c64c6;
	Mon, 3 Aug 2020 16:04:23 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cadf0a9c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 16:04:22 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id beab1ea4
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Aw14E+r28b6MSPD9Lo7J0ZoeNAA=; b=irUS/P
 YNq4xWmMcU2M5rMbkfRSxekfwarmFYguptQLyBNvBtmUO/KTiTOJ1Z77jHOnpo7a
 M80Xx9y3xskB5F4G0JuyUn87c1F36k19gNOxi4ZNuluKxONGpX/vJ9tCPsVrtDCc
 y3PGcStSSB3jfcm0/Bqv/vRcBQMDMziis2Xa1bs7dOnpBfm8+u441kLg0ib+qISk
 /wginMABi7EvECwyj3w9pw7PwSKexcXIJc0Hhh/LdLpgz5qdsEelB85bhM3/JMWF
 anTQ7BSK+UiAPOqCAqqeIi4Mvr35V4DLSZYGki1mfVNJ3GC4i4tCgBfJvf42N8aY
 wkCPeCCd8Bgi/X7A==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 93b973d2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 16:04:21 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id t4so31593449iln.1
 for <wireguard@lists.zx2c4.com>; Mon, 03 Aug 2020 09:28:36 -0700 (PDT)
X-Gm-Message-State: AOAM532sVQRTARxmHBB7Qdp1X4HZWeXOxMY9qvJyt+yCAcGpwXTxG3vC
 u/cJDocvoHKxBTAjYv+dM3mdOJrPEpkoyoegEhU=
X-Google-Smtp-Source: ABdhPJw8pMl3oq4xG9SOKoMHiY8skP6j/IUan5Smm+b03jpSUIoPWd9QVjb5w9NC/Qh1QhWDM+NcH18gVYJnktSGr18=
X-Received: by 2002:a92:bb92:: with SMTP id x18mr193998ilk.64.1596472115760;
 Mon, 03 Aug 2020 09:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200803102808.GA1402387@zx2c4.com>
 <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
 <CAHmME9oLOSwC4_55cUZpHoXU+m8L=QQ20aDcn-ia5sWxQ+3nDA@mail.gmail.com>
 <d7506c2b3a5dce1c8c6c37c352f3ee50f6eed414.camel@noddingdog.org>
In-Reply-To: <d7506c2b3a5dce1c8c6c37c352f3ee50f6eed414.camel@noddingdog.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 3 Aug 2020 18:28:24 +0200
X-Gmail-Original-Message-ID: <CAHmME9pA7qmK9Vg-W5Sa7O8y15H5cN0curQWG6=N5rU6TT3fVQ@mail.gmail.com>
Message-ID: <CAHmME9pA7qmK9Vg-W5Sa7O8y15H5cN0curQWG6=N5rU6TT3fVQ@mail.gmail.com>
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
To: lists@noddingdog.org
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, unit193@ubuntu.com, 
 Andy Whitcroft <apw@canonical.com>
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

On Mon, Aug 3, 2020 at 6:25 PM NoddingDog <lists@noddingdog.org> wrote:
>
> I'm sure I did apt update after removing the PPA, but just checked
> again:
>
> apt update
> apt install wireguard
>
> Same result - those gke kernels are included as dependencies and "will
> be installed".
>
> Maybe Dell need to fix their bionic-oem repositories?

Ooof, that sounds disastrous. Hopefully Andy is reading these emails
and will fix this issue, but I'll poke him on IRC too.

Could you send me the URLs for the repos your laptop is using? I'd
like to double check the Release files on there. Perhaps just the
contents of /etc/apt or similar, and the name of the kernel package
your system uses?


Jason
