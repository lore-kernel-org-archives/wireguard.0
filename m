Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c960d2fb
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 11:52:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9658abf7
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 11:52:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9efe81b5
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 11:50:53 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3ccebe89
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 May 2018 11:50:53 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id l22-v6so16589164otj.0
 for <wireguard@lists.zx2c4.com>; Tue, 29 May 2018 04:54:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN-r--kLC4bAG0oAGp0gDO7Q2Ro0X9J5L-HY3sXaRz-zeZDR6Q@mail.gmail.com>
References: <CAN-r--kLC4bAG0oAGp0gDO7Q2Ro0X9J5L-HY3sXaRz-zeZDR6Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 29 May 2018 13:54:04 +0200
Message-ID: <CAHmME9ogDQv-TxNz+2jwbw=d4s2Vq1LdZgin4_=dL5D_SRy2_Q@mail.gmail.com>
Subject: Re: Wireguard & hw flow offload incompatibility
To: Jaap Buurman <jaapbuurman@gmail.com>
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

Hi Jaap,

Thanks for the report. Is this a _new_ bug in _new_ version of
WireGuard that wasn't there before. Or is this the first time you've
observed this?

Thanks,
Jason
