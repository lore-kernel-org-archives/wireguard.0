Return-Path: <SRS0=+otM=PW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD1DC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 12:04:41 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58E2160F5A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 12:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58E2160F5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alexburke.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a01a5b59;
	Wed, 3 Nov 2021 12:04:38 +0000 (UTC)
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.153])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 676bcb66
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Nov 2021 12:04:36 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 49C92AF9
 for <wireguard@lists.zx2c4.com>; Wed,  3 Nov 2021 13:04:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
 in-reply-to:references:message-id:date:date:subject:subject
 :mime-version:from:from:content-transfer-encoding:content-type
 :content-type:received:received:received; s=dkim20160331; t=
 1635941074; x=1637755475; bh=tkOaVJAnqPzDtxjecu53Mc2J1PyqxCaS77I
 p/rn3Cm4=; b=bnNVWLvQutbUQrq+PIlmN42yGtb+8Ksx4BGzRbTphBvxQb+ygBx
 xfeIWKkTMqQK6Olb1mzSl6ftGkjwhcgXMFNh9x4xX35ZS3Nd2FXFjs4W+30zFoHS
 roUTZ+FpsqNaMrvIMt5blBgDL8W0s+7WQ/pzNWWWURmLBC58t3taLbnp0um1PuD2
 GXCKAWtjpDZ9+5hCRhstWuu4bZ9553s9/R+w+TJWRzHVJEMMkjwPuYjxKdSPicm2
 sdZeP9ffJAeKODvWF5pF/NjzKNJV/W2kFWYV/yOin2xkh2rOhYY5w6l5xYlfj7OQ
 MFK1e8sDiUCraCVAphrY3E/x1PsSfAeII83rBx2yoBXofzC2ac5jGWGUPm8dDRHg
 YjP5lgvXN+2iIY3TF4Afm1CA9itJv4GDq7fNQINKBEKEdmXbxrc8fLYKeGkTT29k
 xxbwPHahjGML1wazzW/XFbVtZhCqJqk28+EDKRnjx8+roftB1uzqApLkigeHAVU3
 g+pncAmZ4aMM4enQn2DCgKey3EXAD+V7x0jiDyDAqzpDLrzPYoe9DYyx2oJMa1H2
 7+YLFpW8GnDL5PVqLpaR8sQ5eedLdeOhT+NennhxNgPU7DACjIK5pL5ytfeI+6sO
 mawps5fuFWicGJOnOOiDKUl7UlmNJn2Ek3BjhdXPCVl0I0Y8ac0h/qDM=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HV1Kq-Y8SgUh for <wireguard@lists.zx2c4.com>;
 Wed,  3 Nov 2021 13:04:34 +0100 (CET)
Received: from int-mx003.mykolab.com (unknown [10.9.13.3])
 by mx.kolabnow.com (Postfix) with ESMTPS id 79F2BB54
 for <wireguard@lists.zx2c4.com>; Wed,  3 Nov 2021 13:04:33 +0100 (CET)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
 by int-mx003.mykolab.com (Postfix) with ESMTPS id ACB724391
 for <wireguard@lists.zx2c4.com>; Wed,  3 Nov 2021 12:54:45 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Alex Burke <alex@alexburke.ca>
Mime-Version: 1.0 (1.0)
Subject: Re: Split DNS for macOS
Date: Wed, 3 Nov 2021 12:54:42 +0100
Message-Id: <B2AFFB41-557E-41A0-94AB-BEDE8E4F3A06@alexburke.ca>
References: <E3607380-8E46-42CC-80B5-BB38F206E9BC@slarew.net>
In-Reply-To: <E3607380-8E46-42CC-80B5-BB38F206E9BC@slarew.net>
To: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

The functionality in [mac,i,iPad]OS that enables zone-based split DNS is qui=
te powerful, and Stephen's contribution would fit my use case as well.

I use a specific DNS resolver of my choice, but having Wireguard able to aut=
omagically resolve "host.corp.internal"-style FQDNs when the relevant Wiregu=
ard connection is up would be a huge win, not only for me but for corporatio=
ns with split-horizon DNS which want to implement Wireguard without having t=
o route irrelevant traffic into that tunnel.


> On 29 October 2021 at 22:07, Stephen Larew <stephen@slarew.net> wrote:
>=20
> =EF=BB=BF
>>=20
>>> On Oct 29, 2021, at 10:03, Andrew Fried <afried@spamteq.com> wrote:
>>>=20
>>>> On Oct 29, 2021, at 08:33, Stephen Larew <stephen@slarew.net> wrote:
>>>=20
>>>> On Oct 28, 2021, at 02:58, Bruce Ferrell <bferrell@baywinds.org> wrote:=

>>>>=20
>>>> On 10/28/21 12:16 AM, Stephen Larew wrote:
>>>>> For many months now, I have been running a patched WireGuard macOS app=

>>>>> that enables a split DNS configuration. I would like to try to upstrea=
m
>>>>> my patches for split DNS.
>>>>>=20
>>>>> There has been some interest in this patch:
>>>>> - "Mac APP DNS Search Domain" thread from July and August 2021 [1]
>>>>> - A commenter on my GitHub fork of wireguard-apple.
>>>>>=20
>>>>> What is split DNS? It allows sending DNS queries to a specific server
>>>>> based on the domain name. Systemd-resolved calls it a routing domain.
>>>>> Apple's Network Extension framework calls it a match domain.  Split DN=
S
>>>>> is especially useful for internal DNS servers.
>>>>>=20
>>>>> For example, if corp.example.com is a routing domain for the DNS serve=
r
>>>>> at 192.0.2.1 (only accessible over WireGuard), then
>>>>> server.corp.example.com is resolved using 192.0.2.1 while
>>>>> www.example.com is resolved using some other DNS resolver (depending o=
n
>>>>> the other network settings in macOS).
>>>>>=20
>>>>> The proposed patch adds new syntax to the wg-quick DNS=3D line.
>>>>> Specifically, a tilde prefixed domain is treated as a routing domain.
>>>>> Multiple routing domains can be added.
>>>>>=20
>>>>> Limitations:
>>>>> - Needs modifications to iOS UI to work on iOS.
>>>>> - Only matching routing domains are sent to the DNS servers specified i=
n
>>>>> the DNS=3D config line.  No separate fallback catch-all DNS server can=

>>>>> be set.
>>>>> - Routing/match domains are also included in the list of search domain=
s.
>>>>> This could be changed with the matchDomainsNoSearch API, but lacking
>>>>> more UI or config file changes to expose this option to the user, I
>>>>> went with the default.
>>>>>=20
>>>>> [1] https://lore.kernel.org/wireguard/20210810074232.aah5ktq5yzysaaey@=
SvensMacBookAir-2.local/T/
>>>>> [2] https://github.com/slarew/wireguard-apple/commit/6ebc356d9e11ab914=
43e06de5e89f1af57fcdff8
>>>>=20
>>>> That seems to be a redefinition of the existing definition of split DNS=
.
>>>>=20
>>>> Most usually, split DNS is done at the DNS server and different zones a=
re served to the resolver based on various criteria... Usually the originati=
on IP of the query;  If the query comes from a client on your LAN, or a part=
icular subnet, the contents of a particular, private, zone are returned.  If=
 the query comes from, say the internet,  a public zone is returned.
>>>>=20
>>>> YOUR description, is how DNS works in general... Except  your patch als=
o seems to either bypass the resolver libraries or wedge itself in front of t=
hem The system resolver libraries well tested and understood and they handle=
 the following very nicely.
>>>>=20
>>>> There is the issue of what happens with large DNS responses.  Any DNS r=
esponse over 512 bytes UDP fails and is required to be retried as a TCP quer=
y, which can handle the large response.  It's late and I'm too tired to look=
 it up, but there IS an RFC for this.
>>>>=20
>>>> It's a little known issue, but I've seen it when working with other VPN=
 products that ignored/didn't understand the behavior. The results weren't p=
retty and really embarrassing.
>>>>=20
>>>> Systemd has a bad habit of re-inventing the wheel... Badly. Eventually i=
t get's sorted, but is that really progress? In the long haul, "move fast an=
d break things" is a MAJOR pita for the vast majority of us.  But some like i=
t.
>>>>=20
>>>> For some real fun, look into DHCPCD.  It faithfully implements a partic=
ular RFC.  In some networking environments using VPNs, it breaks routing hor=
ribly.... But it meets the RFC.  You'll find it in Raspbian by default, and m=
ost other Debian derived distros.  I automatically rip it out and replace it=
 with the also available ISC DHCP client.  That one is fully compatible with=
 Windows, OS X, iOS, and every android and smart device I could test it with=
.  A DHCP server configured to be compatible with DHCPCD broke all of the pr=
eviously named.
>>>>=20
>>>> I'm giving this opinion away for free, so it's worth what you paid for i=
t.
>>>=20
>>> Regardless of naming or definitions, I think the ability for a *local de=
vice* to route DNS queries to different DNS servers based on domain matching=
 criteria is certainly useful. It=E2=80=99s not always possible or desirable=
 to control and configure an upstream DNS server. Hence, this patch enables t=
he local device to do split DNS.
>>>=20
>>> To be clear, this patch does not bypass or wedge around anything. In fac=
t, it configures the native macOS DNS settings in the appropriate manner to e=
ffect a split DNS configuration.
>>>=20
>>> As a result of controlling the native macOS DNS resolution logic, any fe=
ature, absent or present, in the macOS DNS resolver libraries should be unaf=
fected. This includes the large DNS response and TCP behavior. I do not expe=
ct the small/large UDP/TCP DNS features to change behavior when using a spli=
t DNS configuration as proposed in this patch.
>>>=20
>>> -Stephen
>>=20
>> Hi Stephen,
>>=20
>> A better solution to your problem would be to deploy DNSDIST:
>>    https://dnsdist.org/
>>=20
>> I for one would hope that esoteric requests that address a solution for l=
ess than 1% of the users would be rejected with the overall goal of preventi=
ng feature creep and bloat.
>>=20
>> Andrew
>=20
> DNSDIST may allow (I have not tried) one to create a split DNS scenario, b=
ut it is an extra piece of software that would need to be discovered, instal=
led, configured, and maintained by a user or system administrator. I do not b=
elieve it would properly integrate with the macOS DNS resolution machinery. I=
 do not believe it is a better solution to the problem.
>=20
> As I understand it, under some circumstances, the Tailscale macOS app also=
 implements split DNS in roughly the same manner as done in my patch. Namely=
, the tailscale app appears to use the Network Extension APIs to directly in=
tegrate with the macOS DNS resolution machinery. Perhaps the relevant differ=
ence is that tailscale approaches configuration differently (not based on wg=
-quick) than the WireGuard macOS app.
>=20
> I do not have statistics or polling on who desires this split DNS feature.=
 I have received private and public requests to upstream the feature. Tailsc=
ale also implements split DNS; presumable customers demand it. I suspect if t=
he feature was available to users of the WireGuard app, then it would be use=
d with precision to great effect. Users who do not need this split DNS featu=
re do not lose any previous functionality in the macOS WireGuard app.
>=20
> Personally, my one hesitation with this patch is that, as currently implem=
ented, a new syntax is added to the wg-quick config file (tilde prefixed rou=
te/match domains). My patch does not address compatibility issues nor does i=
t add documentation to wg-quick for the new syntax.
>=20
> -Stephen

