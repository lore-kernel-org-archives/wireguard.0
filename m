Return-Path: <SRS0=TPeR=EF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22EFC4741F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Oct 2020 16:05:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA1BB20724
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 30 Oct 2020 16:05:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="eiWyig0b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA1BB20724
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7d07ef4;
	Fri, 30 Oct 2020 16:03:10 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e25bcf96
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Oct 2020 16:03:08 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d4bd7f5
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Oct 2020 16:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=GKeOV1X3RAXb9GGmv+KIsMNrkjM=; b=eiWyig
 0bht+Sr9TnCXZUHj41RLI7wlyOwEpO0vvdMOMMo/RmLBEl3BzG/MK1NHtEx9fCfq
 DVwfpaDOnM3dMGSfSImkx0S96MfX9zfQJ1yzmEzLIxpdAiWfViRptnQmvIHz9rgR
 IA763bM9SBwGEoWU3JcVvtU2zN/bdVHAcnZ6QymHqDZHUIZ7v6ObP6T0iCv7l7Tq
 c5HZh2u1wlWsG2gyR9Jcm2puD9zcV27EpS77LWPg+NTHpLbvooJWCu1LaKs+RGP4
 ucBcdABtxMrVC/k39YVhkA2NIEI8DzRoW33Ac7LN4r457OnQG7ozfirpULnvA0OS
 nfEwS9Mi+827oDzw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d33c0ed4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Oct 2020 16:03:54 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id h196so5545847ybg.4
 for <wireguard@lists.zx2c4.com>; Fri, 30 Oct 2020 09:05:25 -0700 (PDT)
X-Gm-Message-State: AOAM533Q3Xp1I8nrMcgkV5kWHahE2f2AO9mevpBkf5TSRmNU11Bbcu1u
 vwG5rA5hcEZgsFlO/G9ju/O72kAKaFeLg6cY2XY=
X-Google-Smtp-Source: ABdhPJyZKSQcoqpuj06ASbpypU24/J+TzE30H86oP+g8E1tELVG1fI0bdpiQ9IvWYwPBfnelBL00qillInXBGoTjY6I=
X-Received: by 2002:a25:bbc4:: with SMTP id c4mr4600039ybk.178.1604073924689; 
 Fri, 30 Oct 2020 09:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200424234327.1814-1-godisgovernment@gmail.com>
In-Reply-To: <20200424234327.1814-1-godisgovernment@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 30 Oct 2020 17:05:14 +0100
X-Gmail-Original-Message-ID: <CAHmME9onLURDBEGucx=C=s3=e20JvrddeG8C1HKsaes5UKmA1A@mail.gmail.com>
Message-ID: <CAHmME9onLURDBEGucx=C=s3=e20JvrddeG8C1HKsaes5UKmA1A@mail.gmail.com>
Subject: Re: [PATCH 1/3] fix possible TunDispatchSecurityDescriptor leak.
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

Thanks for the report. Fixed slightly differently here
https://git.zx2c4.com/wintun/commit/?id=b19c7abd417e62dbb08a8d3aa4db96ce9cfd0830
