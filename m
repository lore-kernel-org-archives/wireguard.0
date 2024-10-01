Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E29D10F3D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 02:19:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6271ad61;
	Mon, 18 Nov 2024 01:37:35 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7bad74eb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 1 Oct 2024 16:26:57 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-20b40c7fd8eso234875ad.0
 for <wireguard@lists.zx2c4.com>; Tue, 01 Oct 2024 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1727800016; x=1728404816; darn=lists.zx2c4.com;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VrBnfLC+zVG9IFbwmPZHicLTfNZlFBrRSS5dHeuq9lc=;
 b=yR52J864BwIl3EKSAJG/I8TQFnRZBxgIZyEcJsa9jmdALV2kU9vpwLkv4BKaE4A0ca
 Gi/hI2kREkzMTYolhN+PGE+ag2ifr9L5crzx35Pp8bvXiTRSExJjkc6S8hlDptb6/RmQ
 8/3fqPlpn8i+F+jHKVyLVhdBUDdWGjz4y4G4QnpQcT6cjuKN3QFUTYAvNH34B8X7uQAC
 owS1B5Hny6Mb1/uNg+flmaeDjhCU3/X+N9a9vVLmJDV4xpVLscK03MA5kYXQYeiAF1L8
 CNZXYk9CBFLjiVrdZVca5ojd6kGNjeHvM7oGHoHIBFA/KVD5vcnCx/BGMnz6HAK/Jn3a
 zfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727800016; x=1728404816;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VrBnfLC+zVG9IFbwmPZHicLTfNZlFBrRSS5dHeuq9lc=;
 b=pQziM6EraKJzZazY8BGLsRtisOq308OAWv2fXlg1mXa+1qoWPMT1feRt4yJCTB65Iy
 CAsY6EQqTLssK665dUsv9vTquYJIwqKH+66tmMTcfkt1eAZ4kla6sjmitclqk0wSu1zj
 u3XyZ8+AZBTWCaXN1wmALXCGpovKaqlsrB9pzJZYxR2QOj+Pn9aUKZF/cqLTlCj0o5p7
 M/tsTvlwnX976WsBLzDSopWUD5Tv9/wb+D+wJsfxcR9a5vcxdhvD/0nEBoMymGfm33jq
 wubc9UqxXfzBrk5xTt9xY5+3Wwy+D6Uf1Zb9f8Fi0S+x2FQOvwMmgUXXYaWThm1NstC6
 PGWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXay/edENN2aO63DIgh5rOmG7VtPIIoSl0W+SDeQvIBPbPQ5rkRkYZVwoAwYky6eNzh/iY4euzEiec=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxLy16dWz8Hr/tVuuc5BrcWLzx6rUgkb3Jy+6UCitZ1Au9m3N2w
 KSCytQMCdHvLU6U50r9Iy05763nr36bbx1fDI5VtSRr8aMKS7FE4T4KbabPfd5PrZNDqXHUr4Tj
 y/8RgYVTxKHoOpc3aj6MLAQVOce75rK39y+ip
X-Google-Smtp-Source: AGHT+IHdrQbAqpejQaNhVvnlIZgEwuDo5VjmqDx/kOgnNdj+gWj66NYWwVdsH2uRpgkV2fh2pLnWhSrh6EUiZbbDSoI=
X-Received: by 2002:a17:903:228a:b0:20b:a3f7:ca8e with SMTP id
 d9443c01a7336-20bb0804a02mr2571395ad.13.1727800015581; Tue, 01 Oct 2024
 09:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240905200551.4099064-1-jrife@google.com>
In-Reply-To: <20240905200551.4099064-1-jrife@google.com>
From: Jordan Rife <jrife@google.com>
Date: Tue, 1 Oct 2024 09:26:44 -0700
Message-ID: <CADKFtnQGCic1fAQFbwBZVmYsZb2jykaBzPMrOMVuvENxUSZ6bQ@mail.gmail.com>
Subject: Re: [PATCH v2 net-next] wireguard: allowedips: Add
 WGALLOWEDIP_F_REMOVE_ME flag
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, 
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
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

Hi Jason,

Just reaching out to see if you've had a chance to take a look at this. Thanks!

-Jordan
