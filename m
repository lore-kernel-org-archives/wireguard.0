Return-Path: <SRS0=5rhV=NT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F52C0044C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Nov 2018 03:12:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF33F20827
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Nov 2018 03:12:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="J6apr6ma"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF33F20827
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8961323;
	Thu, 8 Nov 2018 03:07:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9fdc26c1
 for <wireguard@lists.zx2c4.com>; Thu, 8 Nov 2018 03:07:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e1aec52
 for <wireguard@lists.zx2c4.com>; Thu, 8 Nov 2018 03:07:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ba03ee7
 for <wireguard@lists.zx2c4.com>; Thu, 8 Nov 2018 03:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=BXR/XVJ1A8vV
 jf2thv76wj9ykM0=; b=J6apr6maRebbg+EcL04ee+XoIOVuTK7omeYHyOVWUbdc
 l+vR9pV0YB2nfHvWNuOsRqlqy8ex55vtyft/7+RRcgjbcLch6jEDjPXi5B826yI0
 pTkrahkTJRVarmpCDKImuWi8udTpndDI6+p9DoKrGoylethIn+j4fKeajZ0BN50S
 LW8rYubZj6oo/DEfWir78Juj334+55v1+sLrVmRMrJHhsuHaJNnwjzu3VJQF6PNt
 m+7Te/Nn8EjMZqQB/0xqkLiMqy6hvdt6oJXEHwCEIQgulBaPVZyNIYtyy5iZn5Vu
 +dvAArnAXjSXL+0VE1DsrAuyP6nwgRPWYg06yO7QCA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3b2dad20
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Nov 2018 03:07:44 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id z33so16754098otz.11
 for <wireguard@lists.zx2c4.com>; Wed, 07 Nov 2018 19:12:16 -0800 (PST)
X-Gm-Message-State: AGRZ1gKZbJCKZZmxUwEMkloxlJuc8IDwUMqk197fssMzQL9n86B+jySQ
 qDEuFq+g1S9TeYf8+fqefl8/AQqy6yLzcvZK0+I=
X-Google-Smtp-Source: AJdET5dhRrFhRgRFz6h5BszFLvFgsvPCiuQP6ebmjuVZXaBKbOengPX12HwrNgG1e/aSocKSu8GMEZ8YqQ8ssM9tkyM=
X-Received: by 2002:a9d:5153:: with SMTP id u19mr1863167oti.199.1541646735958; 
 Wed, 07 Nov 2018 19:12:15 -0800 (PST)
MIME-Version: 1.0
References: <0257672C-2D55-415B-873A-A4D78BF48516@cloudflare.com>
In-Reply-To: <0257672C-2D55-415B-873A-A4D78BF48516@cloudflare.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 8 Nov 2018 04:12:04 +0100
X-Gmail-Original-Message-ID: <CAHmME9opfWOJsN-EAF_ZEkE1P4CnDQRQqrp+j2pJGx-Zy3s0XQ@mail.gmail.com>
Message-ID: <CAHmME9opfWOJsN-EAF_ZEkE1P4CnDQRQqrp+j2pJGx-Zy3s0XQ@mail.gmail.com>
Subject: Re: Not really TAI64N
To: Vlad Krasnov <vlad@cloudflare.com>
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

SGkgVmxhZCwKCk9uIFRodSwgTm92IDgsIDIwMTggYXQgMzo1NCBBTSBWbGFkIEtyYXNub3YgPHZs
YWRAY2xvdWRmbGFyZS5jb20+IHdyb3RlOgo+IFRoZSBXaXJlR3VhcmQgc3BlYyBzdGF0ZXMgdGhh
dCBhIHRpbWVzdGFtcCB1c2VkIGlzIFRBSTY0TiwgaG93ZXZlciB0aGUgd2lyZWd1YXJkLWdvIGlt
cGxlbWVudGF0aW9uIHByb2R1Y2VzIGFuIGludmFsaWQgdGltZXN0YW1wLCBiZWNhdXNlIHRoZSBH
byBmdW5jdGlvbiBub3cuVW5peE5hbm8oKSByZXR1cm5zIHRoZSB0b3RhbCBudW1iZXIgb2YgbmFu
b3NlY29uZHMgZnJvbSBlcG9jaCBhbmQgdHJ1bmNhdGVkIHRvIDMyYml0LCB3aGVyZWFzIFRBSTY0
TiByZXF1aXJlcyBpdCB0byBiZSBpbiB0aGUgcmFuZ2UgWzAsIDk5OTk5OTk5OV0uCgpHb29kIGNh
dGNoLCB0aGFua3MuIEZpeGVkIGhlcmU6Cmh0dHBzOi8vZ2l0Lnp4MmM0LmNvbS93aXJlZ3VhcmQt
Z28vY29tbWl0Lz9pZD00ZmQ1NWRhYWZlNjRmNjEwMWRkZTVjMGE4YTY4ODdmZWYwZmYwNTQ1Cgo+
IE1vcmVvdmVyIHRoZSBrZXJuZWwgaW1wbGVtZW50YXRpb24gZG9lcyBub3QgY2hlY2sgaWYgYSB0
aW1lc3RhbXAgaXMgdmFsaWQgVEFJNjROIGF0IGFsbCwgaXQgc2ltcGx5IGNoZWNrcyB0aGF0IHRo
aXMgaXMgYSBtb25vdG9uaWNhbGx5IGluY3JlYXNpbmcsIDEyIGJ5dGUgbG9uZywgYmlnIGVuZGlh
biBudW1iZXIuCj4KPiBXaGlsZSB0aGlzIGlzIHByb2JhYmx5IG5vdCBpbnNlY3VyZSwgaXQgZ29l
cyBhZ2FpbnN0IHdoYXQgaXMgc3RhdGVkIGluIHRoZSB3aGl0ZXBhcGVyLgoKVGhhdCdzIHJpZ2h0
LCBhbmQgYnkgaW50ZW50aW9uLiBUaGUgd2hpdGVwYXBlciAqZG9lcyogbWVudGlvbiB0aGF0OgoK
IlRvIHByZXZlbnQgdGhpcywgYSAxMi1ieXRlIFRBSTY0TiBbN10gdGltZXN0YW1wIGlzIGluY2x1
ZGVkLAplbmNyeXB0ZWQgYW5kIGF1dGhlbnRpY2F0ZWQsIGluIHRoZSBmaXJzdCBtZXNzYWdlLiBU
aGUgcmVzcG9uZGVyIGtlZXBzCnRyYWNrIG9mIHRoZSBncmVhdGVzdCB0aW1lc3RhbXAgcmVjZWl2
ZWQgcGVyIHBlZXIgYW5kIGRpc2NhcmRzIHBhY2tldHMKY29udGFpbmluZyB0aW1lc3RhbXBzIGxl
c3MgdGhhbiBvciBlcXVhbCB0byBpdC4gKEluIGZhY3QsIGl0IGRvZXMgbm90CmV2ZW4gaGF2ZSB0
byBiZSBhbiBhY2N1cmF0ZSB0aW1lc3RhbXA7IGl0IHNpbXBseSBtdXN0IGJlIGEgcGVyLXBlZXIK
bW9ub3RvbmljYWxseSBpbmNyZWFzaW5nIDk2LWJpdCBudW1iZXIuKSIKCj4gQWxzbywgdGhlIGZ1
bmN0aW9uIHVzZWQgZm9yIGNvbXBhcmlzb24gaXMgbWVtY21wLCBub24tY29uc3RhbnQgdGltZSBm
dW5jdGlvbiwgdGhhdCBzaG91bGRu4oCZdCBiZSB1c2VkIGluIGNyeXB0b2dyYXBoaWMgY29udGV4
dC4KClRoaXMgaXMgYWxzbyBtZW50aW9uZWQgaW4gdGhlIHdoaXRlcGFwZXI6CgoiRnJvbSBhbiBp
bXBsZW1lbnRhdGlvbiBwb2ludCBvZiB2aWV3LCBUQUk2NE4gWzddIGlzIHZlcnkgY29udmVuaWVu
dApiZWNhdXNlIGl0IGlzIGJpZy1lbmRpYW4sIGFsbG93aW5nIGNvbXBhcmlzb25zIGJldHdlZW4g
dHdvIDEyLWJ5dGUKdGltZXN0YW1wcyB0byBiZSBkb25lIHVzaW5nIHN0YW5kYXJkIG1lbWNtcCgp
LiIKCkkgcmVhbGl6ZSBvZiBjb3Vyc2UgdGhpcyBpcyB2dWxuZXJhYmxlIHRvIHRpbWluZyBpbmZl
cmVuY2UsIGJ1dCBJCmRpc2FncmVlIHRoYXQgdGhpcyBpcyBhICJjcnlwdG9ncmFwaGljIGNvbnRl
eHQiIGFraW4gdG8gdGhlIG9yZGluYXJ5CnNpdHVhdGlvbiB3aGVyZSB0aW1pbmcgYXR0YWNrcyBh
cmUgYWdhaW5zdCBzZWNyZXRzIGxpa2UgaGFzaCByZXN1bHRzCm9yIHByaXZhdGUga2V5cy4gSSBo
YWQgY29uc2lkZXJlZCBpbXBsZW1lbnRpbmcgdGhpcyBhcyBhIGNvbnN0YW50IHRpbWUKZnVuY3Rp
b24sIGJ1dCBJIGhhZCBhIGhhcmQgdGltZSBjb21pbmcgdXAgd2l0aCBzY2VuYXJpb3MgaW4gd2hp
Y2g6CgotIGFuIGF0dGFjayB3b3VsZCBiZSBwb3NzaWJsZTsgYW5kCi0gaXQgd291bGQgZ2FpbiB0
aGUgYXR0YWNrZXIgYSBwYXJ0aWN1bGFybHkgdXNlZnVsIHBpZWNlIG9mIGluZm9ybWF0aW9uLgoK
WW91IGNvdWxkIGFyZ3VlIHRoYXQgYW4gYXR0YWNrZXIgd2hvIGhhcyBzdG9sZW4gYSB2aWN0aW0n
cyBwcml2YXRlIGtleQphbmQgaGFzIGFjY2VzcyB0byBlbm91Z2ggdGltaW5nIGluZm9ybWF0aW9u
IG9uIF9vdGhlcl8gdGhpbmdzCmhhcHBlbmluZyBvbiB0aGUgQ1BVIChidXQgbm90IGZyb20gYW55
IHRpbWluZyBvZiBhIHJlbGF0ZWQgcmVzcG9uc2UsCnNpbmNlIHRoZXJlIGlzbid0IG9uZSBmb3Ig
aGFuZHNoYWtlcyB3aXRoIG9sZCB0aW1lc3RhbXBzKSBtaWdodCBiZQphYmxlIHRvIGNvbnN0cnVj
dCBwYWNrZXRzIHRvIGd1ZXNzIHdvcmQtYnktd29yZCB0aGUgbGFzdCB0aW1lIHRoZQp2aWN0aW0g
Y29tcGxldGVkIGEgaGFuZHNoYWtlLiBCdXQgb24gdGhlIG90aGVyIGhhbmQsIGNvdWxkbid0IHRo
YXQKYXR0YWNrZXIgaW5zdGVhZCBqdXN0IGtlZXAgaW5jcmVtZW50aW5nIHRoZSBjb3VudGVyIHNl
Y29uZCBieSBzZWNvbmQKdW50aWwgaGUgZG9lcyByZWNlaXZlIGEgcmVzcG9uc2U/IFRoaXMgc291
bmRzIGZhciBlYXNpZXIgYW5kIGRvZXNuJ3QKcmVxdWlyZSB0aW1pbmcgaW5mZXJlbmNlcy4gQW5v
dGhlciBhdHRhY2sgbWlnaHQgYmUgdGhhdCBhbiBhdHRhY2tlcgp3aG8gaGFzbid0IHN0b2xlbiBh
IHByaXZhdGUga2V5IGdldHMgYSBob2xkIG9mIGFuIG9sZCBoYW5kc2hha2UKbWVzc2FnZS4gVGhl
biBieSBzb21laG93IGhhdmluZyB0aW1pbmcgaW5mb3JtYXRpb24gdG8gX290aGVyXyB0aGluZ3MK
aGFwcGVuaW5nIG9uIHRoZSBDUFUgKGJ1dCBub3QgdGhyb3VnaCB0aW1pbmcgb2YgYW55IHJlbGF0
ZWQgcmVzcG9uc2UpLApoZSBnYWlucyBzb21lIGluZm9ybWF0aW9uIGFib3V0IHRoZSB0aW1lc3Rh
bXAgY2lwaGVydGV4dCwgcGVyaGFwcyBieQp2aXJ0dWUgb2YgYWxyZWFkeSBrbm93aW5nIHRocm91
Z2ggdmFyaW91cyBtZWFucyB3aGF0IHRoZSBfY3VycmVudF8KbGF0ZXN0IGhhbmRzaGFrZSBpcy4g
QnV0IEknbSBub3Qgc3VyZSB0aGlzIGlzIGFjdHVhbGx5IGZlYXNpYmxlIGFuZCBpbgp3aGljaCBj
aXJjdW1zdGFuY2VzIHRoYXQgd291bGQgYWN0dWFsbHkgY3JvcCB1cCBhcyBhIHVzZWZ1bCBhdHRh
Y2sgb3IKd2h5IGFuIGF0dGFja2VyIHdvdWxkIGluIHRoZSBmaXJzdCBwbGFjZSBoYXZlIGxpbWl0
ZWQgaW5mb3JtYXRpb24gbGlrZQp0aGF0LgoKSSdtIGFsbCBlYXJzIGlmIHlvdSBjYW4gdGhpbmsg
b2YgYSBjbGV2ZXIgc2l0dWF0aW9uIHRoYXQganVzdGlmaWVzCmRvaW5nIHRoZSBjb21wYXJpc29u
IGRpZmZlcmVudGx5LiBJIGp1c3QgaGF2ZW4ndCBmb3VuZCBvbmUgYW5kIG5laXRoZXIKaGFzIGFu
eW9uZSBJJ3ZlIG5ldXJvdGljYWxseSBjb252ZXJzZWQgd2l0aCBhYm91dCB0aGlzIHZlcnkgaXNz
dWUuIEJ1dAp0aGF0IGRvZXNuJ3QgbWVhbiBpdCBkb2Vzbid0IGV4aXN0OiBwZXJoYXBzIHlvdSBo
YXZlIHNvbWV0aGluZwpzcGVjaWZpYyBpbiBtaW5kPwoKUmVnYXJkcywKSmFzb24KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcg
bGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21h
aWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
