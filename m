Return-Path: <SRS0=k8rb=AH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F5AC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 26 Jun 2020 20:42:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 010E5204EC
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 26 Jun 2020 20:42:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="sWetHnbi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 010E5204EC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f199eecb;
	Fri, 26 Jun 2020 20:23:23 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2f6f8f77
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 Jun 2020 20:23:20 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 862e184c
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 Jun 2020 20:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=LQ/xML1Ubj+/zCUO2AAA93rDimA=; b=sWetHn
 biLA3EoRV7zIv7kf9avQBEKF/MHYz1NdJubpFczan9ttci+8kj8ZRCY0Tl2F9JfG
 wbMud/PhhxTOQT/gtGkHoQ7z9ue7yNsy3Bwtud5HmwnXVTlUg1dZmOCsoYv/jbri
 NG0OXg6tenx2fudGeYvtrwywhdhOBLLu9Yk4tkfVCf3ViAR7vfUpTYfNYYRB43+i
 XOpLWGLgvnfmq+LuaZSCTQxlchZNoxntGn96oUIux8F8cMZGOVIyT45VS5RC1GF5
 IXDty2VPk6pe/9AhnYoUyC6WZcrFZyQNQ8qLkmdAb8Urb/HZWG/aVB6vXbQWYFqy
 Xvpt9GXTAqdGkwNA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 95585a26
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 26 Jun 2020 20:23:20 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id h4so11200892ior.5
 for <wireguard@lists.zx2c4.com>; Fri, 26 Jun 2020 13:42:39 -0700 (PDT)
X-Gm-Message-State: AOAM533Z0v2kQJDRcQ28C2R3Dqsnzu3W5ob5cwTdXwhtBq8L/hUtSxLq
 P2MwdXaadPuaJBzKaJeMZ9f0idt2sFOIqvROcT8=
X-Google-Smtp-Source: ABdhPJyUlbUS0quvX39lNrXuVyxZIXig+sgI1bg6ao58akJFoJ+yzUfBHe2Lcwh615g/Kt+sn7MArJt3WbRchuR3xAs=
X-Received: by 2002:a05:6602:2c45:: with SMTP id
 x5mr5259296iov.80.1593204158515; 
 Fri, 26 Jun 2020 13:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200626201330.325840-1-ndev@hwipl.net>
 <CAHmME9r7Q_+_3ePj4OzxZOkkrSdKA_THNjk6YjHxTQyNA2iaAw@mail.gmail.com>
In-Reply-To: <CAHmME9r7Q_+_3ePj4OzxZOkkrSdKA_THNjk6YjHxTQyNA2iaAw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 26 Jun 2020 14:42:27 -0600
X-Gmail-Original-Message-ID: <CAHmME9pRX6hPDZacAzzeAdQaSV4ZSEvLc=N6cAr+t8ReH146jg@mail.gmail.com>
Message-ID: <CAHmME9pRX6hPDZacAzzeAdQaSV4ZSEvLc=N6cAr+t8ReH146jg@mail.gmail.com>
Subject: Re: wireguard: problem sending via libpcap's packet socket
To: Hans Wippel <ndev@hwipl.net>
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

Oh, I meant to ask earlier: if you've got some easy repro code for
this, that'd save a bit of trouble.

Jason
