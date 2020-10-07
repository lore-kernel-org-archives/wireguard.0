Return-Path: <SRS0=8uvs=DO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1726DC4363C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Oct 2020 11:23:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6368206F0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Oct 2020 11:23:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="fVRObTsU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6368206F0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4d69a96;
	Wed, 7 Oct 2020 10:50:45 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 842448e1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Oct 2020 10:50:43 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5caf50d8
 for <wireguard@lists.zx2c4.com>; Wed, 7 Oct 2020 10:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=etIIIcZRtn6lYXvDf2nXEJjV5cM=; b=fVRObT
 sUgvCTsyF/XQ09Zp2VD6I+oEdStkPDml2mK/q2RXgcg/2/s0EKaPeRfYBvVE/qjr
 QNz8Y7VdAM8FPPvbmePvhkTLvjLWcUODl1GXNUuS//K6O/jgbY4vcM8hR4Rdqm8g
 32KX0mtMNfnLRMgAMMD2osiXbVrdlty027Yu9OJs9g+qMcJ9sJiU1hyUt6rEtomG
 e8kIWVlRJsvWMsJh+ZlozPPEwEiDHX2wOeABBG+/kjE4BEwpKX7rLaD3uABSQFgO
 hI7zNfuxYV5Fs8SQoAGFqKRzqlzsWZ5cSNpJWdGLIcLHeN3JVii64SAElyulr7MZ
 KqvQTfaJc3C9Y7pQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 09d49e97
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Oct 2020 10:50:43 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id d197so1970191iof.0
 for <wireguard@lists.zx2c4.com>; Wed, 07 Oct 2020 04:23:20 -0700 (PDT)
X-Gm-Message-State: AOAM5320oQXaGGyQR8uj4Vs1WD277eQp9j6sHr7UQrKQtBTc7jLkSwIQ
 DPhbD88W+CrVPcUGrM2tMH4XekZfVWWc5k8oiKs=
X-Google-Smtp-Source: ABdhPJzyqlyx2yvSzsv6Ji6FRne3uI+FlYN/9bZOXuIp0A6WU3Hlm2uXiUscFTLVkSVAl511at8Uxym+SHv9TYDzJ4Q=
X-Received: by 2002:a05:6638:f03:: with SMTP id
 h3mr2417754jas.36.1602069799916; 
 Wed, 07 Oct 2020 04:23:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9rckipsdZYW+LA=x6wCMybdFFA+VqoogFXnR=kHYiCteg@mail.gmail.com>
In-Reply-To: <CAHmME9rckipsdZYW+LA=x6wCMybdFFA+VqoogFXnR=kHYiCteg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 7 Oct 2020 13:23:09 +0200
X-Gmail-Original-Message-ID: <CAHmME9qVyk-7xou1K=97xdrg4UAA3W8YO6q6jevWc6YY6aTxSg@mail.gmail.com>
Message-ID: <CAHmME9qVyk-7xou1K=97xdrg4UAA3W8YO6q6jevWc6YY6aTxSg@mail.gmail.com>
Subject: Re: final call for Ubuntu 14.04 WireGuard support
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: unit193@ubuntu.com
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

An update on this thread: with dwindling usage and the poor quality of
Canonical's ESM offering, 14.04 support has been sunset and the PPA
removed.

All users should update to a newer distro.
