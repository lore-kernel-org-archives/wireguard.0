Return-Path: <SRS0=gJ+C=HM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E020C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Feb 2021 15:00:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EA9D64E7C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Feb 2021 15:00:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EA9D64E7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syseleven.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0ef652d6;
	Wed, 10 Feb 2021 15:00:18 +0000 (UTC)
Received: from smtp01.syseleven.net (smtp01.syseleven.net [77.247.83.123])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d4ced5cb
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Feb 2021 20:05:32 +0000 (UTC)
Received: from 127.0.0.1 (localhost [127.0.0.1])
 by smtp01.syseleven.net (Postfix) with ESMTPSA id 6F3B457E39CD
 for <wireguard@lists.zx2c4.com>; Mon,  8 Feb 2021 21:05:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=syseleven.de;
 s=2015n001; t=1612814731;
 bh=Ux0DHsPzzmCg73iAD4xBHOJ9J/4+vnn29PL3Ph6TuBo=;
 h=From:Subject:To:Date:From;
 b=k/et3noo+SFrvExNob9/GQbjz3KFQXIoHzm6XF52GXQLDxKupbSIrxpACY6dxyWpe
 hWU9fWSlJBq/2EYVTzt3xttnGptu7iuQJi6qFxnQ9cKd8QQqvEhjhrZxSf4uTY6/6Y
 EXWEoFR1UTG8e5Fkpsp9ZVnScL5g80c+1ruJ3Veo=
From: Benedikt Braunger <b.braunger@syseleven.de>
Subject: Wireguard DKMS build on OpenVZ 7
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <cf30a113-8621-ccff-36e1-e34e09545d49@syseleven.de>
Date: Mon, 8 Feb 2021 21:05:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.100.3 at milter01.syseleven.net
X-Virus-Status: Clean
X-Mailman-Approved-At: Wed, 10 Feb 2021 15:00:18 +0000
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

Hello Tunnelerz,

Again I'm having trouble to compile the newest Wireguard DKMS module for
the wonderfully frankensteined OpenVZ / Virtuozzo 7 kernel.

The problem occures when updating the wireguard-dkms package

[17:32:10] root@test ~ # uname -a
Linux test 3.10.0-1127.18.2.vz7.163.46 #1 SMP Fri Nov 20 21:47:55 MSK 2020 x86_64 x86_64 x86_64 GNU/Linux
[17:32:11] root@test ~ # yum update wireguard-dkms -y 

...

Updated:

  wireguard-dkms.noarch 1:1.0.20210124-1.el7                                                                                                                                    

Complete!

[17:34:02] root@test ~ # dkms status
wireguard, 1.0.20210124: added

[17:34:03] root@test ~ # dkms autoinstall 
Kernel preparation unnecessary for this kernel.  Skipping...

Building module:

cleaning build area...

make -j48 KERNELRELEASE=3.10.0-1127.18.2.vz7.163.46 -C /lib/modules/3.10.0-1127.18.2.vz7.163.46/build M=/var/lib/dkms/wireguard/1.0.20210124/build...(bad exit status: 2)
Error! Bad return status for module build on kernel: 3.10.0-1127.18.2.vz7.163.46 (x86_64)
Consult /var/lib/dkms/wireguard/1.0.20210124/build/make.log for more information.

[17:34:14] root@test ~ # tail /var/lib/dkms/wireguard/1.0.20210124/build/make.log
  AS [M]  /var/lib/dkms/wireguard/1.0.20210124/build/crypto/zinc/chacha20/chacha20-x86_64.o
/var/lib/dkms/wireguard/1.0.20210124/build/crypto/zinc/chacha20/chacha20-x86_64.o: warning: objtool: chacha20_avx512vl()+0x35: can't find jump dest instruction at .text+0x1f3f
/var/lib/dkms/wireguard/1.0.20210124/build/socket.c: In function ‘send6’:
/var/lib/dkms/wireguard/1.0.20210124/build/socket.c:139:18: error: ‘const struct ipv6_stub’ has no member named ‘ipv6_dst_lookup_flow’
   dst = ipv6_stub->ipv6_dst_lookup_flow(sock_net(sock), sock, &fl,
                  ^

make[1]: *** [/var/lib/dkms/wireguard/1.0.20210124/build/socket.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [_module_/var/lib/dkms/wireguard/1.0.20210124/build] Error 2
make: Leaving directory `/usr/src/kernels/3.10.0-1127.18.2.vz7.163.46'

As far as I understand this comes from the fact that
"ipv6_dst_lookup_flo" is not available in some kernels but is in others
and obviously it is used wrong here.

So I fixed this using the following workaround:

export VERSION='1.0.20210124';
yum install -y wireguard-dkms;
echo '#define ipv6_dst_lookup_flow(a, b, c, d) ipv6_dst_lookup(a, b, &dst, c) + (void *)0 ?: dst' >> /usr/src/wireguard-$VERSION/compat/compat.h;
dkms build wireguard/$VERSION && dkms install wireguard/$VERSION;
modprobe wireguard

[17:43:17] root@test~ # dkms status
wireguard, 1.0.20210124, 3.10.0-1127.18.2.vz7.163.46, x86_64: installed

I think the culprit is in
https://git.zx2c4.com/wireguard-linux-compat/tree/src/compat/compat.h#n92
and following

These conditions do not match for the OpenVZ systems as they have a
3.10.0 kernel and are RHEL based. I suggest an additional check like

 (LINUX_VERSION_CODE = KERNEL_VERSION(3, 10, 0) && defined(ISRHEL7))

but I am not sure if this could interfere with older RHEL versions.

Feedback or good ideas very welcome :-)

Regards,
Beni

