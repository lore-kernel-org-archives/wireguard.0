Return-Path: <SRS0=D7NO=23=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21445C33C8C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Jan 2020 20:49:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67CA52146E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Jan 2020 20:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67CA52146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=53c70r.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55fe7c01;
	Mon, 6 Jan 2020 20:49:02 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c41a68e7
 for <wireguard@lists.zx2c4.com>; Mon, 6 Jan 2020 20:48:59 +0000 (UTC)
Received: from 53c70r.de (53c70r.de [IPv6:2a01:4f8:c2c:5e22::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b1dac06
 for <wireguard@lists.zx2c4.com>; Mon, 6 Jan 2020 20:48:59 +0000 (UTC)
Received: from localhost.localdomain (primer.uwu [10.11.0.2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by 53c70r.de (Postfix) with ESMTPSA id 76F571057102
 for <wireguard@lists.zx2c4.com>; Mon,  6 Jan 2020 21:48:58 +0100 (CET)
Subject: Re: dkms module build fails since at least 20191226 on CentOS
From: Silvan Nagl <mail@53c70r.de>
To: wireguard@lists.zx2c4.com
References: <c9aa2698-b245-31ef-3b47-956f2b9d2d52@53c70r.de>
Autocrypt: addr=mail@53c70r.de; keydata=
 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
Message-ID: <fccf5fd0-4b23-1893-ea55-c49992fe3909@53c70r.de>
Date: Mon, 6 Jan 2020 21:48:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <c9aa2698-b245-31ef-3b47-956f2b9d2d52@53c70r.de>
Content-Language: en-US
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

U2FtZSBwcm9ibGVtIHBlcnNpc3RzIHVuZGVyIENlbnRPUyBpbiBuZXdlc3QgdmVyc2lvbiAwLjAu
MjAyMDAxMDUuCgpPbiAxLzUvMjAgMzoxNyBQTSwgU2lsdmFuIE5hZ2wgd3JvdGU6Cj4gSGkgYWdh
aW4sCj4KPiBzaW5jZSB0aGUgbGFzdCBXaXJlR3VhcmQgdXBncmFkZSAod2lyZWd1YXJkLTAuMC4y
MDE5MTIyNikgdGhlIGRrbXMKPiBtb2R1bGUgZG9lcyBub3QgYnVpbGQgYW55bW9yZS4gSSBqdXN0
IG5vdGljZWQgdGhhdCBteSBDZW50T1MgYm94IHN0aWxsCj4gcnVucyBvbiAwLjAuMjAxOTEyMDYg
c28gaXQgYXBwZWFyZWQgdG8gd29yayBhdCBmaXJzIGdsYW5jZSBidXQgYWN0dWFsbHkKPiBpdCBq
dXN0IHVzZXMgdGhlIG9sZCBka21zIG1vZHVsZSB3aGljaCB3YXMgbm90IG92ZXJ3cml0dGVuIGJ5
IHRoZSBuZXcKPiBpbnN0YWxsYXRpb24gYmVjYXVzZSBpdCBmYWlsZWQgdG8gYnVpbGQuCj4KPiBI
ZXJlIGlzIG1ha2UgYWxsIG91dHB1dDoKPgo+IFtyb290QHN0YXRpYyB3aXJlZ3VhcmQtMC4wLjIw
MTkxMjI2XSMgbWFrZSBhbGwKPiDCoCBDQyBbTV3CoCAvdXNyL3NyYy93aXJlZ3VhcmQtMC4wLjIw
MTkxMjI2L21haW4ubwo+IMKgIENDIFtNXcKgIC91c3Ivc3JjL3dpcmVndWFyZC0wLjAuMjAxOTEy
MjYvbm9pc2Uubwo+IMKgIENDIFtNXcKgIC91c3Ivc3JjL3dpcmVndWFyZC0wLjAuMjAxOTEyMjYv
ZGV2aWNlLm8KPiDCoCBDQyBbTV3CoCAvdXNyL3NyYy93aXJlZ3VhcmQtMC4wLjIwMTkxMjI2L3Bl
ZXIubwo+IMKgIENDIFtNXcKgIC91c3Ivc3JjL3dpcmVndWFyZC0wLjAuMjAxOTEyMjYvdGltZXJz
Lm8KPiDCoCBDQyBbTV3CoCAvdXNyL3NyYy93aXJlZ3VhcmQtMC4wLjIwMTkxMjI2L3F1ZXVlaW5n
Lm8KPiDCoCBDQyBbTV3CoCAvdXNyL3NyYy93aXJlZ3VhcmQtMC4wLjIwMTkxMjI2L3NlbmQubwo+
IMKgIENDIFtNXcKgIC91c3Ivc3JjL3dpcmVndWFyZC0wLjAuMjAxOTEyMjYvcmVjZWl2ZS5vCj4g
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vaW5jbHVkZS9saW51eC9pbml0Lmg6NSwKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcm9tIC91c3Ivc3JjL3dpcmVndWFyZC0wLjAuMjAx
OTEyMjYvY29tcGF0L2NvbXBhdC5oOjUwLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGZyb20gPGNvbW1hbmQtbGluZT46Cj4gL3Vzci9zcmMvd2lyZWd1YXJkLTAuMC4yMDE5MTIy
Ni9yZWNlaXZlLmM6IEluIGZ1bmN0aW9uIOKAmHdnX3BhY2tldF9yZWNlaXZl4oCZOgo+IC91c3Iv
c3JjL3dpcmVndWFyZC0wLjAuMjAxOTEyMjYvcmVjZWl2ZS5jOjU3ODoxNzogZXJyb3I6IGltcGxp
Y2l0Cj4gZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYcm5nX2lzX2luaXRpYWxpemVk4oCZOyBk
aWQgeW91IG1lYW4KPiDigJh6b25lX2lzX2luaXRpYWxpemVk4oCZPyBbLVdlcnJvcj1pbXBsaWNp
dC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiDCoMKgwqDCoMKgwqAgdW5saWtlbHkoIXJuZ19pc19p
bml0aWFsaXplZCgpKSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+
fn5+fn5+fn5+fn5+fgo+IC4vaW5jbHVkZS9saW51eC9jb21waWxlci5oOjc3OjQyOiBub3RlOiBp
biBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmHVubGlrZWx54oCZCj4gwqAjIGRlZmluZSB1bmxpa2Vs
eSh4KSBfX2J1aWx0aW5fZXhwZWN0KCEhKHgpLCAwKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgXgo+IGNjMTogc29tZSB3YXJuaW5ncyBiZWluZyB0cmVhdGVkIGFzIGVycm9ycwo+IG1ha2Vb
Ml06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWlsZDozMTY6Cj4gL3Vzci9zcmMvd2lyZWd1YXJk
LTAuMC4yMDE5MTIyNi9yZWNlaXZlLm9dIEVycm9yIDEKPiBtYWtlWzFdOiAqKiogW01ha2VmaWxl
OjE1Mjg6IF9tb2R1bGVfL3Vzci9zcmMvd2lyZWd1YXJkLTAuMC4yMDE5MTIyNl0KPiBFcnJvciAy
Cj4gbWFrZTogKioqIFtNYWtlZmlsZTozODogbW9kdWxlXSBFcnJvciAyCj4KPiBHcmVldGluZ3Ms
Cj4KPiBTaWx2YW4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gV2lyZUd1YXJkIG1haWxpbmcgbGlzdAo+IFdpcmVHdWFyZEBsaXN0cy56eDJjNC5j
b20KPiBodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQg
bWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJj
NC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
