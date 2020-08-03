Return-Path: <SRS0=XHON=BN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE385C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 16:21:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3C2C2067D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 16:21:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=noddingdog.org header.i=@noddingdog.org header.b="VhaW2a1U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3C2C2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=noddingdog.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e213d8d4;
	Mon, 3 Aug 2020 15:57:23 +0000 (UTC)
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.22])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a03c08cd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 15:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596470938;
 s=strato-dkim-0002; d=noddingdog.org;
 h=References:In-Reply-To:Date:Cc:To:Reply-To:From:Subject:Message-ID:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=5qKY2fGADBob7GRit+FiyxW5rsYdJRfPNmax2b7qmM8=;
 b=VhaW2a1UrNNPQVELp2XEHUeoOAxeWn7VsNpObs1sHbWq0apHkYIzHauUMsztkvKEVU
 dh5ypGq/X6ZPGxIQnSc9DplzqlejjoVTEfWohT+8GM6hn60SppdjjmITPrFhnPUjxSaT
 EWpnzkQwnJ7Wgg0BEqNFMERmpmBGl0YLEVeG7HgrMru7UWEmzxMG7V1FjJkbNRKYejm5
 OSozyFvGj5GzMpvHq9rJOChywGojDrlrNMf+zxomqYgAcN3wvYN4o365rOUDMyQ+ijX6
 G0MANiK4Bt3oIR/JcBUjLRwp2GZR72vf4pnrEQUP2gaEHIZPVydRpAq5RJat9LGehysj
 UItw==
X-RZG-AUTH: ":IGUXYVOIdfBKufcaBaD1VnaVHDFPyTRa+MRijjlybNMf0fcWFTusC99TG/RqMbkejJUmYQ=="
X-RZG-CLASS-ID: mo00
Received: from WN-XPS13 by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
 with ESMTPSA id q00567w73G8v7i5
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1
 with 256 ECDH bits, eq. 3072 bits RSA))
 (Client did not present a certificate);
 Mon, 3 Aug 2020 18:08:57 +0200 (CEST)
Message-ID: <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
From: NoddingDog <lists@noddingdog.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com
Cc: unit193@ubuntu.com, apw@canonical.com
Date: Mon, 03 Aug 2020 18:08:56 +0200
In-Reply-To: <20200803102808.GA1402387@zx2c4.com>
References: <20200803102808.GA1402387@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 03 Aug 2020 17:57:21 +0200
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
Reply-To: lists@noddingdog.org
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

I'd like to report a serious problem.

I have a Dell XPS13 with Dell's OEM version of Ubuntu 18.04

I had previously added the wireguard PPA and removed it as mentioned
below.

Now, when running sudo apt install wireguard, the system wants to
install the following packages:

linux-image-5.3.0-1032-gke
linux-image-gke-5.3
wireguard-tools

These kernel images are **completely wrong** for the laptop (they are
Google Container Engine kernel images). I didn't notice and borked my
system by installing them. I had to load an old kernel and purge them
before my system would work properly again.

Maybe this needs fixing before too many other folks have the same
problem.

BR



On Mon, 2020-08-03 at 12:28 +0200, Jason A. Donenfeld wrote:
> Hi folks,
> 
> At long last, Ubuntu now supports WireGuard on releases 20.04, 19.10,
> 18.04, and 16.04, which means we've got all currently supported LTS
> releases covered. For that reason, we're in the process of sunsetting
> the PPA that previously provided packages to some users. This email
> details possible changes users might consider.
> 
> The right way to install WireGuard on Ubuntu now consists of a single
> command:
> 
>     $ sudo apt install wireguard
> 
> This "wireguard" package will *automatically* pull in either one or
> two
> packages with it:
> 
>   1) wireguard-tools: this will always be pulled in and provides
> wg(8)
>      and wg-quick(8).
>   2) wireguard-dkms: this will only be pulled in if your kernel
> doesn't
>      already come with WireGuard.
> 
> As suggested by (2), most Ubuntu kernels now come with WireGuard out
> of
> the box, even older releases, to which WireGuard has been backported.
> This is great news and will result in much better reliability during
> upgrades, as well as smoother compatibility with SecureBoot. You can
> learn if your Ubuntu kernel comes with WireGuard out of the box by
> running this command:
> 
> zx2c4@bionicman:~$ dpkg --get-selections | grep -v deinstall | cut -f
> 1 | grep linux-image | xargs apt-cache show | grep ^Provides: | grep
> wireguard-modules
> Provides: wireguard-modules (= 1.0.20200611-1ubuntu1~18.04.1), zfs-
> modules (= 0.7.5-1ubuntu16.9)
> 
> Or alternatively:
> 
> zx2c4@bionicman:~$ ls -l /lib/modules/$(uname
> -r)/kernel/wireguard/wireguard.ko
> -rw-r--r-- 1 root root 286985 Jul  9 23:13 /lib/modules/4.15.0-112-
> generic/kernel/wireguard/wireguard.ko
> 
> If those messages are *not* printed, then it simply means that your
> Ubuntu kernel does not (yet) come with WireGuard out of the box, in
> which case, the above "sudo apt install wireguard" command will
> *automatically* install wireguard-dkms along with it.
> 
> Users should never need to manually install wireguard-tools or
> wireguard-dkms. Rather, *only* install the "wireguard" package, and
> this
> will automatically choose the correct additional packages to pull in.
> 
> For those who previously used the PPA, if the above commands indicate
> that your kernel *does* come with WireGuard, then you'll probably
> want
> to *remove* the wireguard-dkms package if it has not already been
> automatically removed:
> 
>     $ sudo apt remove wireguard-dkms
> 
> As well, all previous users of the PPA may remove it:
> 
>    $ sudo add-apt-repository --remove ppa:wireguard/wireguard
> 
> From this point forward, all updates will be handled by Canonical
> from
> the main Ubuntu package repositories. No PPAs are needed.
> 
> Hopefully this process should be fairly smooth. Most users have
> already
> had Canonical-blessed WireGuard installed for some time now, so it
> should be fairly smooth sailing.
> 
> Let me know if you have any questions.
> 
> Regards,
> Jason
> 
> PS: In case you missed the announcement from two weeks ago, we intend
> to sunset support for Ubuntu 14.04 in the PPA, and afterwards remove
> the
> PPA itself:
> - https://lists.zx2c4.com/pipermail/wireguard/2020-July/005670.html
> - https://data.zx2c4.com/sunset-wg-14.04.gif

