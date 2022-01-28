Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1A5C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 28 Jan 2022 05:23:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4900394b;
	Fri, 28 Jan 2022 05:23:35 +0000 (UTC)
Received: from mr85p00im-zteg06021501.me.com (mr85p00im-zteg06021501.me.com
 [17.58.23.183])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5830d928
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jan 2022 05:23:32 +0000 (UTC)
Received: from smtpclient.apple (cpe-70-95-39-162.san.res.rr.com
 [70.95.39.162])
 by mr85p00im-zteg06021501.me.com (Postfix) with ESMTPSA id D852427942CD
 for <wireguard@lists.zx2c4.com>; Fri, 28 Jan 2022 05:23:30 +0000 (UTC)
From: Stephen Larew <stephen@slarew.net>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: Split DNS for macOS
Date: Thu, 27 Jan 2022 21:23:29 -0800
References: <20211028071638.88001-1-stephen@slarew.net>
To: wireguard@lists.zx2c4.com
In-Reply-To: <20211028071638.88001-1-stephen@slarew.net>
Message-Id: <16E7589D-F36A-4CCD-A388-EA435C8A8D95@slarew.net>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 suspectscore=0 clxscore=1030 mlxscore=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2201280031
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

> On Oct 28, 2021, at 00:16, Stephen Larew <stephen@slarew.net> wrote:
>=20
> For many months now, I have been running a patched WireGuard macOS app
> that enables a split DNS configuration. I would like to try to =
upstream
> my patches for split DNS.
>=20
> There has been some interest in this patch:
> - "Mac APP DNS Search Domain" thread from July and August 2021 [1]
> - A commenter on my GitHub fork of wireguard-apple.
>=20
> What is split DNS? It allows sending DNS queries to a specific server
> based on the domain name. Systemd-resolved calls it a routing domain.
> Apple's Network Extension framework calls it a match domain.  Split =
DNS
> is especially useful for internal DNS servers.
>=20
> For example, if corp.example.com is a routing domain for the DNS =
server
> at 192.0.2.1 (only accessible over WireGuard), then
> server.corp.example.com is resolved using 192.0.2.1 while
> www.example.com is resolved using some other DNS resolver (depending =
on
> the other network settings in macOS).
>=20
> The proposed patch adds new syntax to the wg-quick DNS=3D line.
> Specifically, a tilde prefixed domain is treated as a routing domain.
> Multiple routing domains can be added.
>=20
> Limitations:
> - Needs modifications to iOS UI to work on iOS.
> - Only matching routing domains are sent to the DNS servers specified =
in
>  the DNS=3D config line.  No separate fallback catch-all DNS server =
can
>  be set.
> - Routing/match domains are also included in the list of search =
domains.
>  This could be changed with the matchDomainsNoSearch API, but lacking
>  more UI or config file changes to expose this option to the user, I
>  went with the default.
>=20
> [1] =
https://lore.kernel.org/wireguard/20210810074232.aah5ktq5yzysaaey@SvensMac=
BookAir-2.local/T/
> [2] =
https://github.com/slarew/wireguard-apple/commit/6ebc356d9e11ab91443e06de5=
e89f1af57fcdff8

Thanks everyone for your opinions and feedback. Here=E2=80=99s my =
summary:

- DNS configuration is nuanced, fragmented, and platform dependent.

- Split DNS can be accomplished in several ways:
  - Via the native macOS DNS resolution machinery =
(NEDNSSettings.matchDomains in my patch)
  - Via a local or upstream non-platform-native DNS resolver

- Demand for split DNS exists. Other VPN apps (e.g. Tailscale and =
DNSCloak) allow setting split DNS.

--

I would appreciate some feedback from the WireGuard maintainers on next =
steps. Thanks ahead.

I=E2=80=99ll address some feedback below.

> On Nov 3, 2021, at 02:15, Harald Dunkel <harald.dunkel@aixigo.com> =
wrote:
>=20
> Hi folks,
>=20
> I really like this patch. Currently DNS on MacOS is unable to resolve
> both my local DNS names and the domain in the office in parallel, if
> Wireguard is enabled. I have to use somehost.local to fall back to
> zeroconf for my LAN as a workaround, which is pretty annoying.
>=20
> My suggestion would be to set SupplementalMatchDomains instead(!) of
> SearchDomains, using the current config file syntax without '~'. Since
> SupplementalMatchDomainsNoSearch is disabled by default, setting
> SupplementalMatchDomains is sufficient to configure both lists. See
>=20
> =
https://developer.apple.com/business/documentation/Configuration-Profile-R=
eference.pdf
>=20
> This has to be verified, of course.
>=20
> Regards
> Harri


Harri, it sounds to me like SupplementalMatchDomains is functionally the =
same as NEDNSSettings.matchDomains. The difference is that =
SupplementalMatchDomains is specified in Apple=E2=80=99s configuration =
profiles instead of thru the NEDNSSettings.matchDomains API (by way of a =
wg-quick syntax extension in my patch). If the WireGuard macOS app =
supported Apple=E2=80=99s configuration profiles (I don=E2=80=99t =
believe it does but I may be mistaken), then a configuration profile =
would conveniently avoid the extended wg-quick syntax in my patch. =
However, I think configuration profiles are less accessible to the =
average user.

> On Nov 3, 2021, at 14:34, Andrew Fried <afried@spamteq.com> wrote:
>=20
> Basically, what I'm suggesting is that DNS servers handle DNS and =
wireguard handle routing/transport.  Adding VPN functionality to a =
nameserver or dns capabilities to Wireguard adds complexities that can =
be better handled elsewhere.
>=20
> What makes Wireguard so good is that it does one thing and does it =
really, really well.
>=20
> Andrew

Andrew, to your point, alternative DNS solutions exist and can be =
deployed in many ways.  WireGuard itself is not a DNS solution.  That =
said, wg-quick style configuration (used by the WireGuard macOS app) =
already does basic DNS configuration.  My patch adds a small extension =
to wg-quick syntax (tilde prefixed domains) to make certain split DNS =
scenarios possible.

Crucially, my patch actually integrates directly into macOS=E2=80=99s =
DNS machinery. No third party software or external network DNS servers =
need apply.

> On Nov 5, 2021, at 21:54, David Anderson <dave@natulte.net> wrote:
>=20
> Hi, Tailscale person here.

Dave, your technical details sound right based on what I remember from =
my own experimentation.

-Stephen

