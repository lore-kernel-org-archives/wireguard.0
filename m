Return-Path: toke@toke.dk
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f6e3725
 for <wireguard@lists.zx2c4.com>; Fri, 4 Nov 2016 14:43:48 +0000 (UTC)
From: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CAHmME9omqGyouvfT72Z3pC4YYWoJ_yLCuCZ6zZ8BG7QpJh+xKQ@mail.gmail.com>
Date: Fri, 04 Nov 2016 15:45:06 +0100
In-Reply-To: <CAHmME9omqGyouvfT72Z3pC4YYWoJ_yLCuCZ6zZ8BG7QpJh+xKQ@mail.gmail.com>
 (Jason A. Donenfeld's message of "Fri, 4 Nov 2016 14:24:58 +0100")
Message-ID: <87fun7cnil.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Major Queueing Algorithm Simplification
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> Hey,
>
> This might be of interest...
>
> Before, every time I got a GSO superpacket from the kernel, I'd split
> it into little packets, and then queue each little packet as a
> different parallel job.
>
> Now, every time I get a GSO super packet from the kernel, I split it
> into little packets, and queue up that whole bundle of packets as a
> single parallel job. This means that each GSO superpacket expansion
> gets processed on a single CPU. This greatly simplifies the algorithm,
> and delivers mega impressive performance throughput gains.
>
> In practice, what this means is that if you call send(tcp_socket_fd,
> buffer, biglength), then each 65k contiguous chunk of buffer will be
> encrypted on the same CPU. Before, each 1.5k contiguous chunk would be
> encrypted on the same CPU.
>
> I had thought about doing this a long time ago, but didn't, due to
> reasons that are now fuzzy to me. I believe it had something to do
> with latency. But at the moment, I think this solution will actually
> reduce latency on systems with lots of cores, since it means those
> cores don't all have to be synchronized before a bundle can be sent
> out. I haven't measured this yet, and I welcome any such tests. The
> magic commit for this is [1], if you'd like to compare before and
> after.
>
> Are there any obvious objections I've overlooked with this simplified
> approach?

My guess would be that it would worsen latency. You now basically have
head of line blocking where an entire superpacket needs to be processed
before another flow gets to transmit one packet.

I guess this also means that the total amount of data that is currently
being processed increases? I.e., before you would have (max number of
jobs * 1.5K) bytes queued up for encryption at once, where now you will
have (max number of jobs * 65K) bytes? That can be a substantive amount
of latency.

But really, instead of guessing why not measure?

Simply run a `flent tcp_4up <hostname>` through the tunnel (requires a
netperf server instance running on <hostname>) and look at the latency
graph. The TCP flows will start five seconds after the ping flow; this
shouldn't cause the ping RTT to rise by more than max ~10ms. And of
course, trying this on a machine that does *not* have a gazillion
megafast cores as well is important :)

There's an Ubuntu PPA to get Flent, or you can just `pip install flent`.
See https://flent.org/intro.html#installing-flent

-Toke
