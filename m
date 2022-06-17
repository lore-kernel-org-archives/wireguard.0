Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B065C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 17 Jun 2022 11:58:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id fa7d61b5;
	Fri, 17 Jun 2022 11:56:29 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id fcbab323
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Jun 2022 11:56:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E52A4B829D0;
 Fri, 17 Jun 2022 11:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C92C3411B;
 Fri, 17 Jun 2022 11:56:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Pr8brLhO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1655466984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dIeMLl8t5vM0boBnfQAQRYiGbB5hzztpHvyPvHJGec4=;
 b=Pr8brLhOsWU6OMEgDaKpdU/6Xcqrkkl0Q/R4fr4UbOazwfoGKl5AFdsair5VsLYBOOB/GM
 MVR8scqv99ATIg7gtmLOo3vdFwuJrs1Jmc6xBn4HblhQl9Eo2AOm4UkviIX/6tRmkwJ5sd
 qUePfkX77pIbAYO94inP6uZkN6QhZtA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 744ba9cb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Fri, 17 Jun 2022 11:56:24 +0000 (UTC)
Date: Fri, 17 Jun 2022 13:56:23 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jacob Lifshay <programmerjake@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: why not use ktime_get_clocktai_ts64
Message-ID: <Yqxr57xeYHYI3F22@zx2c4.com>
References: <CAC2bXD6FKSk1EEcw4QtqxengUvyCN2bfwzG5jFUvAPAsg2kxBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAC2bXD6FKSk1EEcw4QtqxengUvyCN2bfwzG5jFUvAPAsg2kxBA@mail.gmail.com>
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

Hi Jacob,

On Wed, Jun 15, 2022 at 06:48:08PM -0700, Jacob Lifshay wrote:
> I was reading in noise.c and noticed you use ktime_get_real_ts64 and
> do manual adjustments (the current code is broken if/when there's
> another leap second) rather than using ktime_get_clocktai_ts64 which
> already handles compensation for leap seconds.
> 
> https://git.zx2c4.com/wireguard-linux/tree/drivers/net/wireguard/noise.c?id=7fae4596a269d2f9a6a7d1a8695c3a68ab34f7be#n501
> 
> Is there a reason for that?

Not really I guess. The only requirement, though, is that the timestamps
are monotonic with respect to the particular localprivate-remotepublic
pairing of peers. So I'm not sure it matters?

Jason
