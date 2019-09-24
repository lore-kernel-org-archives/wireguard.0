Return-Path: <SRS0=As8F=XU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28CBDC432C2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 08:50:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D2112082F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 08:50:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="jia/9F1E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D2112082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0deac7df;
	Wed, 25 Sep 2019 08:50:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c3afc162
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Sep 2019 19:25:41 +0000 (UTC)
Received: from sonic315-55.consmr.mail.gq1.yahoo.com
 (sonic315-55.consmr.mail.gq1.yahoo.com [98.137.65.31])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92fc6f24
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Sep 2019 19:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1569353140; bh=ZxN7UuBhXVqlA54omuaCiFQgqAVXqpVth49sQevwlNo=;
 h=Date:From:Reply-To:To:In-Reply-To:References:Subject:From:Subject;
 b=jia/9F1EqO1ZFIytXZUg3GlBqopFzSyIfL2wmvK+zWHGbs88IUVrAgh6GKP1CwqQUdk1dffo4nZhLhyv1KQqJi90N1HKeg5ucESFVMEMtJqAxFdzNw6H4M7i5h/AkXuZOpBVmvn9Q6902TfWnP4gdRaHZ1yUKCbrfCACZim75BpjH6JBlHrDaoJuqZQT0Rqo95FzwOJQGndRUOc/+NISOSQx6GTwndynX48LouDHJvjz60WnlsDyuMPqILuO058CJuU803ZiApRh1NTVu1jiaC0X6Qh4Yx9halCeg9oZUJMyvqQjqNsZcVkBn8SebyNBtRgd60mpcwbTPg5LQVY3rQ==
X-YMail-OSG: BqfilHQVM1lEzgiMExH6WCCBYqnfqq29jTXtzCZE3KUrH8qKnf0LrmgRDYh930N
 oRpNpzGUJV2vEuZkG_swLikjKKp1Y3evF6rZbUfNTXujqZDpGT9Z6vRcF3.YJLIWrCTw.Neg35Mx
 uDaZWdVG.s2XXVtRxoTrwHmcbzbR.HSwwOd24.8GmUzQp00Pb8j1E8U8WzZqLgzUM_c6pj2S8OYd
 dYabnk3pa0MplqI4XZOIdxbwxuaLjVCM2PYFOaBIRlzgIYKj8srd43RavslOmyxuVkLkVDbGasT4
 sbKKumFo13o7sZs3IQlKaWFxKCbfX1sw6OmcfUPMffeox4dc8D661dhJE1KnKAZXEMU4r1F7mecu
 _4PyPpzMEpP8SX02.O_K5wWybGHG5JKrBOhhAM39WHhupIpdNjQpSKH4FapAOREp7B4TFTpk8D28
 hfkBWwYReaEG2WHJzZzCecxuJfszUYDfTdWjezW1mszLheAlkk8UQ9M.uu0lBHOU8fejd.T0LjSx
 wfc3Az4qf7EzMZ.nAQpsSip53.41hM7ITWSoHlh9IsHQgt.ZhJZTo49LY.SHGod0XDZcYzQzJeS0
 8REzq.9eLWUVebd2QCDIs3K6n_BmUgu8TLwyeAHjk1Ngkp0R9VjM82okroxzBm6hTyMvazZvHuYS
 CqzwFfszuTNvqUJgy9f.F_EbJIBVRBgtI.xmvPyB5PrjVa8weZm5CWmazjEVySRel30be3BN01Nk
 Z_WVXIVzxppo2QOHONeCL7IfUiMRLgaCqI74EMo1u1JvV80PrWgFl0opmk1QlJHt333Myh3vt3l_
 DyGJnpp.Vb6PaXZ0vcCm.b5ABme878EKbcIUjmmmTHBlFpV9I4cUeAsmp41YyuLQkDhKnSHcD28B
 wV6oVnoq26gaS8p.mV.7jhCqMBsDNSfe0.tMWRaJewU8XFwSwf84Bk7ApDj77iLv6GJtuHCWp1d1
 lzhMrNYh6PpFjqgfGU2Ww7HnDsJJUG8Ji4yMhnyEFezGN1P1Zb9OkI739w8kfsNZy2HX0NFHJsvg
 gVTIzqYCXlLnL0gNyzDPYwgl4HK_yapb2XTdg94CykSIKcHFttoiRMua7FCIls8Sm0ESZpoJxy1Z
 AUf9_uxEQDMaG74b5d3NexdIQz4zqV07moqwUYBYXWr8GViydquC_aSrAdflE9b0ujaXqpYzWZL2
 L4nK83EkSQlanBi.nymHsP.0f0HQcS.CkfspcOIyxwfp9PS2zn6bc9pTEvLIgO9qMi1s5UOJCkmr
 gLr4UUfFU6CXGdJyTn2GvWMqD53sgufKjeBg6kNX8xEJAyis.KpMSSVFVu9GBqA.DEMiMS6y5cl_
 wTuYfv5js0y3IyEKg.ADyaJ6FBsbs31VrAmw4AHQbPwyGVknEvid_Po39wi36E6Gw4w--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Tue, 24 Sep 2019 19:25:40 +0000
Received: by smtp426.mail.gq1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 9dca897bdb093915d2766b47ac6ec812; 
 Tue, 24 Sep 2019 19:25:39 +0000 (UTC)
X-YMail-OSG: kAHxAdwVM1lRTQT2I6Wi9anGX9r5xV71CyDTzU4ceuEY4z2Xac2HJEQhoMm4vZM
 BnvPp5TEUqeuFiDlEsEtz0cUxV.qyZfrnOYCS5aFrqx2jwYo_4wt.ZHtY4UT0yquVNAbA3HMN.4K
 wbGeBiRhl46L3FX_E0LutziEYxJ8AJAdyk8tox9QKidhBSkkrrcBnYwk30FR6_t_9BIn70s5YRUC
 GFdcCH1hTD1n2ez5djtSb.LRW9FdX7jPCyDAR1V4M5Xn5kdWJ2wJS.P2RTEcaYphDegYmNcOB9vW
 PaK6oBSa9DzcOMxfZ4tS3GShHbM6w5ec6Btof_q728oybYtQksipzHplwwwVC2YEw0vTZCdv9gOc
 kALnSqa1q4Cx312caGJyRycEsd6LtJjdQ7YjxNPPc0lUHLUfZWFDkLmrjFGUeY9yuNzEBJNpCSgx
 3eBnXX.zdkSFnThZzV93lW0rU..O2YSmdLVxemh.gFmSAaEVp4ZW4g_J.Dh5qOPL8aE4MzWFaVhe
 V6TA6R63Wzp_aT4Q_aHjmo1CaOMGDH9wHz7PiKPcOMK8NmJ7zNe35c2gi9VLEh23Ft6gbv6g5uOq
 QT.2bVsLLZ40VNcudEO45raT_1P3AEclfX_zJ8SPksxX9aFGl6GFzg4KWwRbvhMCeOwOQI40qbVq
 9d1SXa1T5L9RECzBVy4GB7wW1U3CgZfz0zFT7g3pxWW38e5RooQ1gq2TIK_sy.VWQqfb4NJi.lnF
 EAOAdhZECmIjm1pPJi5NZ6MQBlOwF2tsFf4kOxkwi7qUyRiXs2LCwnD7Di2Ley5VWeg9wditjKyv
 axUJm.Sn3uyBH9KqhGfvDcgRgl9S7Qxa.YoJXw_uVxafQaAMIalqvuUG4QKaKWuzDupeB4XkeH2Y
 emBzTL5UbmX2zj6SJFIc88wBqOx6v2Sf56JuhqWeIAB3fjzMWwN7x1i0qi75fSfSVZXIOD9B0_f_
 HhYoKqmcr5FHNEitOlvm1mxEF.H1hDyLnLlEd_GfvHQs6HAOX9oCBnQsWR1D6X11vGo0edzzhQD6
 _3b8ASlnwCSq_YjmGjhnCPH7Nu0BzdYcZu0LvRXQDPs8_9WnzJW7sk4I2uXkFag5ctfvQqhQ..LA
 id9J8ucmf7W.tCWcZClR0cJFezljrzYMVnNVzOVCeKYc0ht.Wu.oX.4Mspkwr9J33s25sLfkQYuf
 TAQ2U..3m7LkGBYnptomWUgxGX.Gc4GVMEzt0a8EvWfwFwIHtLn.AhbNKdbWRsnbEPUVE2FnGGZ7
 MP94OChfLXcy4wLXzbrNCsPJ4xDP203eRIaIwmy9vwQG2oCHcmeQjZKDDKMwzMEH_9yK2jLjdEK0
 -
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.bf2.yahoo.com with HTTP; Tue, 24 Sep 2019 19:25:37 +0000
Date: Tue, 24 Sep 2019 19:23:39 +0000 (UTC)
From: George Lucan <boss_geo2005@yahoo.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Eddie <stunnel@attglobal.net>
Message-ID: <570048099.8227174.1569353019690@mail.yahoo.com>
In-Reply-To: <26c139a5-d8a4-528f-d777-937966557699@attglobal.net>
References: <1429556426.5086611.1568572361543.ref@mail.yahoo.com>
 <1429556426.5086611.1568572361543@mail.yahoo.com>
 <432951712.5476709.1568659634512@mail.yahoo.com>
 <26c139a5-d8a4-528f-d777-937966557699@attglobal.net>
Subject: Re: Centos 7.6 wg-quick not working properly
MIME-Version: 1.0
X-Mailer: WebService/1.1.14303 YMailNorrin Mozilla/5.0 (Macintosh;
 Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko)
 Version/13.0 Safari/605.1.15
X-Mailman-Approved-At: Wed, 25 Sep 2019 10:50:01 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: George Lucan <boss_geo2005@yahoo.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2647023889454672631=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2647023889454672631==
Content-Type: multipart/alternative; 
	boundary="----=_Part_8227173_445625323.1569353019687"
Content-Length: 18638

------=_Part_8227173_445625323.1569353019687
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 Hi Eddie,
Thanks for the response, I figured is was something with either the kernel =
or iproute and I guess either the kernel does not support it or the iproute=
2 version does not "completely support it" or has a bug.
On your note about updating the kernel, the funny thing is initially I trie=
d this on Oracle Linux (that comes with=C2=A04.14.35-1902.3.1.el7uek.x86_64=
) by default and when I was ending up in kernel panics, so I though it migh=
t be because the kernel is too new or something.
For the moment I resolved my problem installing a Ubuntu that works without=
 any issue.
I still have the Oracle Linux machine (4.14.35-1902.3.1.el7uek.x86_64) so i=
f anyone want to me to do any debug and provide the response, I am happy to=
 do it.
Although it might or not be relevant all are Virtual Machine in Hyper-v, bo=
th the ubuntu one(working) and the Centos(failing one) and the Oracle Linux=
(kernel panics one)
Thanks
George
    On Tuesday, 24 September 2019, 06:29:07 pm GMT+3, Eddie <stunnel@attglo=
bal.net> wrote: =20
=20
  I'll just repeat verbatim the response I got from Silvan (thank you) when=
 I reported the same issue previously:
=20
 The main problem is that the current standard kernel of CentOS simple does=
 not support the handling of "suppress_prefixlength".=20
 Iproute2 supports it since it does not return any error while adding so it=
 had to be the kernel causing problems.=20
 In essence Red Hats official answer was "It isn't a bug, RHEL7 simple does=
 not support it".=20
 If you sill want to fix your problem just upgrade your kernel to long-term=
 or mainline.=20
=20
 Cheers.
=20
 On 9/16/2019 11:47 AM, George Lucan wrote:
 =20
=20
 Hello,=20
  Some further investigations have revealed that actually the "second main"=
 table gets created by the last command executed by wg-quick "ip -4 rule ad=
d table main suppress_prefixlength 0". Will try to figure out what is happe=
ning further.=20
  George=20
      On Sunday, 15 September 2019, 9:32:41 pm GMT+3, George Lucan <boss_ge=
o2005@yahoo.com> wrote: =20
 =20
      Hello,=20
  I have been trying for several days to setup a wireguard vpn and send all=
 the traffic from a VM to another site (redirect  gateway scenario).=20
  Site A OS is Centos 7.6 installed with docker and wireguard installed=20
  Site B OS is a Opensense 19.7.4 with wireguard installed from the plugin =
and a bunch of other things on it=20
  I believe the issue is within Ip route on Centos 7.6 but I am reaching ou=
t for maybe different opinions. On the Centos VM I am using wireguard insta=
lled from the repos on the website and using systemd to bring up the tunnel=
. Everything seem to be brought up correctly except that the traffic does n=
ot go through the tunnel.=20
  Further investigating I noticed something unusual (in my opinion).=20
  Before the tunnel is up:   #ip rule show
0:      from all lookup local=20
32766:  from all lookup main=20
32767:  from all lookup default    After the tunnel is up:   #ip rule show
0:      from all lookup local=20
32764:  from all lookup main=20
32765:  not from all fwmark 0xca6c lookup 51820=20
32766:  from all lookup main=20
32767:  from all lookup default  To me is seems like somehow there are 2 ta=
bles named "main" one after the new table created by wg-quick (looking at t=
he priority it seems it is the same one that was present previously) and an=
other one that gets create out of thin air before the wireguard created one=
 named 51820. Ping works through the tunnel for IP to the other end of the =
tunnel #wg
interface: wg0
  public key: 8JXLXfl1W2xZd1T+zaCKSNB+FhUbb1IquIHvHhY7/iY=3D
  private key: (hidden)
  listening port: 34559
  fwmark: 0xca6c

peer: 04kTPSrh08X5uOCmL5aM1iCm8UqFHGtJDsrsPReafS8=3D
  endpoint: 188.27.172.68:1300
  allowed ips: 0.0.0.0/0
  latest handshake: 1 minute, 41 seconds ago
  transfer: 87.85 KiB received, 415.61 KiB sent
  persistent keepalive: every 15 seconds# ping 192.168.249.1
PING 192.168.249.1 (192.168.249.1) 56(84) bytes of data.
64 bytes from 192.168.249.1: icmp_seq=3D1 ttl=3D64 time=3D89.2 ms
64 bytes from 192.168.249.1: icmp_seq=3D2 ttl=3D64 time=3D89.5 ms    Is the=
re any step that I might have missed or any kernel feature that would expla=
in the behaviour? Worth mentioning it is a home env so I can test whatever =
is needed to get to the bottom of it.  Thanks  George       =20
  _______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard=20
  =20
------=_Part_8227173_445625323.1569353019687
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp106fda73yahoo-style-wrap" style=
=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 1=
3px;"><div></div>
        <div dir=3D"ltr" data-setdir=3D"false">Hi Eddie,</div><div dir=3D"l=
tr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">=
Thanks for the response, I figured is was something with either the kernel =
or iproute and I guess either the kernel does not support it or the iproute=
2 version does not "completely support it" or has a bug.</div><div dir=3D"l=
tr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">=
On your note about updating the kernel, the funny thing is initially I trie=
d this on Oracle Linux (that comes with&nbsp;<span style=3D"orphans: 2; whi=
te-space: pre-wrap; widows: 2;">4.14.35-1902.3.1.el7uek.x86_64</span>) by d=
efault and when I was ending up in kernel panics, so I though it might be b=
ecause the kernel is too new or something.</div><div dir=3D"ltr" data-setdi=
r=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">For the moment=
 I resolved my problem installing a Ubuntu that works without any issue.</d=
iv><div dir=3D"ltr" data-setdir=3D"false"><br></div><div dir=3D"ltr" data-s=
etdir=3D"false">I still have the Oracle Linux machine (<span style=3D"orpha=
ns: 2; white-space: pre-wrap; widows: 2;">4.14.35-1902.3.1.el7uek.x86_64</s=
pan>) so if anyone want to me to do any debug and provide the response, I a=
m happy to do it.</div><div><br></div><div dir=3D"ltr" data-setdir=3D"false=
">Although it might or not be relevant all are Virtual Machine in Hyper-v, =
both the ubuntu one(working) and the Centos(failing one) and the Oracle Lin=
ux(kernel panics one)</div><div dir=3D"ltr" data-setdir=3D"false"><br></div=
><div dir=3D"ltr" data-setdir=3D"false">Thanks</div><div dir=3D"ltr" data-s=
etdir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false">George</di=
v><div><br></div>
       =20
        </div><div id=3D"ydp4c9f00cyahoo_quoted_0017166492" class=3D"ydp4c9=
f00cyahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Tuesday, 24 September 2019, 06:29:07 pm GMT+3, Eddie=
 &lt;stunnel@attglobal.net&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div id=3D"ydp4c9f00cyiv8422985666"><div>
    I'll just repeat verbatim the response I got from Silvan (thank you)
    when I reported the same issue previously:<br clear=3D"none">
    <br clear=3D"none">
    The main problem is that the current standard kernel of CentOS
    simple does not support the handling of "suppress_prefixlength".
    <br clear=3D"none">
    Iproute2 supports it since it does not return any error while adding
    so it had to be the kernel causing problems.
    <br clear=3D"none">
    In essence Red Hats official answer was "It isn't a bug, RHEL7
    simple does not support it".
    <br clear=3D"none">
    If you sill want to fix your problem just upgrade your kernel to
    long-term or mainline.
    <br clear=3D"none">
    <br clear=3D"none">
    Cheers.<br clear=3D"none">
    <br clear=3D"none">
    <div class=3D"ydp4c9f00cyiv8422985666yqt0485898892" id=3D"ydp4c9f00cyiv=
8422985666yqtfd86823"><div class=3D"ydp4c9f00cyiv8422985666moz-cite-prefix"=
>On 9/16/2019 11:47 AM, George Lucan
      wrote:<br clear=3D"none">
    </div>
    <blockquote type=3D"cite">
      </blockquote></div></div><div class=3D"ydp4c9f00cyiv8422985666yqt0485=
898892" id=3D"ydp4c9f00cyiv8422985666yqtfd13712"></div><div><div class=3D"y=
dp4c9f00cyiv8422985666yqt0485898892" id=3D"ydp4c9f00cyiv8422985666yqtfd3141=
5"><div class=3D"ydp4c9f00cyiv8422985666ydpb7fc655cyahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px=
;">
        <div dir=3D"ltr">Hello,</div>
        <div dir=3D"ltr"><br clear=3D"none">
        </div>
        <div dir=3D"ltr">Some further investigations
          have revealed that actually the "second main" table gets
          created by the last command executed by wg-quick "<span style=3D"=
orphans:2;white-space:pre-wrap;widows:2;">ip -4 rule add table main suppres=
s_prefixlength 0</span>".
          Will try to figure out what is happening further.</div>
        <div dir=3D"ltr"><br clear=3D"none">
        </div>
        <div dir=3D"ltr">George</div>
        <div><br clear=3D"none">
        </div>
      </div>
      </div><div class=3D"ydp4c9f00cyiv8422985666ydp88fb36beyahoo_quoted" i=
d=3D"ydp4c9f00cyiv8422985666ydp88fb36beyahoo_quoted_8919518802"><div class=
=3D"ydp4c9f00cyiv8422985666yqt0485898892" id=3D"ydp4c9f00cyiv8422985666yqtf=
d99347">
        </div><div style=3D"font-family:'Helvetica Neue', Helvetica, Arial,=
 sans-serif;font-size:13px;color:#26282a;"><div class=3D"ydp4c9f00cyiv84229=
85666yqt0485898892" id=3D"ydp4c9f00cyiv8422985666yqtfd87614">
          <div> On Sunday, 15 September 2019, 9:32:41 pm GMT+3, George
            Lucan <a shape=3D"rect" class=3D"ydp4c9f00cyiv8422985666moz-txt=
-link-rfc2396E" href=3D"mailto:boss_geo2005@yahoo.com" rel=3D"nofollow" tar=
get=3D"_blank">&lt;boss_geo2005@yahoo.com&gt;</a> wrote: </div>
          <div><br clear=3D"none">
          </div>
          <div><br clear=3D"none">
          </div>
          </div><div><div class=3D"ydp4c9f00cyiv8422985666yqt0485898892" id=
=3D"ydp4c9f00cyiv8422985666yqtfd90640">
            </div><div id=3D"ydp4c9f00cyiv8422985666ydp88fb36beyiv376729961=
1"><div class=3D"ydp4c9f00cyiv8422985666yqt0485898892" id=3D"ydp4c9f00cyiv8=
422985666yqtfd08887">
              </div><div><div class=3D"ydp4c9f00cyiv8422985666yqt0485898892=
" id=3D"ydp4c9f00cyiv8422985666yqtfd84484">
                </div><div class=3D"ydp4c9f00cyiv8422985666ydp88fb36beyiv37=
67299611ydpceb13acfyahoo-style-wrap" style=3D"font-size:13px;"><div class=
=3D"ydp4c9f00cyiv8422985666yqt0485898892" id=3D"ydp4c9f00cyiv8422985666yqtf=
d78251">
                  <div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;">Hello,</div>
                  <div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;"><br clear=3D"none">
                  </div>
                  <div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;">I have been trying
                    for several days to setup a wireguard vpn and send
                    all the traffic from a VM to another site (redirect
                    gateway scenario).</div>
                  <div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;"><br clear=3D"none">
                  </div>
                  <div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;">Site A</div>
                  <div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;">OS is Centos 7.6
                    installed with docker and wireguard installed</div>
                  <div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;"><br clear=3D"none">
                  </div>
                  <div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;">Site B</div>
                  <div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;">OS is a Opensense
                    19.7.4 with wireguard installed from the plugin and
                    a bunch of other things on it</div>
                  <div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;"><br clear=3D"none">
                  </div>
                  <div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;">I believe the issue
                    is within Ip route on Centos 7.6 but I am reaching
                    out for maybe different opinions.</div>
                  <div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;">On the Centos VM I am
                    using wireguard installed from the repos on the
                    website and using systemd to bring up the tunnel.
                    Everything seem to be brought up correctly except
                    that the traffic does not go through the tunnel.</div>
                  <div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;"><br clear=3D"none">
                  </div>
                  <div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;">Further investigating
                    I noticed something unusual (in my opinion).</div>
                  <div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;"><br clear=3D"none">
                  </div>
                  <div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;">Before the tunnel is
                    up:</div>
                  <div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;">
                    <div dir=3D"ltr">
                      <pre style=3D"orphans:2;widows:2;">#ip rule show
0:      from all lookup local=20
32766:  from all lookup main=20
32767:  from all lookup default </pre>
                    </div>
                  </div>
                  <div dir=3D"ltr" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;">After the tunnel is
                    up:</div>
                  <div dir=3D"ltr">
                    <div dir=3D"ltr">
                      <pre style=3D"font-family:Helvetica Neue, Helvetica, =
Arial, sans-serif;orphans:2;widows:2;">#ip rule show
0:      from all lookup local=20
32764:  from all lookup main=20
32765:  not from all fwmark 0xca6c lookup 51820=20
32766:  from all lookup main=20
32767:  from all lookup default </pre>
                      <pre style=3D"font-family:Helvetica Neue, Helvetica, =
Arial, sans-serif;orphans:2;widows:2;"><span><span style=3D"font-family:Hel=
vetica Neue, Helvetica, Arial, sans-serif;">To me is seems like somehow the=
re are 2 tables named "main" one after the new table created by wg-quick (l=
ooking at the priority it seems it is the same one that was present previou=
sly) and another one that gets create out of thin air before the wireguard =
created one named 51820.</span></span></pre>
                      <pre style=3D"orphans:2;widows:2;"><span style=3D"fon=
t-family:Helvetica Neue, Helvetica, Arial, sans-serif;">Ping works through =
the tunnel for IP to the other end of the tunnel</span></pre>
                      <pre style=3D"orphans:2;widows:2;"></pre><div dir=3D"=
ltr"><pre>#wg
interface: wg0
  public key: 8JXLXfl1W2xZd1T+zaCKSNB+FhUbb1IquIHvHhY7/iY=3D
  private key: (hidden)
  listening port: 34559
  fwmark: 0xca6c

peer: 04kTPSrh08X5uOCmL5aM1iCm8UqFHGtJDsrsPReafS8=3D
  endpoint: 188.27.172.68:1300
  allowed ips: 0.0.0.0/0
  latest handshake: 1 minute, 41 seconds ago
  transfer: 87.85 KiB received, 415.61 KiB sent
  persistent keepalive: every 15 seconds</pre><pre></pre><div dir=3D"ltr"><=
pre># ping 192.168.249.1
PING 192.168.249.1 (192.168.249.1) 56(84) bytes of data.
64 bytes from 192.168.249.1: icmp_seq=3D1 ttl=3D64 time=3D89.2 ms
64 bytes from 192.168.249.1: icmp_seq=3D2 ttl=3D64 time=3D89.5 ms</pre></di=
v></div>
                    </div>
                  </div>
                  </div><div dir=3D"ltr" style=3D"font-family:Helvetica Neu=
e, Helvetica, Arial, sans-serif;"><div class=3D"ydp4c9f00cyiv8422985666yqt0=
485898892" id=3D"ydp4c9f00cyiv8422985666yqtfd01669"><span>
                      </span><pre style=3D"font-family:Helvetica Neue, Helv=
etica, Arial, sans-serif;orphans:2;widows:2;">Is there any step that I migh=
t have missed or any kernel feature that would explain the behaviour?</pre>
                      <pre style=3D"font-family:Helvetica Neue, Helvetica, =
Arial, sans-serif;orphans:2;widows:2;">Worth mentioning it is a home env so=
 I can test whatever is needed to get to the bottom of it.</pre>
                      <pre style=3D"font-family:Helvetica Neue, Helvetica, =
Arial, sans-serif;orphans:2;widows:2;"></pre>
                      <pre style=3D"font-family:Helvetica Neue, Helvetica, =
Arial, sans-serif;orphans:2;widows:2;">Thanks</pre>
                      <pre style=3D"font-family:Helvetica Neue, Helvetica, =
Arial, sans-serif;orphans:2;widows:2;"></pre>
                      <pre style=3D"font-family:Helvetica Neue, Helvetica, =
Arial, sans-serif;orphans:2;widows:2;">George</pre></div>
                    </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <br clear=3D"none">
      <fieldset class=3D"ydp4c9f00cyiv8422985666mimeAttachmentHeader"></fie=
ldset>
      <pre class=3D"ydp4c9f00cyiv8422985666moz-quote-pre">_________________=
______________________________
WireGuard mailing list
<a shape=3D"rect" class=3D"ydp4c9f00cyiv8422985666moz-txt-link-abbreviated"=
 href=3D"mailto:WireGuard@lists.zx2c4.com" rel=3D"nofollow" target=3D"_blan=
k">WireGuard@lists.zx2c4.com</a>
<a shape=3D"rect" class=3D"ydp4c9f00cyiv8422985666moz-txt-link-freetext" hr=
ef=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"nofollow" =
target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><di=
v class=3D"ydp4c9f00cyiv8422985666yqt0485898892" id=3D"ydp4c9f00cyiv8422985=
666yqtfd08795">
</div></pre><div class=3D"ydp4c9f00cyiv8422985666yqt0485898892" id=3D"ydp4c=
9f00cyiv8422985666yqtfd34584">
   =20
    <br clear=3D"none">
  </div></div></div></div>
            </div>
        </div></body></html>
------=_Part_8227173_445625323.1569353019687--

--===============2647023889454672631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2647023889454672631==--
