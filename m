Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b19630a
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 03:04:00 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 782c479f
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 03:03:59 +0000 (UTC)
Date: Sun, 9 Jul 2017 22:17:44 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Looks like 4.13 introduces a new incompatibility
Message-ID: <20170710031744.GA18054@wolff.to>
References: <20170710014834.GA14901@wolff.to>
 <CAHmME9qHmJCHT8_ZM1CYDbPx62T-Zuf3BfdL_ZpfB6drOsnwFw@mail.gmail.com>
 <20170710025614.GA17552@wolff.to>
 <CAHmME9pbky9H=+QkXA2VMeZ3OQonxxZ_H2-Jiz8Gy6FeYuR+7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9pbky9H=+QkXA2VMeZ3OQonxxZ_H2-Jiz8Gy6FeYuR+7g@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Jul 10, 2017 at 05:03:42 +0200,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>
>I need to annoy Ted Tso about this. It'll get merged for rc1 or rc2.

OK. I'll confirm when it builds again. I might try it out early if Tso 
has it in a public develoment tree before it gets to Linus' tree. This 
might show up other issues in things that build after cookie.o and so might 
be worthwhile even if building kernels from source is otherwise not usually 
worth the effort for me.
