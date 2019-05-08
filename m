Return-Path: <SRS0=sgLz=TL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4068EC04AB3
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 13:10:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D87DC2173B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 13:10:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ungleich.ch header.i=@ungleich.ch header.b="GOzD23GS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D87DC2173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1074170f;
	Sat, 11 May 2019 13:10:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id baa3939c
 for <wireguard@lists.zx2c4.com>; Wed, 8 May 2019 09:18:55 +0000 (UTC)
Received: from smtp.ungleich.ch (mx.ungleich.ch [185.203.112.16])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1190fc60
 for <wireguard@lists.zx2c4.com>; Wed, 8 May 2019 09:18:53 +0000 (UTC)
Received: from nico.schottelius.org (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id F312D235A1;
 Wed,  8 May 2019 11:18:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1557307131; bh=RfGPWcCPLGI9M1L6dKZO+2eO1+KPe6OhcR9lt3v7WVQ=;
 h=References:From:To:Cc:Subject:In-reply-to:Date:From;
 b=GOzD23GSNS2cnMMUDKWW3xAkyP34N2H6FT+/1E1DXcYoxM289bThKcO6520s53XZO
 qkTgGfWAP9ScZGVE2ajaiIU3KyUIlblOz10LO2y/GMUbxvcVbJY7VBolufw+UokW4X
 bIO3aAAvRC5z6obBACq82PuzIRKWWdz4R+omHs+Q=
Received: by nico.schottelius.org (Postfix, from userid 1000)
 id E0FD91A011B2; Wed,  8 May 2019 11:18:50 +0200 (CEST)
References: <CAFWLA-XbDKtYHib8G2ujk7E+fsuPco9uX9NvPsu35Dd_HxVGyA@mail.gmail.com>
 <87pnovti6t.fsf@line.ungleich.ch>
 <CAFWLA-WB4hv_Y=0gnnQ=3UeJ1av0GQWg1=DQ+jMZfyuCBnJUbg@mail.gmail.com>
User-agent: mu4e 1.0; emacs 26.1
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Will Tisdale <will@z3n.uk>
Subject: Re: Request to change IPv4 preference - mobile apps
In-reply-to: <CAFWLA-WB4hv_Y=0gnnQ=3UeJ1av0GQWg1=DQ+jMZfyuCBnJUbg@mail.gmail.com>
Date: Wed, 08 May 2019 11:18:50 +0200
Message-ID: <87k1f1tibp.fsf@line.ungleich.ch>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 11 May 2019 15:10:35 +0200
Cc: wireguard@lists.zx2c4.com
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

CkhleSBXaWxsLAoKZXZlbiB0aG91Z2ggSSBkbyBwcmVmZXIgSVB2NiwgdGhlIGFwcHJvYWNoIHRo
YXQgeW91IGRlc2NyaWJlIGhhcyBiZWVuCnNob3duIHRvIGJlIHJhdGhlciBlcnJvciBwcm9uZSBh
bmQgaXMgb25lIG9mIHRoZSByZWFzb25zLCB3aHkgcGVvcGxlCnR1cm4gb2ZmIElQdjYgYXQgdGhl
IG1vbWVudC4KClNvIGluIG15IG9waW5pb24sIHVzaW5nIGhhcHB5IGV5ZWJhbGxzIHdvdWxkIGJl
IHRoZSBwcm9wZXIgd2F5IG9mCmhhbmRsaW5nIHRoZSBtYXR0ZXIsIGFzIGl0IGdpdmVzIHVzZXJz
IHRoZSBiZXN0IGV4cGVyaWVuY2UgYW5kIGhhcwpwcm92ZW4gdG8gYmUgd29ya2luZyBmb3IgYnJv
d3NlcnMuCgpJbiB0ZXJtcyBvZiAiZmxpbmdpbmcgcGFja2V0cyI6IHRoZXJlIGlzIGF0IG1heGlt
dW0gMiBwYWNrZXRzIGluIHRoaXMKc3RhdGUsIGFzIGNhbiBiZSBzZWVuIGluIHRoZSBmb2xsb3dp
bmcgZGlhZ3JhbToKCgpjbGllbnQgLS0tLS0+IFt2Nl0gLS0tLS0+IHNlcnZlcgogICAgICAgLS0t
LS0+IFt2NF0gLS0tLS0+CgpjbGllbnQgPC0tLS0tIFt2Nl0gPC0tLS0tIHNlcnZlcgogICAgICAg
PC0tLS0tIFt2NF0gPC0tLS0tCgrOpGhlbiB0aGUgY2xpZW50IGNvbnRpbnVlcyB0byB1c2UgZWl0
aGVyIG9mIGJvdGggcHJvdG9jb2xzLCBsZXQncyBzYXkKaXB2NiB3YXMgZmFzdGVyIGluIGFuc3dl
cmluZzoKCmNsaWVudCAtLS0tLT4gW3Y2XSAtLS0tLT4gc2VydmVyCmNsaWVudCA8LS0tLS0gW3Y2
XSA8LS0tLS0gc2VydmVyCi4uLgoKSSBkb24ndCB0aGluayB0aGlzIGFueSByZWFsaXN0aWMgcHJv
YmxlbSwgd2UgYXJlIHRhbGtpbmcgYWJvdXQgYSBmZXcKYnl0ZXMgcGVyIHNlc3Npb24gLyByZWNv
bm5lY3QsIG5vdCBhIGdlbmVyaWMgb3ZlcmhlYWQuCgpCZXN0LAoKTmljbwoKCldpbGwgVGlzZGFs
ZSA8d2lsbEB6M24udWs+IHdyaXRlczoKCj4gSGkgTmljbywKPgo+IE5vdCBzdXJlIGhvdyB0aGF0
IHdvdWxkIHdvcmsgd2l0aCBXaXJlR3VhcmQgYmVpbmcgYSBzdGF0ZWxlc3MgcHJvdG9jb2wuCj4g
SXQgYWxzbyBzb3VuZHMgYSBiaXQgcmFjZXkgZ2l2ZW4gdGhhdCBib3RoIHY0IGFuZCB2NiBhZGRy
ZXNzZXMgd291bGQgYmUKPiBmbGluZ2luZyBwYWNrZXRzIGF0IGVzc2VudGlhbGx5IHRoZSBzYW1l
IGVuZHBvaW50Lgo+Cj4gSSB0aGluayB0aGUg4oCYcHJvcGVy4oCZIHdheSBpcyB0byB1c2UgdGhl
IGFkZHJlc3MgcmV0dXJuZWQgaW4gdGhlIEFBQUEgcmVjb3JkCj4gaWYgb25lIGV4aXN0cy4gSWYg
cGVvcGxl4oCZcyBzZXR1cCBpcyBzbyBicm9rZW4gdGhhdCBpdCBiZWNvbWVzIGFuIGlzc3VlLAo+
IHRoZXkKPiB3aWxsIGxpa2VseSBoYXZlIHdvcnNlIGlzc3VlcyB0aGFuIFdHIG5vdCB3b3JraW5n
LiA6KQo+Cj4gUHJlZmVycmluZyB2NCBkb2VzIHdlaXJkIHRoaW5ncyBsaWtlIFdHIHVzaW5nIERO
UzY0IGFkZHJlc3NlcyBvdmVyIHJlYWwKPiB2NiBhZGRyZXNzZXMgdG9vIC0gYW5kIHVzaW5nIE5B
VDY0IGluc3RlYWQgb2YgbmF0aXZlIHY2IGlzIHJlYWxseSBicm9rZW4KPiBiZWhhdmlvdXIuCj4K
Pgo+IENoZWVycywKPgo+Cj4gLVdpbGwKPgo+IE9uIE1vbiwgNiBNYXkgMjAxOSBhdCAyMTo1Nywg
TmljbyBTY2hvdHRlbGl1cyA8bmljby5zY2hvdHRlbGl1c0B1bmdsZWljaC5jaD4KPiB3cm90ZToK
Pgo+Pgo+PiBIZXkgV2lsbCwKPj4KPj4gSSB0aGluayB0aGUgInByb3BlciIgd2F5IHRvIGhhbmRs
ZSB0aGlzIGlzIGJ5IHVzaW5nIHRoZSBoYXBweSBleWViYWxscwo+PiBhbGdvcml0aG06IHJlc29s
dmUgQUFBQSBhbmQgQSwgY29ubmVjdCB0byBib3RoLCB1c2Ugd2hhdGV2ZXIgYW5zd2Vycwo+PiBm
aXJzdC4KPj4KPj4gQmVzdCwKPj4KPj4gTmljbwo+Pgo+PiBXaWxsIFRpc2RhbGUgPHdpbGxAejNu
LnVrPiB3cml0ZXM6Cj4+Cj4+ID4gSGVsbG8sCj4+ID4KPj4gPiBJIHNlbnQgYSBtZXNzYWdlIHRv
IHRoZSBsaXN0IGFib3V0IHdlaXJkbmVzcyB3aXRoIElQdjQgYmVpbmcgcHJlZmVycmVkCj4+ID4g
b3ZlciBJUHY2IGluIHRoZSBpT1MgYXBwIGEgZmV3IGRheXMgYWdvLCBidXQgaXQgZGlkbid0IGdl
dCB0aGVyZSBmb3IKPj4gPiB3aGF0ZXZlciByZWFzb24uCj4+ID4KPj4gPiBJJ3ZlIHNpbmNlIGRv
bmUgYSBiaXQgb2YgZGlnZ2luZyB0aHJvdWdoIHRoZSBjb2RlIGFuZCBmb3VuZCB0aGF0Cj4+ID4g
cHJlZmVycmluZyBJUHY0IGlzIGludGVudGlvbmFsLCBhbmQgaXQncyBhbHNvIGltcGxlbWVudGVk
IHRoYXQgd2F5IG9uCj4+ID4gdGhlIEFuZHJvaWQgYXBwIHRvby4KPj4gPgo+PiA+IEl0IHNlZW1z
IGEgc2hhbWUgdG8gaG9iYmxlIG5hdGl2ZSBJUHY2IHN1cHBvcnQgZm9yIGV2ZXJ5b25lIGp1c3Qg
dG8KPj4gPiB3b3JrIGFyb3VuZCBzb21lIHBlb3BsZXMgbWlzY29uZmlndXJlZCBzZXR1cHMuCj4+
ID4KPj4gPiBNeSBzdWdnZXN0aW9uL3JlcXVlc3Qgd291bGQgYmUgdG8gY2hhbmdlIHRoZSBhcHBz
IHRvIHByZWZlciBJUHY2IGFzCj4+ID4gZGVmYXVsdCwgYnV0IGFkZCBhIHN3aXRjaCB0byB0aGUg
YXBwcyB0byBkaXNhYmxlIElQdjYgb3IgcHJlZmVyIElQdjQKPj4gPiBmb3IgdGhvc2Ugd2l0aCBi
cm9rZW4gc2V0dXBzLgo+PiA+Cj4+ID4gRG9lcyB0aGF0IHNlZW0gcmVhc29uYWJsZT8KPj4gPgo+
PiA+Cj4+ID4gQ2hlZXJzLAo+PiA+Cj4+ID4KPj4gPiAtV2lsbAo+PiA+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+ID4gV2lyZUd1YXJkIG1haWxpbmcg
bGlzdAo+PiA+IFdpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KPj4gPiBodHRwczovL2xpc3RzLnp4
MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo+Pgo+Pgo+PiAtLQo+PiBZb3VyIFN3
aXNzLCBPcGVuIFNvdXJjZSBhbmQgSVB2NiBWaXJ0dWFsIE1hY2hpbmUuIE5vdyBvbgo+PiB3d3cu
ZGF0YWNlbnRlcmxpZ2h0LmNoLgo+PgoKCi0tCllvdXIgU3dpc3MsIE9wZW4gU291cmNlIGFuZCBJ
UHY2IFZpcnR1YWwgTWFjaGluZS4gTm93IG9uIHd3dy5kYXRhY2VudGVybGlnaHQuY2guCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWls
aW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
