Return-Path: <SRS0=XtlP=3O=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F33C35241
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 25 Jan 2020 09:13:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1520E2071A
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 25 Jan 2020 09:13:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="pD8eoyOv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1520E2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e14759e0;
	Sat, 25 Jan 2020 09:13:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf85b2c8
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jan 2020 09:13:16 +0000 (UTC)
Received: from mail.toke.dk (borgediget.toke.dk [85.204.121.218])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96cf395b
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jan 2020 09:13:16 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1579943593; bh=zuqK6DxL/dsSZAQwcD7Abw6rQmVfym3GnafaFkRp/oU=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=pD8eoyOv+pxpa7BrgWSVFl3bI9xrkV8pdczehD2W0nDpjuJq6cuIE4qmGoGgzs4A1
 BY6MUYH6N3MsoEQCdoDMD9Jmi33LY0bO3gR4VcQ/z3qJ7MlkGejAFKNizdrpCobytX
 +MaDpUbXBrdiFBYrb49aIv8z4vDPDVHKAjiV60meWcUkWnwX3Jon/kWZDEQcR7RKD0
 GJ9T3FY+tJHhEZyIncldyBLJgcu7R8ghsiEWEED68JT2PQaKb9dpvbhPdgq25A3ys9
 yF6Z1KyA3i/s28GptrY9s/wiqgeDfxnI0rFY9kCEu+DAb5mTO2/b6owqBcBsm99ayz
 6KjuUw+JU/wlg==
To: Steven Honson <steven@honson.id.au>, wireguard@lists.zx2c4.com
Subject: Re: Tunnel traffic in VRF
In-Reply-To: <ea889cc3-9599-4218-a8cc-6daa9d2965e2@www.fastmail.com>
References: <9420fa01-61b9-73cb-21f4-681bf8015b7b@orlandi.com>
 <ea889cc3-9599-4218-a8cc-6daa9d2965e2@www.fastmail.com>
Date: Sat, 25 Jan 2020 10:13:13 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87y2tvew5y.fsf@toke.dk>
MIME-Version: 1.0
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

"Steven Honson" <steven@honson.id.au> writes:

> Hi Daniele,
>
> By VRFs, do you mean Linux network namespaces, or something different?

VRFs are a separate feature from namespaces - see
https://cumulusnetworks.com/blog/vrf-for-linux/

-Toke
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
