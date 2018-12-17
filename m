Return-Path: <SRS0=kUA2=O2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8644C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 08:54:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B80A2084D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Dec 2018 08:54:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="JC5zJbp8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B80A2084D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e01bb1a;
	Mon, 17 Dec 2018 08:53:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2242690f
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 08:53:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28d67862
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 08:53:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b393d62
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 08:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=tyyrScDQlTT+
 FXOZkrboXdZhKEU=; b=JC5zJbp8w3tNs8Px/0ayGUhPb3Sq+dJ1542sdQDy3mpg
 qBU3QjMdX+VePpZ7Cy8jG7Rzv/WSBd9QWR6D+aQdl6UtIrmqDdUxac5YeWUtpd0s
 OVCpvtYGyZy9LLKQZbjxCfdXiKg4jOJwWD0kUYr+96SZvI2ezHz5nsisCPMWKLmE
 TiggQaGsDwggSMy/tmxVue1pDSkArO0CE/XOOrU6uqbHQ4WqQ+JArAHAe2zJ/3yR
 NEoIf6RW+q9LvKItZ70t7clEUYUrL0MLxoSD5AL1dsPNxfBhXEDDvamnztcOBN+S
 fQJa9oHaN4Or+q4aSg6dkR4fuDfELjMkWbM9o3juxA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9d4f8695
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Dec 2018 08:44:43 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id k98so11459107otk.3
 for <wireguard@lists.zx2c4.com>; Mon, 17 Dec 2018 00:54:15 -0800 (PST)
X-Gm-Message-State: AA+aEWZT+DlvUPCWmwLd3hZ7TN28GPL9JWCP3MoLfGnQaKe2o4dZeInN
 6+go3ZwdK8YcrqJN8EHfTVZtWZZCyT/YjJrsC30=
X-Google-Smtp-Source: AFSGD/VYNfYwi1mS/rYPdaicS1YwY/pqNrk/zRKch8USeRKAGHzkuQbibiNPQZ8xrNL6Hd1gBE7/3JWoW17zt+yBu84=
X-Received: by 2002:a9d:837:: with SMTP id 52mr8498979oty.143.1545036855148;
 Mon, 17 Dec 2018 00:54:15 -0800 (PST)
MIME-Version: 1.0
References: <CAKVinOVZ1nVJh8LvqGme5C27+R=AFBOxPKS22ckO7TEHsbc4-A@mail.gmail.com>
 <CAHmME9pzif4L4okrDMZdsLb73oXegaMvGHXKkY3twbw_wkYnug@mail.gmail.com>
 <CAKVinOXBxdFrTAiMaDmdE63iYO-rjBSAmBj5mb3QZ52zkmzoRQ@mail.gmail.com>
 <CAKVinOW_6qGYFT52LurdowOuaMD_fL=+WbTfSqr2qSspCkLoRA@mail.gmail.com>
 <CAKVinOX5fnvdv1sBvxq=aV3+UpM-g9CnAU9rMu7zrx-WQ9rzVg@mail.gmail.com>
In-Reply-To: <CAKVinOX5fnvdv1sBvxq=aV3+UpM-g9CnAU9rMu7zrx-WQ9rzVg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 17 Dec 2018 09:54:03 +0100
X-Gmail-Original-Message-ID: <CAHmME9ou8Tt8GAxjw6qcPdmRmVyKShLVrBCJiFRC1KYVZ+KSeQ@mail.gmail.com>
Message-ID: <CAHmME9ou8Tt8GAxjw6qcPdmRmVyKShLVrBCJiFRC1KYVZ+KSeQ@mail.gmail.com>
Subject: Re: [Question or Feature Request] Any wg1.conf option to limit peer
 IP as 1-to-1?
To: "KeXianbin(http://diyism.com)" <kexianbin@diyism.com>
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

T24gTW9uLCBEZWMgMTcsIDIwMTggYXQgOTo0OSBBTSBLZVhpYW5iaW4oaHR0cDovL2RpeWlzbS5j
b20pCjxrZXhpYW5iaW5AZGl5aXNtLmNvbT4gd3JvdGU6Cj4gSSBmb3VuZCB0aGUgZGVmaW5pdGlv
biBpbiBtYW51YWw6Cj4gQWxsb3dlZElQcyDigJQgYSBjb21tYS1zZXBhcmF0ZWQgbGlzdCBvZiBJ
UCAodjQgb3IgdjYpIGFkZHJlc3NlcyB3aXRoIENJRFIgbWFza3MKPiBmcm9tIHdoaWNoIGluY29t
aW5nIHRyYWZmaWMgZm9yIHRoaXMgcGVlciBpcyBhbGxvd2VkIGFuZCB0byB3aGljaAo+IG91dGdv
aW5nIHRyYWZmaWMgZm9yIHRoaXMgcGVlciBpcyBkaXJlY3RlZAo+Cj4gZnJvbTogaHR0cHM6Ly9t
YW5wYWdlcy5kZWJpYW4ub3JnL3Vuc3RhYmxlL3dpcmVndWFyZC10b29scy93Zy44LmVuLmh0bWwK
ClllcywgdGhhdCBpcyBpbmRlZWQgd2hhdCB0aGUgbWFuIHBhZ2Ugc2F5cyBhbmQgaXQgaXMgdGhl
IGV4cGVjdGVkCmJlaGF2aW9yLiBZb3UndmUgcmVwb3J0ZWQgaGVyZSwgaG93ZXZlciwgIkN1cnJl
bnRseSwgIHRoZSBwZWVyIGNhbiBzZXQKYW55IElQLCBmb3IgZXhhbXBsZSAxMC4xLjAuNCwgYW5k
IGNhbiBzZW5kIHBhY2tldHMgdG8gbXkKaHR0cDovLzEwLjEuMC4xOjgwIGZyb20gMTAuMS4wLjQs
IiB3aGljaCBzb3VuZHMgYmFkIGFuZCBsaWtlIHNvbWV0aGluZwp3b3J0aCB0YWtpbmcgc2VyaW91
c2x5LCBpZiBJJ20gaW50ZXJwcmV0aW5nIHRoYXQgY29ycmVjdGx5LiBXb3VsZCB5b3UKdGFrZSB0
aGUgdGltZSB0byBjcmVhdGUgYSByZXByb2R1Y2VyIHNpbWlsYXIgdG8gd2hhdCBJIHBvc3RlZCBp
biBteQpsYXN0IGVtYWlsPwoKVGhhbmtzLApKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpXaXJlR3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBs
aXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93
aXJlZ3VhcmQK
