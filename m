Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f1f715b
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 15:49:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce2fb3da
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 15:49:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca209b06
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 15:49:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2051b45d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 15:49:56 +0000 (UTC)
Received: by mail-ot0-f169.google.com with SMTP id k4so54266283otc.0
 for <wireguard@lists.zx2c4.com>; Mon, 27 Feb 2017 07:51:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170227115307.GA2499@grsecurity.net>
References: <5e4ad220-6009-7ec9-95eb-ddccb994bb9e@gmail.com>
 <CAHmME9pH5xbVR04b9JLqFfho=i_K-jod6N8tJt0ggDXPfqQ_LA@mail.gmail.com>
 <a80303ca-e841-77f1-5ea6-6833f69b6059@gmail.com>
 <CAApVa_kyD=KZYN3ABZU5yZGExNhC-34ryF+JZAPZ0JAKgmdJLw@mail.gmail.com>
 <CAHmME9ppn7wonfYTjOu9V-mmuRnF-S6v+1aoLneq4zLeoEShGg@mail.gmail.com>
 <20170227115307.GA2499@grsecurity.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 27 Feb 2017 07:51:30 -0800
Message-ID: <CAHmME9oKCEB_ZOpXAGfbH=zS5SoLkM_3aX9m=GDY4kS+OWF6UA@mail.gmail.com>
Subject: Re: kernel warning with 0.0.20170223: entered softirq 3 NET_RX
 net_rx_action+0x0/0x760 with preempt_count 00000101, exited with 00000100?
To: Brad Spengler <spender@grsecurity.net>
Content-Type: text/plain; charset=UTF-8
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

Hey Brad,

Thanks for fixing this!

Regards,
Jason
