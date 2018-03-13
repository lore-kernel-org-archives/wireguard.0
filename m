Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35f54779
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Mar 2018 13:34:00 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65464674
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Mar 2018 13:34:00 +0000 (UTC)
Subject: Re: TCP Wireguard with socat
To: Gianluca Gabrielli <tuxmealux@protonmail.com>
References: <utLzzyzPJsv-W3vVhU4Sdchg_5A07v9qCxR1DeJ5Wu7RzJHcje1cCEjtEWi4j0aCN05ozn9b4VYJQsLovvl6TGPp-kbZ_5kfpReEJHQQXGk=@protonmail.com>
 <e0bff705-f328-0071-0fb7-0367d36f0074@urlichs.de>
 <kvc0wmbZv_OgdINTzQhQnFxt0vFHFoqpVqYTFQkfPYOY_vqZHJN-bEvL9oJYuk-LJHubVyWlP2JCXTbRLK_9fGp7r298KveBFiOsF6P9r4Y=@protonmail.com>
 <88b9e6e0-1f38-1a20-3fac-372e96f847a3@urlichs.de>
 <XPP6R4g8xCtXsMbJljJf5ScBfx_FobBsPY66Hr7AO3venYsjyGhk0fdjtDnczcQUsMn18vZgB-CLkFCO54Ny-0LnWogx_T48_MdNsNiFd-o=@protonmail.com>
 <5e7ded44-d128-ed3a-c9e2-0b0480b4d89f@urlichs.de>
 <2LLzGYJnMQQE8ZVLLI49kcqDj8mQIdytgKD08XsZHwPaBjfN8f3WkcJZA3j4XFXW6sS1UnXfCY2GyS2PIUSGJOfPUZweZQa-tnWcUcPKzFM=@protonmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <eedf9f8d-ec6a-0c64-37df-a59c15e26e26@urlichs.de>
Date: Tue, 13 Mar 2018 14:43:48 +0100
MIME-Version: 1.0
In-Reply-To: <2LLzGYJnMQQE8ZVLLI49kcqDj8mQIdytgKD08XsZHwPaBjfN8f3WkcJZA3j4XFXW6sS1UnXfCY2GyS2PIUSGJOfPUZweZQa-tnWcUcPKzFM=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 13.03.2018 10:19, Gianluca Gabrielli wrote:
> I'm wondering why we should prepend a length to each datagram. On the d=
atagram's header the payload length is already present, should not be eno=
ugh to reconstruct the original datagram after the stream has been unwrap=
ped?
Not really, because the datagram's payload length doesn't have to
correspond to the frame length. Think malicious malformed packets, or
networks with a minimum packet length, or protocols other than wireguard
=E2=80=93 you shouldn't assume that no other data is transmitted on that =
link.

Even if all that were true, or if you enfore that on the sending side,
you'd still need a specialized unpacker on the receiving end. Easier to
just use a tool that doesn't have any of these problems.

--=20
-- Matthias Urlichs
