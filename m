Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57619C35670
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:35:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80175214DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:35:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80175214DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=barrys-emacs.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1df0527b;
	Sun, 23 Feb 2020 10:27:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18fcae43
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2020 19:18:40 +0000 (UTC)
Received: from claranet-outbound-smtp03.uk.clara.net
 (claranet-outbound-smtp03.uk.clara.net [195.8.89.36])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4fdcfafd
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Feb 2020 19:18:40 +0000 (UTC)
Received: from cpc96796-rdng27-2-0-cust183.15-3.cable.virginm.net
 ([86.19.118.184]:33553 helo=expanse.chelsea.private)
 by relay03.mail.eu.clara.net (relay.clara.net [81.171.239.33]:10587)
 with esmtpsa (authdaemon_plain:barry@barrys-emacs.org)
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) id 1j3PTR-0001rg-AX 
 (return-path <barry@barrys-emacs.org>); Sun, 16 Feb 2020 19:21:02 +0000
From: Barry Scott <barry@barrys-emacs.org>
Message-Id: <7304987A-6695-49A2-B9F1-AE4F13EBE2B9@barrys-emacs.org>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: wireguard slow pings
Date: Sun, 16 Feb 2020 19:21:00 +0000
In-Reply-To: <CAG3t+pEeJ_+AUUoA3NvpKPhtp_-G78DJTS3PGZyRHigMCSHyww@mail.gmail.com>
To: Neal Becker <ndbecker2@gmail.com>
References: <CAG3t+pEeJ_+AUUoA3NvpKPhtp_-G78DJTS3PGZyRHigMCSHyww@mail.gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-Mailman-Approved-At: Sun, 23 Feb 2020 11:27:41 +0100
Cc: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0456999679120307229=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============0456999679120307229==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_89A72E1B-F759-4B16-805F-936AD1D8B418"


--Apple-Mail=_89A72E1B-F759-4B16-805F-936AD1D8B418
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 16 Feb 2020, at 12:58, Neal Becker <ndbecker2@gmail.com> wrote:
>=20
> I'm testing wireguard
> wireguard-0.0.20191219-2.fc31.x86_64=20
> between a Fedora 31 client and server, comparing to openvpn.
>=20
> Openvpn is running between a linux client outside my lan and a server =
on my router, which is running dd-wrt.
> I'm pinging between that linux client and another linux client within =
my lan.
>=20
> wireguard is running between the same linux client outside my lan and =
the same other linux client within my lan.  This
> time router is simply forwarding packets via NAT.
>=20
> Openvpn ping times are much lower (about 10ms) and much lower variance =
than wireguard.  Wireguard pings
> are all over the place.
>=20
> Packets coming in from the WAN are traversing some firewall that I =
don't control, which may be affecting results.  Openvpn
> is config to use udp.
>=20
> Any ideas?

I can think of two ways to investigate this.

Use tcpdump on the router to see the timing of the packets on the wg0 =
device.
How quickly do you see the ICMP echo get answered?

Use traceroute from the outside to find the ping times of all the hops =
on the path.
Is there a significant difference between the ping time on the edge of =
the router
and the wg0 device ping time?

Barry

>=20
> Thanks,
> Neal
>=20
> --=20
> Those who don't understand recursion are doomed to repeat it
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--Apple-Mail=_89A72E1B-F759-4B16-805F-936AD1D8B418
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 16 Feb 2020, at 12:58, Neal Becker &lt;<a =
href=3D"mailto:ndbecker2@gmail.com" class=3D"">ndbecker2@gmail.com</a>&gt;=
 wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
dir=3D"ltr" class=3D"">I'm testing wireguard<div =
class=3D"">wireguard-0.0.20191219-2.fc31.x86_64&nbsp;</div><div =
class=3D"">between a Fedora 31 client and server, comparing to =
openvpn.</div><div class=3D""><br class=3D""></div><div class=3D"">Openvpn=
 is running between a linux client outside my lan and a server on my =
router, which is running dd-wrt.</div><div class=3D"">I'm pinging =
between that linux client and another linux client within my =
lan.</div><div class=3D""><br class=3D""></div><div class=3D"">wireguard =
is running between the same linux client outside my lan and the same =
other linux client within my lan.&nbsp; This</div><div class=3D"">time =
router is simply forwarding packets via NAT.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Openvpn ping times are much lower =
(about 10ms) and much lower variance than wireguard.&nbsp; Wireguard =
pings</div><div class=3D"">are all over the place.</div><div =
class=3D""><br class=3D""></div><div class=3D"">Packets coming in from =
the WAN are traversing some firewall that I don't control, which may be =
affecting results.&nbsp; Openvpn</div><div class=3D"">is config to use =
udp.</div><div class=3D""><br class=3D""></div><div class=3D"">Any =
ideas?</div></div></div></blockquote><div><br class=3D""></div><div>I =
can think of two ways to investigate this.</div><div><br =
class=3D""></div><div>Use tcpdump on the router to see the timing of the =
packets on the wg0 device.</div><div>How quickly do you see the ICMP =
echo get answered?</div><div><br class=3D""></div><div>Use traceroute =
from the outside to find the ping times of all the hops on the =
path.</div><div>Is there a significant difference between the ping time =
on the edge of the router</div><div>and the wg0 device ping =
time?</div><div><br class=3D""></div><div>Barry</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D""><br class=3D""></div><div =
class=3D"">Thanks,</div><div class=3D"">Neal<br clear=3D"all" =
class=3D""><div class=3D""><br class=3D""></div>-- <br class=3D""><div =
dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr" class=3D""><i =
class=3D"">Those who don't understand recursion are doomed to repeat =
it</i></div></div></div></div>
_______________________________________________<br class=3D"">WireGuard =
mailing list<br class=3D""><a href=3D"mailto:WireGuard@lists.zx2c4.com" =
class=3D"">WireGuard@lists.zx2c4.com</a><br =
class=3D"">https://lists.zx2c4.com/mailman/listinfo/wireguard<br =
class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_89A72E1B-F759-4B16-805F-936AD1D8B418--

--===============0456999679120307229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0456999679120307229==--
