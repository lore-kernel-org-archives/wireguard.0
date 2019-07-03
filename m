Return-Path: <SRS0=dwaG=VA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A91BC0650E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Jul 2019 16:43:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EDDD2189E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Jul 2019 16:43:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kent-dobias.com header.i=@kent-dobias.com header.b="i0jwYSkb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EDDD2189E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kent-dobias.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1785b445;
	Wed, 3 Jul 2019 16:43:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 190883a4
 for <wireguard@lists.zx2c4.com>; Wed, 3 Jul 2019 16:43:02 +0000 (UTC)
Received: from mail.kent-dobias.com (mail.kent-dobias.com
 [IPv6:2a04:52c0:101:4a2::8de9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d66badbb
 for <wireguard@lists.zx2c4.com>; Wed, 3 Jul 2019 16:43:01 +0000 (UTC)
Received: from [192.168.1.2] (unknown [10.9.0.3])
 by mail.kent-dobias.com (Postfix) with ESMTPSA id 72EF5C94B
 for <wireguard@lists.zx2c4.com>; Wed,  3 Jul 2019 12:42:59 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=kent-dobias.com;
 s=dkim; t=1562172179;
 bh=eenygffEdvbC9/I2W7/9pqXhlU1H4Eu+uzpPX1rnhHE=;
 h=From:Subject:To:References:Date:In-Reply-To;
 b=i0jwYSkbpG1ote9hDQFyUP52npW5nx9sXQAaPbvhH3bvTvxzMw6PxWYSl4grd8uVv
 ynQMqndu9TFSJroo1QQDZoR4203Pr4MXYhckazIJ/wNvcNzRTNQi/lNaw09KW8QRqM
 8MPxmETfm6NGzXtueLBh3bhlbzQg+PKY6Irkeiw8=
From: Jaron Kent-Dobias <jaron-wg@kent-dobias.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20190702` Available
To: wireguard@lists.zx2c4.com
References: <59eba07cc65097ac@frisell.zx2c4.com>
Openpgp: preference=signencrypt
Message-ID: <a54fa617-96a4-8b3b-2c34-3046c61c82a9@kent-dobias.com>
Date: Wed, 3 Jul 2019 12:42:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <59eba07cc65097ac@frisell.zx2c4.com>
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

> Hello,
> 
> A new snapshot, `0.0.20190702`, has been tagged in the git repository.
> 
> Please note that this snapshot is, like the rest of the project at this point
> in time, experimental, and does not constitute a real release that would be
> considered secure and bug-free. WireGuard is generally thought to be fairly
> stable, and most likely will not crash your computer (though it may).
> However, as this is a pre-release snapshot, it comes with no guarantees, and
> its security is not yet to be depended on; it is not applicable for CVEs.
> 
> With all that said, if you'd like to test this snapshot out, there are a
> few relevant changes.
> 
> == Changes ==
> 
>   * curve25519: not all linkers support bmi2 and adx
> 
>   This should allow WireGuard to build on older toolchains.
> 
>   * qemu: show signal when failing
> 
>   This was useful in tracking down upstream armeb bugs such as:
>   http://lists.infradead.org/pipermail/linux-arm-kernel/2019-May/655926.html
> 
>   * wg-quick: darwin: support being called from launchd
> 
>   We now ship a sample launchd file, for folks who would like to run WireGuard
>   on macOS servers with some form of automation. Most users are still advised to
>   use the GUI app from the App Store.
> 
>   * compat: some kernels weirdly backport prandom_u32_max
>   * compat: unify custom function prefix/suffix
>   * compat: rhel backported list modifications
> 
>   Usual maintance of our compat layer for existing platforms and kernels.
> 
>   * compat: support RHEL8's skb_mark_not_on_list backport
> 
>   We now support RHEL8/CentOS8's kernel.
> 
>   * global: switch to coarse ktime
> 
>   Our prior use of fast ktime before meant that sometimes, depending on how
>   broken the motherboard was, we'd wind up calling into the HPET slow path. Here
>   we move to coarse ktime which is always super speedy. In the process we had to
>   fix the resolution of the clock, as well as introduce a new interface for it,
>   landing in 5.3. Older kernels fall back to a fast-enough mechanism based on
>   jiffies.
> 
>   https://lore.kernel.org/lkml/tip-e3ff9c3678b4d80e22d2557b68726174578eaf52@git.kernel.org/
>   https://lore.kernel.org/lkml/20190621203249.3909-3-Jason@zx2c4.com/
> 
>   * netlink: cast struct over cb->args for type safety
> 
>   This follow recent upstream changes such as:
> 
>   https://lore.kernel.org/lkml/20190628144022.31376-1-Jason@zx2c4.com/
> 
>   * peer: use LIST_HEAD macro
> 
>   Style nit.
> 
>   * receive: queue dead packets to napi queue instead of empty rx_queue
> 
>   This mitigates a WARN_ON being triggered by the workqueue code. It was quite
>   hard to trigger, except sporadically, or reliably with a PC Engines ALIX, an
>   extremely slow board with an AMD LX800 that Ryan Whelan of Axatrax was kind
>   enough to mail me.
> 
> This snapshot contains commits from: Jason A. Donenfeld.
> 
> As always, the source is available at https://git.zx2c4.com/WireGuard/ and
> information about the project is available at https://www.wireguard.com/ .
> 
> This snapshot is available in compressed tarball form here:
>   https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190702.tar.xz
>   SHA2-256: 1a1311bc71abd47a72c47d918be3bacc486b3de90734661858af75cc990dbaac
>   BLAKE2b-256: 3b8668eed4c11c3d5995f23152c645ee40017ab84c8b15ce5f84015730290c9f
> 
> A PGP signature of that file decompressed is available here:
>   https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20190702.tar.asc
>   Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
> 
> If you're a snapshot package maintainer, please bump your package version. If
> you're a user, the WireGuard team welcomes any and all feedback on this latest
> snapshot.
> 
> Finally, WireGuard development thrives on donations. By popular demand, we
> have a webpage for this: https://www.wireguard.com/donations/
> 
> Thank you,
> Jason Donenfeld
> 
> 
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 

The new snapshot is causing build failures for my android kernel. A log
follows. I'm using the manifest drop-in described on the XDA forums [1].
The kernel source is here [2].

Jaron

[1]
https://forum.xda-developers.com/android/development/wireguard-rom-integration-t3711635
[2] https://github.com/boulzordev/android_kernel_motorola_msm8937

>   CC      net/wireguard/device.o
> In file included from <built-in>:2:
> ./../../../../../../kernel/motorola/msm8953/net/wireguard/compat/compat.h:410:21: error: use of undeclared identifier 'HZ_TO_USEC_NUM'
>         return div_u64(j * HZ_TO_USEC_NUM, HZ_TO_USEC_DEN) * 1000;
>                            ^
> ./../../../../../../kernel/motorola/msm8953/net/wireguard/compat/compat.h:410:37: error: use of undeclared identifier 'HZ_TO_USEC_DEN'
>         return div_u64(j * HZ_TO_USEC_NUM, HZ_TO_USEC_DEN) * 1000;
>                                            ^
> 2 errors generated.
> make[3]: *** [/home/pants/dev/lineage-microg-docker-volumes/src/LINEAGE_16_0/kernel/motorola/msm8953/scripts/Makefile.build:271: net/wireguard/main.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> In file included from <built-in>:2:
> ./../../../../../../kernel/motorola/msm8953/net/wireguard/compat/compat.h:410:21: error: use of undeclared identifier 'HZ_TO_USEC_NUM'
>         return div_u64(j * HZ_TO_USEC_NUM, HZ_TO_USEC_DEN) * 1000;
>                            ^
> ./../../../../../../kernel/motorola/msm8953/net/wireguard/compat/compat.h:410:37: error: use of undeclared identifier 'HZ_TO_USEC_DEN'
>         return div_u64(j * HZ_TO_USEC_NUM, HZ_TO_USEC_DEN) * 1000;
>                                            ^
> 2 errors generated.
> make[3]: *** [/home/pants/dev/lineage-microg-docker-volumes/src/LINEAGE_16_0/kernel/motorola/msm8953/scripts/Makefile.build:271: net/wireguard/noise.o] Error 1
> In file included from <built-in>:2:
> ./../../../../../../kernel/motorola/msm8953/net/wireguard/compat/compat.h:410:21: error: use of undeclared identifier 'HZ_TO_USEC_NUM'
>         return div_u64(j * HZ_TO_USEC_NUM, HZ_TO_USEC_DEN) * 1000;
>                            ^
> ./../../../../../../kernel/motorola/msm8953/net/wireguard/compat/compat.h:410:37: error: use of undeclared identifier 'HZ_TO_USEC_DEN'
>         return div_u64(j * HZ_TO_USEC_NUM, HZ_TO_USEC_DEN) * 1000;
>                                            ^
> 2 errors generated.
> make[3]: *** [/home/pants/dev/lineage-microg-docker-volumes/src/LINEAGE_16_0/kernel/motorola/msm8953/scripts/Makefile.build:271: net/wireguard/device.o] Error 1
> make[2]: *** [/home/pants/dev/lineage-microg-docker-volumes/src/LINEAGE_16_0/kernel/motorola/msm8953/scripts/Makefile.build:416: net/wireguard] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/home/pants/dev/lineage-microg-docker-volumes/src/LINEAGE_16_0/kernel/motorola/msm8953/Makefile:988: net] Error 2
> make[1]: Leaving directory '/home/pants/dev/lineage-microg-docker-volumes/src/LINEAGE_16_0/out/target/product/potter/obj/KERNEL_OBJ'
> make: *** [Makefile:145: sub-make] Error 2
> make: Leaving directory '/home/pants/dev/lineage-microg-docker-volumes/src/LINEAGE_16_0/kernel/motorola/msm8953'
> [ 46% 1325/2823] AAPT2 link /home/pants/dev/lineage-microg-do.../product/potter/obj/APPS/Dialer_intermediates/package-res.apk
> warn: removing resource com.android.dialer:string/main_send_feedback without required default value.
> warn: removing resource com.android.dialer:string/now without required default value.
> warn: removing resource com.android.dialer:string/spam_notification_dialog_was_not_spam_action_text without required default value.
> warn: removing resource com.android.dialer:string/spam_notification_not_spam_action_text without required default value.
> warn: removing resource com.android.dialer:string/spam_notification_spam_call_expanded_text without required default value.
> ninja: build stopped: subcommand failed.
> 12:08:33 ninja failed with: exit status 1
> 
> #### failed to build some targets (25:53 (mm:ss)) ####
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
