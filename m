Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MISSING_HEADERS,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382CCC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 16:06:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8C172073D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 16:06:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6UUnne1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8C172073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b496084d;
	Mon, 9 Dec 2019 16:05:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63cfbdab
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 12:29:30 +0000 (UTC)
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 211446be
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 12:29:29 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id g1so15360613qtj.6
 for <wireguard@lists.zx2c4.com>; Mon, 09 Dec 2019 04:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc
 :content-transfer-encoding;
 bh=3Qn1XXJiVjff+8gadimzqJ0Sdux+y2olD1pDo9dYsyg=;
 b=f6UUnne1OZCmaj/0z5AK3xNX/986DU+g8iMQCxqptHUL6SuKMqacEWeJ/Zk1LaK0X/
 PU7BzlCLpuaAUgEaaMfZjdKWp8964M/kI7v8zM0nX4YF7uzsOADatrtLG2gokk5+OJ4H
 WR2jQxjgJa/OJFryTC9y6C051YHGSoO/R5Lc5PpcnNaBvBSDGek05LQIqbNlGis3KDLU
 qBEp1GRATXXP127qU/Eaa2SpA1mSKPw2kPUTfWGLNuV4m87l3AA06xiPQWKIndCX1jTj
 dIIVgSJMtvfxCiZMBCZRdygj4uTZh3CN3ismBQB2+MipjXIXh7VR4wd8cFImjw2vvy1l
 p+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc:content-transfer-encoding;
 bh=3Qn1XXJiVjff+8gadimzqJ0Sdux+y2olD1pDo9dYsyg=;
 b=jFfCbOiYcnoE9v2xXGt5zrrzjmKAH711UJdE5DMb9wfZskvD1HyjqfNrhOA6hC+95D
 QIx9FUGew2yM8Yolx+3cAArce9bi3PJYJ1SzDPmNtsivwQZ+kSwXWbMgSlgZgTAV5rOg
 QvF7Q1hV7aCBnD4PgFyxRioc8X7VT8Mwg07yYn3o0vMVr5atvFCYoBDu7Xr/fmvkjJjb
 rHLHuw1fWRPAruofUlp8DTyKy7vDdkMZ8auuFlO/8WwzPZ2M+4Cpy+Nkcdn5BAX7tsvP
 ub2UcwNxo3KEkU/cO4sJXWNYi+g14l9dyY5yt1c4S9hKYarM6WembW1S9zn9x51Moc2u
 PmkA==
X-Gm-Message-State: APjAAAUei+LGJ1PURcChH9b+6y1IxMqtzNy8gqqq7cZbAyoBp2p+fMe5
 9n/6l7VPTaUfAxUM8t1eCqojcAk+hyqkvyrmEK7WTfG7
X-Google-Smtp-Source: APXvYqx1r4nGKU1SUP6QfqmCSMYNiDi1zTKWQpDN3yY/viLUwpCsJv/nqZONuXIYqr7QgaIGQoyIu2FIUQ7rtLUK4vI=
X-Received: by 2002:ac8:2ffa:: with SMTP id m55mr25043016qta.189.1575894568170; 
 Mon, 09 Dec 2019 04:29:28 -0800 (PST)
MIME-Version: 1.0
References: <20191203165130.52f438ba@schienar> <87zhg3ymwi.fsf@thalheim.io>
In-Reply-To: <87zhg3ymwi.fsf@thalheim.io>
From: "b13253@gmail.com" <b13253@gmail.com>
Date: Mon, 9 Dec 2019 20:28:50 +0800
Message-ID: <CA+7UkwLFoXc5SuhC9hCd=gWT1vbOk-Jd_WEe119trErJ+v=FiQ@mail.gmail.com>
Subject: Re: wg-quick nft instead of iptables
Cc: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Mon, 09 Dec 2019 17:05:45 +0100
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

bmZ0IGlzIGEgcmVwbGFjZW1lbnQgZm9yIGlwdGFibGVzLCBhbmQgc29tZSBkaXN0cmlidXRpb25z
IChlLmcuCkRlYmlhbikgcHJlZmVyIHVzaW5nIG5mdCBzaW5jZSBpdCBpcyBtb3JlIGNhcGFibGUg
YW5kIGFkdmFuY2VkLgoKSSB0aGluayBpdCBpcyBpbXBvcnRhbnQgdG8gdXNlIG5mdCBmaXJzdCBp
ZiBpdCBpcyBpbnN0YWxsZWQgb24gdGhlCnN5c3RlbSwgdGhlbiBmYWxsYmFjayB0byBpcHRhYmxl
czsgcmF0aGVyIHRoYW4gaW4gdGhlIG9wcG9zaXRlIG9yZGVyLgpJIHN1Z2dlc3QgdGhhdCBpdCBp
cyBiZXR0ZXIgdG8gbW9kaWZ5IHRoZSBwYXRjaCB0byBzdXBwb3J0IGlwdGFibGVzCmp1c3QgaW4g
Y2FzZSBuZnQgaXMgbm90IHByZS1pbnN0YWxsZWQgb24gc29tZSBkaXN0cm9zLgoKQmVzdCByZWdh
cmRzCgoKT24gTW9uLCBEZWMgOSwgMjAxOSBhdCA2OjU5IFBNIErDtnJnIFRoYWxoZWltIDxqb2Vy
Z0B0aGFsaGVpbS5pbz4gd3JvdGU6Cj4KPgo+IEhhdmUgeW91IHRyaWVkIGlmIGlwdGFibGVzLW5m
dGFibGVzLWNvbXBhdCAobWlnaHQgaGF2ZSBkaWZmZXJlbnQgbmFtZXMsCj4gZGVwZW5kaW5nIGRp
c3RyaWJ1dGlvbikgd29ya3MgZm9yIHRoZSBydWxlcyB1c2VkIGluIHdnLXF1aWNrPwo+IEl0cyBh
IHdyYXBwZXIgdGhhdCB0cmFuc2xhdGUgaXB0YWJsZXMgcnVsZXMgdG8gbmZ0IHRyYW5zcGFyZW50
bHkKPiBieSBwcm92aWRpbmcgYSBpcHRhYmxlcyBleGVjdXRhYmxlLgo+Cj4KPiBKdWxpYW4gV29s
bHJhdGggPGp3b2xscmF0aEB3ZWIuZGU+IHdyaXRlczoKPgo+ID4gSGksCj4gPgo+ID4gd2l0aCB0
aGUgbmV3ZXN0IHNuYXBzaG90IHdnLXF1aWNrIHVuZm9ydHVuYXRlbHkgcmVxdWlyZXMgaXB0YWJs
ZXMgd2hpbGUKPiA+IEkgb25seSBoYXZlIG5mdGFibGVzIGluc3RhbGxlZC4gVGhlIGF0dGFjaGVk
IGRpZmYgaGFuZGxlcyB0aGUgcnVsZXMKPiA+IHdpdGggbmZ0YWJsZXMgaW5zdGVhZCwgbWF5YmUg
c29tZWJvZHkgZmluZHMgaXQgdXNlZnVsLiBUaGUgc21hbGwgY2F2ZWF0Cj4gPiBpcywgdGhhdCB0
aGUgcnVsZSBkZWxldGlvbiBtaWdodCBub3Qgd29yayBmb3IgZXZlcnlvbmUuCj4gPgo+ID4KPiA+
IENoZWVycywKPiA+IEp1bGlhbgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBXaXJlR3VhcmQgbWFpbGluZyBsaXN0Cj4gV2lyZUd1YXJkQGxpc3Rz
Lnp4MmM0LmNvbQo+IGh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2ly
ZWd1YXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCldp
cmVHdWFyZCBtYWlsaW5nIGxpc3QKV2lyZUd1YXJkQGxpc3RzLnp4MmM0LmNvbQpodHRwczovL2xp
c3RzLnp4MmM0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL3dpcmVndWFyZAo=
