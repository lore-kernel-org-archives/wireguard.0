Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84d9c5d3
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 12:22:03 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0c8802b
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 12:22:03 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8368a8ed
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 12:41:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dfb8d644
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Oct 2017 12:41:06 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id f66so2789188oib.2
 for <wireguard@lists.zx2c4.com>; Wed, 11 Oct 2017 05:51:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171011124935.Horde.WT_JO7z6wRK6_tlxjtJxnSr@www.vdorst.com>
References: <20171010185133.Horde.g9yJlkVpxW5Gk-qJumftGF_@www.vdorst.com>
 <CAHmME9rtGod=Jw-vGKnUfPwDh+16zP1MjNr57+8k5PUVMhxtYA@mail.gmail.com>
 <20171011124935.Horde.WT_JO7z6wRK6_tlxjtJxnSr@www.vdorst.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 11 Oct 2017 14:51:55 +0200
Message-ID: <CAHmME9pSeLf7WuWj4mB7qhTstTPEX7cTcwyGL67F8CDSbqjEjw@mail.gmail.com>
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

I'm having trouble parsing your message. You wrote:

> So I am not sure if you patch works or not.
> Because it was not that easy to reproduce the last one.

Do you mean to imply that you could NOT reproduce it with my patch?
But that you could reproduce it WITHOUT the patch?

Jason
