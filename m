Return-Path: <SRS0=sA0Z=4K=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC034C35666
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Feb 2020 19:59:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36C5220658
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Feb 2020 19:59:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kent-dobias.com header.i=@kent-dobias.com header.b="gWhiTvhO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36C5220658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kent-dobias.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 179dcc58;
	Sat, 22 Feb 2020 19:56:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5561b421
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Feb 2020 19:56:04 +0000 (UTC)
Received: from mail.kent-dobias.com (mail.kent-dobias.com
 [IPv6:2a04:52c0:101:4a2::8de9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00db8412
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Feb 2020 19:56:04 +0000 (UTC)
Received: from [192.168.69.2] (unknown [10.9.0.3])
 by mail.kent-dobias.com (Postfix) with ESMTPSA id B3D9C4378
 for <wireguard@lists.zx2c4.com>; Sat, 22 Feb 2020 14:59:12 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=kent-dobias.com;
 s=dkim; t=1582401553;
 bh=owvmZQpvH1VzDlk3xWjfaCFZR1tjLa1907P0XIU/P6U=;
 h=To:From:Subject:Date;
 b=gWhiTvhOvFA+8hlbaJDzOPhLyBx8WwV/Js5QYXr9RXhcLUYaA/sSc4d2hUwI+7FG2
 fwZ3ZVNZcmaGNNBFCbBZTwESdkHg4t0zajO4/a3dGXY7+XzQ3e9Xrl7e6PbKjI0aaJ
 kN8f7Fj5k4xCeLPijPJBpMduVteW3StGN7zEPV/4=
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Jaron Kent-Dobias <jaron-wg@kent-dobias.com>
Subject: DKMS build problem on Pinephone with UBports (xenial)
Autocrypt: addr=jaron-wg@kent-dobias.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0fbfcb28-47c3-5aa0-1699-e3bcd7ca7f6d@kent-dobias.com>
Date: Sat, 22 Feb 2020 14:58:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello,

Installing the wireguard-dkms package (0.0.20200215-0ppa1~16.04) on a
Pinephone running UBports (xenial with custom repositories) results in a
DKMS build error. The shell output and make.log are below. Seems like a
syntax error in a build script, not sure if this belongs here or downstream.

Jaron

> phablet@ubuntu-phablet ~ % sudo apt install wireguard-dkms
> Reading package lists... Done
> Building dependency tree       
> Reading state information... Done
> Recommended packages:
>   wireguard
> The following NEW packages will be installed:
>   wireguard-dkms
> 0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
> Need to get 259 kB of archives.
> After this operation, 1,765 kB of additional disk space will be used.
> Get:1 http://ppa.launchpad.net/wireguard/wireguard/ubuntu xenial/main arm64 wireguard-dkms all 0.0.20200215-0ppa1~16.04 [259 kB] 
> Fetched 259 kB in 0s (279 kB/s)         
> Selecting previously unselected package wireguard-dkms.
> (Reading database ... 83056 files and directories currently installed.)
> Preparing to unpack .../wireguard-dkms_0.0.20200215-0ppa1~16.04_all.deb ...
> Unpacking wireguard-dkms (0.0.20200215-0ppa1~16.04) ...
> Setting up wireguard-dkms (0.0.20200215-0ppa1~16.04) ...
> Loading new wireguard-0.0.20200215 DKMS files...
> First Installation: checking all kernels...
> Building only for 5.4.0-pine64
> Building initial module for 5.4.0-pine64
> Error! Bad return status for module build on kernel: 5.4.0-pine64 (aarch64)
> Consult /var/lib/dkms/wireguard/0.0.20200215/build/make.log for more information.
> W: No sandbox user '_apt' on the system, can not drop privileges
>   11.03s user 4.14s system 83% cpu 18.115 total

> DKMS make.log for wireguard-0.0.20200215 for kernel 5.4.0-pine64 (aarch64)
> Sat Feb 22 19:47:26 UTC 2020
> make: Entering directory '/usr/src/linux-headers-5.4.0-pine64'
>   AR      /var/lib/dkms/wireguard/0.0.20200215/build/built-in.a
>   CC [M]  /var/lib/dkms/wireguard/0.0.20200215/build/main.o
> scripts/basic/fixdep: 1: scripts/basic/fixdep: Syntax error: ")" unexpected
> scripts/Makefile.build:265: recipe for target '/var/lib/dkms/wireguard/0.0.20200215/build/main.o' failed
> make[1]: *** [/var/lib/dkms/wireguard/0.0.20200215/build/main.o] Error 2
> make[1]: *** Deleting file '/var/lib/dkms/wireguard/0.0.20200215/build/main.o'
> Makefile:1652: recipe for target '/var/lib/dkms/wireguard/0.0.20200215/build' failed
> make: *** [/var/lib/dkms/wireguard/0.0.20200215/build] Error 2
> make: Leaving directory '/usr/src/linux-headers-5.4.0-pine64'
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
