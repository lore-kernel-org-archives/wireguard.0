Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB3CC47077
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 11 Jan 2024 17:28:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 280c6ba2;
	Thu, 11 Jan 2024 17:28:38 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 875cda20
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2024 17:28:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0493FCE20BE
 for <wireguard@lists.zx2c4.com>; Thu, 11 Jan 2024 17:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1176C433F1
 for <wireguard@lists.zx2c4.com>; Thu, 11 Jan 2024 17:28:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="JRGixTjk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1704994110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VQU+/B75My8JCV9QOfAoQaVoiZZKMfAX5WlSXQ7LsZ8=;
 b=JRGixTjkJkyB+Uod9GaN7lLh08tBREHRQxoQZ7jj0Nbgau90+b3coSzYv9vG7TbWLxoScs
 T7qUKY8z2bd5EF8gAw37yDEzxi8dxMibEfBH1ucidj0WndEwTeHR5zQa10wXvjYT+bOOqz
 xE+wnZ8NnWt5rjp5I/1MNgkKTSnXTIA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4a13cffb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2024 17:28:29 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-5e76948cda7so54375407b3.3
 for <wireguard@lists.zx2c4.com>; Thu, 11 Jan 2024 09:28:29 -0800 (PST)
X-Gm-Message-State: AOJu0YyEorBSZUKdasBwp42MqWviUrQC9eqJmj1dUhDWJbw0/DB+oF0I
 QpHKwmj3J436reBUszrht78U9i3gH/vTcfzaNg0=
X-Google-Smtp-Source: AGHT+IEuXaZRUafKB+5MH5F4r3WLlEO3IABB/ps1mlnaPrmjQdZWPBNDATAze8zyWp0pwB0VoEqbgAvv8SD47XTIM4M=
X-Received: by 2002:a81:ae53:0:b0:5fa:f8b7:80d4 with SMTP id
 g19-20020a81ae53000000b005faf8b780d4mr116484ywk.89.1704994108587; Thu, 11 Jan
 2024 09:28:28 -0800 (PST)
MIME-Version: 1.0
References: <20240111154138.7605-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20240111154138.7605-1-n.zhandarovich@fintech.ru>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 11 Jan 2024 18:28:16 +0100
X-Gmail-Original-Message-ID: <CAHmME9o9ZzdWCOmg_s4K4zUUb0BitE+9F7Ox-hCnSHaFQahGtA@mail.gmail.com>
Message-ID: <CAHmME9o9ZzdWCOmg_s4K4zUUb0BitE+9F7Ox-hCnSHaFQahGtA@mail.gmail.com>
Subject: Re: [PATCH net] wireguard: receive: annotate data-race around
 receiving_counter.counter
To: n.zhandarovich@fintech.ru
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot <syzkaller@googlegroups.com>, 
 syzbot+d1de830e4ecdaac83d89@syzkaller.appspotmail.com
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

Thanks. Jann pointed me at this a few days ago and I was just looking into it.

Send a v2 with Eric's suggestion and I'll queue it up?

Jason
