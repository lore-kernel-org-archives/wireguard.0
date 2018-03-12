Return-Path: tuxmealux@protonmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5e19ecc
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Mar 2018 09:05:53 +0000 (UTC)
Received: from mail3.protonmail.ch (mail3.protonmail.ch [185.70.40.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 504b10bb
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Mar 2018 09:05:53 +0000 (UTC)
Date: Mon, 12 Mar 2018 05:15:52 -0400
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Gianluca Gabrielli <tuxmealux@protonmail.com>
Subject: Re: TCP Wireguard with socat
Message-ID: <kvc0wmbZv_OgdINTzQhQnFxt0vFHFoqpVqYTFQkfPYOY_vqZHJN-bEvL9oJYuk-LJHubVyWlP2JCXTbRLK_9fGp7r298KveBFiOsF6P9r4Y=@protonmail.com>
In-Reply-To: <e0bff705-f328-0071-0fb7-0367d36f0074@urlichs.de>
References: <utLzzyzPJsv-W3vVhU4Sdchg_5A07v9qCxR1DeJ5Wu7RzJHcje1cCEjtEWi4j0aCN05ozn9b4VYJQsLovvl6TGPp-kbZ_5kfpReEJHQQXGk=@protonmail.com>
 <e0bff705-f328-0071-0fb7-0367d36f0074@urlichs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: Gianluca Gabrielli <tuxmealux@protonmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90

On March 9, 2018 10:45 PM, Matthias Urlichs <matthias@urlichs.de> wrote:

> On 09.03.2018 17:41, Gianluca Gabrielli wrote:
>=20
> > My first thought has been to make use of socat
>=20
> socat can do either packet streams or byte streams. A UDP socket (or a
>=20
> tun/tap interface) is a packet stream. TCP is a byte stream. You can't
>=20
> forward a packet stream into a byte stream. (Well, OK, socat does allow
>=20
> you to set that up, but it won't work.)
>=20
> You need wrap your packets in some sort of frame (simplest: precede each
>=20
> with a length word (but think about byte ordering)). I'm sure there are
>=20
> programs which do that, or you can write your own. socat can't do it.

Forwarding UDP packets (message oriented) into a TCP connection (stream ori=
ented) could be done without any problem. Think about an OpenVPN TCP tunnel=
 where you've redirected all your traffic, UDP connections as well.
Do you mean that socat just forward packets through the two specified chann=
el without wrapping them?
