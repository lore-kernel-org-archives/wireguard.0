Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6586CC35DF5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 08:14:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF4362176D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 08:14:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ri5iY/QP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF4362176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75bbf486;
	Tue, 25 Feb 2020 08:10:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32ffdfe5
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 08:10:18 +0000 (UTC)
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 345e3985
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Feb 2020 08:10:18 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id y3so4217219uae.3
 for <wireguard@lists.zx2c4.com>; Tue, 25 Feb 2020 00:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=1X6xyMV03kgniBo7znh5H1+MOFC370Gn4Cs3Y1yyE24=;
 b=Ri5iY/QP8XbpKZkq6sUjSIe0lEQiU6YbkrNxrG91N1PSR89bfe23LSBEUOYXy8Yl/a
 cafBASYT5eRo9tpNVIwrhJfrFs0PDR8wnNFQDLYGigs9WRSbIbuUcirW70lSs5ZFD715
 fq3kI1Li/okw1UPdlRI9FOutPmuJEx+BKRv7IDrZI2rjiqmzcG4v0KqRdjPcyIfmub1D
 LyEOKcLyBv1LUxBE2Br+FDU8ZDym01oj1Kjc9fC3RluOV7CNrSKiPGJ+Sb2G8fz4TIDl
 yQRmw2dklHLHWS2NGNkLrY7zGN5RGZ5etHhTaajAy9E0CJyYRa7ewKTJaRHu83xu6uRG
 d+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=1X6xyMV03kgniBo7znh5H1+MOFC370Gn4Cs3Y1yyE24=;
 b=fsICjAmzZSVvpgPg1De5xmMhF4cW70sIWumKl+Oj18g10saGZGq3pc1h7I89tSNTCU
 DHY3L6y9j7KJ00ZbINMuqgbJ2FVtduaYF6HzbiD/hyKE3alTFcTNG2K+5YexsIa8RBzE
 mLl33oeAtdBtOWYj2qosBN5Cnvv7yNioRgt7u4VAinXRsct8j6ROiSMjVcVnja81m8ao
 r5senmO1+HdZgfLaMl3Qd3F3hMYEJENNHhwwC4vjguw0+Rz2yJxefNbyOqhPZ1Pe7sd+
 uVZ8XiefpTroSMnBhk9Cd1PpJ5L2diOkvHxGSoB4+PxK/J86xdN1NvyniEzyK1NpKByJ
 6mNQ==
X-Gm-Message-State: APjAAAWzHNVY9r9T0FwSYWv+cbbyCAhLa3vi4sG5T/RdK5Jau2v5H/gK
 XVGUKmQ2s0c6fZYulKsFfOyoHsNvrBLhi6anceZzb+A7Lvs=
X-Google-Smtp-Source: APXvYqzUYmuN+PFWITKkzzJ1TOnwjcW7SnvouR21/JY7knt9Nve/0peCfRNewkLQLpQ+04rAlL7rGdau30XKH61vy5w=
X-Received: by 2002:a9f:3046:: with SMTP id i6mr27583769uab.15.1582618427703; 
 Tue, 25 Feb 2020 00:13:47 -0800 (PST)
MIME-Version: 1.0
References: <20200223111248.1083-1-srb12345@vip.qq.com>
 <8b65014d-b6b9-c933-1ccd-d92d9f28ed23@sholland.org>
In-Reply-To: <8b65014d-b6b9-c933-1ccd-d92d9f28ed23@sholland.org>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Tue, 25 Feb 2020 17:13:34 +0900
Message-ID: <CAA2ss9F2XipJeiD0gJUn7Zz=f+JyLij4UQ4rnQ+dCND=UA6BUA@mail.gmail.com>
Subject: Re: [PATCH] Update Simplified Chinese translation
To: Samuel Holland <samuel@sholland.org>, wireguard@lists.zx2c4.com
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

SGkgU2FtdWVsLgoKSSBhbHJlYWR5IHRyYW5zbGF0ZWQgaW4gSmFwYW5lc2UsIGJ1dCBJIGRpZG4n
dCBjb25jZXJuIGFib3V0IHBsdXJhbHMuCgpKYXBhbmVzZSBkb2Vzbid0IGhhdmUgcGx1cmFscywg
c28gZG9lcyAidmFsdWVzLWphL3N0cmluZ3MueG1sIiBuZWVkcyB0aGVzZSBmaXg/Ci0gcmVtb3Zl
IHBsdXJhbHMKLSBhZGQgc3RyaW5nIHJlc291cmNlIHRoYXQgaGF2ZSBzYW1lICJuYW1lIiBhdHRy
aWJ1dGUgYXMgcGx1cmFscwoKUmVnYXJkcywKCjIwMjDlubQy5pyIMjXml6Uo54GrKSA5OjU4IFNh
bXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQub3JnPjoKPgo+IE9uIDIvMjMvMjAgNToxMiBB
TSwgc3JiMTIzNDVAdmlwLnFxLmNvbSB3cm90ZToKPiA+IEZyb206IExpbGxpZ2FudE1hdHN1cmkg
PHNyYjEyMzQ1QHZpcC5xcS5jb20+Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTGlsbGlnYW50TWF0
c3VyaSA8c3JiMTIzNDVAdmlwLnFxLmNvbT4KPiA+IC0tLQo+ID4gIGFwcC9zcmMvbWFpbi9yZXMv
dmFsdWVzLXpoLXJDTi9zdHJpbmdzLnhtbCB8IDEwICsrKysrKysrLS0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9hcHAvc3JjL21haW4vcmVzL3ZhbHVlcy16aC1yQ04vc3RyaW5ncy54bWwgYi9hcHAvc3JjL21h
aW4vcmVzL3ZhbHVlcy16aC1yQ04vc3RyaW5ncy54bWwKPiA+IGluZGV4IDMzNjBkYWUuLjk3ZTg3
MWEgMTAwNjQ0Cj4gPiAtLS0gYS9hcHAvc3JjL21haW4vcmVzL3ZhbHVlcy16aC1yQ04vc3RyaW5n
cy54bWwKPiA+ICsrKyBiL2FwcC9zcmMvbWFpbi9yZXMvdmFsdWVzLXpoLXJDTi9zdHJpbmdzLnht
bAo+ID4gQEAgLTEsMjEgKzEsMjcgQEAKPiA+ICA8P3htbCB2ZXJzaW9uPSIxLjAiIGVuY29kaW5n
PSJ1dGYtOCI/Pgo+ID4gIDxyZXNvdXJjZXM+Cj4gPiAgICAgIDxwbHVyYWxzIG5hbWU9ImRlbGV0
ZV9lcnJvciI+Cj4gPiArICAgICAgICA8aXRlbSBxdWFudGl0eT0ib25lIj7ml6Dms5XliKDpmaQg
JWQg6aG577yaJXM8L2l0ZW0+Cj4gPiAgICAgICAgICA8aXRlbSBxdWFudGl0eT0ib3RoZXIiPuaX
oOazleWIoOmZpCAlZCDpobnvvJolczwvaXRlbT4KPgo+IFRoZXNlIGxvb2sgdG8gYmUgdGhlIHNh
bWUgYXMgdGhlICJvdGhlciIgY2FzZS4gQWRkaXRpb25hbCBxdWFudGl0eSBpdGVtcyBhcmUKPiBv
bmx5IG5lZWRlZCBpZiB0aGV5IGFyZSBkaWZmZXJlbnQ6Cj4KPiBodHRwczovL2RldmVsb3Blci5h
bmRyb2lkLmNvbS9ndWlkZS90b3BpY3MvcmVzb3VyY2VzL3N0cmluZy1yZXNvdXJjZSNwbHVyYWxz
LWl0ZW0tZWxlbWVudAo+Cj4gPiAgICAgIDwvcGx1cmFscz4KPiA+ICAgICAgPHBsdXJhbHMgbmFt
ZT0iZGVsZXRlX3N1Y2Nlc3MiPgo+ID4gKyAgICAgICAgPGl0ZW0gcXVhbnRpdHk9Im9uZSI+5Yig
6Zmk5LqGICVkIOmhuTwvaXRlbT4KPiA+ICAgICAgICAgIDxpdGVtIHF1YW50aXR5PSJvdGhlciI+
5Yig6Zmk5LqGICVkIOmhuTwvaXRlbT4KPiA+ICAgICAgPC9wbHVyYWxzPgo+ID4gICAgICA8cGx1
cmFscyBuYW1lPSJkZWxldGVfdGl0bGUiPgo+ID4gKyAgICAgICAgPGl0ZW0gcXVhbnRpdHk9Im9u
ZSI+5bey6YCJ5oupICVkIOmhuTwvaXRlbT4KPiA+ICAgICAgICAgIDxpdGVtIHF1YW50aXR5PSJv
dGhlciI+5bey6YCJ5oupICVkIOmhuTwvaXRlbT4KPiA+ICAgICAgPC9wbHVyYWxzPgo+ID4gICAg
ICA8cGx1cmFscyBuYW1lPSJpbXBvcnRfcGFydGlhbF9zdWNjZXNzIj4KPiA+ICsgICAgICAgIDxp
dGVtIHF1YW50aXR5PSJvbmUiPuWvvOWFpeS6hiAlZCDpobnvvIzor7vlj5bliLAgJWQg6aG5PC9p
dGVtPgo+ID4gICAgICAgICAgPGl0ZW0gcXVhbnRpdHk9Im90aGVyIj7lr7zlhaXkuoYgJWQg6aG5
77yM6K+75Y+W5YiwICVkIOmhuTwvaXRlbT4KPiA+ICAgICAgPC9wbHVyYWxzPgo+ID4gICAgICA8
cGx1cmFscyBuYW1lPSJpbXBvcnRfdG90YWxfc3VjY2VzcyI+Cj4gPiArICAgICAgICA8aXRlbSBx
dWFudGl0eT0ib25lIj7lr7zlhaXkuoYgJWQg6aG5PC9pdGVtPgo+ID4gICAgICAgICAgPGl0ZW0g
cXVhbnRpdHk9Im90aGVyIj7lr7zlhaXkuoYgJWQg6aG5PC9pdGVtPgo+ID4gICAgICA8L3BsdXJh
bHM+Cj4gPiAgICAgIDxwbHVyYWxzIG5hbWU9InNldF9leGNsdWRlZF9hcHBsaWNhdGlvbnMiPgo+
ID4gKyAgICAgICAgPGl0ZW0gcXVhbnRpdHk9Im9uZSI+JWQg5Liq5o6S6Zmk5bqU55SoPC9pdGVt
Pgo+ID4gICAgICAgICAgPGl0ZW0gcXVhbnRpdHk9Im90aGVyIj4lZCDkuKrmjpLpmaTlupTnlKg8
L2l0ZW0+Cj4gPiAgICAgIDwvcGx1cmFscz4KPiA+ICAgICAgPHN0cmluZyBuYW1lPSJhZGRfcGVl
ciI+5re75Yqg6IqC54K5PC9zdHJpbmc+Cj4gPiBAQCAtMzgsNyArNDQsNyBAQAo+ID4gICAgICA8
c3RyaW5nIG5hbWU9ImJhZF9jb25maWdfcmVhc29uX3Vua25vd25fYXR0cmlidXRlIj7lsZ7mgKfm
nKrnn6U8L3N0cmluZz4KPiA+ICAgICAgPHN0cmluZyBuYW1lPSJiYWRfY29uZmlnX3JlYXNvbl91
bmtub3duX3NlY3Rpb24iPuiKguacquefpTwvc3RyaW5nPgo+ID4gICAgICA8c3RyaW5nIG5hbWU9
ImJhZF9jb25maWdfcmVhc29uX3ZhbHVlX291dF9vZl9yYW5nZSI+5pWw5YC86LaF5Ye66IyD5Zu0
PC9zdHJpbmc+Cj4gPiAtICAgIDxzdHJpbmcgbmFtZT0iYmFkX2V4dGVuc2lvbl9lcnJvciI+5paH
5Lu25omp5bGV5ZCN5b+F6aG75Li6IC5jb25mIOaIliAuemlwPC9zdHJpbmc+Cj4gPiArICAgIDxz
dHJpbmcgbmFtZT0iYmFkX2V4dGVuc2lvbl9lcnJvciI+5omp5bGV5ZCN5b+F6aG75Li6IC5jb25m
IOaIliAuemlwPC9zdHJpbmc+Cj4gPiAgICAgIDxzdHJpbmcgbmFtZT0iY2FuY2VsIj7lj5bmtog8
L3N0cmluZz4KPiA+ICAgICAgPHN0cmluZyBuYW1lPSJjb25maWdfZGVsZXRlX2Vycm9yIj7ml6Dm
s5XliKDpmaTphY3nva4g4oCcJXPigJ08L3N0cmluZz4KPiA+ICAgICAgPHN0cmluZyBuYW1lPSJj
b25maWdfZXhpc3RzX2Vycm9yIj7igJwlc+KAnSDnmoTphY3nva7lt7LlrZjlnKg8L3N0cmluZz4K
PiA+IEBAIC02MCw3ICs2Niw3IEBACj4gPiAgICAgIDxzdHJpbmcgbmFtZT0iZGFya190aGVtZV9z
dW1tYXJ5X29uIj7mraPlnKjkvb/nlKjmmpfoibLvvIjpu5HlpJzvvInkuLvpopg8L3N0cmluZz4K
PiA+ICAgICAgPHN0cmluZyBuYW1lPSJkYXJrX3RoZW1lX3RpdGxlIj7kvb/nlKjmmpfoibLkuLvp
opg8L3N0cmluZz4KPiA+ICAgICAgPHN0cmluZyBuYW1lPSJkZWxldGUiPuWIoOmZpDwvc3RyaW5n
Pgo+ID4gLSAgICA8c3RyaW5nIG5hbWU9ImRlc2VsZWN0X2FsbCI+5YWo6YOo5Y+W5raIPC9zdHJp
bmc+Cj4gPiArICAgIDxzdHJpbmcgbmFtZT0idG9nZ2xlX2FsbCI+5Y+N6YCJPC9zdHJpbmc+Cj4g
PiAgICAgIDxzdHJpbmcgbmFtZT0iZG5zX3NlcnZlcnMiPkROUyDmnI3liqHlmag8L3N0cmluZz4K
PiA+ICAgICAgPHN0cmluZyBuYW1lPSJlZGl0Ij7nvJbovpE8L3N0cmluZz4KPiA+ICAgICAgPHN0
cmluZyBuYW1lPSJlbmRwb2ludCI+5a+556uv5Zyw5Z2APC9zdHJpbmc+Cj4gPgo+Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBXaXJlR3VhcmQgbWFp
bGluZyBsaXN0Cj4gV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQo+IGh0dHBzOi8vbGlzdHMuengy
YzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJk
QGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L3dpcmVndWFyZAo=
