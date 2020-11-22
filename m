Return-Path: <SRS0=ztv9=E4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C943C5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 22 Nov 2020 12:55:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20CC72078D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 22 Nov 2020 12:55:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="UKwogMD6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20CC72078D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f306d2e6;
	Sun, 22 Nov 2020 12:50:10 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4f90166a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Nov 2020 12:50:08 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04f509d3
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Nov 2020 12:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=/msWTEi5G/PKl577M/Lj+Eq7Isk=; b=UKwogM
 D6TTDFbN7d1Mcrdsh346Fv2JQn0NuGte/gdAAgYUGMCFSMEOI5FUFg/gAWRYAB1c
 PEpnngmf1GOYcLvjE5GypTtaVGcPYZAzKlBzbnsXsobmSRfEo94Fx0FjgB17Ect8
 4QX+5ryAPbw//zyo+s0ARe0xd3NfHcj2sAa1rj7VNihshQp91BTh9UUre/Xtp0/y
 K5/tB16NHQSoG8v+48/Bk3Tgx2M8NWJPQr2Gnbp8i++/g+/b2xtPIsHgJKIennP7
 rZH6qb+tB3xVskcvZSjx8h6t7q2ZikfW3MdBoA7YevFGDmFbYYDl2KOA9ytzR+kJ
 8eVq7foIqNhXOP/Q==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 93137860
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 22 Nov 2020 12:50:54 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id g15so13341533ybq.6
 for <wireguard@lists.zx2c4.com>; Sun, 22 Nov 2020 04:55:23 -0800 (PST)
X-Gm-Message-State: AOAM530jJnavZi4f4ZRP65970ZWhtO9AEKT1cT881DXSGMTd1ZPxMqSc
 i/k51h5SGhSVLhUXBKexxzNgstcf97748Fw9ltM=
X-Google-Smtp-Source: ABdhPJzvpt0HgkXKCjggYFep1o6qZIeu7tzXtQuxWDZLPCdz5vTQQrkIF3BOanEuPi7evBN/ypuHd7xXRS8R/p4hRDo=
X-Received: by 2002:a25:5084:: with SMTP id
 e126mr40173895ybb.239.1606049722935; 
 Sun, 22 Nov 2020 04:55:22 -0800 (PST)
MIME-Version: 1.0
References: <3415567b-5441-f3b1-7a38-f0bae3a14cfc@werehub.org>
 <CAHmME9riWVidRXjORFebv+UF3GyG1Hv+OrDhf4njvhGyQNw=4A@mail.gmail.com>
In-Reply-To: <CAHmME9riWVidRXjORFebv+UF3GyG1Hv+OrDhf4njvhGyQNw=4A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 22 Nov 2020 13:55:12 +0100
X-Gmail-Original-Message-ID: <CAHmME9pg02FefvzTR_jESKbM_a=_NQHhkrPFPC5bXbSGDjQ1sg@mail.gmail.com>
Message-ID: <CAHmME9pg02FefvzTR_jESKbM_a=_NQHhkrPFPC5bXbSGDjQ1sg@mail.gmail.com>
Subject: Re: Using WireGuard on Windows as non-admin - proper solution?
To: vh217@werehub.org
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

This too is a work in progress, but should give some idea of what's coming:

https://git.zx2c4.com/wireguard-windows/about/enterprise.md

Does it seem like this set of capabilities is suitable for what you
have in mind?
