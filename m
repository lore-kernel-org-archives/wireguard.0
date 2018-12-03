Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F2AC04EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Dec 2018 13:11:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48C3F20878
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Dec 2018 13:11:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="B1siK0Cc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48C3F20878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa9e1287;
	Mon, 3 Dec 2018 13:03:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4585c8e0
 for <wireguard@lists.zx2c4.com>; Mon, 3 Dec 2018 13:03:45 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [IPv6:2a00:7660:6da:2001::664])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f5e2753
 for <wireguard@lists.zx2c4.com>; Mon, 3 Dec 2018 13:03:44 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1543842685; bh=StvS4i9aMepKMSYxnC3MR5WvH0jdshLgupCnVx0MwA0=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=B1siK0CcHooVWQingc/0TTR+0HTLeNbiBHMHAaQmDHTsHQpTsig2Ud321fWMQCS0I
 67skUT7J+MteJTd/a9g7P5wQwzhM61ULBjouJmPengmnm2VmTa6wU7UejmTOUMey1x
 xypUfmrWt6m0RwXlhyizmK/+hnvwQKtYPLkF/DYvxGUhbG2bI6+tMM9SOHBDW8JUUR
 5cO5Y662EvyyrRWIMahamrSmOlaOn7z7UsjhaWt/6mDqvISMIxncl3KxKkP7JxacNp
 9p+7yyOEWbHcImX0r80wtCJIeIjL9YmwG0xbcPg1rrb3oXHlZDWxfzVqfcccyM4ruD
 L3eQSoI76JrdQ==
To: Davide Depau <davide@depau.eu>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Multiple endpoints with same public key
In-Reply-To: <CAMp63jULeauEWi7KZzkOPTP+mphjo1FB-4=Mv6n4K3B1=kCT6w@mail.gmail.com>
References: <CAMp63jULeauEWi7KZzkOPTP+mphjo1FB-4=Mv6n4K3B1=kCT6w@mail.gmail.com>
Date: Mon, 03 Dec 2018 15:11:23 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87k1kqkb5w.fsf@toke.dk>
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

Davide Depau <davide@depau.eu> writes:

> A few days ago I was struggling with a very slow connection and I was
> wondering whether WireGuard can support this setup (please see attached
> graph).
>
> There is a WireGuard server (the port it's listening on is reachable from
> the outside), then one client with two interfaces connected to the Internet
> with two different IP addresses.
>
> Is it possible to have *one* WireGuard interface on the client, which sends
> packets to the server through both interfaces in a round-robin fashion? I
> would expect the server to detect the client (identified by the public key)
> is sending packets from multiple endpoints, and send packets to both
> endpoints.

I think this would be better solved at a higher layer: Run two tunnels
(to two different port numbers on the server, for instance), and have
the kernel do ECMP routing across both wireguard interfaces...

-Toke
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
