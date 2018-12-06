Return-Path: <SRS0=90jI=OP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F259DC04EB8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:14:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8915720989
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Dec 2018 23:14:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jF56/+Qx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8915720989
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28b703e5;
	Thu, 6 Dec 2018 23:05:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2da2258f
 for <wireguard@lists.zx2c4.com>; Thu, 6 Dec 2018 00:12:06 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 527da4de
 for <wireguard@lists.zx2c4.com>; Thu, 6 Dec 2018 00:12:06 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id b14so18584120edt.6
 for <wireguard@lists.zx2c4.com>; Wed, 05 Dec 2018 16:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=seJ4VzJ5MZl8s7zot8Qp2eqT08AHBeLWNfMbonJ+Gus=;
 b=jF56/+QxrudhpzTDleUsMuKu/GsEwIPZZZG5o84c+H+IG9oJA/Fi6oP98k5nK3t25K
 wJNNH6w0FhiBNtzoHpp5eSjE5MoCSCgvdQrTPZimnM+3EPUBu3oaMjFRVCOXvK7VdNd2
 Syof6+TIPRzPRF4zE5+KuvEa+E/mSN1RsYL2AIISasHtguuaQ31eBbxls78sYu7bMPtW
 LV0khh/0ovPo8Fi3jJgSedKMlein9AKh0D2VLlHD7kAry5vOqJEePo6OCPSHhP/G5QTU
 Y9YQ+mRSV667ByQJMWzz6upnz0heirsieLFMSwURH3WUoqkdwFrubZA1JVDwa1SLtThT
 dkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=seJ4VzJ5MZl8s7zot8Qp2eqT08AHBeLWNfMbonJ+Gus=;
 b=pYevneL+GUwpGzKT6l1YlqCL4cXTVa/74qHqxvhq5o/7nZpVVDsISRWa22YG7icQ3L
 hM2Wy7q5iUmMhduzLHKu7NKqeblygCgy7Mna2HubFj+eau0RR32LfG0DWhTnktLV7wf7
 IpgvIw7/dAIm/JLeYRSRcc40bvb2gPconHvFkfN7tlvqTAO2uvB1amA2coNn+cNGeelG
 +u9AsEGROlMmX0xOhhTGBJAb7qiiXANhqZ69yfaDv2zLJp7rRulQpiNU6q3pI7E3JhO6
 DDI9lGFEKTDhAtVCTQpCCG48WP61ncfISkk9P4Pw+59D3Z6ca49Ohh6n2/CfShQ+yHEy
 1f3w==
X-Gm-Message-State: AA+aEWYaS6b2STr3CWjlAcNugan2iPb78ae4bVtGvMFmrh7e4ahoxIsR
 kd7aVqAvzxCAOu8V2fHuRRAQ70eBvdQikw==
X-Google-Smtp-Source: AFSGD/VNAgNn22VVVEDI/wir0dm7F167zFyltin4Esrq5dBYaXFxgBVHOFkzVhM/h4lkayqZVtlIkg==
X-Received: by 2002:a17:906:6898:: with SMTP id
 n24-v6mr19861257ejr.189.1544055610255; 
 Wed, 05 Dec 2018 16:20:10 -0800 (PST)
Received: from [192.168.0.27] (188-141-65-102.dynamic.upc.ie. [188.141.65.102])
 by smtp.googlemail.com with ESMTPSA id
 r8-v6sm3358179ejb.52.2018.12.05.16.20.09
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Dec 2018 16:20:09 -0800 (PST)
From: Graham Agnew <graham.agnew@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: wg troubles on ubuntu 14.04, MacOS and iOS
Message-Id: <FFA4EA44-FDE2-4BC5-9C96-2A15277F0A20@gmail.com>
Date: Thu, 6 Dec 2018 00:20:05 +0000
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.9.1)
X-Mailman-Approved-At: Fri, 07 Dec 2018 00:05:17 +0100
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

SGksCgpJIGluc3RhbGxlZCBXaXJlZ3VhcmQgb24gVWJ1bnR1IDE0LjA0IHVzaW5nIHRoZSBQUEEg
b24gTGF1bmNocGFkIGFuZCB0aGUgd2lyZWd1YXJkLXRvb2xzIG9uIG15IE1hYy4gIEkgY2FuIGdl
dCBpdCB0byB3b3JrIHdpdGggYSB2ZXJ5IHNpbXBsZSBzZXR1cCBhbmQgdXNpbmcgd2ctcXVpY2sg
b3Ig4oCcd2cgc2V0Y29uZuKAnS4gIEl04oCZcyByZWFsbHkgZ3JlYXQgaG93IHNpbXBsZSBpdCBp
cy4KCkkgZG9u4oCZdCBoYXZlIGFzIG11Y2ggbHVjayB3aXRoIHRoZSBjb21tYW5kIGxpbmUg4oCc
d2cgc2V04oCdOyBpdCBkb2VzbuKAmXQgbGlrZSBwYXJhbWV0ZXJzIGxpa2UgYWxsb3dlZC1pcHMg
YW5kIHN1Y2guICBJcyB0aGlzIGEga25vd24gaXNzdWU/ICBBbmFseXNpbmcgd2ctcXVpY2ssIGl0
IGxvb2tzIGxpa2UgaXQgcGlwZXMgdGhlIGNvbmZpZ3VyYXRpb24gaW50byB0aGUgIndnIHNldGNv
bmbigJ0gY29tbWFuZC4gCgpJ4oCZbSBhbHNvIGhhdmluZyBwcm9ibGVtcyB3aGVuIEkgaGF2ZSB0
d28gcGVlcnMuICBJIGhhdmUgIkFsbG93ZWRJUHMgPSAwLjAuMC4wLzAiIGZvciBib3RoIGluIHRo
ZSAuY29uZiBmaWxlLCBidXQgdGhpcyBpcyBvbmx5IGFwcGxpZWQgdG8gdGhlIHNlY29uZCBwZWVy
LiAgVGhlIGZpcnN0IHBlZXIgaGFzIOKAnChub25lKeKAnSBzaG93biBhcyBpdHMgQWxsb3dlZElQ
cyB3aXRoIG9idmlvdXMgY29uc2VxdWVuY2VzLiAgSXMgdGhpcyBhbHNvIGEga25vd24gaXNzdWU/
ICBJIHdhcyB0cnlpbmcgdG8gYWRkIG15IGlQaG9uZSBhcyBhIHNlY29uZCBwZWVyIHVzaW5nIHRo
ZSBUZXN0RmxpZ2h0IGFwcC4gIEkgY291bGRu4oCZdCBnZXQgdGhpcyB0byB3b3JrLCBldmVuIHdo
ZW4gSSB0cmllZCB0byBtYWtlIGEgc2Vjb25kIGludGVyZmFjZSBvbiB0aGUgVWJ1bnR1IHNlcnZl
ciBhcyBhIHdvcmthcm91bmQuICBJcyB0aGVyZSBhIHdheSB0byBkaWFnbm9zZSB0aGUgaXNzdWU/
CgpJ4oCZbSBhbHNvIHVuc3VyZSBob3cgdGhlIEFsbG93ZWRJUHMgc2V0dGluZyBpcyBtZWFudCB0
byB3b3JrLiAgSW5pdGlhbGx5IEkgdGhvdWdodCBpdCB3YXMgYSBsaXN0IG9mIGFkZHJlc3NlcyB0
aGUgcGVlciB3YXMgYWxsb3dlZCB0byBjb25uZWN0IHRvLCBidXQgdGhlIGRvY3VtZW50YXRpb24g
c2VlbXMgdG8gc3VnZ2VzdCBpdOKAmXMgYSBsaXN0IHRoYXQgdGhlIHBlZXIgY2FuIGNvbm5lY3Qg
ZnJvbS4gIE9yIGlzIGl0IGEgcmFuZ2Ugb2Ygc291cmNlIElQcyB0aGF0IHRoZSByZWNlaXZlciB3
aWxsIGFjY2VwdCBwYWNrZXRzIGZyb20/ICBVc2luZyAwLjAuMC4wLzAgc2VlbXMgdG8gbWVzcyB1
cCBteSBuZXR3b3JrIGNvbmZpZ3VyYXRpb24sIHJvdXRpbmcgdGFibGVzIGV0YyBhbmQgSSB3b25k
ZXIgaWYgaXTigJlzIHNvbWUg4oCcc21hcnRz4oCdIGluIHdnLXF1aWNrIEkgaGF2ZW7igJl0IHVu
ZGVyc3Rvb2QuCgpBcG9sb2dpZXMgaWYgdGhlc2UgYXJlIG5vb2IgcXVlc3Rpb25zIHRoYXQgc3Rl
bSBmcm9tIGEgbGFjayBvZiBrbm93bGVkZ2UuICBJIGZlZWwgSSBuZWVkIHRvIGdldCBkZWVwZXIg
aW50byBpcHRhYmxlcyBldGMgdG8gZnVsbHkgdW5kZXJzdGFuZCB0aGlzLgoKQ2hlZXJzLApHcmEK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJk
IG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengy
YzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
