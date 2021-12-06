Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AB1C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Dec 2021 16:32:16 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 66791af5;
	Mon, 6 Dec 2021 16:27:27 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 9313b34b
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Dec 2021 16:27:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 05EC6CE16C7
 for <wireguard@lists.zx2c4.com>; Mon,  6 Dec 2021 16:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06596C341C1
 for <wireguard@lists.zx2c4.com>; Mon,  6 Dec 2021 16:27:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="frF4rT6d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1638808039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZAPaTPa7ixN5qjMbpo7R200g/OrCtKq3jqq427NxiIA=;
 b=frF4rT6d8oiHYjOAYmjB/dKIItqqzoCMVpAtI3Qzl+Y41IkapMGu6a9o9cnMnS4mavWm93
 whLmYIOSiQAwcwrLbNb6L7MUHVQoETX/z1BVVsvJSQEIYj+dkMyokdHleoi4y/5pYy9o5h
 TDPr2lYPQe2Vpmvv8GS7FJLMiyFbEao=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f92cde54
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Dec 2021 16:27:19 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id 131so32828101ybc.7
 for <wireguard@lists.zx2c4.com>; Mon, 06 Dec 2021 08:27:19 -0800 (PST)
X-Gm-Message-State: AOAM530x6iUbj2w5K8TlbHkkHxKqfboh93eYfaQLERLTcOkRwg75jpbE
 OLlkAevqqFU2ngGOEo3QxaGXYj6PMTlIyY7O0kA=
X-Google-Smtp-Source: ABdhPJzNWqQeV9khRNPxImyuQIjge1dCUs8ypRqQkWzBw5I7oujmZTaeYdeE7dRGhK0A5w9dKspm3dwDt4SROhrQp2M=
X-Received: by 2002:a5b:c81:: with SMTP id i1mr14143433ybq.115.1638808038234; 
 Mon, 06 Dec 2021 08:27:18 -0800 (PST)
MIME-Version: 1.0
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9o38fA4_nDVyS9FvO1EL-Z4fS+a2eCo6Xq7VzMSrPYNKQ@mail.gmail.com>
 <c772d6c2-dac7-8c11-7c41-aaa6435a0bd6@grsecurity.net>
 <CAHmME9oyopU8euSuVy7su91fia6xG5V+9i+QodCBdTGdR_rD5Q@mail.gmail.com>
 <3a2d41dc-effb-158c-4a52-d7eb282ecb7e@grsecurity.net>
 <CAHmME9r4gspVnZGhgHhB1nR6FvOaryLoZvAJwpRU=-=rrbdoqQ@mail.gmail.com>
 <5bcdecdb-fbc0-4714-895d-1b1e6a87287a@grsecurity.net>
In-Reply-To: <5bcdecdb-fbc0-4714-895d-1b1e6a87287a@grsecurity.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 6 Dec 2021 17:27:07 +0100
X-Gmail-Original-Message-ID: <CAHmME9opYoaoSTHud9sF4BOFBPS=NVYPJSGQr37bxNai26MGFg@mail.gmail.com>
Message-ID: <CAHmME9opYoaoSTHud9sF4BOFBPS=NVYPJSGQr37bxNai26MGFg@mail.gmail.com>
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

Hi Mathias,

Oh, you're right about recent gcc. That actually _is_ intended, yet
they still fail. It would seem, then, that the problem is not so much
gcc version as it is some kernel patch that never made it to these
ancient kernels.

Jason
