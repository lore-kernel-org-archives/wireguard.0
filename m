Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_ADSP_ALL,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76EE2C7618F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 18:39:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A92A21743
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 18:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A92A21743
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=higgsboson.tk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5666e367;
	Wed, 17 Jul 2019 18:39:37 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4905756
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 18:39:33 +0000 (UTC)
Received: from mail.thalheim.io (mail.thalheim.io [95.216.112.61])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 110afe2e
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jul 2019 18:39:32 +0000 (UTC)
Received: from [172.20.130.141] (pat-131-255.wlan.net.ed.ac.uk
 [192.41.131.255])
 by mail.thalheim.io (Postfix) with ESMTPSA id 942EF398E72;
 Wed, 17 Jul 2019 18:39:28 +0000 (UTC)
Subject: Re: [PATCH] treewide: more portable bash shebangs
To: Jordan Glover <Golden_Miller83@protonmail.ch>
References: <ff30a296-bdb9-3b13-5fb1-636a520300c0@higgsboson.tk>
 <YKHm3E7XFkL3dPRaVjHwiURlLU4Q1SCJxWCu4j40Fd1TGco-rzr6XXAJ5I_kjb8H2X_vp5NgKz8EBBOpWqIDE8COgWd4aipFzmbiCaCtLbQ=@protonmail.ch>
 <c58e3e33-bf95-1154-bfe2-7b87e4e730c7@higgsboson.tk>
 <EELepAK6aanjfQM-_vvGuS0aAwISwGlhv5Gq2DPFexSRvZ7mFpTMbe4-hNPhtBxkRVmSJPHpojmb6KeRgRIv9sbEwajUSwnfYVkawwMc9DU=@protonmail.ch>
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@higgsboson.tk>
Message-ID: <55df869d-87e2-6d55-6e70-8b110cad2086@higgsboson.tk>
Date: Wed, 17 Jul 2019 19:39:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <EELepAK6aanjfQM-_vvGuS0aAwISwGlhv5Gq2DPFexSRvZ7mFpTMbe4-hNPhtBxkRVmSJPHpojmb6KeRgRIv9sbEwajUSwnfYVkawwMc9DU=@protonmail.ch>
Content-Language: en-US
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=joerg@higgsboson.tk smtp.mailfrom=joerg@higgsboson.tk
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

Ck9uIDE3LzA3LzIwMTkgMTguMzIsIEpvcmRhbiBHbG92ZXIgd3JvdGU6Cj4gT24gVHVlc2RheSwg
SnVseSAxNiwgMjAxOSAxMDowOCBQTSwgSsO2cmcgVGhhbGhlaW0gPGpvZXJnQGhpZ2dzYm9zb24u
dGs+IHdyb3RlOgo+Cj4+IE9uIDE2LzA3LzIwMTkgMTguMzIsIEpvcmRhbiBHbG92ZXIgd3JvdGU6
Cj4+Cj4+PiBPbiBUdWVzZGF5LCBKdWx5IDE2LCAyMDE5IDEyOjIxIFBNLCBKw7ZyZyBUaGFsaGVp
bSBqb2VyZ0BoaWdnc2Jvc29uLnRrIHdyb3RlOgo+Pj4KPj4+PiBXaGlsZSAvdXNyL2Jpbi9lbnYg
aXMgbW9yZSBvciBsZXNzIGF2YWlsYWJsZSBvbiBhbGwgUE9TSVggc3lzdGVtcwo+Pj4+IC9iaW4v
YmFzaCBtaWdodCBub3QgYmUuIFRoaXMgaXMgcGFydGljdWxhciB0aGUgY2FzZSBvbiBOaXhPUyBh
bmQgdGhlIEJTRAo+Pj4+IGZhbWlseSAoL3Vzci9sb2NhbC9iaW4vYmFzaCkuIERvd25zdHJlYW0g
cGFja2FnZXJzIHdvdWxkIG9mdGVuIHJld3JpdGUKPj4+PiB0aG9zZSBzaGViYW5ncyBiYWNrIGF1
dG9tYXRpY2FsbHkgYXMgdGhleSBjYW4gcmVseSBvbiBhYnNvbHV0ZSBwYXRocwo+Pj4+IGJ1dCBo
YXZpbmcgcG9ydGFibGUgc2hlYmFuZ3MgaW4gdGhlIHJlcG9zaXRvcnkgaGVscHMgdG8gcnVuIHRo
ZSBjb2RlCj4+Pj4gd2l0aG91dCBhbnkgZnVydGhlciBtb2RpZmljYXRpb24uCj4+PiBUaGUgcmVh
c29uIGFsbW9zdCBldmVyeW9uZSBoYXJkY29kZXMgYmFzaCB0byAvYmluL2Jhc2ggaXMgdGhlIHBv
dGVudGlhbAo+Pj4gZW52aXJvbm1lbnQgYXR0YWNrIHdoZXJlIHNvbWVvbmUgY3JlYXRlIG1hbGlj
aW91cyAiYmFzaCIgYW5kIGV4cG9ydCBpdCBpbiBQQVRIOgo+Pj4gaHR0cHM6Ly9kZXZlbG9wZXIu
YXBwbGUuY29tL2xpYnJhcnkvYXJjaGl2ZS9kb2N1bWVudGF0aW9uL09wZW5Tb3VyY2UvQ29uY2Vw
dHVhbC9TaGVsbFNjcmlwdGluZy9TaGVsbFNjcmlwdFNlY3VyaXR5L1NoZWxsU2NyaXB0U2VjdXJp
dHkuaHRtbAo+Pj4gT2J2aW91c2x5IHdnIHNjcmlwdHMgYXJlIGhhbmRsaW5nIHF1aXRlIHNlbnNp
dGl2ZSBkYXRhIGxpa2UgcHJpdmF0ZSBrZXlzLi4uCj4+PiBTZXJpb3VzbHkgaWYgeW91IGV4Y2Vw
dCB0aGF0IGRvd25zdHJlYW0gcGFja2FnZXJzIHdvdWxkIHJld3JpdGUgaXQgYmFjayB0bwo+Pj4g
L2Jpbi9iYXNoIHRoZW4gd2h5IHRoZSBvdGhlcnMgY2FuJ3QgcmV3cml0ZSBpdCB0byAvdXNyL2Jp
bi9lbnYgYmFzaCByaWdodAo+Pj4gbm93IGlmIHRoaXMgaXMgc29tZXRoaW5nIHRoZXkgd2FudD8K
Pj4+IEpvcmRhbgo+PiBUaGlzIGFyZ3VtZW50IGRvZXMgbm90IGFwcGx5IGhlcmUgc2luY2UgYWxs
IGNvbW1hbmRzIGludGVybmFsbHkgY291bGQKPj4gYmUgcmVkaXJlY3RlZCBieSBhIFBBVEggY2hh
bmdlIGFzIHdlbGwgc2luY2UgdGhlIFBBVEggaXMgbm90IHNldCBpbiB0aGUgc2NyaXB0cy4KPiBZ
ZXAsIHRoYXQncyBzb21ldGhpbmcgdG8gYWN0dWFsbHkgZml4IGFzIHlvdSB3b24ndCBmaXggdGhp
bmdzIGJ5IG1ha2luZyBpdCB3b3JzZS4KSXQgZG9lcyBub3QgbWFrZSBhbnl0aGluZyB3b3JzZS4g
WW91ciB0aHJlYXQgbW9kZWwgaXMgdW5yZWFzb25hYmxlIGFuZCBvdXQgb2Ygc2NvcGUKb2Ygd2hh
dCB0aGUgc2NyaXB0cyBhcmUgaW50ZW5kZWQgdG8gZ3VhcmFudGVlLgpUaGVyZSBhcmUgdG9uZXMg
b2Ygb3RoZXIgZW52aXJvbm1lbnQgdmFyaWFibGVzIGxpa2UgTERfUFJFTE9BRCBvciBMRF9MSUJS
QVJZX1BBVEgKCnRoYXQgd291bGQgYWxzbyBuZWVkIHRvIGJlIHNhbml0aXplZCBzbyB0aGV5IGNv
dWxkIHJ1biBpbiBhbiB1bnRydXN0ZWQgZW52aXJvbm1lbnQuCgpIYXJkLWNvZGluZyBhbGwgdGhl
c2Ugd291bGQgbWFrZSB0aGUgc2NyaXB0cyB1bnBvcnRhYmxlIGZvciBubyBnb29kIHJlYXNvbi4K
Cj4KPj4gSSBhbSBhbHNvIG5vdCBxdWl0ZSBzdXJlIHdoYXQgdGhyZWF0IG1vZGVsIGhlcmUgaXM/
Cj4+IFRoZSBzY3JpcHRzIGNoYW5nZWQgaGVyZSBhcmUgbm90IGRlc2lnbmVkIHRvIHJ1biBmcm9t
IGEgQ0dJIGNvbnRleHQKPj4gYW5kIGFyZSBub3QgaGFyZGVuZWQgZm9yIHRoYXQgcHVycG9zZS4K
Pj4gVGhlIGlkZWEgaXMgdGhhdCB5b3UgY2FuIHJ1biB0aGUgc2NyaXB0cyB1bm1vZGlmaWVkIGZy
b20gdGhlIHJlcG9zaXRvcnkKPj4gd2l0aG91dCBoYXZpbmcgdG8gYWx0ZXIgdGhlIGZpbGVzLCB3
aGljaCBpcyBjb252ZW5pZW50IGZvciBkZXZlbG9wbWVudCB3LnIudCB0byBnaXQuCj4gVGhlbiBz
aW1wbHkgcnVuICJiYXNoIDxzY3JpcHQuc2g+IiBhbmQgY2FsbCBpdCBhIGRheS4KCkkgY2FtZSBh
Y3Jvc3MgdGhpcyBiZWNhdXNlIHdpcmVndWFyZCB3YXMgdXNlZCBpbiBhIHRoaXJkLXBhcnR5IGJ1
aWxkIHN5c3RlbSBub3QgY29udHJvbGxlZCBieSBtZSwKc28gdGhpcyBpcyBub3QgYSBnZW5lcmFs
IHNvbHV0aW9uLgoKCj4KPiBKb3JkYW4KPgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3Rz
Lnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVn
dWFyZAo=
