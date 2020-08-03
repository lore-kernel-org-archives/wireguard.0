Return-Path: <SRS0=XHON=BN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9E9C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 10:28:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6232120719
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 10:28:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="UqVBZVVc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6232120719
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75d341c4;
	Mon, 3 Aug 2020 10:04:01 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 22d9523f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 10:03:58 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa48919b;
 Mon, 3 Aug 2020 10:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :cc:subject:message-id:mime-version:content-type; s=mail; bh=wpQ
 laWchA5sL3OR8p48mKp6kfY4=; b=UqVBZVVcjoU8Slymnho4OqAD1rMniB/uFIv
 1TiTUauEgB0ReAtPJvDcpfEo1sPjxk784jwSzXYeoycVXZ60HrEFDxh/wof5QjVK
 /sLc4D+xXI9focwGz7rertFmCnDIgCV2iY1xV4L3w8UQE4NYfdXIKat5cWvi/PKl
 Xle5hhKyjeMi+iu3EZNNEsIfpl+dcBdwx0JVHN9SHBcwnsiulOkgW2VttU9uD42X
 Vofm52DQFA64BbBcUGuMDVZWlbWaUwtoUGfkkDAgsZU8oGDNsDYk1kMG9/cGeqVr
 owFbxA2uRtDeeb2rNm+dvhVJB4pU5nm9bmvEDpHxQ/QqLXa65WA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e91902d9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 3 Aug 2020 10:03:58 +0000 (UTC)
Date: Mon, 3 Aug 2020 12:28:08 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com
Cc: unit193@ubuntu.com, apw@canonical.com
Subject: Migrating From Ubuntu PPA to Real Ubuntu Packages
Message-ID: <20200803102808.GA1402387@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

Hi folks,

At long last, Ubuntu now supports WireGuard on releases 20.04, 19.10,
18.04, and 16.04, which means we've got all currently supported LTS
releases covered. For that reason, we're in the process of sunsetting
the PPA that previously provided packages to some users. This email
details possible changes users might consider.

The right way to install WireGuard on Ubuntu now consists of a single
command:

    $ sudo apt install wireguard

This "wireguard" package will *automatically* pull in either one or two
packages with it:

  1) wireguard-tools: this will always be pulled in and provides wg(8)
     and wg-quick(8).
  2) wireguard-dkms: this will only be pulled in if your kernel doesn't
     already come with WireGuard.

As suggested by (2), most Ubuntu kernels now come with WireGuard out of
the box, even older releases, to which WireGuard has been backported.
This is great news and will result in much better reliability during
upgrades, as well as smoother compatibility with SecureBoot. You can
learn if your Ubuntu kernel comes with WireGuard out of the box by
running this command:

zx2c4@bionicman:~$ dpkg --get-selections | grep -v deinstall | cut -f 1 | grep linux-image | xargs apt-cache show | grep ^Provides: | grep wireguard-modules
Provides: wireguard-modules (= 1.0.20200611-1ubuntu1~18.04.1), zfs-modules (= 0.7.5-1ubuntu16.9)

Or alternatively:

zx2c4@bionicman:~$ ls -l /lib/modules/$(uname -r)/kernel/wireguard/wireguard.ko
-rw-r--r-- 1 root root 286985 Jul  9 23:13 /lib/modules/4.15.0-112-generic/kernel/wireguard/wireguard.ko

If those messages are *not* printed, then it simply means that your
Ubuntu kernel does not (yet) come with WireGuard out of the box, in
which case, the above "sudo apt install wireguard" command will
*automatically* install wireguard-dkms along with it.

Users should never need to manually install wireguard-tools or
wireguard-dkms. Rather, *only* install the "wireguard" package, and this
will automatically choose the correct additional packages to pull in.

For those who previously used the PPA, if the above commands indicate
that your kernel *does* come with WireGuard, then you'll probably want
to *remove* the wireguard-dkms package if it has not already been
automatically removed:

    $ sudo apt remove wireguard-dkms

As well, all previous users of the PPA may remove it:

   $ sudo add-apt-repository --remove ppa:wireguard/wireguard

From this point forward, all updates will be handled by Canonical from
the main Ubuntu package repositories. No PPAs are needed.

Hopefully this process should be fairly smooth. Most users have already
had Canonical-blessed WireGuard installed for some time now, so it
should be fairly smooth sailing.

Let me know if you have any questions.

Regards,
Jason

PS: In case you missed the announcement from two weeks ago, we intend
to sunset support for Ubuntu 14.04 in the PPA, and afterwards remove the
PPA itself:
- https://lists.zx2c4.com/pipermail/wireguard/2020-July/005670.html
- https://data.zx2c4.com/sunset-wg-14.04.gif
