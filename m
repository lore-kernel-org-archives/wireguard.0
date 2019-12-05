Return-Path: <SRS0=YtjY=Z3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CA6C2D0BF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Dec 2019 19:50:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C32F224F8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Dec 2019 19:50:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DW/yuOFN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C32F224F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64e443a6;
	Thu, 5 Dec 2019 19:50:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 680a82fb
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 19:50:43 +0000 (UTC)
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa1adaf6
 for <wireguard@lists.zx2c4.com>; Thu, 5 Dec 2019 19:50:43 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p17so4996222wma.1
 for <wireguard@lists.zx2c4.com>; Thu, 05 Dec 2019 11:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=QJZGk95FMC/fxkFzBpUtc94ThBYsh58F/79f7x1Kx0E=;
 b=DW/yuOFNyqrNKC8ROCkZ9K/cn6u5gBi5vnYSgqTKJCx9vkAscJ5q4z5AMl5+1JhhJB
 kkoMePjB5gxcial7NzwncHpnhfv3BivM6Tv3cCeHWkc2enUA01TQpdBH+QXU2ngXxFXK
 sY0ON7aO3FqYARuUYDz26LSnEEhhd66xci44f9uBgrQghLkC4Q4d2+HM0+mjolOR1Hyd
 7kr82qbrkKMoh/BSGWHdmq0uLQuVLy+UDOuCznGx/Wllkzx3dSecaan/oZ9bXitvT+Ro
 CXIy12dmFvUrDIkCamp9puisTvuVbTLE+vOeUb6CMWttadkdLpBhuRdv7Kwh5033yEvj
 BpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QJZGk95FMC/fxkFzBpUtc94ThBYsh58F/79f7x1Kx0E=;
 b=imDk93v3MNAv87xV49DKE05dV15VHVojxionVPTASHFkHaBCZRaYpBzB+VW4yavJGT
 a231WRwcY/qjGURPR7olSCVRMGQymZafAgEgGqT/BVQqxMjY9VoeFuvSb6jcQZYzzryc
 0JfWhVsKBybjY6aa+bxmaKn/EnK7rhjDhZXLcdilJ7+8vJcJbKcNcWmh1/P5k6yoGlqK
 JeTdTzdQIuaIgQ2MBHbCruyEaIFiC0jJ49ooKCtN9zpuZq1/SS1vDpuDN+Mtl1vXAOIC
 e0yPRYU/rbaGeb1ZgnSjfIW6AsxivggCWAN2AtpGBcKtpT+KRonYVellgZPSmlR1416e
 vMeQ==
X-Gm-Message-State: APjAAAVrpBXQZdcUMCmu06oqa0Wk4IrQUmqyEiQvvRufyK/M0dCNAVkp
 8vldDQF+bngg3MCCecDNCsydr076P1Bm2Q==
X-Google-Smtp-Source: APXvYqxvv/4IoLrS+O75NMnTNVpTFHF2eVXmDj7QXB5daggcr1aptTif/r8j1dGPCYXsioEo5Pa7JA==
X-Received: by 2002:a1c:5f06:: with SMTP id t6mr6325543wmb.32.1575575441545;
 Thu, 05 Dec 2019 11:50:41 -0800 (PST)
Received: from [0.0.0.0] ([185.220.101.31])
 by smtp.gmail.com with ESMTPSA id n3sm938591wmc.27.2019.12.05.11.50.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Dec 2019 11:50:40 -0800 (PST)
Subject: Re: Regarding "Inferring and hijacking VPN-tunneled TCP connections"
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20191205191318.GA44156@zx2c4.com>
From: Vasili Pupkin <diggest@gmail.com>
Message-ID: <db72ae85-4e68-1745-e11b-0fb81016358e@gmail.com>
Date: Thu, 5 Dec 2019 22:50:54 +0300
User-Agent: Mozilla/5.0 (Windows NT 5.2; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191205191318.GA44156@zx2c4.com>
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

SXNuJ3QgaXQgZW5vdWdoIHRvIGp1c3QgZW5mb3JjZSBTdHJvbmcgSG9zdCBNb2RlbCwgaS5lLiBh
IGhvc3Qgd29uJ3QgCnJlc3BvbmQgZnJvbSBpdCdzIElQIHRoYXQgaXMgbm90IGZhY2luZyB0aGUg
aW50ZXJmYWNlLiBJZiBhIGhvc3QgaXMgCmNvbm5lY3RlZCB0byB0d28gc3VibmV0cyAxMC4xLngu
eCBhbmQgMTAuMi54LnggYW5kIGhhdmUgdHdvIElQIDEwLjEuMC4xIAphbmQgMTAuMi4wLjEsIGl0
IHdpbGwganVzdCBkcm9wIGFsbCB0aGUgcGFja2V0cyBzZW50IHRvIDEwLjEuMC4xIHRoYXQgCmNh
bWUgZnJvbSB0aGUgaW50ZXJmYWNlIDEwLjIuMC4xIGFuZCB2aWNlIHZlcnNlLiBUaGlzIG1vZGVs
IGNhbiBiZSAKZW11bGF0ZWQgdXNpbmcgdGhlIEZJQiBsb29rdXAgZmVhdHVyZSBvZiBORlQgd2l0
aCB0aGlzIG9uZSBsaW5lcjoKCm5mdCBhZGQgcnVsZSBpbmV0IGZpbHRlciBpbnB1dCBmaWIgZGFk
ZHIgLiBpaWYgdHlwZSAhPSB7IGxvY2FsLCAKYnJvYWRjYXN0LCBtdWx0aWNhc3QgfSBkcm9wCgp0
aGlzIGFsc28gd29ya3MgZm9yIGJvdGggSVA0IGFuZCBJUDYuIFRoaXMgbW9kZSBjYW4gYmUgc2Fm
ZWx5IGVuYWJsZWQgb24gCm1vc3Qgc2V0dXBzIG5vdCBicmVha2luZyB0aGluZ3MuIEVuYWJsaW5n
IGl0IGlzIGEgZ29vZCBwcmVjYXV0aW9uIAptZWFzdXJlIGFueXdheSBhbmQgaXQgaXMgYSBzaGFt
ZSB0aGF0IGl0IGlzIG5vdCB3aWRlbHkgYXNzdW1lZCBhcyAKZGVmYXVsdCBhbmQgc3RhbmRhcmQu
CgpEb2luZyB0aGUgc2FtZSB3aXRoIGp1c3QgaXB0YWJsZXMgaXNuJ3QgZWFzeSBhbmQgY2FuJ3Qg
YmUgYWNjb21wbGlzaGVkIAp3aXRoIG9uZSBsaW5lciBidXQgbmZ0IHBlcmZlY3RseSBjb2V4aXN0
IHdpdGggaXB0YWJsZXMuCgpPbiAwNS4xMi4yMDE5IDIyOjEzLCBKYXNvbiBBLiBEb25lbmZlbGQg
d3JvdGU6Cj4gSGV5IGZvbGtzLAo+Cj4gV2lsbGlhbSB1bmVtYmFyZ29lZCBoaXMgbmljZSB2dWxu
IHRoaXMgd2VlazogaHR0cHM6Ly9zZWNsaXN0cy5vcmcvb3NzLXNlYy8yMDE5L3E0LzEyMgo+Cj4g
SXQgYXBwZWFycyB0byBhZmZlY3QgYmFzaWNhbGx5IG1vc3QgY29tbW9uIHVuaXggbmV0d29yayBz
dGFja3MuIFRoaXMKPiBpc24ndCBhIFdpcmVHdWFyZCB2dWxuZXJhYmlsaXR5LCBidXQgcmF0aGVy
IHNvbWV0aGluZyBpbiB0aGUgcm91dGluZwo+IHRhYmxlIGNvZGUgYW5kL29yIFRDUCBjb2RlIG9u
IGFmZmVjdGVkIG9wZXJhdGluZyBzeXN0ZW1zLiBIb3dldmVyLCBpdAo+IGRvZXMgYWZmZWN0IHVz
LCBzaW5jZSBXaXJlR3VhcmQgZXhpc3RzIG9uIHRob3NlIGFmZmVjdGVkIE9TZXMuCj4KPiBTb21l
IG1pZ2h0IGNoYWxrIGl0IHVwIHRvIGp1c3QgYSBjb25maWd1cmF0aW9uIGVycm9yLCBkaXNtaXNz
aW5nIGl0IGFzLAo+ICJ3ZWxsLCBpZiB5b3UgY29uZmlndXJlIHlvdXIgbmV0d29ya2luZyBzdGFj
ayBwb29ybHksIGJhZCB0aGluZ3Mgd2lsbAo+IGhhcHBlbiwiIGJ1dCBJIGRvbid0IHJlYWxseSBi
dXkgdGhhdDogdGhlIG5ldHdvcmsgc2V0dXBzIGFmZmVjdGVkIGJ5Cj4gdGhpcyB2dWxuZXJhYmls
aXR5IGFyZSBwcmV0dHkgbXVjaCB0aGUgbm9ybSBldmVyeXdoZXJlLgo+Cj4gQW5kIGl0IHR1cm5z
IG91dCB0aGF0IHdlIGFjdHVhbGx5IGFyZSBpbiB0aGUgYnVzaW5lc3Mgb2YgcHJvcGVybHkKPiBj
b25maWd1cmluZyBwZW9wbGUncyBuZXR3b3JraW5nIHN0YWNrcy4gU3BlY2lmaWNhbGx5LCB0aGUg
dG9vbHMgd2Ugc2hpcAo+IGNvbWUgd2l0aCB0aGUgbGl0dGxlIGJhc2ggc2NyaXB0LCB3Zy1xdWlj
ayg4KSwgd2hpY2ggaXMgYSBwb3B1bGFyIHdheSBvZgo+IGF1dG9tYXRpbmcgc29tZSBjb21tb24g
dGFza3MuIFdlJ3ZlIHN0YXJ0ZWQgbG9va2luZyBhdCBrZXJuZWwtbGV2ZWwKPiBtaXRpZ2F0aW9u
cyB3aXRoaW4gdGhlIExpbnV4IG5ldHdvcmtpbmcgc3RhY2ssIGJ1dCBiZWZvcmUgdGhvc2UgYXJl
Cj4gcmVhZHksIEkgdGhvdWdodCBpdCB3b3VsZCBiZSBwcnVkZW50IHRvIHB1dCBzb21lIGZpcnN0
LWxldmVsIGRlZmVuc2VzCj4gaW50byB3Zy1xdWljayg4KSBpdHNlbGYuCj4KPiBGb3IgdGhhdCBy
ZWFzb24sIHNpbmNlIE5vdmVtYmVyLCB3Zy1xdWljayg4KSBoYXMgYWRkZWQgYSBmZXcgaXB0YWJs
ZXMoOCkKPiBydWxlcy4gSSByZWFsbHkgZGlzbGlrZSBoYXZpbmcgd2ctcXVpY2soOCkgZ3JvdyBh
bnkgc29ydCBvZiBkZXBlbmRlbmN5Cj4gb24gaXB0YWJsZXMoOCkgKGFuZCBldmVudHVhbGx5IG9u
IG5mdGFibGVzKDgpKSwgYnV0IGF0IHRoZSBtb21lbnQsIEkKPiBkb24ndCBzZWUgYSB2aWFibGUg
YWx0ZXJuYXRpdmUuIFN1Z2dlc3Rpb25zIGFyZSB3ZWxjb21lLiBJbiBwYXJ0aWN1bGFyLAo+IHdl
J3JlIGFkZGluZyBhIHJ1bGUgdGhhdCBpcyBzb21ldGhpbmcgbGlrZToKPgo+ICDCoCDCoCBpcHRh
YmxlcyAtdCByYXcgLUkgUFJFUk9VVElORyAhIC1pIHdnMCAtZCAxMC4xODIuMTIuOCAtbSBhZGRy
dHlwZSAhIC0tc3JjLXR5cGUgTE9DQUwgLWogRFJPUAo+Cj4gd2hlcmUgd2cwIGlzIHRoZSBXaXJl
R3VhcmQgaW50ZXJmYWNlIGFuZCAxMC4xODIuMTIuOCBpcyB0aGUgbG9jYWwgSVAgb2YKPiB0aGUg
aW50ZXJmYWNlLgo+Cj4gVGhpcyBzYXlzIHRvIGRyb3AgYWxsIHBhY2tldHMgdGhhdCBhcmUgc2Vu
dCB0byB0aGF0IElQIGFkZHJlc3MgdGhhdAo+IGFyZW4ndCBjb21pbmcgZnJvbSB0aGUgV2lyZUd1
YXJkIGludGVyZmFjZS4gQW5kIGl0J3MgZG9uZSB2ZXJ5IGVhcmx5IGluCj4gTmV0ZmlsdGVyLCBp
biB0aGUgInJhdyIgdGFibGUuIFRoZSByZXNlYXJjaGVycyBoYXZlIGNvbmZpcm1lZCB0aGF0IHRo
aXMKPiBtaXRpZ2F0ZXMgdGhlIGlzc3VlLgo+Cj4gQWRkaW5nIGlwdGFibGVzKDgpIGludG8gd2ct
cXVpY2soOCkgaGFzIGJlZW4gcHJlZGljdGFibHkgcHJvYmxlbWF0aWMsCj4gYW5kIGl0J2xsIHBy
b2JhYmx5IGJlIGF0IGxlYXN0IGFub3RoZXIgc25hcHNob3QgdW50aWwgd2UgZ2V0IHRoaW5ncwo+
IGJ1Zy1mcmVlIG9uIGFsbCB0aGUgZGlmZmVyZW50IHZhcmlhdGlvbnMgb2YgdGhlIHV0aWxpdHkg
dGhhdCBkaXN0cm9zCj4gc2hpcCwgYnV0IHdlJ2xsIGdldCB0aGVyZS4gSW4gdGhlIG1lYW50aW1l
LCBJJ2QgY2VydGFpbmx5IGFwcHJlY2lhdGUKPiBwYXRjaGVzIHRvIGRvIHRoZSBzYW1lIHdpdGgg
bmZ0YWJsZXMoOCksIGFzIHdlbGwgYXMgc29tZSBmcmVzaCB0aG91Z2h0cwo+IG9uIGhvdyB0byBh
Y2NvbXBsaXNoIHRoaXMgc2FtZSB0aGluZyBfd2l0aG91dF8gdGhlIGZpcmV3YWxsLiAoSW4gdGhl
Cj4gcHJvY2VzcyBvZiB3cml0aW5nIHRoaXMgZW1haWwsIGZvciBleGFtcGxlLCBJIGhhZCBhbiBp
ZGVhIHJlZ2FyZGluZwo+IGlwLXJ1bGUoOCkgdGhhdCBtaWdodCB3b3JrIG91dCwgYnV0IEkgaGF2
ZW4ndCB0cmllZCB5ZXQuKSBXZSBhbHNvIGhhdmUKPiBzb21lIG5vbi1MaW51eCBvcGVyYXRpbmcg
c3lzdGVtcyB0byBjb25zaWRlci4KPgo+Cj4gRmVlZGJhY2sgd2VsY29tZS4KPgo+IFJlZ2FyZHMs
Cj4gSmFzb24KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IFdpcmVHdWFyZCBtYWlsaW5nIGxpc3QKPiBXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCj4g
aHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWls
aW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
