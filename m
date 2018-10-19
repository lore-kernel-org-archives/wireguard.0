Return-Path: <SRS0=JcDs=NP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076E8ECDE46
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:09:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A119A20854
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  4 Nov 2018 17:09:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dlrobertson.com header.i=@dlrobertson.com header.b="K56JODnO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A119A20854
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=dlrobertson.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 742a6fe1;
	Sun, 4 Nov 2018 17:05:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id acfa9544
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Oct 2018 15:47:25 +0000 (UTC)
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bebb6ec
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Oct 2018 15:47:25 +0000 (UTC)
Date: Fri, 19 Oct 2018 15:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlrobertson.com;
 s=protonmail; t=1539964173;
 bh=4F9pcEoQAOwTwIdEkhM+iHUHUCjwK+aqAihyNvVbYH4=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=K56JODnOSjnWgfT36zANRj2zeyj15RaSzpVu1pvGLdlPNFksR9te9ibeI/rz2xLms
 R8UC4oAVUT8XpQNAxiSPtg5ZmOFeNip0NOoKvRxGpHlWspROXp33/jwwQIlohykEVE
 ul8vROpXFGonAmFHInFGwoEPfhoBwOQPatZHGCNQ=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Dan Robertson <dan@dlrobertson.com>
Subject: Re: [PATCH 1/1] wireguard-rs: Update use of ip_constructors
Message-ID: <w-83d7oQ6YtPLcG11zO3l2r5nngdCdltt4I50TSE3uDpfBmATXYbu-2E58CI3cnTWfpV5x-0Q0GFxyxDT5kSlF8j2bxUIclM_m0QDAK0kXg=@dlrobertson.com>
Feedback-ID: pldPa1MRbNXVCGxDWw7m3Nt0HNNJc4Dznn8N5TjWcPVAEhnPrkGDWZYOSTid9RTyxeIOU_tmskSUoVAwqP1XWQ==:Ext:ProtonMail
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 04 Nov 2018 18:05:01 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Dan Robertson <dan@dlrobertson.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4262649733876482426=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============4262649733876482426==
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="---------------------a5c30002a71854862791c8b2f24d8c92"; charset=UTF-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
-----------------------a5c30002a71854862791c8b2f24d8c92
Content-Type: multipart/mixed; boundary="---------------------5f54303de50a7ff5986067463215d192"

-----------------------5f54303de50a7ff5986067463215d192
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

 - Update use of ip_constructors: The unspecified() function in libstd
   has been replaced with the UNSPECIFIED constants.
 - Implement Into<Vec<u8>> for CookieReply so that copying the
   underlying vector is not needed in cases where copying said vector
   is unnecessary.

Signed-off-by: Dan Robertson <dan@dlrobertson.com>
---
 src/interface/peer_server.rs | 2 +-
 src/lib.rs                   | 1 -
 src/message.rs               | 6 ++++++
 src/udp/mod.rs               | 4 ++--
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/src/interface/peer_server.rs b/src/interface/peer_server.rs
index a7c82cd..31dd78c 100644
--- a/src/interface/peer_server.rs
+++ b/src/interface/peer_server.rs
@@ -368,7 +368,7 @@ impl PeerServer {
             IpAddr::V6(ip) =3D> self.cookie.generate_reply(index, mac1, &=
ip.octets())?,
         };
 =


-        self.send_to_peer((addr, reply.to_vec())) // TODO: impl into() to=
 avoid copies/allocs
+        self.send_to_peer((addr, reply.into()))
     }
 =


     fn send_handshake_init(&mut self, peer_ref: &SharedPeer) -> Result<u3=
2, Error> {
diff --git a/src/lib.rs b/src/lib.rs
index 99c8fa4..19c7646 100644
--- a/src/lib.rs
+++ b/src/lib.rs
@@ -5,7 +5,6 @@
 =


 #![allow(unknown_lints)]
 #![warn(clippy)]
-#![feature(ip_constructors)]
 #![feature(try_trait)]
 #![feature(try_from)]
 #![feature(test)]
diff --git a/src/message.rs b/src/message.rs
index 12b2eb7..5777368 100644
--- a/src/message.rs
+++ b/src/message.rs
@@ -138,6 +138,12 @@ impl CookieReply {
     }
 }
 =


+impl Into<Vec<u8>> for CookieReply {
+    fn into(self) -> Vec<u8> {
+        self.0
+    }
+}
+
 impl TryFrom<Vec<u8>> for CookieReply {
     type Error =3D Error;
 =


diff --git a/src/udp/mod.rs b/src/udp/mod.rs
index 2a512cd..a519ad4 100644
--- a/src/udp/mod.rs
+++ b/src/udp/mod.rs
@@ -117,8 +117,8 @@ impl UdpSocket {
         setsockopt(socket4.as_raw_fd(), sockopt::Ipv4PacketInfo, &true);
         setsockopt(socket6.as_raw_fd(), sockopt::Ipv6RecvPacketInfo, &tru=
e);
 =


-        socket4.bind(&SocketAddr::from((Ipv4Addr::unspecified(), port)).i=
nto())?;
-        socket6.bind(&SocketAddr::from((Ipv6Addr::unspecified(), port)).i=
nto())?;
+        socket4.bind(&SocketAddr::from((Ipv4Addr::UNSPECIFIED, port)).int=
o())?;
+        socket6.bind(&SocketAddr::from((Ipv6Addr::UNSPECIFIED, port)).int=
o())?;
 =


         let socket4 =3D mio::net::UdpSocket::from_socket(socket4.into_udp=
_socket())?;
         let socket6 =3D mio::net::UdpSocket::from_socket(socket6.into_udp=
_socket())?;
-- =


2.19.1

-----------------------5f54303de50a7ff5986067463215d192--

-----------------------a5c30002a71854862791c8b2f24d8c92
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail
Comment: https://protonmail.com

wsFcBAEBCAAQBQJbyf0GCRBFxKZSxH5CpQAAwM0QAKvbvb+/T72z69RevuO7
Uy321e1a26zRK6cS6FB2F1i0fLQsG1zrrwo610jM3cPcTxT5tnRNC2OofILy
iVxoet4wqAUPRZ1lo+g8EX583ffQSqY1iCZjXpNaZQPuYxh6GoVrITnDb6uZ
YdefCE1IDsBf7WPaCFwteNUFEFnFyMyvV3fhT+b/H5TUQKl47Qb+H3lJRfzx
/URmohxWuMxWDxymZzW0RsKSyasWMjh2OuzF8QjCU54MDHoxhkWht636iibq
kr4gplEiBbIg3Ycsc+dc+4ElzcIngeCo92w/urYYvpVt+pYfFzsHsX5wWkf3
Oz4HPjZKWkR77sppoOmw9hocpD0FJOHRKt1yCqbonYgiOk6tiSNLz5HNEaoE
E1+LMpWL05H9Cp4j/8khbTPRmSCQAPIVgA+tkuHP/ZhZwCWMQTYaSXW3Xy4m
IDS6whb1sOiHlnm0RiEyVjrwfYnsiHvI2SY9rFlRdkChhl77zKcdUQ0GEe5u
BRT3HKHrzdKFBKOqR2SGY+8cTTdrzN4IoqiGM3ZGBOF6Hy5h39n8WTU3BRPy
eNXgKW1M+OMTN9/fAF/Vw5ujE9vWhaSF70wWcWV83HJjUzt8YbTL4GPTQxvP
hZSiAc3wTzxow0FeIRmCKxjmqUsI+B8+XjnCwAgWrXJEOxNAXXQMgtQ9yhW4
rX92
=+HyQ
-----END PGP SIGNATURE-----


-----------------------a5c30002a71854862791c8b2f24d8c92--


--===============4262649733876482426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4262649733876482426==--

