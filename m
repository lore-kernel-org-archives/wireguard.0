Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75201D10F40
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 01:51:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df5bd55f;
	Mon, 18 Nov 2024 01:37:15 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e89fdb5e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Sep 2024 07:38:17 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8a7903cb7dso317003666b.3
 for <wireguard@lists.zx2c4.com>; Mon, 23 Sep 2024 00:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727077097; x=1727681897; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EIq+j15v0QzXJo+kQd/wlRJrBQrCwnWeCVi5n2U1BxQ=;
 b=YZ+KfLAsUbqaUeVi1jGuZJHB5CHevIBjZE0oycKUCJhSnu5QKr4/vVxqApR5EH6FkK
 AiwOw0MITjeRyswiq6D0lVo3KRj2ced3v/Q6Vg9oDFCo1rNhFCVHCr09dHvxJ2OW1ny0
 BDVWAV5BVgnR9Bq8y5wBXIXVfdMZcKAOm8aeDdlMBrmHfMEPwnNNw00JPBf3BpO62svR
 8LDnFcMylcU21R4GC0v+PV5AcHTFTVwJ1VeRjAP7X41wua6ESR72FQXzJsYQ4JVuwROz
 YSlpKoL/ubLuWsyKGMTLZ2uSztoL1XI/L6k10XjqaSsENdWk3Jfai3KbwPKTXI+TmM0+
 rJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727077097; x=1727681897;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EIq+j15v0QzXJo+kQd/wlRJrBQrCwnWeCVi5n2U1BxQ=;
 b=JN+XaFEz68uLYx0bfxbM0V2TQMIOSl2eX1YdPwoR1ljJBtHihYWC5oEq+1Cr+/kzkn
 I9YqxjX2o39aScF4hG9CJdPQwnbET7yh5tdzoIaDcZsHToj2Budngj4HaBba4Qdr/kKj
 lxuU5dJ5Eb1jDtihX9GI7Av/qvpY3IYha/a0Lj5gPZvISm/gOUyr2rondaECbCwQjU1o
 U8wtENJ95CTrMz4i7FTufHcmaBpZzUC1rZGhFj+Y+vwtXwzciQ3v3kUp5JK2rsYsSGV0
 8IDsymNV/kOEdQRcsPAqik5NH7/zdGx/anYU1rKgEl5fArg0gWI4+VW6TBkQGLnFQYu8
 7kqg==
X-Gm-Message-State: AOJu0YxgDa7oVymj88qmX907SSZML863omXJqC5yBjsDHUonWWpfJS3h
 ISqsC+e7IC7/QTfmeWKYrCfl8L0Vd14FfQsoeLpIpgAOmNtYi6wiH9ZVrIRSjOun29vuqPf999n
 44R520oiGaQLsP0WZP/CZiEgxsDoLkKi54po=
X-Google-Smtp-Source: AGHT+IF3AyJOxe92a8nwLHfIjEOFqF25qKjqDACS6ssiwfae3SKQFd1sw+1ZoVLL0f7tHI4OESrTQ5jkjdRS9FqAGb4=
X-Received: by 2002:a05:6402:354c:b0:5c3:d0f5:86f3 with SMTP id
 4fb4d7f45d1cf-5c46494379bmr14571346a12.3.1727077096384; Mon, 23 Sep 2024
 00:38:16 -0700 (PDT)
MIME-Version: 1.0
From: Houman <houmie@gmail.com>
Date: Mon, 23 Sep 2024 08:37:38 +0100
Message-ID: <CABBZOsnUJiF_viAskrVVrjKfAC-Y2jUTa8gTnW1RhX_oG5+nug@mail.gmail.com>
Subject: WireGuard Apple: Xcode 16.0 compatibility issues - Urgent fix needed
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This project is in urgent need of maintenance to make it work with Xcode 16.0.
First I had to update Swift-tools-version:5.5 in Package.swift to be
able to even add the library via Swift Package Manager to my project.

After that despite following all the integration instructions, I see
errors that I have never seen before:

".../WireGuardKitC/WireGuardKitC.h:10:5 Declaration of 'u_int32_t'
must be imported from module
'DarwinFoundation.unsigned_types.u_int32_t' before it is required"

".../WireGuardKitC/WireGuardKitC.h:14:5 Declaration of 'u_char' must
be imported from module 'DarwinFoundation.unsigned_types.u_char'
before it is required"

".../WireGuardKitC/WireGuardKitC.h:16:5 Declaration of 'u_int16_t'
must be imported from module
'DarwinFoundation.unsigned_types.u_int16_t' before it is required"

Jason can you please fix this?

Or alternatively if Jason is too busy, is there any reliable fork from
WireGuard that is being maintained, please?

Thank you so much.
Houman
