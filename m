Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5F8C47088
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Dec 2022 13:11:46 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 395c117a;
	Thu, 1 Dec 2022 13:09:18 +0000 (UTC)
Received: from sender11-op-o11.zoho.eu (sender11-op-o11.zoho.eu
 [31.186.226.225])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d9abb5dc
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Nov 2022 11:52:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1667735570; cv=none; d=zohomail.eu; s=zohoarc; 
 b=Hyb6Hy3VdJy/waCAJAmePF50jFQQqOzWHCtVNr8mFbgvnZee92oXJh7vkcPQjMKVqjb8GSpifNavg3elixK72HroR2lsRLl7hVBV7E/bnWU2UDVSnbdxyqxH9IWkxONzsM0O4OFbnBOQcbAKzIR9+P/z6PsJ7XebjHwk8MAmsfs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu;
 s=zohoarc; t=1667735570;
 h=Content-Type:Content-Transfer-Encoding:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=m6YGcjSWJWuiX2X09xRen83tZubh/a13zf20gRp8Zzg=; 
 b=Bj3fhZ5N2e5AuVKJcz8VHHEWt3Z4Q2USBGO5sZV7qE265Lo72SGRxAZP8o9t5OWmrZS8oENhEHpFKMnCxiSviLHHBXObE2Sb1Sl3WaGn/W9G8v7R9E5QALXnB5I/rlJ4r/TrEQK91U63D1V53eQJiEM4sT+dYtzzcLzwrF52i2A=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
 dkim=pass  header.i=danielcolquitt.com;
 spf=pass  smtp.mailfrom=hello@danielcolquitt.com;
 dmarc=pass header.from=<hello@danielcolquitt.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1667735570; 
 s=zohodkim; d=danielcolquitt.com; i=hello@danielcolquitt.com; 
 h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:References:In-Reply-To:To:To:Reply-To:Cc;
 bh=m6YGcjSWJWuiX2X09xRen83tZubh/a13zf20gRp8Zzg=;
 b=UEwD6YuML1OasRfDgTXIOTi1dFOPfZj8VekIi+9OJWk7AODAtnRu5ug4L4+NpZRI
 dP9wu4rQYo/NwdjiGz5cIxRgjMl+mGuW5XNnmNBI0A3NdNb8BK/Nu88S9OekQF4JZTp
 GWANbtQIZHkSAO8kaG2Tz40dlA0dFRIr7o9iSgdb3uKkumInvWL7hNGHloDPW7H4NXA
 dSbKs+LIZ5ASqd3s5IpXigGxXC79CUF7tfMu4i09S9X6hOIC47MZK9jNGv7NuIfjxt5
 5SaqRdKKyu+wQW1sLZ1HguXCoitrdH7DIWoSBsWbdwv9kXcp8bI7SJ9yZg0pXQiF8HL
 lNtxMZ5Zzw==
Received: from mail.zoho.eu by mx.zoho.eu
 with SMTP id 16677355694071012.1474371296254;
 Sun, 6 Nov 2022 12:52:49 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: base64
From: Daniel Colquitt <hello@danielcolquitt.com>
Mime-Version: 1.0
Subject: Re: Wireguard - no logs iOS 16.1
Date: Sun, 6 Nov 2022 11:52:39 +0000
Message-Id: <6A111D04-984C-45A7-85A0-A4E2556E42F2@danielcolquitt.com>
References: <CAHx9mse-qPN6L4F7wKRA31J0rHQ9_g533KPS-OTAnTeRHF11ag@mail.gmail.com>
In-Reply-To: <CAHx9mse-qPN6L4F7wKRA31J0rHQ9_g533KPS-OTAnTeRHF11ag@mail.gmail.com>
To: wireguard@lists.zx2c4.com
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Approved-At: Thu, 01 Dec 2022 13:09:15 +0000
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

DQpJIGhhdmUgcmVwcm9kdWNlZCB0aGUgaXNzdWUgb24gaVBob25lIDEzLiBBbHNvIG9jY3VycmVk
IG9uIGlPUyAxNi4wDQoNCi1EDQoNCj4gT24gNSBOb3YgMjAyMiwgYXQgMjI6MjAsIE9ta2hhciBB
cmFzYXJhdG5hbSA8b21raGFyQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiDvu79XaXJlZ3VhcmQg
MS4wLjE1ICgyNikNCj4gV2lyZWd1YXJkIEdvIGJhY2tlbmQgMmVmMzlkNDcNCj4gDQo+IEkgYW0g
dW5hYmxlIHRvIHZpZXcgbG9ncy4gQ2xpY2tpbmcgb24gdGhlIHZpZXcgbG9nIGJ1dHRvbiBtb21l
bnRhcmlseQ0KPiByZW5kZXJzIHRleHQsIHRoZW4gaXQgZ29lcyBibGFuay4gVHJpZWQgdGhpcyBv
biB0d28gZGlmZmVyZW50IHBob25lcw0KPiAoaVBob25lIDExIHBybyBtYXgsIGlQaG9uZSAxMyBQ
cm8pDQo+IA0KPiAtLW9hDQo=

