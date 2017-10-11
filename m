Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69607864
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 13:16:31 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b09cf917
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 13:16:31 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d85802c
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 13:35:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4252c95d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 13:35:34 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id f66so3135047oib.2
 for <wireguard@lists.zx2c4.com>; Wed, 11 Oct 2017 06:46:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171011133024.Horde.Lj1Pe-ln1REown-ec1q9f92@www.vdorst.com>
References: <20171010185133.Horde.g9yJlkVpxW5Gk-qJumftGF_@www.vdorst.com>
 <CAHmME9rtGod=Jw-vGKnUfPwDh+16zP1MjNr57+8k5PUVMhxtYA@mail.gmail.com>
 <20171011124935.Horde.WT_JO7z6wRK6_tlxjtJxnSr@www.vdorst.com>
 <CAHmME9pSeLf7WuWj4mB7qhTstTPEX7cTcwyGL67F8CDSbqjEjw@mail.gmail.com>
 <20171011133024.Horde.Lj1Pe-ln1REown-ec1q9f92@www.vdorst.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 11 Oct 2017 15:46:23 +0200
Message-ID: <CAHmME9pbwA5_HJL1mEsDodu=0nyS6HCoGfj3WXa4Ki-yyH3qHQ@mail.gmail.com>
Subject: Re: possible irq lock inversion dependency detected
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
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

Hi Ren=C3=A9,

Great, I'll ship it! Thanks for debugging.

Jason
