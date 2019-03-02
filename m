Return-Path: <SRS0=7KPu=RF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0DEC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  2 Mar 2019 21:23:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1690020815
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  2 Mar 2019 21:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1690020815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lonnie.abelbeck.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8e1256b0;
	Sat, 2 Mar 2019 21:12:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b769055d
 for <wireguard@lists.zx2c4.com>; Sat, 2 Mar 2019 21:12:55 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25703b90
 for <wireguard@lists.zx2c4.com>; Sat, 2 Mar 2019 21:12:55 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 28CC31E3057;
 Sat,  2 Mar 2019 16:22:53 -0500 (EST)
Received: from [10.4.1.148] (wsip-70-184-211-81.om.om.cox.net [70.184.211.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id DAE391E304E;
 Sat,  2 Mar 2019 16:22:52 -0500 (EST)
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Subject: Re: iOS WG Battery Life
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <2iVkG0SJ64643A39NC7WLPcFxQc4oevInPxiNTvr0tixLQMLV3DyvvwNBLqj-tTk95sykibLeTPEPgDK1PvH4b-FS_YWR3kO9I3DLWuealE=@protonmail.com>
Date: Sat, 2 Mar 2019 15:22:51 -0600
Message-Id: <4CD5864C-48F7-43E7-A181-C2D00D45CB87@lonnie.abelbeck.com>
References: <zk1gAdr9rlJCh4vzh4DYSc11v_Ja4r_9xYurdAcwFsa50g2zMxHskd5Nb0leXZKUZrCqV3YIZFI5pNYptUGXTyQBIl5zWoF_N306lQKO_tg=@protonmail.com>
 <CAKXLc7dop2Q7cS0FJ=c0fA4os6HTZQHWuuqPxzb4bygsiRNu6Q@mail.gmail.com>
 <1cY0xL4k2A_qU-I2aF2Oz5uEt2LP_i6oCVA5H5rAsRet4lY1MU8GkCQWOXy8OYSZKGtprlH3lZorUozIOKChzb201YR8fdcMDsp5OS9zT1E=@protonmail.com>
 <EA2CDA40-8988-4C4F-B848-B2F7C6D8716C@lonnie.abelbeck.com>
 <2iVkG0SJ64643A39NC7WLPcFxQc4oevInPxiNTvr0tixLQMLV3DyvvwNBLqj-tTk95sykibLeTPEPgDK1PvH4b-FS_YWR3kO9I3DLWuealE=@protonmail.com>
To: kolargol <kolargol@protonmail.com>
X-Mailer: Apple Mail (2.3445.102.3)
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

Kalin,

As a single data point test, I borrowed my wife's iPod Touch
--
iPod Touch (6th gen., A8 processor)
iOS WireGuard v1.0.3
iOS 12.1.4
--
* Charged to 100%
* Enable WiFi only (Bluetooth disabled, no LTE) and WireGuard enabled
* No PersistentKeepalive enabled at either WG endpoint
* Swiped-close all running apps
* Let sit idle
* After 6 hours, battery reads 99% charged

Monitoring WG traffic at the "server" end, over 6 hours the delta traffic is:
--
0.26 MiB received,  0.30 MiB sent
--
It appears iOS generates packets about every 20 minutes or so.

Lonnie


> On Mar 2, 2019, at 1:54 PM, kolargol <kolargol@protonmail.com> wrote:
> 
> 
>> Possibly, is PersistentKeepalive defined at the "server" endpoint for your iOS peer ?
>> 
>> I would expect a measurable additional battery usage if either peer endpoint had PersistentKeepalive defined (non-zero).
> 
> Both server and peer have PersistentKeepalive disabled, there is no fancy apps runnign in backgroud - and i am using exac same WiFi and VPN endpoint (for OpenVPN and WG comparision).
> WiFI connection is stable and have strong signal, same with LTE.
> The battery grap shows sharp down in the night as something continuesly draing battery (here wg)
> How can i debug it ?

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
