Return-Path: larkwang@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87fe686d
 for <wireguard@lists.zx2c4.com>; Thu, 3 Aug 2017 02:39:46 +0000 (UTC)
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
 [209.85.217.196])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 079dbd3c
 for <wireguard@lists.zx2c4.com>; Thu, 3 Aug 2017 02:39:46 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id x24so80206uah.5
 for <wireguard@lists.zx2c4.com>; Wed, 02 Aug 2017 20:00:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAF75rJD7ZcSKp6WiEHg+VUa7=07-+9P3r6TxU6s9ieW+LdkNhQ@mail.gmail.com>
References: <CAF75rJBdfeD-7MpDGfFBV=bLbm0-H--mFin30QL9jDmpd4z1jw@mail.gmail.com>
 <CAHmME9oj1N3PdutkA1dAPOieqn6ukUPnRONp-_iBck1HhnjZiw@mail.gmail.com>
 <CAF75rJDubyJwgrwTFTTzM4nKX2e=+6h_qBBC+Vt4FvzVhbfnuw@mail.gmail.com>
 <CAHmME9pujFf3pUAr9NZK81DZMQHYsH1gvgh3uH6RAQwNEZ8JDA@mail.gmail.com>
 <CAF75rJD7ZcSKp6WiEHg+VUa7=07-+9P3r6TxU6s9ieW+LdkNhQ@mail.gmail.com>
From: Wang Jian <larkwang@gmail.com>
Date: Thu, 3 Aug 2017 11:00:51 +0800
Message-ID: <CAF75rJD3LH-CcPt2Da2qfxtv7C+W4Ed=ORkUg0L2vW1QiUfBcg@mail.gmail.com>
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

2017-08-01 19:28 GMT+08:00 Wang Jian <larkwang@gmail.com>:
> 2017-08-01 11:06 GMT+08:00 Jason A. Donenfeld <Jason@zx2c4.com>:
>> On Tue, Aug 1, 2017 at 4:01 AM, Wang Jian <larkwang@gmail.com> wrote:
>>> 2017-07-31 23:34 GMT+08:00 Jason A. Donenfeld <Jason@zx2c4.com>:
>>>> On Fri, Jul 28, 2017 at 2:51 AM, Wang Jian <larkwang@gmail.com> wrote:
>>>>> The solution can be one of:
>>>>>
>>>>> 1. server can RTS (response to source), or can bind to arbitary
>>>>> address for outgoing
>>>>
>>>> The server does already respond to source.
>>>
>>> Sorry, I didn't make it clear. By saying RTS, I mean response to
>>> source link, that is,
>>> using called address and incoming link.
>>
>> You're still unclear to me. What?
>
> Let's say server has multiple interfaces, eth0, eth1, ... ethN, with
> IP0, IP1, ... IPn,
> If an incoming request is to eth1, to IP1, then the server's response
> packet will go out from eth1, and source is IP1.
>
> In some cases, it can be done using policy routing, but other cases not. I know
> a FreeBSD based VPN implements so called RTS.
>
> In my case, the server looks like
>
> eth0 = 10.1.1.2/24                    (default route, via 10.1.1.1/24)
> eth1.100 = 172.16.1.2/30         (policy routing: when source address
> is 111.111.1.0/24,  route via 172.16.1.1/30)
> eth1.200 = 172.16.2.2/30         (policy routing: when source address
> is 111.111.2.0/24,  route via 172.16.2.1/30)
> dummy0 = 111.111.1.2/24
> dummy1 = 111.111.2.2/24
>
> When a wireguard client contacts 111.111.1.2, the server responses UDP packet
> with source address 10.1.1.2 but not the desired 111.111.1.2, because
> of default route.
>
> I have mailed you my network setup privately. Sorry for inconvenience.

I managed to handle this issue for one public address

------
[Interface]
FwMark = 600
PostUp = ip rule add pref 20000 fwmark 600 table 600; ip route add
table 600 default via 172.16.1.1 src 111.111.1.2
------

With this workaround, for a wireguard interface, only one public address can
be used. We do need multiple public addresses for a reason: some clients
connect to one public address while other clients connect to another public
address.

We can use multple wg interfaces to address the limitation. But I do wish that
server can deduce public address which the client connects to, and use the
public address to response to the client, then the configuration will be
simple and straightforward.
