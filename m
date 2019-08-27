Return-Path: <SRS0=ZPcD=WX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE954C3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 17:18:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39CD3214DA
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 17:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39CD3214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22f8e66e;
	Tue, 27 Aug 2019 17:17:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c77fb02d
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 17:17:44 +0000 (UTC)
Received: from telperion.info (2600:3c01::f03c:91ff:fe96:a052
 [IPv6:2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98779442
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 17:17:44 +0000 (UTC)
Received: from [209.204.163.2] (209-204-163-2.vpn.sonic.net
 [::ffff:209.204.163.2]) (AUTH: LOGIN pallas, )
 by telperion.info with ESMTPSA
 id 000000000004837A.000000005D65665C.00004965; Tue, 27 Aug 2019 10:20:28 -0700
Subject: Re: Support of multiple endpoints to support IPv6/IPv4 protocol change
To: wireguard@lists.zx2c4.com
References: <87h86fq4ss.fsf@line.ungleich.ch>
 <915FDB2D-7452-433C-A3FE-63EF75916417@pallas.us>
From: Derrick Lyndon Pallas <derrick@pallas.us>
Message-ID: <a5dd2f52-86ba-8bad-4594-af4f821907eb@pallas.us>
Date: Tue, 27 Aug 2019 10:17:41 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <915FDB2D-7452-433C-A3FE-63EF75916417@pallas.us>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

V291bGQgaXQgbWFrZSBzZW5zZSB0byBkbyBzb21ldGhpbmcgbGlrZSBIYXBweSBFeWViYWxscyAo
UkZDIDgzMDUpIApleHRlbmRlZCBmb3IgVURQPyBJZiBXaXJlR3VhcmQgd2VyZSB0byBpbXBsZW1l
bnQgdGhlIGVxdWl2YWxlbnQgb2YgCnNlY3Rpb24gNSAoYnV0IGtlZXAgdGhlIGxpc3Qgb2YgYWRk
cmVzc2VzIGFyb3VuZCBhZnRlciBhIGhhbmRzaGFrZSBmb3IgCnByb2Jpbmcgb3IgZmFpbG92ZXIp
IHRoZW4gdXNlcmxhbmQgY291bGQgZWFzaWx5IGhhbmRsZSBzZWN0aW9ucyAzIGFuZCA0LiAKfkRl
cnJpY2sKCgpPbiA4LzI1LzE5IDEyOjIzIFBNLCBEZXJyaWNrIEx5bmRvbiBQYWxsYXMgd3JvdGU6
Cj4gSSByZWNlbnRseSByYW4gaW50byB0aGlzIGlzc3VlLiBNeSBzb2x1dGlvbiB3YXMgdG8gc29y
dCBhIGxpc3Qgb2YgZW5kcG9pbnQgYWRkcmVzc2VzIChub3QgZG9tYWlucykgYnkgcHJpb3JpdHkg
YW5kIGZpcnN0IGNoZWNrIHdoZXRoZXIgdGhlIGNsaWVudCBoYWQgYSByb3V0ZSB0byBhbiBhZGRy
ZXNzIGJlZm9yZSBwaWNraW5nIGl0LiBJdCB3b3VsZCBiZSBuaWNlIGlmIFdpcmVndWFyZCBrZXB0
IGEgbGlzdCBvZiBmYWxsYmFjayBhZGRyZXNzZXMgaW4gY2FzZSB0aGUgY3VycmVudGx5IGFjdGl2
ZSBhZGRyZXNzIHN0b3BwZWQgd29ya2luZywgYnV0IHRoaXMgY2FuIGJlIGFjaGlldmVkIGJ5IHRv
b2xpbmcgdG9kYXkuCj4KPiB+RGVycmljayDigKIgaVBob25lCj4KPj4gT24gQXVnIDE3LCAyMDE5
LCBhdCA2OjUwIEFNLCBOaWNvIFNjaG90dGVsaXVzIDxuaWNvLnNjaG90dGVsaXVzQHVuZ2xlaWNo
LmNoPiB3cm90ZToKPj4KPj4KPj4gSGVsbG8sCj4+Cj4+IFRMO0RSCj4+IEhvdyBkaWZmaWN1bHQg
aXMgaXQgdG8gYWRkIHN1cHBvcnQgZm9yIG11bHRpcGxlIGVuZHBvaW50cyBpbiB3aXJlZ3VhcmQ/
Cj4+Cj4+IE15IHByb2JsZW0gaXMgdGhhdCBzb21ldGltZXMgd2UgbmVlZCB0byBjb25uZWN0IHRv
IHRoZSBWUE4gc2VydmVyCj4+IHZpYSBJUHY0LCBzb21ldGltZXMgdmlhIElQdjYgYW5kIHRoZSBv
dGhlciBwcm90b2NvbCB3b24ndCB3b3JrIGFueW1vcmUuCj4+Cj4+Cj4+IExvbmcgc3Rvcnk6Cj4+
IFdlIGFyZSBhIGNsb3VkIHByb3ZpZGVyIG9mZmVyaW5nIGZyZWUgSVB2NiBWUE5zIHdpdGggVk1z
LCB0byBlbmFibGUKPj4gY3VzdG9tZXJzIHRvIGhhdmUgSVB2NiBhbnl3aGVyZS4gSW4gc29tZSBz
aXR1YXRpb25zIGN1c3RvbWVycyBhcmUKPj4gY29uZnVzZWQsIGJlY2F1c2UgdGhlaXIgbmV0d29y
ayBkb2Vzbid0IHdvcmsgYW55bW9yZSB3aGlsZSB3aXJlZ3VhcmQgaXMKPj4gYWN0aXZlIG9yIHRo
ZSB0dW5uZWwgZG9lc24ndCB3b3JrIGluIHNvbWUgbmV0d29ya3MuIEkgd2lsbCBkZXNjcmliZSBz
b21lCj4+IHNpdHVhdGlvbnMgdGhhdCB3ZSBleHBlcmllbmNlZCBhbmQgaG93IHdlIHdvcmsgYXJv
dW5kIGl0IGF0IHRoZSBtb21lbnQuCj4+Cj4+Cj4+IFN0b3J5IDE6IHVzaW5nIFZQTiBpbiBWUE4K
Pj4gU29tZSBvZiBvdXIgY3VzdG9tZXJzIGhhdmUgYW4gSVB2NiB0dW5uZWwgdG8gcHJvdmlkZSBh
IC80OCB0byB0aGVpcgo+PiBuZXR3b3JrLiBUaGV5IHVzdWFsbHkgdXNlIGEgY291cGxlIG9mIC82
NHMgdG8gc2VwYXJhdGUgdGhlaXIgaW50ZXJuYWwKPj4gbmV0d29ya3MuIFNvbWUgb2YgdGhlc2Ug
Y3VzdG9tZXJzIGFsc28gaGF2ZSBhIFZQTiB0byB0aGVpciBlbmQgZGV2aWNlCj4+IChsaWtlIGEg
bm90ZWJvb2spIHdpdGggYW5vdGhlciAvNDggcm91dGVkIHRvIGl0LiBJbiB0aGlzIHNpdHVhdGlv
biwgdGhleQo+PiBhcmUgdW5hYmxlIHRvIHJlYWNoIHRoZSBWUE4gc2VydmVyIG9yIGxvY2FsIGNs
aWVudHMgaWYgdGhleSBkb24ndAo+PiBleHBsaWNpdGx5IGNoYW5nZSB0aGVpciBjb25maWd1cmF0
aW9uIHRvIHJlYWNoIHRoZSBWUE4gc2VydmVyIHZpYSBJUHY0Cj4+IGluc3RlYWQgb2YgSVB2NjoK
Pj4KPj4gV2l0aCBhIHN0YW5kYXJkIGNvbmZpZywgdGhlIEROUyBuYW1lIG9mIHRoZSB0dW5uZWwg
ZW5kcG9pbnQgaW4KPj4gaW4gd2cwLmNvbmYsIG5vdCBmaXhlZCB0byBJUHY0L0lQdjYsIHdlIGhh
ZCB0aGUgZm9sbG93aW5nIHJlcG9ydDoKPj4KPj4gSW4gdGhpcyBjYXNlIGlmIHRoZSBub3RlYm9v
ayBjb25uZWN0cyB2aWEgSVB2NiB0byB0aGUgVlBOIHNlcnZlciwKPj4gaXQgZWZmZWN0aXZlbHkg
Y29ubmVjdHMgdG8gdGhlIFZQTiBzZXJ2ZXIgdGhyb3VnaCB0aGUgVlBOLiBXZSBoYWQKPj4gcmVw
b3J0cyB0aGF0IGluIHRoaXMgc2l0dWF0aW9uIHRoZSBub3RlYm9vayBjYW4gZWl0aGVyIG5vdCBl
c3RhYmxpc2ggdGhlCj4+IFZQTiB0dW5uZWwgb3IgaXMgdW5hYmxlIHRvIHJlYWNoIGxvY2FsIGRl
dmljZXMKPj4KPj4gV29ya2Fyb3VuZCBmcm9tIHNvbWUgY3VzdG9tZXJzOiBoYXJkIGNvZGUgdGhl
IElQdjQgYWRkcmVzcyBhcyBhbiBlbmRwb2ludAo+Pgo+PiBTdG9yeSAyOiBDaGFuZ2UgZnJvbSBJ
UHY0IG9ubHkgdG8gSVB2NiBvbmx5IG5ldHdvcmtzCj4+Cj4+IFdlIGhhdmUgcmVwb3J0cyBmcm9t
IGNsaWVudHMgdGhhdCB0aGUgVlBOIGlzIG5vdCBlc3RhYmxpc2hlZCBhZ2FpbiwgaWYKPj4gdGhl
eSBzd2l0Y2ggZnJvbSBhbiBJUHY0IG9ubHkgbmV0d29yayB0byBhbiBJUHY2IG9ubHkgbmV0d29y
ayBhbmQgdmljZQo+PiB2ZXJzYS4gSSBhc3N1bWUgdGhpcyBpcyBkdWUgdG8gd2lyZWd1YXJkIHJl
c29sdmluZyB0aGUgYWRkcmVzcyBhdAo+PiBzdGFydHVwIGFuZCBuZXZlciByZS1yZXNvbHZpbmcg
YW5kL29yIG5vdCBzdG9yaW5nIGFsbCBETlMgcmVzdWx0cyAoQSBhbmQKPj4gQUFBQSBhbnN3ZXJz
KS4KPj4KPj4gV29ya2Fyb3VuZCBmcm9tIHNvbWUgY3VzdG9tZXJzOiByZXN0YXJ0IHdpcmVndWFy
ZCB3aGVuIGNoYW5naW5nCj4+IHVuZGVybHlpbmcgcHJvdG9jb2wgbmV0d29yawo+Pgo+Pgo+PiBT
dG9yeSAzOiBDb21iaW5hdGlvbiBvZiBhYm92ZQo+PiBTb21lIG9mIG91ciBjbGllbnRzIGhhcmQg
Y29kZWQgdGhlIElQdjQgYWRkcmVzcyBvZiB0aGUgdHVubmVsIGVuZHBvaW50Cj4+IGluIHRoZWly
IHdnMC5jb25mIHRvIGF2b2lkIHRoZSBwcm9ibGVtIGZyb20gc3RvcnkgMS4gSG93ZXZlciB0aGlz
IGJyZWFrcwo+PiB0aGVpciBJbnRlcm5ldCB3aGVuIHN3aXRjaGluZyB0byBJUHY2IG9ubHkgbmV0
d29ya3MuIEluIHRoaXMgY2FzZSB0aGUKPj4gZW5kcG9pbnQgaXMgZml4ZWQgdG8gSVB2NCwgYnV0
IHRoZXkgZG9uJ3QgaGF2ZSBhbnkgSVB2NCBjb25uZWN0aXZpdHkuCj4+Cj4+IFdvcmthcm91bmQg
ZnJvbSBzb21lIGN1c3RvbWVyczogcmVjb25maWd1cmUgd2lyZWd1YXJkIHRvIHVzZSBoYXJkY29k
ZWQKPj4gSVB2NiBvciBJUHY0IG9ubHkgZW5kcG9pbnQuCj4+Cj4+Cj4+IC0tCj4+IFlvdXIgU3dp
c3MsIE9wZW4gU291cmNlIGFuZCBJUHY2IFZpcnR1YWwgTWFjaGluZS4gTm93IG9uIHd3dy5kYXRh
Y2VudGVybGlnaHQuY2guCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4+IFdpcmVHdWFyZCBtYWlsaW5nIGxpc3QKPj4gV2lyZUd1YXJkQGxpc3RzLnp4
MmM0LmNvbQo+PiBodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVn
dWFyZAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4g
V2lyZUd1YXJkIG1haWxpbmcgbGlzdAo+IFdpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KPiBodHRw
czovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBs
aXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFp
bG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
