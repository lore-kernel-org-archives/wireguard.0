Return-Path: <SRS0=bSPH=AF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A31C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 24 Jun 2020 06:07:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E0072073E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 24 Jun 2020 06:07:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="pEsdqFIx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E0072073E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38700a0e;
	Wed, 24 Jun 2020 05:48:27 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 38b61870
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jun 2020 05:48:25 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f051ab7
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jun 2020 05:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :subject:message-id:mime-version:content-type; s=mail; bh=Cho+qz
 I3+STIYt7HFluxUBotY7w=; b=pEsdqFIxAwuAvXwwtzY6E4m+SmTMyYaGkc7Zm2
 IR343CH5YNtLVQjXwE6kLZ/r0W8pRD/SdOQrmOoF/mdEKhvoI2oI+2b2QjdlnCSH
 XZSIltAcpazRIXAPbou1Zc0MWQGivfja0S+GVuczHYJy3nE08i/mcGNs5AgmUdff
 v9KNTwrSPr+H0ptRHSGy21F1pXcy7fMkWLxyODvEY/4ti0jyv+l/sOF5HbLLQWQj
 aWhOpZ7PO+gDOGK6OyjCYtf2PaO5H58+ZrtdTEhho66BpCIVh6FpRv9/ypbcC+K1
 eZBhiieOIAQdpR+ye/YCiHeRhekNnxYWPH76DsuWnpaLvlfw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e8eac361
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jun 2020 05:48:25 +0000 (UTC)
Date: Wed, 24 Jun 2020 00:07:22 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com
Subject: Trying out WireGuard's kernel support in OpenBSD's -current snapshots
Message-ID: <20200624060722.GA686091@zx2c4.com>
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

Hi everyone,

With WireGuard now being enabled on OpenBSD's -current snapshot builds,
it's pretty easy to try it out on the platform. This email describes two
options for doing in the context of basic VPS providers or personal
machines.

Method A) From an existing OpenBSD install

If you already have an OpenBSD install -- perhaps your VPS provider
supports it as an auto install -- things are pretty easy:

1. Use sysupgrade(8) to upgrade to the latest snapshot as root:

    # sysupgrade -s

2. After it installs and it reboots, install wg(8) and wg-quick(8) as
   root:

    # pkg_add wireguard-tools

3. Now you can use wg(8) and wg-quick(8), in addition to ifconfig(8).


Method B) From an existing Linux install

You probably already have a Linux install -- or most likely your VPS
provider will have any number of Linux distros out of the box -- in
which case you can easily overwrite that Linux install with an OpenBSD
install.

1. Download the miniroot installer:

    $ curl -OJL https://cdn.openbsd.org/pub/OpenBSD/snapshots/amd64/miniroot67.img

2. Write the installer to your hard drive, which is usually either vda,
   sda, hda, or nvme0n1. One of these commands will work, and the other
   three will fail:

    $ sudo dd if=miniroot67.img of=/dev/vda
    $ sudo dd if=miniroot67.img of=/dev/sda
    $ sudo dd if=miniroot67.img of=/dev/hda
    $ sudo dd if=miniroot67.img of=/dev/nvme0n1

   After one of those succeeds, this step is complete.

3. Reboot the machine, and connect to its serial port. Most VPS
   providers have an option called "launch console" or similar. You'll see
   the OpenBSD installer. Most of the defaults should suit you fine, and
   there are any number of online manuals on installing OpenBSD.

4. When the installed system boots, install wg(8) and wg-quick(8) as
   root:

    # pkg_add wireguard-tools

5. Now you can use wg(8) and wg-quick(8), in addition to ifconfig(8).


Sidenote) Updating wireguard-go scripts to use the new wg(4) kernel
          driver

If you've already been using WireGuard with OpenBSD, it's via
wireguard-go.  The big recent news is that a new native WireGuard
implementation, wg(4), is now baked into the OpenBSD kernel, and
userland utilities like ifconfig(8) and tcpdump(8) support it too. From
a tooling perspective, however, very little should change: recent
versions of wg(8) and wg-quick(8) support WireGuard using the exact same
semantics as before, with these two exceptions:

1. Instead of running `wireguard-go tun0` to create a tunnel manually,
   you now run `ifconfig wg0 create`.

2. Instead of referring to the WireGuard interface as "tunX", it's now
   "wgX".

Other than those two things, all scripts and commands should behave
identically.


Please let us know if you run into any bugs or other headaches. Thanks
in advance for your testing and feedback.

Enjoy!
Jason
