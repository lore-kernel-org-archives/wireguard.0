Return-Path: opensource@vdorst.com
Received: from smtp02.bhosted.nl (smtp02.bhosted.nl [94.124.121.13])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bee2a23
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Sep 2016 18:17:23 +0000 (UTC)
Date: Thu, 22 Sep 2016 18:27:20 +0000
Message-ID: <20160922182720.Horde.Dmh0sp6GFBlJmMznQyJ_Bph@www.vdorst.com>
From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <20160808132309.Horde.PpRcvoBjgmDh9S0lYDhy7Au@www.vdorst.com>
 <CAHmME9o+QqPR0qo8uadYVZDMw=Z-uxCwuBgggOeYNdE8FDLXpQ@mail.gmail.com>
 <20160908115753.Horde.dla9pNo2jSEeBF-QW8dWlO-@www.vdorst.com>
 <20160909134611.Horde.d1CtbRQrioV8yr-kI71aUI3@www.vdorst.com>
 <20160909135202.GA32666@lud.imag.fr>
 <20160909152208.Horde.qMOsffs1bVcJx-AfO91qa9q@www.vdorst.com>
 <20160909194927.Horde.e1JlaJl_SL7blOrpizk9Uba@www.vdorst.com>
 <20160914071654.Horde.VPt42kADErUJCGSNzTb-Lfl@www.vdorst.com>
 <CAHmME9r3OSaTD_u4P8rcDo9gxOEK7E=qc8hnj=VoTWYUyov2-Q@mail.gmail.com>
In-Reply-To: <CAHmME9r3OSaTD_u4P8rcDo9gxOEK7E=qc8hnj=VoTWYUyov2-Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] News about MIPS and ARM optimized code?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


Hi Jason,

I am using the LEDE-projects default kernel.
My comparison is only between the patched C version with the aligned  
memory reads and my assembly version module.

I think it is too complex for GCC to optimize, so it flows the code by  
the letter.
This results in a lot of data hazards.

By doing by hand you can prevent many data hazards.
The trick is try to do 2 things by weaving the code together.
Which results in less maintainable code.

Greats,

René van Dorst.



Quoting "Jason A. Donenfeld" <Jason@zx2c4.com>:

> Hey René,
>
> That's excellent. Thanks for writing that. I'll review this implementation.
>
> Is your speed up compared to your unaligned optimization from the
> other patch? Or is that against vanilla?
>
> With only a 1% increase, I'm first interested to see where precisely
> that improvement is coming from, and if we could squeeze that out of
> gcc instead, so that they're producing more or less the same code.
>
> Regards,
> Jason
