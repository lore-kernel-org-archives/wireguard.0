Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE65AC33C9E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 07:57:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8CEE20702
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 07:57:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fu9ZeXmc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8CEE20702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35543e2a;
	Thu, 30 Jan 2020 07:56:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08efbc89
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 07:56:51 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b02b707
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jan 2020 07:56:51 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id f129so3039300wmf.2
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jan 2020 23:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=n4LzGOwxvlrV1ZmwVCkhB9DwO5gDvAjg+AZNjNPoYw0=;
 b=Fu9ZeXmc1yD+8oDuQmu6NNG2AqqI1okCFBuO5gXXXYL51Y3oSt9RuIgPODjM3Svbp/
 yiktVVdN2m6QHk6AGUe8iPtBAYGmscQIpxitbDcgqRol02ocLaCa3GS4MB1Pg6NAICZD
 VvR8CnHDyE21NA2g+VEt4sP8JMNc9YfHlcWDEsBigh9rWIRqy38u1bmHZJvrg4riwD7g
 kyUe5qfd0jA44d45JiIwMzpyrIvtiny2q4o9M+kaMwKc0Gai2gsJkD07DOQqlyPajilf
 no53EfBkUtwdPU+gGyyqorIKbwqSDTtVPft6MIF3nD899wi61e2Ni54uElMuRrFHGLuk
 TAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=n4LzGOwxvlrV1ZmwVCkhB9DwO5gDvAjg+AZNjNPoYw0=;
 b=qM4L2g7Q9uOMnMIhMt/OrNBDpmAQiM6giX0ZOKtRyYpNWCq4VEymLDd9dgQX6GpXUm
 HZc1Xq8E/pzc4YYiJLQiXIz/OKZtfGWecCtTFpFi5qaZEENs99jBY6qTJhZ2eiXS0Ca5
 Cy30NgccTvF0QU5odHWXMPTL18s60wpDoFOjITWqoaLFWFWQw8rR494tJo+LpbQeXdaE
 i9bKj+NF1aAeJ2OFcyKoeIAvq7BLGkRHYHojxZTzFNozBBopFl/Qdc5qXY+MOwQ36ob4
 NbrJgLGrkrqu73tsSt5WY4OUQI8BJKb81YosBV0KNJoItaNlhtTgHoLEj8pK+3H5WuLS
 uEVA==
X-Gm-Message-State: APjAAAX+GV8mRakQBxfVj5dGRrRBkeCysAGZIej7hYFmCxwvtpt1FBED
 VT4zHNYB8PMUjb8f16q+oTqJNR9oWWNMXQ==
X-Google-Smtp-Source: APXvYqxDLpLjTuFBkdElHcWrrqJIqkI21gEcE5ay4zfgj3VYD803HMEC4RwRXL22tXHDkUGjpB7Pzg==
X-Received: by 2002:a05:600c:2207:: with SMTP id
 z7mr3730479wml.167.1580371017288; 
 Wed, 29 Jan 2020 23:56:57 -0800 (PST)
Received: from [192.168.1.239] (185-14-210-91.dsl.cnl.uk.net. [185.14.210.91])
 by smtp.gmail.com with ESMTPSA id
 z3sm6303577wrs.94.2020.01.29.23.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2020 23:56:56 -0800 (PST)
From: Martin <martinmoen@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: ArchLinux wireguard install
Date: Thu, 30 Jan 2020 07:56:55 +0000
Message-Id: <7DA91B98-C518-4A57-BF56-CF77B2D04F64@gmail.com>
References: <c78df5b34a8e002c031e8dc6262bf9e3e35ea1a4.camel@dreamofjapan.de>
In-Reply-To: <c78df5b34a8e002c031e8dc6262bf9e3e35ea1a4.camel@dreamofjapan.de>
To: planung@dreamofjapan.de
X-Mailer: iPhone Mail (17C54)
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

U29ycnksIEkgbWVhbnQgcG9zdCB0aGUgc2FtZSBxdWVzdGlvbiB5b3UgcG9zdGVkIGhlcmUgaW4g
dGhlIEFyY2ggZm9ydW1zLiAKCkkgdXNlIHRoZSBtb2R1bGUgYW5kIHRvb2xzIGN1cnJlbnRseSBh
bmQgaXTigJlzIGdyZWF0LCBob3dldmVyIEkganVzdCB1c2UgdGhlIHdnLXF1aWNrIHN5c3RlbWQg
dG8gZGVhbCB3aXRoIGJyaW5naW5nIGl0IHVwIG9uIGJvb3QsIEkgZG9u4oCZdCBsaWtlIG5tLgoK
SSBzdXNwZWN0IG9uY2UgaXTigJlzIGluIHRoZSBrZXJuZWwgdGhlIG1haW50YWluZXIgaW4gYXJj
aCB3aWxsIHJlbW92ZSB0aGUgbW9kdWxlIHRocm91Z2ggYW4gdXBkYXRlIGZvciA1LjYrIHZlcnNp
b25zLgoKPiBPbiAzMCBKYW4gMjAyMCwgYXQgMDc6NDAsIEZyYW5rIFRvcm5hY2sgPHBsYW51bmdA
ZHJlYW1vZmphcGFuLmRlPiB3cm90ZToKPiAKPiDvu79JIHdvdWxkIG5vdCBsaWtlIHRvIHVzZSBl
eHRyYSB2ZW5kb3Igc29mdHdhcmUgaWYgdGhlcmUgYXJlIG90aGVyIHdheXMuCj4gVW5mb3J0dW5h
dGVseSBJIGNhbm5vdCBmaW5kIHlvdXIgcG9zdCBpbiB0aGUgZm9ydW0uCj4gLS0gCj4gTWl0IGZy
ZXVuZGxpY2hlbiBHcsO8w59lbgo+IEZyYW5rIFRvcm5hY2sKPiAKPiAKPiAtLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ICJTaGVsdGVyLCIgd2hhdCBhIG5pY2UgbmFtZSBmb3IgZm9yIGEg
cGxhY2Ugd2hlcmUgeW91IHBvbGlzaCB5b3VyIGNhdC4KPiAKPiBBbSBEb25uZXJzdGFnLCBkZW4g
MzAuMDEuMjAyMCwgMDc6MDMgKzAwMDAgc2NocmllYiBNYXJ0aW46Cj4+IFRha2UgYSBsb29rIGF0
IHRoZSBtdWxsdmFkIHByb2dyYW0gZm9yIGFyY2ggaW4gdGhlIEFVUi4KPj4gQnV0IEknZCBhbHNv
IGFzayBpbiB0aGUgTmV0d29ya2luZyBzZWN0aW9uIG9uIHRoZSBhcmNobGludXggZm9ydW1zCj4+
IHJlZ2FyZGluZyB0aGUgdXBncmFkZSBwYXRoIGZvciB0aGUgbW9kdWxlIGFuZCBrZXJuZWwuCj4+
IGh0dHBzOi8vYmJzLmFyY2hsaW51eC5vcmcvdmlld2ZvcnVtLnBocD9pZD04Cj4+IAo+Pj4gT24g
VGh1LCBKYW4gMzAsIDIwMjAgYXQgMjowOSBBTSBGcmFuayBUb3JuYWNrIDwKPj4+IHBsYW51bmdA
ZHJlYW1vZmphcGFuLmRlPiB3cm90ZToKPj4+IGhlbGxvIGFsbCwKPj4+IAo+Pj4gSSBhcG9sb2dp
emUgaW4gYWR2YW5jZSBmb3IgdGhlIHN0dXBpZCBxdWVzdGlvbiwgYnV0IEkgYW0gdmVyeQo+Pj4g
dW5zdXJlLgo+Pj4gSSByZWNlaXZlZCBhIHZvdWNoZXIgZm9yIGEgVlBOIHNlcnZpY2UgYXQgYSB0
cmFkZSBmYWlyIGFuZCB3b3VsZAo+Pj4gbGlrZQo+Pj4gdG8gdGVzdCBpdC4gVGhlIHNlcnZpY2Ug
TXVsbHZhZCBWUE4gdXNlcyB0aGUgdGVjaG5vbG9neSBXaXJlR3VhcmQuCj4+PiBBbmQKPj4+IEkg
dXNlIEFyY2hMaW51eC4KPj4+IAo+Pj4gTXkgcXVlc3Rpb24gd2FzIGNyZWF0ZWQgYnkgdGhlIEFy
Y2hMaW51eCBXaWtpLiBUaGVyZSBpdCBhbHJlYWR5Cj4+PiByZWZlcnMKPj4+IHRvIHRoZSBrZXJu
ZWwgNS42LCB3aGljaCBzaG91bGQgc3VwcG9ydCB0aGlzIGZ1bmN0aW9uIHdpdGhvdXQgYQo+Pj4g
bW9kdWxlLgo+Pj4gTm93IG15IHF1ZXN0aW9uIGlzLCBpcyBpdCBiZXR0ZXIgdG8gd2FpdCBmb3Ig
dGhpcyBrZXJuZWwgb3IganVzdAo+Pj4gaW5zdGFsbCB0aGUgbW9kdWxlPyBXb3VsZCBpdCBiZSBh
IHByb2JsZW0gaWYgSSBmb3Jnb3QgdG8gZGVsZXRlIHRoZQo+Pj4gbW9kdWxlIGFnYWluPyBJIGFt
IHVzaW5nIHRoZSBOZXR3b3JrIE1hbmFnZXIsIHdoYXQgZG8gSSBuZWVkIHRvIGJlCj4+PiBhd2Fy
ZSBvZj8KPj4+IAo+Pj4gTWFueSB0aGFua3MgaW4gYWR2YW5jZSBhbmQgdGhhbmsgeW91IGZvciBk
ZXZlbG9waW5nIHRoaXMgdG9vbC4KPj4+IAo+Pj4gCj4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCldpcmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJk
QGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xpc3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L3dpcmVndWFyZAo=
