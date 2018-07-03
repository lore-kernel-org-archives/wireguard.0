Return-Path: b.candler@pobox.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d65b1bd4
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 07:35:16 +0000 (UTC)
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9287454c
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jul 2018 07:35:16 +0000 (UTC)
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id DC163F2719
 for <wireguard@lists.zx2c4.com>; Tue,  3 Jul 2018 03:41:30 -0400 (EDT)
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
 by pb-smtp1.pobox.com (Postfix) with ESMTP id C558AF2718
 for <wireguard@lists.zx2c4.com>; Tue,  3 Jul 2018 03:41:30 -0400 (EDT)
Received: from [10.101.2.227] (unknown [176.12.107.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 2245FF2717
 for <wireguard@lists.zx2c4.com>; Tue,  3 Jul 2018 03:41:30 -0400 (EDT)
To: wireguard@lists.zx2c4.com
From: Brian Candler <b.candler@pobox.com>
Subject: MTU on public wifi
Message-ID: <e42d9e5f-fbc0-e56c-314d-1a8d0309a97d@pobox.com>
Date: Tue, 3 Jul 2018 08:41:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I was testing wireguard via a public wifi service (Icomera on-train=20
wifi) and found that the tunnel MTU wireguard had chosen was too large:=20
TCP connections got stuck as soon as any large amount of data was sent=20
(e.g. just running "top")

The MTU of the wifi service itself is 1440:

MacBook-Pro-2:~ $ ping -s1412 -D 8.8.8.8
PING 8.8.8.8 (8.8.8.8): 1412 data bytes
1420 bytes from 8.8.8.8: icmp_seq=3D0 ttl=3D58 time=3D46.006 ms
1420 bytes from 8.8.8.8: icmp_seq=3D1 ttl=3D58 time=3D40.847 ms
^C
--- 8.8.8.8 ping statistics ---
[Interface]
2 packets transmitted, 2 packets received, 0.0% packet loss
round-trip min/avg/max/stddev =3D 40.847/43.427/46.006/2.579 ms
MacBook-Pro-2:~ $ ping -s1414 -D 8.8.8.8
PING 8.8.8.8 (8.8.8.8): 1414 data bytes
556 bytes from 10.101.2.1: frag needed and DF set (MTU 1440)
Vr HL TOS=C2=A0 Len=C2=A0=C2=A0 ID Flg=C2=A0 off TTL Pro=C2=A0 cks=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 Src Dst
 =C2=A04=C2=A0 5=C2=A0 00 a205 33b6=C2=A0=C2=A0 0 0000=C2=A0 40=C2=A0 01 =
e44d 10.101.2.227 8.8.8.8

(Payload 1412 + 20 bytes IP header + 8 bytes ICMP header =3D 1440)

The client is macOS wireguard-tools/wireguard-go.=C2=A0 Wireguard itself =
had=20
set an MTU on utun1 of 1440.=C2=A0 With some experimentation, I found tha=
t=20
setting MTU of 1400 was fine, but 1410 was too big.

With "MTU =3D 1400" in wg0.conf it now appears to work correctly, althoug=
h=20
I'm not sure how safe that value is - does Wireguard compress data=20
before encapsulation, and therefore is there a chance that worst-case=20
encapsulated packets could still be too big?

But I did try "dd if=3D/dev/urandom bs=3D1024 count=3D100" and it did sen=
d the=20
whole random splurge without locking up the TCP connection.

I also wonder if wireguard could automatically reduce its MTU in=20
response to ICMP "frag needed" packets, at least down to a configured=20
minimum?

Regards,

Brian Candler.
