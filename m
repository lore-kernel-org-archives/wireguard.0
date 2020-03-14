Return-Path: <SRS0=PRBc=47=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A359C0044D
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Mar 2020 16:52:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87D6920781
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Mar 2020 16:52:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=aixah.de header.i=@aixah.de header.b="T8Y02qbB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87D6920781
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aixah.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d72fdf03;
	Sat, 14 Mar 2020 16:46:45 +0000 (UTC)
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c5e95148
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Mar 2020 16:46:43 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 48fpX06RMZzQlCK;
 Sat, 14 Mar 2020 17:52:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aixah.de; s=MBO0001;
 t=1584204750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yZuQfAczu4ACE5U149bFLqfIuJFBn7ObH9CpZ4+/cZs=;
 b=T8Y02qbBMufVKVCD2sJDVGLddnVFj0QpQuGy1+rNgiSehILmzXP6wfRWxy+azgUl+1rXpC
 ONu5nqJIScVTBF2E+J+WWnRuTR0NNlRLjzvB4oV6AstiXr3vTbb+Eg0ty9oNJIZaUX6Wdp
 CQ0FC3fBwi1x0Sms0HRcEmMY+0FJ+KZ6KKmpld0zO4Ldcz3ner40oF66pkiz0Irmg3Usm2
 erXcAz/LhMUYQFnJMihZ7qIAdHl8mgn9HwGNfqU5hRtDN08cNXO6VN0YA8hUTNHg4o3AFO
 FUWAP8MUoj4bcqmjFMblNcMXBBJFdzQ5JMppABTiGq7nxQ3PjMzIfWoAXeU4jg==
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id 7MAVsYH4DXim; Sat, 14 Mar 2020 17:52:29 +0100 (CET)
Date: Sat, 14 Mar 2020 16:52:28 +0000
From: Luis Ressel <aranea@aixah.de>
To: Torsten Krah <krah.tm@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Endpoint address dns resolution - option to prefer IPv6 or IPv4
Message-ID: <20200314165228.jxydplbghnri2ktm@vega>
Mail-Followup-To: Torsten Krah <krah.tm@gmail.com>, wireguard@lists.zx2c4.com
References: <327df26ff0e515425bc0b18084117b7ae065d97b.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <327df26ff0e515425bc0b18084117b7ae065d97b.camel@gmail.com>
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

On Fri, Mar 13, 2020 at 03:52:19PM +0100, Torsten Krah wrote:
> I've got an endpoint with a DNS name which has both, an A and AAAA
> record.
> I would like to configure the client, so that I can tell him, to either
> prefer IPv6 or IPv4 for the vpn connection.

The relevant source code can be found here:
https://git.zx2c4.com/wireguard-tools/tree/src/config.c#n242

As you can see, wg resolves host names through the libc's getaddrinfo()
function, and simply uses the first ip address returned by that
function.

A standards-compliant implementation should return an ipv6 address in
the first position if one is available and the host has a working
connection to the v6 internet. As far as I know, both glibc and musl do
this (though the behaviour of glibc can be modified by editing
/etc/gai.conf); I'm not sure what other libcs do.

It would of course be possible to make this behaviour configurable for
wg; we just need to figure out if that's an useful feature, and what the
exact semantics should be.

Cheers,
Luis
