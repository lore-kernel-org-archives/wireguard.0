Return-Path: <SRS0=8LYU=AY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2795CC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 23:59:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB4832184D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 23:59:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Q+HdyS0T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB4832184D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7acb247a;
	Mon, 13 Jul 2020 23:37:19 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1c370e57
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jul 2020 23:37:17 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c40aa9e6
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jul 2020 23:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=4Z7IGC/7Ldm/RSnzNWCDTyZSb7I=; b=Q+HdyS
 0T62wYH0SM7OStOuuIjBlwgxqZAuNNJgVrvRBtZXIrZuSGXgaAcdvmbwtAPTjKuq
 XAWmf+ZK1BI/1tsTi4pZiDz+3EaguN5YOJzJHCoqv3g2nH2q5nvAbOZXD2ikqwoG
 CzTXVTO3Zs+v2rZ2ZHYVSTlpYGCAMVXCMkJ3ODYGCt5lK4QRftOPv7vy/ibGqrLb
 F+mZPR/M5QTpea8a2br9zJwgp9Q61LcV0vdcDwUV7payzG1UIiaPqes+SQP4oLD8
 sjxkGpS+LhpvBlj5dn6UCDkUvYIGI4sWEwmLmzh6ZC14XCYcUQ5SE63dcLvGk8GS
 RSVTf4sieH2tH0VA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 33635171
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jul 2020 23:37:16 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id l1so15456554ioh.5
 for <wireguard@lists.zx2c4.com>; Mon, 13 Jul 2020 16:58:49 -0700 (PDT)
X-Gm-Message-State: AOAM532NfwlfSDZ7zV9oGsKMEUqY5mgu3gcXQSQfYIEtVoO1/B4kPxTz
 DWsKHw6JT9jBWK9PvhsakYMdDsbc1r7khQveZgc=
X-Google-Smtp-Source: ABdhPJwKoX6KspFz1MZ/jS04ARL33X4y28r0ObAtSx85UgQ9ah9WefS0Zwe/E1kFKHybfBJJljLoi8OZKYGFRZw5UVg=
X-Received: by 2002:a6b:5813:: with SMTP id m19mr2283103iob.29.1594684728954; 
 Mon, 13 Jul 2020 16:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200707111513.28080-1-tklauser@distanz.ch>
In-Reply-To: <20200707111513.28080-1-tklauser@distanz.ch>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 13 Jul 2020 17:58:38 -0600
X-Gmail-Original-Message-ID: <CAHmME9oMJCzHfB7LO7Q3PieCMq5E=Lt_T=WHVT1PAG_89=oddg@mail.gmail.com>
Message-ID: <CAHmME9oMJCzHfB7LO7Q3PieCMq5E=Lt_T=WHVT1PAG_89=oddg@mail.gmail.com>
Subject: Re: [PATCH] device: use RTMGRP_IPV4_ROUTE to specify multicast groups
 mask
To: Tobias Klauser <tklauser@distanz.ch>
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

Applied, thanks. -jason
