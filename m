Return-Path: <SRS0=gQ6O=UF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D65C28EB3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 20:56:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CB0B208C3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 20:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mSaJobqw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CB0B208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9393314b;
	Thu, 6 Jun 2019 20:56:35 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 462b7323
 for <wireguard@lists.zx2c4.com>; Thu, 6 Jun 2019 20:56:34 +0000 (UTC)
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ebfc281c
 for <wireguard@lists.zx2c4.com>; Thu, 6 Jun 2019 20:56:34 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id g18so2412710qkl.3
 for <wireguard@lists.zx2c4.com>; Thu, 06 Jun 2019 13:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:date:subject:message-id
 :references:to;
 bh=aWNsoXuJeB+yHWz5QOA2f209a+uVq9tMpTC8iMS/tYc=;
 b=mSaJobqwYZJNHb9isVyjGS1XdlwmbnAyk+FMiITEJ45yB+95BelYkIkSQ5R1EFp1aa
 4whV4qMQdHk4iHxrsN7X4y2wo5s6xJhi31Ht/OE1d5RVEiCgYrqzedL2ndG0uXLHyZJG
 Unl8/QvLG/EVrZh/oI2crY0LjGcmmIHbTrs7FULrvlzm+HNCGOBdKBLhUXdJb4va8+2J
 35LulIeS00zgqSGNbo1yIh6G/HMIcTbVE8+LhIHMUEgsyxREthDnwCR4r/hHoOhVOToB
 /mvEh4rqKbWSw4KX4b5RdwgZXJZcObMgC2eKGzBXUes1S9xK5OcXIhPX+tbN/F98gaxj
 jydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version:date
 :subject:message-id:references:to;
 bh=aWNsoXuJeB+yHWz5QOA2f209a+uVq9tMpTC8iMS/tYc=;
 b=JV9APubO7BlvMpT5JQ/XlD0MrL8SQbZ3bEVbOn+n+bRbs0Mu4I7/a7VWuKC5+yKzrf
 sHfPKVg4slAl4NW/JTQHUSiQ+4GbScQ93XeBSJNXvLqyp1lRvoZ0a5qfgqxWfumxouWL
 CeXotMf2lN9VjtvYvN0DC5yJvBSAeBsf1HKvNfvTd/04WEHjiY39++2iJG+tWSDUipmx
 0MXQRffmCLQku1AmSOcP6SGLqOrz5QCfWnzVRzgCqG7ZnoN6BASoG0BlCP38bRgQItAp
 2XsthoTfh7Dd8Abu7Mo9HteDrP7MdB6xId4zKmD1J845JonIDmcr9q6JGHxWvSesQXGg
 deSg==
X-Gm-Message-State: APjAAAVtHNTg2f1IIzT+ks+fqfetqoQ3gibv32E+GQRkZu3J7ypMSAz5
 QAuvWKK57r85a3jpqOp2qVjGWwrA
X-Google-Smtp-Source: APXvYqysV28riSx1gZiO/L5dGeD4NNDqagnsz1gGAAREpa5In1HDwFn27KNXFb+AmWnbWKy174tLvg==
X-Received: by 2002:a37:6112:: with SMTP id v18mr41852529qkb.126.1559854593268; 
 Thu, 06 Jun 2019 13:56:33 -0700 (PDT)
Received: from [192.168.86.182] (c-73-180-230-2.hsd1.va.comcast.net.
 [73.180.230.2])
 by smtp.gmail.com with ESMTPSA id 15sm52238qtf.2.2019.06.06.13.56.32
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 13:56:32 -0700 (PDT)
From: George Walker <georgewalkeriv@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 6 Jun 2019 16:56:32 -0400
Subject: Re: Wiregaurd integration to private project
Message-Id: <366F9A63-5442-447D-8ED8-351C65262E70@gmail.com>
References: <F570EAD7-B0C4-4083-BBA9-1D9DD637A6BD@gmail.com>
To: wireguard@lists.zx2c4.com
X-Mailer: iPhone Mail (16F203)
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

U29ycnksIGZvcmdvdCB0byBjb3B5IHRoZSBsaXN0LgoKPiBJQU5BTCwgYnV0IHVuZGVyIEdQTHYy
IGFzIEkgdW5kZXJzdGFuZCBpdCwgeW91IGNhbiBtYWtlIGFueSBtb2RpZmljYXRpb25zIHByaXZh
dGVseSBmb3IgeW91ciBvd24gdXNlLCBpLmUuLCBzbyBsb25nIGFzIHlvdSBkb27igJl0IGhhdmUg
Y3VzdG9tZXJzIHJ1bm5pbmcgaXQuIAo+IAo+IElmIHlvdSBkbyBoYXZlIGN1c3RvbWVycyB3aG8g
d2lsbCBiZSBydW5uaW5nIGl0LCBwZXJoYXBzIHlvdSBjb3VsZCBtYWtlIEphc29uIGFuIG9mZmVy
IGZvciBhIGNvbW1lcmNpYWwgbGljZW5zZS4gSSBoYXZlbuKAmXQgc2VlbiB0aGF0IHF1ZXN0aW9u
IGNvbWUgdXAuCj4gCj4gQSB0aGlyZCBvcHRpb24gaXMgQm9yaW5nVHVuLCBhIHBlcm1pc3NpdmVs
eSBsaWNlbnNlZCB1c2Vyc3BhY2UgV2lyZWd1YXJkIGltcGxlbWVudGF0aW9uIGZyb20gQ2xvdWRm
bGFyZS4gT25lIHdvdWxkIGV4cGVjdCBwZXJmb3JtYW5jZSBmb3IgdXNlcnNwYWNlIGltcGxlbWVu
dGF0aW9ucyB0byBiZSBsb3dlciB0aGFuIGZvciB0aGUga2VybmVsIG1vZHVsZSwgYnV0IHBlcmhh
cHMgd2l0aCBzb21lIHdvcmsgdG8gaW50ZWdyYXRlIG5ldG1hcCBvciBJbnRlbCBEUERLIGl0IGNv
dWxkIGdldCBwcmV0dHkgY2xvc2UuCj4gCj4gRm91cnRoLCBpZiB5b3UgcG9ydCB0aGUga2VybmVs
IG1vZHVsZSB0byBhIHBlcm1pc3NpdmVseSBsaWNlbnNlZCBrZXJuZWwgbGlrZSBOZXRCU0Qgb3Ig
RnJlZUJTRCwgaXTigJlzIGNvbmNlaXZhYmxlIEphc29uIHdvdWxkIHdvcmsgd2l0aCB5b3Ugb24g
dGhlIGxpY2Vuc2UuIElmIEkgcmVjYWxsIGNvcnJlY3RseS4gZWFybHkgaW4gV2lyZWd1YXJk4oCZ
cyBkZXZlbG9wbWVudCwgSmFzb24gc2FpZCBoZSB3YXMgb3BlbiB0byBsaWNlbnNpbmcgaGlzIGNv
ZGUgdG8gbWF0Y2ggdGhlIGtlcm5lbHMgZm9yIHdoaWNoIGl04oCZcyBkZXN0aW5lZCAoZS5nLiwg
QlNEIGxpY2Vuc2UgZm9yIGEgcG9ydCB0byBhIEJTRCBrZXJuZWwpLiBUaGF0IHdhcyB5ZWFycyBh
Z28sIGJ1dCBpdCBtaWdodCBiZSB3b3J0aCBpbnF1aXJpbmcuCj4gCj4gCj4gR29vZCBsdWNrLAo+
IEdlb3JnZQo+IAo+IFNlbnQgZnJvbSBteSBpUGhvbmUKPiAKPj4gT24gQXByIDE3LCAyMDE5LCBh
dCAzOjMyIEFNLCBiaGFzaGthciBwcmFrYXNoIFNpbmdoIDxzaW5naC5iaGFzaGthckBnbWFpbC5j
b20+IHdyb3RlOgo+PiAKPj4gSGksCj4+IAo+PiBJIHdhbnQgdG8gaW50ZWdyYXRlIFdpcmVndWFy
ZCB0byBteSBjb25maWRlbnRpYWwgcHJvamVjdC4gSSBzZWUgV2lyZWd1YXJkIHNvdXJjZSBjb2Rl
IGlzIHVuZGVyIEdQTHYyLCBpZiBJIGFkZCBhbnkgcGF0Y2ggdG8gV2lyZWdhdXJkIHNvdXJjZSBj
b2RlIHRvIHdvcmsgd2l0aCBteSBjb25maWRlbnRhaWwgcHJvamVjdCwgZG8gSSBuZWVkIHRvIHB1
Ymxpc2ggY29tcGxldGUgc291cmNlIGNvZGUgYWxvbmcgd2l0aCBteSBwcm9qZWN0IHNvdXJjZSBj
b2RlID8KPj4gCj4+IEFueSBvdGhlciBwb2ludGVyIGhvdyBJIGNhbiBzdGFydCB3b3JrIHRvIGlu
dGVncmF0ZSBXaXJlZ3VhcmQgaW4gbXkgcHJvamVjdCB3aWxsIGJlIGhpZ2hseSBhcHByZWNpYXRl
ZC4KPj4gCj4+IFRoYW5rcyAmIFJlZ2FyZHMsCj4+IEJoYXNoa2FyCj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IFdpcmVHdWFyZCBtYWlsaW5nIGxp
c3QKPj4gV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQo+PiBodHRwczovL2xpc3RzLnp4MmM0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0
cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJl
Z3VhcmQK
