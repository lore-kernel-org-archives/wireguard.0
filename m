Return-Path: <SRS0=qbAp=VN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_ADSP_ALL,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1247C7618F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Jul 2019 22:09:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CF232173B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Jul 2019 22:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CF232173B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=higgsboson.tk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98e83f45;
	Tue, 16 Jul 2019 22:09:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb5475ec
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Jul 2019 22:09:04 +0000 (UTC)
Received: from mail.thalheim.io (mail.thalheim.io [95.216.112.61])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7b1cbdc
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Jul 2019 22:09:03 +0000 (UTC)
Received: from [172.20.129.0] (pat-131-253.wlan.net.ed.ac.uk [192.41.131.253])
 by mail.thalheim.io (Postfix) with ESMTPSA id 002183BE44B;
 Tue, 16 Jul 2019 22:09:01 +0000 (UTC)
Subject: Re: [PATCH] treewide: more portable bash shebangs
To: Jordan Glover <Golden_Miller83@protonmail.ch>
References: <ff30a296-bdb9-3b13-5fb1-636a520300c0@higgsboson.tk>
 <YKHm3E7XFkL3dPRaVjHwiURlLU4Q1SCJxWCu4j40Fd1TGco-rzr6XXAJ5I_kjb8H2X_vp5NgKz8EBBOpWqIDE8COgWd4aipFzmbiCaCtLbQ=@protonmail.ch>
From: =?UTF-8?Q?J=c3=b6rg_Thalheim?= <joerg@higgsboson.tk>
Message-ID: <c58e3e33-bf95-1154-bfe2-7b87e4e730c7@higgsboson.tk>
Date: Tue, 16 Jul 2019 23:08:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <YKHm3E7XFkL3dPRaVjHwiURlLU4Q1SCJxWCu4j40Fd1TGco-rzr6XXAJ5I_kjb8H2X_vp5NgKz8EBBOpWqIDE8COgWd4aipFzmbiCaCtLbQ=@protonmail.ch>
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

T24gMTYvMDcvMjAxOSAxOC4zMiwgSm9yZGFuIEdsb3ZlciB3cm90ZToKPiBPbiBUdWVzZGF5LCBK
dWx5IDE2LCAyMDE5IDEyOjIxIFBNLCBKw7ZyZyBUaGFsaGVpbSA8am9lcmdAaGlnZ3Nib3Nvbi50
az4gd3JvdGU6Cj4KPj4gV2hpbGUgL3Vzci9iaW4vZW52IGlzIG1vcmUgb3IgbGVzcyBhdmFpbGFi
bGUgb24gYWxsIFBPU0lYIHN5c3RlbXMKPj4gL2Jpbi9iYXNoIG1pZ2h0IG5vdCBiZS4gVGhpcyBp
cyBwYXJ0aWN1bGFyIHRoZSBjYXNlIG9uIE5peE9TIGFuZCB0aGUgQlNECj4+IGZhbWlseSAoL3Vz
ci9sb2NhbC9iaW4vYmFzaCkuIERvd25zdHJlYW0gcGFja2FnZXJzIHdvdWxkIG9mdGVuIHJld3Jp
dGUKPj4gdGhvc2Ugc2hlYmFuZ3MgYmFjayBhdXRvbWF0aWNhbGx5IGFzIHRoZXkgY2FuIHJlbHkg
b24gYWJzb2x1dGUgcGF0aHMKPj4gYnV0IGhhdmluZyBwb3J0YWJsZSBzaGViYW5ncyBpbiB0aGUg
cmVwb3NpdG9yeSBoZWxwcyB0byBydW4gdGhlIGNvZGUKPj4gd2l0aG91dCBhbnkgZnVydGhlciBt
b2RpZmljYXRpb24uCj4+Cj4gVGhlIHJlYXNvbiBhbG1vc3QgZXZlcnlvbmUgaGFyZGNvZGVzIGJh
c2ggdG8gL2Jpbi9iYXNoIGlzIHRoZSBwb3RlbnRpYWwKPiBlbnZpcm9ubWVudCBhdHRhY2sgd2hl
cmUgc29tZW9uZSBjcmVhdGUgbWFsaWNpb3VzICJiYXNoIiBhbmQgZXhwb3J0IGl0IGluIFBBVEg6
Cj4KPiBodHRwczovL2RldmVsb3Blci5hcHBsZS5jb20vbGlicmFyeS9hcmNoaXZlL2RvY3VtZW50
YXRpb24vT3BlblNvdXJjZS9Db25jZXB0dWFsL1NoZWxsU2NyaXB0aW5nL1NoZWxsU2NyaXB0U2Vj
dXJpdHkvU2hlbGxTY3JpcHRTZWN1cml0eS5odG1sCj4KPiBPYnZpb3VzbHkgd2cgc2NyaXB0cyBh
cmUgaGFuZGxpbmcgcXVpdGUgc2Vuc2l0aXZlIGRhdGEgbGlrZSBwcml2YXRlIGtleXMuLi4KPgo+
IFNlcmlvdXNseSBpZiB5b3UgZXhjZXB0IHRoYXQgZG93bnN0cmVhbSBwYWNrYWdlcnMgd291bGQg
cmV3cml0ZSBpdCBiYWNrIHRvCj4gL2Jpbi9iYXNoIHRoZW4gd2h5IHRoZSBvdGhlcnMgY2FuJ3Qg
cmV3cml0ZSBpdCB0byAvdXNyL2Jpbi9lbnYgYmFzaCByaWdodAo+IG5vdyBpZiB0aGlzIGlzIHNv
bWV0aGluZyB0aGV5IHdhbnQ/Cj4KPiBKb3JkYW4KCgpUaGlzIGFyZ3VtZW50IGRvZXMgbm90IGFw
cGx5IGhlcmUgc2luY2UgYWxsIGNvbW1hbmRzIGludGVybmFsbHkgY291bGQKYmUgcmVkaXJlY3Rl
ZCBieSBhIFBBVEggY2hhbmdlIGFzIHdlbGwgc2luY2UgdGhlIFBBVEggaXMgbm90IHNldCBpbiB0
aGUgc2NyaXB0cy4KSSBhbSBhbHNvIG5vdCBxdWl0ZSBzdXJlIHdoYXQgdGhyZWF0IG1vZGVsIGhl
cmUgaXM/ClRoZSBzY3JpcHRzIGNoYW5nZWQgaGVyZSBhcmUgbm90IGRlc2lnbmVkIHRvIHJ1biBm
cm9tIGEgQ0dJIGNvbnRleHQKYW5kIGFyZSBub3QgaGFyZGVuZWQgZm9yIHRoYXQgcHVycG9zZS4K
VGhlIGlkZWEgaXMgdGhhdCB5b3UgY2FuIHJ1biB0aGUgc2NyaXB0cyB1bm1vZGlmaWVkIGZyb20g
dGhlIHJlcG9zaXRvcnkKd2l0aG91dCBoYXZpbmcgdG8gYWx0ZXIgdGhlIGZpbGVzLCB3aGljaCBp
cyBjb252ZW5pZW50IGZvciBkZXZlbG9wbWVudCB3LnIudCB0byBnaXQuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QK
V2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL3dpcmVndWFyZAo=
