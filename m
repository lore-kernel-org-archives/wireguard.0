Return-Path: <SRS0=oups=22=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0E2C33C8C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Jan 2020 14:17:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B95732077B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Jan 2020 14:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B95732077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=53c70r.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3421a5c;
	Sun, 5 Jan 2020 14:17:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b4fdb5e
 for <wireguard@lists.zx2c4.com>; Sun, 5 Jan 2020 14:17:53 +0000 (UTC)
Received: from 53c70r.de (53c70r.de [IPv6:2a01:4f8:c2c:5e22::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81bf998d
 for <wireguard@lists.zx2c4.com>; Sun, 5 Jan 2020 14:17:53 +0000 (UTC)
Received: from localhost.localdomain (primer.uwu [10.11.0.2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by 53c70r.de (Postfix) with ESMTPSA id D764F1034BBC
 for <wireguard@lists.zx2c4.com>; Sun,  5 Jan 2020 15:17:51 +0100 (CET)
To: wireguard@lists.zx2c4.com
From: Silvan Nagl <mail@53c70r.de>
Autocrypt: addr=mail@53c70r.de; keydata=
 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
Subject: dkms module build fails since at least 20191226 on CentOS
Message-ID: <c9aa2698-b245-31ef-3b47-956f2b9d2d52@53c70r.de>
Date: Sun, 5 Jan 2020 15:17:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
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

SGkgYWdhaW4sCgpzaW5jZSB0aGUgbGFzdCBXaXJlR3VhcmQgdXBncmFkZSAod2lyZWd1YXJkLTAu
MC4yMDE5MTIyNikgdGhlIGRrbXMKbW9kdWxlIGRvZXMgbm90IGJ1aWxkIGFueW1vcmUuIEkganVz
dCBub3RpY2VkIHRoYXQgbXkgQ2VudE9TIGJveCBzdGlsbApydW5zIG9uIDAuMC4yMDE5MTIwNiBz
byBpdCBhcHBlYXJlZCB0byB3b3JrIGF0IGZpcnMgZ2xhbmNlIGJ1dCBhY3R1YWxseQppdCBqdXN0
IHVzZXMgdGhlIG9sZCBka21zIG1vZHVsZSB3aGljaCB3YXMgbm90IG92ZXJ3cml0dGVuIGJ5IHRo
ZSBuZXcKaW5zdGFsbGF0aW9uIGJlY2F1c2UgaXQgZmFpbGVkIHRvIGJ1aWxkLgoKSGVyZSBpcyBt
YWtlIGFsbCBvdXRwdXQ6Cgpbcm9vdEBzdGF0aWMgd2lyZWd1YXJkLTAuMC4yMDE5MTIyNl0jIG1h
a2UgYWxsCsKgIENDIFtNXcKgIC91c3Ivc3JjL3dpcmVndWFyZC0wLjAuMjAxOTEyMjYvbWFpbi5v
CsKgIENDIFtNXcKgIC91c3Ivc3JjL3dpcmVndWFyZC0wLjAuMjAxOTEyMjYvbm9pc2UubwrCoCBD
QyBbTV3CoCAvdXNyL3NyYy93aXJlZ3VhcmQtMC4wLjIwMTkxMjI2L2RldmljZS5vCsKgIENDIFtN
XcKgIC91c3Ivc3JjL3dpcmVndWFyZC0wLjAuMjAxOTEyMjYvcGVlci5vCsKgIENDIFtNXcKgIC91
c3Ivc3JjL3dpcmVndWFyZC0wLjAuMjAxOTEyMjYvdGltZXJzLm8KwqAgQ0MgW01dwqAgL3Vzci9z
cmMvd2lyZWd1YXJkLTAuMC4yMDE5MTIyNi9xdWV1ZWluZy5vCsKgIENDIFtNXcKgIC91c3Ivc3Jj
L3dpcmVndWFyZC0wLjAuMjAxOTEyMjYvc2VuZC5vCsKgIENDIFtNXcKgIC91c3Ivc3JjL3dpcmVn
dWFyZC0wLjAuMjAxOTEyMjYvcmVjZWl2ZS5vCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2luY2x1
ZGUvbGludXgvaW5pdC5oOjUsCsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20g
L3Vzci9zcmMvd2lyZWd1YXJkLTAuMC4yMDE5MTIyNi9jb21wYXQvY29tcGF0Lmg6NTAsCsKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZyb20gPGNvbW1hbmQtbGluZT46Ci91c3Ivc3Jj
L3dpcmVndWFyZC0wLjAuMjAxOTEyMjYvcmVjZWl2ZS5jOiBJbiBmdW5jdGlvbiDigJh3Z19wYWNr
ZXRfcmVjZWl2ZeKAmToKL3Vzci9zcmMvd2lyZWd1YXJkLTAuMC4yMDE5MTIyNi9yZWNlaXZlLmM6
NTc4OjE3OiBlcnJvcjogaW1wbGljaXQKZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYcm5nX2lz
X2luaXRpYWxpemVk4oCZOyBkaWQgeW91IG1lYW4K4oCYem9uZV9pc19pbml0aWFsaXplZOKAmT8g
Wy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCsKgwqDCoMKgwqDCoCB1bmxp
a2VseSghcm5nX2lzX2luaXRpYWxpemVkKCkpKSB7CsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIF5+fn5+fn5+fn5+fn5+fn5+fgouL2luY2x1ZGUvbGludXgvY29tcGlsZXIuaDo3Nzo0
Mjogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJh1bmxpa2VseeKAmQrCoCMgZGVmaW5l
IHVubGlrZWx5KHgpIF9fYnVpbHRpbl9leHBlY3QoISEoeCksIDApCsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgXgpjYzE6IHNvbWUgd2FybmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMKbWFr
ZVsyXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjMxNjoKL3Vzci9zcmMvd2lyZWd1YXJk
LTAuMC4yMDE5MTIyNi9yZWNlaXZlLm9dIEVycm9yIDEKbWFrZVsxXTogKioqIFtNYWtlZmlsZTox
NTI4OiBfbW9kdWxlXy91c3Ivc3JjL3dpcmVndWFyZC0wLjAuMjAxOTEyMjZdCkVycm9yIDIKbWFr
ZTogKioqIFtNYWtlZmlsZTozODogbW9kdWxlXSBFcnJvciAyCgpHcmVldGluZ3MsCgpTaWx2YW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFy
ZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4
MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
