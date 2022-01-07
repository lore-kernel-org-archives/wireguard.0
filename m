Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D692C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Jan 2022 22:13:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4a7ddc32;
	Fri, 7 Jan 2022 22:13:28 +0000 (UTC)
Received: from hetz0.host.rs.currently.online (hetz0.host.rs.currently.online
 [178.63.44.182])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 1efec093
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 7 Jan 2022 22:13:26 +0000 (UTC)
Received: from carbon.srv.schuermann.io (carbon.srv.schuermann.io
 [178.63.44.188])
 by hetz0.host.rs.currently.online (Postfix) with ESMTPS id 6E85F78AB;
 Fri,  7 Jan 2022 22:13:26 +0000 (UTC)
From: Leon Schuermann <leon@is.currently.online>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=is.currently.online;
 s=carbon; t=1641593606;
 bh=xX+j810LCff+5w6vbxwoPSjBqrbFx08OD5ClPWBe6UM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date;
 b=B89XaTMLTaMgdDGnCP3p6gq+8kyXRplq4I3gmsyTB3MGr+SSKYHisUTnv16i4DDRD
 NrZO8rasQEyWhx4da1pdryKAIeLu6gWEX2HmKc4gM+ZjnsiUvfqdFnKCVNfEUwOzLE
 fbpbNyrA9t9xRJno4v4tG7ju6sMdmtd3tOaPHdWQ=
To: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: wireguard@lists.zx2c4.com
Subject: Re: [RFC PATCH 0/4] Introduce per-peer MTU setting
In-Reply-To: <87tuejb2xg.fsf@toke.dk>
References: <20211228234524.633509-1-leon@is.currently.online>
 <87tuejb2xg.fsf@toke.dk>
Date: Fri, 07 Jan 2022 23:13:21 +0100
Message-ID: <87tuefry7y.fsf@silicon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk> writes:
> I'm not sure I understand the use case? Either PMTUD works through the
> tunnel and you can just let that do its job, or it doesn't and you
> have to do out-of-band discovery anyway in which case you can just use
> the FIB route MTU?

For traffic _through_ the WireGuard tunnel, that is correct. As
WireGuard in general does not do any funny business with the traffic it
forwards, path MTU discovery through the tunnel works just fine. I'll
call that end-to-end PMTUD. If this does not work for any reason, one
has to fall back onto specifying the MTU in FIB, or some other
mechanism.

I am however concerned about the link(s) _underneath_ the WireGuard
tunnel (where the encrypted + authenticated packets are forwarded), so
the endpoint-to-endpoint link. Regular path MTU discovery does not work
here. As far as I understand, the reasoning behind this is that even if
the WireGuard endpoint does receive ICMP Fragmentation Needed / Packet
Too Big messages from a host on the path the tunnel traverses, these
messages are not and cannot be authenticated. This means that this
information cannot be forwarded to the sender of the original packet,
outside of the tunnel.

This is a real-word issue I am experiencing in WireGuard setups. For
instance, I administer the WireGuard instance of a small student ISP.
Clients connect from a variety of networks to this endpoint, such as DSL
links (PPPoE) which commonly have 1492 bytes MTU, or connections using
Dual-Stack Lite, having 1460 bytes MTU due to the encapsulation
overhead. Essentially no residential providers fragment packets, and
some do not even send ICMP responses. Sometimes people use a tunnel
inside another tunnel, further decreasing MTU.

While reducing the server and client MTUs to the maximum MTU supported
by all supported link types technically works, it increases IP, tunnel
and transport header overhead. It is thus desirable to be able to
specify an individual MTU per WireGuard peer, to use the available MTU
on the respective routes. This is also on the WireGuard project's todo
[1] and has been discussed before [2].

> what do you mean by "usable on the rest of the route"?

Actually, I think I might be wrong here. Initial tests have suggested me
that if the route MTU is specified in the FIB, Linux would not take any
ICMP Fragmentation Needed / Packet Too Big responses into account. I've
tested this again, and it seems to indeed perform proper path MTU
discovery even if the route MTU is specified. This is important as a
route to the destination host might first go through a WireGuard tunnel
to a peer, and then forwarded over paths which might have an even lower
MTU.

Thus the FIB entry MTU is a viable solution for setting individual
peer's route limits, but it might be rather inelegant to modify the
route's MTU values in the FIB from within kernel space, which might be
needed for an in-band PMTUD mechanism.

>> Furthermore, with the goal of eventually introducing an in-band
>> per-peer PMTUD mechanism, keeping an internal per-peer MTU value does
>> not require modifying the FIB and thus potentially interfere with
>> userspace.
>
> What "in-band per-peer PMTUD mechanism"? And why does it need this?

As outlined above, WireGuard cannot utilize the regular ICMP-based PMTUD
mechanism over the endpoint-to-endpoint path. It is however not great to
default to a low MTU to accomodate for low-MTU links on this path, and
very inconvenient to manually adjust the tunnel MTUs.

A solution to this issue could be a PMTUD mechanism through the tunnel
link itself. It would circumvent the security considerations with
ICMP-based PMTUD by relying exclusively on an encrypted + authenticated
message exchange. For instance, a naive approach could be to send ICMP
echo messages with increasing/decreasing payload size to the peer and
discover the usable tunnel MTU based on the (lost) responses. While this
can be implemented outside of the WireGuard kernel module, it makes
certain assumptions about the tunnel and endpoint configuration, such as
the endpoints having an IP assigned, this IP being in the AllowedIPs
(not a given), responding to ICMP echo packets, etc. If such a mechanism
were to be (optionally) integrated into WireGuard directly, it could
have the potential to reduce these kinds of headaches significantly.

#+BEGIN_EXAMPLE
Here is an illustration of these issues using a hacky Mininet test
setup[3], which has the following topology (all traffic from h5 being
routed over the tunnel between h1 and h4), with fragmentation disabled:

      /--- wireguard ---\
     /                   \
    /  eth    eth    eth  \
    h1 <-> h2 <-> h3 <-> h4 <-> h5

The route from h1 to h4 has an MTU of 1500 bytes:

    mininet> h1 ping -c1 -Mdo -s1472 h4
    1480 bytes from 10.0.2.2: icmp_seq=3D1 ttl=3D62 time=3D0.508 ms

The route from h1 to h5 (through the WireGuard tunnel, via h4) has an
MTU of 1420 bytes:

    mininet> h1 ping -c1 -Mdo -s1392 h5
    1400 bytes from 192.168.1.2: icmp_seq=3D1 ttl=3D63 time=3D7.44 ms

When decreasing the MTU of the h2 to h3 link, we can observe that PMTUD
works on the route of h1 to h4:

    mininet> h2 ip link set h2-eth1 mtu 1492
    mininet> h3 ip link set h3-eth0 mtu 1492
    mininet> h1 ping -c1 -Mdo -s1472 h4
    From 10.0.0.2 icmp_seq=3D1 Frag needed and DF set (mtu =3D 1492)

However, when trying to ping h5 from h1 through the WireGuard tunnel,
the packet is silently dropped:

    mininet> h1 ping -c1 -Mdo -s1392 -W1 h5
    PING 192.168.1.2 (192.168.1.2) 1392(1420) bytes of data.

    --- 192.168.1.2 ping statistics ---
    1 packets transmitted, 0 received, 100% packet loss, time 0ms

We can change the appropriate FIB entry of the route _through_ the
tunnel to make Linux aware of the lower MTU:

    mininet> h1 ip route change 192.168.1.0/24 dev wg0 mtu 1412
    mininet> h1 ping -c1 -Mdo -s1392 -W1 h5
    ping: local error: message too long, mtu=3D1412
    mininet> h1 ping -c1 -Mdo -s1384 -W1 h5
    1392 bytes from 192.168.1.2: icmp_seq=3D1 ttl=3D63 time=3D10.8 ms

When lowering the MTU of the h4 to h5 link even further (not part of the
endpoint-to-endpoint link, but the route), PMTUD does work, which is
good:

    mininet> h4 ip link set h4-eth1 mtu 1400
    mininet> h5 ip link set h5-eth0 mtu 1400
    mininet> h1 ping -c1 -Mdo -s1384 -W1 h5
    PING 192.168.1.2 (192.168.1.2) 1384(1412) bytes of data.
    From 192.168.0.2 icmp_seq=3D1 Frag needed and DF set (mtu =3D 1400)
#+END_EXAMPLE

Let me know if that made things any clearer. :)

- Leon

[1]: https://www.wireguard.com/todo/#per-peer-pmtu
[2]: https://lists.zx2c4.com/pipermail/wireguard/2018-April/002651.html
[3]: https://gist.github.com/lschuermann/7e5de6e00358d1312c86e2144d7352b4
