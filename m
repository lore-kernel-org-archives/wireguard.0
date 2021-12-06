Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CB1C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Dec 2021 14:48:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a9adcdd3;
	Mon, 6 Dec 2021 14:48:39 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 717ad80e
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Dec 2021 14:48:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AAC4CB810F3
 for <wireguard@lists.zx2c4.com>; Mon,  6 Dec 2021 14:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D578C341C1
 for <wireguard@lists.zx2c4.com>; Mon,  6 Dec 2021 14:48:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="aJaiv2Qk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1638802113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rCuyzrGwbRV/hrv2Gh9ELhOWwVlCS4sHGJZn9KrPZjo=;
 b=aJaiv2Qk3IC0gc3GADCN3JxnMyQn/uzjinp/Cyl3iIc9A2s9gjBwEuEk+AYUd/58yZhx00
 l5+/OTZoAA2u5AUrczDQvYHKa+9y5t5blmL7LZ01SoKVWrEfPX+sULY9vUMF1NTFoQPmmm
 bsmNBE+R9TX91qW8mDOFObgHcqHZ6ns=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5f40e88a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Dec 2021 14:48:33 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id y68so32059068ybe.1
 for <wireguard@lists.zx2c4.com>; Mon, 06 Dec 2021 06:48:33 -0800 (PST)
X-Gm-Message-State: AOAM533wbexkpI35gtwzxNtrAWK2Kb9cTWd6k12cg0Eb1sHNA+IF5drp
 icXMrXTAz2u+RhrrEBVny1mKpzFk8rWrS4wcGUQ=
X-Google-Smtp-Source: ABdhPJxaXUVYFkfnkQ9qhiErLV4IqJN/NcMzHnLWFHOwQxofzYwDM+SKcsngPZXgYl3yziLwz9BtfzPA/O0Yj53d3Ag=
X-Received: by 2002:a25:2412:: with SMTP id k18mr43203513ybk.121.1638802112718; 
 Mon, 06 Dec 2021 06:48:32 -0800 (PST)
MIME-Version: 1.0
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9o38fA4_nDVyS9FvO1EL-Z4fS+a2eCo6Xq7VzMSrPYNKQ@mail.gmail.com>
 <c772d6c2-dac7-8c11-7c41-aaa6435a0bd6@grsecurity.net>
 <CAHmME9oyopU8euSuVy7su91fia6xG5V+9i+QodCBdTGdR_rD5Q@mail.gmail.com>
 <3a2d41dc-effb-158c-4a52-d7eb282ecb7e@grsecurity.net>
In-Reply-To: <3a2d41dc-effb-158c-4a52-d7eb282ecb7e@grsecurity.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 6 Dec 2021 15:48:21 +0100
X-Gmail-Original-Message-ID: <CAHmME9r4gspVnZGhgHhB1nR6FvOaryLoZvAJwpRU=-=rrbdoqQ@mail.gmail.com>
Message-ID: <CAHmME9r4gspVnZGhgHhB1nR6FvOaryLoZvAJwpRU=-=rrbdoqQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
To: Mathias Krause <minipli@grsecurity.net>
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

Hey Mathias,

I couldn't repro with a new kernel either. Only these old ones.

Here are some object files for the logs in the earlier message:
https://data.zx2c4.com/curve25519-miscompile-a87440f8-7d1e-4179-be83-c82b4636a448.tar.zst

Jason
