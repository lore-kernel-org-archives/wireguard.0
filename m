Return-Path: <SRS0=b8ma=JJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F299C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Apr 2021 13:00:38 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 241D461263
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Apr 2021 13:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 241D461263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 33bf6b56;
	Mon, 12 Apr 2021 13:00:35 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 965fc937
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Apr 2021 13:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:From:CC:To:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=dumGSl4YiCWQLt3NwnIpVV1EfPclvKzM7H/nUAP4jyk=; b=IyUf19VadcMBLDjv4xfuYLgqyz
 ay1uk0TE3RHa6dDNQA/JLVmJfpf731U34aFkdyO8W5JHj599qzyaXC89BTTN6lRaFj2safUPR+/Ti
 1fSaxNf2Fv/v6yXz9Bi+563hjZ8RwXNz8AOd5+R8hKe+pmrxPZpbEjFKh9ZnFWA3QWFWkUkXAhkrW
 KZBwXoCJ6NwHPSP3rOqIrU/1IYTpaXl/lOEYMuuhU46f8ns8o6hKgjejGpQ3nAVHQVKaHukYPQjky
 NryTMbHFIostXtaRHpNtYH1qL3Q9Vz4UYtrFCxfGHajqm590j35dhUYS9Gm1BIX+O3Ct59e9JJPRy
 EzQUB//A==;
Received: from [2a01:4c8:1062:7263:a06f:53d6:a92:a85b]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lVwAz-004MFi-GR; Mon, 12 Apr 2021 13:00:26 +0000
Date: Mon, 12 Apr 2021 14:00:21 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <9940aef2c1064fc785b51ac860020a18@rozman.si>
References: <6e259ab359c7f93f8f1119df0ba7b285cd4f53d1.camel@infradead.org>
 <CAOw_LSHa5aERnm8etcBywJV4QmW_9BesXvBYSvjKPVZ=a+whXg@mail.gmail.com>
 <26fc1c68fa495407b5c4c46a56abdb5dfe639280.camel@infradead.org>
 <CAOw_LSHbJ-SwNc8nqFC0KDrY+ah25gfLNyYQf83mb9sSO9=R8A@mail.gmail.com>
 <1f5dfe333c4e8d228773241cffadc9913d7829c7.camel@infradead.org>
 <a1bee48639cb40299118c53d4fa8fe7a@rozman.si>
 <fb3e80d74068cd8464c44f1cb435b71d1170c659.camel@infradead.org>
 <CAOw_LSGV8V9aLg-UdN4SE5s5o7NFfeyH+Q+mWMrvrBYp06aT=w@mail.gmail.com>
 <9940aef2c1064fc785b51ac860020a18@rozman.si>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: RE: Allowing space for packet headers in Wintun Tx/Rx
To: Simon Rozman <simon@rozman.si>,Daniel Lenski <dlenski@gmail.com>
CC: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: David Woodhouse <dwmw2@infradead.org>
Message-ID: <38E774FD-16C8-4788-8C31-634A7AA4248A@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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



On 12 April 2021 12:38:30 BST, Simon Rozman <simon@rozman=2Esi> wrote:
>> > We'll also need to be able to WintunAllocateSendPacket() of the
>full
>> > possible MTU, then receive and decrypt into that, and send only the
>> > actual size of the packet we received=2E
>
>How about this:
>https://git=2Ezx2c4=2Ecom/wintun/commit/?id=3D03b6cd410c8963d1888966edf31=
fdc35a4c8b523
>
>Should be backward compatible=2E Tested with the existing stable
>wireguard-windows release 0=2E3=2E10=2E

Looks good; thanks=2E However=2E=2E=2E

>> 2) Some VPN protocols concatenate multiple packets into a single
>> aggregate on the wire=2E On Linux we can decrypt, truncate, and send to
>> the tunnel interface without further copying=2E
>>=20
>> Case (1) can be handled with overallocate-and-shrink=2E Case (2) is
>pretty
>> rare among the protocols that OpenConnect supports, so fallback to
>> memcpy seems fine=2E

Case (2) is fairly easy to handle when the L3 packet size doesn't use up t=
he whole TUN_PACKET size, isn't it? We can loop and consume multiple smalle=
r packets?

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
