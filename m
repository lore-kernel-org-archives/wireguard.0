Return-Path: <SRS0=CDXv=5U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2FAC2BA15
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 21:23:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4E17206E6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 21:23:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="2w0GJpkK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4E17206E6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74f881ef;
	Sat, 4 Apr 2020 21:13:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a320a9ec
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 4 Apr 2020 21:13:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13999690
 for <wireguard@lists.zx2c4.com>; Sat, 4 Apr 2020 21:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ndHjZ2zs25FFcln8hqtOrBmsZXc=; b=2w0GJp
 kKX5/i41H7liEBqZDumSHXq9yRmPd/TcAhNRfEst/uFsUaSWABDiTyvNTa4ECKva
 lxZTKNpdhhgw2O6Lias8kwvYYFzFPHqeOnIzT5/czHIchlZgMG0o+p6cPpXm3R+S
 lfmSj4OXLKAFG+UwuUJpMznrFTrLgT3MhR3CDoJcHyS3zAa4RmCS4/yhxYs52sYw
 4tHbRAOWINMG1TXSSRAOU59X0/mkuAAo42+Viq0M2ORq0CCdOV4JlZz6FWbTN4TR
 KXVWtrgf87JDDDIher0s9+SGJRLpYRsjeelbmumYTnNfBdrZWH++FxG2XAJEGPDh
 AarOLLJwfSehOUew==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4e944f63
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 4 Apr 2020 21:13:54 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id j9so11029781ilr.7
 for <wireguard@lists.zx2c4.com>; Sat, 04 Apr 2020 14:22:29 -0700 (PDT)
X-Gm-Message-State: AGi0PubMqZXUuwjpeqlNVTJ+L5MECeBJ22nchLsU0xNagcbsxxbhPYDE
 IT4NHJiPlt2WL+yjkCa6oaoXlWPowPTOlBNQ47Q=
X-Google-Smtp-Source: APiQypJSB5bUPUewGAw7vmvcnoPxXiygj2ccm5GnzPppRRozbhXd5lxFlCHqK6QJ3qRSay771GturrPHXsu4w6+l0UM=
X-Received: by 2002:a92:798f:: with SMTP id
 u137mr15556382ilc.231.1586035349167; 
 Sat, 04 Apr 2020 14:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200404211246.GA10066@zx2c4.com>
In-Reply-To: <20200404211246.GA10066@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 4 Apr 2020 15:22:18 -0600
X-Gmail-Original-Message-ID: <CAHmME9qr+PHsn6EJAwhkdu0NwN3g3zdkJfX5X+aBjwovN9grsg@mail.gmail.com>
Message-ID: <CAHmME9qr+PHsn6EJAwhkdu0NwN3g3zdkJfX5X+aBjwovN9grsg@mail.gmail.com>
Subject: Re: More reliable packages available for RHEL, CentOS, and Fedora
To: elrepo@lists.elrepo.org
Cc: Joe Doss <joe@solidadmin.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

I was asked to loop in the ELRepo mailing list too. Below is the email
I just sent out to wgml.

On Sat, Apr 4, 2020 at 3:12 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hey folks,
>
> Joe Doss (cc'd) has maintained our DKMS packages for Fedora, RHEL, and CentOS
> for the last several years on his copr. Recently there have been some nice
> changes due to the 1.0ing of WireGuard.
>
> - Fedora 32 will get Linux 5.6, so it won't need the DKMS package:
>   https://bodhi.fedoraproject.org/updates/FEDORA-2020-e8b6474ee5
> - Fedora 31 and 30 will also get Linux 5.6 during the next month, so
>   they won't need the DKMS package.
> - Joe has joined ELRepo (cc'd) as a package maintainer, so RHEL/CentOS
>   7/8 will now have binary kmods built over there, signed with ELrepo's
>   validating UEFI Secure Boot key, so enterprise users will have more
>   reliable updates.
> - I've contacted Red Hat about bringing WireGuard directly into the RHEL kernel;
>   we'll see what happens there. (I've also reached out to Oracle
>   regarding their enterprise situation.)
> - The wireguard-tools package moved into Fedora-proper, which means it's
>   now available on F32, F31, F30, and RHEL/CentOS 7,8 via EPEL.
>
> The net result of this is that when F31 and F32 move to 5.6, we will no
> longer need the copr with DKMS, at all, and also that today, enterprise
> users now have a more reliable way to use WireGuard.
>
> The most up to date instructions are on https://www.wireguard.com/install/
> but the current situation is:
>
> Fedora 32 now and Fedora 31,30 in a few weeks from now:
> $ sudo dnf install wireguard-tools
>
> Fedora 31,30 now, but not in a few weeks from now:
> $ sudo dnf copr enable jdoss/wireguard
> $ sudo dnf install wireguard-dkms wireguard-tools
>
> RHEL 8:
> $ sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
> $ sudo yum install https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm
> $ sudo yum install kmod-wireguard wireguard-tools
>
> CentOS 8:
> $ sudo yum install elrepo-release epel-release
> $ sudo yum install kmod-wireguard wireguard-tools
>
> RHEL 7:
> $ sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
> $ sudo yum install https://www.elrepo.org/elrepo-release-7.el7.elrepo.noarch.rpm
> $ sudo yum install kmod-wireguard wireguard-tools
>
> CentOS 7:
> $ sudo yum install epel-release
> $ sudo yum install https://www.elrepo.org/elrepo-release-7.el7.elrepo.noarch.rpm
> $ sudo yum install kmod-wireguard wireguard-tools
>
> Thanks,
> Jason
