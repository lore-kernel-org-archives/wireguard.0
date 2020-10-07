Return-Path: <SRS0=8uvs=DO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88405C4363C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Oct 2020 11:15:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 468802075A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Oct 2020 11:15:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mmoya.org header.i=@mmoya.org header.b="fAXWYnCs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 468802075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mmoya.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbc61786;
	Wed, 7 Oct 2020 10:43:04 +0000 (UTC)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [2a00:1450:4864:20::442])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c905cb1f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Oct 2020 10:43:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z1so1690027wrt.3
 for <wireguard@lists.zx2c4.com>; Wed, 07 Oct 2020 04:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mmoya.org; s=default;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sZF0bAGopAoeNB9NuAHjt7yQrDRACdo2sqFh8AfNV1Q=;
 b=fAXWYnCsB5+MOVdfibMHo6wPH5IqD9qL6wL+NJun8KCgSWfyqb2E1wPJSlKFchsktC
 RrqXUJ4Nt+75s/7esgJEJIqv0dADM1Hu8Kp2AO23yVsoRcsrsvbgm1Lxkqk0S+P7njCk
 UVR7oWxos8aio8LbOzopDlPoa5EX4au4pczds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sZF0bAGopAoeNB9NuAHjt7yQrDRACdo2sqFh8AfNV1Q=;
 b=Z8795NGHdFAtNEwtFn0rcmkEG8zNQZXSNV0Nz4d/N3zjZTTfyZo2FZIFjFGHb7s3M7
 KrgszrFoM1JTemnFk/JwcekZaVDQrJXSzWsDUslFDbee3vD3Ih254/CJTThibT/neFi6
 wl7fcMn69BHK7+kMwDyIUNUX0a7oZ4NVm4n+lsJFw5N/MvIW0nCq76oMqg9/jejbF0mT
 32DgpUd9sLYrGG9/+vFG2eOxTbBUnaFK5+xhwxhtXeMEoMgUHpM0uPCXZISPvK+mQwU1
 INqp3vWxjaPhQimQIua+2ssFezYzsVpVVeZn2NjfGGDantfiQ2n6DhyfaxUpHm3xQ0UK
 Ad3w==
X-Gm-Message-State: AOAM531sGIdCSWctnL9Z29ha9DpjgmGRIZA6f70Hup8al7kfkkNpsMgQ
 ythF6C3ZjX8zBZbL6W2X/1HGuHrTFhvdgw==
X-Google-Smtp-Source: ABdhPJw39ofvvggGko/mSw+NpoTp1uvMYHEJNf0BIjkM0IX3sRauNqJFDAjc0v4F2HxbIGmDCpIaNw==
X-Received: by 2002:adf:f50c:: with SMTP id q12mr3169107wro.249.1602069334981; 
 Wed, 07 Oct 2020 04:15:34 -0700 (PDT)
Received: from [192.168.43.230] ([84.78.242.250])
 by smtp.googlemail.com with ESMTPSA id n66sm2290517wmb.35.2020.10.07.04.15.33
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 04:15:34 -0700 (PDT)
Subject: Re: final call for Ubuntu 14.04 WireGuard support
To: wireguard@lists.zx2c4.com
References: <CAHmME9rckipsdZYW+LA=x6wCMybdFFA+VqoogFXnR=kHYiCteg@mail.gmail.com>
From: Maykel Moya <mmoya@mmoya.org>
Autocrypt: addr=mmoya@mmoya.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b79d077b-4964-2df9-6ebc-ea40bd60b747@mmoya.org>
Date: Wed, 7 Oct 2020 13:15:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9rckipsdZYW+LA=x6wCMybdFFA+VqoogFXnR=kHYiCteg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-IE
Content-Transfer-Encoding: 8bit
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

Hi, Jason

On 21/7/20 15:12, Jason A. Donenfeld wrote:

> If you _are_ using WireGuard on Ubuntu 14.04 or know somebody who is,
> this would be the time to pipe up, so that we don't leave anyone
> hanging. Feel free to respond to this thread regarding ongoing
> WireGuard+14.04 usage and why updating your operating system isn't
> convenient, or send me an email privately if public disclosure of your
> infrastructure isn't an option.

A little late to the party, but anyway...

I'm one of the users of Wireguard in a Ubuntu 14.04. The big red warning
in the postinst script lead me here.

Despite being on trusty, I'm using a 4.4.0 kernel provided trough
trusty-security[1], specifically package linux-image-4.4.0-148-generic
version 4.4.0-148.174~14.04.1.

Today I upgraded the wireguard version to the latest one available in
the PPA, 1.0.20200712-1ppa1~14.04.2 and the module failed to build with
the following error:

$ cat make.log
DKMS make.log for wireguard-1.0.20200712 for kernel 4.4.0-148-generic
(x86_64)
Wed Oct  7 10:28:06 UTC 2020
make: Entering directory `/usr/src/linux-headers-4.4.0-148-generic'
  LD      /var/lib/dkms/wireguard/1.0.20200712/build/built-in.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200712/build/main.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200712/build/noise.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200712/build/device.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200712/build/peer.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200712/build/timers.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200712/build/queueing.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200712/build/send.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200712/build/receive.o
  CC [M]  /var/lib/dkms/wireguard/1.0.20200712/build/socket.o
/var/lib/dkms/wireguard/1.0.20200712/build/socket.c: In function ‘send6’:
/var/lib/dkms/wireguard/1.0.20200712/build/socket.c:139:18: error:
‘const struct ipv6_stub’ has no member named ‘ipv6_dst_lookup_flow’
   dst = ipv6_stub->ipv6_dst_lookup_flow(sock_net(sock), sock, &fl,
                  ^
make[1]: *** [/var/lib/dkms/wireguard/1.0.20200712/build/socket.o] Error 1
make: *** [_module_/var/lib/dkms/wireguard/1.0.20200712/build] Error 2
make: Leaving directory `/usr/src/linux-headers-4.4.0-148-generic'

I saw the CI and latest wireguard-linux-compat is tested against 4.4.238.

This kernel is based on upstream 4.4.177

$ cat /proc/version_signature
Ubuntu 4.4.0-148.174~14.04.1-generic 4.4.177

Given that wireguard-linux-compat aims to support kernel versions 3.10
to 5.5, I'm writing with the hope to clarify if this bug is related to
compatibility with linux 4.4.x or something related to this specific
combination of distro provided kernel and unsupported distro.

I manage to make it work by forcing the compat definition of
ipv6_dst_lookup_flow with an ugly patch, just checking for
kernel_version 4.4.177.

--- compat.h.orig       2020-07-22 14:28:54.000000000 +0000
+++ compat.h    2020-10-07 11:00:04.385854751 +0000
@@ -94,7 +94,13 @@

 #if LINUX_VERSION_CODE < KERNEL_VERSION(3, 17, 0) && LINUX_VERSION_CODE
>= KERNEL_VERSION(3, 16, 83)
 #define ipv6_dst_lookup_flow(a, b, c, d) ipv6_dst_lookup_flow(b, c, d)
-#elif (LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 5) &&
LINUX_VERSION_CODE >= KERNEL_VERSION(5, 4, 0)) || (LINUX_VERSION_CODE <
KERNEL_VERSION(5, 3, 18) && LINUX_VERSION_CODE >= KERNEL_VERSION(4,
20, 0) && !defined(ISUBUNTU1904)) || (!defined(ISRHEL8) &&
!defined(ISDEBIAN) && !defined(ISUBUNTU1804) && LINUX_VERSION_CODE <
KERNEL_VERSION(4, 19, 119) && LINUX_VERSION_CODE >= KERNEL_VERSION(4
, 15, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 14, 181) &&
LINUX_VERSION_CODE >= KERNEL_VERSION(4, 10, 0)) || (LINUX_VERSION_CODE <
KERNEL_VERSION(4, 9, 224) && LINUX_VERSION_CODE >= KERNEL_
VERSION(4, 5, 0)) || (LINUX_VERSION_CODE < KERNEL_VERSION(4, 4, 224) &&
!defined(ISUBUNTU1604))
+#elif (LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 5)    &&
LINUX_VERSION_CODE >= KERNEL_VERSION(5, 4, 0)) || \
+      (LINUX_VERSION_CODE < KERNEL_VERSION(5, 3, 18)   &&
LINUX_VERSION_CODE >= KERNEL_VERSION(4, 20, 0) &&
!defined(ISUBUNTU1904)) || \
+      (LINUX_VERSION_CODE < KERNEL_VERSION(4, 19, 119) &&
LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0) && !defined(ISRHEL8) &&
!defined(ISDEBIAN) && !defined(ISUBUNTU1804)) || \
+      (LINUX_VERSION_CODE < KERNEL_VERSION(4, 14, 181) &&
LINUX_VERSION_CODE >= KERNEL_VERSION(4, 10, 0)) || \
+      (LINUX_VERSION_CODE < KERNEL_VERSION(4, 9, 224)  &&
LINUX_VERSION_CODE >= KERNEL_VERSION(4, 5, 0)) || \
+      (LINUX_VERSION_CODE < KERNEL_VERSION(4, 4, 224)  &&
!defined(ISUBUNTU1604)) || \
+      (LINUX_VERSION_CODE == KERNEL_VERSION(4, 4, 177))
 #define ipv6_dst_lookup_flow(a, b, c, d) ipv6_dst_lookup(a, b, &dst, c)
+ (void *)0 ?: dst
 #endif

Despite the outcome of this email, please consider aligning the
conditional clauses, they are much easier to read than having everything
in one line.

Given that Ubuntu defines in compat.h are solely based on kernel
versions and support for older releases will be dropped at some point, I
don't know if the decent fix for this is to change the latest clause from:

kernel_version < 4.4.224 && !ubuntu_1604

to just:

kernel_version < 4.4.224

Thanks for the great work,
maykel

[1]:
http://security.ubuntu.com/ubuntu/dists/trusty-security/main/binary-amd64/
