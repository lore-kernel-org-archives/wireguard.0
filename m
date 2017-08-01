Return-Path: larkwang@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bbc1f03
 for <wireguard@lists.zx2c4.com>; Tue, 1 Aug 2017 01:40:55 +0000 (UTC)
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
 [209.85.217.182])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d8a7e56
 for <wireguard@lists.zx2c4.com>; Tue, 1 Aug 2017 01:40:55 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id d29so1237544uai.2
 for <wireguard@lists.zx2c4.com>; Mon, 31 Jul 2017 19:01:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9oj1N3PdutkA1dAPOieqn6ukUPnRONp-_iBck1HhnjZiw@mail.gmail.com>
References: <CAF75rJBdfeD-7MpDGfFBV=bLbm0-H--mFin30QL9jDmpd4z1jw@mail.gmail.com>
 <CAHmME9oj1N3PdutkA1dAPOieqn6ukUPnRONp-_iBck1HhnjZiw@mail.gmail.com>
From: Wang Jian <larkwang@gmail.com>
Date: Tue, 1 Aug 2017 10:01:46 +0800
Message-ID: <CAF75rJDubyJwgrwTFTTzM4nKX2e=+6h_qBBC+Vt4FvzVhbfnuw@mail.gmail.com>
Subject: Re: Multihomed server issue
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

2017-07-31 23:34 GMT+08:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> On Fri, Jul 28, 2017 at 2:51 AM, Wang Jian <larkwang@gmail.com> wrote:
>> The solution can be one of:
>>
>> 1. server can RTS (response to source), or can bind to arbitary
>> address for outgoing
>
> The server does already respond to source.

Sorry, I didn't make it clear. By saying RTS, I mean response to
source link, that is,
using called address and incoming link.

>
> Can you send me a TCP dump and the output of `ip route` indicating
> that WireGuard is doing otherwise?

For security reason, I will send you privately.
