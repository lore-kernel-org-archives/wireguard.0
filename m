Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6DAC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 Apr 2022 22:47:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id e7abc8cf;
	Tue, 5 Apr 2022 22:46:46 +0000 (UTC)
Received: from mx2.freebsd.org (mx2.freebsd.org [2610:1c1:1:606c::19:2])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 89cd78de
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Apr 2022 22:46:44 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id A2DD37C837;
 Tue,  5 Apr 2022 22:46:43 +0000 (UTC) (envelope-from jhb@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4KY2nb3vVNz3HQ4;
 Tue,  5 Apr 2022 22:46:43 +0000 (UTC) (envelope-from jhb@FreeBSD.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1649198803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=koOI1D6rcdD4Yd0kl9Ts/URIZvEyAa/cBCS2pzxA7Vw=;
 b=txeMRnhzy7DkwlRiIoA9yJLa2Qj5Hn3ZmfGX090nfxc09ycT09SNInkM/b4vPbCOCzZitu
 hJKfVI4osyQMbNZquIP9Tg/g9h7AURHfbhQwM6Zeo2dVwvwGsCgltiWEziLUBLTVifkf0r
 NH1uHJQU6/ZnmQFEMoDn99fXiWV6/sfVQBwRVgHltwCav0tto3IksZprJDYc4iqGepyG+1
 eJqXPufs0wyHVpzUQ10BjrLoAsoWxLQB78vnsywSTC6+0TGqsj7rJBxze6gSi5Q6UwJYPQ
 YAXntlH9DHg/0pbdIZsZWBH4b0Qy3NWN4BSxRNlzqIrsf0Tnlm853En5hPen1A==
Received: from [10.0.1.4] (ralph.baldwin.cx [66.234.199.215])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate) (Authenticated sender: jhb)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 088F52919F;
 Tue,  5 Apr 2022 22:46:42 +0000 (UTC) (envelope-from jhb@FreeBSD.org)
Message-ID: <5bf5dd1f-8e21-ece2-ef3c-f62e752cb774@FreeBSD.org>
Date: Tue, 5 Apr 2022 15:46:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
To: wireguard@lists.zx2c4.com
Content-Language: en-US
From: John Baldwin <jhb@FreeBSD.org>
Cc: Ed Maste <emaste@FreeBSD.org>
Subject: Patches against wireguard-freebsd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1649198803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=koOI1D6rcdD4Yd0kl9Ts/URIZvEyAa/cBCS2pzxA7Vw=;
 b=vLgzrb78DjpPm1UW6HIYf4QwCUYIBvd677ZPnFems5PKOSEeW+pcnzoxa1LWJwtkG5V+CX
 RlG+aQWCmo/Wpxw48SqRAaSy7AwUGXtA7NugaKR3sHroCxXDnDMpzHry/A+J94ewLtj4R5
 X1Tuc7Oqw59qNQHyJl9VEZ1oBfm3JdLnLNQ56wJamyvZn15GmzP5jux8yzg86UK+n+DqS3
 qwnyeVqthPH3mba2YnGoaushx2jmVx55KS31mh/N/D7bkw0j0n8QWaBIrALyxowarbkoyi
 2adaiuTTTxegUOo89YsdORa3XDSdZ2RHTsJynRrNRHY+LA5u3IwMAofmsJ4dyw==
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1649198803; a=rsa-sha256; cv=none;
 b=t4YEZx7RWrMH2ca8E6F6mPAM4iWEUBIprqWM1nVlNBin7V4Hg2cUa5Xbeo8ckF+uBl9786
 sLWfqsiGQ2ZVZxVfKHvAjuO+/9fK7yfalOBO6aPY8eEv96QZ7obSBs9Z944jSBj/CLb2AB
 Yo67MjWz2NT1lrsWr6yB8IbKg4PRpLr91aWl36bcWKUke/YhK6OocuBhohD7UCtozX2Sig
 zPblnWH+pBllTz5JNvxV7vpQE/YPi1Emd7L4fRStm/fbBJ3G4M9PIC9Wcs4/9cmlrwZLyP
 w7BAz4FVj4hyIgyGs/v7qzAjxDIksxfuMAsKRNVqBW4AiPpP/fEWh8k2R/m2TA==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
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

I have a series of patches against the FreeBSD driver available on
the jb-wip branch which I believe is (mostly) a candidate for merging
to master.  The changes in the branch include:

- 9d1881a Only include compat.h for if_wg.c and fix build with an obj directory.

This patch permits building the module as part of a kernel build via
the LOCAL_MODULES hook in 'make buildkernel'.

- 2c4b941 wg_queue_len: Remove locking.
- 61b401e wg_queue_delist_staged: Use more standard STAILQ_CONCAT.

Misc small fixes, generally cosmetic.

- d746eed wgc_get/set: Use M_WAITOK with malloc().
- 9223fbb wg_clone_create: Use M_WAITOK with malloc.
- 9095ebe wg_peer_alloc and wg_aip_add: Use M_WAITOK with malloc.

The ioctl path in FreeBSD generally uses M_WAITOK rather than M_NOWAIT
(e.g. the non-smalldata case in sys_ioctl()).  This slightly simplifies
the code by avoiding additional edge cases to handle.  It is also true
that FreeBSD admins do not generally expect 'ifconfig create' to fail
non-deterministically (that is, they only expect failure for things
like invalid arguments, missing kernel module, etc.).

- 4fbba97 wg_mbuf_reset: Don't free send tags.
- 0a5fa77 ratelimit_init: Use callout_init_mtx.

More misc small fixes.

- a679db5 DNM: Add counters for the times en/decrypt tasks do no work.

This is the one commit that I don't think is a merge candidate, instead
it adds some counters useful for evaluating the effect of the next
commit.

- 89f91dc Avoid scheduling excessive tasks for encryption/decryption.

There is more detail in the commit log, but this commit changes the
scheduling of encryption/decryption tasks to match the behavior of the
WireGuard driver in Linux instead of the current approach of
scheduling a task on all available CPUs for every packet.  In my
performance benchmarks of this series, this commit had the single
largest effect of any of the changes.  My benchmark consisted of
running iperf across a tunnel between two jails on the same host (an
X1 Carbon laptop with 8 CPU threads).  This commit generally resulted
in a doubling of throughput for both UDP and TCP with 1, 2, 4, or 8
streams.

To better explain why this change matters, I sampled the counters
added in the previous commit for a sample run of iperf with a single
TCP stream.  The "empty" counters count the number of tasks which ran
on a CPU but had no work to do, the "work" counters count the number
of tasks which encrypted or decrypted at least one packet.

Using the current code gave the following counts:

hw.wg.encrypt_work: 992858
hw.wg.encrypt_empty: 6274830
hw.wg.decrypt_work: 1114235
hw.wg.decrypt_empty: 7064707

encrypt efficiency: 13.7%
decrypt efficiency: 13.6%

The efficiency is close to the 12.5% worst-case for an 8 CPU system.

Using the code in this commit gave the following:

hw.wg.encrypt_work: 1486616
hw.wg.encrypt_empty: 783377
hw.wg.decrypt_work: 1880567
hw.wg.decrypt_empty: 657807

encrypt efficiency: 65.5%
decrypt efficiency: 74.1%

Note: The increased "work" counts here are a result of the increased
throughput

In addition, a user recently mailed Jason and I directly to say that
this commit greatly reduced the power usage for a WG endpoint in an
ESXi VM putting the FreeBSD VM nearly on par with a Linux VM
performing the same work.

- 4e0478f wg_module_init: Clean up more if the self tests fail.
- b885223 Return an error code from mbuf crypt routines.

Small fixes preparing to use crypto support from FreeBSD.

- ce85779 Use OCF to encrpyt/decrypt packets when supported.
- 8ad55a8 Use <crypto/chacha20_poly1305.h> when present.
- 447abb Use curve25519 API from the kernel when available.

Use crypto support from FreeBSD's kernel on new-enough versions (the
OCF bits are available on 13.0-stable and later, the rest are only
present in 14.0-current).  FreeBSD's kernel does not currently provide
a suitable API for Blake2 that matches WireGuard's needs, but does
provide suitable APIs for the other crypto algorithms used by
WireGuard in 14.0-current.

-- 
John Baldwin
