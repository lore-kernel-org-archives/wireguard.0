Return-Path: <SRS0=F87Q=YJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AAC5FA3728
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:15:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0183620659
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:15:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=me.com header.i=@me.com header.b="mjgKa9qu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0183620659
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=me.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82a33c4e;
	Wed, 16 Oct 2019 20:15:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c27d1b6
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Oct 2019 07:04:32 +0000 (UTC)
Received: from st43p00im-zteg10063401.me.com (st43p00im-zteg10063401.me.com
 [17.58.63.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c9014e4
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 Oct 2019 07:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1571123071; bh=2GGMYbBWW1zKXdwwplar3ddB0WeSgxPpnFr78iga+ko=;
 h=From:Content-Type:Subject:Message-Id:Date:To;
 b=mjgKa9qu/jRVUDtmR42fOcdNBicgBuTkny1Cuzy8Xe3f/Onuu5Vq5QGU7F7uvHhfn
 ZWjyCCCGBxVK5zOmqNF0U+py0A274my0FK8S+zv3a2z/4Ff01CXiqfeh522yo42+Rz
 1a5zVy0qVDVvp1qPj7tQtn7NPBV2jrvq5wTC1UOhLIdLhI6it/wl1VKeRGsbkSapj4
 yl45ifOHDZIaIgkGFw8MJfsfxVCpQHqdoxFnfVIZnz4HzvAk2IynVKp/RCS+RLY42U
 ZHaQ7OItRFtIno8PoRX1IPLNxgW4s6+SD3/9aBjFHbNuW0QKksqCGpXrgqLe83gDFi
 CNy1Gm5gbWBcg==
Received: from [192.168.2.3] (unknown [217.160.43.240])
 by st43p00im-zteg10063401.me.com (Postfix) with ESMTPSA id BC66E4A0D47
 for <wireguard@lists.zx2c4.com>; Tue, 15 Oct 2019 07:04:30 +0000 (UTC)
From: Mario Melzer <zargoras@me.com>
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Connection loss on Apple devices when switching between Access points
 with same network name
Message-Id: <C03B6403-AEC1-4BAE-82AD-82DD4774F0A6@me.com>
Date: Tue, 15 Oct 2019 09:04:28 +0200
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3594.4.19)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-15_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=940 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1910150064
X-Mailman-Approved-At: Wed, 16 Oct 2019 22:15:27 +0200
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
Content-Type: multipart/mixed; boundary="===============8479861208925183881=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============8479861208925183881==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_A810AC11-6586-40AE-981C-FDAF2A697128"


--Apple-Mail=_A810AC11-6586-40AE-981C-FDAF2A697128
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I still ran into trouble when switching between Access points with the =
same network name.

Occurs on macOS and iOS independent of the software Version (still on =
the latest releases 13.1.2 and 10.15 and the recently published updates =
for Wireguard 0.0.20191012-14 and 0.0.20191012 on Lentos 7 & 8)


When I connect to device 1 I have an internet connection, now if my =
device seamlessly connects to to device 2 (so meanwhile didn=E2=80=99t =
connect to mobile Network) I loose my internet connection and I get the =
following message in the logs:

Handshake did not complete after 5 seconds, retrying

Switching back to device 1 brings back the internet connection.

To get an internet connection on device 2 is only possible by disabling =
and reenabling the VPN connection, or being connected to mobile network =
between both connections.

It even occurs if all access points are the same hardware like in a mesh =
network of Speed Home WiFi from Deutsche Telekom.

 There already should have been a fix with =
https://git.zx2c4.com/wireguard-apple/commit/?id=3D996af4b97de85c17b7157dd=
5610830536c4e3e29 =
<https://git.zx2c4.com/wireguard-apple/commit/?id=3D996af4b97de85c17b7157d=
d5610830536c4e3e29>

But it didn=E2=80=99t solve my problem, and I didn=E2=80=99t hear back =
after this.

There is no difference in the logs to those I already send to =
team@wireguard.com <mailto:team@wireguard.com>

If there is anything specific I could provide, please let me know.=

--Apple-Mail=_A810AC11-6586-40AE-981C-FDAF2A697128
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space;" class=3D"">I still ran into =
trouble when switching between Access points with the same network =
name.<div class=3D""><br class=3D""></div><div class=3D"">Occurs on =
macOS and iOS independent of the software Version (still on the latest =
releases 13.1.2 and 10.15 and the recently published updates for =
Wireguard 0.0.20191012-14 and 0.0.20191012 on Lentos 7 &amp; 8)<div =
class=3D""><br class=3D""></div><div class=3D""><br class=3D""></div><div =
class=3D"">When I connect to device 1 I have an internet connection, now =
if my device seamlessly connects to to device 2 (so meanwhile didn=E2=80=99=
t connect to mobile Network) I loose my internet connection and I get =
the following message in the logs:</div><div class=3D""><br =
class=3D""></div><div class=3D"">Handshake did not complete after 5 =
seconds, retrying</div><div class=3D""><br class=3D""></div><div =
class=3D"">Switching back to device 1 brings back the internet =
connection.</div><div class=3D""><br class=3D""></div><div class=3D"">To =
get an internet connection on device 2 is only possible by disabling and =
reenabling the VPN connection, or being connected to mobile network =
between both connections.</div><div class=3D""><br class=3D""></div><div =
class=3D"">It even occurs if all access points are the same hardware =
like in a mesh network of&nbsp;<b class=3D"">Speed Home WiFi from =
Deutsche Telekom.</b></div><div class=3D""><b class=3D""><br =
class=3D""></b></div><div class=3D""><b class=3D"">&nbsp;There already =
should have been a fix with&nbsp;<a =
href=3D"https://git.zx2c4.com/wireguard-apple/commit/?id=3D996af4b97de85c1=
7b7157dd5610830536c4e3e29" =
class=3D"">https://git.zx2c4.com/wireguard-apple/commit/?id=3D996af4b97de8=
5c17b7157dd5610830536c4e3e29</a></b></div><div class=3D""><b =
class=3D""><br class=3D""></b></div><div class=3D""><b class=3D"">But =
it&nbsp;didn=E2=80=99t solve my problem, and&nbsp;I&nbsp;didn=E2=80=99t =
hear back after this.</b></div><div class=3D""><b class=3D""><br =
class=3D""></b></div><div class=3D""><b class=3D"">There is no =
difference in the logs to those&nbsp;I already send to <a =
href=3D"mailto:team@wireguard.com" =
class=3D"">team@wireguard.com</a></b></div><div class=3D""><b =
class=3D""><br class=3D""></b></div><div class=3D""><b class=3D"">If =
there is anything specific&nbsp;I could provide, please let me =
know.</b></div></div></body></html>=

--Apple-Mail=_A810AC11-6586-40AE-981C-FDAF2A697128--

--===============8479861208925183881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8479861208925183881==--
