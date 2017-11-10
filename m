Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55995939
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Nov 2017 04:35:27 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac5d0629
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Nov 2017 04:35:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34036f67
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Nov 2017 04:35:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0ab56fd3
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Nov 2017 04:35:25 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id y206so4781483oiy.4
 for <wireguard@lists.zx2c4.com>; Thu, 09 Nov 2017 20:38:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171109214829.7205e821@malediction>
References: <20171109214829.7205e821@malediction>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 10 Nov 2017 13:38:57 +0900
Message-ID: <CAHmME9pQmLJcq46Lz1zUopwnw3w=01nxjaVZhTWaCOVBOPiS1w@mail.gmail.com>
Subject: Re: Documentation for kernel requirements doesn't mention
 CONFIG_UNUSED_SYMBOLS
To: Mike Kazantsev <mk.fraggod@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Mike,

Thanks for tracking this down. I've added note of this to the /install page.

Jason
