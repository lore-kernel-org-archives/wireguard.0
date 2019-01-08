Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4748C43444
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 08:22:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4112220665
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 08:22:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uH3dmvOn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4112220665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e0863ed;
	Tue, 8 Jan 2019 08:19:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 855b3e95
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 08:19:21 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94871522
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 08:19:21 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id 101so1523401pld.6
 for <wireguard@lists.zx2c4.com>; Tue, 08 Jan 2019 00:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3aB+yAGSdyu6TAdcXO05gmxt5PwWVfxEzXGNZftGc8M=;
 b=uH3dmvOnLSFCVsqjZMYw3d34DgUiwoXaHe7IPQvSOqnMM//S1AE/1dU2+Z4SJvewXd
 4YsV8c5XpHaDl5xn2dymjjMaUfSDGbxOamJvy6xtYf++JlBw5uDg/dHRITC8U7toeB52
 MiSCD7hYsUIs+5aQr/UqoHLpvg5WZ6MjnzGGk6KLcRxIJ+qgZzbfUmEswwUzrecvMuZ1
 qZQgsrPfjJnG79xdStqPFPxZGUtFZiomqA21yArHko+8PxwYD0rW5q1ABSy3Oe2T6x5M
 oDMs3Be9nrej+Nv340oIG0JUkamiqa2eUiKDWS312zGEtP9e1oRhH7j5R/Lzlqd2coi4
 OcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3aB+yAGSdyu6TAdcXO05gmxt5PwWVfxEzXGNZftGc8M=;
 b=ZMzDBRg7vLSsOK1fdXPHtT1YZxhnEMbhMolsMIyyKGWf9h+HNPn+x0c5bd3EdoQCwx
 5dXK0YlLAds6P5VUGeE9N1aBzyAEHY8ypZbp1XTTG6HobwdDNnLlGiWnu4MwZ1lhj5yx
 TroaXZbpm/NGJeWgudGC15+jCnl5wNGqZg1mMTPWPJqTA0qS7DUuer6FFIKwYR49USG4
 52DPek7/98uYMd/yssSTiCnlPZci7284B+1FXFYQe/6OoXdMq4rM6XComOfYCzBjo9Sn
 dDeu7M4Zv16d8bOuUu+2AT5pGbwoNsxRzcWPMcT98NcW5ihf/5sQIR1NXbR26MKXBtn6
 kMjA==
X-Gm-Message-State: AJcUuke0gZd/181U5Kx+B76InHqOR8GdXZIjj/Fr5kv7XNVPc/Ut+zWx
 GWN0sY4qNuwze+s7LY+jK/nEG0fcFGvenza3gWF8D63e
X-Google-Smtp-Source: ALg8bN5Z2YgUbPVu8FB235IROdmJK0FCpBk5TusH1K5+6H6Ek9myVpm142f0vjKW8SBndhx9dcw4+jwwvtwoxUviRXA=
X-Received: by 2002:a17:902:7481:: with SMTP id
 h1mr799615pll.341.1546935747521; 
 Tue, 08 Jan 2019 00:22:27 -0800 (PST)
MIME-Version: 1.0
References: <8320FB7C-4C2A-4644-A25C-A8380914966C@gmail.com>
In-Reply-To: <8320FB7C-4C2A-4644-A25C-A8380914966C@gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Tue, 8 Jan 2019 09:22:16 +0100
Message-ID: <CAKXLc7eHiDmh8S4VBr_PcmDw9LFKAPj7VQuYse9HvVZGoAs8TA@mail.gmail.com>
Subject: Re: Connections dropped after long in-activity
To: Muhammad Naseer Bhatti <nbhatti@gmail.com>
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

T24gVHVlLCBKYW4gOCwgMjAxOSBhdCAzOjIwIEFNIE11aGFtbWFkIE5hc2VlciBCaGF0dGkgPG5i
aGF0dGlAZ21haWwuY29tPiB3cm90ZToKPiBGYWNpbmcgYSBzdHJhbmdlIGlzc3VlIHdpdGggc2lu
Z2xlIGFuZCBzb21ldGltZXMgd2l0aCBkb3VibGUgTkFUIHdpdGggY2xpZW50IHJ1bm5pbmcgV2ly
ZWd1YXJkIHdpdGggdGhlIHNlcnZlciBvbiBQdWJsaWMgSVAgYWRkcmVzcy4gSWYgY2xpZW50IHJl
bWFpbnMgaWRsZSBmb3IgbG9uZyB0aW1lIChtb3JlIHRoYW4gMTUgbWludXRlcykgTkFUIHRhYmxl
IGluIHRoZSByb3V0ZSBpcyBkcm9wcGVkIGZvciB0aGF0IHBvcnQgY29tYmluYXRpb24gKGF0IHRo
ZSBJU1Agc2lkZSkgc2luY2UgdGhlcmUgaXMgbm8gYWN0aXZpdHksIGFuZCBXaXJlZ3VhcmQgZG9l
cyBub3QgcmUtZXN0YWJsaXNoZXMgdGhlIGNvbm5lY3Rpb24gb3IgdHJpZXMgdG8gcmVmcmVzaC4g
SSBhbSBub3Qgc3VyZSB3aHkgS2VlcCBhbGl2ZXMgc2V0IHRvIDMwIHNlY29uZHMgbm90IHdvcmtp
bmcgZWl0aGVyIHNpbmNlIGlmIEtlZXAgQWxpdmVzIGFyZSBzZXQgdGhpcyBzaG91bGQgbm90IGhh
cHBlbi4KPgpUaGlzIHNob3VsZCBub3QgYmUgdGhlIGNhc2UsIGlmIGtlZXAtYWxpdmUgaXMgZW5h
YmxlZC4gQnV0IG5vdGUgdGhhdAppdCBpcyBvZmYgYnkgZGVmYXVsdCwgZS5nLiBtYW4gcGFnZQoK
VGhlIHVzZSBvZiBwZXJzaXN0ZW50LWtlZXBhbGl2ZSBpcyBvcHRpb25hbCBhbmQgaXMgYnkgZGVm
YXVsdCBvZmY7CnNldHRpbmcgaXQgdG8gMCBvciAib2ZmIiBkaXNhYmxlcyBpdC4gIE90aGVyd2lz
ZSBpdCByZXBy0LVzZW50cywgaW4Kc2Vjb25kcywgYmV0d2VlbiAxIGFuZCA2NTUzNSBpbmNsdXNp
dmUsIGhvdyBvZnRlbiB0byBzZW5kIGFuCmF1dGhlbnRpY2F0ZWQgZW1wdHkgcGFja2V0IHRvIHRo
ZSBwZWVyLCBmb3IgdGhlICBwdXJwb3NlICBvZiBrZWVwaW5nIGEKc3RhdGVmdWwgZmlyZXdhbGwg
b3IgTkFUIG1hcHBpbmcgdmFsaWQgcGVyc2lzdGVudGx5LiBGb3IgZXhhbXBsZSwgaWYKdGhlIGlu
dGVyZmFjZSB2ZXJ5IHJhcmVseSBzZW5kcyB0cmFmZmljLCBidXQgaXQgbWlnaHQgYXQgYW55dGlt
ZQpyZWNlaXZlIHRyYWZmaWMgZnJvbSBhIHBlZXIsIGFuZCBpdCBpcyAgYmVoaW5kICBOQVQsICB0
aGUgaW50ZXJmYWNlCm1pZ2h0ICBiZW5lZml0ICBmcm9tIGhhdmluZyBhIHBlcnNpc3RlbnQga2Vl
cGFsaXZlIGludGVydmFsIG9mIDI1CnNlY29uZHM7IGhvd2V2ZXIsIG1vc3QgdXNlcnMgd2lsbCBu
b3QgbmVlZCB0aGlzLgoKV2hhdCBkb2VzIHRoaXMgY29tbWFuZCAocmVwbGFjZSA8SU5URVJGQUNF
PiB3aXRoIHlvdXJzKSBzYXk6CndnIHNob3cgPElOVEVSRkFDRT4gcGVyc2lzdGVudC1rZWVwYWxp
dmUKCj4gSXMgdGhpcyB0aGUgZGVzaXJlZCBiZWhhdmlvciBvciBhbSBJIG1pc3Npbmcgc29tZXRo
aW5nIGhlcmU/Cj4KRG8gYSBwYWNrZXQgZHVtcC9jYXB0dXJlIGFuZCBvYnNlcnZlIHRoYXQgdGhl
cmUgaXMgaW5kZWVkIHRyYWZmaWMKKGtlZXAtYWxpdmVzKSBnb2luZyBmcm9tIHRoZSBjbGllbnQg
KHdpcmVzaGFyaywgdGNwZHVtcCwgZXRjKS4gSWYgeW91CnVzZSBpcHRhYmxlcywgeW91IGNhbiBj
aGVjayBwYWNrZXQgY291bnQgZ29pbmcgdGhyb3VnaCB3ZyBpbnRlcmZhY2UuCgpDaGVlcnMsCkth
bGluLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJl
R3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0
cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
