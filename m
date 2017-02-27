Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa617d00
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 20:21:02 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 6206f036
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 20:21:02 +0000 (UTC)
Date: Mon, 27 Feb 2017 14:22:05 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Kernel commit d35a00b8e33dab7385f724e713ae71c8be0a49f4 breaks
 wireguard
Message-ID: <20170227202205.GA9124@wolff.to>
References: <20170227180434.GA5702@wolff.to>
 <CAHmME9o+dDEtxdgByOZzpWAsE2_t2QF+qDoFYt+NdqXJRXSz=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
In-Reply-To: <CAHmME9o+dDEtxdgByOZzpWAsE2_t2QF+qDoFYt+NdqXJRXSz=w@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Feb 27, 2017 at 12:10:41 -0800,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>Hey Bruno,
>
>This has now been fixed in the repo. Note that since rc1 hasn't been
>released, you'll need to adjust the kernel's make file to show 4.11
>yourself. Alternatively, just wait a few days for rc1.

I think Fedora already does that. The build gets further, but it looks like 
another structure change is breaking things as well. I'll see if I can 
verify the change and get you the commit number.
In the meantime here is he error I am seeing:
/home/bruno/WireGuard/src/data.c: In function ‘skb_reset’:
/home/bruno/WireGuard/src/data.c:128:5: error: ‘struct sk_buff’ has no member named ‘tc_verd’
