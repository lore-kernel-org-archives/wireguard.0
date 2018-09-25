Return-Path: <SRS0=l6+B=MO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NORMAL_HTTP_TO_IP,SPF_PASS,URI_TRY_3LD,WEIRD_PORT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B051C00449
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 03:06:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E90C82083F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  2 Oct 2018 03:06:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cipherdyne-org.20150623.gappssmtp.com header.i=@cipherdyne-org.20150623.gappssmtp.com header.b="hPBFoWFy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E90C82083F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cipherdyne.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b1c222e;
	Tue, 2 Oct 2018 03:06:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 402d7af9
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Sep 2018 20:22:52 +0000 (UTC)
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11a6983f
 for <wireguard@lists.zx2c4.com>;
 Tue, 25 Sep 2018 20:22:51 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id q127-v6so23021946ljq.11
 for <wireguard@lists.zx2c4.com>; Tue, 25 Sep 2018 13:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cipherdyne-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jEGi0Ha+A22RTbmuwiu+GvkyctMUq2MvBXT8pgShXMw=;
 b=hPBFoWFyeknFc+UigKyOsDpVuoCLbv6sY0R0a2U8uB8wAlWubTemLQZGhFzm92PIEd
 dK64OlElnLFJ8MD0c/UaBpZKY1s8gPTM5xCjKKqLI0yXiJ2iR+T1gYKHXoRT91qHrrQs
 jfTE6zRG34PyAXNh6ga3u3/kCSEbECIiSdIDRkmmrhdV4zNtIDcZuTXfPZh87Er1Iu2q
 6Q1TYztQPogc3xATMO9O98ea/XnF9g0J6HJ14KT4i15YCqqhE4wDTF1ZD15TawpPuGac
 dCJ0s+Wzz0ANkvl7TeJWQhQphdXJ4wht1zoiztxMUWkvcY66ih2F4LxmyPR+6LRGYSzx
 Z5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jEGi0Ha+A22RTbmuwiu+GvkyctMUq2MvBXT8pgShXMw=;
 b=XhmUR932d8qLRC6cioOBkL9OzkB+Z65w1gI+ii/lAuRxpGkkVQD8dSa5De4G4jCWie
 iinCg/cFjH8Iudu3gGAFsgObZK6RRjFz1unvGtaHeJP+i1KQgx+3Fou/0fOUz/6fK3vw
 EHXWFJAkYLYQlDMrqI6EdwrhA/HbaP+L+noCZKagTfFiaOATfbm3Eka3cswMlZT3+TSe
 Ukdf5mSFMoGigGHys5QGz/hp6EiZ1NRN0p0KWa6SKEsFGh9/3iofYkCTIsFX6B+qhZo6
 xpguMF7hWmfy7FJuhwb+JqGPcQ91bjhY709hwxlyyT9vhJ75IAWk24sjz22BSmdbauNB
 /Lqw==
X-Gm-Message-State: ABuFfoiFFjlLPGv5Ji/LR/0A+Uh2RC1gNvx+OrP/nOciSMG1dJD1qaYu
 ha9HRdysnfUSVyBoYdHkMDl3IDbA/DB3lOc5i4B4Fw==
X-Google-Smtp-Source: ACcGV60xMzC1+DrnIzEdYbCCHuoubknfJlEuzQvy/Bsa7zNfK/fUvJdyDqJ20aM5g4w99LhjrjnQYXu910dASH+fzs8=
X-Received: by 2002:a2e:2e18:: with SMTP id
 u24-v6mr2149011lju.77.1537907127944; 
 Tue, 25 Sep 2018 13:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAKVinOU6xpbJNfCPAecX7kOgk_PbCzThYtER9d3ax1h6k3DGTw@mail.gmail.com>
 <CA+7UkwJ2UsVZMwnc_vZzDU0W-cBWjEKffTE5uBn9yqrBC0zmMQ@mail.gmail.com>
 <CAKVinOXXqMDRZcjVbOS4-iMBONdiYKaho8e3tEAZO+JKOZ_Gxw@mail.gmail.com>
In-Reply-To: <CAKVinOXXqMDRZcjVbOS4-iMBONdiYKaho8e3tEAZO+JKOZ_Gxw@mail.gmail.com>
From: Michael Rash <mbr@cipherdyne.org>
Date: Tue, 25 Sep 2018 16:25:16 -0400
Message-ID: <CABv+sEfYcEWFPEVcoa_74r2QX_Rw0em=DQfu+FB+UErjgaOwJQ@mail.gmail.com>
Subject: Re: [feature request] To support "Wireguard over raw TCP"
To: kexianbin@diyism.com
X-Mailman-Approved-At: Tue, 02 Oct 2018 05:06:16 +0200
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
Content-Type: multipart/mixed; boundary="===============5477362668760612220=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5477362668760612220==
Content-Type: multipart/alternative; boundary="0000000000000f1f5f0576b7e8b6"

--0000000000000f1f5f0576b7e8b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2018 at 12:06 PM KeXianbin(http://diyism.com) <
kexianbin@diyism.com> wrote:

> Thanks for the info.
>
> On Sep 25, 2018 23:53, "StarBrilliant" <coder@poorlab.com> wrote:
>
>> On Tue, Sep 25, 2018 at 1:17 PM KeXianbin(http://diyism.com)
>> <kexianbin@diyism.com> wrote:
>> >
>> > Currently, I'm using udp2raw-tunnel to transform wireguard udp traffic
>> into raw tcp (config files as follows),
>> > It's very stable on my home network than using wireguard alone,
>> > But if we can integrate RAW TCP feature into wireguard, it would
>> significantly improve performance and stability for end users.
>> >
>> >
>> > from:
>> https://gist.github.com/diyism/1b80903a83776675031c73ae499438d8#file-wir=
eguard_config-txt-L145
>> >
>> > $wget
>> https://github.com/wangyu-/udp2raw-tunnel/releases/download/20180830.2/u=
dp2raw_binaries.tar.gz
>> > $tar xzvf udp2raw_binaries.tar.gz
>> > $sudo cp udp2raw_amd64 /usr/bin/
>> > $sudo udp2raw_amd64 -c -l127.0.0.2:24448 -r<server ip>:24447 -a
>> > $cat /etc/wireguard/wg0.conf
>> > [Interface]
>> > PrivateKey =3D <client privkey>
>> > Address =3D 10.0.0.3/32
>> > ListenPort =3D 24447
>> > MTU =3D 1300
>> > PostUp =3D ip route add 10.0.0.0/24 dev wg0 && wg set wg0 peer <server
>> pubkey> allowed-ips 0.0.0.0/0
>> > PostDown =3D ip route del 10.0.0.0/24
>> >
>> > [Peer]
>> > #10.0.0.1
>> > PublicKey =3D <server pubkey>
>> > Endpoint =3D 127.0.0.2:24448
>> > #AllowedIPs =3D 0.0.0.0/0
>> >
>> > $sudo wg-quick down wg0 ; sudo wg-quick up wg0
>> > $ping 10.0.0.1
>> > 64 bytes from 10.0.0.1: icmp_seq=3D2113 ttl=3D64 time=3D183 ms
>> > $sudo ip route add 104.24.0.0/16 dev wg0
>> > $ping myip.ipip.net
>> > PING myip.ipip.net (104.24.20.50) 56(84) bytes of data.
>> > 64 bytes from 104.24.20.50 (104.24.20.50): icmp_seq=3D1 ttl=3D60 time=
=3D185 ms
>> > $curl http://myip.ipip.net
>> > IP=EF=BC=9A<server ip>
>> >
>> > #take care, "MTU =3D 1300" in wg0.conf is needed when wireguard over
>> udp2raw, or else most https requests will be blocked because of mtu prob=
lem.
>>
>>
>> Hello Kexianbin,
>>
>> This is an UNOFFICIAL response to your question. (But I think the
>> official developers may have similar answers.)
>>
>> Wireguard probably will not accept an official integration to udp2raw.
>> The reasons are:
>>
>> 1) Wireguard wants to keep their kernel part code minimized, therefore
>> easy for security auditing, and less bugs.The UDP protocol is actually
>> very simple and straightforward. (By the way, if you intended to use
>> Wireguard in China, be informed that this is a protocol that is very
>> easy to block by the ISP.)
>>
>> 2) I have read the source code of udp2raw. To be frank, the code is of
>> very low quality. For this reason, I don't think udp2raw would be
>> integrated into Wireguard unless it's rewritten.
>>
>> 3) Udp2raw is not suitable for everyone or for every country. For
>> example udp2raw may have problems passing middleboxes, which is common
>> among satellite ISPs in Oceania. Middleboxes break and resemble TCP
>> segments thus make udp2raw literally unusable. Also it is not
>> congestion friendly (by design), so a massive deployment may affect
>> the global Internet ecology.
>>
>
Let me also add (unofficially of course) that stealth against active
scanning is also an important goal achieved by Wireguard's usage of UDP,
and switching to TCP would break this. If TCP is required, then integration
options with third party tools such as udp2raw-tunnel will always be there.
Wireguard should not have to directly support those options, and rather
should stick to its current compelling design.

--Mike




>
>> However the good news is, Wireguard provides an open control interface
>> (see https://www.wireguard.com/xplatform/ ). By utilizing this
>> interface, we can develop an alternate frontend application other than
>> the official command "wg", that automatically sets up the kernel
>> Wireguard kernel part and a userland udp2raw part, packaged as one
>> application.
>>
>>
>> My words for Wireguard developers:
>>
>> 1) In case you may not know the udp2raw protocol, here is a
>> description. Some ISPs in certain countries have strange QoS strategy
>> that deprioritize UDP packets during network congestion, resulting a
>> 50% loss rate or more for UDP. The udp2raw protocol simulates a
>> three-way TCP handshake and add TCP header to UDP packets so they will
>> not be dropped. This protocol does not do congestion control or rate
>> control, neither does it understand any TCP semantics. It's a dirty
>> hack for dirty ISP, not suitable for everyone, but overwhelmingly
>> useful in certain countries.
>>
>> 2) Wireguard currently does not support binding to localhost. This is
>> required for any third-party plugins upon Wireguard to work. We might
>> need to consider binding to localhost an important feature to go in
>> the near future.
>>
>>
>> Best regards,
>> StarBrilliant
>>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>


--=20
Michael Rash | Founder
http://www.cipherdyne.org/
Key fingerprint =3D 53EA 13EA 472E 3771 894F  AC69 95D8 5D6B A742 839F

--0000000000000f1f5f0576b7e8b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue=
, Sep 25, 2018 at 12:06 PM KeXianbin(<a href=3D"http://diyism.com">http://d=
iyism.com</a>) &lt;<a href=3D"mailto:kexianbin@diyism.com">kexianbin@diyism=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"aut=
o">Thanks for the info.=C2=A0</div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On Sep 25, 2018 23:53, &quot;StarBrilliant&quot; &lt;<a h=
ref=3D"mailto:coder@poorlab.com" target=3D"_blank">coder@poorlab.com</a>&gt=
; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, Sep=
 25, 2018 at 1:17 PM KeXianbin(<a href=3D"http://diyism.com" rel=3D"norefer=
rer" target=3D"_blank">http://diyism.com</a>)<br>
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
ank">https://gist.github.com/diyism/1b80903a83776675031c73ae499438d8#file-w=
ireguard_config-txt-L145</a><br>
&gt;<br>
&gt; $wget <a href=3D"https://github.com/wangyu-/udp2raw-tunnel/releases/do=
wnload/20180830.2/udp2raw_binaries.tar.gz" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/wangyu-/udp2raw-tunnel/releases/download/20180830.2=
/udp2raw_binaries.tar.gz</a><br>
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
the global Internet ecology.<br></blockquote></div></div></blockquote><div>=
<br></div><div>Let me also add (unofficially of course) that stealth agains=
t active scanning is also an important goal achieved by Wireguard&#39;s usa=
ge of UDP, and switching to TCP would break this. If TCP is required, then =
integration options with third party tools such as udp2raw-tunnel will alwa=
ys be there. Wireguard should not have to directly support those options, a=
nd rather should stick to its current compelling design.</div><div><br></di=
v><div>--Mike</div><div><br></div><div><br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div class=3D"gmail_extra"><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<br>
However the good news is, Wireguard provides an open control interface<br>
(see <a href=3D"https://www.wireguard.com/xplatform/" rel=3D"noreferrer" ta=
rget=3D"_blank">https://www.wireguard.com/xplatform/</a> ). By utilizing th=
is<br>
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
</blockquote></div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Michael Rash | Founder<br><a href=3D"http://www.cipherdyne.org/" target=
=3D"_blank">http://www.cipherdyne.org/</a><br>Key fingerprint =3D 53EA 13EA=
 472E 3771 894F=C2=A0 AC69 95D8 5D6B A742 839F<br></div></div></div>

--0000000000000f1f5f0576b7e8b6--

--===============5477362668760612220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5477362668760612220==--
