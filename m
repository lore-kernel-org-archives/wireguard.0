Return-Path: <SRS0=Q0ZK=WW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MIME_QP_LONG_LINE,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF46C3A5A6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 12:28:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23542206B7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 12:28:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="gLmCNSvY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23542206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1d7be7a;
	Mon, 26 Aug 2019 12:28:37 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 060bc2ba
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 20:26:53 +0000 (UTC)
Received: from pv50p00im-ztdg10011901.me.com (pv50p00im-ztdg10011901.me.com
 [17.58.6.50])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa406f38
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 20:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1566764811;
 bh=aa7/Ej7LlF0M5u9+5d/frN4bP9oiUCeoCxJzK5D1Iw0=;
 h=Content-Type:Subject:From:Date:Message-Id:To;
 b=gLmCNSvYtkvhfFkrRDN1gR119ShyampPZgLxermgF1CB7Eil2v6LiiywlP+Dsalbw
 CHoNvF1ZqsRqXWMUbyD7ictTEhXwRW09r0Yu8FU8ww94MdZQuLUgVsindr/f8AA+SK
 bTd2CVOqI6EpbINhZelJFcMiWAXTzn2woGVI1xnRAXS51kahSbH7E1uiDdghlANF0c
 /QcPlEVkf+pfZnIYb/J6q8ij6NIEfhGTHAGa8OnRse6L4XryTB/w+/xFGo2lyWpsnK
 lApvkdhmYLkJvSum0UkorVzIka1Tc/Q9AOgaDp3qnG9YQUbp3txWQ4sSLjLhz61PI+
 2WSu1xFNdf6hw==
Received: from [100.73.43.235] (unknown [5.126.183.67])
 by pv50p00im-ztdg10011901.me.com (Postfix) with ESMTPSA id E138B800965;
 Sun, 25 Aug 2019 20:26:50 +0000 (UTC)
Mime-Version: 1.0 (1.0)
Subject: Re: [Feature Request] Add ability to exclude subnets from AllowedIPs
From: Aryn Starr <whereislelouch@icloud.com>
X-Mailer: iPhone Mail (16B92)
In-Reply-To: <47ECFF71-29D8-472B-98D3-C7BF72ADA7F7@pallas.us>
Date: Mon, 26 Aug 2019 00:56:45 +0430
Message-Id: <404FD4CE-ACC0-41F0-A36D-CB3DC339B3F5@icloud.com>
References: <5301677D-D6E6-4DBB-ADA0-89AFC2D277AE@icloud.com>
 <47ECFF71-29D8-472B-98D3-C7BF72ADA7F7@pallas.us>
To: Derrick Lyndon Pallas <derrick@pallas.us>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-25_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1812120000 definitions=main-1908250230
X-Mailman-Approved-At: Mon, 26 Aug 2019 14:28:33 +0200
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
Content-Type: multipart/mixed; boundary="===============6417807126949996254=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============6417807126949996254==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-75DA8723-44D7-4104-9B15-BB386139EDC0
Content-Transfer-Encoding: 7bit


--Apple-Mail-75DA8723-44D7-4104-9B15-BB386139EDC0
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I haven=E2=80=99t tested that allowedIPs approach actually. I=E2=80=99ll tak=
e a look at that python wrapper, thanks.=20
I don=E2=80=99t know much about iptables and routing. I think learning it su=
fficiently will take quite some time? Or are there some tutorials around?
I also actually use WireGuard with macOS (though I occasionally use it on Li=
nux, too).

> On Aug 25, 2019, at 11:47 PM, Derrick Lyndon Pallas <derrick@pallas.us> wr=
ote:
>=20
> Why wouldn't this happen as an iptables rule?
>=20
> If some AllowedIPs trick is working for you and you're using Python and th=
e kernel version of Wireguard, check out [1], which will allow you to progra=
mmatically set up the interface.
>=20
> FWIW, I'm not sure adding complication to AllowedIPs is the right approach=
, but adding it to a tool seems reasonable. Maybe it also makes sense to all=
ow an IPset, but I'm haven't thought it through. My gut says routing prior t=
o Wireguard is probably what you're looking for.
>=20
> [1] https://github.com/ArgosyLabs/wgnlpy
>=20
> ~Derrick =E2=80=A2 iPhone
>=20
>> On Aug 22, 2019, at 12:10 PM, Aryn Starr <whereislelouch@icloud.com> wrot=
e:
>>=20
>> I live in Iran, and here the internet censorship is fierce. I need to rou=
te almost all of my traffic through the VPN, but some domestic sites are not=
 accessible from the US. Also, since ISPs apply different censoring rules, s=
ometimes my own servers are not reachable via the VPN (because the server=E2=
=80=99s ISP blocks the VPN, while my local ISP does not.)
>> The best current solution I=E2=80=99ve seen is
>> ```
>> $ python3
>>=20
>>>>> import ipaddress
>>>>> n1 =3D ipaddress.ip_network('106.203.202.0/23')
>>>>> n2 =3D ipaddress.ip_network('106.203.203.13/32')
>>>>> l =3D list(n1.address_exclude(n2))
>>>>> print(l)
>>=20
>> ```
>> Which is terrible.
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard

--Apple-Mail-75DA8723-44D7-4104-9B15-BB386139EDC0
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div style=3D"direction: ltr;">I haven=E2=80=
=99t tested that allowedIPs approach actually. I=E2=80=99ll take a look at t=
hat python wrapper, thanks.&nbsp;</div><div style=3D"direction: ltr;">I don=E2=
=80=99t know much about iptables and routing. I think learning it sufficient=
ly will take quite some time? Or are there some tutorials around?</div><div s=
tyle=3D"direction: ltr;">I also actually use WireGuard with macOS (though I o=
ccasionally use it on Linux, too).</div><div dir=3D"ltr"><br>On Aug 25, 2019=
, at 11:47 PM, Derrick Lyndon Pallas &lt;<a href=3D"mailto:derrick@pallas.us=
">derrick@pallas.us</a>&gt; wrote:<br><br></div><blockquote type=3D"cite"><d=
iv dir=3D"ltr"><meta http-equiv=3D"content-type" content=3D"text/html; chars=
et=3Dutf-8"><div>Why wouldn't this happen as an iptables rule?</div><div><br=
></div>If some AllowedIPs trick is working for you and you're using Python a=
nd the kernel version of Wireguard, check out [1], which will allow you to p=
rogrammatically set up the interface.<div><br></div><div>FWIW, I'm not sure a=
dding complication to AllowedIPs is the right approach, but adding it to a t=
ool seems reasonable. Maybe it also makes sense to allow an IPset, but I'm h=
aven't thought it through. My gut says routing prior to Wireguard is probabl=
y what you're looking for.<div><br></div><div>[1]&nbsp;<a href=3D"https://gi=
thub.com/ArgosyLabs/wgnlpy">https://github.com/ArgosyLabs/wgnlpy</a><br><br>=
<div id=3D"AppleMailSignature" dir=3D"ltr">~Derrick&nbsp;=E2=80=A2 iPhone</d=
iv><div dir=3D"ltr"><br>On Aug 22, 2019, at 12:10 PM, Aryn Starr &lt;<a href=
=3D"mailto:whereislelouch@icloud.com">whereislelouch@icloud.com</a>&gt; wrot=
e:<br><br></div><blockquote type=3D"cite"><div dir=3D"ltr"><span>I live in I=
ran, and here the internet censorship is fierce. I need to route almost all o=
f my traffic through the VPN, but some domestic sites are not accessible fro=
m the US. Also, since ISPs apply different censoring rules, sometimes my own=
 servers are not reachable via the VPN (because the server=E2=80=99s ISP blo=
cks the VPN, while my local ISP does not.)</span><br><span>The best current s=
olution I=E2=80=99ve seen is</span><br><span>```</span><br><span>$ python3</=
span><br><span></span><br><blockquote type=3D"cite"><blockquote type=3D"cite=
"><blockquote type=3D"cite"><span>import ipaddress</span><br></blockquote></=
blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span>n1 =3D ipaddress.ip_network('106.203.202.0/2=
3')</span><br></blockquote></blockquote></blockquote><blockquote type=3D"cit=
e"><blockquote type=3D"cite"><blockquote type=3D"cite"><span>n2 =3D ipaddres=
s.ip_network('106.203.203.13/32')</span><br></blockquote></blockquote></bloc=
kquote><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D=
"cite"><span>l =3D list(n1.address_exclude(n2))</span><br></blockquote></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span>print(l)</span><br></blockquote></blockquote></=
blockquote><span></span><br><span>```</span><br><span>Which is terrible.</sp=
an><br><span>_______________________________________________</span><br><span=
>WireGuard mailing list</span><br><span><a href=3D"mailto:WireGuard@lists.zx=
2c4.com">WireGuard@lists.zx2c4.com</a></span><br><span><a href=3D"https://li=
sts.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/li=
stinfo/wireguard</a></span><br></div></blockquote></div></div></div></blockq=
uote></body></html>=

--Apple-Mail-75DA8723-44D7-4104-9B15-BB386139EDC0--

--===============6417807126949996254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6417807126949996254==--
