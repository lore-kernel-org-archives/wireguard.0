Return-Path: <SRS0=wyc1=2U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DECC2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Dec 2019 09:37:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6987620748
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Dec 2019 09:37:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="UaUxpn0V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6987620748
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0c5c717;
	Mon, 30 Dec 2019 09:37:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e825dc2
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 09:37:50 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2e9687d
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 09:37:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb238281
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 08:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=2RSP7cz1Y0mB
 NHclGyIlAndscjM=; b=UaUxpn0V7K15oietgByhgGvWg8cnvCJX5JhHPlLy/H7d
 HHkHLN3mrUbZSshr6UsKpbKetzYE3VbWwPDHaNZH8hCdzCjYkzVBzzI+foyZvvzy
 2y/D79d5g1M4EVcdKcvHXDuc5tUh6BRezk/X0VQElM9jou018w0H3ftw74WGaPiq
 UqRBrvAOuCa6Z7cK95O8uBVXGCNblyunSpnF9/d63RSvJl7NfeEmFt2tb3QBftxf
 jj6bvGvAF4IogoDTcWu6B9wfLxnU5vk+ctfjwfZdqQZGGQhsytUC6mBjGEga5+vb
 HVq6r17PhN1k8DCKs8zxvmNTmq6w2fkpbAtf+nX44w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1cc238f6
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Dec 2019 08:39:43 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id 19so33119015otz.3
 for <wireguard@lists.zx2c4.com>; Mon, 30 Dec 2019 01:37:49 -0800 (PST)
X-Gm-Message-State: APjAAAWkJ+I+Pgu9NpnpX9uYuAjdx6zgNkTE2w4yRz6S8uBjc9ThlIze
 qRSns3IbwvJhpwPehlUCfH7MbMjeY5ptlwn14Q4=
X-Google-Smtp-Source: APXvYqy5QYMUB3tjpA78S0RK4NjRXDijfMMTA9W1V72/Ui7NVANUBVt+7B50aKhm7sTQMWaqwmLtCAWYrTs5bFGsK6U=
X-Received: by 2002:a9d:6745:: with SMTP id w5mr58496040otm.52.1577698668677; 
 Mon, 30 Dec 2019 01:37:48 -0800 (PST)
MIME-Version: 1.0
References: <CtiLrRxfJF8VjxK15ZVRrI9eJBflmVjOBKiOTYAHVAmF7lVPMuQvg3luFb89M3FKdy2fvemWnkfXd-LRJ1MCGy0GC2TddQuX0-Wga9hBS_4=@protonmail.com>
 <A02FDAAF-B405-4735-9DD1-95A7F6CE9B3F@lonnie.abelbeck.com>
 <bWad1d4zSz8UESfEBgTLTfDZQbC9-fLXfJF2R3GoONB9PuL3WjNnYrnFQOYmt-gQa9sLLMDJJ8p6zY8XEUlXxxudvzNC5OUjuG75yjbBMIY=@protonmail.com>
 <CAHmME9q1s8Ze40Uzi9+9PM8h=iWAs7_U=Zh2+5O8GjAjQKFeag@mail.gmail.com>
In-Reply-To: <CAHmME9q1s8Ze40Uzi9+9PM8h=iWAs7_U=Zh2+5O8GjAjQKFeag@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 30 Dec 2019 10:37:37 +0100
X-Gmail-Original-Message-ID: <CAHmME9q=L1kyxSu8KBVMkZx6-A77RaAeCtXeOaYQbXGDho-Ujg@mail.gmail.com>
Message-ID: <CAHmME9q=L1kyxSu8KBVMkZx6-A77RaAeCtXeOaYQbXGDho-Ujg@mail.gmail.com>
Subject: Re: remove peer endpoint
To: Devin Smith <devinrsmith@protonmail.com>
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

SGkgRGV2aW4sCgpDb3VsZCB5b3UgbGV0IG1lIGtub3cgeW91ciByZWFzb24gZm9yIHdhbnRpbmcg
dGhpcz8gSWYgdGhlcmUncyBhIGdvb2QKanVzdGlmaWNhdGlvbiwgd2UgY291bGQgY29uc2lkZXIg
YWRkaW5nIGl0LiBCdXQgSSdkIGxpa2Ugc29tZQpyZWFzb25pbmcgYXMgaXQgcmVsYXRlcyB0byB0
aGUgZW50aXJlIHN5c3RlbSB5b3UncmUgdHJ5aW5nIHRvIGJ1aWxkLApmaXJzdC4KClRoYW5rcywK
SmFzb24KCk9uIFNhdCwgRGVjIDI4LCAyMDE5IGF0IDEwOjM2IFBNIEphc29uIEEuIERvbmVuZmVs
ZCA8SmFzb25AengyYzQuY29tPiB3cm90ZToKPgo+IEknbSBpbnRlcmVzdGVkIHRvIGxlYXJuLCB3
aHkgd291bGQgeW91IHdhbnQgc3VjaCBhIHRoaW5nPyBUaGUgZW5kcG9pbnQgZmllbGQgaXMgb25s
eSBldmVyIGEgImhpbnQiIGFueXdheSwgZHVlIHRvIHRoZSByb2FtaW5nLgo+Cj4gT24gU2F0LCBE
ZWMgMjgsIDIwMTksIDEzOjEyIERldmluIFNtaXRoIDxkZXZpbnJzbWl0aEBwcm90b25tYWlsLmNv
bT4gd3JvdGU6Cj4+Cj4+IElmIEknbSBub3QgbWlzdGFrZW4sIGB3ZyBzZXQgPGludGVyZmFjZT4g
cGVlciA8YmFzZTY0PiByZW1vdmVgIHJlbW92ZXMgdGhlIHdob2xlIHBlZXIgLSBJJ20gbG9va2lu
ZyB0byByZW1vdmUganVzdCB0aGUgcGVlcidzIGVuZHBvaW50IGF0dHJpYnV0ZSBbZW5kcG9pbnQg
PGlwPjo8cG9ydD5dLgo+Pgo+PiDigJDigJDigJDigJDigJDigJDigJAgT3JpZ2luYWwgTWVzc2Fn
ZSDigJDigJDigJDigJDigJDigJDigJAKPj4gT24gRnJpZGF5LCBEZWNlbWJlciAyNywgMjAxOSAx
MDo1MSBBTSwgTG9ubmllIEFiZWxiZWNrIDxsaXN0c0Bsb25uaWUuYWJlbGJlY2suY29tPiB3cm90
ZToKPj4KPj4gPiA+IE9uIERlYyAyNywgMjAxOSwgYXQgOTo1MSBBTSwgRGV2aW4gU21pdGggZGV2
aW5yc21pdGhAcHJvdG9ubWFpbC5jb20gd3JvdGU6Cj4+ID4gPiBJcyBpdCBwb3NzaWJsZSB0byBy
ZW1vdmUgdGhlIGVuZHBvaW50IG9mIGEgcGVlciB2aWEgdGhlIGB3ZyBzZXRgIGNvbW1hbmQ/IEFs
bCBvZiB0aGUgb3RoZXIgcGVlciBhdHRyaWJ1dGVzIChwcmVzaGFyZWQta2V5LCBwZXJzaXN0ZW50
LWtlZXBhbGl2ZSwgYWxsb3dlZC1pcHMpIGFyZSByZW1vdmFibGUgaW4gdGhpcyBmYXNoaW9uIChh
bmQgZG9jdW1lbnRlZCBpbiB0aGUgbWFuIHBhZ2UpLiBJJ3ZlIHRyaWVkIGB3ZyBzZXQgPGludGVy
ZmFjZT4gcGVlciA8YmFzZTY0LXB1YmxpYy1rZXk+IGVuZHBvaW50IDBgIC4uLgo+PiA+Cj4+ID4g
WWVzLCB0aGlzIHdvcmtzOgo+PiA+Cj4+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiA+Cj4+ID4g
d2cgc2V0IDxpbnRlcmZhY2U+IHBlZXIgPGJhc2U2NC1wdWJsaWMta2V5PiByZW1vdmUKPj4gPiAt
LQo+PiA+Cj4+ID4gSWYgeW91IGZvcmdldCwgIndnIHNldCAtLWhlbHAiIHdpbGwgcmVtaW5kIHlv
dS4KPj4gPgo+PiA+IExvbm5pZQo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+PiBXaXJlR3VhcmQgbWFpbGluZyBsaXN0Cj4+IFdpcmVHdWFy
ZEBsaXN0cy56eDJjNC5jb20KPj4gaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0
aW5mby93aXJlZ3VhcmQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0
dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
