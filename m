Return-Path: dennis.jackson@cs.ox.ac.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e0ad78a
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 08:43:27 +0000 (UTC)
Received: from relay13.mail.ox.ac.uk (relay13.mail.ox.ac.uk [129.67.1.166])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b272de1
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 08:43:27 +0000 (UTC)
Received: from smtp4.mail.ox.ac.uk ([129.67.1.207])
 by relay13.mail.ox.ac.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <dennis.jackson@cs.ox.ac.uk>)
 id 1fxpt4-0000Vu-hh
 for wireguard@lists.zx2c4.com; Thu, 06 Sep 2018 09:43:39 +0100
Received: from 61.ip-51-38-113.eu ([51.38.113.61] helo=T-200)
 by smtp4.mail.ox.ac.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <dennis.jackson@cs.ox.ac.uk>)
 id 1fxpt4-0008Fc-Cz
 for wireguard@lists.zx2c4.com; Thu, 06 Sep 2018 09:43:38 +0100
Date: Thu, 6 Sep 2018 09:43:30 +0100
From: Dennis Jackson <dennis.jackson@cs.ox.ac.uk>
To: wireguard@lists.zx2c4.com
Subject: Re: Let's talk about obfuscation again
Message-ID: <20180906094330.273b07be@T-200>
In-Reply-To: <CA+7UkwLER55wRDfLT7gNH+cPwSW4ziD-L71HyPix_wXOKFsiWg@mail.gmail.com>
References: <CA+7UkwLER55wRDfLT7gNH+cPwSW4ziD-L71HyPix_wXOKFsiWg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/RwnK2VAjgtVckDZ=Q1csGSO"; protocol="application/pgp-signature"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--Sig_/RwnK2VAjgtVckDZ=Q1csGSO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,=20

I've been thinking about this issue as well and I agree it's an
important one to solve. However, Wireguard's key selling points are its
performance, simple configuration and minimal code size and I don't
think we can compromise this. So I was wondering if a userspace program
which obfuscates outgoing Wireguard packets and de-obfuscates incoming
packets might solve the problem, without impacting Wireguard's key
features.=20

The userspace daemon would:
	- 'Clean' Wireguard handshake packets,=20
		* Randomise the packet type field
		* Convert the ephemeral key to Elligator encoding
		* Randomise the mac field if unused
		* Random padding to alter packet lengths
	- 'Clean' Data packets
		* The header is exactly 16 bytes and non-repeating so
		  transform with AES-ECB
		* The key could be derived from a PSK and the public
		  keys used in the handshake (ensuring keys don't
		  repeat)
		* Or Wireguard could provide a hook for a "post-master
		  secret" which might be useful for many extensions
	- The resulting stream would (hopefully) be uniformly
	  distributed which can either be transmitted directly or
	  passed to a pluggable transport.=20
	- On the receiving end the daemon reverses the transformation
	  and delivers the packets to Wireguard.

Outcome:
	+ Clear separation between codebases
	+ No matter how badly implemented, the userspace daemon can't
	  compromise authenticity or confidentiality.=20
	+ Easily extensible
	+ Wireguard doesn't need to know about the transformation, it
	  just sends its packets to a listener on the loopback
	  interface.
	- Performance hit from the packet indirection, ECB encryption
	  etc
	- Still needs Wireguard to disable cookies, add timing jitter
	  on handshake / keep-alive packets.=20

I'm sure there are alternatives/better solutions. This is just a
sketch to show it is possible without altering Wireguard's codebase or
functionality. If you have any comments or criticism, I'd be interested
in refining the idea further.=20

Kind regards,
Dennis

On Thu, 6 Sep 2018 10:06:07 +1000
StarBrilliant <coder@poorlab.com> wrote:

> Hi,
>=20
> (TL;DR: Please seriously consider preventing WG from being blocked,
> for 2/3 of the world's Internet users. No need to break compatibility,
> be friendly to PT plugins is a possible solution.)
>=20
> I have been using WG for months. I understand the fact that Wireguard
> wants to keep its protocol simple and easy to audit. I also understand
> that we have talked about this topic back in 2016. [1]
>=20
>=20
> ## The problem: way too easy to block
>=20
> I propose this issue again, because Wireguard has recently become a
> hot topic in Chinese community with the most strict
> <del>Internet</del> Intranet censorship in the world. Chinese
> Wireguard users succeeded in access the Internet temporarily, but we
> know Wireguard never tries to prevent itself from being blocked.
>=20
> It is indeed very easy to completely block Wireguard protocol with
> iptables:
> > iptables -A FORWARD -p udp -m length --length 120 -m u32 --u32 "0
> > >> 22 & 0x3c @ 8 =3D 0x2000000" -j DROP =20
> (Yes, from prior experience of blocking TLS and OpenVPN, usually
> Message ID 2 is blocked instead of Message ID 1, probably for the
> intention to consume server resources.)
>=20
> It is also possible to interfere with the keep-alive packet, since it
> is "always on time like a bus" and exactly 32 bytes:
> > iptables -A FORWARD -p udp -m length --length 60 -m u32 --u32 "0 >>
> > 22 & 0x3c @ 8 =3D 0x4000000" -m statistic --mode random --probability
> > 0.4 -j DROP =20
>=20
>=20
> ## But it's unrelated to WG's security model!
>=20
> I heard someone saying something like below:
>=20
> On Sat Jul 9 17:49:47 CEST 2016, Bruno Wolff III <bruno@wolff.to>
> wrote:
> > Given the design goals of wireguard, I don't think it is something
> > that would be particularly good to combine with steganography. We
> > need real net neutrality, with ISPs not allowed to block traffic
> > based on content. We need governments not passing laws to make
> > people compromise their own security. Using strong unbreakable
> > encryption when communicating, should be the norm, not something
> > you need to hide. =20
>=20
> I interpret those sentences as identical to "Do not use Wireguard if
> you live in a country where unlicensed VPN is illegal. Go and ask for
> net neutrality instead." But the fact is that 2/3 of the world's
> Internet users [2] live in censorship. For most of them, unlicensed
> VPN is their only weapon to fight for net neutrality.
>=20
> The undoubted top-1 encrypted proxy software [3] in China was not
> written by a crypto professional and even started with RC4-MD5, not
> until 5 years later (2017) did it have AEAD cipher.
>=20
> People love Wireguard because of its security, flexibility and
> efficiency, but only when it can work. It is useless to talk about
> security if it does not work.
>=20
>=20
> ## Can we solve the problem easily?
>=20
> What makes Wireguard easy to detect?
> - Fixed first 4 bytes
>   (0x01000000 through 0x04000000)
> - Plaintext nounce counter
>   (Could XChaCha20 solve the problem?)
> - Fixed sender & receiver ID
>   (Two-pass encrypt might work, see below)
> - Fixed length handshake & keep-alive
>   (148, 92, 32. can we pad them longer?)
> - Punctual rekey & keep-alive
>   (Can we delay them randomly as IPsec do?)
>=20
> How can we solve the problem?
> - Embed steganography inside Wireguard?
>   (Not realistic. Big codebase, potential bugs.)
> - Two-pass encrypt so no more plaintext handshake?
>   The outer layer could be PSK and does not need to be PFS.
>   (Possible but slow. PSK can be shared among sessions, like
> L2TP/IPsec do.)
> - Remain plaintext, but fix padding and timing problem,
>   relying Pluggable Transport [4] plugins to do the remaining work.
>   (I really recommend this solution.)
>=20
> I read the tech whitepaper multiple times. I think it is possible
> solve the problem in Method 3 without breaking any compatibility. For
> Message ID =3D 1, 2, 3, we can add random data at the end of the packet.
> For Message ID =3D 4 and Length =3D 0 (keep-alive packet), we can add more
> zeros in the encapsulated packet. For the timing problem, we can give
> rekey and keep-alive a little bit randomness.
>=20
> In conclusion, I think we do not need to break the compatibility or
> bloat the code base to make Wireguard immune to being detected. We
> could either two-pass encrypt the packet, or solve the padding and
> timing problem so PT plugins can run on top of it. I hope to see
> Wireguard run anywhere without worries, not only on devices owned by
> 1/3 of the Internet's population.
>=20
>=20
> ## Notes
>=20
> [1] https://lists.zx2c4.com/pipermail/wireguard/2016-July/000184.html
> [2] https://www.theverge.com/2016/11/14/13596974/
> [3] https://github.com/shadowsocks/shadowsocks (Please switch git
> branch to see the actual code)
> [4]
> https://www.torproject.org/docs/pluggable-transports.html.en#list-of-pts
>=20
>=20
> Best regards.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard



--=20
PGP Fingerprint: 5B93 F0B9 D6A8 9BC1 546B C98C 6105 A775 8CD2 46AC

--Sig_/RwnK2VAjgtVckDZ=Q1csGSO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbkOiyAAoJEGEFp3WM0kasyM8P/iqzZ2A//wIXelATk0PgnO2D
SUcaaL3GeH66h7SessQEP0c+rUUpaKDaxp4JgUEFvu0qRKg1Sx6Ye0UKsQaS6p/W
D8A9HdEaBCiwuQJ+i/BwEoFVxkKEO4aNLhi0Z10g4CJblaCivBE7DdERpJRJIcfW
8C94a7GT3x1QbidtRDp2FQu7I9EfbfH0xhDI36Nshz+qk4ntP3+Qpmx1x4TxMj4j
JOMosmVgFyOlhldKJ7iWx350Khp/enaucGv/P/HmHniUwr0j74XE5f4UixWW8RBW
hYqoR7AlzNemrRYeBTRNp7bc+vqmsTKw5/GbY6EfDvyDz1uArAR1nX0Du+zJLDBD
BjVeE9Wjiikq2aoaLdfcnjmsAD09lVYIXnDNNi3yKD6WCnR/wp2QvPk6beiVFwhH
RPVIyzd1ByXhGH1ka3qKQ6FwduZNUp9pZj70I+pw9wUKuScGcuFCdOvm5dJbQDzh
hxkFP5rF3Rz73zuI904H7pW+laOPLJ2cmuo36Jg0e2FT3nfeyYr2/O8GAdC9C+Dv
GvmhN4Kw+JshxZQ826/eGCy3lQcEttwmE/t+hHRC93ygtU8LWgz4cDbQjZUk0xQ/
9SJZIAN3V12IqBVhW/jJgwFIBLge2Jua5fearORFIVahJNknmDrqynRcM+Ac0CxQ
BVt7+JwhlW5Vc5Z1zGmD
=0hqE
-----END PGP SIGNATURE-----

--Sig_/RwnK2VAjgtVckDZ=Q1csGSO--
