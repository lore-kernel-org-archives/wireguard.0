Return-Path: <SRS0=0UwN=4E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15995C2BA83
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Feb 2020 14:14:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FFFD206E2
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 16 Feb 2020 14:14:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkjpSHpg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FFFD206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6bceaaf5;
	Sun, 16 Feb 2020 14:11:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4db5ddf
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2020 14:11:36 +0000 (UTC)
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d32a882
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2020 14:11:36 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id t129so3859695vkg.6
 for <wireguard@lists.zx2c4.com>; Sun, 16 Feb 2020 06:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BxVAivQJhBIwA89oPqVdX7Ng57Vh7J/LRzwaQnFOU1g=;
 b=GkjpSHpg0aRruZovz9bSwT4YInZSDABPT+BYf5TGZrRsdVnTqxTdz5kvbOTOiMBND7
 +o5KBQasQAGDsFP50X//v5lwsG9AbrfHaGoa4S9h7C5AaWeJLnYkWjLKmmEJjYaJ++V9
 0F3ihEM6xRlFQ8LWhshiEXsBwDR3ftWC9R74k1ZnVBSx/7g+mrS8IJkqaA8gXdcQXKC7
 3gqrD0hN5eVAa1u7s7Q2NaOTy1+oC1sZBOwcjdBOWamXYFcftKxGU5PoPXlKmaFixSUd
 jTUE+4lsaXkLKTeRdj7qvhYsFYAe84fqJRCKS+zqcp2lKVDnCK4Fej8HbeQ+Kl0B9ovM
 wjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BxVAivQJhBIwA89oPqVdX7Ng57Vh7J/LRzwaQnFOU1g=;
 b=FloqmN1aof2uqz6/xBX7j+wC0dvxpYEW+fTPiPlHjXSiJbuEVKFd/hPUqQkyKj/wcS
 tQ2yfIS1MoSAsr1A4gIzyaSwvEWqFbAXaA3khUWsqQOcUl6/MUAZVqZKnQTIY3kekby8
 HHnBDzpi8M5o9nRVKiNu8R5L4R4rTbwhUrEh8qhUtLDs7du/kVLcZ+f45iLiEZrUcB1j
 oJsRgFeJOi8IvM6RlxkQ24dfhfj5d34Ji181V74osE4x6t7ybLV63vSTSJojb1HMZogZ
 viOHUT6GkjvstO5ssLnlI+A2CtbL4iV9/3itizVk2Ri30VnObGfoTng9h0CpU7c2qO+S
 i3Tg==
X-Gm-Message-State: APjAAAXeQPwmH/rb3FXB9MulHTe/uxR2LjZldm3HiJa/HD8Kk/7YxVVr
 LoNCYheFkhg5kbbkgcSNU+rPjlH6d4L5uB/U8Aq5lpDM
X-Google-Smtp-Source: APXvYqyC+tiGI9H3/QhDpencj90bfQE1hDhOHIehmwqQVZ/wCVcl0T/cDf4Z8FK7BpLvte4DBHUPmJlNraZC6G7cYiU=
X-Received: by 2002:a1f:e784:: with SMTP id e126mr3633017vkh.102.1581862438082; 
 Sun, 16 Feb 2020 06:13:58 -0800 (PST)
MIME-Version: 1.0
References: <20200213103117.68943-1-tanioka404@gmail.com>
 <120ad97e-0dcb-6502-f097-e1368d9987cf@sholland.org>
 <CAA2ss9EDZ4qip3Rh-z_zseLr2u0+A8ePEUUBd7dnJq2RTdPmwA@mail.gmail.com>
 <851381cd-3fc0-94f9-63a1-7b69deb9a640@sholland.org>
 <CAA2ss9E2jnvA_TLhBPJTSuqBz+YoU-wUTPnYghYw+bMPpeSoWQ@mail.gmail.com>
 <99D61A626FDA8A4B90A270669121BE10D06C64FF@PLANJAVA.amebis.doma>
In-Reply-To: <99D61A626FDA8A4B90A270669121BE10D06C64FF@PLANJAVA.amebis.doma>
From: Eiji Tanioka <tanioka404@gmail.com>
Date: Sun, 16 Feb 2020 23:13:47 +0900
Message-ID: <CAA2ss9GtMHuhS7wTfKiHee62iyVH6pB4OH9vucbWZnpBeRGqXQ@mail.gmail.com>
Subject: Re: [PATCH] Add japanese translation.
To: Simon Rozman <simon@rozman.si>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

SGkgU2ltb24sCgpTdXJlISBJIHdpbGwgYmUgcGxlYXNlZCB0byBoZWxwIHdpcmVndWFyZC13aW5k
b3dzIGxvY2FsaXphdGlvbi4KQ3VycmVudGx5LCBJJ20gd29ya2luZyBvbiB3aXJlZ3VhcmQtYXBw
bGUgdHJhbnNsYXRpb24uIFdoZW4gZmluaXNoZWQsCkkgd2lsbCB0cnkgdG8gdHJhbnNsYXRlIHdp
cmVndWFyZC13aW5kb3dzIHRvIEphcGFuZXNlLgoKUmVnYXJkcywKRWlqaQoKCjIwMjDlubQy5pyI
MTbml6Uo5pelKSAxODo0MCBTaW1vbiBSb3ptYW4gPHNpbW9uQHJvem1hbi5zaT46Cj4KPiBIaSBF
aWppIQo+Cj4KPgo+IEkgd29uZGVyIGlmIHlvdSBtaWdodCBiZSB3aWxsaW5nIHRvIGNvbnRyaWJ1
dGUgSmFwYW5lc2UgdHJhbnNsYXRpb24gZm9yIHRoZSB3aXJlZ3VhcmQtd2luZG93cyBhcyB3ZWxs
Pwo+Cj4KPgo+IFRoZSB3aXJlZ3VhcmQtd2luZG93cyBoYXMgcGVuZGluZyBsb2NhbGl6YXRpb24g
c3VwcG9ydCBoZXJlIGh0dHBzOi8vZ2l0Lnp4MmM0LmNvbS93aXJlZ3VhcmQtd2luZG93cy9sb2cv
P2g9c3IvbDE4bi4gSSBoYXZlIHRyYW5zbGF0ZWQgaXQgdG8gU2xvdmVuaWFuIGFscmVhZHkuIEZ1
cnRoZXJtb3JlLCBJIHNob3VsZCBnZXQgdGhlIEZyZW5jaCB0cmFuc2xhdGlvbiB0byBpbnRlZ3Jh
dGUgc29vbiB0b28uCj4KPgo+Cj4gUmVnYXJkcywgU2ltb24KPgo+Cj4KPiBGcm9tOiBXaXJlR3Vh
cmQgPHdpcmVndWFyZC1ib3VuY2VzQGxpc3RzLnp4MmM0LmNvbT4gT24gQmVoYWxmIE9mIEVpamkg
VGFuaW9rYQo+IFNlbnQ6IFNhdHVyZGF5LCBGZWJydWFyeSAxNSwgMjAyMCAxMToyMyBBTQo+IFRv
OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4KPiBDYzogd2lyZWd1YXJkQGxp
c3RzLnp4MmM0LmNvbQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIEFkZCBqYXBhbmVzZSB0cmFuc2xh
dGlvbi4KPgo+Cj4KPiBUaGFuayB5b3UgZm9yIGFwcGx5aW5nIG15IHBhdGNoIQo+Cj4KPgo+IEkn
bSBub3cgdHJhbnNsYXRpbmcgd2lyZWd1YXJkLWFwcGxlIGludG8gSmFwYW5lc2UuIFdoZW4gZmlu
aXNoZWQsIEkgd2lsbCBzZW5kIHBhdGNoLgo+Cj4gTmV4dCB0aW1lLCBJIHdpbGwgbm90IGZvcmdl
dCB5b3VyIGFkdmljZS4KPgo+Cj4KPiBUaGFua3MsCj4KPgo+Cj4gMjAyMOW5tDLmnIgxNeaXpSjl
nJ8pIDE1OjE0IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQub3JnPjoKPgo+IE9uIDIv
MTQvMjAgMTE6MjcgUE0sIEVpamkgVGFuaW9rYSB3cm90ZToKPiA+IEhpLCBTYW11ZWwuCj4gPgo+
ID4gVGhhbmsgeW91IGZvciB5b3VyIHJlcGx5IQo+ID4gSSByZS1jcmVhdGVkIHBhdGNoLgo+Cj4g
VGhhbmtzLCBhcHBsaWVkOgo+IGh0dHBzOi8vZ2l0Lnp4MmM0LmNvbS93aXJlZ3VhcmQtYW5kcm9p
ZC9jb21taXQvP2lkPTgyMmY3MmRmOTU2ZWNkM2FhYTZhMmIyNTRlMDU5ZTM4YmE1MTIyZTQKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KV2lyZUd1YXJkIG1h
aWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQu
Y29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
