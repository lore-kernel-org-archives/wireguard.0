Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8372C00449
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 04:40:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF9CC20882
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 04:40:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uUUpGbUr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF9CC20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92d69b5a;
	Sun, 7 Oct 2018 04:39:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f85cbde
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 04:39:45 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 014d613b
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 04:39:44 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id y11-v6so6516736wrd.4
 for <wireguard@lists.zx2c4.com>; Sat, 06 Oct 2018 21:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:openpgp:autocrypt:message-id
 :disposition-notification-to:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=TZofER4zJr9SuHkPuk4mzjHI2Mx1ZwhY7GdRyits99g=;
 b=uUUpGbUrqrUiDk6rbBOIJIfk21lnarAZeeBk/FW1L1qLQdERcQJR9LaHWs9B6ZcMrG
 t/q1w6yhWOJvc28TyIW7/sgRxESvZbZbEw405iWR9IeIYr8TVGuYXfz+GOs+wFccw/GW
 MunH41FoGMJiE7eVEk7WcU+d0/TjjZ7RBj23o48/1t7kScm8zF94n7DBVJ55ZHr+4xMj
 THmfmM5kul0WSw7zBmynXqJmZTzcpgKjf6ylDqR6WCILCMWfpol/QqrChNZHVKcS6IS7
 YOGmrm8xQuKum5AaBCsTJpI4vU+baAkySPkerWOtOGCLSZT+zfP7skV8jvnRypceV+uG
 4osg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:openpgp:autocrypt
 :message-id:disposition-notification-to:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=TZofER4zJr9SuHkPuk4mzjHI2Mx1ZwhY7GdRyits99g=;
 b=KOq4yrsaLgyZuEcxa8DFpApLtj3sjEeT4DMoJzVlx4wEr5R0UHmTF3IXOkbLqFBGK5
 PCQ0FK8zoZQiixJzaU4AwUfmFGVe43X0LKCDqhWUjYYzy/N1gKWr3q6o3a6tyvheP3xg
 2BCM1ZCgn83/KsoRNPXxIXe8c3AdtxvY+uSmEAE9HSgDmXsVt/THiQDSwXHhXfJaMXq3
 GE3DGa14eZEBfb/VCSzapPE810Rf9OX3O9EplGqnZ/W8rSiL6ai8WTg88W5tdIIF1Y7f
 tlOUFuSJ2QtAKt2JqA3Bnx9x/D6NNMAvALHZ2BxxhERYrIuuX8Nk3yRIAYZNlltggShi
 CH6g==
X-Gm-Message-State: ABuFfojCU+c535PJCH00XShX7d21ZiMTpZiLQv+aQ/LRG85vV5cvSzKN
 sixk51hoEmlOY4AI5/UxViSv2WY9
X-Google-Smtp-Source: ACcGV63pZznJ5bjKFmk2d3JsVYyw8NqfyDqqO1gTOtos4Mwi9JriV3RxJvzJJjyw1+X2JHo1YrnLjw==
X-Received: by 2002:adf:f043:: with SMTP id
 t3-v6mr12012823wro.92.1538887219236; 
 Sat, 06 Oct 2018 21:40:19 -0700 (PDT)
Received: from ?IPv6:2001:470:6aa2:a0::24? (vertex.nanhome.exbit.io.
 [2001:470:6aa2:a0::24])
 by smtp.gmail.com with ESMTPSA id e7-v6sm13111458wra.37.2018.10.06.21.40.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 06 Oct 2018 21:40:18 -0700 (PDT)
Subject: Re: Private and public keys generation
To: Evgeniy Ivanov <e601809@gmail.com>
References: <8531EC91-607C-4525-863F-31CDD9FCC791@gmail.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Openpgp: id=97D58E607188C8C986481CB76A2F898000519052;
 url=https://keybase.io/aaronmdjones/key.asc
Autocrypt: addr=aaronmdjones@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <59e10121-daa7-ba13-bd7e-5d17546032c3@gmail.com>
Date: Sun, 7 Oct 2018 04:40:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <8531EC91-607C-4525-863F-31CDD9FCC791@gmail.com>
Content-Language: en-GB
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

LS0tLS1CRUdJTiBQR1AgU0lHTkVEIE1FU1NBR0UtLS0tLQpIYXNoOiBTSEE1MTIKCk9uIDA2LzEw
LzE4IDExOjI3LCBFdmdlbml5IEl2YW5vdiB3cm90ZToKPiBIaSBldmVyeWJvZHksCj4gCj4gSeKA
mW0gYWJsZSB0byBnZW5lcmF0ZSB0aGUgcHJpdmF0ZSBrZXlzIHByZXR0eSBzdHJhaWdodGZvcndh
cmQgd2l0aAo+IGFueSB0b29sIEkgbGlrZSAoZWc6IGRkIGlmPS9kZXYvdXJhbmRvbSBicz0zMiBj
b3VudD0xIDI+L2Rldi9udWxsIHwKPiBiYXNlNjQpCgpUaGlzIGlzIG5vdCBzdWZmaWNpZW50LCBh
cyBkb2N1bWVudGVkIG9uIGh0dHBzOi8vY3IueXAudG8vZWNkaC5odG1sCigiQ29tcHV0aW5nIHNl
Y3JldCBrZXlzIikuIFBsZWFzZSB1c2Ugd2coOCkgb3IgYW55IG90aGVyIGxpYnJhcnkgb3IKYXBw
bGljYXRpb24gdGhhdCBzdXBwb3J0cyBDdXJ2ZTI1NTE5LgoKLS0tLS1CRUdJTiBQR1AgU0lHTkFU
VVJFLS0tLS0KQ29tbWVudDogVXNpbmcgR251UEcgd2l0aCBUaHVuZGVyYmlyZCAtIGh0dHBzOi8v
d3d3LmVuaWdtYWlsLm5ldC8KCmlRSXpCQUVCQ2dBZEZpRUVZS1ZCd2U0M3paaC9qa3hQaXZCemRJ
aXJNQklGQWx1NWppY0FDZ2tRaXZCemRJaXIKTUJJTXVBLzdCamVTNHRLUVA3SG5BRkRMRjVoNXh0
K2RnWWkvRnlWQkMyVWJPSXEyNEliUlBJREkveTJYOXVRUwpzYS9aczZieDJRdmpJM0hDN3B5NlE0
MFhFbTdNNVFic09vOHV4UVlzRUpSR1duRzBoc0RzRzJpWjdSano5aUl6CnJKOHcvZ3hiRXRGbUNz
YjJ6N2ZabW9WbE1MdGRZU1FHM0hEeUtQWHNac2ZjY1VHYUsrUTBSTWdPYnRMemcxMVoKUDBtcnlY
aXFvbnFVVWpBQzJmczRzOUtHclQwWkxhYmRFekpvVXdsdjArdEdkOTRXNWkzQUpiV1IwRCtFOFY3
egp0a1ZXYWxZWnZIZGFHZjhqMHRkNVFIZmJFZENqZlNyVHJvK2lXZFovTDArc01RWnJQTTBNeU9l
NVpNTktsQlhCCmZvV1Y0ZVh5Y3FqY3Jnb0kraHZMU3I4YWMvcmZyZDVkbEswY2ZsOXhLbW9HMXJP
cUF0VnBUSjFxRFFZeVlidXYKM2lMTllBWGpBekxUcGtudDJad0dRc2I1bnhIMUF3SjFvR01DY1kz
TkRZZkYyK3UySFhrYTF2aFBkVHB5U2JYaApOd1lRMnlMakcyUjF3VmR0Yi96N290VnRxNE8zWjZ5
TWo2R0pmTGltbkV3SGpEWk9qU09uN3cyUnVWM0NzSS9DCnpkVlU2YjRGVHArczNSQU9GdVROYUds
UTJaSEhlalFGWDVZdmdGS3MvaGZ4ZysyemYxMTR6b05vY0tRbDF0WjAKb2F4TkVSRDV5OE45N3lT
WGM4Ny9kNTl6bjljYzZSNDc2aWdlY2FBeVBSVkNtSDJSYnN6QUVxcXIrUkl1Njl5cQpuSzhtYkw1
Q3VldmtseSt2T2RqV3J6WHVhZDIvdTRKdHhyOFF2N0twcE9FeHg1QmpRK2c9Cj1IUTBECi0tLS0t
RU5EIFBHUCBTSUdOQVRVUkUtLS0tLQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJj
NC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
