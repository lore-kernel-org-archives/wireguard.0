Return-Path: <SRS0=hP/g=5B=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA574C0044D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Mar 2020 11:25:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 251F920719
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Mar 2020 11:25:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fx8UGhs3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 251F920719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8889135b;
	Mon, 16 Mar 2020 11:19:26 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id baa4699c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Mar 2020 11:19:23 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id 5so6579309lfr.2
 for <wireguard@lists.zx2c4.com>; Mon, 16 Mar 2020 04:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=kkxGqfNARPVJSGj33jKuQTHk8K+ePG29LHdhiSRq3OU=;
 b=Fx8UGhs3JCRrcDpFHtZzpgIPbvE2vlAlAdUsiKrKy/a1iDB4NaXLKJQb4qxYm/WShh
 oRXk0kqAv0sk81VSrJVzfgfzxuGUWfoFqqZPIcJfIvfYMRrJ5wll8JPREQyBrNKW3ijV
 ZNp4Z80pdn+91I12wwQrIOdvvkpqnyLvwrdw2nB9pQJV+Eoxn868/IYLnFH7uzTJQtZZ
 zFSsQMgNYEnkddiHF9SWg7/YREXGOVaQ61x5a0ZmvFBfiCOVniBFR45/TUZoUKDEqXlr
 Tj4ZmJzFrKsJVxVZGqmBm5uRrnuTLaaTLYbltfpzgsrPc22sIZTjbVLsEquMKIdOnuKv
 i4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=kkxGqfNARPVJSGj33jKuQTHk8K+ePG29LHdhiSRq3OU=;
 b=TwRneNNN/vi4nK4U5RFkqT3YGGPE0XtGBR6KNEjDXzcS7KdaG4lwnaGddpVWz4sRUL
 Gg+JEgc2okDuaOfCrFMgdHui5e/Utz3IhR+0Cd0RkujA3Z7AD4x25AsJ+KoAC/x2fyH5
 Q9domG+fDlFbG76z/QXjkBdJvmh0h+iRpgN65THa6nyxVrhdV1v6Fl/MlYB8wchQBOjJ
 cUyWkVOR2na7rqT0jSj6lHIXPln5lwUGUr+Q+EnQNMe4AHYvWeyOdOM1eDYHwl2p+WBR
 gBFLXLZ5Smrnk3m4dKGPd4VBy2SpSfXIDdiiKJ6nAf1B2FTcx+Wms86NKOUqfFpFoJS3
 gKNQ==
X-Gm-Message-State: ANhLgQ2nWIUDAZjzTScZoCH46l80hpyXhFncH6YyGqVTyOU2Y4a+/31d
 JBGAs0Mz4O6spp8DaS0Qeug=
X-Google-Smtp-Source: ADFU+vvXr/B6G7zDQO6Z7dRDz5SLgO2ISwxatvzIJ2Qr99xUUyotL5WrEiP29EJFEj3lWh+rJyJ0Kw==
X-Received: by 2002:a05:6512:31d3:: with SMTP id
 j19mr16449793lfe.178.1584357926646; 
 Mon, 16 Mar 2020 04:25:26 -0700 (PDT)
Received: from PC-681 (134-103-235-80.sta.estpak.ee. [80.235.103.134])
 by smtp.gmail.com with ESMTPSA id u19sm617163ljk.12.2020.03.16.04.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 04:25:25 -0700 (PDT)
Message-ID: <66978c85ee43b1b89a6001479dbf0ed61438f26d.camel@gmail.com>
Subject: Re: Logging
From: Arti Zirk <arti.zirk@gmail.com>
To: "J.R. Oldroyd" <wgrd@opal.com>, wireguard@lists.zx2c4.com
Date: Mon, 16 Mar 2020 13:25:24 +0200
In-Reply-To: <20200315141659.771e0088@opal.com>
References: <20200315141659.771e0088@opal.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On P, 2020-03-15 at 14:16 +0100, J.R. Oldroyd wrote:
> New here.  Apologies if I am re-hashing something discussed before.
> I did read back a few months of this list and didn't see any relevant
> discussion.

Quite a lot of information can also be obtained via Linux Wireguard
module. wg(8) man page has a section on that. 

https://git.zx2c4.com/wireguard-tools/about/src/man/wg.8#DEBUGGING%20INFORMATION

