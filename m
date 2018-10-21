Return-Path: <SRS0=EM+o=NB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MISSING_HEADERS,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8321FECDE44
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Oct 2018 15:49:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C158520779
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Oct 2018 15:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C158520779
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=powerneth.ro
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3be8c9b6;
	Sun, 21 Oct 2018 15:46:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5a8ad08
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Oct 2018 15:46:48 +0000 (UTC)
Received: from mail.insteeldesign.ro (mail.crimel.ro [109.166.220.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4606eb67
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Oct 2018 15:46:48 +0000 (UTC)
Received: from [192.168.123.118] (unknown [188.26.79.221])
 by mail.insteeldesign.ro (Postfix) with ESMTPSA id C096B22222AD
 for <wireguard@lists.zx2c4.com>; Sun, 21 Oct 2018 18:49:09 +0300 (EEST)
Subject: Re: wireguard dkms systemd
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <0e93f5b4-8883-57e4-0114-42f0bfd5f6c3@powerneth.ro>
 <b0nxrg6FW687Fl8Gai_Eo8VNChZfWGIxiEhhrcjdPJY9UKGgbYOTzxkzek-YZ01khNfWy76jBAsL8wtUVj0ECl3uF_nu3r6Yk_mYSpY4O28=@protonmail.ch>
From: Lucian Cristian <luci@powerneth.ro>
Message-ID: <17a30c81-d413-a742-77a7-8743b2574a3c@powerneth.ro>
Date: Sun, 21 Oct 2018 18:49:19 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <b0nxrg6FW687Fl8Gai_Eo8VNChZfWGIxiEhhrcjdPJY9UKGgbYOTzxkzek-YZ01khNfWy76jBAsL8wtUVj0ECl3uF_nu3r6Yk_mYSpY4O28=@protonmail.ch>
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

T24gMjEuMTAuMjAxOCAxNToxMiwgSm9yZGFuIEdsb3ZlciB3cm90ZToKPiDigJDigJDigJDigJDi
gJDigJDigJAgT3JpZ2luYWwgTWVzc2FnZSDigJDigJDigJDigJDigJDigJDigJAKPiBPbiBTYXR1
cmRheSwgT2N0b2JlciAyMCwgMjAxOCAxMDo1OSBQTSwgTHVjaWFuIENyaXN0aWFuIDxsdWNpQHBv
d2VybmV0aC5ybz4gd3JvdGU6Cj4KPj4gdXBkYXRpbmcgdGhlIHdpcmVndWFyZCBtb2R1bGUgb24g
c3lzdGVtZCBiYXNlZCBsaW51eCBnaXZlcwo+Pgo+PiBXYXJuaW5nOiBUaGUgdW5pdCBmaWxlLCBz
b3VyY2UgY29uZmlndXJhdGlvbiBmaWxlIG9yIGRyb3AtaW5zIG9mCj4+IHdnLXF1aWNrQHdnMC5z
ZXJ2aWNlIGNoYW5nZWQgb24gZGlzay4gUnVuICdzeXN0ZW1jdGwgZGFlbW9uLXJlbG9hZCcgdG8K
Pj4gcmVsb2FkIHVuaXRzLgo+PiBTbGVlcGluZyAzIHNlY29uZHMuLi4KPj4KPiBUaGlzIGhhcyBu
b3RoaW5nIHRvIGRvIHdpdGggZGttcy4gU3lzdGVtZCB1bml0cyBhcmUgcGFydCBvZgo+IHdpcmVn
dWFyZC10b29scyBwYWNrYWdlLgo+Cj4+IGNhbiB0aGlzIGJlIGZpeGVkIGludCB0aGUgcmVzdGFy
dCBzY3JpcHQgPwo+Pgo+IFRoZXJlIGlzbid0IGEgInJlc3RhcnQgc2NyaXB0IiBpbiBhbnkgd2ly
ZWd1YXJkIHBhY2thZ2UuCj4KPj4gdGhlIHR1bm5lbCB3b24ndCBjb21lIHVwIGlmIHRoZSB1bml0
IGlzIG5vdCByZWxvYWRlZAo+Pgo+IFRoZW4gcmVsb2FkIGl0LiBZb3UgaGF2ZSBleGFjdCBjb21t
YW5kIHByaW50ZWQuCj4KPj4gVGhhbmsgeW91ICEKPiBKb3JkYW4KPgp1YnVudHUsCgppcyBhbiBh
bm5veWFuY2UgdG8gcmVzdGFydCBpdCBtYW51YWxseSwgaWYgeW91IGFyZSBpbnNpZGUgdGhlIHZw
biwgeW91IApjYW4ndCBkbyBpdCwgSSB0aG91Z2h0IHRoYXQgdGhlcmUgaXMgYSByZXN0YXJ0IHNj
cmlwdCBhdCBwYWNrYWdlIHVwZGF0ZS4uCgoKUmVnYXJkcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFy
ZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5m
by93aXJlZ3VhcmQK
