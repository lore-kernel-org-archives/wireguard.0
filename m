Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1679209b
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 05:31:04 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id f0e0a47a
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 05:31:04 +0000 (UTC)
Date: Mon, 10 Jul 2017 00:44:48 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Looks like 4.13 introduces a new incompatibility
Message-ID: <20170710054448.GA21435@wolff.to>
References: <20170710014834.GA14901@wolff.to>
 <CAHmME9qHmJCHT8_ZM1CYDbPx62T-Zuf3BfdL_ZpfB6drOsnwFw@mail.gmail.com>
 <20170710025614.GA17552@wolff.to>
 <CAHmME9pbky9H=+QkXA2VMeZ3OQonxxZ_H2-Jiz8Gy6FeYuR+7g@mail.gmail.com>
 <20170710031744.GA18054@wolff.to>
 <CAHmME9qTDJJmUG8rtZ53sof+NNGTub=kcVzVv6817acw0HMp=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <CAHmME9qTDJJmUG8rtZ53sof+NNGTub=kcVzVv6817acw0HMp=w@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Jul 10, 2017 at 05:26:50 +0200,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>These two commits:
>
>https://git.kernel.org/pub/scm/linux/kernel/git/tytso/random.git/patch/?id=e297a783e41560b44e3c14f38e420cba518113b8
>https://git.kernel.org/pub/scm/linux/kernel/git/tytso/random.git/patch/?id=da9ba564bd683374b8d319756f312821b8265b06

I'm trying it out, but the kernel build will be slow and most likely I won't 
be able to test it until tomorrow afternoon.

(I'm cherry picking the two commits into Linus' current master. This doesn't 
include any patches Fedira is carrying.)
