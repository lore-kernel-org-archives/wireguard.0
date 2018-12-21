Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3F1C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:03:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ED79218D3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:03:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=1n6.org.uk header.i=@1n6.org.uk header.b="i1FGvkch"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ED79218D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=1n6.org.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id feabc4e8;
	Wed, 2 Jan 2019 18:01:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5efd29a
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Dec 2018 18:17:45 +0000 (UTC)
Received: from vanadium.cloudhosting.co.uk (vanadium.cloudhosting.co.uk
 [77.72.0.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3168db18
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Dec 2018 18:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=1n6.org.uk; 
 s=default;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
 Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RepW87MidiEKOWKY1oh+zUCrkhgmPKZofv4HbxEBGt8=; b=i1FGvkchfqb1IAp6kh3sjz+mq2
 BvnoXyVnQLha6xu61ayLz2IPXWUkwmmN+DhSf9xcoVyADKMwu1FLfVUuZ5HnIgc0V2MLuirDKB7LM
 AUcqvykDZ+fEjixoyfwYwahTh9dAt0NnepsdoovzXXd6AB1udU8wUlcUblBN6m8IBFDA5dz9KI5WT
 Zt/BpuVUFY2kMW8f5g+vuTBgUOx+Fr7o21eNetNLczWvRKvy1wlvuU1QvnduZN/bbMPKhHFjfXIsG
 UuRhpzlNqEasg6UN1vypqExuyCQqh0jgr7tVkSKmVC1nies1b00kJkVeNTqoLrMMs4NeUhCnpxpxB
 iMLZ0acw==;
Received: from ebg13.tamazaki.com ([148.251.200.134]:37398 helo=[192.168.11.3])
 by vanadium.cloudhosting.co.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <wireguard@1n6.org.uk>) id 1gaPNc-00CzW5-Bj
 for wireguard@lists.zx2c4.com; Fri, 21 Dec 2018 18:18:36 +0000
To: wireguard@lists.zx2c4.com
From: Iain Douglas <wireguard@1n6.org.uk>
Subject: Understanding Protocol / State Machine
Message-ID: <478b9a56-d09e-5908-f253-a32985898072@1n6.org.uk>
Date: Fri, 21 Dec 2018 18:18:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vanadium.cloudhosting.co.uk
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - 1n6.org.uk
X-Get-Message-Sender-Via: vanadium.cloudhosting.co.uk: authenticated_id:
 iain@1n6.org.uk
X-Authenticated-Sender: vanadium.cloudhosting.co.uk: iain@1n6.org.uk
X-Mailman-Approved-At: Wed, 02 Jan 2019 19:01:09 +0100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

SGksCgpJIGhhdmUgYmVlbiBpbnZlc3RpZ2F0aW5nIHdoYXQgaGFwcGVucyB3aGVuIGEgcGVlciBj
cmFzaGVzL2dvZXMgYXdheSBmb3IKc29tZSByZWFzb24gYW5kIHRoZSBjb25maWd1cmF0aW9uIGlz
IHJlc2V0LgoKTXkgdGVzdCBzZXR1cCBpcyBxdWl0ZSBzaW1wbGUsIEkgaGF2ZSAyIHBlZXJzIGFu
ZCBvbmUgaXMgYWN0aW5nIGFzIGEKZ2F0ZXdheSBmb3IgdGhlIG90aGVyIGZvciB0aGUgcmVtb3Rl
IGFkZHJlc3MgOC44LjguOC4KSSBjYW4gcGluZyA4LjguOC44IGFuZCB0cmFmZmljIGdvZXMgb3Zl
ciB0aGUgV2lyZUd1YXJkIGxpbmsgYXMgZXhwZWN0ZWQuCldoZW4gSSB3YW50IHRvIHRlc3QgSSBk
ZWxldGUgdGhlIGtleSBvbiB0aGUgcGVlciBhbmQgYWRkIGl0IGFnYWluLsKgCldpcmVndWFyZCBp
cyB0ZSBsYXRlcyB2ZXJzaW9uIGZyb20gQ2VudE9TIHJlcG8gMC4wLjIwMTgxMjE4LTEuCgpJIHNl
ZSB0aHJlZSBkaWZmZXJlbnQgdGhpbmdzIGhhcHBlbmluZyBkZXBlbmRpbmcgb24gd2hlbiB0aGUg
bGFzdApoYW5kc2hha2UgdG9vayBwbGFjZS4KCjEuIEhhbmRzaGFrZSA8IDExOSBzZWNvbmRzIGFn
byB0aGUgbGluayB0YWtlcyB+IDE1IHNlY29uZHMgdG8gcmVjb3ZlcgoyLiBIYW5kc2hha2UgYmV0
d2VlbiAxMjAgYW5kIDE3OSBzZWNvbmRzIGFnbyAtIDFzdCBwYWNrZXQgaXMgbG9zdCB0aGVuCmxp
bmsgcmVjb3ZlcnMKMy4gSGFuZHNoYWtlID49MTgwIHNlY29uZCBhZ28gLSBsaW5rIGp1c3Qgd29y
a3MgYXMgbm9ybWFsLgoKSXQgaXMgKDIpIHRoYXQgSSBkb24ndCB1bmRlcnN0YW5kLiBXaGVuIEkg
bG9vayBhdCB0aGUgcGFja2V0cyBzZW50IEkgc2VlCgpwaW5nIG91dApoYW5kc2hha2Ugb3V0Cmhh
bmRzaGFrZSByZXNwb25zZQoKTm8gcmVwbHkgdG8gdGhlIHBpbmcKCkhvd2V2ZXIgZm9yICgzKSBh
Ym92ZSBJIHNlZQoKaGFuZHNoYWtlIG91dApoYW5kc2hha2UgcmVzcG9uc2UKcGluZwpwaW5nIHJl
cGx5CgpTbyBmb3IgKDMpIEkgZ3Vlc3MgdGhhdCB0aGUgcGluZyBpcyBxdWV1ZWQgdW50aWwgYWZ0
ZXIgdGhlIGhhbmRzaGFrZQpvY2N1cnMuCkhhdmluZyB3YXRjaGVkIEphc29uJ3MgdGFsayBhdCB0
aGUgTGludXggUGx1bWJlcnMgY29uZmVyZW5jZSBJIHdhcwpleHBlY3Rpbmcgd2hhdCBoYXBwZW5z
IGF0ICgzKSB0byBiZSBhdCAoMikuCkNhbiBzb21lb25lIGVubGlnaHRlbiBtZSBhcyB0byB3aHkg
dGhlIGZpcnN0IHBhY2tldCBhdCAoMikgaXMgc2VudApiZWZvcmUgdGhlIGhhbmRzaGFrZT8KCkNo
ZWVycwoKCklhaW7CoAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29t
Cmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
