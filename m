Return-Path: <SRS0=a6UP=IR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA1CC433C1
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 20:42:18 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16D0A6195A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 20:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16D0A6195A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lostca.se
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8cd4c0d;
	Fri, 19 Mar 2021 20:39:59 +0000 (UTC)
Received: from aloka.lostca.se (aloka.lostca.se [178.63.46.202])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fb98fe17
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 20:11:50 +0000 (UTC)
Received: from aloka.lostca.se (aloka [127.0.0.1])
 by aloka.lostca.se (Postfix) with ESMTP id CA14623D8;
 Fri, 19 Mar 2021 20:11:41 +0000 (UTC)
X-Envelope-From: <ashish.is@lostca.se>
Received: from email.lostca.se (aloka [IPv6:::1])
 by aloka.lostca.se (Postfix) with ESMTP;
 Fri, 19 Mar 2021 20:11:34 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 20 Mar 2021 01:41:34 +0530
From: Ashish SHUKLA <ashish.is@lostca.se>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Unable to serve TCP connections over wireguard interface on
 FreeBSD 13.0-RC2
In-Reply-To: <CAHmME9pnnAY-ugHRbFAVkVukKfgxq3s0iqox4aADGiBWVh7XnA@mail.gmail.com>
References: <e1a14dfa-014c-7740-6205-75cd96933dba@lostca.se>
 <CAHmME9ozQjtg-Rpe9RmwKL6HtDHPkxVQ9d_1EfPQFS5=Zjj4BA@mail.gmail.com>
 <CAHmME9pnnAY-ugHRbFAVkVukKfgxq3s0iqox4aADGiBWVh7XnA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <a70f3baa61b4cd90737e6ba689223f6a@lostca.se>
X-Sender: ashish.is@lostca.se
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 19 Mar 2021 20:39:57 +0000
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
Reply-To: ashish.is@lostca.se
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 2021-03-19 22:18, Jason A. Donenfeld wrote:
> Hi Ashish,
> 
> Fixed:
> https://git.zx2c4.com/wireguard-freebsd/commit/?id=bb59a61785322a086dfc437c51e7cbcd918a5241
> 
> Thanks for the report.
> 
> Jason

Seems to work as expected now, thank you.

--
Ashish

“There was truth and there was untruth, and if you clung to the truth 
even against the whole world, you were not mad.”
        -- George Orwell, "Nineteen Eighty-Four"
