Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8426EC65C24
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 20:49:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79AAE20882
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 20:49:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="ut1Rc9H4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79AAE20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 484e8a58;
	Sun, 7 Oct 2018 20:48:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cef257f
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 20:48:23 +0000 (UTC)
Received: from mail-40133.protonmail.ch (mail-40133.protonmail.ch
 [185.70.40.133])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31c681b0
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 20:48:23 +0000 (UTC)
Date: Sun, 07 Oct 2018 20:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1538945344;
 bh=f64Kh4NaPQzjTjnPmRjbZcZxAxmq9PeHL2eDygkuHJo=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=ut1Rc9H4MnrUIorAXRGiUg3J/4AzwjiSmibaZs4ABuVhkEdQAA/2OR5UZCAMa1UIE
 6pT0OZaU2tfm5VIUkvsUpBg23JZHp3fJ973X5zmNzFwMm3plOUEqlyolKgXG2jMaSH
 50b22mvFMk4j3inrDS4vyNANk6bhfz7rGqtjwX5c=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20181007` Available
Message-ID: <8j30b7w3yIgg5rmXSRUNlDH8yquzSydWwqfdQrnRe-T7mK5e_lYfD2v5IKjgHVAcWptoOVXZ_wENwJ1i733Yn45_TjlMg7Tf_WmW7Dkeuco=@protonmail.ch>
In-Reply-To: <6b314daa5d672a51@frisell.zx2c4.com>
References: <6b314daa5d672a51@frisell.zx2c4.com>
Feedback-ID: QEdvdaLhFJaqnofhWA-dldGwsuoeDdDw7vz0UPs8r8sanA3bIt8zJdf4aDqYKSy4gJuZ0WvFYJtvq21y6ge_uQ==:Ext:ProtonMail
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
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

4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ4oCQIE9yaWdpbmFsIE1lc3NhZ2Ug4oCQ4oCQ4oCQ4oCQ4oCQ4oCQ
4oCQCk9uIFN1bmRheSwgT2N0b2JlciA3LCAyMDE4IDU6MjAgUE0sIEphc29uIEEuIERvbmVuZmVs
ZCA8SmFzb25AengyYzQuY29tPiB3cm90ZToKCj4gSGVsbG8sCj4KPiBBIG5ldyBzbmFwc2hvdCwg
YDAuMC4yMDE4MTAwN2AsIGhhcyBiZWVuIHRhZ2dlZCBpbiB0aGUgZ2l0IHJlcG9zaXRvcnkuCj4K
PiBQbGVhc2Ugbm90ZSB0aGF0IHRoaXMgc25hcHNob3QgaXMsIGxpa2UgdGhlIHJlc3Qgb2YgdGhl
IHByb2plY3QgYXQgdGhpcyBwb2ludAo+IGluIHRpbWUsIGV4cGVyaW1lbnRhbCwgYW5kIGRvZXMg
bm90IGNvbnNpdHV0ZSBhIHJlYWwgcmVsZWFzZSB0aGF0IHdvdWxkIGJlCj4gY29uc2lkZXJlZCBz
ZWN1cmUgYW5kIGJ1Zy1mcmVlLiBXaXJlR3VhcmQgaXMgZ2VuZXJhbGx5IHRob3VnaHQgdG8gYmUg
ZmFpcmx5Cj4gc3RhYmxlLCBhbmQgbW9zdCBsaWtlbHkgd2lsbCBub3QgY3Jhc2ggeW91ciBjb21w
dXRlciAodGhvdWdoIGl0IG1heSkuCj4gSG93ZXZlciwgYXMgdGhpcyBpcyBhIHByZS1yZWxlYXNl
IHNuYXBzaG90LCBpdCBjb21lcyB3aXRoIG5vIGd1YXJhbnRlZXMsIGFuZAo+IGl0cyBzZWN1cml0
eSBpcyBub3QgeWV0IHRvIGJlIGRlcGVuZGVkIG9uOyBpdCBpcyBub3QgYXBwbGljYWJsZSBmb3Ig
Q1ZFcy4KPgo+IFdpdGggYWxsIHRoYXQgc2FpZCwgaWYgeW91J2QgbGlrZSB0byB0ZXN0IHRoaXMg
c25hcHNob3Qgb3V0LCB0aGVyZSBhcmUgYQo+IGZldyByZWxldmFudCBjaGFuZ2VzLgo+Cj4gPT0g
Q2hhbmdlcyA9PQo+Cj4gLSAgIG1ha2VmaWxlOiBkbyBtb3JlIGdlbmVyaWMgd2lsZGNhcmQgc28g
YXMgdG8gYXZvaWQgcmVuYW1lIGlzc3Vlcwo+Cj4gICAgIFllc3RlcmRheSdzIHNuYXBzaG90IGJy
b2tlIERLTVMgaW5zdGFsbGF0aW9uLCB3aGljaCBpcyB0aGUgbWFqb3JpdHkgb2YgZGlzdHJvcwo+
ICAgICB1c2luZyBXaXJlR3VhcmQsIHNvIHdlJ3JlIHJ1c2hpbmcgb3V0IGEgZml4IHRoZSBkYXkg
YWZ0ZXIgc28gdGhhdCBwZW9wbGUgY2FuCj4gICAgIGFjdHVhbGx5IHJ1biBpdC4KPgo+IC0gICBj
b21wYXQ6IGFjY291bnQgZm9yIGFuY2llbnQgQVJNIGFzc2VtYmxlcgo+Cj4gLSAgIGNvbXBhdDog
bWFrZSBhc20vc2ltZC5oIGNvbmRpdGlvbmFsIG9uIGl0cyBleGlzdGVuY2UKPgo+IC0gICBjb21w
YXQ6IGNsYW5nIGNhbm5vdCBoYW5kbGUgX19idWlsdGluX2NvbnN0YW50X3AKPgo+ICAgICBZZXN0
ZXJkYXkncyBzbmFwc2hvdCBicm9rZSBvbGQgQVJNIGtlcm5lbHMgYW5kIEFuZHJvaWQga2VybmVs
cyB1c2luZyBDbGFuZy4KPgo+IC0gICBjcnlwdG86IGRpc2FibGUgYnJva2VuIGltcGxlbWVudGF0
aW9ucyBpbiBzZWxmdGVzdHMKPgo+ICAgICBJZiB0aGUgc2VsZnRlc3RzIGRldGVybWluZSBhIHBh
cnRpY3VsYXIgY3J5cHRvIGltcGxlbWVudGF0aW9uIGRvZXNuJ3Qgd29yaywgaXQKPiAgICAgcHJp
bnRzIGEgd2FybmluZyAtLSBzaW5jZSB0aGF0IHdvdWxkIGJlIGEgcHJldHR5IGdyYXZlIGJ1ZyAt
LSBidXQgaXQgYWxzbyBqdXN0Cj4gICAgIGRpc2FibGVzIHRoYXQgaW1wbGVtZW50YXRpb24gc28g
dGhhdCB3ZSBkb24ndCBjb21wdXRlIGFueXRoaW5nIGluY29ycmVjdGx5Lgo+Cj4gLSAgIGNyeXB0
bzogdXNlIEJJVChpKSAmIGJpdG1hcCBpbnN0ZWFkIG9mIChiaXRtYXAgPj4gaSkgJiAxCj4KPiAt
ICAgYWxsb3dlZGlwczogZG9jdW1lbnQgYWRkaXRpb25hbCBub2JzCj4KPiAtICAgY3J5cHRvOiBj
bGVhbiB1cCByZW1haW5pbmcgLmgtPi5jCj4KPiAtICAgZ2xvYmFsOiBzdHlsZSBuaXRzCj4KPiAg
ICAgVmFyaW91cyBjbGVhbnVwcyBhbmQgc3R5bGUgbml0cy4KPgo+ICAgICBUaGlzIHNuYXBzaG90
IGNvbnRhaW5zIGNvbW1pdHMgZnJvbTogSmFzb24gQS4gRG9uZW5mZWxkLgo+Cj4gICAgIEFzIGFs
d2F5cywgdGhlIHNvdXJjZSBpcyBhdmFpbGFibGUgYXQgaHR0cHM6Ly9naXQuengyYzQuY29tL1dp
cmVHdWFyZC8gYW5kCj4gICAgIGluZm9ybWF0aW9uIGFib3V0IHRoZSBwcm9qZWN0IGlzIGF2YWls
YWJsZSBhdCBodHRwczovL3d3dy53aXJlZ3VhcmQuY29tLyAuCj4KPiAgICAgVGhpcyBzbmFwc2hv
dCBpcyBhdmFpbGFibGUgaW4gY29tcHJlc3NlZCB0YXJiYWxsIGZvcm0gaGVyZToKPiAgICAgaHR0
cHM6Ly9naXQuengyYzQuY29tL1dpcmVHdWFyZC9zbmFwc2hvdC9XaXJlR3VhcmQtMC4wLjIwMTgx
MDA3LnRhci54ego+ICAgICBTSEEyLTI1NjogZDI2ZTBkMTIxNjU5NDg3MWI1OTQ3ZTc2ZDY0YzJm
YTUwZTliMzRiNjhjZGNmYTNmZGFkNTg4Y2JiMzE0YWY4OQo+ICAgICBCTEFLRTJiLTI1NjogNTBk
YzdlMDk1MTNjYWMxYmQ5ZGUxYmYxMzZiYWU0ZDU5NWJiMGQyN2FmZWJjMzNkYWI2YzNiYmJiM2Jj
YTE3NQo+Cj4gICAgIEEgUEdQIHNpZ25hdHVyZSBvZiB0aGF0IGZpbGUgZGVjb21wcmVzc2VkIGlz
IGF2YWlsYWJsZSBoZXJlOgo+ICAgICBodHRwczovL2dpdC56eDJjNC5jb20vV2lyZUd1YXJkL3Nu
YXBzaG90L1dpcmVHdWFyZC0wLjAuMjAxODEwMDcudGFyLmFzYwo+ICAgICBTaWduaW5nIGtleTog
QUI5OTQyRTZENEE0Q0ZDMzQxMjYyMEE3NDlGQzcwMTJBNURFMDNBRQo+Cj4gICAgIElmIHlvdSdy
ZSBhIHNuYXBzaG90IHBhY2thZ2UgbWFpbnRhaW5lciwgcGxlYXNlIGJ1bXAgeW91ciBwYWNrYWdl
IHZlcnNpb24uIElmCj4gICAgIHlvdSdyZSBhIHVzZXIsIHRoZSBXaXJlR3VhcmQgdGVhbSB3ZWxj
b21lcyBhbnkgYW5kIGFsbCBmZWVkYmFjayBvbiB0aGlzIGxhdGVzdAo+ICAgICBzbmFwc2hvdC4K
Pgo+ICAgICBGaW5hbGx5LCBXaXJlR3VhcmQgZGV2ZWxvcG1lbnQgdGhyaXZlcyBvbiBkb25hdGlv
bnMuIEJ5IHBvcHVsYXIgZGVtYW5kLCB3ZQo+ICAgICBoYXZlIGEgd2VicGFnZSBmb3IgdGhpczog
aHR0cHM6Ly93d3cud2lyZWd1YXJkLmNvbS9kb25hdGlvbnMvCj4KPiAgICAgVGhhbmsgeW91LAo+
ICAgICBKYXNvbiBEb25lbmZlbGQKPgoKSSBnb3QgYW4gZXJyb3Igd2hlbiBkb2luZyBpbi10cmVl
IGJ1aWxkIHVzaW5nIFdpcmVHdWFyZC9jb250cmliL2tlcm5lbC10cmVlL2NyZWF0ZS1wYXRjaC5z
aAoKbmV0L3dpcmVndWFyZC9yZWNlaXZlLmM6MzM4OjEwOiBmYXRhbCBlcnJvcjogc2VsZnRlc3Qv
Y291bnRlci5jOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5CiAjaW5jbHVkZSAic2VsZnRlc3Qv
Y291bnRlci5jIgogICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn4KY29tcGlsYXRpb24gdGVy
bWluYXRlZC4KCkpvcmRhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20K
aHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
