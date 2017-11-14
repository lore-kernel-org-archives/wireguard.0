Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ac69d0b
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 13:46:30 +0000 (UTC)
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
 [209.85.218.53])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e738e92b
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 13:46:29 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id b189so12353735oia.5
 for <wireguard@lists.zx2c4.com>; Tue, 14 Nov 2017 05:50:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171114132551.GB13027@wolff.to>
References: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
 <20171114132551.GB13027@wolff.to>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Tue, 14 Nov 2017 14:50:14 +0100
Message-ID: <CAKXLc7fSwNpwwx8yu+CyonfsBe1u0C362baoZkE5XZK3b+qmxA@mail.gmail.com>
Subject: Re: Roaming Mischief
To: Bruno Wolff III <bruno@wolff.to>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Nov 14, 2017 at 2:25 PM, Bruno Wolff III <bruno@wolff.to> wrote:
> On Tue, Nov 14, 2017 at 10:59:03 +0100,
>  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>>
>> (Endpoint=my.server.whatever.zx2c4.com:51820!), that would prevent
>> servers from roaming; the client would still roam in the eyes of the
>> server, but the server, would no longer roam in the eyes of the
>> client. In other words, an option -- gasp, a nob! -- to disable
>> roaming on a per-by-peer one-sided basis. As you know, I don't really
>> like nobs. And I'd hate to add this, and then for people to use it,
>> and then loose some nice aspects of roaming, if it's not really even
>> required.
>
>
> If you know your other end point is at a fixed address you can use iptables
> (or the equivalent) to enforce this. I don't think it needs to be in
> WireGuard.
>
True, I can and will. But I like to configure all layers and multiple
times, then set "traps" (log exceptions/notify) at all levels, except
the outermost.
If _any_ of those fire, I know I have a problem and someone
sidestepped at least the outermost "firewall".

Also, it is real fun to make something actually work (i.e. connect),
you need to understand exactly what goes on, spend countless hours
drinking coffee while poking at packet traces, etc.
And even MORE fun when something DOES break and you need to fix it
ASAP in the night.

DISCLAIMER: I don't expect any one to agree with what I think or do.
And I do occasionally take advice and "improve" things. And I always
quote my $VARs.

Kalin.
