Return-Path: <SRS0=UBEJ=C6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50EFC43465
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Sep 2020 11:24:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B161120874
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Sep 2020 11:24:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="KHlEC33A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B161120874
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1ac965f;
	Mon, 21 Sep 2020 10:54:18 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d2eac6bb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Sep 2020 10:54:16 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 767095f0
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Sep 2020 10:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=q0xdAUbDua6nbtZuBLzS1cCs8A0=; b=KHlEC3
 3AAwAStzUv6i6qCBa5dCPMiIzRGzZmrtC/o+QUG0RyETEoyRGQCP4bwI589FNlzt
 3DnIZtpL759kx6luiMcO7/oRMQDSB/V5QN7xGS5YRsJHpmDwjPMaYeHgj+26rxK0
 DZf349+p/iDfh6+m4emoN2dqurt3tMAl3EZNs28T41RwA0E2mk+PLjk+pu9p/9dQ
 tKksqMFXdHrNMo/x1oVIg9BFHcbDD7psyK4ii7wRkxx+DJy1h8uFcNgiAyge6y3/
 ruhuBTSjiwVVzVkPjVIta4omlbSrY5bQg/a+rgkrI0P+H9vnQp9xZ1xVqtjvh7zh
 llKZhwVow4UzjW0w==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7fc8f95f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Sep 2020 10:54:16 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id x18so10845850ila.7
 for <wireguard@lists.zx2c4.com>; Mon, 21 Sep 2020 04:24:49 -0700 (PDT)
X-Gm-Message-State: AOAM531UNUZv2IvKghe6EAyuuEdvXqYuG8nYGt0pzdbKWyRP0JOj6ef2
 gWwZwPfHM8b+jXHRArh67IjdPGU6DLOyeNWa5+A=
X-Google-Smtp-Source: ABdhPJw6biqNP/JOx6BgfW8NSJDOhdbum0olZ8GomZ+8TD37zmxeTKcAKaqNb5zunhKD2W8J1yIAPE1fMtHD8rlRFgk=
X-Received: by 2002:a92:d905:: with SMTP id s5mr36302455iln.224.1600687488575; 
 Mon, 21 Sep 2020 04:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <9b4ba85a-633a-04ed-ca15-eb29d476cd57@pallas.us>
In-Reply-To: <9b4ba85a-633a-04ed-ca15-eb29d476cd57@pallas.us>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 21 Sep 2020 13:24:37 +0200
X-Gmail-Original-Message-ID: <CAHmME9rU3AhppjN+6OM8vYHHbpK1Fxj2chVCCyHQBL-XvKk2uA@mail.gmail.com>
Message-ID: <CAHmME9rU3AhppjN+6OM8vYHHbpK1Fxj2chVCCyHQBL-XvKk2uA@mail.gmail.com>
Subject: Re: Interest in adding multicast support to Wireguard?
To: Derrick Lyndon Pallas <derrick@pallas.us>
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

We've discussed this extensively and repeatedly. I made a few
proposals a few years ago that we discussed. It doesn't fit into
WireGuard's strong binding model.

Jason
