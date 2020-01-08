Return-Path: <SRS0=tlKF=25=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29CEC33C99
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 Jan 2020 00:48:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC68720692
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 Jan 2020 00:48:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="DqrVhoY1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC68720692
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3c778ea;
	Wed, 8 Jan 2020 00:48:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77c0cf67
 for <wireguard@lists.zx2c4.com>; Wed, 8 Jan 2020 00:48:17 +0000 (UTC)
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55e643f0
 for <wireguard@lists.zx2c4.com>; Wed, 8 Jan 2020 00:48:17 +0000 (UTC)
Date: Wed, 08 Jan 2020 00:48:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1578444496;
 bh=FkGdKKJgSV9gC4mfUzfn9mAkQ0BzWOsSwbDZFULyhlo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=DqrVhoY1btYWKOxBRQjNr4ZoDOJd08gBUEmtDopM/1a1tagfqliJEsoiaCXZMFL6q
 iqgmIrRZrIC1hsALOw9VfvwexOObDazmUwaUVqJyBMBLhH1N7q0kAca3+NymL+rzUC
 xW983YbZ0P3yFqFj6lBtgyb5m8WYxR7WYTqGafx4=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Devin Smith <devinrsmith@protonmail.com>
Subject: Re: remove peer endpoint
Message-ID: <h5iy7cvtz8UAyNLvf8J_py2H-5UOHp_9QN3wUWviT19l2T6BeiZVuaXZ5GN5712b4NIw7zODom88DP1JCh19XKm8yiY_0pddzdQ9gaauhF8=@protonmail.com>
In-Reply-To: <CAHmME9q=L1kyxSu8KBVMkZx6-A77RaAeCtXeOaYQbXGDho-Ujg@mail.gmail.com>
References: <CtiLrRxfJF8VjxK15ZVRrI9eJBflmVjOBKiOTYAHVAmF7lVPMuQvg3luFb89M3FKdy2fvemWnkfXd-LRJ1MCGy0GC2TddQuX0-Wga9hBS_4=@protonmail.com>
 <A02FDAAF-B405-4735-9DD1-95A7F6CE9B3F@lonnie.abelbeck.com>
 <bWad1d4zSz8UESfEBgTLTfDZQbC9-fLXfJF2R3GoONB9PuL3WjNnYrnFQOYmt-gQa9sLLMDJJ8p6zY8XEUlXxxudvzNC5OUjuG75yjbBMIY=@protonmail.com>
 <CAHmME9q1s8Ze40Uzi9+9PM8h=iWAs7_U=Zh2+5O8GjAjQKFeag@mail.gmail.com>
 <CAHmME9q=L1kyxSu8KBVMkZx6-A77RaAeCtXeOaYQbXGDho-Ujg@mail.gmail.com>
Feedback-ID: XeGiycWlBLSU4ELhwyilafnp6KvXo0lPbKJxA_NjPuEyMu8EOfSDLrsklLCIx1Se8qkoT0W-9YiW9Q-F6KAU4g==:Ext:ProtonMail
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Devin Smith <devinrsmith@protonmail.com>
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

SXQncyBtb3JlIG9mIGEgdGhlb3JldGljYWwgcXVlc3Rpb24gd3J0IGNvbmZpZ3VyYXRpb24gKGFu
IGF0dGVtcHQgb2YgbWluZSB0byBkZWZpbmUgYSBtb3JlIGRlY2xhcmF0aXZlIGNvbmZpZ3VyYXRp
b24gbW9kZWwgb24gdG9wIG9mIHdnKSAtIGJ1dCBJIGNhbiBzZWUgaG93IGl0J3MgcHJvYmFibHkg
bm90IHZlcnkgdXNlZnVsIGluIG1vc3QgY2FzZXMuIFRoZXJlIG1heSBiZSBzb21lIGVkZ2UgY2Fz
ZXMgd2hlcmUgaXQgbWF5IG1ha2Ugc2Vuc2UgLSBmb3IgZXhhbXBsZSwgeW91IGNyZWF0ZSBhIG5l
dyBwZWVyIHdpdGggYW4gKGluY29ycmVjdCkgZW5kcG9pbnQsIGJ1dCByZWFsaXplIHRoYXQgZW5k
cG9pbnQgc2hvdWxkIGFjdHVhbGx5IGJlIHVuc2V0LiBJdCdzIGVhc3kgZW5vdWdoIHRvIHRlYXIg
ZG93biB0aGUgcGVlciwgYW5kIHJlYnVpbGQgaXQgd2l0aG91dCB0aGUgZW5kcG9pbnQgc2V0OyBv
ciBqdXN0IGxlYXZlIHRoZSBlbmRwb2ludCBzaW5jZSBpdCdzIGEgaGludDsgYnV0IHRoZSBmaXJz
dCBpcyAiaW5lZmZpY2llbnQiLCBhbmQgdGhlIHNlY29uZCBsZWF2ZXMgdGhlIHJ1bnRpbWUgYXQg
b2RkcyB3aXRoIHRoZSBkZXNpcmVkIChkZWNsYXJhdGl2ZSkgY29uZmlndXJhdGlvbi4KCkl0J3Mg
cHJvYmFibHkgYSBmcmluZ2UgaXNzdWUsIHNvIG5vdCBzdXJlIGlmIGl0IG1ha2VzIHNlbnNlIHRv
IGFkZCBpdC4KCgrigJDigJDigJDigJDigJDigJDigJAgT3JpZ2luYWwgTWVzc2FnZSDigJDigJDi
gJDigJDigJDigJDigJAKT24gTW9uZGF5LCBEZWNlbWJlciAzMCwgMjAxOSAzOjM3IEFNLCBKYXNv
biBBLiBEb25lbmZlbGQgPEphc29uQHp4MmM0LmNvbT4gd3JvdGU6Cgo+IEhpIERldmluLAo+Cj4g
Q291bGQgeW91IGxldCBtZSBrbm93IHlvdXIgcmVhc29uIGZvciB3YW50aW5nIHRoaXM/IElmIHRo
ZXJlJ3MgYSBnb29kCj4ganVzdGlmaWNhdGlvbiwgd2UgY291bGQgY29uc2lkZXIgYWRkaW5nIGl0
LiBCdXQgSSdkIGxpa2Ugc29tZQo+IHJlYXNvbmluZyBhcyBpdCByZWxhdGVzIHRvIHRoZSBlbnRp
cmUgc3lzdGVtIHlvdSdyZSB0cnlpbmcgdG8gYnVpbGQsCj4gZmlyc3QuCj4KPiBUaGFua3MsCj4g
SmFzb24KPgo+IE9uIFNhdCwgRGVjIDI4LCAyMDE5IGF0IDEwOjM2IFBNIEphc29uIEEuIERvbmVu
ZmVsZCBKYXNvbkB6eDJjNC5jb20gd3JvdGU6Cj4KPiA+IEknbSBpbnRlcmVzdGVkIHRvIGxlYXJu
LCB3aHkgd291bGQgeW91IHdhbnQgc3VjaCBhIHRoaW5nPyBUaGUgZW5kcG9pbnQgZmllbGQgaXMg
b25seSBldmVyIGEgImhpbnQiIGFueXdheSwgZHVlIHRvIHRoZSByb2FtaW5nLgo+ID4gT24gU2F0
LCBEZWMgMjgsIDIwMTksIDEzOjEyIERldmluIFNtaXRoIGRldmlucnNtaXRoQHByb3Rvbm1haWwu
Y29tIHdyb3RlOgo+ID4KPiA+ID4gSWYgSSdtIG5vdCBtaXN0YWtlbiwgYHdnIHNldCA8aW50ZXJm
YWNlPiBwZWVyIDxiYXNlNjQ+IHJlbW92ZWAgcmVtb3ZlcyB0aGUgd2hvbGUgcGVlciAtIEknbSBs
b29raW5nIHRvIHJlbW92ZSBqdXN0IHRoZSBwZWVyJ3MgZW5kcG9pbnQgYXR0cmlidXRlIFtlbmRw
b2ludCA8aXA+Ojxwb3J0Pl0uCj4gPiA+IOKAkOKAkOKAkOKAkOKAkOKAkOKAkCBPcmlnaW5hbCBN
ZXNzYWdlIOKAkOKAkOKAkOKAkOKAkOKAkOKAkAo+ID4gPiBPbiBGcmlkYXksIERlY2VtYmVyIDI3
LCAyMDE5IDEwOjUxIEFNLCBMb25uaWUgQWJlbGJlY2sgbGlzdHNAbG9ubmllLmFiZWxiZWNrLmNv
bSB3cm90ZToKPiA+ID4KPiA+ID4gPiA+IE9uIERlYyAyNywgMjAxOSwgYXQgOTo1MSBBTSwgRGV2
aW4gU21pdGggZGV2aW5yc21pdGhAcHJvdG9ubWFpbC5jb20gd3JvdGU6Cj4gPiA+ID4gPiBJcyBp
dCBwb3NzaWJsZSB0byByZW1vdmUgdGhlIGVuZHBvaW50IG9mIGEgcGVlciB2aWEgdGhlIGB3ZyBz
ZXRgIGNvbW1hbmQ/IEFsbCBvZiB0aGUgb3RoZXIgcGVlciBhdHRyaWJ1dGVzIChwcmVzaGFyZWQt
a2V5LCBwZXJzaXN0ZW50LWtlZXBhbGl2ZSwgYWxsb3dlZC1pcHMpIGFyZSByZW1vdmFibGUgaW4g
dGhpcyBmYXNoaW9uIChhbmQgZG9jdW1lbnRlZCBpbiB0aGUgbWFuIHBhZ2UpLiBJJ3ZlIHRyaWVk
IGB3ZyBzZXQgPGludGVyZmFjZT4gcGVlciA8YmFzZTY0LXB1YmxpYy1rZXk+IGVuZHBvaW50IDBg
IC4uLgo+ID4gPiA+Cj4gPiA+ID4gWWVzLCB0aGlzIHdvcmtzOgo+ID4gPiA+Cj4gPiA+ID4gd2cg
c2V0IDxpbnRlcmZhY2U+IHBlZXIgPGJhc2U2NC1wdWJsaWMta2V5PiByZW1vdmUKPiA+ID4gPgo+
ID4gPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ID4gPiA+Cj4gPiA+ID4gSWYgeW91IGZvcmdldCwgIndnIHNldCAtLWhlbHAiIHdpbGwgcmVt
aW5kIHlvdS4KPiA+ID4gPiBMb25uaWUKPiA+ID4KPiA+ID4gV2lyZUd1YXJkIG1haWxpbmcgbGlz
dAo+ID4gPiBXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCj4gPiA+IGh0dHBzOi8vbGlzdHMuengy
YzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3Vh
cmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGlu
Zm8vd2lyZWd1YXJkCg==
