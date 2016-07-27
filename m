Return-Path: jens@viisauksena.de
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d4fb7ff
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Jul 2016 10:10:49 +0000 (UTC)
In-Reply-To: <CAHmME9rCmhkegmUnS8EBoSmb8BEHo=bv7fxOQNdCwu1CaB+L-A@mail.gmail.com>
References: <7a999008-9396-c82d-1764-d658873af7fc@viisauksena.de>
 <CAHmME9rCmhkegmUnS8EBoSmb8BEHo=bv7fxOQNdCwu1CaB+L-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----SB7QR3UTFFWES8PICL6XN0H8ZAIYL7"
From: Jens Viisauksena <jens@viisauksena.de>
Date: Wed, 27 Jul 2016 12:13:25 +0200
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Baptiste Jonglez <baptiste@bitsofnetworks.org>
Message-ID: <CCE0C17C-29C4-4E58-A853-590802C58589@viisauksena.de>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] LEDE / OpenWrt test - on TP-Link841Nv11 - 15MBs and
	crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

------SB7QR3UTFFWES8PICL6XN0H8ZAIYL7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

the mentioned tincd...

We ran other tests on our backbone vms. There we build plain l2tpv3/batv15 on top and we got heavy promising results. 
In short: plain we got there 980mbs, with wireguard some 700 and l2tpV3/batv15 on top 500mbs.

we will report that soon as working alternative to tincd, while tincd only interconnet our backbone. 
the small routers run fastd into the backbone. 
That was Indeed this test about, if this could be an alternative or extension for the small nicely working userspace fastd - and curiosity.

On that mentioned backbone tests we have a huge drop in performance when packets where fragmented, everything goes down to stable 50mbs, and raise to stable 500 if unfragmented. we have to solve this mystery before we will come forward, or if we cannot solve this, we may report as is.

On July 27, 2016 10:38:04 AM GMT+02:00, "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>Hi Jens,
>
>Youch! That's pretty horrible. Is 15mb/s worse than what you get with
>tincd?
>
>A while ago Baptiste (attached) was working on a MIPS optimized
>implementation of ChaPoly. Baptiste -- what ever happened with that?
>Perhaps it's time we revive that project?
>
>About the crash -- it appears that I need to optimize WireGuard for
>low memory situations. I'll get started on this.
>
>Thanks for the feedback. I'll see what I can do to fix things.
>
>Jason

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
------SB7QR3UTFFWES8PICL6XN0H8ZAIYL7
Content-Type: text/html;
 charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head></head><body>the mentioned tincd...<br>
<br>
We ran other tests on our backbone vms. There we build plain l2tpv3/batv15 on top and we got heavy promising results. <br>
In short: plain we got there 980mbs, with wireguard some 700 and l2tpV3/batv15 on top 500mbs.<br>
<br>
we will report that soon as working alternative to tincd, while tincd only interconnet our backbone. <br>
the small routers run fastd into the backbone. <br>
That was Indeed this test about, if this could be an alternative or extension for the small nicely working userspace fastd - and curiosity.<br>
<br>
On that mentioned backbone tests we have a huge drop in performance when packets where fragmented, everything goes down to stable 50mbs, and raise to stable 500 if unfragmented. we have to solve this mystery before we will come forward, or if we cannot solve this, we may report as is.<br><br><div class="gmail_quote">On July 27, 2016 10:38:04 AM GMT+02:00, &quot;Jason A. Donenfeld&quot; &lt;Jason@zx2c4.com&gt; wrote:<blockquote class="gmail_quote" style="margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<pre class="k9mail">Hi Jens,<br /><br />Youch! That's pretty horrible. Is 15mb/s worse than what you get with tincd?<br /><br />A while ago Baptiste (attached) was working on a MIPS optimized<br />implementation of ChaPoly. Baptiste -- what ever happened with that?<br />Perhaps it's time we revive that project?<br /><br />About the crash -- it appears that I need to optimize WireGuard for<br />low memory situations. I'll get started on this.<br /><br />Thanks for the feedback. I'll see what I can do to fix things.<br /><br />Jason<br /></pre></blockquote></div><br>
-- <br>
Sent from my Android device with K-9 Mail. Please excuse my brevity.</body></html>
------SB7QR3UTFFWES8PICL6XN0H8ZAIYL7--
