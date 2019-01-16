Return-Path: <SRS0=1SvS=PY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59CF4C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 16:34:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E803C20657
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Jan 2019 16:34:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="GwiALRcE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E803C20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ad92513;
	Wed, 16 Jan 2019 16:30:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c64135bc
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 16:30:17 +0000 (UTC)
Received: from sonic313-19.consmr.mail.gq1.yahoo.com
 (sonic313-19.consmr.mail.gq1.yahoo.com [98.137.65.82])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96158b80
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Jan 2019 16:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1547656466; bh=eiJgHFAQ6RYoj3Q7PLZvU7AvWNtyBsB5Ll02/LWAAgo=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=GwiALRcEiDh0bbqDmij9zScLinn/ss4CXPtP2ggbbaycn9bt9COrwKANZna1lszLr7IO5MraNCUjnMWmATASCvfdch1dZ9wxImYdg3jRoeN4UUnS3OPG6udMAPWdTKaCrAsKWAqMkvFEjxk3b5O1UWcYExFXjZKtKbHNXD4+E8MK/g+UgZFENMS+OQO8MqHLFl/Fm68SjgVkeA/KWVhE/olFt79NDjFE9277R+o6D5TkIVUvbzQNCplyKFARQcB15Sbcv6k3VhPxzNcR+tDOjJiuIil7w2ikz0faB5tWg9Wtbh9xbNcNcc2gwF+zOPEz8/j5HYO4F5BJpGh1pmXC8g==
X-YMail-OSG: DZPPRfIVM1lywe2ew7tLEa_syl8gaq8aklRq3hO0kDuIRSGpP0_aidqzO709M9m
 KZLuBdy1TGYgpXTaXofIKBe_bSYEB6E0jAfWtAayXs36HzT5y8G3C9Q7GcfB.H6GiVv8ryh8eiGj
 .koGZC6gtdtTuhYPx1ehdZH7N691ZPjBQHmIlzHpo4WEysAR29b.YJiTnqoVr483BgTZNUuHLhNQ
 mthg1_qzCshwqxa.zDMNAeaW.DvnkqIFhr_ElNMa87YC2_6Dv2vNtHZa8_wRmtDk9wI4WJrHfN2m
 _KUaV.uI68SG23dv2r976KFdvKXjnl6o9DeyKQ6.0R4PYozhN9am9hjTw2geeF8LooAA5eiWTpCC
 JFE3FfKwzROsrFOANSXozZnCZbHqJqN05vACP6JB4UsoEMrExPW3rUPT2K7YgwFsk4aqRHk2VwQF
 Sm0WfTHbIEXlTU.PiKjYzJJj3cV_hx.zqx2dCkZYobJglHdOVdAcK7.nreTogIb.KiGSdmd7U4CQ
 Wofm8qWoDpe9mMh86XVMbGfOOTaiaY6XQBmXuux.X4h3tbM357ChvQ2dTDfGmqyGoLo99aBZCdPY
 PzudGrJBSPBU0.VJd8BVpuEnSLExCjLahmrvHrBXJ_aL5EmxosL2dGKgucmMhFjE_PGgcjgfrvm_
 W9Yb4ghArd0ftd0dpwJI1UA7tVb_1wzGJiVpZ54Ph18RztdYlbll9KBiTQ4QgvdzI6x5CozYSI9M
 1pLiHryJbyV.Isy.bjoTgIPgeyout3IScPoo.LW8aQXPpTWexbwkr.4rl6P.ZqKrGUDy24_0lCM4
 E6sWFXVcIDZI2VDSBPHIk_VXl3rxJUGzX_c_s3UAY1FAvCUESRcFEbTA2jAL1xJwErSM2KfakBvw
 nkR7MvMbqnCjlCD4MoryWd74oN1Oc53UoC95jnVumg5EK7CjyOeb5HRCFAmEjnYIYa2yNNQcphIq
 2vBVMaZohXmWu2vK2x4KdtWQeG4lzUI3eGJYoaIW68pVP.fbOcW_ujVOTPhUIKUTC5ij6HzeHJji
 qxeGkznPuFlKvLoza5s6Cdk1M6EqMJkeWNrpiCGePUgVt5bDjC1rhPGaVXolWO6wPs2OaFKZB0rV
 _wAyUFf52V.E-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Wed, 16 Jan 2019 16:34:26 +0000
Date: Wed, 16 Jan 2019 16:34:20 +0000 (UTC)
From: Jose Marinez <jedi_papi@yahoo.com>
To: =?UTF-8?Q?Fredrik_Str=C3=B6mberg?= <stromberg@mullvad.net>, 
 Henning Reich <henningreich@gmail.com>
Message-ID: <470369034.543038.1547656460486@mail.yahoo.com>
In-Reply-To: <CANTUoedLSxrRoDBbiCOYn-xoXT-nAyw-ccfq6kJWThJ9QnmAXA@mail.gmail.com>
References: <CANTUoec=rCy0fcW1ukUfYQLsj73sJ3CAPFMu+sgHxZMxF=__NA@mail.gmail.com>
 <CAOAVeL0Hv343JWU1m06p-WaspsNFpB6Tnw6EdYr=LdMVQLM0AQ@mail.gmail.com>
 <CANTUoecyXtor1+craGG0dacSvnCewT55Fcwqwfho9f0SvH=iqg@mail.gmail.com>
 <CAOAVeL32OBbhyzrJ-z6nLYMUUJsOFOSVNpbo4wdQN3zV=6yndw@mail.gmail.com>
 <CANTUoedLSxrRoDBbiCOYn-xoXT-nAyw-ccfq6kJWThJ9QnmAXA@mail.gmail.com>
Subject: Re: WireGuard deployment considerations for improved privacy
MIME-Version: 1.0
X-Mailer: WebService/1.1.12857 YahooMailIosMobile Raven/44290 CFNetwork/976
 Darwin/18.2.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============7239629735128881831=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7239629735128881831==
Content-Type: multipart/alternative; 
	boundary="----=_Part_543037_1233685711.1547656460484"
Content-Length: 12556

------=_Part_543037_1233685711.1547656460484
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Fredrik,
I appreciate this proposition as well as your summary for the current state=
 of Wireguard for this particular case. I agree with you wholeheartedly tha=
t before the mass adoption of Wireguard happens these use cases should be a=
ddressed properly. I'd love to hear what Jason has to say about this and wh=
at he proposes.
I too have been thinking about all the edge cases for Wireguard. My approac=
h has been to look at it from a penetration test perspective. Reality is th=
at Wireguard doesn't live in isolation. As a system - hardware, OS and all =
it's settings + Wireguard - connected to the Internet and a user(s) present=
s many hostile dynamics.
Ultimately, whatever solution emerges needs to supplement the goals and fea=
tures of Wireguard, otherwise it deafts the purpose.=C2=A0
Would it make sense to create a small group to tackle this and other use ca=
ses - scaling, simplicity, etc? On my end, I'm not a cryptologist, but I ca=
n write software that would test the security of any system. I'm sure other=
 members of this list have a ton of skills and experience to bring to this.=
=C2=A0
Here's a list of things I'd like to see and would be willing to participate=
/create if they don't exist yet:
1. A honeypot server with public logs for a small team to gather and record=
 real-time traffic as an authorized user of the server - root.2. A test sui=
te that goes through all the domain specific scenarios from the results of =
#1 and provides a verification at the end once completed.3. Provide feedbac=
k from all this back to Jason for enhancements, etc. in upstream Wireguard.
Feel free to reach out off-list.

Thanks,Jose

On Tuesday, January 15, 2019, 9:27 AM, Fredrik Str=C3=B6mberg <stromberg@mu=
llvad.net> wrote:

On Tue, Jan 15, 2019 at 1:05 PM Henning Reich <henningreich@gmail.com> wrot=
e:
>
> Thank for your reply too,
>
> I "use" this list and conversation to get a bit more information about cr=
ypto at all (it looks like I need that :-)
>
I see. When I wanted to learn more about network security protocols I
read the RFC for TLS from start to finish a few times. Every time I
didn't understand a word or concept I looked it up on Wikipedia, often
reading the entire article on that concept. In your case maybe read
the WireGuard paper a few times and reference Wikipedia. That's a good
start.

> I try to explain how I understood the problem, and anybdoy can tell me, w=
here I have make a mistake :-)
> From https://www.wireguard.com/protocol/#key-exchange-and-data-packets
> the initiation message and the response use
> initiator.ephemeral_private =3D DH_GENERATE() and
> responder.ephemeral_private =3D DH_GENERATE()
>
Correct. Although to be exact DH-Generate returns a keypair (private, publi=
c).

> This means (I think), that for every new connection, a new DH-Key is gene=
rated. For me (not a programmer) it looks like all other private informatio=
ns in the messages a encrypted/hashed with values derived from this DH-Key.

Almost. It uses Diffie-Hellman with the ephemeral private key as one compon=
ent.

In the first message, msg.static is encrypted using a key derived from
DH of the Initiator's ephemeral private key, and the Responder's
static public key (which is already known to Initiator). The first
message also includes the field msg.ephemeral which contains the
Initiator's ephemeral public key, transmitted in the clear.

When the message is received by the Responder, she is able to decrypt
msg.static and learn the Initiator's static public key. You might ask
how that is possible when she doesn't have the Initiator's ephemeral
private key. The reason is that she can derive the correct encryption
key using the Initiator's ephemeral public key, previously transmitted
in the clear, and her (the Responder) static private key.

ECDH ( Initiator's ephemeral private key, Responder's static pubkey )
=3D
ECDH ( Initiator's ephemeral public key, Responder's static private key )

> Because both site knows the other static key, I would look in the "XX" Ro=
w, and there is your quoted destination proberty not exisintg.
>
WireGuard uses Noise_IK, not Noise_XX.

> It's probably possible that I ignore some cryptographic basics or misunde=
rstood same facts. So I hope somebody takes the time and give me some more =
hints. Thanks
>
No worries. We're all learning something. If you want to learn more
about cryptographic protocols just put in the time. And when you don't
understand something, or suspect that you are wrong, read the whole
thing again. That's what I did :)

Cheers,
Fredrik
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard




------=_Part_543037_1233685711.1547656460484
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:schemas-microso=
ft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:office"><head><!--[=
if gte mso 9]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>=
96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--></head><bo=
dy>
Hi Fredrik,<div><br></div><div>I appreciate this proposition as well as you=
r summary for the current state of Wireguard for this particular case. I ag=
ree with you wholeheartedly that before the mass adoption of Wireguard happ=
ens these use cases should be addressed properly. I'd love to hear what Jas=
on has to say about this and what he proposes.</div><div><br></div><div>I t=
oo have been thinking about all the edge cases for Wireguard. My approach h=
as been to look at it from a penetration test perspective. Reality is that =
Wireguard doesn't live in isolation. As a system - hardware, OS and all it'=
s settings + Wireguard - connected to the Internet and a user(s) presents m=
any hostile dynamics.</div><div><br></div><div>Ultimately, whatever solutio=
n emerges needs to supplement the goals and features of Wireguard, otherwis=
e it deafts the purpose.&nbsp;</div><div><br></div><div>Would it make sense=
 to create a small group to tackle this and other use cases - scaling, simp=
licity, etc? On my end, I'm not a cryptologist, but I can write software th=
at would test the security of any system. I'm sure other members of this li=
st have a ton of skills and experience to bring to this.&nbsp;</div><div><b=
r></div><div>Here's a list of things I'd like to see and would be willing t=
o participate/create if they don't exist yet:</div><div><br></div><div>1. A=
 honeypot server with public logs for a small team to gather and record rea=
l-time traffic as an authorized user of the server - root.</div><div>2. A t=
est suite that goes through all the domain specific scenarios from the resu=
lts of #1 and provides a verification at the end once completed.</div><div>=
3. Provide feedback from all this back to Jason for enhancements, etc. in u=
pstream Wireguard.</div><div><br></div><div>Feel free to reach out off-list=
.<br><br>Thanks,<div>Jose</div><br><p class=3D"yahoo-quoted-begin" style=3D=
"font-size: 15px; color: #715FFA; padding-top: 15px; margin-top: 0">On Tues=
day, January 15, 2019, 9:27 AM, Fredrik Str=C3=B6mberg &lt;stromberg@mullva=
d.net&gt; wrote:</p><blockquote class=3D"iosymail"><div dir=3D"ltr">On Tue,=
 Jan 15, 2019 at 1:05 PM Henning Reich &lt;<a ymailto=3D"mailto:henningreic=
h@gmail.com" href=3D"mailto:henningreich@gmail.com">henningreich@gmail.com<=
/a>&gt; wrote:<br></div><div dir=3D"ltr">&gt;<br></div><div dir=3D"ltr">&gt=
; Thank for your reply too,<br></div><div dir=3D"ltr">&gt;<br></div><div di=
r=3D"ltr">&gt; I "use" this list and conversation to get a bit more informa=
tion about crypto at all (it looks like I need that :-)<br></div><div dir=
=3D"ltr">&gt;<br></div><div dir=3D"ltr">I see. When I wanted to learn more =
about network security protocols I<br></div><div dir=3D"ltr">read the RFC f=
or TLS from start to finish a few times. Every time I<br></div><div dir=3D"=
ltr">didn't understand a word or concept I looked it up on Wikipedia, often=
<br></div><div dir=3D"ltr">reading the entire article on that concept. In y=
our case maybe read<br></div><div dir=3D"ltr">the WireGuard paper a few tim=
es and reference Wikipedia. That's a good<br></div><div dir=3D"ltr">start.<=
br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">&gt; I try to explain =
how I understood the problem, and anybdoy can tell me, where I have make a =
mistake :-)<br></div><div dir=3D"ltr">&gt; From <a href=3D"https://www.wire=
guard.com/protocol/#key-exchange-and-data-packets" target=3D"_blank">https:=
//www.wireguard.com/protocol/#key-exchange-and-data-packets</a><br></div><d=
iv dir=3D"ltr">&gt; the initiation message and the response use<br></div><d=
iv dir=3D"ltr">&gt; initiator.ephemeral_private =3D DH_GENERATE() and<br></=
div><div dir=3D"ltr">&gt; responder.ephemeral_private =3D DH_GENERATE()<br>=
</div><div dir=3D"ltr">&gt;<br></div><div dir=3D"ltr">Correct. Although to =
be exact DH-Generate returns a keypair (private, public).<br></div><div dir=
=3D"ltr"><br></div><div dir=3D"ltr">&gt; This means (I think), that for eve=
ry new connection, a new DH-Key is generated. For me (not a programmer) it =
looks like all other private informations in the messages a encrypted/hashe=
d with values derived from this DH-Key.<br></div><div dir=3D"ltr"><br></div=
><div dir=3D"ltr">Almost. It uses Diffie-Hellman with the ephemeral private=
 key as one component.<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
>In the first message, msg.static is encrypted using a key derived from<br>=
</div><div dir=3D"ltr">DH of the Initiator's ephemeral private key, and the=
 Responder's<br></div><div dir=3D"ltr">static public key (which is already =
known to Initiator). The first<br></div><div dir=3D"ltr">message also inclu=
des the field msg.ephemeral which contains the<br></div><div dir=3D"ltr">In=
itiator's ephemeral public key, transmitted in the clear.<br></div><div dir=
=3D"ltr"><br></div><div dir=3D"ltr">When the message is received by the Res=
ponder, she is able to decrypt<br></div><div dir=3D"ltr">msg.static and lea=
rn the Initiator's static public key. You might ask<br></div><div dir=3D"lt=
r">how that is possible when she doesn't have the Initiator's ephemeral<br>=
</div><div dir=3D"ltr">private key. The reason is that she can derive the c=
orrect encryption<br></div><div dir=3D"ltr">key using the Initiator's ephem=
eral public key, previously transmitted<br></div><div dir=3D"ltr">in the cl=
ear, and her (the Responder) static private key.<br></div><div dir=3D"ltr">=
<br></div><div dir=3D"ltr">ECDH ( Initiator's ephemeral private key, Respon=
der's static pubkey )<br></div><div dir=3D"ltr">=3D<br></div><div dir=3D"lt=
r">ECDH ( Initiator's ephemeral public key, Responder's static private key =
)<br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">&gt; Because both si=
te knows the other static key, I would look in the "XX" Row, and there is y=
our quoted destination proberty not exisintg.<br></div><div dir=3D"ltr">&gt=
;<br></div><div dir=3D"ltr">WireGuard uses Noise_IK, not Noise_XX.<br></div=
><div dir=3D"ltr"><br></div><div dir=3D"ltr">&gt; It's probably possible th=
at I ignore some cryptographic basics or misunderstood same facts. So I hop=
e somebody takes the time and give me some more hints. Thanks<br></div><div=
 dir=3D"ltr">&gt;<br></div><div dir=3D"ltr">No worries. We're all learning =
something. If you want to learn more<br></div><div dir=3D"ltr">about crypto=
graphic protocols just put in the time. And when you don't<br></div><div di=
r=3D"ltr">understand something, or suspect that you are wrong, read the who=
le<br></div><div dir=3D"ltr">thing again. That's what I did :)<br></div><di=
v dir=3D"ltr"><br></div><div dir=3D"ltr">Cheers,<br></div><div dir=3D"ltr">=
Fredrik<br></div><div dir=3D"ltr">_________________________________________=
______<br></div><div dir=3D"ltr">WireGuard mailing list<br></div><div dir=
=3D"ltr"><a ymailto=3D"mailto:WireGuard@lists.zx2c4.com" href=3D"mailto:Wir=
eGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><br></div><div dir=3D"=
ltr"><a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" target=
=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><br></div=
><blockquote></blockquote></blockquote></div>
</body></html>
------=_Part_543037_1233685711.1547656460484--

--===============7239629735128881831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7239629735128881831==--
