Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E49DC6379F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Feb 2023 23:00:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 909ea5b1;
	Tue, 7 Feb 2023 22:54:39 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1357ecfd
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Feb 2023 22:54:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B65B0B81B35
 for <wireguard@lists.zx2c4.com>; Tue,  7 Feb 2023 22:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B21C4339E
 for <wireguard@lists.zx2c4.com>; Tue,  7 Feb 2023 22:54:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="o+9rKhWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1675810473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XZQszJl6Wy3unWW5shRFKEY0SnIj1Z2g7uZvWygPpWI=;
 b=o+9rKhWophrrESOv+yML8y2F0/mNvBC5GczJeSi/eqBHXO/HvI5BVfkKIeuiWi+F0JufIK
 gN+iFeLbMJmO2ht/VcfHj4l1fOWy1Km+vHz3rLTG2e8fuAOw7kfKwi+UQBvW+e0T44tiEd
 LjJPdSbTBunW82YKskaUr1iJS5dq5KU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2f8ac078
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 7 Feb 2023 22:54:32 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id u21so18214816edv.3
 for <wireguard@lists.zx2c4.com>; Tue, 07 Feb 2023 14:54:32 -0800 (PST)
X-Gm-Message-State: AO0yUKUp1gxMflHEBmMH3Mr5mYTIXBwSaOYJa+im5oVofi9soNUdB3m7
 tnd71+CF9eR7TbGAeyJ9TndfyR3TevtsucMH+fg=
X-Google-Smtp-Source: AK7set8zMEynWhW/IoXPgyOFQFz2LbHWViZB1OhMatkwgJ3atOxmzaUE6v6iQR8MN190Q+ZzjkglD3+dB7cPF/9hw+M=
X-Received: by 2002:a50:cc92:0:b0:4ab:554:37e3 with SMTP id
 q18-20020a50cc92000000b004ab055437e3mr67142edi.8.1675810471699; Tue, 07 Feb
 2023 14:54:31 -0800 (PST)
MIME-Version: 1.0
References: <90cadce0-51e9-d9f3-4b27-084f49e99f1c@ernw.de>
In-Reply-To: <90cadce0-51e9-d9f3-4b27-084f49e99f1c@ernw.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 7 Feb 2023 19:54:19 -0300
X-Gmail-Original-Message-ID: <CAHmME9pd1W2sbY7FXMad2Qb_dh=f3307ACKOr9hAS5zfjRUEHQ@mail.gmail.com>
Message-ID: <CAHmME9pd1W2sbY7FXMad2Qb_dh=f3307ACKOr9hAS5zfjRUEHQ@mail.gmail.com>
Subject: Re: [PATCH] wg-tools: Fix too strict file permissions on resolv.conf
To: fbausch@ernw.de
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

Thanks.

Can you send this with a `Signed-off-by:` line like every commit in
that repository does, please? Then I'll apply this.

Jason
