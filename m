Return-Path: mytril42@posteo.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60ee07b6
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 08:17:19 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9cac1158
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 08:17:19 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130])
 by mout01.posteo.de (Postfix) with ESMTPS id E772820F46
 for <wireguard@lists.zx2c4.com>; Thu, 30 Nov 2017 09:23:24 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 3ynVlv09qQz9rxy
 for <wireguard@lists.zx2c4.com>; Thu, 30 Nov 2017 09:23:22 +0100 (CET)
Subject: Re: Dynamic Adresses
To: wireguard@lists.zx2c4.com
References: <94652845-83e3-1d58-fdb8-30171254c7e3@posteo.de>
 <CAHmME9re6nRwz3C245Fo=2z2sbGLRJJwp+pKg9sJ8DQvT8Lmjg@mail.gmail.com>
 <d6719a62-29d2-9994-5b29-48f820bf54b7@posteo.de>
 <CAHmME9qkGpOocxg149rTCsdY5grD3Uq6fxScqH+Q8uDFv9vzLA@mail.gmail.com>
 <3952fa1c-80e1-dd42-7eaf-5e7fceff3daa@posteo.de>
 <CAHmME9qgsBbXxGumQ+N6-8nfc1tysrdOff71rFrYGFac=bohnw@mail.gmail.com>
 <503f4708-7a36-5e2d-895c-a891ae072cec@posteo.de>
From: Mytril <mytril42@posteo.de>
Message-ID: <74909fd9-60fc-113f-ec26-e3f1092fdd3c@posteo.de>
Date: Thu, 30 Nov 2017 09:22:44 +0100
MIME-Version: 1.0
In-Reply-To: <503f4708-7a36-5e2d-895c-a891ae072cec@posteo.de>
Content-Type: text/plain; charset=windows-1252
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> Am 29.11.2017 um 14:54 schrieb Jason A. Donenfeld:
>> On Wed, Nov 29, 2017 at 2:47 PM, Mytril <mytril42@posteo.de> wrote:
>>> Yes if you want:
>>> https://wiki.ubuntuusers.de/Baustelle/WireGuard/#Probleme-mit-der-dynamischen-IP
>>>
>>> This artikel is work in progress, later it will be accessable under:
>>> https://wiki.ubuntuusers.de/WireGuard/#Probleme-mit-der-dynamischen-IP
>>
>> As I mentioned to Georg, this really should link to
>> https://git.zx2c4.com/WireGuard/tree/contrib/examples/reresolve-dns
>> instead of using ifup&&ifdown, which is a pretty ugly solution. I'd
>> edit it myself, except I don't [yet?] read German.
>>
>> Jason
>>
> 
> Ok, i have edited the article, so that it link to this script you
> mentioned. And i will give it a try.
> 
> PS: German is not so difficult :D
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 

The script doesn't update the dynamic ip... It looks like, that it does
nothing. Are there any Requirements? I see that it looks after .conf
files in /etc/wireguard/ and i have there wg0.conf. But nothing happens.

Btw: Any Documentation and echo messages in the file would be nice :D
