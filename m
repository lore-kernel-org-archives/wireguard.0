Return-Path: <SRS0=H7Gu=WY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8428C3A5A4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 06:37:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D33922CF4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 06:37:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vHRi1WER"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D33922CF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9062578e;
	Wed, 28 Aug 2019 06:37:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 728bd0a0
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 06:37:23 +0000 (UTC)
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cab9cb0e
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 06:37:23 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id d23so1489332qko.3
 for <wireguard@lists.zx2c4.com>; Tue, 27 Aug 2019 23:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rTW4vYSpNsbDz+OmWtYXgelAbCY8to2whqF1bBoKQX4=;
 b=vHRi1WERd+zjZR6xDmpqr1aXdqOzcLh0KX3eBR9Zzc9qnY8nVWI67KuuYdPb22y+zD
 rpF0Q+U+lH3yb4TYzqq4NqKggfkl9RbR3DJn0HZ0S5qVdbre2bdTkDYf28Yxq6gSINeG
 XyQ220jok681BFuhpN4pGWy49OAKzSNmjlsqkEMtcOWHz15oSfGL2TcueDMozufb5PU8
 X7sBD3WHHquAk/cQNK/H52STuQZ+4Rel4b4JLELhw6X8jPC2c0pg2Wb7LafoZYmY4uZh
 VX1JU1k/PCHymlFAmBa9yIT/Wu1R217HLZpUQkAYoEC736pXtWAkDmQlX9u01D0B3WGW
 UmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rTW4vYSpNsbDz+OmWtYXgelAbCY8to2whqF1bBoKQX4=;
 b=Amd0gug4AlQFSEnfXj7viKlQy8fx8nNQnpsNJgiiytY/6HfHEmsUkQmtElrAfpDKcz
 6NBMJe3AbteR+k477w3wNlMK1Gf9RhHUbrzuWKC3zHfeLETMDabKF11j5OVW9iXtlkiU
 L3Lq+eqOQGi+NfRiHLVsendX4AAxVA1SAXxn997IIpp3aVAM9Q5Mdt0ZVT8DvYvCJigW
 jaKRYA6cyvgbcpditxrjLsL7LtRBGBQhgKLXfhnZ/1cl6FN6g+hbGD+IUj+DT7l3+XYJ
 fgUdzQdgbjYbavD/KCkt0gy2BR7R5OBK9UVx6aLebkTHNLAEXYthIfLm+UKh0M7JCjpa
 0qtw==
X-Gm-Message-State: APjAAAWJFCILBxavAhLBWVWR3Wpe5AzDwpbwaR4h6eu8cV295D/SgU2Q
 WsAtfzrfuKKTO78zMQKV1hA32yyFnldNxHOE8o0=
X-Google-Smtp-Source: APXvYqwvn9JKNWeaV1e5g/oc7kpwIvSt2/pnJbeTXrkm3/8VbgdrgHM8KwBYAuSXtq4MqfpqCbIBQFob8jxpEZbh4IU=
X-Received: by 2002:a37:8902:: with SMTP id l2mr2300045qkd.380.1566974243294; 
 Tue, 27 Aug 2019 23:37:23 -0700 (PDT)
MIME-Version: 1.0
References: <em08a1734c-6242-4687-b8d8-cf84e0b95ec3@ryzen>
 <CANH_QeYQ7hyBG1qK9PJB9E77gggW0NYe70vv8m6Dn=fU5zHQbg@mail.gmail.com>
 <em7afc7e4a-39a3-472d-ba45-79c6ad20b842@ryzen>
 <20190826180244.GB5022@matrix-dream.net>
 <CANcuY=oE9L_sm1b_JJV4_fv+ABLx9ZbTeXXzijkiLw-b=CxkMQ@mail.gmail.com>
 <em05f3a9de-8e41-4353-affa-3fb52e65cda8@ryzen>
In-Reply-To: <em05f3a9de-8e41-4353-affa-3fb52e65cda8@ryzen>
From: Laszlo KERTESZ <laszlo.kertesz@gmail.com>
Date: Wed, 28 Aug 2019 09:37:11 +0300
Message-ID: <CANcuY=r3wokQDEh+fH4cS2Cr-WwV5nTs9sLgYpYq=32RQNnqUw@mail.gmail.com>
Subject: Re: Re[2]: Keep-alive does not keep the connection alive
To: Hendrik Friedel <hendrik@friedels.name>
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
Content-Type: multipart/mixed; boundary="===============3399300066484523210=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3399300066484523210==
Content-Type: multipart/alternative; boundary="00000000000024d3a30591279f72"

--00000000000024d3a30591279f72
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The thing is i don't know what is 'reconnect' from WG's point of view. It
is 'stateless' of sorts as far as I know and it does not have if down/up
behavior like openvpn or other ssl vpn's that have keepalives. By default
it just sends packets and the optional keepalives are only there to help
with firewall traversal and such, it is not used to track the tunnel's
functionality.

It should have some internal counter that will re-try dns resolution after
some sort of timeout. Another important aspect is that this should work
even without keepalives somehow.

On Wed, Aug 28, 2019, 09:25 Hendrik Friedel <hendrik@friedels.name> wrote:

> Hello,
>
> that seems not to be the intended behaviour:
> If I understand correctly, the current behaviour is:
>
> At tunnel start the IP is resolved
> This IP is used for ever, namingly for re-connects.
>
>
> The probably intended behaviour would be:
>
> At tunnel start and at any re-connect the IP is resolved.
>
>
> Do you agree that this behaviour should be changed?
> Apart from that: Can you suggest an automatable workaround?
>
> Regards,
> Hendrik
>
> ------ Originalnachricht ------
> Von: "Laszlo KERTESZ" <laszlo.kertesz@gmail.com>
> An: "Ivan Lab=C3=A1th" <labawi-wg@matrix-dream.net>
> Cc: "Hendrik Friedel" <hendrik@friedels.name>; wireguard@lists.zx2c4.com
> Gesendet: 28.08.2019 08:17:32
> Betreff: Re: Keep-alive does not keep the connection alive
>
> I too use a server with dynamic ip. And the clients (Android, Linux) tend
> to lose connectivity permanently if the server's ip changes. With or
> without keepalive.
>
> The dynamic ip's dns entries are updated almost instantly when the ip
> changes so this is not dns related. Wireguard does not try to re establis=
h
> connection, it keeps using the server ip acquired at the tunnel's start.
> Only way around this is restarting the interface.
>
> On Mon, Aug 26, 2019, 21:08 Ivan Lab=C3=A1th <labawi-wg@matrix-dream.net>
> wrote:
>
>> Hello,
>>
>> I notice you are using dynamic ips for server.
>> On the client, is the server peer ip correct?
>>
>> Regards,
>> Ivan
>>
>> On Sun, Aug 25, 2019 at 06:44:53PM +0000, Hendrik Friedel wrote:
>> > Hello,
>> >
>> > thanks for your reply.
>> > It is linux (Kernel 5.x) in both cases.
>> >
>> > Regards,
>> > Hendrik
>> >
>> > ------ Originalnachricht ------
>> > Von: "Vasili Pupkin" <diggest@gmail.com>
>> > An: "Hendrik Friedel" <hendrik@friedels.name>
>> > Cc: wireguard@lists.zx2c4.com
>> > Gesendet: 25.08.2019 17:59:59
>> > Betreff: Re: Keep-alive does not keep the connection alive
>> >
>> > >What OS is running on client side? I have this issue on Win7 client,
>> > >can explain it further, it has nothing to do with keepalives though,
>> > >it is a bug in tun adapter implementation
>> > >
>> > >On Sun, Aug 25, 2019 at 6:38 PM Hendrik Friedel <hendrik@friedels.nam=
e>
>> wrote:
>> > >>  I have a setup in which the Server IP is known, whereas the Client
>> IP is changing. Thus, I rely on the Client to connect to the Server. I w=
ant
>> the Client to keep the connection alive all the time though, so that the
>> Server can also initiate a connection to the Server when needed. Both,
>> client and server are behind a NAT/Router.
>> > >>  I would think, that the "PersistentKeepalive =3D 25" on the Client
>> would ckeep the connection open. The connection works fine while used. B=
ut
>> after a while, I cannot connect from the Server to the client anymore.
>> > >>  I would assume that a ping from the Client to the IP of the
>> endpoint would help to re-alive the connection - but it does not.
>> > >>
>> > >>  Only after a wg-quick down and up all is fine again.
>> > >>
>> > >>  Below some more information.
>> > >>
>> > >>  Can you help me to find, what I am doing wrong?
>> >
>> > _______________________________________________
>> > WireGuard mailing list
>> > WireGuard@lists.zx2c4.com
>> > https://lists.zx2c4.com/mailman/listinfo/wireguard
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>

--00000000000024d3a30591279f72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The thing is i don&#39;t know what is &#39;reconnect&#39;=
 from WG&#39;s point=C2=A0of view. It is &#39;stateless&#39; of sorts as fa=
r=C2=A0as I know and it does not have if down/up behavior like openvpn or o=
ther ssl vpn&#39;s that have keepalives. By default it just sends packets a=
nd the optional keepalives are only there to help with firewall traversal a=
nd such, it is not used to track the tunnel&#39;s functionality.=C2=A0<div =
dir=3D"auto"><br></div><div dir=3D"auto">It should have some internal count=
er that will re-try dns resolution after some sort of timeout. Another impo=
rtant aspect is that this should work even without keepalives somehow.</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Wed, Aug 28, 2019, 09:25 Hendrik Friedel &lt;<a href=3D"mailto:hendrik@=
friedels.name">hendrik@friedels.name</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div><div>Hello,</div><div><br></div><div>that seems not t=
o be the intended behaviour:</div><div>If I understand correctly, the curre=
nt behaviour is:</div><div><br></div><div>At tunnel start the IP is resolve=
d</div><div>This IP is used for ever, namingly for re-connects.</div><div><=
br></div><div><br></div><div>The probably intended behaviour would be:</div=
><div><br></div><div>At tunnel start and at any re-connect the IP is resolv=
ed.</div><div><br></div><div><br></div><div>Do you agree that this behaviou=
r should be changed?=C2=A0</div><div>Apart from that: Can you suggest an au=
tomatable workaround?</div><div><br></div><div>Regards,</div><div>Hendrik</=
div>
<div><br></div>
<div>------ Originalnachricht ------</div>
<div>Von: &quot;Laszlo KERTESZ&quot; &lt;<a href=3D"mailto:laszlo.kertesz@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">laszlo.kertesz@gmail.com</a>=
&gt;</div>
<div>An: &quot;Ivan Lab=C3=A1th&quot; &lt;<a href=3D"mailto:labawi-wg@matri=
x-dream.net" target=3D"_blank" rel=3D"noreferrer">labawi-wg@matrix-dream.ne=
t</a>&gt;</div>
<div>Cc: &quot;Hendrik Friedel&quot; &lt;<a href=3D"mailto:hendrik@friedels=
.name" target=3D"_blank" rel=3D"noreferrer">hendrik@friedels.name</a>&gt;; =
<a href=3D"mailto:wireguard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">wireguard@lists.zx2c4.com</a></div>
<div>Gesendet: 28.08.2019 08:17:32</div>
<div>Betreff: Re: Keep-alive does not keep the connection alive</div><div><=
br></div>
<div id=3D"m_-4266857512841702538x67c9270ef9284da"><blockquote cite=3D"http=
://CANcuY=3DoE9L_sm1b_JJV4_fv+ABLx9ZbTeXXzijkiLw-b=3DCxkMQ@mail.gmail.com" =
type=3D"cite" class=3D"m_-4266857512841702538cite2">
<div dir=3D"auto">I too use a server with dynamic ip. And the clients (Andr=
oid, Linux) tend to lose connectivity permanently if the server&#39;s ip ch=
anges. With or without keepalive.<div dir=3D"auto"><br></div><div dir=3D"au=
to">The dynamic ip&#39;s dns entries are updated almost instantly when the =
ip changes so this is not dns related. Wireguard does not try to re establi=
sh connection, it keeps using the server ip acquired at the tunnel&#39;s st=
art. Only way around this is restarting the interface.=C2=A0</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, A=
ug 26, 2019, 21:08 Ivan Lab=C3=A1th &lt;<a href=3D"mailto:labawi-wg@matrix-=
dream.net" target=3D"_blank" rel=3D"noreferrer">labawi-wg@matrix-dream.net<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello,<br>
<br>
I notice you are using dynamic ips for server.<br>
On the client, is the server peer ip correct?<br>
<br>
Regards,<br>
Ivan<br>
<br>
On Sun, Aug 25, 2019 at 06:44:53PM +0000, Hendrik Friedel wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; thanks for your reply.<br>
&gt; It is linux (Kernel 5.x) in both cases.<br>
&gt; <br>
&gt; Regards,<br>
&gt; Hendrik<br>
&gt; <br>
&gt; ------ Originalnachricht ------<br>
&gt; Von: &quot;Vasili Pupkin&quot; &lt;<a href=3D"mailto:diggest@gmail.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">diggest@gmail.com</a>&gt;=
<br>
&gt; An: &quot;Hendrik Friedel&quot; &lt;<a href=3D"mailto:hendrik@friedels=
.name" rel=3D"noreferrer noreferrer" target=3D"_blank">hendrik@friedels.nam=
e</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:wireguard@lists.zx2c4.com" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">wireguard@lists.zx2c4.com</a><br>
&gt; Gesendet: 25.08.2019 17:59:59<br>
&gt; Betreff: Re: Keep-alive does not keep the connection alive<br>
&gt; <br>
&gt; &gt;What OS is running on client side? I have this issue on Win7 clien=
t,<br>
&gt; &gt;can explain it further, it has nothing to do with keepalives thoug=
h,<br>
&gt; &gt;it is a bug in tun adapter implementation<br>
&gt; &gt;<br>
&gt; &gt;On Sun, Aug 25, 2019 at 6:38 PM Hendrik Friedel &lt;<a href=3D"mai=
lto:hendrik@friedels.name" rel=3D"noreferrer noreferrer" target=3D"_blank">=
hendrik@friedels.name</a>&gt; wrote:<br>
&gt; &gt;&gt;=C2=A0 I have a setup in which the Server IP is known, whereas=
 the Client IP is changing. Thus, I rely on the Client to connect to the Se=
rver. I want the Client to keep the connection alive all the time though, s=
o that the Server can also initiate a connection to the Server when needed.=
 Both, client and server are behind a NAT/Router.<br>
&gt; &gt;&gt;=C2=A0 I would think, that the &quot;PersistentKeepalive =3D 2=
5&quot; on the Client would ckeep the connection open. The connection works=
 fine while used. But after a while, I cannot connect from the Server to th=
e client anymore.<br>
&gt; &gt;&gt;=C2=A0 I would assume that a ping from the Client to the IP of=
 the endpoint would help to re-alive the connection - but it does not.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 Only after a wg-quick down and up all is fine again.<br=
>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 Below some more information.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 Can you help me to find, what I am doing wrong?<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; WireGuard mailing list<br>
&gt; <a href=3D"mailto:WireGuard@lists.zx2c4.com" rel=3D"noreferrer norefer=
rer" target=3D"_blank">WireGuard@lists.zx2c4.com</a><br>
&gt; <a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"=
noreferrer noreferrer noreferrer" target=3D"_blank">https://lists.zx2c4.com=
/mailman/listinfo/wireguard</a><br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" rel=3D"noreferrer noreferrer" =
target=3D"_blank">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mail=
man/listinfo/wireguard</a><br>
</blockquote></div>
</blockquote></div>
</div></blockquote></div>

--00000000000024d3a30591279f72--

--===============3399300066484523210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3399300066484523210==--
