Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55957bce
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Jan 2017 20:42:04 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8ff91c8
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Jan 2017 20:42:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e48f9f1
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Jan 2017 20:42:04 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 685049b9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Jan 2017 20:42:04 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id 73so22850227otj.0
 for <wireguard@lists.zx2c4.com>; Sat, 14 Jan 2017 12:52:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAOnWvx_BCaSO3i=319vCUjKuXG6E+8ReGsFGFFVgJLsdyb4RGg@mail.gmail.com>
References: <CAOnWvx_BCaSO3i=319vCUjKuXG6E+8ReGsFGFFVgJLsdyb4RGg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Jan 2017 21:52:19 +0100
Message-ID: <CAHmME9rRcDj9W8an2JiQCuP_O9Wd3Neja6VwFntiTGbc845vcw@mail.gmail.com>
Subject: Re: limitations
To: Wasa Bee <wasabee18@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sat, Jan 14, 2017 at 8:11 PM, Wasa Bee <wasabee18@gmail.com> wrote:
> - it is only over UDP. If so, is there ever going to be a TCP version? A lot
> of applications that could benefit from WG use TCP. It does not seem wise to
> expect programmers to implement a TCP-like layer (eg retransmission, ack,
> etc) in userspace, is it? This would increase complexity unnecessarily and
> would lead to vuln in practice...

I think you misunderstand. WireGuard is a layer 3 tunnel. Yes it uses
UDP and no it won't use TCP, but obviously you can use TCP sockets
over a layer 3 interface, just like you can with GRE or OpenVPN or
whatever else.

> - WG is implemented as a patch to the kernel or a kernel module? The reason
> I ask is that when an update is available for WG, it would be good not to
> have to replace the whole kernel, but only reload a patched WG module. Also:
> if there are ongoing sessions with some clients, how would sessions be
> re-established (afaik, the current design is to simply ignore irrelevant
> messages)?

Kernel module.
