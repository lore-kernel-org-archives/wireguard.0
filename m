Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8f3d4ba
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 09:56:03 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [IPv6:2001:470:dc45:1000::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3fdf4ffd
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 09:56:03 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Tim Weippert <weiti@weiti.org>, wireguard@lists.zx2c4.com
Subject: Re: WG load balancing?
In-Reply-To: <20180510093648.GA1674@weiti-p772>
References: <910c1abf-a7cf-443d-f0c1-8b682d0e6084@urlichs.de>
 <20180510093648.GA1674@weiti-p772>
Date: Thu, 10 May 2018 11:58:36 +0200
Message-ID: <87d0y3ygqb.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Tim Weippert <weiti@weiti.org> writes:

> Hi Matthias,=20
>
>
> On Thu, May 10, 2018 at 11:21:44AM +0200, Matthias Urlichs wrote:
>> Hello list,
>>=20
>> Assume a branch office with two uplinks to the Internet that wants to
>> use WG to talk to the main office, using both of these uplinks in
>> parallel (assuming they're both up) for better uplink speed (and for
>> redundancy if they aren't). Now the obvious idea is to create two WG
>> interfaces on each side, and add a couple of firewall rules to make sure
>> that packets fwmarked 1 go out on the first uplink, and so on.
>>=20
>> That's the easy part. The hard part is how to teach the kernel to load
>> balance its default route between the WG interfaces. I tried to use a
>> libteam or bonding interface to tie them together, but apparently WG
>> isn't Ethernet, so that doesn't work.
>>=20
>> I thought about using a GRE tunnel, but tunnels have fixed endpoint
>> addresses =E2=80=93 somehow I don't think it'd be a good idea to create =
two
>> wireguard interfaces with the same IP address =E2=80=A6 and I don't real=
ly want
>> to do heavy-handed address mangling on every packet. Losing all
>> connectivity whenever I happen to flush my firewall tables doesn't
>> appeal to me.
>
> Maybe you can use some kind of dynamic routing approach here. Use FRR,
> Quagga or Bird with e.g. OSPF and ECMP ( Equal Cost Multipath) to utilize
> both links. (practically you can also have two default routes with the
> same metric and this should do a round robin fashioned loadbalancing)

You can add ECMP routes with 'ip route' via the 'nexthop' parameter. See
'man ip-route'.

-Toke
