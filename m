Return-Path: siosm99@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d376ace
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 17:31:28 +0000 (UTC)
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
 [209.85.128.195])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b81d0ef3
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 17:31:27 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id g10so10947721wrg.0
 for <wireguard@lists.zx2c4.com>; Mon, 27 Feb 2017 09:33:03 -0800 (PST)
Return-Path: <siosm99@gmail.com>
Subject: Re: kernel warning with 0.0.20170223: entered softirq 3 NET_RX
 net_rx_action+0x0/0x760 with preempt_count 00000101, exited with 00000100?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Brad Spengler <spender@grsecurity.net>
References: <5e4ad220-6009-7ec9-95eb-ddccb994bb9e@gmail.com>
 <CAHmME9pH5xbVR04b9JLqFfho=i_K-jod6N8tJt0ggDXPfqQ_LA@mail.gmail.com>
 <a80303ca-e841-77f1-5ea6-6833f69b6059@gmail.com>
 <CAApVa_kyD=KZYN3ABZU5yZGExNhC-34ryF+JZAPZ0JAKgmdJLw@mail.gmail.com>
 <CAHmME9ppn7wonfYTjOu9V-mmuRnF-S6v+1aoLneq4zLeoEShGg@mail.gmail.com>
 <20170227115307.GA2499@grsecurity.net>
 <CAHmME9oKCEB_ZOpXAGfbH=zS5SoLkM_3aX9m=GDY4kS+OWF6UA@mail.gmail.com>
From: =?UTF-8?Q?Timoth=c3=a9e_Ravier?= <siosm99@gmail.com>
Message-ID: <b67d6614-b372-9564-eb35-9c4d3dd0a9c3@gmail.com>
Date: Mon, 27 Feb 2017 18:33:00 +0100
MIME-Version: 1.0
In-Reply-To: <CAHmME9oKCEB_ZOpXAGfbH=zS5SoLkM_3aX9m=GDY4kS+OWF6UA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Cc: Pipacs <pageexec@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 27/02/2017 16:51, Jason A. Donenfeld wrote:
> Hey Brad,
> 
> Thanks for fixing this!
> 
> Regards,
> Jason

I can confirm this is fixed for me.

Thanks!

Tim
