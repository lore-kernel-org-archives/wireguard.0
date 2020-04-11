Return-Path: <SRS0=6BFc=56=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA5FC352BE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 08:13:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F6B62074D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 08:13:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Iu5kd/ds"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F6B62074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8d71d76;
	Tue, 14 Apr 2020 08:03:45 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6dbe8575
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Apr 2020 18:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1586629287;
 bh=TGG9nifKSUT4Ka/HtzmLvmPJhD34wgE+kuCxl4Jg8MU=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=Iu5kd/dstYW9/DE5BNzQSavbksve47O667cMJDSzrm3Nw5paAV+6FMS3gxRGsLISP
 AytFm3wQqb97mlCMKOiXHI7VSo5rxQYWTiKF1dF2WS6BIVSy3BcyoO6QjhN6HkLBgi
 xQYhY5zj7UdZ/rMOgIVwXP6K/ZTpz0q4s+KG0BGQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.0.2] ([176.199.252.22]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2DxE-1jHWAr0Oy6-013aMF for
 <wireguard@lists.zx2c4.com>; Sat, 11 Apr 2020 20:21:27 +0200
To: wireguard@lists.zx2c4.com
From: Christian Weiss <cwei@gmx.net>
Subject: RHEL 7.8, Kernel 3.10: ratelimiter.c:25:1: error: unknown type name
 'hsiphash_key_t'
Message-ID: <0312354a-8bdb-00b1-f342-092c71e4817c@gmx.net>
Date: Sat, 11 Apr 2020 20:21:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ntzw34ZRnVT3ZAihwXJnbJBQJWKAOWzs4UKG51QMMiu2GjlUZju
 YbFuWww7M/wQfXTpAe2e0SEk+ix7Kmi593lWMX9QYGGYlyoJRHYIP7y2iOBsTJKCe1bNG+p
 C/wRz/4ZK/m8kf9jw1HlCe6ElzaSRH5vu5VddPsdl6u1Vo8NlM4y1DZPfXfK5XC6C82dnS9
 eNaLLsOPWTZH1qfUTTElw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NFw8aoUZN2U=:/kTX1dqfAaAaICOFwKvB8Y
 a6SSHgVe4gU2zrWRyml9y1mC7wAqtbAFp6KFBIPZBSmyEQrM7ERdEuB1wNI+SuYBQLgrFb5wr
 Zw7+nKejaoY6GsXSV7UfWVqlyeMaGcw88rN3Tyr8ZV5OZNbCxdkCfEWFdC2FqI5V1gV/CIh9H
 rew4JNentEo4XfIfygjh8P2j0TG8INfoi2Umz9hvRVoaHTAQeMo6XLKucAk+2dfov2iMuLP2h
 aCLqzPQNBTN+1rYYUu8RtJZqPhMshwxLvLJA6e0oBWZyukQclz97Q9II28BgrKsj+Oz9IxoMs
 hlRIiUrn/jcxBXMTZckvIOauyeWa8Vn9/DIgQDvO6NCK7A8gcopLrao8JEAPEeNnEyeP6hWVw
 toe3sneMTOOkK+qE1PTB1jUvjpsKU9jcuy+RUk/hys1reAXJkerxWq4M+EJPjxSXe52O7UZ+b
 T8STJ72cBecF5mGB0H4iZ3vvvN1/KwEqx6Pnb4FAffFc36T2lwUZSn0dpe8ZJVAyiLJBMJcab
 hvgs9Ts7y4MwxqxDDWao1M750yKooiB9bzch5M6LYX+7x2cg3hcIiulMwrITTeX4V69H55GYi
 gizau/3Yv5nh9UgYQes7XcQVgo4JytWeNdFTWXOmk7WKfF/f6n0e2WpHR8G4vDVQMoySJsV8d
 XQ2K6VgA/tk8VdFGAfyEp+UetdKK4JY5mbDc+2t/StPqFLT3JP0OzM2lnKXSkES+KW/5rwUwV
 Vag/9Cj0VfQJwrMJYA1yzaApQ0Meo3b4NN9qOgweGtEFbrnDpb3hLJ1iFYGNtZzu+dpECIJls
 XxmX18Oo8G44Vd5d6DSOgfleyorkTHezMpAt/9Ovu7aIZVHmDT/X34ezFN+eyS4/4u1CgE/tf
 Hco3SBT+Nq9WUCEg1/CYcIp6/AibsR+yPW6/wu5UYcEkFo0hqtpo1g4m5wxQj7439aJhK7wEg
 b+kkF6RTcoIU/JK6PmpF8JImJT9zgqn4QDSueygPjJEv1c4diEKO96jxh5GTLQ004wwqrPUVO
 RXUBfMsxQxg+dglWAfbXutR0bftBuuYm447jWgcvHIN+KxfoF462LSxBHZi+8y9RJJWNzT1Sa
 bUnjHJdaZjzt13LmYL5qpLgtxBd1AKYavhEyk6k5zf6rH8/3bUterM2Bw0feTurvsnywyvtQ6
 7Z64+GjlOed34SEXf/1Gi84kF6wr5C9eIgXm7j/acE858iZ//MZaOKbnbaWQSHJNLnS5/2W+F
 l5om8gPnGnfpL5Q4U
X-Mailman-Approved-At: Tue, 14 Apr 2020 10:03:41 +0200
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

Hello Dear Mailinglist,

with RHEL 7.8, kernel 3.10 and current Wireguard 1.0.20191226 make
throws the obove error:

# rpm -qa "wireguard*"
wireguard-tools-1.0.20191226-1.el7.x86_64
wireguard-dkms-1.0.20200401-1.el7.noarch

# cat /etc/oracle-release
Oracle Linux Server release 7.8

# uname -a
Linux xxxxxxxx 3.10.0-1127.el7.x86_64 #1 SMP Wed Apr 1 10:20:09 PDT 2020
x86_64 x86_64 x86_64 GNU/Linux

# make
  CC [M]  /var/lib/dkms/wireguard/1.0.20200401/build/main.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200401/build/noise.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200401/build/device.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200401/build/peer.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200401/build/timers.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200401/build/queueing.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200401/build/send.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200401/build/receive.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200401/build/socket.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200401/build/peerlookup.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200401/build/allowedips.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200401/build/ratelimiter.o
/var/lib/dkms/wireguard/1.0.20200401/build/ratelimiter.c:25:1: error:
unknown type name =E2=80=98hsiphash_key_t=E2=80=99
 static hsiphash_key_t key;
 ^
/var/lib/dkms/wireguard/1.0.20200401/build/ratelimiter.c: In function
=E2=80=98wg_ratelimiter_allow=E2=80=99:
/var/lib/dkms/wireguard/1.0.20200401/build/ratelimiter.c:109:3: error:
implicit declaration of function =E2=80=98hsiphash_2u32=E2=80=99
[-Werror=3Dimplicit-function-declaration]
   bucket =3D &table_v4[hsiphash_2u32(net_word, ip, &key) &
   ^
/var/lib/dkms/wireguard/1.0.20200401/build/ratelimiter.c:116:3: error:
implicit declaration of function =E2=80=98hsiphash_3u32=E2=80=99
[-Werror=3Dimplicit-function-declaration]
   bucket =3D &table_v6[hsiphash_3u32(net_word, ip >> 32, ip, &key) &
   ^
cc1: some warnings being treated as errors
make[2]: *** [/var/lib/dkms/wireguard/1.0.20200401/build/ratelimiter.o]
Error 1
make[1]: *** [_module_/var/lib/dkms/wireguard/1.0.20200401/build] Error 2
make: *** [module] Error 2


The following change works for me; make succeeds:
=2D-- compat/compat.h.bak 2020-04-11 20:04:15.077425108 +0200
+++ compat/compat.h     2020-04-11 20:06:39.279397118 +0200
@@ -1034,7 +1034,7 @@
 }
 #endif

-#if defined(ISUBUNTU1604)
+#if defined(ISUBUNTU1604) || defined(ISRHEL7)
 #include <linux/siphash.h>
 #ifndef _WG_LINUX_SIPHASH_H
 #define hsiphash_2u32 siphash_2u32

Kind regards,
Christian
