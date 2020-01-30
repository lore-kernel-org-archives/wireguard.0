Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C0DC33C9E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 09:02:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A98862082E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 09:02:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deutsche-cyberberatung.de header.i=@deutsche-cyberberatung.de header.b="kxIZTxz9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A98862082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=deutsche-cyberberatung.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 340611f9;
	Thu, 30 Jan 2020 09:02:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b97c6ea2
 for <WireGuard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 02:23:23 +0000 (UTC)
Received: from mail.deutsche-cyberberatung.de (mail.deutsche-cyberberatung.de
 [138.201.186.254])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9743044
 for <WireGuard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 02:23:22 +0000 (UTC)
Received: from authenticated-user (mail.deutsche-cyberberatung.de
 [138.201.186.254])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.deutsche-cyberberatung.de (Postfix) with ESMTPSA id BE8F43EB21;
 Thu, 30 Jan 2020 03:23:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=deutsche-cyberberatung.de; s=mail; t=1580351007;
 bh=yZKlFnaDclN7QTPxSjkurpab67wnRo7CMJHGNi3HRE4=;
 h=From:Subject:Date:References:Cc:In-Reply-To:To:From;
 b=kxIZTxz91AhfZ/ELuv3kT/WSonRWx7duQzesuIJctATmub9v3ox4UeJkzmZ7HVMqt
 owjEL93MBs7UIKAuRziv1pUdt4iw/tBd0M5AFJyrjOXYKt+j8Z30lidRbR4q3mVqV/
 jR//wNUtK0a9/Q8yQhUHh2Eh1lgA2svyMdDqV73Ux4Ayz1zkns4BCB38kMpa/U1pYE
 A1j5LrD9ZxeOxvBs3pC2ADxTOQryutkz6b2zoRbeL8g1xetIekqgze6OX0TPEn1ewo
 i3vzhzTn169Qgt7BKXTxcbny0eUl2E2Kgbm/LkMsdZmArdEjG95M6dPLt/3ljgI5iA
 TxP79Htt3nNmQ==
From: "Dr. Benjamin Flesch" <bf@deutsche-cyberberatung.de>
Mime-Version: 1.0
Subject: Re: ArchLinux wireguard install
Date: Thu, 30 Jan 2020 03:23:26 +0100
Message-Id: <FC906C5B-26A4-4FED-BB79-49E03704298E@deutsche-cyberberatung.de>
References: <6cd7ccf2c193ee3bd1db3d5870f6982084d0d0d6.camel@dreamofjapan.de>
In-Reply-To: <6cd7ccf2c193ee3bd1db3d5870f6982084d0d0d6.camel@dreamofjapan.de>
To: planung@dreamofjapan.de
X-Mailman-Approved-At: Thu, 30 Jan 2020 10:02:03 +0100
Cc: WireGuard@lists.zx2c4.com
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

SGkgRnJhbmssCgpJIGFtIGFsc28gcnVubmluZyBXaXJlR3VhcmQgb24gYXJjaC4gSSB0aGluayB0
aGVyZSBhcmUgdHdvIHJlbGV2YW50IHBhY2thZ2VzIGluIEFVUiByaWdodCBub3csIG9uZSBvZiB0
aGVtIGlzIHdpcmVndWFyZC1kYW1zLgoKSnVzdCBpbnN0YWxsIHRoZXNlIHBhY2thZ2VzIGFuZCBk
b27igJl0IGJvdGhlciB3aXRoIE5ldHdvcmtNYW5hZ2VyIC0gdXNlIHRoZSB3Zy1xdWljayBjb21t
YW5kIGxpbmUgdG9vbCB0byBzcGluIHVwIHRoZSB2cG4uIEkgaGF2ZSBjb25maWd1cmVkIGl0IHBl
cnNpc3RlbnRseSBpbiAvZXRjL3dpcmVndWFyZC8gZm9sZGVyLgoKSSB0aGluayBhZnRlciB0aGUg
ZnJlc2gga2VybmVsIHdlIGNhbiBqdXN0IGRlaW5zdGFsbCB0aGUgQVVSIHBhY2thZ2VzIGFuZCB0
aGVyZSB3b27igJl0IGJlIGFueSBwcm9ibGVtLgoKQmVzdApCZW5qYW1pbiAKClNlbnQgZnJvbSBh
IG1vYmlsZSBkZXZpY2UuCgo+IE9uIDMwLiBKYW4gMjAyMCwgYXQgMDM6MDMsIEZyYW5rIFRvcm5h
Y2sgPHBsYW51bmdAZHJlYW1vZmphcGFuLmRlPiB3cm90ZToKPiAKPiDvu79oZWxsbyBhbGwsCj4g
Cj4gSSBhcG9sb2dpemUgaW4gYWR2YW5jZSBmb3IgdGhlIHN0dXBpZCBxdWVzdGlvbiwgYnV0IEkg
YW0gdmVyeSB1bnN1cmUuCj4gSSByZWNlaXZlZCBhIHZvdWNoZXIgZm9yIGEgVlBOIHNlcnZpY2Ug
YXQgYSB0cmFkZSBmYWlyIGFuZCB3b3VsZCBsaWtlCj4gdG8gdGVzdCBpdC4gVGhlIHNlcnZpY2Ug
TXVsbHZhZCBWUE4gdXNlcyB0aGUgdGVjaG5vbG9neSBXaXJlR3VhcmQuIEFuZAo+IEkgdXNlIEFy
Y2hMaW51eC4KPiAKPiBNeSBxdWVzdGlvbiB3YXMgY3JlYXRlZCBieSB0aGUgQXJjaExpbnV4IFdp
a2kuIFRoZXJlIGl0IGFscmVhZHkgcmVmZXJzCj4gdG8gdGhlIGtlcm5lbCA1LjYsIHdoaWNoIHNo
b3VsZCBzdXBwb3J0IHRoaXMgZnVuY3Rpb24gd2l0aG91dCBhIG1vZHVsZS4KPiBOb3cgbXkgcXVl
c3Rpb24gaXMsIGlzIGl0IGJldHRlciB0byB3YWl0IGZvciB0aGlzIGtlcm5lbCBvciBqdXN0Cj4g
aW5zdGFsbCB0aGUgbW9kdWxlPyBXb3VsZCBpdCBiZSBhIHByb2JsZW0gaWYgSSBmb3Jnb3QgdG8g
ZGVsZXRlIHRoZQo+IG1vZHVsZSBhZ2Fpbj8gSSBhbSB1c2luZyB0aGUgTmV0d29yayBNYW5hZ2Vy
LCB3aGF0IGRvIEkgbmVlZCB0byBiZQo+IGF3YXJlIG9mPwo+IAo+IE1hbnkgdGhhbmtzIGluIGFk
dmFuY2UgYW5kIHRoYW5rIHlvdSBmb3IgZGV2ZWxvcGluZyB0aGlzIHRvb2wuCj4gCj4gCj4gLS0g
Cj4gTWl0IGZyZXVuZGxpY2hlbiBHcsO8w59lbgo+IEZyYW5rIFRvcm5hY2sKPiAKPiAKPiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBXaHkgZG9uJ3QgeW91IHBhaXIgYGVtIHVwIGlu
IHRocmVlcz8gLVlvZ2kgQmVycmEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IFdpcmVHdWFyZCBtYWlsaW5nIGxpc3QKPiBXaXJlR3VhcmRAbGlz
dHMuengyYzQuY29tCj4gaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93
aXJlZ3VhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczov
L2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
