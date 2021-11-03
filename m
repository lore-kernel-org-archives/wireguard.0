Return-Path: <SRS0=+otM=PW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB21BC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 10:57:12 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27DE56103B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Nov 2021 10:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 27DE56103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb5cd925;
	Wed, 3 Nov 2021 10:53:28 +0000 (UTC)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [2607:f8b0:4864:20::434])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ecd0e218
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Nov 2021 09:43:06 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id x64so1740978pfd.6
 for <wireguard@lists.zx2c4.com>; Wed, 03 Nov 2021 02:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=sU7tswqjjo/tSwXzRbs4bvSDtAtaNCPwhburiT/fH4s=;
 b=RYl9wzH++A3xbGeII4/kIyVaLe/QCCfHYtrY14JVjNaHHVBo9L/XsI1a2oIIHfSSlq
 U+iT1Ml0PcB9vSUvAtZyfvA8MW3hIWzVlBnGdVyKQpLr5Sc5e+XjrKw5SwdtX3ycDQCL
 qzPAixlVME51PuGYDGgdvj5dbk5quhzGN7bqgxhszw8/2wHmpSWqbmNQKaT6smS8Enlp
 jt5cu6vA037G25PbX64KTH4xnfFk5fOUHCWL0fxaluzmArfkehHmoc85Rs+eBZz4LDpA
 4y6z2kU+8plTa3OhnIe9lwZKtBuy3cfYKquDa73SSBsp3tw0ejQ/IUyXiyZKW5K7rqXv
 xktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=sU7tswqjjo/tSwXzRbs4bvSDtAtaNCPwhburiT/fH4s=;
 b=uTY35IJ9QBxf1GY3ruFptwkcTIASHI6tSGKAJzr/XA3MHwZ5sqApwCgfKQizxXTYjl
 t4EY6c7/rqS91+FXiThbWidLgsza0ME0VunoNuY3bsKLRRqnzLE9U2XPAZy8GyL90+Ph
 rX/3XRM500klJjun4hSS2wxvHSSV65LX/T/O6cyrlNP7yUNujXEVvK/WgCOsY3FWsG4F
 06MIKugXDI6zOQ1LNLZeFUJ3kj8wS1j7DV80DMIZropxgk/JK19Jc6/3ZT1IcZpKP+zP
 f6K2K8WWtdlg0MufYXHyyCzq0/83scu/yV7dn5XKJA9Xj8H/ATsM9XISOG0HI/Q4ZN2w
 YU7w==
X-Gm-Message-State: AOAM533oWe5s+DKckMV9TuJj8MLX4dTDIKw88m/yVcHihAqTNUARqX/A
 UdF1iolGoLBHUOGR3Qv3Rdfvy3FoqKW1NRDt9bcoGfu7tDw=
X-Google-Smtp-Source: ABdhPJyy6CzpOF34VTanLfOzKODy5aJLi7m0HTO3xE2gn0krwBdp1TbIYf3l2tCoDsDvcxVPOyPoAIQ4qPF1uv8Ud+I=
X-Received: by 2002:a65:6792:: with SMTP id e18mr16067386pgr.318.1635932583931; 
 Wed, 03 Nov 2021 02:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211028071638.88001-1-stephen@slarew.net>
 <0e80daf1-b4c2-b177-28ca-79e6575a339c@baywinds.org>
 <ED3FB4B3-96AD-4B98-86EC-D9F7999A530F@slarew.net>
 <K25247-14.1635527002@spamhaus.org>
 <E3607380-8E46-42CC-80B5-BB38F206E9BC@slarew.net>
 <54f3f2a6-7c58-dc42-56bd-fffe74bc3a18@aixigo.com>
In-Reply-To: <54f3f2a6-7c58-dc42-56bd-fffe74bc3a18@aixigo.com>
From: Matty Driessen <mhp.driessen@gmail.com>
Date: Wed, 3 Nov 2021 10:42:52 +0100
Message-ID: <CAHsVW7N0EYtUegNd278fFigGv6oucE5+NbkuScKNGnHfaOau5Q@mail.gmail.com>
Subject: Re: Split DNS for macOS
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hello,

I just want to chime in here and say that I think the current
implementation of search domains is simply not working the way it
should on the MacOS client.

My use case is pretty common, an internal DNS server that has entries
for internal servers. I defined a search domain in the WireGuard
configuration; DNS =3D 10.13.13.1 mydomain.internal. The search domain
is for convenience, so I can just use the servername instead of
servername.mydomain.internal. Now this works fine when I route all the
traffic through the VPN (AllowedIPs =3D 0.0.0.0/0) but the search domain
is completely ignored when I only route the traffic I need to
(AllowedIPs =3D 10.13.13.0/24 192.168.0.0/24).

I don't think this is a configuration error on my side. The DNS
responds fine when using servername.mydomain.internal. This problem is
even mentioned in the "WireGuard macOS & iOS TODO List"
9. matchDomains=3D[=E2=80=9C=E2=80=9D] doesn=E2=80=99t do what the document=
ation says.
Specifically, DNS servers are not used if allowed IPs isn=E2=80=99t 0.0.0.0=
/0.

The description isn't 100% accurate (or outdated), the DNS server is
used but the search domain isn't being set on the primary resolver.
Some have solved this issue by adding the search domains to the list
of matchDomains; dnsSettings.matchDomains =3D [""] +
dnsSettings.searchDomains. But that way the DNS server specified in
WireGuard is still the primary resolver for all DNS queries.

Here is a link on how OpenVPN handles this and I think it's how it
should work when not using AllowedIPs 0.0.0.0/0.

https://openvpn.net/faq/how-does-ios-interpret-pushed-dns-servers-and-searc=
h-domains/
On a split-tunnel, where redirect-gateway is not pushed by the server,
and at least one pushed DNS server is present:
- route all DNS requests through pushed DNS server(s) if no added
search domains.
- route DNS requests for added search domains only, if at least one
added search domain.

Regards,
Matty

On Wed, Nov 3, 2021 at 10:20 AM Harald Dunkel <harald.dunkel@aixigo.com> wr=
ote:
>
> Hi folks,
>
> I really like this patch. Currently DNS on MacOS is unable to resolve
> both my local DNS names and the domain in the office in parallel, if
> Wireguard is enabled. I have to use somehost.local to fall back to
> zeroconf for my LAN as a workaround, which is pretty annoying.
>
> My suggestion would be to set SupplementalMatchDomains instead(!) of
> SearchDomains, using the current config file syntax without '~'. Since
> SupplementalMatchDomainsNoSearch is disabled by default, setting
> SupplementalMatchDomains is sufficient to configure both lists. See
>
> https://developer.apple.com/business/documentation/Configuration-Profile-=
Reference.pdf
>
> This has to be verified, of course.
>
>
> Regards
> Harri
>
>
>
> On 2021-10-29 23:07:38, Stephen Larew wrote:
> >> On Oct 29, 2021, at 10:03, Andrew Fried <afried@spamteq.com> wrote:
> >>
> >>> On Oct 29, 2021, at 08:33, Stephen Larew <stephen@slarew.net> wrote:
> >>>
> >>>> On Oct 28, 2021, at 02:58, Bruce Ferrell <bferrell@baywinds.org> wro=
te:
> >>>>
> >>>> On 10/28/21 12:16 AM, Stephen Larew wrote:
> >>>>> For many months now, I have been running a patched WireGuard macOS =
app
> >>>>> that enables a split DNS configuration. I would like to try to upst=
ream
> >>>>> my patches for split DNS.
> >>>>>
> >>>>> There has been some interest in this patch:
> >>>>> - "Mac APP DNS Search Domain" thread from July and August 2021 [1]
> >>>>> - A commenter on my GitHub fork of wireguard-apple.
> >>>>>
> >>>>> What is split DNS? It allows sending DNS queries to a specific serv=
er
> >>>>> based on the domain name. Systemd-resolved calls it a routing domai=
n.
> >>>>> Apple's Network Extension framework calls it a match domain.  Split=
 DNS
> >>>>> is especially useful for internal DNS servers.
> >>>>>
> >>>>> For example, if corp.example.com is a routing domain for the DNS se=
rver
> >>>>> at 192.0.2.1 (only accessible over WireGuard), then
> >>>>> server.corp.example.com is resolved using 192.0.2.1 while
> >>>>> www.example.com is resolved using some other DNS resolver (dependin=
g on
> >>>>> the other network settings in macOS).
> >>>>>
> >>>>> The proposed patch adds new syntax to the wg-quick DNS=3D line.
> >>>>> Specifically, a tilde prefixed domain is treated as a routing domai=
n.
> >>>>> Multiple routing domains can be added.
> >>>>>
> >>>>> Limitations:
> >>>>> - Needs modifications to iOS UI to work on iOS.
> >>>>> - Only matching routing domains are sent to the DNS servers specifi=
ed in
> >>>>>   the DNS=3D config line.  No separate fallback catch-all DNS serve=
r can
> >>>>>   be set.
> >>>>> - Routing/match domains are also included in the list of search dom=
ains.
> >>>>>   This could be changed with the matchDomainsNoSearch API, but lack=
ing
> >>>>>   more UI or config file changes to expose this option to the user,=
 I
> >>>>>   went with the default.
> >>>>>
> >>>>> [1] https://lore.kernel.org/wireguard/20210810074232.aah5ktq5yzysaa=
ey@SvensMacBookAir-2.local/T/
> >>>>> [2] https://github.com/slarew/wireguard-apple/commit/6ebc356d9e11ab=
91443e06de5e89f1af57fcdff8
> >>>>
> >>>> That seems to be a redefinition of the existing definition of split =
DNS.
> >>>>
> >>>> Most usually, split DNS is done at the DNS server and different zone=
s are served to the resolver based on various criteria... Usually the origi=
nation IP of the query;  If the query comes from a client on your LAN, or a=
 particular subnet, the contents of a particular, private, zone are returne=
d.  If the query comes from, say the internet,  a public zone is returned.
> >>>>
> >>>> YOUR description, is how DNS works in general... Except  your patch =
also seems to either bypass the resolver libraries or wedge itself in front=
 of them The system resolver libraries well tested and understood and they =
handle the following very nicely.
> >>>>
> >>>> There is the issue of what happens with large DNS responses.  Any DN=
S response over 512 bytes UDP fails and is required to be retried as a TCP =
query, which can handle the large response.  It's late and I'm too tired to=
 look it up, but there IS an RFC for this.
> >>>>
> >>>> It's a little known issue, but I've seen it when working with other =
VPN products that ignored/didn't understand the behavior. The results weren=
't pretty and really embarrassing.
> >>>>
> >>>> Systemd has a bad habit of re-inventing the wheel... Badly. Eventual=
ly it get's sorted, but is that really progress? In the long haul, "move fa=
st and break things" is a MAJOR pita for the vast majority of us.  But some=
 like it.
> >>>>
> >>>> For some real fun, look into DHCPCD.  It faithfully implements a par=
ticular RFC.  In some networking environments using VPNs, it breaks routing=
 horribly.... But it meets the RFC.  You'll find it in Raspbian by default,=
 and most other Debian derived distros.  I automatically rip it out and rep=
lace it with the also available ISC DHCP client.  That one is fully compati=
ble with Windows, OS X, iOS, and every android and smart device I could tes=
t it with.  A DHCP server configured to be compatible with DHCPCD broke all=
 of the previously named.
> >>>>
> >>>> I'm giving this opinion away for free, so it's worth what you paid f=
or it.
> >>>
> >>> Regardless of naming or definitions, I think the ability for a *local=
 device* to route DNS queries to different DNS servers based on domain matc=
hing criteria is certainly useful. It=E2=80=99s not always possible or desi=
rable to control and configure an upstream DNS server. Hence, this patch en=
ables the local device to do split DNS.
> >>>
> >>> To be clear, this patch does not bypass or wedge around anything. In =
fact, it configures the native macOS DNS settings in the appropriate manner=
 to effect a split DNS configuration.
> >>>
> >>> As a result of controlling the native macOS DNS resolution logic, any=
 feature, absent or present, in the macOS DNS resolver libraries should be =
unaffected. This includes the large DNS response and TCP behavior. I do not=
 expect the small/large UDP/TCP DNS features to change behavior when using =
a split DNS configuration as proposed in this patch.
> >>>
> >>> -Stephen
> >>
> >> Hi Stephen,
> >>
> >> A better solution to your problem would be to deploy DNSDIST:
> >>      https://dnsdist.org/
> >>
> >> I for one would hope that esoteric requests that address a solution fo=
r less than 1% of the users would be rejected with the overall goal of prev=
enting feature creep and bloat.
> >>
> >> Andrew
> >
> > DNSDIST may allow (I have not tried) one to create a split DNS scenario=
, but it is an extra piece of software that would need to be discovered, in=
stalled, configured, and maintained by a user or system administrator. I do=
 not believe it would properly integrate with the macOS DNS resolution mach=
inery. I do not believe it is a better solution to the problem.
> >
> > As I understand it, under some circumstances, the Tailscale macOS app a=
lso implements split DNS in roughly the same manner as done in my patch. Na=
mely, the tailscale app appears to use the Network Extension APIs to direct=
ly integrate with the macOS DNS resolution machinery. Perhaps the relevant =
difference is that tailscale approaches configuration differently (not base=
d on wg-quick) than the WireGuard macOS app.
> >
> > I do not have statistics or polling on who desires this split DNS featu=
re. I have received private and public requests to upstream the feature. Ta=
ilscale also implements split DNS; presumable customers demand it. I suspec=
t if the feature was available to users of the WireGuard app, then it would=
 be used with precision to great effect. Users who do not need this split D=
NS feature do not lose any previous functionality in the macOS WireGuard ap=
p.
> >
> > Personally, my one hesitation with this patch is that, as currently imp=
lemented, a new syntax is added to the wg-quick config file (tilde prefixed=
 route/match domains). My patch does not address compatibility issues nor d=
oes it add documentation to wg-quick for the new syntax.
> >
> > -Stephen
> >
>
