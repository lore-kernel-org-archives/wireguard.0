Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83073C2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 08:08:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81a0cfb1;
	Tue, 20 May 2025 23:04:24 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fa9cbb3d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 May 2025 23:04:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E0990614B8
 for <wireguard@lists.zx2c4.com>; Tue, 20 May 2025 23:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B86CC4CEED
 for <wireguard@lists.zx2c4.com>; Tue, 20 May 2025 23:04:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="J87x2KuN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1747782259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jj9WbZBf1pDpZQYcDqSEaHQKzZtiH0PoQZJJljsDp54=;
 b=J87x2KuNX9FcVp9UsFzjwFaszYsxbL4WPQ1rN22TcyGFzPW/q/29PqzC8y4WXYDXT9lJcR
 LVsipj/rFm8GWJouPER2/dLYxrZU844TqPIMinr2btR319yW9qTA9IwNtk/MU2FzA7twMG
 uaCNATK8u4V5o7mJnztA60zcF7uQLjc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 83f46ae8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 May 2025 23:04:18 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-60658e1fedfso3016364eaf.2
 for <wireguard@lists.zx2c4.com>; Tue, 20 May 2025 16:04:18 -0700 (PDT)
X-Gm-Message-State: AOJu0YzqUidYa3IS+jkdX+nYWuF3CIcbnHX3toe8bH9hxPJEzAKv4QBb
 YFU6nk8pVhC84lCuu5fk35cZM2r6I3Cs1i0Qh92YSaKIQe8XtovUXBfCCZat3bvrl2ml4RKs06W
 /bxSNp32BQMgLcIDPgeey5hvfh+jxL4c=
X-Google-Smtp-Source: AGHT+IGua5lRYCYxCVyP9ru9Dtt6m0AGXsmVl6B3ip2GiGGZGuxm8qVXG0CkIbuJgrg+b49EAWW6U6wDHkFBBnpcnS8=
X-Received: by 2002:a05:6820:1795:b0:60a:32a:b016 with SMTP id
 006d021491bc7-60a032ab17emr9120616eaf.6.1747782257851; Tue, 20 May 2025
 16:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240204101029.1805-1-athoik@gmail.com>
In-Reply-To: <20240204101029.1805-1-athoik@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 21 May 2025 01:04:06 +0200
X-Gmail-Original-Message-ID: <CAHmME9o8t4XGVK+-udDuecxLDgRdNP50qfAwZ9Fpg=AQei37Gg@mail.gmail.com>
X-Gm-Features: AX0GCFslJIgcQNqlHevBUIK6lzRVrTbZHrIe7HBKMA7qEBi3xFeDryLmkMCSjFQ
Message-ID: <CAHmME9o8t4XGVK+-udDuecxLDgRdNP50qfAwZ9Fpg=AQei37Gg@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: linux: check iptables existance prior trying
 restore
To: Athanasios Oikonomou <athoik@gmail.com>
Cc: wireguard@lists.zx2c4.com
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

Shouldn't this be an error if it can't apply the rule, though? What
it's doing is somewhat important. Not sure I like the idea of failing open.
