Return-Path: <SRS0=BFU5=5G=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3797AC4332B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 Mar 2020 13:49:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A031820754
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 Mar 2020 13:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A031820754
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=msfjarvis.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94a5be8c;
	Sat, 21 Mar 2020 13:42:30 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e195f832
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Mar 2020 13:42:29 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d8so10272150qka.2
 for <wireguard@lists.zx2c4.com>; Sat, 21 Mar 2020 06:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eyYX+iYJXu91HPPLbtjliwEuh2xwnVJwaio8DBF7f4s=;
 b=EtOVofNmh+NkDfqKbnvvTba0cHmFLZTN+iw9BRaPbhx7HVTLNgZFB9wx8IMYI+ujGi
 hSNFC1DXxbr2aHlP1Xl7YqHOzHngfX2m6EdiMV9rTpTdIpjIdohvoP0hbwlA+C+oADx5
 Go3wN6mgocP4pvhkitwM4J8qtzJcSkXOv3vVcmk9aOpk/PAUo40oiF5KStWP6q8O5lk4
 ghdl9HSWqq+29zCQfz0fDv6cMBghHMN6nF8pS92/8QjEMAweaIHNF9x/hjsBPIsyozjw
 wIOUFt6BFqohsdBbBHllH+/NMbhCOqw44RxcCUq4NrcaApTwA/IY0KaWeZ09X1zyiSed
 qP5Q==
X-Gm-Message-State: ANhLgQ2jiYG9joYNBDWpfh/iQqXuBmUQ5tV7m9Wxd+ZJY5dos1TsH08X
 FGw96lzdTThFoV9qykbj5PuyaEywN9o=
X-Google-Smtp-Source: ADFU+vsuiBKfZNfflw5HBzmJDd0RZ66i5riM0DYQmTi4O7s5XykddthNdWuMa+VWopJX2zVnGq7ZbA==
X-Received: by 2002:a37:404f:: with SMTP id n76mr13054698qka.442.1584798552618; 
 Sat, 21 Mar 2020 06:49:12 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com.
 [209.85.219.175])
 by smtp.gmail.com with ESMTPSA id 65sm7116889qtc.4.2020.03.21.06.49.12
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Mar 2020 06:49:12 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id i4so4184102ybl.3
 for <wireguard@lists.zx2c4.com>; Sat, 21 Mar 2020 06:49:12 -0700 (PDT)
X-Received: by 2002:a25:8251:: with SMTP id d17mr1915641ybn.7.1584798551951;
 Sat, 21 Mar 2020 06:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200321133045.26722-1-tanioka404@gmail.com>
In-Reply-To: <20200321133045.26722-1-tanioka404@gmail.com>
From: Harsh Shandilya <me@msfjarvis.dev>
Date: Sat, 21 Mar 2020 19:19:00 +0530
X-Gmail-Original-Message-ID: <CALpmF+EG5-Q8E5FzZcTHcgVJmiB-0b89mtUTB-WMP2u7GchWmQ@mail.gmail.com>
Message-ID: <CALpmF+EG5-Q8E5FzZcTHcgVJmiB-0b89mtUTB-WMP2u7GchWmQ@mail.gmail.com>
Subject: Re: [PATCH wireguard-android] strings: Update Japanese translation.
To: Eiji Tanioka <tanioka404@gmail.com>
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

On Sat, 21 Mar 2020 at 19:12, Eiji Tanioka <tanioka404@gmail.com> wrote:
>
> Update correspond to commit 029a4a8.
>
> Signed-off-by: Eiji Tanioka <tanioka404@gmail.com>
> ---
>  ui/src/main/res/values-ja/strings.xml | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks!
