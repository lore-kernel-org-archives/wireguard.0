Return-Path: <SRS0=l6+B=MO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C26C64EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 03:06:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F34C42083F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 03:06:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n7bIMSkT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F34C42083F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 826b4faf;
	Tue, 2 Oct 2018 03:06:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c7adcc7
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Sep 2018 07:08:17 +0000 (UTC)
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0915ad7a
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Sep 2018 07:08:17 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id h200-v6so350733vke.5
 for <wireguard@lists.zx2c4.com>; Thu, 27 Sep 2018 00:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=se9u1UWS+tR4plsSjXe5pwZOoYL1jB2nG01LLRxL/6M=;
 b=n7bIMSkToQEyFxfD2ZJsoHW7b1ig10lhloem9TaeqmhNU/8LPBd5KSec9T9/iBCYqw
 GHPXliHYyf3SsMjK4W5F+hnfpjUucBw9rX0Xt2OFedZiWTpfWFIITuu+D4ICBbxvvKOB
 DD52qXmQ4FZCwbdE5uA4wwT2cbjc9C0x5TPl/KcP4Wj9svCGhKhpqYhNjUwnHuuTQ4KO
 f8eyDII8vd/1Bm2b2AAh9PnXpx6n8ul52iZvRcfYwBrIbq9zZvsQfQf1at23LHXBQuw3
 h2au1xGyPQ+5rLrt40imD8Jkjnf8XNrJwPcpYyIUe2MqCOXpdLO3KX2tHgxSRvEAyCPx
 t6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=se9u1UWS+tR4plsSjXe5pwZOoYL1jB2nG01LLRxL/6M=;
 b=Ytfvgc9ChvhW+zWHNyyncduPto6Pjr9r0CW9a0OeqCplYGEl5v9Rgrnp4P8Mqh2SGB
 nBkTARHy3Kbaj9Wio+p7xg42e7JO9Qmq/Jw1MrIptNzvJ8DoMOr5c1sYSzOReHpggb5k
 I4f8DIr67QaZfljAwrxO+YURVDGU5DyUH4vWacf/fTbZkvteCx8RANU79bSRCSFbiNad
 YttMVLsjcivWRdrDUl+IIWowwts8KycTBEC2MSE0sPugjKnn7YBZv+cJHaEgMUiuB6/P
 HM8AtulD3xX/e/9NcX46xgMiz4surW2vqqI+8Ct+YfiJUN2GaDwONVtXrp5XdEOJsg+D
 6yvQ==
X-Gm-Message-State: ABuFfojalGbOXxEJkTCHTs9jMHc5KhSxUNGrAQ5HoYnXiFrT2yufC0lz
 AOlRsqeKcTNI6eYhK3Fx79M18C59wOI59nohbNmRNur2
X-Google-Smtp-Source: ACcGV60vbmTNse0c8dhLgsbEv5KqxVtbWLABBQ2oVxpxP0mPQNoaJB0U8Plv4s8sDj56T8nIg1HMxYPrKTHF4PFizQI=
X-Received: by 2002:a1f:c2d4:: with SMTP id
 s203-v6mr1680592vkf.36.1538032265068; 
 Thu, 27 Sep 2018 00:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <CA+Vb7hpWG4DEfSFe_S1rajsuiVJkkfJ9Y29-tSWYnserOeGssQ@mail.gmail.com>
In-Reply-To: <CA+Vb7hpWG4DEfSFe_S1rajsuiVJkkfJ9Y29-tSWYnserOeGssQ@mail.gmail.com>
From: Philipp Richter <richterphilipp.pops@gmail.com>
Date: Thu, 27 Sep 2018 09:10:53 +0200
Message-ID: <CA+Vb7hr=cGpHkOH3i+uQ=W_a-0QKGB_ffahYSRtiB1T21Dndfw@mail.gmail.com>
Subject: Re: Implicit declaration of function 'read_cpuid_part', asm/simd.h:
 No such file or directory with 0.0.20180925 on arm kernel 3.10.107
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Tue, 02 Oct 2018 05:06:16 +0200
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

SSB0ZXN0ZWQgdGhlIGxhdGVzdCBjb21taXQgNmYwOTRkY2ExNzAzOGE0OGYzZjAxOTMxYzZiODBk
NjUxMWE4Njk2NwoKQW5kIHdpdGggdGhhdCBpdCBjb21wbGFpbnMgb25seSBhYm91dCBtaXNzaW5n
IGFzbS9zaW1kLmgKClJlZ2FyZHMsClBoaWxpcHAgUmljaHRlcgpPbiBUaHUsIDI3IFNlcCAyMDE4
IGF0IDA4OjU0LCBQaGlsaXBwIFJpY2h0ZXIKPHJpY2h0ZXJwaGlsaXBwLnBvcHNAZ21haWwuY29t
PiB3cm90ZToKPgo+IEhlbGxvLAo+Cj4gaXQncyBtZSBhZ2FpbiB3aXRoIG15IHN1cGVyIGFuY2ll
bnQga2VybmVsICpzaWdoKgo+Cj4gSSdtIGdldHRpbmcgdGhlc2UgZXJyb3JzIHdpdGggdGhlIDAu
MC4yMDE4MDkyNSBzbmFwc2hvdCA6Cj4KPiBES01TIG1ha2UubG9nIGZvciB3aXJlZ3VhcmQtMC4w
LjIwMTgwOTI1IGZvciBrZXJuZWwgMy4xMC4xMDctMi1BUkNIIChhcm12N2wpCj4gVGh1IFNlcCAy
NyAwODo0NDoxOCBDRVNUIDIwMTgKPiBtYWtlOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3Jj
L2xpbnV4LTMuMTAuMTA3LTItQVJDSCcKPiAgTEQgICAgICAvdmFyL2xpYi9ka21zL3dpcmVndWFy
ZC8wLjAuMjAxODA5MjUvYnVpbGQvYnVpbHQtaW4ubwo+ICBDQyBbTV0gIC92YXIvbGliL2RrbXMv
d2lyZWd1YXJkLzAuMC4yMDE4MDkyNS9idWlsZC9tYWluLm8KPiAgQ0MgW01dICAvdmFyL2xpYi9k
a21zL3dpcmVndWFyZC8wLjAuMjAxODA5MjUvYnVpbGQvbm9pc2Uubwo+ICBDQyBbTV0gIC92YXIv
bGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE4MDkyNS9idWlsZC9kZXZpY2Uubwo+ICBDQyBbTV0g
IC92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE4MDkyNS9idWlsZC9wZWVyLm8KPiAgQ0Mg
W01dICAvdmFyL2xpYi9ka21zL3dpcmVndWFyZC8wLjAuMjAxODA5MjUvYnVpbGQvdGltZXJzLm8K
PiAgQ0MgW01dICAvdmFyL2xpYi9ka21zL3dpcmVndWFyZC8wLjAuMjAxODA5MjUvYnVpbGQvcXVl
dWVpbmcubwo+ICBDQyBbTV0gIC92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE4MDkyNS9i
dWlsZC9zZW5kLm8KPiAgQ0MgW01dICAvdmFyL2xpYi9ka21zL3dpcmVndWFyZC8wLjAuMjAxODA5
MjUvYnVpbGQvcmVjZWl2ZS5vCj4gIENDIFtNXSAgL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4w
LjIwMTgwOTI1L2J1aWxkL3NvY2tldC5vCj4gIENDIFtNXSAgL3Zhci9saWIvZGttcy93aXJlZ3Vh
cmQvMC4wLjIwMTgwOTI1L2J1aWxkL2hhc2h0YWJsZXMubwo+ICBDQyBbTV0gIC92YXIvbGliL2Rr
bXMvd2lyZWd1YXJkLzAuMC4yMDE4MDkyNS9idWlsZC9hbGxvd2VkaXBzLm8KPiAgQ0MgW01dICAv
dmFyL2xpYi9ka21zL3dpcmVndWFyZC8wLjAuMjAxODA5MjUvYnVpbGQvcmF0ZWxpbWl0ZXIubwo+
ICBDQyBbTV0gIC92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE4MDkyNS9idWlsZC9jb29r
aWUubwo+ICBDQyBbTV0gIC92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE4MDkyNS9idWls
ZC9uZXRsaW5rLm8KPiAgQ0MgW01dICAvdmFyL2xpYi9ka21zL3dpcmVndWFyZC8wLjAuMjAxODA5
MjUvYnVpbGQvY3J5cHRvL3ppbmMvY2hhY2hhMjAvY2hhY2hhMjAubwo+ICBBUyBbTV0gIC92YXIv
bGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE4MDkyNS9idWlsZC9jcnlwdG8vemluYy9jaGFjaGEy
MC9jaGFjaGEyMC1hcm0ubwo+ICBDQyBbTV0gIC92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4y
MDE4MDkyNS9idWlsZC9jcnlwdG8vemluYy9wb2x5MTMwNS9wb2x5MTMwNS5vCj4gIEFTIFtNXSAg
L3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTgwOTI1L2J1aWxkL2NyeXB0by96aW5jL3Bv
bHkxMzA1L3BvbHkxMzA1LWFybS5vCj4gIENDIFtNXSAgL3Zhci9saWIvZGttcy93aXJlZ3VhcmQv
MC4wLjIwMTgwOTI1L2J1aWxkL2NyeXB0by96aW5jL2NoYWNoYTIwcG9seTEzMDUubwo+ICBDQyBb
TV0gIC92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE4MDkyNS9idWlsZC9jcnlwdG8vemlu
Yy9ibGFrZTJzL2JsYWtlMnMubwo+IEluIGZpbGUgaW5jbHVkZWQgZnJvbQo+IC92YXIvbGliL2Rr
bXMvd2lyZWd1YXJkLzAuMC4yMDE4MDkyNS9idWlsZC9jcnlwdG8vemluYy9jaGFjaGEyMC9jaGFj
aGEyMC5jOjIwOgo+IC92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE4MDkyNS9idWlsZC9j
cnlwdG8vemluYy9jaGFjaGEyMC9jaGFjaGEyMC1hcm0tZ2x1ZS5oOgo+IEluIGZ1bmN0aW9uIOKA
mGNoYWNoYTIwX2ZwdV9pbml04oCZOgo+IC92YXIvbGliL2RrbXMvd2lyZWd1YXJkLzAuMC4yMDE4
MDkyNS9idWlsZC9jcnlwdG8vemluYy9jaGFjaGEyMC9jaGFjaGEyMC1hcm0tZ2x1ZS5oOjMwOjEw
Ogo+IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiDigJhyZWFkX2NwdWlk
X3BhcnTigJk7IGRpZCB5b3UKPiBtZWFuIOKAmHJlYWRfY3B1aWRfZXh04oCZPyBbLVdlcnJvcj1p
bXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KPiAgc3dpdGNoIChyZWFkX2NwdWlkX3BhcnQo
KSkgewo+ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgo+ICAgICAgICAgIHJlYWRfY3B1aWRfZXh0
Cj4gIENDIFtNXSAgL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTgwOTI1L2J1aWxkL2Ny
eXB0by96aW5jL2N1cnZlMjU1MTkvY3VydmUyNTUxOS5vCj4gY2MxOiBzb21lIHdhcm5pbmdzIGJl
aW5nIHRyZWF0ZWQgYXMgZXJyb3JzCj4gbWFrZVsxXTogKioqIFtzY3JpcHRzL01ha2VmaWxlLmJ1
aWxkOjMwOToKPiAvdmFyL2xpYi9ka21zL3dpcmVndWFyZC8wLjAuMjAxODA5MjUvYnVpbGQvY3J5
cHRvL3ppbmMvY2hhY2hhMjAvY2hhY2hhMjAub10KPiBFcnJvciAxCj4gbWFrZVsxXTogKioqIFdh
aXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20KPiAv
dmFyL2xpYi9ka21zL3dpcmVndWFyZC8wLjAuMjAxODA5MjUvYnVpbGQvY3J5cHRvL3ppbmMvY3Vy
dmUyNTUxOS9jdXJ2ZTI1NTE5LmM6MjU6Cj4gL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIw
MTgwOTI1L2J1aWxkL2NyeXB0by96aW5jL2N1cnZlMjU1MTkvY3VydmUyNTUxOS1hcm0tZ2x1ZS5o
Ojg6MTA6Cj4gZmF0YWwgZXJyb3I6IGFzbS9zaW1kLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3Rv
cnkKPiAjaW5jbHVkZSA8YXNtL3NpbWQuaD4KPiAgICAgICAgICBefn5+fn5+fn5+fn4KPiBjb21w
aWxhdGlvbiB0ZXJtaW5hdGVkLgo+IG1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWls
ZDozMDg6Cj4gL3Zhci9saWIvZGttcy93aXJlZ3VhcmQvMC4wLjIwMTgwOTI1L2J1aWxkL2NyeXB0
by96aW5jL2N1cnZlMjU1MTkvY3VydmUyNTUxOS5vXQo+IEVycm9yIDEKPiBtYWtlOiAqKiogW01h
a2VmaWxlOjEyMzM6Cj4gX21vZHVsZV8vdmFyL2xpYi9ka21zL3dpcmVndWFyZC8wLjAuMjAxODA5
MjUvYnVpbGRdIEVycm9yIDIKPiBtYWtlOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMvbGlu
dXgtMy4xMC4xMDctMi1BUkNIJwo+Cj4KPiBJIHVuZGVyc3RhbmQgaWYgaXQncyBqdXN0IG5vIHBv
c3NpYmxlIGFueW1vcmUgdG8gc3VwcG9ydCBzdWNoIGFuY2llbnQKPiBzb2Z0d2FyZS4gSW5zdGVh
ZCBvZiBjb2xsZWN0aW5nIGR1c3QgaXQgc2VydmVzIGFzIGEgbmljZSB3aXJlZ3VhcmQKPiBlbmRw
b2ludCA6KQo+Cj4gV2lyZWd1YXJkIGhhcyBiZWVuIGFtYXppbmcgc28gZmFyLCB0aGFua3MgZm9y
IHN1Y2ggZ3JlYXQgc29mdHdhcmUuCj4KPiBCZXN0IFJlZ2FyZHMsCj4gUGhpbGlwcCBSaWNodGVy
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFy
ZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4
MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
