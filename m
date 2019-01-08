Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1AE9C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 07:41:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2FE021855
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  8 Jan 2019 07:41:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aI4z0bCT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2FE021855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed099d83;
	Tue, 8 Jan 2019 07:37:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c1fc76d
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 07:37:56 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a458e15
 for <wireguard@lists.zx2c4.com>; Tue, 8 Jan 2019 07:37:56 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id g9so1477651plo.3
 for <wireguard@lists.zx2c4.com>; Mon, 07 Jan 2019 23:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ofLLymjmWpSVfMi65oSwqiurfTja96pUS3eGtWfWqMQ=;
 b=aI4z0bCT1onaeEen16+asVhan9UUp7haD/Z0yTJwkfEY8HomPd+UaXpreurL/qS9Mx
 ZnJIVI/qc7i0dG+DkwLjYgUpeOdsnOzUXudy+bGmRe4L+mF78XmET7uKHdIc6XIrxiRU
 VMZJOQT6Sc3UlXexGoKZ0u3McCmXeg8/pzlVsfxP5Jgw4kBRtlvPsfb7fgeyylVejB2z
 +IkFTewqh/QxUQC/vf/7m/MVMDEXDKiFUBUBfT9D7Xy9RMpW9yFTXwgdj9G0JQfudFzB
 hIPI1gzliujIi2lgwxhCulBAK4vGh+BTuHQwN7FYS0dhJRZpg0I6/rd6r7/V4DPKJiwJ
 Wufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ofLLymjmWpSVfMi65oSwqiurfTja96pUS3eGtWfWqMQ=;
 b=XAtBhj5IS3zHtuCkjZLun0wmoC9sLM1tabPQpEwxqYPyFnoR6n5Bg9/GoTUo7+Ib5I
 +raMeaFcwYZmvWgZ04wEpD+H5Vg2fX+iqOkeWF+oTiN3W/gAsunFqnrae2ByNcvLsfbU
 6BhRMwjEWoA86qZmql+v1OImoYDyRiMrZr3HKMzzYKT4g1g5XtRk1R2BIRtP2+SkoVzd
 WjRZqmrzgba0a6TjITeTvZkaOqldl8mTUqLERFyx53U77sZtTP4XW/3N7EYoyYZnnnvI
 B/uOTkkbKxxIdXLYaUox8K7aocmjM6l41MghumWxSKs6XiL3KnNL82hA2V4813/z/ZCN
 43DA==
X-Gm-Message-State: AJcUukdgckPs+vcPCjspgebykfSFQwj7UX0vfcZ88H1BM691e6Lfgvss
 haH/J+hs02gL0gXgSEJH4JUluQ+AZQjPvfaxFJg=
X-Google-Smtp-Source: ALg8bN635Dj1KuPcI3+uoFRuxgJdZPsbqnQ60jUaFQ7KveFnzhyrErt9WaEBrOK/QOLO7oTJssZGCLSILPukA7vLmjY=
X-Received: by 2002:a17:902:4827:: with SMTP id
 s36mr695956pld.168.1546933261208; 
 Mon, 07 Jan 2019 23:41:01 -0800 (PST)
MIME-Version: 1.0
References: <7a88c5bb-30c7-64ff-36bb-ea560448ec53@gmail.com>
In-Reply-To: <7a88c5bb-30c7-64ff-36bb-ea560448ec53@gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Tue, 8 Jan 2019 08:40:49 +0100
Message-ID: <CAKXLc7eKJFUFPi0gRXfYFbsM-T1-CyygNzbeHx5RcSrAGanYyg@mail.gmail.com>
Subject: Re: DNS tunneling only
To: =?UTF-8?Q?Mario_Garc=C3=ADa?= <mariogdlt@gmail.com>
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

T24gVHVlLCBKYW4gOCwgMjAxOSBhdCAzOjI1IEFNIE1hcmlvIEdhcmPDrWEgPG1hcmlvZ2RsdEBn
bWFpbC5jb20+IHdyb3RlOgo+IElzIGl0IHBvc3NpYmxlIHRvIHR1bm5lbCBETlMgcmVxdWVzdHMg
b25seSBmcm9tIHRoZSBjbGllbnQgdG8gdGhlCj4gd2lyZWd1YXJkIHNlcnZlcj8KPgpZZXMuLi4g
ZWFzeSwgaWYgeW91IHdhbnQgdGhlIHJlc3BvbnNlcyB0byB0aG9zZSByZXF1ZXN0cyBnb2luZyB0
aHJvdWdoCnRoZSB0dW5uZWwgYXMgd2VsbC4KCkl0IGlzIGp1c3QgYSB0dW5uZWwsIHdoYXQgeW91
IHB1dCBpbiB0aGVyZSBpcyB1cCB0byB5b3UuIFNvIGFkZCBhCnJvdXRlIHRvIHlvdXIgRE5TIHNl
cnZlciBvbmx5IHZpYSB0aGUgdHVubmVsLCBsZWF2ZSB0aGUgZGVmYXVsdCByb3V0ZQphcyBpdCBp
cy4KCkFuZCBubywgdGhlcmUgaXMgbm8gbWFnaWMgYnV0dG9uIHRoYXQgd2lsbCBkbyBleGFjdGx5
IHRoYXQuCgpLYWxpbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQuY29tCmh0
dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
