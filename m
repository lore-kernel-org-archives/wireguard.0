Return-Path: tth@rfa.cz
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8f6cdb9
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 13:27:33 +0000 (UTC)
Received: from vodka.rfa.cz (vodka.rfa.cz [88.86.120.134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dec67f4e
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 13:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by vodka.rfa.cz (Postfix) with ESMTP id C9B3C85BCC
 for <wireguard@lists.zx2c4.com>; Tue, 21 Nov 2017 14:32:32 +0100 (CET)
Received: from vodka.rfa.cz ([127.0.0.1])
 by localhost (vodka.rfa.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5XTqE1B7AWsF for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 14:32:32 +0100 (CET)
Received: from [172.16.16.3] (unknown [172.16.16.3])
 by vodka.rfa.cz (Postfix) with ESMTPSA id 58BA983C0B
 for <wireguard@lists.zx2c4.com>; Tue, 21 Nov 2017 14:32:32 +0100 (CET)
Subject: Re: multi-home difficulty
To: wireguard@lists.zx2c4.com
References: <CAC6SzH+Q-1SRVXOoScGhXWraOLdp9_Rud6cMbQ95a51r=eRWTw@mail.gmail.com>
From: Tomas Herceg <tth@rfa.cz>
Message-ID: <f39bc571-6322-17fb-4fb6-f744417d384f@rfa.cz>
Date: Tue, 21 Nov 2017 14:32:24 +0100
MIME-Version: 1.0
In-Reply-To: <CAC6SzH+Q-1SRVXOoScGhXWraOLdp9_Rud6cMbQ95a51r=eRWTw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JXgPf5HiOHcRR4JavIlIWcR2JRkbqakoT"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JXgPf5HiOHcRR4JavIlIWcR2JRkbqakoT
Content-Type: multipart/mixed; boundary="rvjLjbLUwd25PB6GplpQCxIFkHwki2nWs";
 protected-headers="v1"
From: Tomas Herceg <tth@rfa.cz>
To: wireguard@lists.zx2c4.com
Message-ID: <f39bc571-6322-17fb-4fb6-f744417d384f@rfa.cz>
Subject: Re: multi-home difficulty
References: <CAC6SzH+Q-1SRVXOoScGhXWraOLdp9_Rud6cMbQ95a51r=eRWTw@mail.gmail.com>
In-Reply-To: <CAC6SzH+Q-1SRVXOoScGhXWraOLdp9_Rud6cMbQ95a51r=eRWTw@mail.gmail.com>

--rvjLjbLUwd25PB6GplpQCxIFkHwki2nWs
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

+1 for binding only on specific IP

On 11/21/2017 02:21 PM, d tbsky wrote:
> Hi:
>    I tested wireguard and the speed is amazing. but when I try to
> deploy it to our real linux firewall, I found it is hard to make it
> work.
>=20
>    our current linux firewall have multiple interface and multiple
> routing tables. local program will get lan ip address and nat to
> correct wan ip address when goto internet.
>=20
>   since wireguard can not bind to specific ip address, it sometimes
> use wrong ip address to reply and the vpn communication can not be
> established.
>=20
> for example:
>=20
> config for client site: (assume wan ip is 2.2.2.2)
> interface: wg0
>   public key: ****
>   private key: (hidden)
>   listening port: 51820
> peer: ****
>   endpoint: 1.1.1.1:51820
>   allowed ips: 0.0.0.0/0
>=20
> config for server site: (assume wan ip is 1.1.1.1)
> interface: wg0
>   public key: ****
>   private key: (hidden)
>   listening port: 51820
> peer: ****
>   allowed ips: 0.0.0.0/0
>=20
> when client initial connect to server, at server site I saw  flow like =
below:
> "cat /proc/net/nf_conntrack | grep 51820"
>=20
> ipv4     2 udp      17 23 src=3D172.18.1.254 dst=3D2.2.2.2 sport=3D5182=
0
> dport=3D51820 packets=3D1 bytes=3D120 [UNREPLIED] src=3D2.2.2.2 dst=3D1=
=2E1.1.1
> sport=3D51820 dport=3D1085 packets=3D0 bytes=3D0 mark=3D1 zone=3D0 use=3D=
2
> ipv4     2 udp      17 23 src=3D2.2.2.2 dst=3D1.1.1.1 sport=3D51820
> dport=3D51820 packets=3D1 bytes=3D176 [UNREPLIED] src=3D1.1.1.1 dst=3D2=
=2E2.2.2
> sport=3D51820 dport=3D51820 packets=3D0 bytes=3D0 mark=3D1 zone=3D0 use=
=3D2
>=20
> so at first client  2.2.2.2:51820 connect to server 1.1.1.1:51820
> but then server use 172.18.1.254(lan ip address) to reply and 51820
> port is nat to 1085 so the communication is broken.
>=20
> if wireguard can bind to specific ip address then there will be no prob=
lem.
> or if wireguard can reply with the correct ip address.( eg: if client
> connect to wireguard ip 1.1.1.1, then wiregurad should reply via ip
> address 1.1.1.1) then maybe there will be no problem.
>=20
> Regards,
> tbskyd
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>=20


--rvjLjbLUwd25PB6GplpQCxIFkHwki2nWs--

--JXgPf5HiOHcRR4JavIlIWcR2JRkbqakoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEGXBAbLykzb5aDkAjp07Jn11b01MFAloUKu8ACgkQp07Jn11b
01MjDwf/UalpVnTHAJ/XIKKU6K337P+e27npIZ/gOWCY2E/mY3XUqDsr6zZ9Lt6W
pRDCRz4fO5WMY92qz7/y4xiNrNFkIuZjOqleu9RGxQfnZ1Rxj97tTREXxDnZH4jf
DZsHePFbUOox7bhw5NrbcbgNvvfDUxQxpNynkeGqUbSSuoxzx5E9HNko3ufchHio
Hw8+o4bwTeJXLoyTpFCjy4jJbhcTNg9TModtPfhyIDyE3ObF3h9MhmeuBtgNVUt4
sXLJn1Ch2IaKtiy9o0RyFHc7a18outZPXiKc7eqP9g5z2BfQki8cq/gENnYX3qEu
IqYKwDjGUC81T4laZkjdFKKwjOF9dQ==
=621A
-----END PGP SIGNATURE-----

--JXgPf5HiOHcRR4JavIlIWcR2JRkbqakoT--
