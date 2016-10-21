Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b97bc57e
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Oct 2016 02:31:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab4ed125
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Oct 2016 02:31:05 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bee1c495
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Oct 2016 02:31:05 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id x79so124001170lff.0
 for <wireguard@lists.zx2c4.com>; Thu, 20 Oct 2016 19:32:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <58096029.23859.5C451AE@pageexec.gmail.com>
References: <87mvi0jxsb.fsf@toke.dk> <87zim0wcdy.fsf@toke.dk>
 <CAHmME9qDnL8QDtP-n8vDno01YnyrA6DgezxSf37TOTgnPe4n=w@mail.gmail.com>
 <58096029.23859.5C451AE@pageexec.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 21 Oct 2016 11:32:04 +0900
Message-ID: <CAHmME9opbKv9c67uCk69K_J3=A0-8p0gkwmJos83wBiMJ9WmCw@mail.gmail.com>
To: Pipacs <pageexec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Emese Revfy <re.emese@gmail.com>,
 =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>,
 Brad Spengler <spender@grsecurity.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Error building against grsec-enabled kernel
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Oct 21, 2016 at 9:24 AM, PaX Team <pageexec@gmail.com> wrote:
> in any case, whoever can reproduce this should print out the value of
> head->mac_header before the increment. my guess based on past experience
> on similar network problems is that the field is probably invalid (ffff
> or similar) and adding to it will trigger the size overflow check. this
> in turn means that there's usually some higher level logic bug and you'll
> have to talk to netdev guys as i'm way out of my depths at that point ;).

Fixed:
https://git.zx2c4.com/WireGuard/commit/?id=867c815c31c754bf97b5fb29afd295b7cf195159

>> >> OK, so turns out just getting rid of the __read_mostly fixes things.
>
> FWIW, i've been carrying such a local patch on my gentoo box too ;).

Got a good #ifdef for PAX that I should use to conditionally not use
__read_mostly in case PAX is in use?
