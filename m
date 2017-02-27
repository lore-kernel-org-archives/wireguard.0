Return-Path: bruno@wolff.to
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3ff3ffd
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 22:36:49 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id edf0366a
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Feb 2017 22:36:49 +0000 (UTC)
Date: Mon, 27 Feb 2017 16:37:51 -0600
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Kernel commit d35a00b8e33dab7385f724e713ae71c8be0a49f4 breaks
 wireguard
Message-ID: <20170227223751.GA13376@wolff.to>
References: <20170227180434.GA5702@wolff.to>
 <CAHmME9o+dDEtxdgByOZzpWAsE2_t2QF+qDoFYt+NdqXJRXSz=w@mail.gmail.com>
 <20170227202205.GA9124@wolff.to> <20170227203727.GA9565@wolff.to>
 <CAHmME9ryT7LWjs+-D4VJpd3DBSQeBa0hUtDUcJ3gBt46xUobiA@mail.gmail.com>
 <20170227221444.GA11938@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
In-Reply-To: <20170227221444.GA11938@wolff.to>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Feb 27, 2017 at 16:14:44 -0600,
  Bruno Wolff III <bruno@wolff.to> wrote:
>On Mon, Feb 27, 2017 at 14:10:18 -0800,
> "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>>Thanks! I wasn't compiling with the options to hit this, so I didn't
>>see it before. Should be fixed now.
>
>Thank you.
>
>It now builds cleanly and it at least appears to be working correctly 
>in simple testing.

I am now having a problem building it on a 4.10 kernel. (I already have 
a build from the weekend, so I don't need this to make anything work 
right now.)

This is from another Fedora machine that I haven't switched to a 4.11 
kernel yet. The base system for this one is F25, the one that it work 
on was f26/rawhide and has a gcc 7 version. This one has gcc-6.3.1-1.fc25.i686.

make -C /lib/modules/4.10.0-1.fc26.i686+PAE/build M=/home/bruno/WireGuard/src modules
make[1]: Entering directory '/usr/src/kernels/4.10.0-1.fc26.i686+PAE'
  CC [M]  /home/bruno/WireGuard/src/main.o
In file included from <command-line>:0:0:
/home/bruno/WireGuard/src/compat/compat.h:165:40: warning: ‘struct sk_buff’ declared inside parameter list will not be visible outside of this definition or declaration
 static inline void skb_reset_tc(struct sk_buff *skb)
                                        ^~~~~~~
/home/bruno/WireGuard/src/compat/compat.h: In function ‘skb_reset_tc’:
/home/bruno/WireGuard/src/compat/compat.h:168:5: error: dereferencing pointer to incomplete type ‘struct sk_buff’
  skb->tc_verd = 0;
     ^~
