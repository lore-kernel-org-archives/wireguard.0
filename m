Return-Path: <SRS0=h/53=5C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3965EC5ACD6
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Mar 2020 18:12:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E12E2073E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Mar 2020 18:12:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=aixah.de header.i=@aixah.de header.b="GFfgAl9g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E12E2073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aixah.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9cdd2f9c;
	Tue, 17 Mar 2020 18:05:58 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org
 [2001:67c:2050::465:201])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8bb48a5b
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Mar 2020 18:05:56 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 48hh8T4KmvzQlHx;
 Tue, 17 Mar 2020 19:12:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aixah.de; s=MBO0001;
 t=1584468727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tiV4uB8yjDi4dt8mYIEgLkCStG7eHz5Xo1MefHnH+SA=;
 b=GFfgAl9gn+IwFhXlc8pf9l2ea+FpPPgzxzUWjBBh7TTqwSF3MgfxtTiTkNUcuyNTC79ltU
 SmB2fvK+PQLiBikue4q3Pu+aiP2RbM8NNtGvHWz77S3b46ZV99NdEKlSMRls6cka/TL1pD
 xR7a+9Y3FpNT1KB7LSjJLZHlUTruzmEeW3bEo+KPo2MMhBal0O3LJuONxzSfl5gXhdCuRC
 +4FeNksYNJtGXIVI9DbMB1FmAH86Cn9nqVtFrKhTbi9fJGZyLZvG3Uja/JkSQc/92aETZu
 TX8v4QU8n6QJIHn6RivTLtldTMgUtzdKswaxiYqYOwHCMpKz7vTI+1XvzCzP8A==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
 [80.241.56.122]) (amavisd-new, port 10030)
 with ESMTP id wROrl1INlgCD; Tue, 17 Mar 2020 19:12:06 +0100 (CET)
Date: Tue, 17 Mar 2020 18:12:05 +0000
From: Luis Ressel <aranea@aixah.de>
To: "J.R. Oldroyd" <wgrd@opal.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Logging
Message-ID: <20200317181205.ar7762xdewbszu4q@vega>
Mail-Followup-To: "J.R. Oldroyd" <wgrd@opal.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20200315141659.771e0088@opal.com>
 <CAHmME9onNwD9+hw2LgzZg_OqN21mOPEyQ9wAsFGjTA6=mK7xgA@mail.gmail.com>
 <20200317083717.14719676@opal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317083717.14719676@opal.com>
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

On Tue, Mar 17, 2020 at 08:37:17AM +0100, J.R. Oldroyd wrote:
> Since adding syslog support is so trivial, given the existing code
> is already designed around logging levels and given Go's clean support
> of syslog, why not just build it in so that wireguard's logging is done
> consistently with all other UNIX daemons?  Piping stdout to logger
> is non-standard and also loses the ability to filter the different
> log levels to different log destinations.

If you're adding logging support, I'd prefer logs on stderr over a
centralized legacy mechanism such as syslog. That's much more flexible;
in particular, it makes it much easier to direct logs of different
daemons to different places, or run daemons in chroots.

Cheers,
Luis
