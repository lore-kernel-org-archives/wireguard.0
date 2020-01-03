Return-Path: <SRS0=qbNG=2Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CEAC2D0C2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 20:34:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA0A2222C4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  3 Jan 2020 20:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA0A2222C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=attglobal.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 761b26db;
	Fri, 3 Jan 2020 20:33:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2270e8f1
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 20:33:41 +0000 (UTC)
Received: from p-impout001.msg.pkvw.co.charter.net
 (p-impout004aa.msg.pkvw.co.charter.net [47.43.26.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82a00e8c
 for <wireguard@lists.zx2c4.com>; Fri, 3 Jan 2020 20:33:40 +0000 (UTC)
Received: from [192.168.0.2] ([76.91.204.161]) by cmsmtp with ESMTP
 id nTdbi84ON40aWnTdciNEGR; Fri, 03 Jan 2020 20:33:40 +0000
X-Authority-Analysis: v=2.3 cv=TY3oSiYh c=1 sm=1 tr=0
 a=rO8gbEbqGp3jIVlhlq3uIg==:117 a=rO8gbEbqGp3jIVlhlq3uIg==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=69EAbJreAAAA:8
 a=OormOUd59vvLhGLpK5YA:9 a=QEXdDO2ut3YA:10
Subject: Re: wg-quick: syntax error, unexpected saddr
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <b3fb12ff-969a-9037-ee6f-f8e4b6d91895@attglobal.net>
 <762ea0a4-cc2a-4b7d-91fc-efa9e9531043@zx2c4.com>
 <7eb40791-9689-2b3d-bfb0-2299cdf7b07a@attglobal.net>
 <CAHmME9r+HM27xhjwDP3q=DJV7KJsvZS__75szHzBE4qHBoXYUg@mail.gmail.com>
 <CAHmME9ruOqW=PRXE=mKj_a2WZ9q1CbUh7YOCf7ZhhNx6Us33kw@mail.gmail.com>
 <CAHmME9qMXKanb2dyQdGYWY=T=TjAGYmhtdAeKDmRzV=6Hdd7ww@mail.gmail.com>
 <PU1PR03MB3175D92D59E6C47D12822411D7230@PU1PR03MB3175.apcprd03.prod.outlook.com>
 <CAHmME9oxF4xeHXpirt+iRWQeWknDiteJ7S7WS7fMhfw7nPsHEg@mail.gmail.com>
From: Eddie <stunnel@attglobal.net>
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <cd6ed339-fac6-8a5f-6d93-abe3d26c860a@attglobal.net>
Date: Fri, 3 Jan 2020 12:33:39 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9oxF4xeHXpirt+iRWQeWknDiteJ7S7WS7fMhfw7nPsHEg@mail.gmail.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfBva184HY2X2FRtejIG27AV0Zn4tro34CiJNieoeIz1wVYIwAujzlN3laEeMytVc7N5NeX9/bDR+WJxemzWfwQrXOwk196ghhFGh2d1Wq0k1qhGpZAbI
 2MUGMJGcEB3b/Xsxo8yWqe7f0fj8deTeK/3lFu791VPDRbzhcm2JYJPawx/7fSc77LA18SpxyeGUVw==
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: stunnel@attglobal.net
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 1/3/2020 9:14 AM, Jason A. Donenfeld wrote:
> On Fri, Jan 3, 2020 at 5:43 PM Alvin Darkness <AlvinD11@hotmail.com> wrote:
>> Unfortunately as slackware 14.2 is a (quite old now) stable release there isnt much we can do about getting nft past 0.6.  A good portion of us slackware users have moved onto slackware -current, which is the rolling release, as we wait for Pat to pull the trigger and get slackware 15.0 out.   Slackware -current is using nft 0.9.3 at the moment, so no issues there.
>>
>> I can add a caveat to the description/readme on the slackbuilds wireguard-tools page to include something about wg-quick and nft compatibility for 14.2 users.
>>
>> That commit is up to you.  If you think an install time solution is better we could just add something to the build script instead.
> Can you just add:
>
> sed -i 's/type -p nft/false/g' src/wg-quick/linux.bash
>
> to your slackbuild before installing? That'll make it fall back to
> iptables always.

Looks like a winner, at least for me, as I do my own builds. Thanks.

Cheers.

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
