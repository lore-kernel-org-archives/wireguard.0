Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB879C35671
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 09:10:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C953208C3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 09:10:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="nl2v3Pr+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C953208C3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 023e4961;
	Sun, 23 Feb 2020 09:07:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8264b0b
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 09:07:14 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55d59102
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 09:07:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8aa6992d
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 09:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=BcvciSVZLNT36fkqXCSf1IHRsW8=; b=nl2v3P
 r+0J4KMZMer1L3wvyRoJQFUZOFpr7iDWCYUV/lChYZNuKoe+67ucUvGWa4PdrWAF
 NZLzLOKsghJMRcXZTX+SG4unQ6dPOwQXi9qnvffpI10YAKziaABhvDvpQt8xa4ck
 HUy50bq0+Yqdw+qqcW5DUqmGNpe/Np3arqwvuyjQ5UUczjSWLm7rK71bZy940by+
 VcNqJ2n5L/0fZPvL90FhWhtmk35SGItStgF5Hcm7GG4PGKfi+r+ffvcQHLw0ls8y
 5tZQTYtEXitkjczjI3ZImWmcBFLH3N79xVPyUrzRVulX6RYQGuJ/yhrFC8rK9GLB
 eMPZ5LPa5/c2cQzA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e6730157
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 23 Feb 2020 09:07:14 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id g64so6019227otb.13
 for <wireguard@lists.zx2c4.com>; Sun, 23 Feb 2020 01:10:28 -0800 (PST)
X-Gm-Message-State: APjAAAVVnIhOSs/OZbh3j5eyDql6xJmzZcYnNG0qMVxnW5NhSK2Ki5dk
 KmHHTLsM5A935BeLFemwgHoFtknX1KY7UtFNRjk=
X-Google-Smtp-Source: APXvYqz1t2ufDe3XZdCkPkncr5vkeLms3e9IpA6eJ8s+BtguRs0sruXHM/QfSMcyqkUaSDm6fXptFm0Dii7oxWRAefU=
X-Received: by 2002:a9d:811:: with SMTP id 17mr37082049oty.369.1582449028333; 
 Sun, 23 Feb 2020 01:10:28 -0800 (PST)
MIME-Version: 1.0
References: <20200223072644.92645-1-tanioka404@gmail.com>
In-Reply-To: <20200223072644.92645-1-tanioka404@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 23 Feb 2020 10:10:17 +0100
X-Gmail-Original-Message-ID: <CAHmME9rP9=e7=uPWynjDGVNpMmzicW+Sh2VSsjfnL78pczW19w@mail.gmail.com>
Message-ID: <CAHmME9rP9=e7=uPWynjDGVNpMmzicW+Sh2VSsjfnL78pczW19w@mail.gmail.com>
Subject: Re: [PATCH wireguard-android] Japanese translation: Change "Deselect
 All" to "Toggle All".
To: Eiji Tanioka <tanioka404@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Applied, thanks!
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
