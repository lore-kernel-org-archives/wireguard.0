Return-Path: <SRS0=t+97=OC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=3.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B12EC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 Sep 2021 12:28:45 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E31F460FDC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 Sep 2021 12:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E31F460FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7c4b5fd;
	Sun, 12 Sep 2021 12:28:41 +0000 (UTC)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 770b620f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Sep 2021 12:28:38 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 f11-20020a17090aa78b00b0018e98a7cddaso4559711pjq.4
 for <wireguard@lists.zx2c4.com>; Sun, 12 Sep 2021 05:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=Nxj5qugGJZ3OfU5DU9KzYo4M87dsrXdRoYyPGVNDvzE=;
 b=l/kox6aTePju+J6q9mR1MCq57W1IQ5GK/dyvUxn516QejmlDnz/02Xya65wBzDhNjK
 9hYXo6uCmWYl9obxaNgmGVF+TD7AibBndwhisEp0zHRC5BQKzZIVLD+8kNcgS/NLIkUE
 BAAZzYmvKxp6Z1trYA1vSlUkvRvjmJGR4syaOeVHi27GCWCa2o8lTnOUbRzVs++0RlNb
 YOkCB+j2gIHD24o3F2y+HzQyMYicnPRU/hhAxCFvVFwWWcJSb7Ruyo5Wvjo8K6vf8t+7
 DHHQBlriyR6bfPVh9MmVtQwakL9RLowNsrwca5HyM5vBlNQafldN+MQGJHf9ithodNeH
 XIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=Nxj5qugGJZ3OfU5DU9KzYo4M87dsrXdRoYyPGVNDvzE=;
 b=YQDsQKKh5HHD/QbftaG7a1qvY84aTzlxcoo8RkGP5NpYARCjD4HGEOA6GaZYvrJUCH
 6wgPKXUXugpU291W/SgulHFk6b3VGVDxmupo5qRuq2Gar7GJW185l4ejI7gcWDK5MuHd
 DGL7j/g2XNckJwH/UxS0Sq0KqJFN9twgZFkPgnfqbCle94QJcvcBQN+Q6/KDn1r00bQC
 LU4DD3mZenpOfKCndY5C9WJnCyV+n5WlO4cuGjpmHKnIJBDaQYIDrv0FHqQ4VXVsDqXt
 IaJB4dT+Xxyj+mGogZgdcoaoHkHveFppfbe6ImyD/T/CYDeF8Cfg37DM4eo/Uy7ae6Sx
 SYNg==
X-Gm-Message-State: AOAM532wNVYvcM8/RSJOAjLDQduDuppGQLZMzBECB+8UdI+W2eXZfMP2
 0JjL9EKN+IeJhMhxEz3XIbA4g2n1pHo5AZaBipfFGNoqC1Y=
X-Google-Smtp-Source: ABdhPJyxPTN6GiLXCJIX+tTIeH1fj4DIeeRmz4TCIOM+w1a7HgoIvnmSWxXbrLPJaE/qROkMtnIcGw/iz/SSEWomVuk=
X-Received: by 2002:a17:902:7ecf:b0:138:fe47:3068 with SMTP id
 p15-20020a1709027ecf00b00138fe473068mr5981561plb.21.1631449716098; Sun, 12
 Sep 2021 05:28:36 -0700 (PDT)
MIME-Version: 1.0
From: Mo Balaa <buddybalaa@gmail.com>
Date: Sun, 12 Sep 2021 07:28:24 -0500
Message-ID: <CAKmhVkpNf0b54udsaB26W7a8ivct5RO66CF-NAhYZ+FSaGHNGg@mail.gmail.com>
Subject: Hiring: Free Software Network Security Engineer
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
Reply-To: buddybalaa@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hello WireGuards,

My company, Fractal Networks, is funding the development of a
self-hosted free software ecosystem targeted at self-hosting
enthusiasts and small to midsize enterprises.

Our primary mission is to empower online communities to take ownership
of their digital infrastructure and we are developing the free
software tools to make that possible.

Beyond that, we make existing free software applications highly
available, easy to deploy, manage and scale over personal (WireGuard
powered) overlay networks which brings me to the point of this post.

We are in need of free software network security engineers. Someone
who appreciates the importance of free software and would like to work
on developing network security tooling as free software.

Please email wireguardjobs@ether.ai if you would like to learn more
about this position.

Shout out to Jason and everyone else who works on WireGuard as free software.

Cheers,

Mo Balaa
CEO Founder
Fractal Networks
