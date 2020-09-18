Return-Path: <SRS0=5dvq=C3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734E9C43464
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Sep 2020 16:01:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B10612388B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Sep 2020 16:01:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="d1JcfEXj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B10612388B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4251ccd0;
	Fri, 18 Sep 2020 15:29:13 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7549aefd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Sep 2020 15:29:10 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa56625d;
 Fri, 18 Sep 2020 15:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :cc:subject:message-id:mime-version:content-type; s=mail; bh=rMN
 VeNVGCLqUjGpX8bAMTBucAzk=; b=d1JcfEXj2xHWw4PJdW3msXDG7vY1DU3Hkdv
 L17Le6dLoWLtOg5U/vQBkXt6zFgH8WZIi1EeNFsNle+eF5aqksjWgiyjCdyH1Szr
 lDwwUPKUp56sGbGjm0467vTbVMVDn2/THbfF6TssG37w0g2khsnWt4R/51UakeJ0
 bdvHGV9tR2u69egZQrjWrO2NUQisiptvRwIzcr7cwc172yLRL9KD2HtGoZiRAqsP
 8cF5gBZKkpBYr7D53JZOHF2C3600fc0YAtHKjcGFcOP10qaycMSb4dUn58aw6r7g
 TyTiUlJBBwSlYwgQx1uvJc5ciTYybmKwPlKWA2Oz/G1Vj0zHm2w==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 377e4eb3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 18 Sep 2020 15:29:10 +0000 (UTC)
Date: Fri, 18 Sep 2020 17:59:19 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com
Cc: amyagi@gmail.com
Subject: wireguard now built into CentOS 7 and CentOS 8's "kernel-plus" kernel
Message-ID: <20200918155919.GA549539@zx2c4.com>
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

Users of RHEL and CentOS have typically had two different installation
strategies: a kmod from ELrepo or dkms from copr. These have worked
well, but it's still been a bit more cumbersome than one would like,
especially with Secure Boot.

WireGuard has finally been added to CentOS's "kernel-plus" kernels,
which are the normal RHEL kernels, with things added. This means that
WireGuard gets distributed as a built-in to these. It seems to work
well. Instructions are on wireguard.com/install/ and as of writing
suggest the following:


CentOS 8
========
$ sudo yum install yum-utils epel-release
$ sudo yum-config-manager --setopt=centosplus.includepkgs="kernel-plus, kernel-plus-*" --setopt=centosplus.enabled=1 --save
$ sudo sed -e 's/^DEFAULTKERNEL=kernel-core$/DEFAULTKERNEL=kernel-plus-core/' -i /etc/sysconfig/kernel
$ sudo yum install kernel-plus wireguard-tools
$ sudo reboot

CentOS 7
========
$ sudo yum install yum-utils epel-release
$ sudo yum-config-manager --setopt=centosplus.includepkgs=kernel-plus --enablerepo=centosplus --save
$ sudo sed -e 's/^DEFAULTKERNEL=kernel$/DEFAULTKERNEL=kernel-plus/' -i /etc/sysconfig/kernel
$ sudo yum install kernel-plus wireguard-tools
$ sudo reboot

Let me know if there are any issues.

Thanks,
Jason
