Return-Path: <SRS0=CDXv=5U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2968DC2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 22:42:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8751206CC
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 22:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8751206CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mageia.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7cafadc;
	Sat, 4 Apr 2020 22:33:34 +0000 (UTC)
Received: from mx2.yrkesakademin.fi (mx2.yrkesakademin.fi [85.134.45.195])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f5dfda99
 (TLSv1.2:AES256-GCM-SHA384:256:NO) for <wireguard@lists.zx2c4.com>;
 Wed, 1 Apr 2020 14:17:50 +0000 (UTC)
Subject: Re: [ANNOUNCE] wireguard-linux-compat v1.0.20200330 released
To: Roman Mamedov <rm@romanrm.net>, "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <38842e471ccb3582@frisell.zx2c4.com>
 <20200401174811.5cf6895c@natsu>
From: Thomas Backlund <tmb@mageia.org>
Message-ID: <7535207e-40f4-564b-a2be-05d4fc4e123c@mageia.org>
Date: Wed, 1 Apr 2020 17:25:57 +0300
MIME-Version: 1.0
In-Reply-To: <20200401174811.5cf6895c@natsu>
Content-Type: multipart/mixed; boundary="------------AA11788E39C444B7F7398E05"
Content-Language: en-US
X-Mailman-Approved-At: Sun, 05 Apr 2020 00:33:28 +0200
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

--------------AA11788E39C444B7F7398E05
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit


Den 01-04-2020 kl. 15:48, skrev Roman Mamedov:
> On Mon, 30 Mar 2020 18:19:17 -0600
> "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA256
>>
>> Hello,
>>
>> A new version, v1.0.20200330, of the backported WireGuard kernel module for
>> 3.10 <= Linux <= 5.5.y has been tagged in the git repository.
> My kernel build for 5.4.29 has failed just now:
>
> In file included from <command-line>:
> ././net/wireguard/compat/compat.h:1029:20: error: redefinition of ‘skb_reset_redirect’
>   static inline void skb_reset_redirect(struct sk_buff *skb)
>                      ^~~~~~~~~~~~~~~~~~
> In file included from ././net/wireguard/compat/compat.h:878,
>                   from <command-line>:
> ./include/linux/skbuff.h:4538:20: note: previous definition of ‘skb_reset_redirect’ was here
>   static inline void skb_reset_redirect(struct sk_buff *skb)
>                      ^~~~~~~~~~~~~~~~~~
> In file included from <command-line>:
> ././net/wireguard/compat/compat.h: In function ‘skb_reset_redirect’:
> ././net/wireguard/compat/compat.h:1032:2: error: implicit declaration of function ‘skb_reset_tc’; did you mean ‘skb_reserve’? [-Werror=implicit-function-declaration]
>    skb_reset_tc(skb);
>    ^~~~~~~~~~~~
>    skb_reserve
> cc1: some warnings being treated as errors
> scripts/Makefile.build:265: recipe for target 'net/wireguard/main.o' failed
> make[3]: *** [net/wireguard/main.o] Error 1
> scripts/Makefile.build:500: recipe for target 'net/wireguard' failed
> make[2]: *** [net/wireguard] Error 2
>

This is because the skb_reset_redirect() change from 5.6 got backported 
in 5.5.14 and 5.4.29, so you need the attached patch


--

Thomas



--------------AA11788E39C444B7F7398E05
Content-Type: text/x-patch; charset="UTF-8";
	name="net-wireguard-fix-check-for-skb_reset_redirect-backport.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="net-wireguard-fix-check-for-skb_reset_redirect-backport.patc";
	filename*1="h"


Fix skb_reset_redirect() backport version check.

Upstream commit 2c64605b590edadb3fb46d1ec6badb49e940b479 got backported in
stable 5.5.14 and 5.4.29, so we need to adjust the version check.

Signed-off-by: Thomas Backlund <tmb@mageia.org>

--- a/net/wireguard/compat/compat.h
+++ b/net/wireguard/compat/compat.h
@@ -1024,7 +1024,7 @@ out:
 #define COMPAT_CANNOT_USE_MAX_MTU
 #endif
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 6, 0)
+#if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 5, 14) && LINUX_VERSION_CODE >= KERNEL_VERSION(5, 5, 0)) || LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 29)
 #include <linux/skbuff.h>
 static inline void skb_reset_redirect(struct sk_buff *skb)
 {

--------------AA11788E39C444B7F7398E05--
