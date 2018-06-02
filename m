Return-Path: jedi_papi@yahoo.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc600b81
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jun 2018 21:27:14 +0000 (UTC)
Received: from sonic302-49.consmr.mail.gq1.yahoo.com
 (sonic302-49.consmr.mail.gq1.yahoo.com [98.137.68.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41992296
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jun 2018 21:27:14 +0000 (UTC)
Date: Sat, 2 Jun 2018 21:25:09 +0000 (UTC)
From: Jose Marinez <jedi_papi@yahoo.com>
To: WireGuard Mailing List <wireguard@lists.zx2c4.com>
Message-ID: <1075455406.8212220.1527974709121@mail.yahoo.com>
Subject: Android error, fix and next steps
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_Part_8212219_1144090130.1527974709119"
References: <1075455406.8212220.1527974709121.ref@mail.yahoo.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

------=_Part_8212219_1144090130.1527974709119
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello guys,
I encountered this error while testing on a LG V30 running Oreo.
"Error binging up tunnel: VPN service not authorized by user"
It turned out that due to an existing StrongSwan installation, the Wireguard client could not work. The fix involved deleting the StrongSwan client from the phone.
Next steps:
I can't imagine the Wireguard client to expect exclusivity as the sole VPN client to run on any device. In the case of StrongSwan, it had an "Always On" setting which I believe prevented Wireguard from making network changes.
What's the best way to approach this? I don't want to assume this is a Wireguard Android client bug. Perhaps on Android only one client can have the "always on" setting at once.
Any clarity on this would help, to at a minimum figure out which party to approach: Google vs. StrongSwan vs. Wireguard

Thanks,Jose
------=_Part_8212219_1144090130.1527974709119
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:schemas-microso=
ft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:office"><head><!--[=
if gte mso 9]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>=
96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--></head><bo=
dy>
<div>Hello guys,</div><div><br></div><div>I encountered this error while te=
sting on a LG V30 running Oreo.</div><div><br></div>"Error binging up tunne=
l: VPN service not authorized by user"<div><br></div><div>It turned out tha=
t due to an existing StrongSwan installation, the Wireguard client could no=
t work. The fix involved deleting the StrongSwan client from the phone.</di=
v><div><br></div><div>Next steps:</div><div><br></div><div><span style=3D"-=
webkit-text-size-adjust: auto;">I can't imagine the Wireguard client to exp=
ect exclusivity as the sole VPN client to run on any device. In the case of=
 StrongSwan, it had an "Always On" setting which I believe prevented Wiregu=
ard from making network changes.</span></div><div><span style=3D"-webkit-te=
xt-size-adjust: auto;"><br></span></div><div><span style=3D"-webkit-text-si=
ze-adjust: auto;">What's the best way to approach this? I don't want to ass=
ume this is a Wireguard Android client bug. Perhaps on Android only one cli=
ent can have the "always on" setting at once.</span></div><div><span style=
=3D"-webkit-text-size-adjust: auto;"><br></span></div><div><span style=3D"-=
webkit-text-size-adjust: auto;">Any clarity on this would help, to at a min=
imum figure out which party to approach: Google vs. StrongSwan vs. Wireguar=
d</span></div><div><br></div><div><br>Thanks,<div>Jose</div></div>
</body></html>
------=_Part_8212219_1144090130.1527974709119--
