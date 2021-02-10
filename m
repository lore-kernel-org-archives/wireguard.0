Return-Path: <SRS0=gJ+C=HM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A47C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Feb 2021 15:00:26 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67FB864E74
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Feb 2021 15:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67FB864E74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nexgo.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5403bb26;
	Wed, 10 Feb 2021 15:00:24 +0000 (UTC)
Received: from vsmx009.vodafonemail.xion.oxcs.net
 (vsmx009.vodafonemail.xion.oxcs.net [153.92.174.87])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4b99cc1a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Feb 2021 14:58:01 +0000 (UTC)
Received: from vsmx001.vodafonemail.xion.oxcs.net (unknown [192.168.75.191])
 by mta-5-out.mta.xion.oxcs.net (Postfix) with ESMTP id 71508159BD28;
 Wed, 10 Feb 2021 14:58:01 +0000 (UTC)
Received: from H270 (unknown [91.56.246.229])
 by mta-5-out.mta.xion.oxcs.net (Postfix) with ESMTPA id E6906159BCF2;
 Wed, 10 Feb 2021 14:57:54 +0000 (UTC)
Message-ID: <25F2CB0BAE7B48F7B5250BA5BBF68749@H270>
From: "Stefan Kanthak" <stefan.kanthak@nexgo.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "Brad Spencer" <bspencer@blackberry.com>
Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
References: <6c752624-1195-ec77-c16a-9fd438cb11ae@blackberry.com>
 <CAHmME9o97YiTK6rjOmfE3G5BPaBzM_bdfiOBEGoBHbrDRzf9uA@mail.gmail.com>
In-Reply-To: <CAHmME9o97YiTK6rjOmfE3G5BPaBzM_bdfiOBEGoBHbrDRzf9uA@mail.gmail.com>
Subject: Re: [Wintun] DEPENDENTLOADFLAG for wintun.dll?
Date: Wed, 10 Feb 2021 15:57:40 +0100
Organization: Me, myself & IT
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Windows Mail 6.0.6002.18197
X-MimeOLE: Produced By Microsoft MimeOLE V6.1.7601.24158
X-VADE-STATUS: LEGIT
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

"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> Hi Brad,
> 
> On Wed, Feb 10, 2021 at 3:04 PM Brad Spencer <bspencer@blackberry.com> wrote:
>>
>> Would it make sense to link the official wintun.dll with the MSVC
>> linker's -DEPENDENTLOADFLAG:0x800 option?
>>
>> https://docs.microsoft.com/en-us/cpp/build/reference/dependentloadflag
>>
>> Doing so restricts the search path for immediate dependencies to the
>> %windows%\system32\ directory, and I think all of the DLLs Wintun needs
>> are there.

This flag is supported only on current versions of Windows 10.
Since Wireguard still supports Windows 7 and 8 you but need the "classic"
mitigation there, i.e. delay-loading and your own delay-loading routine, as
Jason writes below.

> That flag is a bit of a can of worms, which I haven't been too
> inclined to open. See:
> https://skanthak.homepage.t-online.de/snafu.html

This flag also doesn't help with exports forwarded to "unknown" DLLs,
neither with /DEPENDENTLOADFLAG:... nor with LoadLibraryEx(): see
https://skanthak.homepage.t-online.de/detour.html

> Instead, wintun.dll uses delay loading for all DLLs except for
> kernel32.dll and ntdll.dll, and then forces the delay loader hook
> through LoadLibraryEx. See:
> https://git.zx2c4.com/wintun/tree/api/entry.c#n25 You can see this in
> action by putting wintun.dll into depends:
> https://data.zx2c4.com/depends-for-wintun-dll-feb-2021.png

Stefan
