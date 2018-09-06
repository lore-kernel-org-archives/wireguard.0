Return-Path: dennis.jackson@cs.ox.ac.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8fd47489
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 15:34:42 +0000 (UTC)
Received: from relay14.mail.ox.ac.uk (relay14.mail.ox.ac.uk [163.1.2.162])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d7478ce
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 15:34:42 +0000 (UTC)
Date: Thu, 6 Sep 2018 16:34:50 +0100
From: Dennis Jackson <dennis.jackson@cs.ox.ac.uk>
To: George Walker <georgewalkeriv@gmail.com>
Subject: Re: Let's talk about obfuscation again
Message-ID: <20180906163450.3f20480b@T-200>
In-Reply-To: <706D2A48-7DAA-436A-BB99-2AE80822B524@gmail.com>
References: <CA+7UkwLER55wRDfLT7gNH+cPwSW4ziD-L71HyPix_wXOKFsiWg@mail.gmail.com>
 <20180906094330.273b07be@T-200>
 <706D2A48-7DAA-436A-BB99-2AE80822B524@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/59fWW6saf=jmJgaTL5xdRXk"; protocol="application/pgp-signature"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--Sig_/59fWW6saf=jmJgaTL5xdRXk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Sep 2018 17:19:57 +0200
Fredrik Str=C3=B6mberg <stromberg@mullvad.net> wrote:

>> First of all, censorship circumvention is an important societal
>> problem to solve. It is also clearly outside of the scope of
>> WireGuard. Any suggested protocol change with that motive will
>> increase the complexity of the code base, which increases the risk
>> of vulnerabilities. This would hurt all WireGuard users.

Amen!=20

On Thu, 6 Sep 2018 10:45:24 -0400
George Walker <georgewalkeriv@gmail.com> wrote:

> The objective of cleaning as described seems to be to make the
> protocol indistinguishable from exchanging random payloads. But are
> there any common protocols of commercial importance that are so
> inscrutable? If I saw such random-looking UDP payloads on the wire I
> would suspect malware c&c, file sharing (who remembers FreeNet?), or
> a tunnel, depending on data volume and direction =E2=80=94nothing I would
> hesitate to block (or flag as suspicious) if I were running a big
> traffic classifier.

There is a few different purposes served by this transform:=20

a) By having a uniformly random stream, its much easier to plug in to
various mimicry tools (as you suggest) since you know the input data
doesn't contain any meaning. There's some good work from the Tor people
on this kind of thing. For example, 'cleaned' traffic could be made to
look like TLS, without doubly encrypting every packet with the TLS key,
instead the UDP data can be passed through directly.=20

b) From a surveillance perspective, it becomes harder to identify and
record traffic. The classification goes from being "WG-VPN" to "???".
This makes the analysts job a bit harder. Increasing labour costs is
probably more painful for such entities than anything else.=20

c) It forces a censor to move from a blacklisting approach  to a
whitelisting approach. As you say, this won't stymie the great firewall
of China but developing a rule to block traffic which looks "too
random" without too many false positives requires a lot of resources
and we can exploit this.=20

Best,
Dennis=20

--=20
PGP Fingerprint: 5B93 F0B9 D6A8 9BC1 546B C98C 6105 A775 8CD2 46AC

--Sig_/59fWW6saf=jmJgaTL5xdRXk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbkUkaAAoJEGEFp3WM0kasiSEP/31a6ygSK++EH+2vtVDK/AxX
6UJcHJgwXZEG1n+ZNpVJnvUvRyCDBokH+k7vq7keUkA28sJMUQJZ3d0Q+BpwRhuM
uoRoM7GbQyxD+S3HRfeGiJYQPutSdGWOZJDPkaN2PWP0ZB28TikVsnpU6/yzifgc
fezvQJeurFlG1Dx6EpA7K1NSqfw25sEXvEB0i6cqkS4VJc0VBT3f3+KQFtJeIL2E
SuhzhhdnmrGAmep4t8Gbq1eIVGKOtOAq24WLAisFDE04dff0xHGW/PQssMjXU+VG
0Rp59sSsyWAe2Xxzal+q3CtDRTFxYBocuZdORKmUG2C9dI4RAPo58YkW6crrxQxM
hzy/eXEUXgWIjOVk5uF1xPK5vWOCC8WJ7sZ88vs5hUE8lczvjx8QA6U2qn32j4Tq
AUu6pcC87khbC7qqSFjtz4P3ZPXcZNQ3J2C1s6xNQOBQiCUY/mv10DDrNnPCN1ui
CkvZ10rxu+LihFX3etgnafDjx098E9vm2dtMGDkSvo0vzXGalrIsw22S8C83n48a
9AMuKL1XD+3we9UmccZe88r5COwICzh0gIYqrglOHcgOeS3Pjxo+bJByXo9TOY/6
yhXVh7NwwQoAhq1vqHZ9rQxXaPh422FNJbsaTrOT+y3iHWbfwXt/5S3hfbkhrGcR
ge3AklRRE/O9jivympd9
=uonM
-----END PGP SIGNATURE-----

--Sig_/59fWW6saf=jmJgaTL5xdRXk--
