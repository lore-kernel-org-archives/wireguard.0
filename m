Return-Path: <SRS0=TPeR=EF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A133C4741F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Oct 2020 15:59:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E0172067D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Oct 2020 15:59:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="PHqvM8aO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E0172067D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1964538d;
	Fri, 30 Oct 2020 15:57:23 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7407568a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Oct 2020 15:57:21 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22277751
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Oct 2020 15:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=2S5IqF6vSUMJErQ22QqWOr6YF8Q=; b=PHqvM8
 aOUq7r605pg6L1W+7BDdM8yA5Gs+3sPgoFqmwXGtBwmczhtHdLIE10aIvUHFtUq3
 WbVlFkHlwPUTTUTVtN2XlTWgzlUeJdZuosDx0GiAC1k0ExJiP7AQL24WkuFZHz8E
 YbZ4O8uomiFZRKB3X+p55Aah5prNLcLqmnS9RBazXVyRmENWwaYcLmlcjJFD5oXi
 MeWO7hFsq4REtUakhhAAe70nmTRHUklRgZHEAyT9BHKkAuVWR7e1BKtFDP2trT4+
 3YwcII7OIvEYkRlUgp2fGJtH1cL9Pxwt4mkoUok9NWb6UmrlCO5Q/cAEkMgbVwVU
 LsKRcQBfSFH/HSUQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0cd704b5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Oct 2020 15:58:07 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id o70so5535113ybc.1
 for <wireguard@lists.zx2c4.com>; Fri, 30 Oct 2020 08:59:38 -0700 (PDT)
X-Gm-Message-State: AOAM532nGpCZ0Y3STT28rYkvRPPF45eBWNAcEukxaQP7+4uBUv4VDmPB
 vYkh1xZejBjLc+QdXOuDLNKJw9lmzAmut5izHHc=
X-Google-Smtp-Source: ABdhPJwfmGEd7QmXVieilAkRD1pySOb2d8Aid3jg8BCDcFv42U0+of1Lrt/AAJn+M3dRhnWtRw1DQkgnNqxm6yaAPyY=
X-Received: by 2002:a25:705:: with SMTP id 5mr4582362ybh.239.1604073577838;
 Fri, 30 Oct 2020 08:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200424234327.1814-1-godisgovernment@gmail.com>
 <20200424234327.1814-3-godisgovernment@gmail.com>
In-Reply-To: <20200424234327.1814-3-godisgovernment@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 30 Oct 2020 16:59:27 +0100
X-Gmail-Original-Message-ID: <CAHmME9ovurYL5pCjkKbHKWyVZFWqaAL6Ls8aU6RYv+_Wgbp05w@mail.gmail.com>
Message-ID: <CAHmME9ovurYL5pCjkKbHKWyVZFWqaAL6Ls8aU6RYv+_Wgbp05w@mail.gmail.com>
Subject: Re: [PATCH 3/3] use RtlSubAuthoritySid instead of directly poking SID
To: Shawn Hoffman <godisgovernment@gmail.com>
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

Applied, thanks.
