Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31443d4b
 for <wireguard@lists.zx2c4.com>; Fri, 7 Apr 2017 14:24:41 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ae28f61
 for <wireguard@lists.zx2c4.com>; Fri, 7 Apr 2017 14:24:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a79b6eac
 for <wireguard@lists.zx2c4.com>; Fri, 7 Apr 2017 14:24:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 44daf51a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 7 Apr 2017 14:24:41 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id g204so14392700oib.1
 for <wireguard@lists.zx2c4.com>; Fri, 07 Apr 2017 07:31:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9poZPFbYhitnK8UvDB-32hLRcTFc4vAwaUPwGEz0wY+Yg@mail.gmail.com>
References: <CAHmME9poZPFbYhitnK8UvDB-32hLRcTFc4vAwaUPwGEz0wY+Yg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 7 Apr 2017 16:31:05 +0200
Message-ID: <CAHmME9ouagoSmxUy2R0YAhhUhX7PVRpJuP6S6PC+AxHKHtb+BA@mail.gmail.com>
Subject: Re: [RFC] Multicast and IPv6 Link Local Addresses
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>,
 =?UTF-8?Q?Dave_T=C3=A4ht?= <dave@taht.net>, Juliusz Chroboczek <jch@irif.fr>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey George,

On Fri, Apr 7, 2017 at 4:13 PM, George Walker <georgewalkeriv@gmail.com> wrote:
> I'm far from an IP muticast expert, but it would seem more consistent with
> the existing cryptokey routing paradigm if the packets addressed to the
> multicast range went to every peer on that interface which had the multicast
> address addressed among its "allowedIPs."  Then, the only difference between
> configuring multicast and unicast is how many peers may have the same
> allowedIP.

Thanks for this feedback. Indeed this is the initial design I had
thought about and discussed quite a bit. In the name of "simplicity" I
had been nudged back toward the easier special case semantics. I
suppose it's still up in the air.

== Peers Sharing Multiple AllowedIPs Entries ==
Pros:
- Highly configurable.
- More clear what's happening.
Cons:
- Right now there is a strict one-entry-one-peer enforcement, to
maintain the one to one. This has the nice property that if you try to
add the same allowed-ips to the same peer, by accident, the allowed-ip
simply _moves_. I rather like this behavior. Thus, there'd have to be
some explicit way of telling it, "yes I really do want this to be
duplicated, not moved". Perhaps a "multi:" prefix? I don't know, but
it's uglier UI stuff to grok.

== Special Cased Broadcast/Multicast Addresses ==
Pros:
- Simple on and off switch.
Cons:
- A bit too magical.
- Seems to break paradigm.

Hm.

Jason
