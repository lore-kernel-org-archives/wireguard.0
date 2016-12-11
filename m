Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82dacfd2
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Dec 2016 14:44:40 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ceb1a20
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Dec 2016 14:44:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3be9ceb2
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Dec 2016 14:44:40 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ab03c270
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Dec 2016 14:44:39 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id c184so6689441wmd.0
 for <wireguard@lists.zx2c4.com>; Sun, 11 Dec 2016 06:50:34 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161211071501.GA32621@kroah.com>
References: <CAHmME9o_eCNXpVztOZKW55kpRtE+1KSEQTQOjUBVn68Y2+or2g@mail.gmail.com>
 <095cac5b-b757-6f4a-e699-8eedf9ed7221@stressinduktion.org>
 <87vauvhwdu.fsf@alice.fifthhorseman.net>
 <CE942916-BF45-44CC-A5F5-3838CF9C93BC@danrl.com>
 <20161211071501.GA32621@kroah.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 11 Dec 2016 15:50:31 +0100
Message-ID: <CAHmME9q5ifwwishXjXYE3J=sVeR4jYY9fLUgs_FHCP594EZr6g@mail.gmail.com>
Subject: Re: Misalignment, MIPS, and ip_hdr(skb)->version
To: linux-mips@linux-mips.org, Netdev <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Cc: =?UTF-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans@mansr.com>,
 Jiri Benc <jbenc@redhat.com>, David Miller <davem@davemloft.net>,
 Hannes Frederic Sowa <hannes@stressinduktion.org>, Willy Tarreau <w@1wt.eu>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Felix Fietkau <nbd@nbd.name>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey guys,

Thanks for the extremely detailed answers. The main take-away from
this is that passing unaligned packets to the networking stack kills
kittens. So now it's a question of mitigation. I have three options:

1. Copy the plaintext to three bytes before the start of the cipher
text, overwriting parts of the header that aren't actually required.
Pros: no changes required, MTU stays small.
Cons: scatterwalk's fast paths aren't hit, which means two page table
mappings are taken instead of one. I have no idea if this actually
matters or will slow down anything relavent.

2. Add 3 bytes to the plaintext header, set to zero, marked for future use.
Pros: satisfies IETF mantras and makes unaligned in-place decryption
straightforward.
Cons: lowers MTU, additional unauthenticated cleartext bits in the
header are of limited utility in protocol.

3. Add 3 bytes of padding, set to zero, to the encrypted section just
before the IP header, marked for future use.
Pros: satisfies IETF mantras, can use those extra bits in the future
for interesting protocol extensions for authenticated peers.
Cons: lowers MTU, marginally more difficult to implement but still
probably just one or two lines of code.

Of these, I'm leaning toward (3).

Anyway, thanks a lot for the input. "Doing nothing" is no longer under
serious consideration, thanks to your messages.

Thanks,
Jason
