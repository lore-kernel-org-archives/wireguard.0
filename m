Return-Path: <SRS0=93XJ=IF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4A8C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 16:29:01 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 374ED64E40
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 16:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 374ED64E40
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5041072e;
	Sun, 7 Mar 2021 16:27:16 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 276ac02d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Mar 2021 16:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615134432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qBUlSbqUPdBXHGEsn8SRKXdgDREJB0vkqtytcWCk9XU=;
 b=P5Miz/CSels2GHYr2iz3vg1FoLnGDwkmmanMlV+Peesg5Vk9HradBkdFDkHvPwPpQfHT7G
 areW3yc5pfe0E/GP3N/RYPSW8F9HtieDGtdFtgiGctlzifw3d4NNCfdi/EMi1slCe4UWo0
 XeTbgIvAY1+GoOjbiR0m8xjm1uGtKhM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2fe7b173
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 7 Mar 2021 16:27:12 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id p186so7622906ybg.2
 for <wireguard@lists.zx2c4.com>; Sun, 07 Mar 2021 08:27:12 -0800 (PST)
X-Gm-Message-State: AOAM530tUb2HOsHbKuArRm518/bMpcK2GSvcDbNreP2a/Wsca7rsbytH
 gl5A2mY/J0rVztm/o9gSj+mC0GeuykJxnnA5xeE=
X-Google-Smtp-Source: ABdhPJxxBeE2iolk0mII2Ix4cWRlDg9ltIc0R0+Z0WrSaCRrdJssjIk+5gsq2iRYFYujl3tsOA/q1/Q5I0jfawN9AIE=
X-Received: by 2002:a25:1442:: with SMTP id 63mr27237251ybu.123.1615134431934; 
 Sun, 07 Mar 2021 08:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20210306095820.1039294-1-kay.diam@gmail.com>
 <20210307162024.1153144-1-kay.diam@gmail.com>
In-Reply-To: <20210307162024.1153144-1-kay.diam@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 7 Mar 2021 09:27:01 -0700
X-Gmail-Original-Message-ID: <CAHmME9qwD5EyUYQbF3ZYDzk5fYU0LdwLJMs+5aeA8SVr0=+mDA@mail.gmail.com>
Message-ID: <CAHmME9qwD5EyUYQbF3ZYDzk5fYU0LdwLJMs+5aeA8SVr0=+mDA@mail.gmail.com>
Subject: Re: [PATCH] Windows: add convertInterfaceIndexToLUID syscall
To: kayrus <kay.diam@gmail.com>
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

Applied, thanks:
https://git.zx2c4.com/wireguard-windows/commit/?id=39f3c66fde966b74d093166f7a6504b6d082735f
