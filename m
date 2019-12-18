Return-Path: <SRS0=Cs4w=2J=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FC0C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Dec 2019 01:20:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AB552176D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Dec 2019 01:20:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lenstra-fr.20150623.gappssmtp.com header.i=@lenstra-fr.20150623.gappssmtp.com header.b="edU7jpZr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AB552176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lenstra.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d9f4486;
	Thu, 19 Dec 2019 01:20:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6ec80c9b
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Dec 2019 10:41:43 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72f13a38
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Dec 2019 10:41:43 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id f4so4309008wmj.1
 for <wireguard@lists.zx2c4.com>; Wed, 18 Dec 2019 02:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lenstra-fr.20150623.gappssmtp.com; s=20150623;
 h=from:mime-version:date:message-id:subject:to
 :content-transfer-encoding;
 bh=ZG2QVQWuRy0obK+/mD3rNx3EoRu+ElnlAxZe4YKIZiA=;
 b=edU7jpZrNxHNEa3Oxu3j7KQ6YZvtJKt6AEcvz0hCBIqB7RTr8Ph/reR4Bdn8K1cwRC
 v+Q8n1h0ubp6wCk7GsP1P/QHiCuF/9MTj6RsgsX9rgl+1Kl4j6dANydr9aUDgD0gsjDX
 5FaWp9Bmd6/zg47B3ubIMxSiSVn049kpzypNMN3MPkhlqA3yLfO1AB3gsPBdBef1NoL/
 Jr3t6l0U4bZHtPNnuF4+M7MXg2eX057E+3rRFOTaUcQ79bXLxqKs3GQdQME4ieHOxxq3
 8y6WYT2/8DtzaQ7C/xLW409MaPcxXtxN4qSx5Mc3Bwex/wfpeG6yK6cKScgcjcVPZEjB
 8DUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:date:message-id:subject:to
 :content-transfer-encoding;
 bh=ZG2QVQWuRy0obK+/mD3rNx3EoRu+ElnlAxZe4YKIZiA=;
 b=cu2mYlAmuaRjRQvYnoAeOOUiGmmvJusCb4iBjdSBl0U/X4l4HyRIK0GcZkQOQLHxZ1
 Pk7jC12/DORopX7ARfrxUIWOgDtNVw4w/dHKFHiWqI5G/d4nM6t06MKRPTErwOKeDh/o
 6YoFUD8QVxRaZ6z70IAhDjyO5kNd1usufVTfrSTvikxoyntZGP9SVplF/h9SPEaUQEKy
 lXT38Ed5HYx3owv1x3zfN1ii1xlwK8558ycEuhjOZVRgcusJNnbZVr9+HgMktefPsHo/
 WjwYH9LXYjqIPhM+3ujgi6ErmLtH8uLxH6pYAk60wPUVuj+xoHyFcYQI3jEP8BDA7JVP
 pQWg==
X-Gm-Message-State: APjAAAVWlIXyVSwrUmIEzPXi1I8aze/cNOQQ2gPhmcuItK4PEKWxUUAb
 JXsDT1UYZpDdCYNhaq/hUrGNQkWwd21MeXccflP7hcLakBA=
X-Google-Smtp-Source: APXvYqyeP1eNECCoEdwlI2hOpq/IvRRwuY++aZBc2p82Qns2n24iM+BSftNKkYdeajIe9PSxH3qCNLF6zAecH8VW97Y=
X-Received: by 2002:a05:600c:20f:: with SMTP id
 15mr2463304wmi.128.1576665701585; 
 Wed, 18 Dec 2019 02:41:41 -0800 (PST)
Received: from 1058052472880 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Dec 2019 02:41:40 -0800
From: =?UTF-8?Q?R=C3=A9mi_Lapeyre?= <remi.lapeyre@lenstra.fr>
MIME-Version: 1.0
Date: Wed, 18 Dec 2019 02:41:40 -0800
Message-ID: <CAFsReqQf_kVBd_PROWBqiTi+VBXRXCv5pwd2SoAFqwZLxj-Q7w@mail.gmail.com>
Subject: MTU on wireguard-apple for IPv6
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Thu, 19 Dec 2019 02:20:26 +0100
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

SGksIHdlIGhhdmUgdXNlcnMgdGhhdCBhcmUgcmVwb3J0aW5nIG1hbnkgaXNzdWVzIHdoZW4gdXNp
bmcgdGhlCldpcmVHdWFyZCBjbGllbnQgb24gTWFjT1MgbGFwdG9wcyB3aXRoIElQdjYgbmV0d29y
a3MuIEl0IHNlZW1zIHRoYXQKbW9zdCBvZiB0aG9zZSBpc3N1ZXMgZGlzYXBwZWFyIHdoZW4gd2Ug
c2V0IHRoZSBNVFUgdG8gMTI4MCBpbiB0aGUKY29uZmlndXJhdGlvbi4KClNpbmNlIHRoZXkgYXJl
IHVzaW5nIGxhcHRvcHMsIHNvbWUgYXJlIGZyZXF1ZW50bHkgb24gYmFkbHkgYmVoYXZlZApuZXR3
b3Jrcy4gUmVhZGluZyB0aGUgc291cmNlIGNvZGUsIGl0IHNlZW1zIHRoYXQgdGhpcyBzaXR1YXRp
b24gaXMKaGFuZGxlZCBkaWZmZXJlbnRseSBvbiBpT1MgdnMgTWFjT1MgaW4gZ2VuZXJhdGVOZXR3
b3JrU2V0dGluZ3MoKToKCgrCoCDCoCDCoCDCoCBsZXQgbXR1ID0gdHVubmVsQ29uZmlndXJhdGlv
bi5pbnRlcmZhY2UubXR1ID8/IDAKCsKgIMKgIMKgIMKgIC8qIDAgbWVhbnMgYXV0b21hdGljIE1U
VS4gSW4gdGhlb3J5LCB3ZSBzaG91bGQganVzdCBkbwrCoCDCoCDCoCDCoCDCoCogYG5ldHdvcmtT
ZXR0aW5ncy50dW5uZWxPdmVyaGVhZEJ5dGVzID0gODBgIGJ1dCBpbgrCoCDCoCDCoCDCoCDCoCog
cHJhY3RpY2UgdGhlcmUgYXJlIHRvbyBtYW55IGJyb2tlbiBuZXR3b3JrcyBvdXQgdGhlcmUuCsKg
IMKgIMKgIMKgIMKgKiBJbnN0ZWFkIHNldCBpdCB0byAxMjgwLiBCb29ob28uIE1heWJlIHNvbWVk
YXkgd2UnbGwKwqAgwqAgwqAgwqAgwqAqIGFkZCBhIG5vYiwgbWF5YmUsIG9yIGlPUyB3aWxsIGRv
IHByb2JpbmcgZm9yIHVzLgrCoCDCoCDCoCDCoCDCoCovCsKgIMKgIMKgIMKgIGlmIG10dSA9PSAw
IHsKwqAgwqAgwqAgwqAgwqAgwqAgI2lmIG9zKGlPUykKwqAgwqAgwqAgwqAgwqAgwqAgbmV0d29y
a1NldHRpbmdzLm10dSA9IE5TTnVtYmVyKHZhbHVlOiAxMjgwKQrCoCDCoCDCoCDCoCDCoCDCoCAj
ZWxzZWlmIG9zKG1hY09TKQrCoCDCoCDCoCDCoCDCoCDCoCBuZXR3b3JrU2V0dGluZ3MudHVubmVs
T3ZlcmhlYWRCeXRlcyA9IDgwCsKgIMKgIMKgIMKgIMKgIMKgICNlbHNlCsKgIMKgIMKgIMKgIMKg
IMKgICNlcnJvcigiVW5pbXBsZW1lbnRlZCIpCsKgIMKgIMKgIMKgIMKgIMKgICNlbmRpZgrCoCDC
oCDCoCDCoCB9IGVsc2UgewrCoCDCoCDCoCDCoCDCoCDCoCBuZXR3b3JrU2V0dGluZ3MubXR1ID0g
TlNOdW1iZXIodmFsdWU6IG10dSkKwqAgwqAgwqAgwqAgfQoKCkRvZXMgYG5ldHdvcmtTZXR0aW5n
cy50dW5uZWxPdmVyaGVhZEJ5dGVzID0gODBgIG1lYW5zIHRoZSBNVFUgd2lsbAp1c2VkIGJlIHRo
ZSBvbmUgb2YgdGhlIGludGVyZmFjZSBtaW51cyA4MCBiaXRzIG9mIG92ZXJoZWFkIGZvciB0aGUK
V2lyZUd1YXJkIHByb3RvY29sPwoKU29tZSBvZiBvdXIgdXNlcnMgd2hlcmUgdGV0aGVyaW5nIG92
ZXIgdGhlaXIgcGhvbmUgY29ubmVjdGlvbiBzbyBpdApzZWVtcyB0aGF0IDEyODAgaXMgYXBwcm9w
cmlhdGUgaW4gdGhhdCBjYXNlLCBidXQgSeKAmW0gY29uZnVzZWQgYXMgdG8Kd2h5IGNvbm5lY3Rp
b25zIG5vdCBnb2luZyB0aHJvdWdoIHRoZSBXaXJlR3VhcmQgdHVubmVsIHdoZXJlIG5vdAppbXBh
Y3RlZCBpbiB0aGF0IGNhc2UuCgpEb2VzIGl0IHJlYWxseSBtYWtlIHNlbnNlIHRvIHRyZWF0IGxh
cHRvcHMgYW5kIGlPUyBkZXZpY2VzIGRpZmZlcmVudGx5CmFyZSBzb21ldGltZSBjb25uZWN0ZWQg
dG8gcmFuZG9tIG5ldHdvcmtzPyBTaG91bGQgdGhpcyBiZSBjaGFuZ2VkIHRvCmBuZXR3b3JrU2V0
dGluZ3MubXR1ID0gTlNOdW1iZXIodmFsdWU6IDEyODApYCBpbiBhbGwgY2FzZXM/CgpSw6ltaQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQg
bWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJj
NC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
