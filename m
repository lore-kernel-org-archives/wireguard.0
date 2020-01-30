Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58C9C35240
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 09:02:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A93942082E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 09:02:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dreamofjapan.de header.i=@dreamofjapan.de header.b="XKSCGnm0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dreamofjapan.de header.i=@dreamofjapan.de header.b="GFsFNEaq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A93942082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dreamofjapan.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a0a036f;
	Thu, 30 Jan 2020 09:02:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f36b2997
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 07:40:10 +0000 (UTC)
Received: from dreamofjapan.de (dreamofjapan.de [45.85.216.235])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aaead446
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 07:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by dreamofjapan.de (Postfix) with ESMTP id 0F5311F089;
 Thu, 30 Jan 2020 08:40:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dreamofjapan.de;
 s=mail; t=1580370017;
 bh=0RI1Ae8lg3sWOmh0ADXQ7GXITwws27JPFTYcHbwREaE=;
 h=Subject:From:Reply-To:To:Cc:In-Reply-To:References:Date:From;
 b=XKSCGnm0dHdPiA9QrPscOrEUTxR0nyPmiG4Yg23oW47cQQ2lIElYus0FbKr0+MiIh
 0PY5PeMAFMTmr77yYS7KA5KkqmQa6Y+hLjtwmkENvquF0zeBuz+YiVqWJazXT479Ea
 /TcWHh0ZVMm6TCtoyTJ8V5fgAtAY8u4+YHzttzS8=
X-Virus-Scanned: Debian amavisd-new at dreamofjapan.de
Received: from dreamofjapan.de ([127.0.0.1])
 by localhost (mail.dreamofjapan.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 49k8-bDjDhZ9; Thu, 30 Jan 2020 08:40:13 +0100 (CET)
Received: from hackbook-ng (unknown [80.64.187.41])
 (Authenticated sender: planung@dreamofjapan.de)
 by dreamofjapan.de (Postfix) with ESMTPSA id 966961EF24;
 Thu, 30 Jan 2020 08:40:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dreamofjapan.de;
 s=mail; t=1580370013;
 bh=0RI1Ae8lg3sWOmh0ADXQ7GXITwws27JPFTYcHbwREaE=;
 h=Subject:From:Reply-To:To:Cc:In-Reply-To:References:Date:From;
 b=GFsFNEaqNjm9TPKrcOmxeL6CVPD3NjvmygMYBFW3MUGhub0WtlOYiIiwxPHSmQUbP
 ythR/j0F/1iQvYkfh84h+xlK44/fED9atMgEUKTi24qazrJQxHoxo/cRzibapQcvB0
 +Lwg28jsbyjF7mrt/jiHttsWExBy/JZqGHkZu5G0=
Message-ID: <c78df5b34a8e002c031e8dc6262bf9e3e35ea1a4.camel@dreamofjapan.de>
Subject: Re: ArchLinux wireguard install
From: Frank Tornack <planung@dreamofjapan.de>
To: Martin <martinmoen@gmail.com>
In-Reply-To: <CAKiCHuOpy7m9yUwUiE1QBPEDtoM6O_R5grgD9JgLVd-qP3fRHQ@mail.gmail.com>
References: <6cd7ccf2c193ee3bd1db3d5870f6982084d0d0d6.camel@dreamofjapan.de>
 <CAKiCHuOpy7m9yUwUiE1QBPEDtoM6O_R5grgD9JgLVd-qP3fRHQ@mail.gmail.com>
Organization: Familie Tornack
Date: Thu, 30 Jan 2020 08:40:13 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.34.3 
X-Mailman-Approved-At: Thu, 30 Jan 2020 10:02:03 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: planung@dreamofjapan.de
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

SSB3b3VsZCBub3QgbGlrZSB0byB1c2UgZXh0cmEgdmVuZG9yIHNvZnR3YXJlIGlmIHRoZXJlIGFy
ZSBvdGhlciB3YXlzLgpVbmZvcnR1bmF0ZWx5IEkgY2Fubm90IGZpbmQgeW91ciBwb3N0IGluIHRo
ZSBmb3J1bS4KLS0gCk1pdCBmcmV1bmRsaWNoZW4gR3LDvMOfZW4KRnJhbmsgVG9ybmFjawoKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiJTaGVsdGVyLCIgd2hhdCBhIG5pY2UgbmFtZSBm
b3IgZm9yIGEgcGxhY2Ugd2hlcmUgeW91IHBvbGlzaCB5b3VyIGNhdC4KCkFtIERvbm5lcnN0YWcs
IGRlbiAzMC4wMS4yMDIwLCAwNzowMyArMDAwMCBzY2hyaWViIE1hcnRpbjoKPiBUYWtlIGEgbG9v
ayBhdCB0aGUgbXVsbHZhZCBwcm9ncmFtIGZvciBhcmNoIGluIHRoZSBBVVIuCj4gQnV0IEknZCBh
bHNvIGFzayBpbiB0aGUgTmV0d29ya2luZyBzZWN0aW9uIG9uIHRoZSBhcmNobGludXggZm9ydW1z
Cj4gcmVnYXJkaW5nIHRoZSB1cGdyYWRlIHBhdGggZm9yIHRoZSBtb2R1bGUgYW5kIGtlcm5lbC4K
PiBodHRwczovL2Jicy5hcmNobGludXgub3JnL3ZpZXdmb3J1bS5waHA/aWQ9OAo+IAo+IE9uIFRo
dSwgSmFuIDMwLCAyMDIwIGF0IDI6MDkgQU0gRnJhbmsgVG9ybmFjayA8Cj4gcGxhbnVuZ0BkcmVh
bW9mamFwYW4uZGU+IHdyb3RlOgo+ID4gaGVsbG8gYWxsLAo+ID4gCj4gPiBJIGFwb2xvZ2l6ZSBp
biBhZHZhbmNlIGZvciB0aGUgc3R1cGlkIHF1ZXN0aW9uLCBidXQgSSBhbSB2ZXJ5Cj4gPiB1bnN1
cmUuCj4gPiBJIHJlY2VpdmVkIGEgdm91Y2hlciBmb3IgYSBWUE4gc2VydmljZSBhdCBhIHRyYWRl
IGZhaXIgYW5kIHdvdWxkCj4gPiBsaWtlCj4gPiB0byB0ZXN0IGl0LiBUaGUgc2VydmljZSBNdWxs
dmFkIFZQTiB1c2VzIHRoZSB0ZWNobm9sb2d5IFdpcmVHdWFyZC4KPiA+IEFuZAo+ID4gSSB1c2Ug
QXJjaExpbnV4Lgo+ID4gCj4gPiBNeSBxdWVzdGlvbiB3YXMgY3JlYXRlZCBieSB0aGUgQXJjaExp
bnV4IFdpa2kuIFRoZXJlIGl0IGFscmVhZHkKPiA+IHJlZmVycwo+ID4gdG8gdGhlIGtlcm5lbCA1
LjYsIHdoaWNoIHNob3VsZCBzdXBwb3J0IHRoaXMgZnVuY3Rpb24gd2l0aG91dCBhCj4gPiBtb2R1
bGUuCj4gPiBOb3cgbXkgcXVlc3Rpb24gaXMsIGlzIGl0IGJldHRlciB0byB3YWl0IGZvciB0aGlz
IGtlcm5lbCBvciBqdXN0Cj4gPiBpbnN0YWxsIHRoZSBtb2R1bGU/IFdvdWxkIGl0IGJlIGEgcHJv
YmxlbSBpZiBJIGZvcmdvdCB0byBkZWxldGUgdGhlCj4gPiBtb2R1bGUgYWdhaW4/IEkgYW0gdXNp
bmcgdGhlIE5ldHdvcmsgTWFuYWdlciwgd2hhdCBkbyBJIG5lZWQgdG8gYmUKPiA+IGF3YXJlIG9m
Pwo+ID4gCj4gPiBNYW55IHRoYW5rcyBpbiBhZHZhbmNlIGFuZCB0aGFuayB5b3UgZm9yIGRldmVs
b3BpbmcgdGhpcyB0b29sLgo+ID4gCj4gPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3Rz
Lnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVn
dWFyZAo=
