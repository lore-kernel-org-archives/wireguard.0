Return-Path: <SRS0=CDXv=5U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7604AC2BA15
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 21:13:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA381206CC
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 21:13:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="SmVxGgAN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA381206CC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 829b69df;
	Sat, 4 Apr 2020 21:04:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8a48b03e
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 4 Apr 2020 21:04:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dcdc2dbd;
 Sat, 4 Apr 2020 21:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :cc:subject:message-id:mime-version:content-type; s=mail; bh=u3q
 23xei5l9qE75pZayzYD7JUS4=; b=SmVxGgANqZjJxEUTlxgcvzVhCQZ0ZKiJVqF
 0OK2qwLDRRz9C72ZiaPt8UQNx2HRwrGMZOM61CEWdivZYUPTdz0GAHFLX6nWwm/w
 8kcxhvanFLn7YSd/EPRI4gEdLUqz8gfg3dWuDjtbbMWG9ZW1Jnu3x4taK6HtjHgU
 4CcuokUZ4tvx2YtEdrtawGXudZ3FHO+aWV2Hph2yhnZmVxxjBYH73YOcseeB5bof
 efnzyPC7Cb5EoLI+MsxYsBq4tb+4W0ss+EI9Y/77hWRWr4EVr1xw5TtbdTwkJkqh
 EdIxur68ibx1KzkjkQxZIL8VbpXBDy3AfafFkbdb8iCrvMJg1gg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f03caede
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Sat, 4 Apr 2020 21:04:12 +0000 (UTC)
Date: Sat, 4 Apr 2020 15:12:46 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com
Cc: joe@solidadmin.com, contact@elrepo.org
Subject: More reliable packages available for RHEL, CentOS, and Fedora
Message-ID: <20200404211246.GA10066@zx2c4.com>
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

Hey folks,

Joe Doss (cc'd) has maintained our DKMS packages for Fedora, RHEL, and CentOS
for the last several years on his copr. Recently there have been some nice
changes due to the 1.0ing of WireGuard.

- Fedora 32 will get Linux 5.6, so it won't need the DKMS package:
  https://bodhi.fedoraproject.org/updates/FEDORA-2020-e8b6474ee5
- Fedora 31 and 30 will also get Linux 5.6 during the next month, so
  they won't need the DKMS package.
- Joe has joined ELRepo (cc'd) as a package maintainer, so RHEL/CentOS
  7/8 will now have binary kmods built over there, signed with ELrepo's
  validating UEFI Secure Boot key, so enterprise users will have more
  reliable updates.
- I've contacted Red Hat about bringing WireGuard directly into the RHEL kernel;
  we'll see what happens there. (I've also reached out to Oracle
  regarding their enterprise situation.)
- The wireguard-tools package moved into Fedora-proper, which means it's
  now available on F32, F31, F30, and RHEL/CentOS 7,8 via EPEL.

The net result of this is that when F31 and F32 move to 5.6, we will no
longer need the copr with DKMS, at all, and also that today, enterprise
users now have a more reliable way to use WireGuard.

The most up to date instructions are on https://www.wireguard.com/install/
but the current situation is:

Fedora 32 now and Fedora 31,30 in a few weeks from now:
$ sudo dnf install wireguard-tools

Fedora 31,30 now, but not in a few weeks from now:
$ sudo dnf copr enable jdoss/wireguard
$ sudo dnf install wireguard-dkms wireguard-tools

RHEL 8:
$ sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
$ sudo yum install https://www.elrepo.org/elrepo-release-8.el8.elrepo.noarch.rpm
$ sudo yum install kmod-wireguard wireguard-tools

CentOS 8:
$ sudo yum install elrepo-release epel-release
$ sudo yum install kmod-wireguard wireguard-tools

RHEL 7:
$ sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
$ sudo yum install https://www.elrepo.org/elrepo-release-7.el7.elrepo.noarch.rpm
$ sudo yum install kmod-wireguard wireguard-tools

CentOS 7:
$ sudo yum install epel-release
$ sudo yum install https://www.elrepo.org/elrepo-release-7.el7.elrepo.noarch.rpm
$ sudo yum install kmod-wireguard wireguard-tools

Thanks,
Jason
