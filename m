Return-Path: <SRS0=+otM=PW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F14C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 10:57:09 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 335AE6103B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 10:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 335AE6103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ct.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 32851442;
	Wed, 3 Nov 2021 10:53:22 +0000 (UTC)
Received: from relay.heise.de (relay.heise.de [2a00:e68:14:800::19:19])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a9c9ee57
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 30 Oct 2021 21:01:00 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: Split DNS for macOS
From: Dusan Zivadinovic <dz@ct.de>
In-Reply-To: <E3607380-8E46-42CC-80B5-BB38F206E9BC@slarew.net>
Date: Sat, 30 Oct 2021 23:00:38 +0200
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <C824C50B-843C-4C77-B7C3-62E850B73CB0@ct.de>
References: <20211028071638.88001-1-stephen@slarew.net>
 <0e80daf1-b4c2-b177-28ca-79e6575a339c@baywinds.org>
 <ED3FB4B3-96AD-4B98-86EC-D9F7999A530F@slarew.net>
 <K25247-14.1635527002@spamhaus.org>
 <E3607380-8E46-42CC-80B5-BB38F206E9BC@slarew.net>
To: Stephen Larew <stephen@slarew.net>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-TMScanToken: 453c0e49fdd1e337ceb918501f8f6e0666bed1e4
X-TMASE-Version: DDEI-3.5-8.6.1018-26500.003
X-TMASE-Result: 10--1.619500-10.000000
X-TMASE-MatchedRID: IeZYkn8zfFpWWOy3obJL+2vDT+wC7pqFElLH7tCb90oZSz1vvG+0mqvo
 lbfO7oa0btAD8fpuJtMcDCbCSEq3lNaZz6pl1Mhet6hFzXOwpPlBSY6kx+M18WBSbru26cn6Mdd
 NDcMzD2fH2iVVnOYNp5lkW/4zIRSNQ8+LSipOfwTxryc2N+6fmvg/s23WPBIpIFWQH/JudNjGXS
 36jTcV+ggXkgFGwPXCK+5FmIUWylR0AdYYTJWxRN5x7RpGJf1aDvc/j9oMIgX5+tteD5RzhbBXu
 d9Ra+w0UjwC4PXX8Bo8aQofJD94ANtn1etZCRwy2cOr5oNmMZle8fEpBZ2EVMGx/mq3jiNnMEGU
 YlC3/bftazGGarT1BAEh8ANbLEbyJmkDHQnMKB5v+/LIBBauP8TGavmGo0vWMYkmNIO7+hYRtaG
 eRi2iOsUKZFvJm5zfhyqLaa4EBlv4miWUEaTQPnpRh12Siy9rQR7lWMXPA1vyN+XEEoySvtGvJV
 PfEl1Ikx8DrRF4EzWM2L7lMaFHZZ7ghrpuj+9iGKC1HVmafmMoOyQJh7uOKBHfiujuTbedKKi9X
 IZVdsWnbai5eMzQpa3z9JIf5dPSRQL375LzcCsD2WXLXdz+ARMDsAIXSN0DevFaYkHe0Bht/S8J
 0TkT+RnO3iVn8eXNmEw+qTWEPMhDl7IQyR6OyXbqbYm4qoGdAajW+EL+laMINpIFnbd6mr9Uo8X
 uHy63XYU84yyHWCuTox1acdgQnzVbiUNfabi0WTWEh5N2a9Fj0mUvAvV2DYawFn5SbGtbAMJcHO
 zzDuNafXC1NMQQtTUJ6kuOBFQ8XhIgqyFXxJeeAiCmPx4NwFkMvWAuahr8trNGq+WQEvSrusVRy
 4an8WBOE3yqmaU2F5iXm5LZACA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-TMASE-INERTIA: 0-0;;;;
X-Mailman-Approved-At: Wed, 03 Nov 2021 10:53:18 +0000
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

Hi list,

I would appreciate that, its a usefull feature.

Think of connecting to multiple remote VPN peers simultaneously,
and use different DNSes for certain domains in each VPN connection.

Just as an example, the iOS app DNSCloak also sports a split DNS =
function.

regards,

Dusan

> Am 29.10.2021 um 23:07 schrieb Stephen Larew <stephen@slarew.net>:
>=20
>> On Oct 29, 2021, at 10:03, Andrew Fried <afried@spamteq.com> wrote:
>>=20
>>> On Oct 29, 2021, at 08:33, Stephen Larew <stephen@slarew.net> wrote:
>>>=20
>>>> On Oct 28, 2021, at 02:58, Bruce Ferrell <bferrell@baywinds.org> =
wrote:
>>>>=20
>>>> On 10/28/21 12:16 AM, Stephen Larew wrote:
>>>>> For many months now, I have been running a patched WireGuard macOS =
app
>>>>> that enables a split DNS configuration. I would like to try to =
upstream
>>>>> my patches for split DNS.
>>>>>=20
>>>>> There has been some interest in this patch:
>>>>> - "Mac APP DNS Search Domain" thread from July and August 2021 [1]
>>>>> - A commenter on my GitHub fork of wireguard-apple.
>>>>>=20
>>>>> What is split DNS? It allows sending DNS queries to a specific =
server
>>>>> based on the domain name. Systemd-resolved calls it a routing =
domain.
>>>>> Apple's Network Extension framework calls it a match domain.  =
Split DNS
>>>>> is especially useful for internal DNS servers.
>>>>>=20
>>>>> For example, if corp.example.com is a routing domain for the DNS =
server
>>>>> at 192.0.2.1 (only accessible over WireGuard), then
>>>>> server.corp.example.com is resolved using 192.0.2.1 while
>>>>> www.example.com is resolved using some other DNS resolver =
(depending on
>>>>> the other network settings in macOS).
>>>>>=20
>>>>> The proposed patch adds new syntax to the wg-quick DNS=3D line.
>>>>> Specifically, a tilde prefixed domain is treated as a routing =
domain.
>>>>> Multiple routing domains can be added.
>>>>>=20
>>>>> Limitations:
>>>>> - Needs modifications to iOS UI to work on iOS.
>>>>> - Only matching routing domains are sent to the DNS servers =
specified in
>>>>> the DNS=3D config line.  No separate fallback catch-all DNS server =
can
>>>>> be set.
>>>>> - Routing/match domains are also included in the list of search =
domains.
>>>>> This could be changed with the matchDomainsNoSearch API, but =
lacking
>>>>> more UI or config file changes to expose this option to the user, =
I
>>>>> went with the default.
>>>>>=20
>>>>> [1] =
https://lore.kernel.org/wireguard/20210810074232.aah5ktq5yzysaaey@SvensMac=
BookAir-2.local/T/
>>>>> [2] =
https://github.com/slarew/wireguard-apple/commit/6ebc356d9e11ab91443e06de5=
e89f1af57fcdff8
>>>>=20
>>>> That seems to be a redefinition of the existing definition of split =
DNS.
>>>>=20
>>>> Most usually, split DNS is done at the DNS server and different =
zones are served to the resolver based on various criteria... Usually =
the origination IP of the query;  If the query comes from a client on =
your LAN, or a particular subnet, the contents of a particular, private, =
zone are returned.  If the query comes from, say the internet,  a public =
zone is returned.
>>>>=20
>>>> YOUR description, is how DNS works in general... Except  your patch =
also seems to either bypass the resolver libraries or wedge itself in =
front of them The system resolver libraries well tested and understood =
and they handle the following very nicely.
>>>>=20
>>>> There is the issue of what happens with large DNS responses.  Any =
DNS response over 512 bytes UDP fails and is required to be retried as a =
TCP query, which can handle the large response.  It's late and I'm too =
tired to look it up, but there IS an RFC for this.
>>>>=20
>>>> It's a little known issue, but I've seen it when working with other =
VPN products that ignored/didn't understand the behavior. The results =
weren't pretty and really embarrassing.
>>>>=20
>>>> Systemd has a bad habit of re-inventing the wheel... Badly. =
Eventually it get's sorted, but is that really progress? In the long =
haul, "move fast and break things" is a MAJOR pita for the vast majority =
of us.  But some like it.
>>>>=20
>>>> For some real fun, look into DHCPCD.  It faithfully implements a =
particular RFC.  In some networking environments using VPNs, it breaks =
routing horribly.... But it meets the RFC.  You'll find it in Raspbian =
by default, and most other Debian derived distros.  I automatically rip =
it out and replace it with the also available ISC DHCP client.  That one =
is fully compatible with Windows, OS X, iOS, and every android and smart =
device I could test it with.  A DHCP server configured to be compatible =
with DHCPCD broke all of the previously named.
>>>>=20
>>>> I'm giving this opinion away for free, so it's worth what you paid =
for it.
>>>=20
>>> Regardless of naming or definitions, I think the ability for a =
*local device* to route DNS queries to different DNS servers based on =
domain matching criteria is certainly useful. It=E2=80=99s not always =
possible or desirable to control and configure an upstream DNS server. =
Hence, this patch enables the local device to do split DNS.
>>>=20
>>> To be clear, this patch does not bypass or wedge around anything. In =
fact, it configures the native macOS DNS settings in the appropriate =
manner to effect a split DNS configuration.
>>>=20
>>> As a result of controlling the native macOS DNS resolution logic, =
any feature, absent or present, in the macOS DNS resolver libraries =
should be unaffected. This includes the large DNS response and TCP =
behavior. I do not expect the small/large UDP/TCP DNS features to change =
behavior when using a split DNS configuration as proposed in this patch.
>>>=20
>>> -Stephen
>>=20
>> Hi Stephen,
>>=20
>> A better solution to your problem would be to deploy DNSDIST:
>> 	https://dnsdist.org/
>>=20
>> I for one would hope that esoteric requests that address a solution =
for less than 1% of the users would be rejected with the overall goal of =
preventing feature creep and bloat.
>>=20
>> Andrew
>=20
> DNSDIST may allow (I have not tried) one to create a split DNS =
scenario, but it is an extra piece of software that would need to be =
discovered, installed, configured, and maintained by a user or system =
administrator. I do not believe it would properly integrate with the =
macOS DNS resolution machinery. I do not believe it is a better solution =
to the problem.
>=20
> As I understand it, under some circumstances, the Tailscale macOS app =
also implements split DNS in roughly the same manner as done in my =
patch. Namely, the tailscale app appears to use the Network Extension =
APIs to directly integrate with the macOS DNS resolution machinery. =
Perhaps the relevant difference is that tailscale approaches =
configuration differently (not based on wg-quick) than the WireGuard =
macOS app.
>=20
> I do not have statistics or polling on who desires this split DNS =
feature. I have received private and public requests to upstream the =
feature. Tailscale also implements split DNS; presumable customers =
demand it. I suspect if the feature was available to users of the =
WireGuard app, then it would be used with precision to great effect. =
Users who do not need this split DNS feature do not lose any previous =
functionality in the macOS WireGuard app.
>=20
> Personally, my one hesitation with this patch is that, as currently =
implemented, a new syntax is added to the wg-quick config file (tilde =
prefixed route/match domains). My patch does not address compatibility =
issues nor does it add documentation to wg-quick for the new syntax.
>=20
> -Stephen

