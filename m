Return-Path: <SRS0=GTIq=ES=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62758C2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 08:29:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FD5F20825
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 08:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FD5F20825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=softart-ge.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af87c1f1;
	Thu, 12 Nov 2020 08:24:26 +0000 (UTC)
Received: from mail.softart-ge.com (vds2011x11.startdedicated.de
 [62.138.18.229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1bb4be58
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 15:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.softart-ge.com (Postfix) with ESMTP id 5CE60C07F8
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 16:06:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at softart-ge.com
Received: from mail.softart-ge.com ([127.0.0.1])
 by localhost (softart-ge.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nHK6W4tVZFM7 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Nov 2020 16:06:28 +0100 (CET)
Received: from [192.168.30.124] (95-42-155-30.ip.btc-net.bg [95.42.155.30])
 by mail.softart-ge.com (Postfix) with ESMTPA id 3E1EBC0454
 for <wireguard@lists.zx2c4.com>; Tue, 10 Nov 2020 16:06:28 +0100 (CET)
Subject: Re: Should we sunset Windows 7 support?
To: wireguard@lists.zx2c4.com
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
From: Reiner Karlsberg <karlsberg@softart-ge.com>
Message-ID: <65ad978d-61d8-59b5-3932-5c6be78ad92f@softart-ge.com>
Date: Tue, 10 Nov 2020 17:06:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 12 Nov 2020 09:24:25 +0100
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

Am 10.11.2020 um 14:27 schrieb Jason A. Donenfeld:
> Hi,
> 
> Windows 7 has been EOL'd by Microsoft since January of this year. It
> is no longer receiving security updates or fixes. This email is to get
> the conversation started about doing the same with WireGuard for
> Windows.
> 
> Supporting Windows 7 is an ongoing maintenance burden. For example, we
> use SHA2 signatures instead of SHA1 signatures for our drivers, which
> is not something we want to compromise on, and as a result Windows 7
> users must have KB2921916 installed. But Microsoft never supplied
> KB2921916 via Windows Update and it removed all Windows 7 hotfixes
> from its webpage last year. So in order to keep supporting this, we're
> forced to add clunky disgusting code like this:
> https://git.zx2c4.com/wireguard-windows/commit/?id=b63957dc830e39c94844d2f0d32ba29575991e44
> Keen readers will wince at all the layering violations there. Do we
> really want to keep maintaining gross stuff like this? It makes me
> uncomfortable to have kludges like that sitting around in the code.
> Shouldn't I write an auto-downloader that then checks hashes?
> Shouldn't I build this into the installer? Shouldn't I.... waste tons
> of time supporting Windows 7 better?
> 
> Probably not.
> 
> But I know so many users are still using Windows 7. I'd like to hear
> from you to understand why, in order to assess when is the right
> moment to sunset our Windows 7 support.
> 
> So, if you care for Windows 7, please pipe up! We're not going to
> remove support for it overnight, and we're not prepared yet to
> announce any sort of formal deprecation plan, but the world is moving
> on at some point.
> 
> Jason
> 

I fully understand the intention, to drop support for Win 7. Although I am still a happy user of it.
I would appreciate a solution, in which further developments of wireguard still remain backward compatible,
to keep the latest official wireguard for Win 7 still functionable with peers, running newer versions of wireguard.
At least for "quite some time".

Cheers,

Reiner

