Return-Path: <SRS0=8RHT=YK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D49ECE58E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Oct 2019 19:04:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEE262089C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Oct 2019 19:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEE262089C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=friedels.name
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d94cace4;
	Thu, 17 Oct 2019 19:03:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b17318c3
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Oct 2019 19:03:43 +0000 (UTC)
Received: from smtprelay08.ispgateway.de (smtprelay08.ispgateway.de
 [134.119.228.109])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eab13596
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Oct 2019 19:03:43 +0000 (UTC)
Received: from [91.56.71.153] (helo=[192.168.177.20])
 by smtprelay08.ispgateway.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <hendrik@friedels.name>)
 id 1iLB3l-0001A4-3G; Thu, 17 Oct 2019 21:03:41 +0200
From: "Hendrik Friedel" <hendrik@friedels.name>
To: =?utf-8?q?Ivan=20Lab=c3=a1th?= <labawi-wg@matrix-dream.net>
Subject: Re[2]: Keep-alive does not keep the connection alive
Date: Thu, 17 Oct 2019 19:03:40 +0000
Message-Id: <emb3ce60aa-e0fe-4ef1-9955-18b08ac83546@ryzen>
In-Reply-To: <20190910091922.GA5679@matrix-dream.net>
References: <em08a1734c-6242-4687-b8d8-cf84e0b95ec3@ryzen>
 <CANH_QeYQ7hyBG1qK9PJB9E77gggW0NYe70vv8m6Dn=fU5zHQbg@mail.gmail.com>
 <em7afc7e4a-39a3-472d-ba45-79c6ad20b842@ryzen>
 <20190826180244.GB5022@matrix-dream.net>
 <CANcuY=oE9L_sm1b_JJV4_fv+ABLx9ZbTeXXzijkiLw-b=CxkMQ@mail.gmail.com>
 <em05f3a9de-8e41-4353-affa-3fb52e65cda8@ryzen>
 <20190828065411.GA6914@matrix-dream.net>
 <emc2cb759b-1a2b-4bd0-a4f8-77ed32053cff@ryzen>
 <20190910091922.GA5679@matrix-dream.net>
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
Content-Type: multipart/mixed; boundary="===============2288687611260973297=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2288687611260973297==
Content-Type: multipart/alternative;
 boundary="------=_MB15FADCE5-A32D-4F3E-AA77-18CC9EF23FD7"

--------=_MB15FADCE5-A32D-4F3E-AA77-18CC9EF23FD7
Content-Type: text/plain; format=flowed; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

------ Originalnachricht ------
Von: "Ivan Lab=C3=A1th" <labawi-wg@matrix-dream.net>
An: "Hendrik Friedel" <hendrik@friedels.name>
Cc: "Laszlo KERTESZ" <laszlo.kertesz@gmail.com>;=20
wireguard@lists.zx2c4.com
Gesendet: 10.09.2019 11:19:22
Betreff: Re: Keep-alive does not keep the connection alive

>On Sat, Sep 07, 2019 at 10:04:44AM +0000, Hendrik Friedel wrote:
>>  Hello,
>>
>>  >>  that seems not to be the intended behaviour:
>>  >>  If I understand correctly, the current behaviour is:
>>  >>
>>  >>  At tunnel start the IP is resolved
>>  >>  This IP is used for ever, namingly for re-connects.
>>  >This is only partly correct. The remote endpoint can unconditionally
>>  >roam and is updated by any valid packet from a given IP (if I remember
>>  >correctly).
>>  What does that mean?
>>  Does that mean, that traffic will update the IP so that the problem wil=
l
>>  not appear?
>
>If you have peers A and B with publicly rechable IP+port A1 and B1.
>When A's ip+port changes from A1 to A2, then (assuming I remember correctl=
y)
>any properly authenticated traffic from A (now A2) to B (B1) will update
>B's record of A's remote endpoint to A2. Any subsequent traffic from B wil=
l be
>sent to A2.
>
>Note, the roaming side (one with changed ip/port) must send the first
>packet, so it should be the one sending keepalive messages and it is
>the side where you should set the keepalive interval (for sending
>packets).
Yes, and that is a solution of 50% of the cases only.


>
>>  >Wireguard design and implementation is layered (which seems good).
>>  >The secure* tunnel, including the kernel module and wg tool seem
>>  >to be in a reasonable state, but automation, DNS, key exchange are
>>  >out of scope for them. It is meant to be provided by tooling, which is
>>  >currently very raw.
>>
>>  I don't understand...
>>  When I am on my way in a roadwarrier scenario with my mobile, with a
>>  changing IP and a changing connection that works very well.
>>  If the IP of my Server is changing, it's not working well at all. I
>>  don't think that this should be declared as 'works as intended'.
>
>I am not saying wireguard solution is working as intended. I am saying
>the DNS resolution is meant to be implemented in out-of-kernel tooling,
<<It's a bit OT, but I actually think letting the kernel part of=20
WireGuard
do the DNS queries is totally legit and a wishful (maybe optional)=20
feature:
https://www.kernel.org/doc/Documentation/networking/dns_resolver.txt
This would allow DynDNS scenarios without any monitoring daemons running
and proper configuration using systemd.>> [Vincent Wiemann]]


>>
>>  >As a workaround you could
>>  >   - unconditionally periodically update the endpoint
>>  This would break existing transfers without reason.
>
>As I said, you could try periodically updating the endpoint, and only
>endpoint, not restarting or changing anything except peer ip+port.
>If updating endpoint information (to the same or valid ip+port) does break
>connections, then I believe it is a bug that should be reported.

I was not able to find commands for updating the endpoint without=20
restarting the tunnel.
Can you give me a hint?

>
>
>>  >   - monitor last handshake time, when large update endpoint or restar=
t
>>  >     tunnel
>>  That could be an option.
>>  >   - add keepalive to server - it might reduce your downtime
>>  How would that help?
>
>Keepalive is one-sided. As your client doesn't know where to send
>the keepalive request, it doesn't help. Keepalive on the server can.
I have activated keepalive on both client and server.


>If the server changes IPs and the client remains reachable on previous ip+=
port,
>keepalive on server should keep your tunnel alive.
>
>
>Roaming will work if the side that changes ips:
>   a) has keepalive enabled, so it will send a packet periodically
>   b) sends an unsolicited packet (e.g. requests something from the
>      other side as clients usually do but server less so)
>   c) ip is changed after a request is received and before a reply is
>      sent (could happen but unreliable)
>

I think, there is an 'or' between a, b and c?

Greetings,
Hendrik



>
--------=_MB15FADCE5-A32D-4F3E-AA77-18CC9EF23FD7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head>

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
s=3D"plain"><div>Hello,</div><div><br /></div><div>------ Originalnachricht =
------</div>
<div>Von: "Ivan Lab=C3=A1th" &lt;labawi-wg@matrix-dream.net&gt;</div>
<div>An: "Hendrik Friedel" &lt;hendrik@friedels.name&gt;</div>
<div>Cc: "Laszlo KERTESZ" &lt;laszlo.kertesz@gmail.com&gt;; wireguard@lists=
.zx2c4.com</div>
<div>Gesendet: 10.09.2019 11:19:22</div>
<div>Betreff: Re: Keep-alive does not keep the connection alive</div><div><=
br /></div>
<div id=3D"x85650cc1b3ab4be"><blockquote type=3D"cite" class=3D"cite2">

<div class=3D"plain_line">On Sat, Sep 07, 2019 at 10:04:44AM +0000, Hendrik =
Friedel wrote:</div>
<blockquote type=3D"cite" class=3D"cite">
<div class=3D"plain_line"> Hello,</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line"> &gt;&gt;  that seems not to be the intended beha=
viour:</div>
<div class=3D"plain_line"> &gt;&gt;  If I understand correctly, the current =
behaviour is:</div>
<div class=3D"plain_line"> &gt;&gt;</div>
<div class=3D"plain_line"> &gt;&gt;  At tunnel start the IP is resolved</di=
v>
<div class=3D"plain_line"> &gt;&gt;  This IP is used for ever, namingly for =
re-connects.</div>
<div class=3D"plain_line"> &gt;This is only partly correct. The remote endp=
oint can unconditionally</div>
<div class=3D"plain_line"> &gt;roam and is updated by any valid packet from =
a given IP (if I remember</div>
<div class=3D"plain_line"> &gt;correctly).</div>
<div class=3D"plain_line"> What does that mean?</div>
<div class=3D"plain_line"> Does that mean, that traffic will update the IP=
 so that the problem will</div>
<div class=3D"plain_line"> not appear?</div>
</blockquote>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">If you have peers A and B with publicly rechable=
 IP+port A1 and B1.</div>
<div class=3D"plain_line">When A's ip+port changes from A1 to A2, then (ass=
uming I remember correctly)</div>
<div class=3D"plain_line">any properly authenticated traffic from A (now A2=
) to B (B1) will update</div>
<div class=3D"plain_line">B's record of A's remote endpoint to A2. Any subs=
equent traffic from B will be</div>
<div class=3D"plain_line">sent to A2.</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">Note, the roaming side (one with changed ip/port) =
must send the first</div>
<div class=3D"plain_line">packet, so it should be the one sending keepalive =
messages and it is</div>
<div class=3D"plain_line">the side where you should set the keepalive inter=
val (for sending</div>
<div class=3D"plain_line">packets).</div></blockquote><div id=3D"x85650cc1b=
3ab4be">Yes, and that is a solution of 50% of the cases only.</div><div id=
=3D"x85650cc1b3ab4be"><br /></div><div id=3D"x85650cc1b3ab4be"><br /></div>=
<blockquote type=3D"cite" class=3D"cite2"><div class=3D"plain_line"><br /><=
/div>
<blockquote type=3D"cite" class=3D"cite2">
<div class=3D"plain_line"> &gt;Wireguard design and implementation is layer=
ed (which seems good).</div>
<div class=3D"plain_line"> &gt;The secure* tunnel, including the kernel mod=
ule and wg tool seem</div>
<div class=3D"plain_line"> &gt;to be in a reasonable state, but automation, =
DNS, key exchange are</div>
<div class=3D"plain_line"> &gt;out of scope for them. It is meant to be pro=
vided by tooling, which is</div>
<div class=3D"plain_line"> &gt;currently very raw.</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line"> I don't understand...</div>
<div class=3D"plain_line"> When I am on my way in a roadwarrier scenario wi=
th my mobile, with a</div>
<div class=3D"plain_line"> changing IP and a changing connection that works =
very well.</div>
<div class=3D"plain_line"> If the IP of my Server is changing, it's not wor=
king well at all. I</div>
<div class=3D"plain_line"> don't think that this should be declared as 'wor=
ks as intended'.</div>
</blockquote>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">I am not saying wireguard solution is working as=
 intended. I am saying</div>
<div class=3D"plain_line">the DNS resolution is meant to be implemented in=
 out-of-kernel tooling,</div></blockquote><div id=3D"x85650cc1b3ab4be">&lt;&=
lt;It's a bit OT, but I actually think letting the kernel part of WireGuard=
</div><div id=3D"x85650cc1b3ab4be">do the DNS queries is totally legit and=
 a wishful (maybe optional) feature:</div><div id=3D"x85650cc1b3ab4be">https=
://www.kernel.org/doc/Documentation/networking/dns_resolver.txt</div><div i=
d=3D"x85650cc1b3ab4be"> </div><div id=3D"x85650cc1b3ab4be">This would allow =
DynDNS scenarios without any monitoring daemons running</div><div id=3D"x8=
5650cc1b3ab4be">and proper configuration using systemd.&gt;&gt; [Vincent Wi=
emann]]</div><div id=3D"x85650cc1b3ab4be"><br /></div><br /><blockquote typ=
e=3D"cite" class=3D"cite2"><blockquote type=3D"cite" class=3D"cite2"><div c=
lass=3D"plain_line"><br /> &gt;As a workaround you could</div>
<div class=3D"plain_line"> &gt;   - unconditionally periodically update the =
endpoint</div>
<div class=3D"plain_line"> This would break existing transfers without reas=
on.</div>
</blockquote>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">As I said, you could try periodically updating th=
e endpoint, and only</div>
<div class=3D"plain_line">endpoint, not restarting or changing anything exc=
ept peer ip+port.</div>
<div class=3D"plain_line">If updating endpoint information (to the same or=
 valid ip+port) does break</div>
<div class=3D"plain_line">connections, then I believe it is a bug that shou=
ld be reported.</div></blockquote><div id=3D"x85650cc1b3ab4be"><br /></div>=
<div id=3D"x85650cc1b3ab4be">I was not able to find commands for updating t=
he endpoint without restarting the tunnel.</div><div id=3D"x85650cc1b3ab4be=
">Can you give me a hint?</div><br /><blockquote type=3D"cite" class=3D"cit=
e2"><div class=3D"plain_line"><br /></div>
<div class=3D"plain_line">=C2=A0</div>
<blockquote type=3D"cite" class=3D"cite2">
<div class=3D"plain_line"> &gt;   - monitor last handshake time, when large =
update endpoint or restart</div>
<div class=3D"plain_line"> &gt;     tunnel</div>
<div class=3D"plain_line"> That could be an option.</div>
<div class=3D"plain_line"> &gt;   - add keepalive to server - it might redu=
ce your downtime</div>
<div class=3D"plain_line"> How would that help?</div>
</blockquote>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">Keepalive is one-sided. As your client doesn't kn=
ow where to send</div>
<div class=3D"plain_line">the keepalive request, it doesn't help. Keepalive =
on the server can.</div></blockquote>I have activated keepalive on both cl=
ient and server.</div><div id=3D"x85650cc1b3ab4be"><br /></div><div id=3D"x=
85650cc1b3ab4be"><br /><blockquote type=3D"cite" class=3D"cite2"><div class=
=3D"plain_line">If the server changes IPs and the client remains reachable=
 on previous ip+port,</div>
<div class=3D"plain_line">keepalive on server should keep your tunnel alive=
.</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">Roaming will work if the side that changes ips:</=
div>
<div class=3D"plain_line">  a) has keepalive enabled, so it will send a pac=
ket periodically</div>
<div class=3D"plain_line">  b) sends an unsolicited packet (e.g. requests s=
omething from the</div>
<div class=3D"plain_line">     other side as clients usually do but server=
 less so)</div>
<div class=3D"plain_line">  c) ip is changed after a request is received an=
d before a reply is</div>
<div class=3D"plain_line">     sent (could happen but unreliable)</div>
<div class=3D"plain_line"><br /></div></blockquote><div id=3D"x85650cc1b3ab=
4be"><br /></div><div id=3D"x85650cc1b3ab4be">I think, there is an 'or' bet=
ween a, b and c?</div><div id=3D"x85650cc1b3ab4be"><br /></div><div id=3D"x=
85650cc1b3ab4be">Greetings,</div><div id=3D"x85650cc1b3ab4be">Hendrik</div>=
<div id=3D"x85650cc1b3ab4be"><br /></div><div id=3D"x85650cc1b3ab4be"><br /=
></div><br /><blockquote type=3D"cite" class=3D"cite2"><div class=3D"plain_=
line"><br /></div>
</blockquote></div>
</body></html>
--------=_MB15FADCE5-A32D-4F3E-AA77-18CC9EF23FD7--


--===============2288687611260973297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2288687611260973297==--

