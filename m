Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3f83720
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 00:28:36 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6541413c
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 00:28:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21b6b77f
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 00:42:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 132cd988
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 00:42:10 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id c11so117121554wrc.3
 for <wireguard@lists.zx2c4.com>; Sun, 09 Jul 2017 17:46:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <e3a0ff13-fea4-e5e3-7529-ae746d74a17a@roelf.org>
References: <1499116162.70598782@f401.i.mail.ru>
 <740cb9af-aba8-c610-c1b7-0a7c69396e46@roelf.org>
 <1499188207.518000711@f408.i.mail.ru>
 <e3a0ff13-fea4-e5e3-7529-ae746d74a17a@roelf.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 10 Jul 2017 02:46:40 +0200
Message-ID: <CAHmME9qUHN_G2vf7A_haTpk+yMK6rVe42B56N9LFLP7tBh-VkQ@mail.gmail.com>
Subject: Re: problem wireguard + ospf + unconnected tunnels
To: aeforeve@mail.ru
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Roelf Wichertjes <roelf@roelf.org>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey ae,

Thanks for your detailed reports, especially the nice Python
reproducer you sent. And sorry for the delay in getting back to you
and investigating this. I actually don't receive any of your emails. I
don't know if it's because mail.ru has a bad spam score, or because
the HTML part of your email contains embedded javascript, but there's
something sufficiently sketchy that precludes them from being
delivered to my mailbox. Luckily others on the list brought this
thread to my attention.

I successfully debugged and fixed the Python reproducer you sent me.
Could you try the following patch, and see if applying it results in
ospfd working properly?

https://git.zx2c4.com/WireGuard/patch/?id=177335d5b460cce07631dff8bea478b73e184247

After you apply that and rebuild the module, be sure to rmmod the old
module and modprobe the new one. Then repeat your tests and see if it
works.

For interested readers on the list, here's what's happening:

* A packet inside the kernel is represented as an sk_buff, or an skb.
* Each socket inside the kernel has a budget of how many skbs it can
allocate for itself.
* When a socket reaches the limit of skbs it can allocate for itself,
it blocks until those skbs are freed.

Meanwhile in WireGuard:

* When a handshake has not been established, packets are queued up to
be sent immediately after a handshake is established.
* There is a maximum of 1024 packets allowed in this queue. Newer
packets push out older packets.
* After 20 unsuccessful attempts to establish a handshake, this queue
is emptied.

In your Python example, you used the same socket to send packets to
both lo and to wg0. lo immediately dropped the packets it couldn't
deliver, whereas wg0 did not, due to the above. After reaching a
per-socket limit on skbs allocated, sendto() simply blocks, thus
preventing packets being sent anywhere using that same socket. Herein
lies the problem.

The solution is to "orphan" packets that WireGuard buffers longterm,
so that they're no longer charged to the socket's maximum limit. Since
the interface maximum is capped (1024) and new packets replace old
packets and the fact that they are all freed after 20 unsuccessful
attempts, this does not cause any sort of unbounded memory growth.

So, the aforementioned problem successfully fixes your Python
reproducer code. Please try it on your routing daemon and let me know
if it also fixes the problem there too?

Thanks again for your help,
Jason
