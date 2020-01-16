Return-Path: <SRS0=8jGa=3F=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIM_ADSP_ALL,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ADB2C33CB1
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Jan 2020 09:56:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B765B206D9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Jan 2020 09:56:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=toke.dk header.i=@toke.dk header.b="g2Rr/Biy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B765B206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=toke.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87c2fbff;
	Thu, 16 Jan 2020 09:55:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a84c804c
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Jan 2020 09:55:48 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [45.145.95.4])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 016efce0
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Jan 2020 09:55:47 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=toke.dk; s=20161023;
 t=1579168545; bh=DZnacbjDgf1c92FT7NcVX5CqYT0DiURAULqHJWSWrz8=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=g2Rr/Biy+R+zgLUUftw55pH5ZRK2ytH+3yhv4RircoAsT+XrBR4H/Wbwt7DxdbvRd
 tEZvas3izwvklq/OjHehxh7jpOeNrqGsZDrc158y6v7AnDyFKLAbmeofXbFgKk9T5Q
 u6pESPTquIBZ9o0lYWBkI+rtjJvoNY0gfi/Y9B5QzVFTp3tEsMuR/LSpDWS6t77yJS
 Bw5WNKbyOGaq35F0PmM/PB2Mz+ji4eS0q14P/2AtmjkcboNzC5eNynLPliljyeR0PJ
 hLLhjPSdYoRC8cu5GQjq6+dksCIaSKfAs0xLd7sm21IPTKt0RS9m4ALNMwK6gcoXDB
 oCc5ehQxe3xwQ==
To: Motiejus =?utf-8?Q?Jak=C5=A1tys?= <motiejus.jakstys@gmail.com>,
 wireguard@lists.zx2c4.com
Subject: Re: multiple endpoints for a single peer -- implementation details
In-Reply-To: <CAFVMu-q_B2EJk_GkY-3vxGT94Bcmozuom1jwQ15kZgbT81-=sg@mail.gmail.com>
References: <CAFVMu-q_B2EJk_GkY-3vxGT94Bcmozuom1jwQ15kZgbT81-=sg@mail.gmail.com>
Date: Thu, 16 Jan 2020 10:55:45 +0100
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87v9pbsp26.fsf@toke.dk>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

TW90aWVqdXMgSmFrxaF0eXMgPG1vdGllanVzLmpha3N0eXNAZ21haWwuY29tPiB3cml0ZXM6Cgo+
IEhpIGFsbCwKPgo+IEkgdGhvdWdodCBJJ2QgaW1wbGVtZW50IGEgcHJvdG90eXBlIHRvIHVzZSBt
dWx0aXBsZSBlbmRwb2ludHMgZm9yIGEKPiBzaW5nbGUgcGVlciwgYnV0IGFmdGVyIHNvbWUgYW5h
bHlzaXMgb24gIiMjIFNlbGVjdCBuZXcgZW5kcG9pbnQgZHVyaW5nCj4gZWFjaCBoYW5kc2hha2Ui
WzFdLCBJJ2QgbGlrZSB0byBzaGFyZSB0aGUgY29uY2VybnMgd2l0aCBmdXR1cmUgcmVhZGVycwo+
IHdobyBtaWdodCB0cnkgdGhlIHNhbWUgZW5kZWF2b3IuIFRMRFI6IEkgdGhpbmsgdGhlIGtlcm5l
bCBpcyBub3QgaW4KPiB0aGUgYmVzdCBwb3NpdGlvbiB0byBkbyB0aGlzLCAiZGVjaXNpb24gbWFr
aW5nIGluIHVzZXIgc3BhY2UiIG1heSBiZQo+IG1vcmUgYXBwcm9wcmlhdGUuCj4KPiBUbyBtYWtl
IGl0IGhhcHBlbiwgaGFuZHNoYWtlIHByb2Nlc3Mgd291bGQgY2hhbmdlLiBOZXcgc3VnZ2VzdGVk
IGZsb3c6Cj4gLSBJbml0aWF0b3Igc2VuZHMgYSBoYW5kc2hha2UgcGFja2V0IHRvIGFsbCBlbmRw
b2ludHMgcXVhc2ktc2ltdWx0YW5lb3VzbHkuCj4gICAtIEVhY2ggaGFuZHNoYWtlIGlzIGEgbmV3
IG1lc3NhZ2Ugd2l0aCBhIGRpZmZlcmVudCBlcGhlbWVyYWwga2V5IGV0IGFsLgo+IC0gUmVzcG9u
ZGVyIHJlY2VpdmVzIHRoZSBmaXJzdCBvbmUgYW5kIHJlc3BvbmRzLgo+IC0gUmVzcG9uZGVyIHJl
Y2VpdmVzIG1vcmUgaGFuZHNoYWtlcyB3aXRoaW4gMS9JTklUSUFUSU9OU19QRVJfU0VDT05ECj4g
YW5kIGRpc2NhcmRzIHRoZW0uCj4gLSBSZXNwb25kZXIgbWF5IHJlY2VpdmUgbW9yZSBhZnRlciAx
L0lOSVRJQVRJT05TX1BFUl9TRUNPTkQgYW5kIHJlc3BvbmRzLgo+Cj4gUmVzcG9uZGVyIG5lZWRz
IHRvIG1haW50YWluIG1vcmUgdGhhbiBvbmUgaGFuZHNoYWtlIHN0YXRlIGZvcgo+IE1BWF9USU1F
Ul9IQU5EU0hBS0VTLCBzcGVjaWZpY2FsbHksIHRoZSB3aG9sZSBgbm9pc2VfaGFuZHNoYWtlYAo+
IHN0cnVjdC4gRm9sbG93aW5nIGEgbGF0ZXIgc3VnZ2VzdGlvbiBpbiB0aGUgdGhyZWFkLCB0aGlz
IGNhbiBoYXZlIGFuCj4gdXBwZXIgYm91bmQgb2YgTUFYX0VORFBPSU5UU19QRVJfUEVFUiAoVEJE
IGNvbnN0YW50KS4KCkJlZm9yZSB5b3UgZ28gYW5kIHJlLWludmVudCB0aGUgaGFwcHkgZXllYmFs
bHMgYWxnb3JpdGhtLCBtYXkgSSBzdWdnZXN0CnlvdSByZWFkIHRoZSBSRkM/IDopCgpodHRwczov
L3Rvb2xzLmlldGYub3JnL2h0bWwvcmZjODMwNQoKU3BlY2lmaWNhbGx5LCB0aGUgY29uc2lkZXJh
dGlvbnMgZm9yIGhvdyB0byBkbyBtdWx0aXBsZSBjb25uZWN0aW9uCmF0dGVtcHRzIHNhZmVseSB3
aXRob3V0IG92ZXJsb2FkaW5nIHRoZSBuZXR3b3JrIGlzIHJlbGV2YW50IGZvciB0aGlzLiBBcwpp
cyB0aGUgYml0IGFib3V0IHNvcnRpbmcgRE5TIHJlc3BvbnNlcy4KClsuLi5dCgo+IDIuIG1vcmUg
YSBjb25jZXJuOiBuZWl0aGVyIGtlcm5lbCwgbm9yIHdpcmVndWFyZC1nbyBpbXBsZW1lbnRhdGlv
bnMKPiBhcmUgd2lsbGluZyB0byBhY2NlcHQgbW9yZSB0aGFuIG9uZSBlbmRwb2ludCwgYW5kIGl0
IHdvdWxkIGJlIG1lc3N5IHRvCj4gZXh0ZW5kOgo+Cj4gaW5jbHVkZS91YXBpL2xpbnV4L3dpcmVn
dWFyZC5oCj4gICBXR1BFRVJfQV9FTkRQT0lOVDogc3RydWN0IHNvY2thZGRyX2luIG9yIHN0cnVj
dCBzb2NrYWRkcl9pbjYKPgo+IGRldmljZS91YXBpLmdvOgo+ICAgY2FzZSAiZW5kcG9pbnQiOgo+
ICAgLi4uCj4gICAgIGVuZHBvaW50LCBlcnIgOj0gQ3JlYXRlRW5kcG9pbnQodmFsdWUpCj4KPiBF
bmRwb2ludCBpcyBmaXhlZCB0byBiZSBhIHNpbmdsZSBVRFAgYWRkcmVzcywgYW5kIGJvdGgga2Vy
bmVsIGFuZAo+IHdpcmVndWFyZC1nbyByZWZ1c2UgdW5rbm93biBrZXlzLiBUbyBoYXZlIHRvb2xp
bmcKPiBiYWNrd2FyZHMtY29tcGF0aWJpbGl0eSAoaS5lLiB1c2UgbmV3ZXIgd2lyZWd1YXJkLXRv
b2xzIHdpdGggb2xkZXIKPiBrZXJuZWwgaW1wbGVtZW50YXRpb25zKSwgd2lyZWd1YXJkLXRvb2xz
IHdvdWxkIG5lZWQgdG8ga25vdyB0aGUKPiBzdXBwb3J0ZWQgImZlYXR1cmVzIiBvZiB0aGUgdW5k
ZXJseWluZyBpbXBsZW1lbnRhdGlvbi4gQW5kIHRoZXJlIGlzIG5vCj4gdmVyc2lvbiBuZWdvdGlh
dGlvbiBiZXR3ZWVuIHRoZSB1c2VyL2tlcm5lbCBzcGFjZS4gV2hpY2ggbWFrZXMgaXQKPiB0cmlj
a3kgdG8gYWRkIGZlYXR1cmVzIGxpa2UgdGhpcy4KCkVoPyBUaGUga2VybmVsIEFQSSBpcyBuZXRs
aW5rIC0geW91IGNvdWxkIGp1c3QgYWRkIG11bHRpcGxlCldHUEVFUl9BX0VORFBPSU5UIGF0dHJp
YnV0ZXMuIE9yIGFkZCBhIG5ldyBvbmUKKFdHUEVFUl9BX0VORFBPSU5UU19NVUxUST8pLiBTYW1l
IHRoaW5nIGZvciB3aXJlZ3VhcmQtZ28gKEkgYXNzdW1lKS4KCj4gSSBhbSBzdWdnZXN0aW5nIHRo
YXQgIiMjIERlY2lzaW9uLW1ha2luZyBpbiB1c2Vyc3BhY2UiIHdvdWxkIHdvcmsKPiBiZXR0ZXIg
aGVyZS4gVXNlcnNwYWNlIHdvdWxkIHJlZ3VsYXJseSogaXNzdWUgaGFuZHNoYWtlIGluaXRpYXRp
b25zCj4gYW5kIG1lYXN1cmUgaG93IGxvbmcgaXQgdGFrZXMgZm9yIGVhY2ggZW5kcG9pbnQsIGFu
ZCBoYW5kIG92ZXIgdGhlCj4gKnNpbmdsZSogZW5kcG9pbnQgdG8gdGhlIGtlcm5lbCB0byBjb25u
ZWN0LgoKV2h5IG5vdCBqdXN0IGxldCB1c2Vyc3BhY2UgYWRkIG1vcmUgZW5kcG9pbnRzIHRvIGFu
IGFscmVhZHkgZXN0YWJsaXNoZWQKcGVlciwgYW5kIGhhdmUgdGhlIGtlcm5lbCBmaWd1cmUgb3V0
IHRoZSBzZWxlY3Rpb24gYmV0d2VlbiB0aGVtPwoKLVRva2UKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3Vh
cmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGlu
Zm8vd2lyZWd1YXJkCg==
