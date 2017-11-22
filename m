Return-Path: tbskyd@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43e99c89
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 15:55:44 +0000 (UTC)
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
 [209.85.128.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3bd337d
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 15:55:44 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id z14so14961640wrb.8
 for <wireguard@lists.zx2c4.com>; Wed, 22 Nov 2017 08:00:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <D8DF2FC5-F5BF-474E-B774-C0FF4D993DB9@lonnie.abelbeck.com>
References: <CAC6SzHKVvOEZYXiuK-O6jMN=OOPjfogq2bbeHnYA1xoLew-OcQ@mail.gmail.com>
 <CAHmME9qmZCt7GDeXZtDBwSeg2z1Md9UQENbNo5TXvSqWion9rA@mail.gmail.com>
 <CAC6SzHJ_xHN5fCn2mQ=xrx2Uz6YbZLoHE6As0bwE1SmzprCn+g@mail.gmail.com>
 <D8DF2FC5-F5BF-474E-B774-C0FF4D993DB9@lonnie.abelbeck.com>
From: d tbsky <tbskyd@gmail.com>
Date: Thu, 23 Nov 2017 00:00:51 +0800
Message-ID: <CAC6SzHKzraOBNh0B9C9PUojSJy2r2XvfqehzEnmzzK5GJeuG6w@mail.gmail.com>
Subject: Re: roaming and ddns dynamic ip
To: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
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

2017-11-22 23:49 GMT+08:00 Lonnie Abelbeck <lists@lonnie.abelbeck.com>:
>
> On Nov 22, 2017, at 6:51 AM, d tbsky <tbskyd@gmail.com> wrote:
>
>> 2017-11-22 19:59 GMT+08:00 Jason A. Donenfeld <Jason@zx2c4.com>:
>>> Hello,
>>>
>>> This is not a bug. DNS resolution is not done by the WireGuard module,
>>> but rather by the configuration tool. If you want to update an IP,
>>> you'll need to devise a mechanism for this. One popular one is this
>>> example script:
>>> https://git.zx2c4.com/WireGuard/tree/contrib/examples/reresolve-dns ,
>>> but many other possibilities exist too.
>>>
>>> Jason
>>
>> I don't think it's a bug. as you said, that's by design.although it
>> means I need other tool to co-maintain the vpn connection.
>
> Jason, question, if each endpoint had PersistentKeepalive enabled, does that update the endpoint addresses via your roaming code ?  Or does actual tunnel data traffic need to occur to update roaming endpoints ?
>
> If PersistentKeepalive updates roaming endpoints, then it would seem to be a very rare situation when both endpoints had an address change within the PersistentKeepalive window.
>
> Lonnie

when client is behind firewall via nat to internet, and server has
dynamic ip, I don't think keepalive will help. since the changed
server can not connect to client, it needs client to initial the
connection. under openvpn, keepalive can detect broken link and try to
restart itself, then client can reconnect to server automatically.

but if both site has public ip, maybe wireguard keepalive can do the work?

Regards,
tbskyd
