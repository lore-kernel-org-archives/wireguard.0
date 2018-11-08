Return-Path: <SRS0=5rhV=NT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B87ECDE4B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Nov 2018 19:06:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23CE320825
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Nov 2018 19:06:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="jUSNkmaQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23CE320825
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=cloudflare.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22119abc;
	Thu, 8 Nov 2018 19:01:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf266cce
 for <wireguard@lists.zx2c4.com>; Thu, 8 Nov 2018 15:44:13 +0000 (UTC)
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8f7e9bc
 for <wireguard@lists.zx2c4.com>; Thu, 8 Nov 2018 15:44:13 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id r71so27179001qkr.10
 for <wireguard@lists.zx2c4.com>; Thu, 08 Nov 2018 07:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloudflare.com; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=OJL2zV7Rw5kE9MTS1Xd3UBrivlK/ZPIW11tEs52qpP8=;
 b=jUSNkmaQMPmqHGWSk/Ol2BwCG0Oi2+iynnwZCqoAc0c6n1QxTkM/XtWK5J5dwVsbhA
 cW22YbQ4aNvTH6e1n7/cQ0VZXzlk7CmwQ2AMF3gCxaEf9+uF4GovC2qJsjdN+OcToLG0
 RzWqsAEDG9QlLF4jopnzQHg3JqVXuIT3gWj24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=OJL2zV7Rw5kE9MTS1Xd3UBrivlK/ZPIW11tEs52qpP8=;
 b=eCYLNiQgYWMT72t0Qb0uaar7mT8EWOWJiDTHf4pdH0j5C2ycEUx3BCswhHUaENMd1Y
 u7hEJIoAbJKl7T++2EGVv9vtsjvTmx4ZJgs4zyxZfIeZuviB9JgFE44yw4f79RO+8GYa
 cl+Y50u3UfYB1VqG+SOhdqOp16u2M76Q7QxgnsLu7f9jcoe2BFyGjxKZpfdePO7WorLD
 Osxqp9MCcMNI28YJJ+XQ49jnA5gpUHeDqJ0j8aQGx9My7WFO/SGEHhDfBMKUNw8rPxa7
 LJSCMu66In4/KzHyMV9D2Nh0uAhs6ln1B6D76Z+9s9lU76mkwqP61Y/QNWkt854R94s6
 98GA==
X-Gm-Message-State: AGRZ1gJwRLPMFQYqEoDaPNzxYEjukVYlvnT0JB4PVGP70zsSpoyCQxKI
 atfJlmYFmnqw2dU3ZYpoipIGsg==
X-Google-Smtp-Source: AJdET5dBBLxsZJ/Pw5C1csb6W6oho3/xEJ5nbUQc4Zg+JTGIG5ljjWGgotV6iYhenEua9OFYl8Ua0g==
X-Received: by 2002:a37:7a05:: with SMTP id
 v5-v6mr4430121qkc.129.1541692128929; 
 Thu, 08 Nov 2018 07:48:48 -0800 (PST)
Received: from [10.69.106.201] ([65.246.174.100])
 by smtp.gmail.com with ESMTPSA id o96-v6sm2530190qte.22.2018.11.08.07.48.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Nov 2018 07:48:47 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 12.1 \(3445.101.1\))
Subject: Re: Not really TAI64N
From: Vlad Krasnov <vlad@cloudflare.com>
In-Reply-To: <CAHmME9opfWOJsN-EAF_ZEkE1P4CnDQRQqrp+j2pJGx-Zy3s0XQ@mail.gmail.com>
Date: Thu, 8 Nov 2018 10:48:46 -0500
Message-Id: <74F6898E-CD04-41F5-B0F0-87DAA9475F8C@cloudflare.com>
References: <0257672C-2D55-415B-873A-A4D78BF48516@cloudflare.com>
 <CAHmME9opfWOJsN-EAF_ZEkE1P4CnDQRQqrp+j2pJGx-Zy3s0XQ@mail.gmail.com>
To: "Jason A. Donenfeld" <jason@zx2c4.com>
X-Mailer: Apple Mail (2.3445.101.1)
X-Mailman-Approved-At: Thu, 08 Nov 2018 20:01:37 +0100
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Cj4gCj4gVGhhdCdzIHJpZ2h0LCBhbmQgYnkgaW50ZW50aW9uLiBUaGUgd2hpdGVwYXBlciAqZG9l
cyogbWVudGlvbiB0aGF0Ogo+IAo+ICJUbyBwcmV2ZW50IHRoaXMsIGEgMTItYnl0ZSBUQUk2NE4g
WzddIHRpbWVzdGFtcCBpcyBpbmNsdWRlZCwKPiBlbmNyeXB0ZWQgYW5kIGF1dGhlbnRpY2F0ZWQs
IGluIHRoZSBmaXJzdCBtZXNzYWdlLiBUaGUgcmVzcG9uZGVyIGtlZXBzCj4gdHJhY2sgb2YgdGhl
IGdyZWF0ZXN0IHRpbWVzdGFtcCByZWNlaXZlZCBwZXIgcGVlciBhbmQgZGlzY2FyZHMgcGFja2V0
cwo+IGNvbnRhaW5pbmcgdGltZXN0YW1wcyBsZXNzIHRoYW4gb3IgZXF1YWwgdG8gaXQuIChJbiBm
YWN0LCBpdCBkb2VzIG5vdAo+IGV2ZW4gaGF2ZSB0byBiZSBhbiBhY2N1cmF0ZSB0aW1lc3RhbXA7
IGl0IHNpbXBseSBtdXN0IGJlIGEgcGVyLXBlZXIKPiBtb25vdG9uaWNhbGx5IGluY3JlYXNpbmcg
OTYtYml0IG51bWJlci4p4oCdCj4gCgpZZXMsIEkgc2F3IHRoYXQgaW4gdGhlIHBhcGVyLCBhbmQg
aGF2aW5nIGEgbW9ub3RvbmljIDk2LWJpdCBjb3VudGVyIGlzIHBlcmZlY3RseSBmaW5lLiBJIGd1
ZXNzIHRoZSB3b3JkaW5nIGlzIG5vdCBjbGVhciwgYW5kIHRoZSBjb2RlYmFzZSBjYWxscyBpdCBU
QUk2NE4sIHdoaWNoIGlzIGNvbmZ1c2luZy4KCkkgb25seSByYWlzZWQgdGhlIGlzc3VlIGJlY2F1
c2UgdGhlIG5hbWUgaW1wbGllcyBvbmUgdGhpbmcsIGFuZCB0aGUgaW1wbGVtZW50YXRpb24gZG9l
cyBzb21lIG90aGVyIHRoaW5nLgoKU28gY2FsbGluZyB0YWk2NG4uQWZ0ZXIgaW1wbGllcyB5b3Ug
Y29tcGFyZSB0d28gdmFsaWQgdGFpNjRuIHRpbWVzdGFtcHMsIGFuZCBub3QganVzdCB0d28gbGFy
Z2UgYmlnIGVuZGlhbiBudW1iZXJzLgoKCj4+IEFsc28sIHRoZSBmdW5jdGlvbiB1c2VkIGZvciBj
b21wYXJpc29uIGlzIG1lbWNtcCwgbm9uLWNvbnN0YW50IHRpbWUgZnVuY3Rpb24sIHRoYXQgc2hv
dWxkbuKAmXQgYmUgdXNlZCBpbiBjcnlwdG9ncmFwaGljIGNvbnRleHQuCj4gCj4gVGhpcyBpcyBh
bHNvIG1lbnRpb25lZCBpbiB0aGUgd2hpdGVwYXBlcjoKPiAKPiAiRnJvbSBhbiBpbXBsZW1lbnRh
dGlvbiBwb2ludCBvZiB2aWV3LCBUQUk2NE4gWzddIGlzIHZlcnkgY29udmVuaWVudAo+IGJlY2F1
c2UgaXQgaXMgYmlnLWVuZGlhbiwgYWxsb3dpbmcgY29tcGFyaXNvbnMgYmV0d2VlbiB0d28gMTIt
Ynl0ZQo+IHRpbWVzdGFtcHMgdG8gYmUgZG9uZSB1c2luZyBzdGFuZGFyZCBtZW1jbXAoKS7igJ0K
PiAKClllcywgaXQgbWFrZXMgYSBsb3Qgb2Ygc2Vuc2UsIGFuZCBtZW1jbXAgd2lsbCByaWdodGZ1
bGx5IGRpc3Rpbmd1aXNoIHR3byB2YWxpZCB0YWk2NCB0aW1lc3RhbXBzIHRvZGF5LgoKQnV0IGlu
IHRoZW9yeSB2YWx1ZXMgbGFyZ2VyIHRoYW4gMl42MyBhcmUgcmVzZXJ2ZWQgZm9yIHBvc3NpYmxl
IGZ1dHVyZSB1c2UsIGFuZCB0aGVuIHRoaXMgYXNzZXJ0aW9uIG1pZ2h0IGJlY29tZSBpbnZhbGlk
LgoKCj4gSSByZWFsaXplIG9mIGNvdXJzZSB0aGlzIGlzIHZ1bG5lcmFibGUgdG8gdGltaW5nIGlu
ZmVyZW5jZSwgYnV0IEkKPiBkaXNhZ3JlZSB0aGF0IHRoaXMgaXMgYSAiY3J5cHRvZ3JhcGhpYyBj
b250ZXh0IiBha2luIHRvIHRoZSBvcmRpbmFyeQo+IHNpdHVhdGlvbiB3aGVyZSB0aW1pbmcgYXR0
YWNrcyBhcmUgYWdhaW5zdCBzZWNyZXRzIGxpa2UgaGFzaCByZXN1bHRzCj4gb3IgcHJpdmF0ZSBr
ZXlzLiBJIGhhZCBjb25zaWRlcmVkIGltcGxlbWVudGluZyB0aGlzIGFzIGEgY29uc3RhbnQgdGlt
ZQo+IGZ1bmN0aW9uLCBidXQgSSBoYWQgYSBoYXJkIHRpbWUgY29taW5nIHVwIHdpdGggc2NlbmFy
aW9zIGluIHdoaWNoOgo+IAo+IC0gYW4gYXR0YWNrIHdvdWxkIGJlIHBvc3NpYmxlOyBhbmQKPiAt
IGl0IHdvdWxkIGdhaW4gdGhlIGF0dGFja2VyIGEgcGFydGljdWxhcmx5IHVzZWZ1bCBwaWVjZSBv
ZiBpbmZvcm1hdGlvbi4KCkkgY2Fu4oCZdCB0aGluayBvZiBhbnkgdG9vLCBidXQgdGhlcmUgaXMg
bm8gcmVhbCBjb3N0IHRvIGl0LCBpbiBmYWN0IGl0IHdvdWxkIHByb2JhYmx5IGJlIGZhc3RlciB0
aGFuIGNhbGxpbmcgbWVtY21wLCBzbyB3aHkgbm90IGRvIGl0IGluIGNvbnN0YW50IHRpbWU/Cgo+
IAo+IFlvdSBjb3VsZCBhcmd1ZSB0aGF0IGFuIGF0dGFja2VyIHdobyBoYXMgc3RvbGVuIGEgdmlj
dGltJ3MgcHJpdmF0ZSBrZXkKPiBhbmQgaGFzIGFjY2VzcyB0byBlbm91Z2ggdGltaW5nIGluZm9y
bWF0aW9uIG9uIF9vdGhlcl8gdGhpbmdzCj4gaGFwcGVuaW5nIG9uIHRoZSBDUFUgKGJ1dCBub3Qg
ZnJvbSBhbnkgdGltaW5nIG9mIGEgcmVsYXRlZCByZXNwb25zZSwKPiBzaW5jZSB0aGVyZSBpc24n
dCBvbmUgZm9yIGhhbmRzaGFrZXMgd2l0aCBvbGQgdGltZXN0YW1wcykgbWlnaHQgYmUKPiBhYmxl
IHRvIGNvbnN0cnVjdCBwYWNrZXRzIHRvIGd1ZXNzIHdvcmQtYnktd29yZCB0aGUgbGFzdCB0aW1l
IHRoZQo+IHZpY3RpbSBjb21wbGV0ZWQgYSBoYW5kc2hha2UuIEJ1dCBvbiB0aGUgb3RoZXIgaGFu
ZCwgY291bGRuJ3QgdGhhdAo+IGF0dGFja2VyIGluc3RlYWQganVzdCBrZWVwIGluY3JlbWVudGlu
ZyB0aGUgY291bnRlciBzZWNvbmQgYnkgc2Vjb25kCj4gdW50aWwgaGUgZG9lcyByZWNlaXZlIGEg
cmVzcG9uc2U/IFRoaXMgc291bmRzIGZhciBlYXNpZXIgYW5kIGRvZXNuJ3QKPiByZXF1aXJlIHRp
bWluZyBpbmZlcmVuY2VzLiBBbm90aGVyIGF0dGFjayBtaWdodCBiZSB0aGF0IGFuIGF0dGFja2Vy
Cj4gd2hvIGhhc24ndCBzdG9sZW4gYSBwcml2YXRlIGtleSBnZXRzIGEgaG9sZCBvZiBhbiBvbGQg
aGFuZHNoYWtlCj4gbWVzc2FnZS4gVGhlbiBieSBzb21laG93IGhhdmluZyB0aW1pbmcgaW5mb3Jt
YXRpb24gdG8gX290aGVyXyB0aGluZ3MKPiBoYXBwZW5pbmcgb24gdGhlIENQVSAoYnV0IG5vdCB0
aHJvdWdoIHRpbWluZyBvZiBhbnkgcmVsYXRlZCByZXNwb25zZSksCj4gaGUgZ2FpbnMgc29tZSBp
bmZvcm1hdGlvbiBhYm91dCB0aGUgdGltZXN0YW1wIGNpcGhlcnRleHQsIHBlcmhhcHMgYnkKPiB2
aXJ0dWUgb2YgYWxyZWFkeSBrbm93aW5nIHRocm91Z2ggdmFyaW91cyBtZWFucyB3aGF0IHRoZSBf
Y3VycmVudF8KPiBsYXRlc3QgaGFuZHNoYWtlIGlzLiBCdXQgSSdtIG5vdCBzdXJlIHRoaXMgaXMg
YWN0dWFsbHkgZmVhc2libGUgYW5kIGluCj4gd2hpY2ggY2lyY3Vtc3RhbmNlcyB0aGF0IHdvdWxk
IGFjdHVhbGx5IGNyb3AgdXAgYXMgYSB1c2VmdWwgYXR0YWNrIG9yCj4gd2h5IGFuIGF0dGFja2Vy
IHdvdWxkIGluIHRoZSBmaXJzdCBwbGFjZSBoYXZlIGxpbWl0ZWQgaW5mb3JtYXRpb24gbGlrZQo+
IHRoYXQuCj4gCj4gSSdtIGFsbCBlYXJzIGlmIHlvdSBjYW4gdGhpbmsgb2YgYSBjbGV2ZXIgc2l0
dWF0aW9uIHRoYXQganVzdGlmaWVzCj4gZG9pbmcgdGhlIGNvbXBhcmlzb24gZGlmZmVyZW50bHku
IEkganVzdCBoYXZlbid0IGZvdW5kIG9uZSBhbmQgbmVpdGhlcgo+IGhhcyBhbnlvbmUgSSd2ZSBu
ZXVyb3RpY2FsbHkgY29udmVyc2VkIHdpdGggYWJvdXQgdGhpcyB2ZXJ5IGlzc3VlLiBCdXQKPiB0
aGF0IGRvZXNuJ3QgbWVhbiBpdCBkb2Vzbid0IGV4aXN0OiBwZXJoYXBzIHlvdSBoYXZlIHNvbWV0
aGluZwo+IHNwZWNpZmljIGluIG1pbmQ/Cj4gCj4gUmVnYXJkcywKPiBKYXNvbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcg
bGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21h
aWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
