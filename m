Return-Path: <SRS0=+otM=PW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA05C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 21:47:14 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B98F1610EA
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 21:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B98F1610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alexburke.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90f96b47;
	Wed, 3 Nov 2021 21:46:20 +0000 (UTC)
Received: from mx.kolabnow.com (mx.kolabnow.com [212.103.80.153])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id aaaeff3d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Nov 2021 21:46:17 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mx.kolabnow.com (Postfix) with ESMTP id 93E6CB4A
 for <wireguard@lists.zx2c4.com>; Wed,  3 Nov 2021 22:46:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
 subject:subject:in-reply-to:references:message-id:date:date
 :mime-version:from:from:content-transfer-encoding:content-type
 :content-type:received:received:received; s=dkim20160331; t=
 1635975974; x=1637790375; bh=psNQ/tBHbiv98PKUGYnP45iMoNp1xKYaXkF
 wByof5vg=; b=JjS81hqF0vsQ0ZnhVKzn2+LoCshU4wV9mFDISTyKfZx5SAR1lT3
 Uz3ALINpnZPivEsr/cLBI1/YIFMHfuJgceUDsHmrSh6GWLZ7EwZsceBNp/udXPss
 M3O+hwDXoBLMyx11nyq0whHzCdNGqlInQR1mLjW/W8d0WJZzJRhbMFq4InrKsD2J
 RBp4NmYkbzVIknE7tQJ3yHggMdl7f3n0+yqCfSjxov0G8jESe+Ti42T1JVKAG8YV
 vzfs1bp4RE/5GZX83wTgL+jnyrPAgvjfvzGDyEz2A0Us0dwmcdFiHTGp6H1VkkFI
 MKQL7tKPtuuja3v5dlZDBDu7DLsTIzZE9ja8iT1VzrrDP4WHKLou1bZbU8svFuuX
 gWVQ0DIYccH1hI3XqEcFUpEA0jJ+YIRyd95LNRknizkcfwfVljaHNo6J75Q4zOLw
 eOOo1WLzGm7pkGi4Kw7jZQlhTWTx6Vtk8VFeel6kY4PVid80LAKaxrDoRDa2xQYv
 oKcBrJajxNTSGqOY9uJJVzsQSs9DppyF19xwAJusURZE4K77AeR8AYza2J+bweg2
 tAdZfrqsMdUJORQmhLWGQpYyRHl+3G67hwIUA9PWZY/jzuXm5vcJPp9fz3lD4viE
 bqH/w/xzEO6u/XhS8oCpG56mm0s3ooS1T5QjkrHUUv9c75oUWicsgUaU=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ft7iWLRgef_a for <wireguard@lists.zx2c4.com>;
 Wed,  3 Nov 2021 22:46:14 +0100 (CET)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
 by mx.kolabnow.com (Postfix) with ESMTPS id 6BF49B19
 for <wireguard@lists.zx2c4.com>; Wed,  3 Nov 2021 22:46:14 +0100 (CET)
Received: from ext-subm002.mykolab.com (unknown [10.9.6.2])
 by int-mx001.mykolab.com (Postfix) with ESMTPS id DCF36183C
 for <wireguard@lists.zx2c4.com>; Wed,  3 Nov 2021 22:46:13 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Alex Burke <alex@alexburke.ca>
Mime-Version: 1.0 (1.0)
Date: Wed, 3 Nov 2021 22:46:11 +0100
Message-Id: <0EAFBE4F-AC66-468E-B731-D6A7A4A5DBB0@alexburke.ca>
References: <K17663-81.1635975267@spamhaus.org>
In-Reply-To: <K17663-81.1635975267@spamhaus.org>
Subject: Re: Split DNS for macOS
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

Hi Andrew,

> What makes Wireguard so good is that it does one thing and does it really,=
 really well.


I am in complete agreement on this, but Wireguard wouldn't really be "doing"=
 (implementing) what Stephen and Matty are trying to accomplish, but rather s=
imply integrating with the mechanism the Apple platform has implemented for d=
oing precisely that.

While I'm not in a position to weigh in on how much development work it woul=
d entail for Jason et al to implement to the high standard Wireguard is know=
n for, or how much bloat it would add, it's undoubtedly a killer feature, an=
d it's my professional opinion that a significant proportion of the Wireguar=
d user base would benefit from supporting it =E2=80=94 especially for corpor=
ate use.


> On 3 Nov 2021 at 21:34, Andrew Fried <afried@spamteq.com> wrote:
> =EF=BB=BFHi Matty,
>=20
> I understand exactly what you're trying to accomplish and agree that split=
 dns can be challenging, especially with multiple VPN gateways.
>=20
> My point is that what you're describing is a DNS issue, not a firewall/vpn=
/routing issue.  As such, I think there's more eloquent way to solve DNS rel=
ated issues.
>=20
> The old fashioned way is to add exceptions to the equivalent of the /etc/h=
ost file.  Not ideal, doesn't scale well and pretty static, but if you're re=
lying on just a few private host mappings it works pretty well.
>=20
> The second and more palatable solution is to have the internal nameservers=
 running software that supports views - such that queries for xxxx.example.c=
om that originate from private address space return different answers than i=
f the query originated from public space.
>=20
> A third option would be set the internal recursives up as forwarders that o=
nly respond authoritatively for your private "mydomain.internet" and forward=
 all other requests to nameservers capable of public recursion.
>=20
> There's the dnsdist solution, which is an advanced dns proxy server capabl=
e of routing requests to different recursives based on the domain name.  DNS=
DIST does a lot of other stuff as well, but the heart of is intelligent prox=
ying.  In our racks we use DNSDIST to distribute around a million DNS querie=
s per minute and it works flawlessly.
>=20
> Basically, what I'm suggesting is that DNS servers handle DNS and wireguar=
d handle routing/transport.  Adding VPN functionality to a nameserver or dns=
 capabilities to Wireguard adds complexities that can be better handled else=
where.
>=20
> What makes Wireguard so good is that it does one thing and does it really,=
 really well.
>=20
> Andrew
>=20
>=20
> On 10/29/21 5:06 PM, Matty Driessen wrote:
>> Hello Andrew,
>> I just want to chime in here and say that I think the current
>> implementation of search domains is simply not working the way it
>> should on the MacOS client.
>> My use case is pretty common, an internal DNS server that has entries
>> for internal servers. I defined a search domain in the WireGuard
>> configuration; DNS =3D 10.13.13.1 mydomain.internal. The search domain
>> is for convenience, so I can just use the servername instead of
>> servername.mydomain.internal. Now this works fine when I route all the
>> traffic through the VPN (AllowedIPs =3D 0.0.0.0/0) but the search domain
>> is completely ignored when I only route the traffic I need to
>> (AllowedIPs =3D 10.13.13.0/24 192.168.0.0/24).
>> I don't think this is a configuration error on my side. The DNS
>> responds fine when using servername.mydomain.internal. This problem is
>> even mentioned in the "WireGuard macOS & iOS TODO List"
>> 9. matchDomains=3D[=E2=80=9C=E2=80=9D] doesn=E2=80=99t do what the docume=
ntation says.
>> Specifically, DNS servers are not used if allowed IPs isn=E2=80=99t 0.0.0=
.0/0.
>> The description isn't 100% accurate (or outdated), the DNS server is
>> used but the search domain isn't being set on the primary resolver.
>> Some have solved this issue by adding the search domains to the list
>> of matchDomains; dnsSettings.matchDomains =3D [""] +
>> dnsSettings.searchDomains. But that way the DNS server specified in
>> WireGuard is still the primary resolver for all DNS queries.
>> Here is a link on how OpenVPN handles this and I think it's how it
>> should work when not using AllowedIPs 0.0.0.0/0.
>> https://openvpn.net/faq/how-does-ios-interpret-pushed-dns-servers-and-sea=
rch-domains/
>> On a split-tunnel, where redirect-gateway is not pushed by the server,
>> and at least one pushed DNS server is present:
>> - route all DNS requests through pushed DNS server(s) if no added
>> search domains.
>> - route DNS requests for added search domains only, if at least one
>> added search domain.
>> Yours sincerely,
>> Matty
>> --
>> Hi Stephen,
>> A better solution to your problem would be to deploy DNSDIST:
>>         https://dnsdist.org/
>> I for one would hope that esoteric requests that address a solution
>> for less than 1% of the users would be rejected with the overall goal
>> of preventing feature creep and bloat.
>> Andrew
>=20
> --=20
> Andrew Fried
> afried@spamteq.com
> +1.703.667.4050 Office
> +1.703.362.0067 Mobile

