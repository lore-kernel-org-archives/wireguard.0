Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f236bea
 for <wireguard@lists.zx2c4.com>; Tue, 1 Aug 2017 02:46:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02d80406
 for <wireguard@lists.zx2c4.com>; Tue, 1 Aug 2017 02:46:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85302288
 for <wireguard@lists.zx2c4.com>; Tue, 1 Aug 2017 03:05:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 47817824
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 1 Aug 2017 03:05:09 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id v127so1471420itd.0
 for <wireguard@lists.zx2c4.com>; Mon, 31 Jul 2017 20:07:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAF75rJDubyJwgrwTFTTzM4nKX2e=+6h_qBBC+Vt4FvzVhbfnuw@mail.gmail.com>
References: <CAF75rJBdfeD-7MpDGfFBV=bLbm0-H--mFin30QL9jDmpd4z1jw@mail.gmail.com>
 <CAHmME9oj1N3PdutkA1dAPOieqn6ukUPnRONp-_iBck1HhnjZiw@mail.gmail.com>
 <CAF75rJDubyJwgrwTFTTzM4nKX2e=+6h_qBBC+Vt4FvzVhbfnuw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 1 Aug 2017 05:06:58 +0200
Message-ID: <CAHmME9pujFf3pUAr9NZK81DZMQHYsH1gvgh3uH6RAQwNEZ8JDA@mail.gmail.com>
Subject: Re: Multihomed server issue
To: Wang Jian <larkwang@gmail.com>
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

On Tue, Aug 1, 2017 at 4:01 AM, Wang Jian <larkwang@gmail.com> wrote:
> 2017-07-31 23:34 GMT+08:00 Jason A. Donenfeld <Jason@zx2c4.com>:
>> On Fri, Jul 28, 2017 at 2:51 AM, Wang Jian <larkwang@gmail.com> wrote:
>>> The solution can be one of:
>>>
>>> 1. server can RTS (response to source), or can bind to arbitary
>>> address for outgoing
>>
>> The server does already respond to source.
>
> Sorry, I didn't make it clear. By saying RTS, I mean response to
> source link, that is,
> using called address and incoming link.

You're still unclear to me. What?
