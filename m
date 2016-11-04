Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2311488c
 for <wireguard@lists.zx2c4.com>; Fri, 4 Nov 2016 13:23:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7bf356a1
 for <wireguard@lists.zx2c4.com>; Fri, 4 Nov 2016 13:23:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a4ea9d9f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 4 Nov 2016 13:23:39 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id c13so63673547lfg.0
 for <wireguard@lists.zx2c4.com>; Fri, 04 Nov 2016 06:25:00 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 4 Nov 2016 14:24:58 +0100
Message-ID: <CAHmME9omqGyouvfT72Z3pC4YYWoJ_yLCuCZ6zZ8BG7QpJh+xKQ@mail.gmail.com>
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: [WireGuard] Major Queueing Algorithm Simplification
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey,

This might be of interest...

Before, every time I got a GSO superpacket from the kernel, I'd split
it into little packets, and then queue each little packet as a
different parallel job.

Now, every time I get a GSO super packet from the kernel, I split it
into little packets, and queue up that whole bundle of packets as a
single parallel job. This means that each GSO superpacket expansion
gets processed on a single CPU. This greatly simplifies the algorithm,
and delivers mega impressive performance throughput gains.

In practice, what this means is that if you call send(tcp_socket_fd,
buffer, biglength), then each 65k contiguous chunk of buffer will be
encrypted on the same CPU. Before, each 1.5k contiguous chunk would be
encrypted on the same CPU.

I had thought about doing this a long time ago, but didn't, due to
reasons that are now fuzzy to me. I believe it had something to do
with latency. But at the moment, I think this solution will actually
reduce latency on systems with lots of cores, since it means those
cores don't all have to be synchronized before a bundle can be sent
out. I haven't measured this yet, and I welcome any such tests. The
magic commit for this is [1], if you'd like to compare before and
after.

Are there any obvious objections I've overlooked with this simplified approach?

Thanks,
Jason

[1] https://git.zx2c4.com/WireGuard/commit/?id=7901251422e55bcd55ab04afb7fb390983593e39
