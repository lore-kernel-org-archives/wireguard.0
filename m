Return-Path: <SRS0=PRBc=47=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0D5C0044D
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Mar 2020 18:03:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91AF820788
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Mar 2020 18:03:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=aixah.de header.i=@aixah.de header.b="xmqmb4Ed"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91AF820788
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aixah.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17ffea80;
	Sat, 14 Mar 2020 17:57:52 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [2001:67c:2050::465:201])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 31418568
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Mar 2020 17:57:50 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 48fr634NbjzQl8k;
 Sat, 14 Mar 2020 19:03:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aixah.de; s=MBO0001;
 t=1584209017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A3d2AWDhjB/qa0+uZaUj6sldnQM5HXfuJEayNo+s3+w=;
 b=xmqmb4EdTTc7BbQqdysI0ij8uKXiDXu4x5pk3OKCs9UKkiEG4UdvwQeD0f7hFfrnWpahtW
 +JCvtBM647wZiFRLhAQiz6N8zQoUQBSKNhbwOFVM6+WJ0pYEFdtIKq8OA9xjOavAY/Bp6i
 MEk3SUEMmGPIyPlzJl63bpTnfe/vwwmuUha0PVXgGZVQZ0M/LMeisKih4azwMwfLEpRvrJ
 6H8Z1eKVYbYuk9Mx5kgI1pY1F/+SyMetRlyt+F3IncgHAjSQWRjSLiCpwLoiZiy2tUajt3
 Y1Jo6JJxSJnrE1kDNAkQYaokYM3NQ5rGJjo06myWLYv6fkRBXFRrjVXELKgR2w==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id JKjpZWsEHPWD; Sat, 14 Mar 2020 19:03:36 +0100 (CET)
Date: Sat, 14 Mar 2020 18:03:35 +0000
From: Luis Ressel <aranea@aixah.de>
To: Matthias Urlichs <matthias@urlichs.de>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Endpoint address dns resolution - option to prefer IPv6 or IPv4
Message-ID: <20200314180335.4jx67dqm25spla5q@vega>
Mail-Followup-To: Matthias Urlichs <matthias@urlichs.de>,
 wireguard@lists.zx2c4.com
References: <327df26ff0e515425bc0b18084117b7ae065d97b.camel@gmail.com>
 <20200314165228.jxydplbghnri2ktm@vega>
 <303a9e73-23a9-4d87-b18e-51c8bf137e1d@urlichs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <303a9e73-23a9-4d87-b18e-51c8bf137e1d@urlichs.de>
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

On Sat, Mar 14, 2020 at 06:08:35PM +0100, Matthias Urlichs wrote:
> Ideally some background process forked by `wg` or `wg-quick` should set
> the first address, monitor the peer, and use the next one if it hasn't
> been established after some configurable number of seconds (or when the
> keepalive fails). Bonus points for re-resolving the address when it expires.

Yes, trying the ips in order until a tunnel can be established is
certainly a good idea, and in fact what the relevant standards
recommend, but so far noone has bothered to implement it.

Running a daemon that periodically re-resolves the host and sets the
endpoint to its current ip, on the other hand, would interfere with
wireguard's transparent roaming support, so wg(8) isn't ever going to do
that. Of course, you can easily do this yourself if it makes sense for
your setup.

Cheers,
Luis
