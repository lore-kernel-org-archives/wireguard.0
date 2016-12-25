Return-Path: jens@viisauksena.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0883644a
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Dec 2016 04:07:29 +0000 (UTC)
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42e0ead6
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Dec 2016 04:07:28 +0000 (UTC)
Subject: Re: [fyi] test in the wild (wg + gretap + batman-adv) on tplink842
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <b9daea6b-caa1-6778-7236-02efb2288b99@viisauksena.de>
 <1482597351.888073.828789001.771C92C9@webmail.messagingengine.com>
From: jens <jens@viisauksena.de>
Message-ID: <1439626e-1f99-83fb-aab5-6a316346801e@viisauksena.de>
Date: Sun, 25 Dec 2016 05:14:47 +0100
MIME-Version: 1.0
In-Reply-To: <1482597351.888073.828789001.771C92C9@webmail.messagingengine.com>
Content-Type: text/plain; charset=windows-1252
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 24.12.2016 17:35, Jehan Tremback wrote:
> Maybe I'm missing something obvious, but why would batman-adv affect th=
e
> speed?

not directly,

or i don't understand where your conclusion came from. batman-adv means
a lot of little batman-mesh-protocoll packets (namely ogm packets,
protocoll traffic is around 300 kbits in our network. which also will
travel over gretap/wireguard)

this scenario is equivalent to our free wifi network with 300++ nodes
and +-1000 users.
We use batman-adv as mesh protocol. While wireguard is layer 3 we need
to have layer2 over this tunnel.
so i tested wireguard + gretap + batman-adv   successfully.

compared to a other known layer2 crypted tunnel protocol (fastd) this is
3 times faster, which is mainly due to wireguard is a kernel-module and
fastd lay in userspace. (-> context switche)

i testet on weak devices, because this is what is deployed in big
numbers in our (and many other) Freifunk community.
also there are plenty of packets and stuff - so this explain the
relative low throughput. At least compared with clean linked test-setups.=


hope this explain my motivation and the reason why i test this in this
special scenario.

Jens/fuzzle

--=20
make the world nicer, please use PGP encryption
