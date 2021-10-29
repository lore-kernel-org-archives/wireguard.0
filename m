Return-Path: <SRS0=4XTf=PR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42C6C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Oct 2021 21:10:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C553D60FE3
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Oct 2021 21:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C553D60FE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=slarew.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 032cac4f;
	Fri, 29 Oct 2021 21:07:43 +0000 (UTC)
Received: from mr85p00im-zteg06021601.me.com (mr85p00im-zteg06021601.me.com
 [17.58.23.187])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eb383212
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Oct 2021 21:07:41 +0000 (UTC)
Received: from smtpclient.apple (ip174-65-160-18.sd.sd.cox.net [174.65.160.18])
 by mr85p00im-zteg06021601.me.com (Postfix) with ESMTPSA id 8CCBC400547;
 Fri, 29 Oct 2021 21:07:39 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: Split DNS for macOS
From: Stephen Larew <stephen@slarew.net>
In-Reply-To: <K25247-14.1635527002@spamhaus.org>
Date: Fri, 29 Oct 2021 14:07:38 -0700
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <E3607380-8E46-42CC-80B5-BB38F206E9BC@slarew.net>
References: <20211028071638.88001-1-stephen@slarew.net>
 <0e80daf1-b4c2-b177-28ca-79e6575a339c@baywinds.org>
 <ED3FB4B3-96AD-4B98-86EC-D9F7999A530F@slarew.net>
 <K25247-14.1635527002@spamhaus.org>
To: Andrew Fried <afried@spamteq.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.790,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-10-29=5F06:2021-10-29=5F01,2021-10-29=5F06,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 clxscore=1030 mlxscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2110290117
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

> On Oct 29, 2021, at 10:03, Andrew Fried <afried@spamteq.com> wrote:
>=20
>> On Oct 29, 2021, at 08:33, Stephen Larew <stephen@slarew.net> wrote:
>>=20
>>> On Oct 28, 2021, at 02:58, Bruce Ferrell <bferrell@baywinds.org> =
wrote:
>>>=20
>>> On 10/28/21 12:16 AM, Stephen Larew wrote:
>>>> For many months now, I have been running a patched WireGuard macOS =
app
>>>> that enables a split DNS configuration. I would like to try to =
upstream
>>>> my patches for split DNS.
>>>>=20
>>>> There has been some interest in this patch:
>>>> - "Mac APP DNS Search Domain" thread from July and August 2021 [1]
>>>> - A commenter on my GitHub fork of wireguard-apple.
>>>>=20
>>>> What is split DNS? It allows sending DNS queries to a specific =
server
>>>> based on the domain name. Systemd-resolved calls it a routing =
domain.
>>>> Apple's Network Extension framework calls it a match domain.  Split =
DNS
>>>> is especially useful for internal DNS servers.
>>>>=20
>>>> For example, if corp.example.com is a routing domain for the DNS =
server
>>>> at 192.0.2.1 (only accessible over WireGuard), then
>>>> server.corp.example.com is resolved using 192.0.2.1 while
>>>> www.example.com is resolved using some other DNS resolver =
(depending on
>>>> the other network settings in macOS).
>>>>=20
>>>> The proposed patch adds new syntax to the wg-quick DNS=3D line.
>>>> Specifically, a tilde prefixed domain is treated as a routing =
domain.
>>>> Multiple routing domains can be added.
>>>>=20
>>>> Limitations:
>>>> - Needs modifications to iOS UI to work on iOS.
>>>> - Only matching routing domains are sent to the DNS servers =
specified in
>>>>  the DNS=3D config line.  No separate fallback catch-all DNS server =
can
>>>>  be set.
>>>> - Routing/match domains are also included in the list of search =
domains.
>>>>  This could be changed with the matchDomainsNoSearch API, but =
lacking
>>>>  more UI or config file changes to expose this option to the user, =
I
>>>>  went with the default.
>>>>=20
>>>> [1] =
https://lore.kernel.org/wireguard/20210810074232.aah5ktq5yzysaaey@SvensMac=
BookAir-2.local/T/
>>>> [2] =
https://github.com/slarew/wireguard-apple/commit/6ebc356d9e11ab91443e06de5=
e89f1af57fcdff8
>>>=20
>>> That seems to be a redefinition of the existing definition of split =
DNS.
>>>=20
>>> Most usually, split DNS is done at the DNS server and different =
zones are served to the resolver based on various criteria... Usually =
the origination IP of the query;  If the query comes from a client on =
your LAN, or a particular subnet, the contents of a particular, private, =
zone are returned.  If the query comes from, say the internet,  a public =
zone is returned.
>>>=20
>>> YOUR description, is how DNS works in general... Except  your patch =
also seems to either bypass the resolver libraries or wedge itself in =
front of them The system resolver libraries well tested and understood =
and they handle the following very nicely.
>>>=20
>>> There is the issue of what happens with large DNS responses.  Any =
DNS response over 512 bytes UDP fails and is required to be retried as a =
TCP query, which can handle the large response.  It's late and I'm too =
tired to look it up, but there IS an RFC for this.
>>>=20
>>> It's a little known issue, but I've seen it when working with other =
VPN products that ignored/didn't understand the behavior. The results =
weren't pretty and really embarrassing.
>>>=20
>>> Systemd has a bad habit of re-inventing the wheel... Badly. =
Eventually it get's sorted, but is that really progress? In the long =
haul, "move fast and break things" is a MAJOR pita for the vast majority =
of us.  But some like it.
>>>=20
>>> For some real fun, look into DHCPCD.  It faithfully implements a =
particular RFC.  In some networking environments using VPNs, it breaks =
routing horribly.... But it meets the RFC.  You'll find it in Raspbian =
by default, and most other Debian derived distros.  I automatically rip =
it out and replace it with the also available ISC DHCP client.  That one =
is fully compatible with Windows, OS X, iOS, and every android and smart =
device I could test it with.  A DHCP server configured to be compatible =
with DHCPCD broke all of the previously named.
>>>=20
>>> I'm giving this opinion away for free, so it's worth what you paid =
for it.
>>=20
>> Regardless of naming or definitions, I think the ability for a *local =
device* to route DNS queries to different DNS servers based on domain =
matching criteria is certainly useful. It=E2=80=99s not always possible =
or desirable to control and configure an upstream DNS server. Hence, =
this patch enables the local device to do split DNS.
>>=20
>> To be clear, this patch does not bypass or wedge around anything. In =
fact, it configures the native macOS DNS settings in the appropriate =
manner to effect a split DNS configuration.
>>=20
>> As a result of controlling the native macOS DNS resolution logic, any =
feature, absent or present, in the macOS DNS resolver libraries should =
be unaffected. This includes the large DNS response and TCP behavior. I =
do not expect the small/large UDP/TCP DNS features to change behavior =
when using a split DNS configuration as proposed in this patch.
>>=20
>> -Stephen
>=20
> Hi Stephen,
>=20
> A better solution to your problem would be to deploy DNSDIST:
> 	https://dnsdist.org/
>=20
> I for one would hope that esoteric requests that address a solution =
for less than 1% of the users would be rejected with the overall goal of =
preventing feature creep and bloat.
>=20
> Andrew

DNSDIST may allow (I have not tried) one to create a split DNS scenario, =
but it is an extra piece of software that would need to be discovered, =
installed, configured, and maintained by a user or system administrator. =
I do not believe it would properly integrate with the macOS DNS =
resolution machinery. I do not believe it is a better solution to the =
problem.

As I understand it, under some circumstances, the Tailscale macOS app =
also implements split DNS in roughly the same manner as done in my =
patch. Namely, the tailscale app appears to use the Network Extension =
APIs to directly integrate with the macOS DNS resolution machinery. =
Perhaps the relevant difference is that tailscale approaches =
configuration differently (not based on wg-quick) than the WireGuard =
macOS app.

I do not have statistics or polling on who desires this split DNS =
feature. I have received private and public requests to upstream the =
feature. Tailscale also implements split DNS; presumable customers =
demand it. I suspect if the feature was available to users of the =
WireGuard app, then it would be used with precision to great effect. =
Users who do not need this split DNS feature do not lose any previous =
functionality in the macOS WireGuard app.

Personally, my one hesitation with this patch is that, as currently =
implemented, a new syntax is added to the wg-quick config file (tilde =
prefixed route/match domains). My patch does not address compatibility =
issues nor does it add documentation to wg-quick for the new syntax.

-Stephen=
