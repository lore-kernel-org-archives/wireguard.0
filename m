Return-Path: <SRS0=l6+B=MO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_FONT_FACE_BAD,HTML_MESSAGE,
	MAILING_LIST_MULTI,NORMAL_HTTP_TO_IP,SPF_PASS,URIBL_BLOCKED,URI_TRY_3LD,
	WEIRD_PORT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B537AC43143
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 09:01:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D716820878
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 09:01:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=diyism.com header.i=@diyism.com header.b="br7Ia3y6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D716820878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diyism.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1254be08;
	Tue, 2 Oct 2018 09:00:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eec896d4
 for <wireguard@lists.zx2c4.com>; Tue, 2 Oct 2018 09:00:55 +0000 (UTC)
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6b7ba26
 for <wireguard@lists.zx2c4.com>; Tue, 2 Oct 2018 09:00:55 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id s197-v6so243193vkf.10
 for <wireguard@lists.zx2c4.com>; Tue, 02 Oct 2018 02:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=diyism.com; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=pHmuO7V2agO2p751vlUjUyC3HvbSJVPW354rDTOg0bY=;
 b=br7Ia3y6FyD67KiDH1HSk6YzMK47YTynUWO6ZRtDFYNXczNxq0byoOXsUC27GFPUvJ
 /CssTg86zbhvZdikkNfjFWIE4ewifRvJc5oi4mpKe7Xf2b3ZAhHjZ7uHSGg0xhmK5mlZ
 PQfvejPcaubV4dTVX1naKDiAFO6Mdf29WzT68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=pHmuO7V2agO2p751vlUjUyC3HvbSJVPW354rDTOg0bY=;
 b=AjV6bV3D3X57aHK/7/RHD3YQ+4R8+wWmBRdf8XPfnbOtUq+SZ0A9bN7CQrpE9xRlrt
 AqNIzUYOYBP/KO8OMR27c5ZfNkl6NMb88GcjgykcFMW083Fbl8t7Pr/ui73atHtpCxJB
 UVkkF9FaJtQTL2V5QvjpGIOfANEiRhSGQoUM9oB4kjGI2qym6Q9C4DkTepO1e3guGsR1
 dax/K2U4fR/NbGE/NKz+7oyKbDwRwY01x+onUzzK8PKFdM69QR587KsEzpn90DxtJ4LQ
 jAgR8lXWP3zptXpzt8/HgAluBGjSRKPVvqlyOGJCj7E/n0ZESMhQnCws1QZz0mSIBU5Q
 w47g==
X-Gm-Message-State: ABuFfoi0WGWpP/a1gjn+SOylUOZ3+koMhABrScPkdQt96QHgi9wcGbWb
 gOpXd2oFWR1jaVZD7zIoM+TOdBPQC4S9lnw2bw7ZzA==
X-Google-Smtp-Source: ACcGV61rBh47IEFOc0+FjFs+l0M1Xr/NcsrIjqZN8xI4156rYgw3Bnj+TnCMeoHp98wocBKx76RVso8I1se7Lj28scE=
X-Received: by 2002:a1f:91c5:: with SMTP id
 t188-v6mr3122306vkd.5.1538470855490; 
 Tue, 02 Oct 2018 02:00:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:4522:0:0:0:0:0 with HTTP;
 Tue, 2 Oct 2018 02:00:54 -0700 (PDT)
X-Originating-IP: [162.243.142.163]
Received: by 2002:ab0:4522:0:0:0:0:0 with HTTP;
 Tue, 2 Oct 2018 02:00:54 -0700 (PDT)
In-Reply-To: <CAKVinOWN4+r4T6X2RsDFpOhV_kTrEquUe4fRoB6j0Q8+r-YLNg@mail.gmail.com>
References: <CAKVinOU6xpbJNfCPAecX7kOgk_PbCzThYtER9d3ax1h6k3DGTw@mail.gmail.com>
 <CA+7UkwJ2UsVZMwnc_vZzDU0W-cBWjEKffTE5uBn9yqrBC0zmMQ@mail.gmail.com>
 <CACVet5Hm5HFDtNgTpk2q2r_8Qzt3xTH4sb63RcuyDTj7vdPacA@mail.gmail.com>
 <CAKVinOWN4+r4T6X2RsDFpOhV_kTrEquUe4fRoB6j0Q8+r-YLNg@mail.gmail.com>
From: "KeXianbin(http://diyism.com)" <kexianbin@diyism.com>
Date: Tue, 2 Oct 2018 17:00:54 +0800
Message-ID: <CAKVinOU1_nd1Us_NMRWFQ3U=T8wijHm+jwggqm3uNXRCTpaDxA@mail.gmail.com>
Subject: Re: [feature request] To support "Wireguard over raw TCP"
To: Breus Blaauwendraad <b.blaauwendraad@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============2333933876836384507=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2333933876836384507==
Content-Type: multipart/alternative; boundary="000000000000d6d55c05773b287f"

--000000000000d6d55c05773b287f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I've got some help from udp2raw author, he/she tell me
udp2raw/faketcp needs a tcp handshake to build a tcp connection. So
Integrating FakeTCP into wireguard has no possibility to keep the
P2P/nat-traverse feature.
Finally I abandon/recall my Feature Request to integrating faketcp into
Wireguard. Maybe I can only integrate udp2raw into a personal Wireguard
android client to only connect the wireguard on my VPS(with a public
ip:port).

Malcolm Ke

On Oct 2, 2018 14:53, "KeXianbin(http://diyism.com)" <kexianbin@diyism.com>
wrote:

> The most important for me is to keep the P2P feature(auto NAT traverse) o=
f
> wireguard while wrapping the wireguard UDP packets into udp2raw Fake
> TCP/Raw TCP packets. I think that keeping p2p feature of wireguard in
> wireguard+udp2raw is more complex or even impossible than Wireguard itsel=
f
> supports Fake TCP/Raw TCP packets: https://github.com/
> wangyu-/udp2raw-tunnel/issues/212
>
> On Oct 2, 2018 11:11, "Breus Blaauwendraad" <b.blaauwendraad@gmail.com>
> wrote:
>
>> Hello StarBrilliant,
>>
>> I think that what Kexianbin is trying to make clear is that it would be
>> nice if  native TCP support would be added in WireGuard.
>> He (probably) currently uses udp2raw as an alternative, because an
>> UDP-only VPN is sadly enough not working in every situation.
>> With him, there have been others pitching ideas on how to wrap the
>> WireGuard UDP traffic in TCP, which in my opinion, is a poor idea.
>>
>> So, why would UDP for a VPN service not be enough?
>>
>> First of all, most VPN traffic obfuscation techniques require a TCP
>> connection instead of UDP.
>> VPN usage is particularly useful in countries were Internet censorship i=
s
>> applied.
>> Since obfuscating VPN traffic comes with performance overhead, wrapping
>> the UDP in TCP and obfuscating this would kill the performance advantage
>> WireGuard has over other protocols.
>>
>> However, what is arguably more important: various corporate firewalls
>> (hotels/restaurants/offices) are known to block UDP (for random ports
>> besides the standard DNS 53 port etc.).
>> In these instances, it would be useful to have the possibility to build =
a
>> fall back to TCP instead of UDP in a VPN service (or even the protocol
>> itself).
>>
>> Also, various researchers I have spoken to told me that sometimes they
>> need a more reliable (TCP) connection, which is then more important than
>> the speed UDP provides.
>>
>> I'm looking into the possibilities to deploy the WireGuard VPN protocol
>> for an existing VPN service currently using OpenVPN, but I keep stumblin=
g
>> on the problem that WIreGuard does not support TCP.
>> I (think I) have read all posts regarding TCP for WireGuard, but it seem=
s
>> that there do not exists a good way to tackle this problem.
>>
>> Could someone tell whether or not TCP would be a future additional optio=
n
>> for WireGuard, and why (not)?
>>
>> Also, do you think there actually does exist a neat and fitting solution
>> for the problems I described?
>>
>> Kind regards,
>>
>> Breus Blaauwendraad
>>
>>
>> On Tue, 25 Sep 2018 at 17:54, StarBrilliant <coder@poorlab.com> wrote:
>>
>>> On Tue, Sep 25, 2018 at 1:17 PM KeXianbin(http://diyism.com)
>>> <kexianbin@diyism.com> wrote:
>>> >
>>> > Currently, I'm using udp2raw-tunnel to transform wireguard udp traffi=
c
>>> into raw tcp (config files as follows),
>>> > It's very stable on my home network than using wireguard alone,
>>> > But if we can integrate RAW TCP feature into wireguard, it would
>>> significantly improve performance and stability for end users.
>>> >
>>> >
>>> > from: https://gist.github.com/diyism/1b80903a83776675031c73ae49943
>>> 8d8#file-wireguard_config-txt-L145
>>> >
>>> > $wget https://github.com/wangyu-/udp2raw-tunnel/releases/download/
>>> 20180830.2/udp2raw_binaries.tar.gz
>>> > $tar xzvf udp2raw_binaries.tar.gz
>>> > $sudo cp udp2raw_amd64 /usr/bin/
>>> > $sudo udp2raw_amd64 -c -l127.0.0.2:24448 -r<server ip>:24447 -a
>>> > $cat /etc/wireguard/wg0.conf
>>> > [Interface]
>>> > PrivateKey =3D <client privkey>
>>> > Address =3D 10.0.0.3/32
>>> > ListenPort =3D 24447
>>> > MTU =3D 1300
>>> > PostUp =3D ip route add 10.0.0.0/24 dev wg0 && wg set wg0 peer <serve=
r
>>> pubkey> allowed-ips 0.0.0.0/0
>>> > PostDown =3D ip route del 10.0.0.0/24
>>> >
>>> > [Peer]
>>> > #10.0.0.1
>>> > PublicKey =3D <server pubkey>
>>> > Endpoint =3D 127.0.0.2:24448
>>> > #AllowedIPs =3D 0.0.0.0/0
>>> >
>>> > $sudo wg-quick down wg0 ; sudo wg-quick up wg0
>>> > $ping 10.0.0.1
>>> > 64 bytes from 10.0.0.1: icmp_seq=3D2113 ttl=3D64 time=3D183 ms
>>> > $sudo ip route add 104.24.0.0/16 dev wg0
>>> > $ping myip.ipip.net
>>> > PING myip.ipip.net (104.24.20.50) 56(84) bytes of data.
>>> > 64 bytes from 104.24.20.50 (104.24.20.50): icmp_seq=3D1 ttl=3D60 time=
=3D185
>>> ms
>>> > $curl http://myip.ipip.net
>>> > IP=EF=BC=9A<server ip>
>>> >
>>> > #take care, "MTU =3D 1300" in wg0.conf is needed when wireguard over
>>> udp2raw, or else most https requests will be blocked because of mtu pro=
blem.
>>>
>>>
>>> Hello Kexianbin,
>>>
>>> This is an UNOFFICIAL response to your question. (But I think the
>>> official developers may have similar answers.)
>>>
>>> Wireguard probably will not accept an official integration to udp2raw.
>>> The reasons are:
>>>
>>> 1) Wireguard wants to keep their kernel part code minimized, therefore
>>> easy for security auditing, and less bugs.The UDP protocol is actually
>>> very simple and straightforward. (By the way, if you intended to use
>>> Wireguard in China, be informed that this is a protocol that is very
>>> easy to block by the ISP.)
>>>
>>> 2) I have read the source code of udp2raw. To be frank, the code is of
>>> very low quality. For this reason, I don't think udp2raw would be
>>> integrated into Wireguard unless it's rewritten.
>>>
>>> 3) Udp2raw is not suitable for everyone or for every country. For
>>> example udp2raw may have problems passing middleboxes, which is common
>>> among satellite ISPs in Oceania. Middleboxes break and resemble TCP
>>> segments thus make udp2raw literally unusable. Also it is not
>>> congestion friendly (by design), so a massive deployment may affect
>>> the global Internet ecology.
>>>
>>> However the good news is, Wireguard provides an open control interface
>>> (see https://www.wireguard.com/xplatform/ ). By utilizing this
>>> interface, we can develop an alternate frontend application other than
>>> the official command "wg", that automatically sets up the kernel
>>> Wireguard kernel part and a userland udp2raw part, packaged as one
>>> application.
>>>
>>>
>>> My words for Wireguard developers:
>>>
>>> 1) In case you may not know the udp2raw protocol, here is a
>>> description. Some ISPs in certain countries have strange QoS strategy
>>> that deprioritize UDP packets during network congestion, resulting a
>>> 50% loss rate or more for UDP. The udp2raw protocol simulates a
>>> three-way TCP handshake and add TCP header to UDP packets so they will
>>> not be dropped. This protocol does not do congestion control or rate
>>> control, neither does it understand any TCP semantics. It's a dirty
>>> hack for dirty ISP, not suitable for everyone, but overwhelmingly
>>> useful in certain countries.
>>>
>>> 2) Wireguard currently does not support binding to localhost. This is
>>> required for any third-party plugins upon Wireguard to work. We might
>>> need to consider binding to localhost an important feature to go in
>>> the near future.
>>>
>>>
>>> Best regards,
>>> StarBrilliant
>>> _______________________________________________
>>> WireGuard mailing list
>>> WireGuard@lists.zx2c4.com
>>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>>
>>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>>

--000000000000d6d55c05773b287f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Sorry, I&#39;ve got some help from udp2raw author, he/she=
 tell me udp2raw/faketcp needs a tcp handshake to build a tcp connection. S=
o Integrating FakeTCP into wireguard has no possibility to keep the P2P/nat=
-traverse feature.<div dir=3D"auto">Finally I abandon/recall my Feature Req=
uest to integrating faketcp into Wireguard. Maybe I can only integrate udp2=
raw into a personal Wireguard android client to only connect the wireguard =
on my VPS(with a public ip:port).</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Malcolm Ke</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Oct 2, 2018 14:53, &quot;KeXianbin(<a href=3D"http://di=
yism.com">http://diyism.com</a>)&quot; &lt;<a href=3D"mailto:kexianbin@diyi=
sm.com">kexianbin@diyism.com</a>&gt; wrote:<br type=3D"attribution"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"auto">The most important for me is to k=
eep the P2P feature(auto NAT traverse) of wireguard while wrapping the wire=
guard UDP packets into udp2raw Fake TCP/Raw TCP packets.=C2=A0<span style=
=3D"color:rgb(36,41,46);font-family:-apple-system,blinkmacsystemfont,&quot;=
segoe ui&quot;,helvetica,arial,sans-serif,&quot;apple color emoji&quot;,&qu=
ot;segoe ui emoji&quot;,&quot;segoe ui symbol&quot;;font-size:14px;backgrou=
nd-color:rgb(255,255,255)">I think that keeping p2p feature of wireguard in=
 wireguard+udp2raw is more complex or even impossible than Wireguard itself=
 supports Fake TCP/Raw TCP packets:=C2=A0</span><font color=3D"#24292e" fac=
e=3D"-apple-system, blinkmacsystemfont, segoe ui, helvetica, arial, sans-se=
rif, apple color emoji, segoe ui emoji, segoe ui symbol"><span style=3D"fon=
t-size:14px"><a href=3D"https://github.com/wangyu-/udp2raw-tunnel/issues/21=
2" target=3D"_blank">https://github.com/<wbr>wangyu-/udp2raw-tunnel/issues/=
<wbr>212</a></span></font></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Oct 2, 2018 11:11, &quot;Breus Blaauwendraad&quot; &lt;=
<a href=3D"mailto:b.blaauwendraad@gmail.com" target=3D"_blank">b.blaauwendr=
aad@gmail.com</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"ltr"><div>Hello StarBrilliant,</div><div><br></div><di=
v>I think that what=20
Kexianbin is trying to make clear is that it would be nice if=C2=A0 native =
TCP support would be added in WireGuard.</div><div>He (probably) currently =
uses udp2raw as an alternative, because an UDP-only VPN is sadly enough not=
 working in every situation.</div><div>With him, there have been others pit=
ching ideas on how to wrap the WireGuard UDP traffic in TCP, which in my op=
inion, is a poor idea.</div><div><br></div><div>So, why would UDP for a VPN=
 service not be enough?<br></div><div><br></div><div>First of all, most VPN=
 traffic obfuscation techniques require a TCP connection instead of UDP. <b=
r></div><div>VPN usage is particularly useful in countries were Internet ce=
nsorship is applied.<br></div><div>Since obfuscating VPN traffic comes with=
 performance overhead, wrapping the UDP in TCP and obfuscating this would k=
ill the performance advantage WireGuard has over other protocols.<br></div>=
<div><br></div><div>However, what is arguably more important: various corpo=
rate firewalls (hotels/restaurants/offices) are known to block UDP (for ran=
dom ports besides the standard DNS 53 port etc.).=C2=A0</div><div>In these =
instances, it would be useful to have the possibility to build a fall back =
to TCP instead of UDP in a VPN service (or even the protocol itself).<br></=
div><div><br></div><div>Also, various researchers I have spoken to told me =
that sometimes they need a more reliable (TCP) connection, which is then mo=
re important than the speed UDP provides.</div><div><br></div><div>I&#39;m =
looking into the possibilities to deploy the WireGuard VPN protocol for an =
existing VPN service currently using OpenVPN, but I keep stumbling on the p=
roblem that WIreGuard does not support TCP.</div><div>I (think I) have read=
 all posts regarding TCP for WireGuard, but it seems that there do not exis=
ts a good way to tackle this problem.</div><div><br></div><div>Could someon=
e tell whether or not TCP would be a future additional option for WireGuard=
, and why (not)?</div><div><br></div><div>Also, do you think there actually=
 does exist a neat and fitting solution for the problems I described?</div>=
<div><br></div><div>Kind regards,</div><div><br></div><div>Breus Blaauwendr=
aad<br></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr">On Tue, 25 Sep 2018 at 17:54, StarBrilliant &lt;<a href=3D"mailto:=
coder@poorlab.com" target=3D"_blank">coder@poorlab.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">On Tue, Sep 25, 2018 at 1:17 PM KeXianbi=
n(<a href=3D"http://diyism.com" rel=3D"noreferrer" target=3D"_blank">http:/=
/diyism.com</a>)<br>
&lt;<a href=3D"mailto:kexianbin@diyism.com" target=3D"_blank">kexianbin@diy=
ism.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Currently, I&#39;m using udp2raw-tunnel to transform wireguard udp tra=
ffic into raw tcp (config files as follows),<br>
&gt; It&#39;s very stable on my home network than using wireguard alone,<br=
>
&gt; But if we can integrate RAW TCP feature into wireguard, it would signi=
ficantly improve performance and stability for end users.<br>
&gt;<br>
&gt;<br>
&gt; from: <a href=3D"https://gist.github.com/diyism/1b80903a83776675031c73=
ae499438d8#file-wireguard_config-txt-L145" rel=3D"noreferrer" target=3D"_bl=
ank">https://gist.github.com/diyism<wbr>/1b80903a83776675031c73ae49943<wbr>=
8d8#file-wireguard_config-txt-<wbr>L145</a><br>
&gt;<br>
&gt; $wget <a href=3D"https://github.com/wangyu-/udp2raw-tunnel/releases/do=
wnload/20180830.2/udp2raw_binaries.tar.gz" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/wangyu-/udp<wbr>2raw-tunnel/releases/download/<wbr>=
20180830.2/udp2raw_binaries.<wbr>tar.gz</a><br>
&gt; $tar xzvf udp2raw_binaries.tar.gz<br>
&gt; $sudo cp udp2raw_amd64 /usr/bin/<br>
&gt; $sudo udp2raw_amd64 -c -l127.0.0.2:24448 -r&lt;server ip&gt;:24447 -a<=
br>
&gt; $cat /etc/wireguard/wg0.conf<br>
&gt; [Interface]<br>
&gt; PrivateKey =3D &lt;client privkey&gt;<br>
&gt; Address =3D <a href=3D"http://10.0.0.3/32" rel=3D"noreferrer" target=
=3D"_blank">10.0.0.3/32</a><br>
&gt; ListenPort =3D 24447<br>
&gt; MTU =3D 1300<br>
&gt; PostUp =3D ip route add <a href=3D"http://10.0.0.0/24" rel=3D"noreferr=
er" target=3D"_blank">10.0.0.0/24</a> dev wg0 &amp;&amp; wg set wg0 peer &l=
t;server pubkey&gt; allowed-ips <a href=3D"http://0.0.0.0/0" rel=3D"norefer=
rer" target=3D"_blank">0.0.0.0/0</a><br>
&gt; PostDown =3D ip route del <a href=3D"http://10.0.0.0/24" rel=3D"norefe=
rrer" target=3D"_blank">10.0.0.0/24</a><br>
&gt;<br>
&gt; [Peer]<br>
&gt; #10.0.0.1<br>
&gt; PublicKey =3D &lt;server pubkey&gt;<br>
&gt; Endpoint =3D <a href=3D"http://127.0.0.2:24448" rel=3D"noreferrer" tar=
get=3D"_blank">127.0.0.2:24448</a><br>
&gt; #AllowedIPs =3D <a href=3D"http://0.0.0.0/0" rel=3D"noreferrer" target=
=3D"_blank">0.0.0.0/0</a><br>
&gt;<br>
&gt; $sudo wg-quick down wg0 ; sudo wg-quick up wg0<br>
&gt; $ping 10.0.0.1<br>
&gt; 64 bytes from <a href=3D"http://10.0.0.1" rel=3D"noreferrer" target=3D=
"_blank">10.0.0.1</a>: icmp_seq=3D2113 ttl=3D64 time=3D183 ms<br>
&gt; $sudo ip route add <a href=3D"http://104.24.0.0/16" rel=3D"noreferrer"=
 target=3D"_blank">104.24.0.0/16</a> dev wg0<br>
&gt; $ping <a href=3D"http://myip.ipip.net" rel=3D"noreferrer" target=3D"_b=
lank">myip.ipip.net</a><br>
&gt; PING <a href=3D"http://myip.ipip.net" rel=3D"noreferrer" target=3D"_bl=
ank">myip.ipip.net</a> (104.24.20.50) 56(84) bytes of data.<br>
&gt; 64 bytes from 104.24.20.50 (104.24.20.50): icmp_seq=3D1 ttl=3D60 time=
=3D185 ms<br>
&gt; $curl <a href=3D"http://myip.ipip.net" rel=3D"noreferrer" target=3D"_b=
lank">http://myip.ipip.net</a><br>
&gt; IP=EF=BC=9A&lt;server ip&gt;<br>
&gt;<br>
&gt; #take care, &quot;MTU =3D 1300&quot; in wg0.conf is needed when wiregu=
ard over udp2raw, or else most https requests will be blocked because of mt=
u problem.<br>
<br>
<br>
Hello Kexianbin,<br>
<br>
This is an UNOFFICIAL response to your question. (But I think the<br>
official developers may have similar answers.)<br>
<br>
Wireguard probably will not accept an official integration to udp2raw.<br>
The reasons are:<br>
<br>
1) Wireguard wants to keep their kernel part code minimized, therefore<br>
easy for security auditing, and less bugs.The UDP protocol is actually<br>
very simple and straightforward. (By the way, if you intended to use<br>
Wireguard in China, be informed that this is a protocol that is very<br>
easy to block by the ISP.)<br>
<br>
2) I have read the source code of udp2raw. To be frank, the code is of<br>
very low quality. For this reason, I don&#39;t think udp2raw would be<br>
integrated into Wireguard unless it&#39;s rewritten.<br>
<br>
3) Udp2raw is not suitable for everyone or for every country. For<br>
example udp2raw may have problems passing middleboxes, which is common<br>
among satellite ISPs in Oceania. Middleboxes break and resemble TCP<br>
segments thus make udp2raw literally unusable. Also it is not<br>
congestion friendly (by design), so a massive deployment may affect<br>
the global Internet ecology.<br>
<br>
However the good news is, Wireguard provides an open control interface<br>
(see <a href=3D"https://www.wireguard.com/xplatform/" rel=3D"noreferrer" ta=
rget=3D"_blank">https://www.wireguard.com/xpla<wbr>tform/</a> ). By utilizi=
ng this<br>
interface, we can develop an alternate frontend application other than<br>
the official command &quot;wg&quot;, that automatically sets up the kernel<=
br>
Wireguard kernel part and a userland udp2raw part, packaged as one<br>
application.<br>
<br>
<br>
My words for Wireguard developers:<br>
<br>
1) In case you may not know the udp2raw protocol, here is a<br>
description. Some ISPs in certain countries have strange QoS strategy<br>
that deprioritize UDP packets during network congestion, resulting a<br>
50% loss rate or more for UDP. The udp2raw protocol simulates a<br>
three-way TCP handshake and add TCP header to UDP packets so they will<br>
not be dropped. This protocol does not do congestion control or rate<br>
control, neither does it understand any TCP semantics. It&#39;s a dirty<br>
hack for dirty ISP, not suitable for everyone, but overwhelmingly<br>
useful in certain countries.<br>
<br>
2) Wireguard currently does not support binding to localhost. This is<br>
required for any third-party plugins upon Wireguard to work. We might<br>
need to consider binding to localhost an important feature to go in<br>
the near future.<br>
<br>
<br>
Best regards,<br>
StarBrilliant<br>
______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailma<wbr>n/listinfo/wire=
guard</a><br>
</blockquote></div>
<br>______________________________<wbr>_________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailma<wbr>n/listinfo/wire=
guard</a><br>
<br></blockquote></div></div>
</blockquote></div></div>

--000000000000d6d55c05773b287f--

--===============2333933876836384507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2333933876836384507==--
