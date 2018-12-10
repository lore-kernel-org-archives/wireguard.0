Return-Path: <SRS0=tdjr=OT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B530C07E85
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 02:13:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 166592081C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 02:13:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="ML72pYjX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tWu5eKmF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 166592081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 794fbd7a;
	Mon, 10 Dec 2018 02:05:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 063cb5fa
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 02:05:03 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0dfb01ab
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 02:05:03 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3390A2144B;
 Sun,  9 Dec 2018 21:13:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 09 Dec 2018 21:13:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=5
 JiRlKArFnHAPITuwqBWFlFHiH/HKkraI85GBqP3ygE=; b=ML72pYjX1xMY+jjmV
 l7bfwrRoToijqde7G6kyRVO51ZGnVxt7SRVDdxllvGS+5WafwpQ3gDl1H8cIoHe9
 X+PHyE5mEfYO5+zasBK4GddOiV5VZ+H7X08JZPpRq7agLLfDDgPQ8elaV5wIk92c
 Mx7PjBK2wos7FK63VFFXSZxWdpQgw0fNMwY8+GXb4fR8Vve3aXlI87Iij8yqoUua
 xkFqiSOpuq8moCK1HOCq85pA/eSy1BM5Zfar6T1w+HYpcE3ml0VHaYFPiYUMXK8l
 W91BuP+9KEfWAbmtqxn+X5RmjYsQJBZeHi2MCQ4z7w8SWlciErMHHlUfcKwETFv1
 TL/iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=5JiRlKArFnHAPITuwqBWFlFHiH/HKkraI85GBqP3y
 gE=; b=tWu5eKmFpPeelu8gT0NAufJF0TzDS2jc5JWmCBrvpxOMTRlshVIws/Gy1
 g/IurZhxM11/gyuMEkDqxUfdkXYx+Yf5kjlzZ7qulfL/Raj+EZFxAu9NhTalfE3p
 CUaeazfk0vnyZIdu5YJgIXx6utiWi4aTiOH8pEMEfxqSwBVa/Hhn4JM14v7eNtZJ
 MirYPjFyKJ+o2755hy0ynF2yrEdIcyU19fSdk3rmWbNkF2WiQgF+zBjuoQrdJvTN
 LqV+Pfft9qujNtwqE9unobwnbXFXBLWBqvFG4hMUYB1wpIQK2fNgBx0PsHVCeLaz
 lrHS5ybyUkVI0/u8XpSLhMO2Sg0JQ==
X-ME-Sender: <xms:08sNXM8dT2c9Hg4XZiIVHAF1gM5kzn27P-3OAeSUBfEf8sMFrGWWaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtkedrudeggedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkff
 gfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgvlhcujfholhhlrghnugcu
 oehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucffohhmrghinhepiiigvdgtge
 drtghomhenucfkphepjedtrddufeehrddugeekrdduhedunecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptd
X-ME-Proxy: <xmx:08sNXL4ZwmbXdJjhlJLxXXT8ru2Kj9gw0npB7zLLPwSF_oZRYvf5jw>
 <xmx:08sNXGU_hnOEJJK6VF2woBN8V2zdV2deIxYwVbX_e5NrSg9AYnHiKQ>
 <xmx:08sNXHPbQKdhebgKiZDWExnkEmu5S4lfg9kdZFbiXIeTHfSjyq4A6g>
 <xmx:08sNXNEqPsjhj1AFGwjJwWwQjW4A7eBSQRrKboMlJd9_JDagVt-5Ug>
 <xmx:08sNXMqnSWYq_EAfTcO-N5GgWzE6Tjx3rKb3KIlUwbtTF_fVll1xyQ>
 <xmx:08sNXCFfmNu8f7tR2Sg2rxn_QS3q7HWU4mmt_2P0OG36TkJtjawyxg>
Received: from [192.168.50.162]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id A5F50102DD;
 Sun,  9 Dec 2018 21:13:38 -0500 (EST)
Subject: Re: Should wg-quick with SaveConfig accumulate IPv6 link-local
 addresses
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <c430b4be-fc84-40c3-c9d2-5d5833d8ae89@attglobal.net>
 <6a703cdc-13e4-4881-7bb5-072b0f576a3e@xand.uk>
 <CAHmME9qw52LXqgJj=yanmyB6Yzm1Q_cYbe50ZYLNT0b5dzbu+g@mail.gmail.com>
 <1b935975-d810-fe67-a7b3-eb89e4c625c3@sholland.org>
 <CAHmME9rU2tHNHgo1k49GAot4_FKC+=Qany7K-KfCH3SjJO2awg@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <34980330-1696-6dbc-a156-b5de4a659f80@sholland.org>
Date: Sun, 9 Dec 2018 20:13:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9rU2tHNHgo1k49GAot4_FKC+=Qany7K-KfCH3SjJO2awg@mail.gmail.com>
Content-Language: en-US
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On 12/09/18 20:05, Jason A. Donenfeld wrote:
> On Mon, Dec 10, 2018 at 3:04 AM Samuel Holland <samuel@sholland.org> wrote:
>>
>> On 12/09/18 19:15, Jason A. Donenfeld wrote:
>>> This is mostly just a CentOS issue. On older kernels, we don't
>>> successfully disable LLv6:
>>> https://git.zx2c4.com/WireGuard/tree/src/compat/compat.h#n583
>>>
>>> There's probably a way to backport that tweak to before 3.17, but I
>>> haven't spent time on it. Feel free to send a patch, and if it's clean
>>> and fits entirely into compat.h, I'll gladly apply it.
>>
>> You can also work around this in wg-quick by changing up_if() to
>>
>>   cmd ip link set "$INTERFACE" up addrgenmode none
> 
> Does that work in kernels < 3.17?
> 

Oh, sorry, no it doesn't :( While it uses a totally different way of accessing
the device (so I thought it might still work), it's just another way of setting
addr_gen_mode.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
