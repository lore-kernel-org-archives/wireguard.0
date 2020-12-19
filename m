Return-Path: <SRS0=qzPy=FX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5172C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 12:15:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1564523ACA
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Dec 2020 12:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1564523ACA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e14a035;
	Sat, 19 Dec 2020 12:06:29 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f5fa0285
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 12:06:28 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0c347f8
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 12:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=pEUEsjHkytrkTyB/jUVpObmH8RI=; b=oFPyDc
 RFOJ75YMD5e+AXFqmjpltzFk8loDHXfc53M6IfC0YWsDV8SR/vEeBO3GPY5tLvCJ
 2ceRbHdVWOGFeE5z0H/D3EsgTQv7AHn4zaSyTUKYmHCEfpUiWzp29iAw8XwgKgOX
 aIjyQeNtfPPGC3z6uezQAyKxfzc12PemVtFasKgPGNPpEA2OqvKoNzA0Q0pEL2Br
 2o13bo0oUwM0K5lU9bbz49txg7wXLfWobnbQnq6sRI9yKX2BF9wFAYxD+roctid7
 IiKBhfWKBHMzzLYvbENejhtv58nkkEJ5FecgRRnF6qDev0BUkc5QPzo9TSJHyq58
 FnfZXkCV1BOddeuA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d898441a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Dec 2020 12:07:13 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id y4so4505439ybn.3
 for <wireguard@lists.zx2c4.com>; Sat, 19 Dec 2020 04:15:13 -0800 (PST)
X-Gm-Message-State: AOAM532jK499L7vOOEJeF/Pu0mePCIK3gc+NogOackjP/qb4LTuSWUuu
 Svj/AxyaPY4xjAUa+O+QBYzdKbQnp/O1SyBjqrM=
X-Google-Smtp-Source: ABdhPJyYeIlPefC1jXJEVQHiyI4MDgvCj22gGwzx3f92O7eoHr6tqVkJ5RMKCj70DkviuPxqk/nqp1+zmt8NB7Oc2WM=
X-Received: by 2002:a25:4845:: with SMTP id v66mr8234334yba.178.1608380112806; 
 Sat, 19 Dec 2020 04:15:12 -0800 (PST)
MIME-Version: 1.0
References: <90c10d21558d31825a56aac48692b080@essd.nl>
In-Reply-To: <90c10d21558d31825a56aac48692b080@essd.nl>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 19 Dec 2020 13:15:02 +0100
X-Gmail-Original-Message-ID: <CAHmME9qmYATYk2oV0T3OmnE4J1uTy49p09gyuRHdrGNZHKsejg@mail.gmail.com>
Message-ID: <CAHmME9qmYATYk2oV0T3OmnE4J1uTy49p09gyuRHdrGNZHKsejg@mail.gmail.com>
Subject: Re: "BUG: scheduling while atomic" on 5.4 kernels with PREEMPT_RT
To: erik@essd.nl
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Erik,

Thanks for the report. I've fixed this here:
https://git.zx2c4.com/wireguard-linux-compat/commit/?id=8dcc75dbbe0a7b82c7c9a9388a49d1e32723d8a9
This will be part of the next wireguard-linux-compat snapshot release.

Jason
