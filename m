Return-Path: <SRS0=2lTk=XC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0645CC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  7 Sep 2019 10:05:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A28C20854
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  7 Sep 2019 10:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A28C20854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=friedels.name
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81d534b3;
	Sat, 7 Sep 2019 10:04:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a828ed15
 for <wireguard@lists.zx2c4.com>; Sat, 7 Sep 2019 10:04:48 +0000 (UTC)
Received: from smtprelay08.ispgateway.de (smtprelay08.ispgateway.de
 [134.119.228.110])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf178de5
 for <wireguard@lists.zx2c4.com>; Sat, 7 Sep 2019 10:04:48 +0000 (UTC)
Received: from [84.61.93.104] (helo=[192.168.177.20])
 by smtprelay08.ispgateway.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 (envelope-from <hendrik@friedels.name>)
 id 1i6XaI-0006yf-Sb; Sat, 07 Sep 2019 12:04:46 +0200
From: "Hendrik Friedel" <hendrik@friedels.name>
To: =?utf-8?q?Ivan=20Lab=c3=a1th?= <labawi-wg@matrix-dream.net>
Subject: Re[2]: Keep-alive does not keep the connection alive
Date: Sat, 07 Sep 2019 10:04:44 +0000
Message-Id: <emc2cb759b-1a2b-4bd0-a4f8-77ed32053cff@ryzen>
In-Reply-To: <20190828065411.GA6914@matrix-dream.net>
References: <em08a1734c-6242-4687-b8d8-cf84e0b95ec3@ryzen>
 <CANH_QeYQ7hyBG1qK9PJB9E77gggW0NYe70vv8m6Dn=fU5zHQbg@mail.gmail.com>
 <em7afc7e4a-39a3-472d-ba45-79c6ad20b842@ryzen>
 <20190826180244.GB5022@matrix-dream.net>
 <CANcuY=oE9L_sm1b_JJV4_fv+ABLx9ZbTeXXzijkiLw-b=CxkMQ@mail.gmail.com>
 <em05f3a9de-8e41-4353-affa-3fb52e65cda8@ryzen>
 <20190828065411.GA6914@matrix-dream.net>
User-Agent: eM_Client/7.2.34062.0
Mime-Version: 1.0
X-Df-Sender: aGVuZHJpa0BmcmllZGVscy5uYW1l
Cc: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Hendrik Friedel <hendrik@friedels.name>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4292451733509165423=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4292451733509165423==
Content-Type: multipart/alternative;
 boundary="------=_MB39AD2061-877A-4181-AEDB-EEA144F0F9FF"

--------=_MB39AD2061-877A-4181-AEDB-EEA144F0F9FF
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

>>  that seems not to be the intended behaviour:
>>  If I understand correctly, the current behaviour is:
>>
>>  At tunnel start the IP is resolved
>>  This IP is used for ever, namingly for re-connects.
>This is only partly correct. The remote endpoint can unconditionally
>roam and is updated by any valid packet from a given IP (if I remember
>correctly).
What does that mean?
Does that mean, that traffic will update the IP so that the problem will=20
not appear?
>

>
>>  The probably intended behaviour would be:
>>  At tunnel start and at any re-connect the IP is resolved.
>>
>>  Do you agree that this behaviour should be changed?
>>  Apart from that: Can you suggest an automatable workaround?
>
>In some circumstances a similar behavior would be a desired.

That's ambigous.
In what circumstances, what behaviour would be desired?

>
>Wireguard design and implementation is layered (which seems good).
>The secure* tunnel, including the kernel module and wg tool seem
>to be in a reasonable state, but automation, DNS, key exchange are
>out of scope for them. It is meant to be provided by tooling, which is
>currently very raw.

I don't understand...
When I am on my way in a roadwarrier scenario with my mobile, with a=20
changing IP and a changing connection that works very well.
If the IP of my Server is changing, it's not working well at all. I=20
don't think that this should be declared as 'works as intended'.
>

>
>As a workaround you could
>   - unconditionally periodically update the endpoint
This would break existing transfers without reason.
>   - monitor last handshake time, when large update endpoint or restart
>     tunnel
That could be an option.
>   - add keepalive to server - it might reduce your downtime
How would that help?

Greetings,
Hendrik


>




>
--------=_MB39AD2061-877A-4181-AEDB-EEA144F0F9FF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><style>#x93406428d40e43d5be476ffb5412c83f #x70fb53580d9c415c9d6=
c4afe5251441b{
	font-family:'Segoe UI';
	font-size:12pt;
}
#x93406428d40e43d5be476ffb5412c83f{
	font-family:'Segoe UI';
	font-size:12pt;
}#x70fb53580d9c415c9d6c4afe5251441b
{font-family: 'Segoe UI'; font-size: 12pt;}
</style>

<style id=3D"css_styles" type=3D"text/css">blockquote.cite { margin-left: 5=
px; margin-right: 0px; padding-left: 10px; padding-right:0px; border-left:=
 1px solid #cccccc }
blockquote.cite2 {margin-left: 5px; margin-right: 0px; padding-left: 10px;=
 padding-right:0px; border-left: 1px solid #cccccc; margin-top: 3px; padding=
-top: 0px; }
a img { border: 0px; }
li[style=3D'text-align: center;'], li[style=3D'text-align: right;'] {  list=
-style-position: inside;}
body { font-family: Segoe UI; font-size: 12pt;   }</style></head><body clas=
s=3D"plain"><div>Hello,</div><div><br /></div><div id=3D"x1378faaa1981473">=
<blockquote type=3D"cite" class=3D"cite2"><blockquote type=3D"cite" class=
=3D"cite"><div class=3D"plain_line"> that seems not to be the intended beha=
viour:</div>
<div class=3D"plain_line"> If I understand correctly, the current behaviour =
is:</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line"> At tunnel start the IP is resolved</div>
<div class=3D"plain_line"> This IP is used for ever, namingly for re-connec=
ts.</div>
</blockquote>
<div class=3D"plain_line">This is only partly correct. The remote endpoint=
 can unconditionally</div>
<div class=3D"plain_line">roam and is updated by any valid packet from a gi=
ven IP (if I remember</div>
<div class=3D"plain_line">correctly).</div></blockquote><div id=3D"x1378faa=
a1981473">What does that mean?</div><div id=3D"x1378faaa1981473">Does that=
 mean, that traffic will update the IP so that the problem will not appear?<=
/div><blockquote type=3D"cite" class=3D"cite2"><div class=3D"plain_line"><b=
r /></div></blockquote><br /><blockquote type=3D"cite" class=3D"cite2"><div =
class=3D"plain_line"><br /></div>
<blockquote type=3D"cite" class=3D"cite2">
<div class=3D"plain_line"> The probably intended behaviour would be:</div>
<div class=3D"plain_line"> At tunnel start and at any re-connect the IP is=
 resolved.</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line"> Do you agree that this behaviour should be chang=
ed?</div>
<div class=3D"plain_line"> Apart from that: Can you suggest an automatable=
 workaround?</div>
</blockquote>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">In some circumstances a similar behavior would be =
a desired.</div></blockquote><div id=3D"x1378faaa1981473"><br /></div><div =
id=3D"x1378faaa1981473">That's ambigous.</div><div id=3D"x1378faaa1981473"=
>In what circumstances, what behaviour would be desired?</div><div id=3D"x1=
378faaa1981473"><br /></div><blockquote type=3D"cite" class=3D"cite2"><div=
 class=3D"plain_line"><br /></div>
<div class=3D"plain_line">Wireguard design and implementation is layered (w=
hich seems good).</div>
<div class=3D"plain_line">The secure* tunnel, including the kernel module a=
nd wg tool seem</div>
<div class=3D"plain_line">to be in a reasonable state, but automation, DNS, =
key exchange are</div>
<div class=3D"plain_line">out of scope for them. It is meant to be provided =
by tooling, which is</div>
<div class=3D"plain_line">currently very raw.</div></blockquote><div id=3D"=
x1378faaa1981473"><br /></div><div id=3D"x1378faaa1981473">I don't understa=
nd... </div><div id=3D"x1378faaa1981473">When I am on my way in a roadwarri=
er scenario with my mobile, with a changing IP and a changing connection th=
at works very well.</div><div id=3D"x1378faaa1981473">If the IP of my Serve=
r is changing, it's not working well at all. I don't think that this should =
be declared as 'works as intended'.</div><blockquote type=3D"cite" class=
=3D"cite2"><div class=3D"plain_line"><br /></div></blockquote><br /><blockq=
uote type=3D"cite" class=3D"cite2"><div class=3D"plain_line"><br /></div>
<div class=3D"plain_line">As a workaround you could</div>
<div class=3D"plain_line">  - unconditionally periodically update the endpo=
int</div></blockquote></div><div id=3D"x1378faaa1981473"><div id=3D"x934064=
28d40e43d5be476ffb5412c83f"><div class=3D"plain"><div id=3D"x1378faaa198147=
3"><div id=3D"x70fb53580d9c415c9d6c4afe5251441b"><div class=3D"plain"><div=
 id=3D"x1378faaa1981473">This would break existing transfers without reason.=
</div></div></div></div></div></div><blockquote type=3D"cite" class=3D"cite=
2"><div class=3D"plain_line">  - monitor last handshake time, when large up=
date endpoint or restart</div>
<div class=3D"plain_line">    tunnel</div></blockquote>That could be an opt=
ion.<br /><blockquote type=3D"cite" class=3D"cite2"><div class=3D"plain_lin=
e">  - add keepalive to server - it might reduce your downtime</div></block=
quote>How would that help?</div><div id=3D"x1378faaa1981473"><br /></div><d=
iv id=3D"x1378faaa1981473">Greetings,</div><div id=3D"x1378faaa1981473">Hen=
drik</div><div id=3D"x1378faaa1981473"><br /></div><div id=3D"x1378faaa1981=
473"><br /><blockquote type=3D"cite" class=3D"cite2"><div class=3D"plain_li=
ne"><br /></div></blockquote><div id=3D"x1378faaa1981473"><br /></div><div=
 id=3D"x1378faaa1981473"></div><div id=3D"x1378faaa1981473"><br /></div><div =
id=3D"x1378faaa1981473"><br /></div><br /><blockquote type=3D"cite" class=
=3D"cite2"><div class=3D"plain_line"><br /></div>
</blockquote></div>
</body></html>
--------=_MB39AD2061-877A-4181-AEDB-EEA144F0F9FF--


--===============4292451733509165423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4292451733509165423==--

