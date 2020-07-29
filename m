Return-Path: <SRS0=PVz2=BK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58249C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 Jul 2020 14:15:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF9CE206DA
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 Jul 2020 14:15:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5tZidtR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF9CE206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96b99007;
	Fri, 31 Jul 2020 13:51:21 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [2607:f8b0:4864:20::d2e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3417e0d8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jul 2020 15:48:25 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id z6so25145339iow.6
 for <wireguard@lists.zx2c4.com>; Wed, 29 Jul 2020 09:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kCSYrRuY+SAPfSEG4b6DtFNQkq/0f9MiCEH9btIEz8U=;
 b=Q5tZidtRxuQA92zHj3yiE83hUqlAEz0+2hAUTlQpPDKoEJHkM0Bhs7/dEMzWvonZ3F
 ewnBF4i65ZstBU2pDtzq/fe2ZGChRPtXos5rMU5w/JgdnfjUKGBiptDyPS9liK07z2ly
 BhkQZl4vLLM81oT47RStY9Ud7IRY9vKoMLJlORUUumLNxaMxiL9AEpXoRmJFlSXlRbgw
 FQDCSGstqrslIRQ3+vW3EPQ5Yl1+UKHCvIGZ6S4ufMi+lqVHln7kQCFQjxhcxzJygJ8a
 EGwhvmQX6iiS1FEqQka/dwo80sPdzFF/e0dr1P56K9vE1OkMjiO6i8pMkKou8QH2poFb
 5nOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kCSYrRuY+SAPfSEG4b6DtFNQkq/0f9MiCEH9btIEz8U=;
 b=f/HZKZdGsn/l5yHbp/xVqExBZ7GZo++9zKvGLTByvmp704oZCXeMs3NRXlRZSkhwEW
 a7JpYRR+RtZhFwTYMqMyr896ZXZwycXNoL6qUqUASifqI2uYHLDutWYHdXcIiRcA+kgI
 g1zemYlyXXjOqzF7Yk5AO+wXHDaQ/IeZtmUBLwPZS75hxmyTBsjfaMCHSqr5bvGMv0Dc
 d4uRE5orG0zPyHfITbe8MWL2CZs1JRv0ssCUcBXXbDeJol+2ahp+9Ij/I/rXrX/dxLFU
 GC+X3kI9g024qX5mp/JzRaKkki44HHH0yOwk3b8vletkbQR7nomPDfNBctKK8z+Nnhix
 5png==
X-Gm-Message-State: AOAM530jmBRu7GctgsnzSByiqBfHHHrZPHneLIlQnatNxFLXtmbChwE7
 F448D1f9Fq1YPJZ5TMYsoz5ITeYoA3jC7ZOoOHk=
X-Google-Smtp-Source: ABdhPJzmgm9ZvVwTgZMujl2jkEsCCYRkjateURTppgVdkjRnmje5NH+uinUfqJJ8t9J4yiVlGO2meesdVf+CkvcoxCw=
X-Received: by 2002:a05:6602:150:: with SMTP id
 v16mr5532764iot.80.1596039120539; 
 Wed, 29 Jul 2020 09:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <02830f08-9e6f-a9f1-54c3-43758e95758f@gmail.com>
 <26A86FD2-5A2D-49DC-A140-2E4B43213936@tomcsanyi.net>
 <ECF44AE9-A461-4252-8A33-B2A813280493@gmail.com>
In-Reply-To: <ECF44AE9-A461-4252-8A33-B2A813280493@gmail.com>
From: M Rubon <rubonmtz@gmail.com>
Date: Wed, 29 Jul 2020 12:11:50 -0400
Message-ID: <CAJ24mqCQ+jyzZ13ji+z31-=Rj1rfBrLDtq1bZMAMO+rgsxKXCg@mail.gmail.com>
Subject: Re: Confused about AllowedIPs meaning?
To: Rich Brown <richb.hanover@gmail.com>
Cc: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>,
 Gunnar Niels <gunnar.s.niels@gmail.com>, wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 31 Jul 2020 15:51:20 +0200
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

I had similar questions about AllowedIPs

man wg    gives a slightly muddled definition of AllowedIPs
       AllowedIPs  =E2=80=94 a comma-separated list of IP (v4 or v6) addres=
ses
with CIDR masks from which incoming traffic
       from this peer is allowed and to which outgoing traffic  for
this  peer  is  directed.

The following is my rewriten slightly clearer definition, based on the
information at https://www.wireguard.com/#cryptokey-routing,
       AllowedIPs  =E2=80=94 a comma-separated list of IP (v4 or v6) addres=
ses
with CIDR masks which are allowed as
       destination addresses when sending via this peer and are
allowed as source addresses when receiving via this peer.

I hope this helps, and please correct me if any of this is wrong.

On Tue, 28 Jul 2020 at 17:45, Rich Brown <richb.hanover@gmail.com> wrote:
>
> I'm new to WireGuard (and not an expert on routing), but here's my operat=
ional understanding of the definition of AllowedIPs:
>
> ---
> AllowedIPs is the set of addresses that your WireGuard peer will send acr=
oss the tunnel to its peer.
>
> When your computer is about to send a packet out, it compares the destina=
tion address with WireGuard's list of AllowedIPs. If there's a match, the p=
acket goes out the WireGuard tunnel. Otherwise, the packet uses the default=
 routing process.
>
> In your case (joining private two networks together), you would list the =
subnet range(s) of the *other* network in *this* peer. If you want to send =
all traffic through the WireGuard tunnel (say, if you're in a coffee shop),=
 you can include 0.0.0.0/0 (specifies all IPv4 addresses) and ::/0 (to spec=
ify all IPv6 addresses).
> ---
>
> I would appreciate having someone else review that definition for correct=
ness. (I also have a blog posting that talks about the WireGuard GUI on mac=
OS - https://randomneuronsfiring.com/wireguard-on-macos/ Comments are welco=
me there, as well.) Thanks.
>
> Rich
>
> > On Jul 28, 2020, at 5:12 PM, Tomcsanyi, Domonkos <domi@tomcsanyi.net> w=
rote:
> >
> >
> >> 2020. j=C3=BAl. 28. d=C3=A1tummal, 18:02 id=C5=91pontban Gunnar Niels =
<gunnar.s.niels@gmail.com> =C3=ADrta:
> >>
> >> =EF=BB=BFHello, I'm new to wireguard and have been experimenting with =
it in my home lab.
> >> I'm interesting in using it to join two home networks (192.168.2.0/24 =
and
> >> 192.168.4.0/24). They're typical home networks in two physically diffe=
rent
> >> locations, each with their own gateways to the internet. I'd like for =
the
> >> machines on each network to use their default gateway for internet acc=
ess, but
> >> configure things so they use a simple linux machine (raspberry pi) to =
route
> >> to the other subnet over wireguard is the destination is the opposite =
subnet.
> >>
> >> One wireguard node is exposed via an endpoint with a dns A record (I'm=
 port
> >> forwarding to the internal machine). On the other subnet, the rpi node=
 is behind
> >> NAT and pointed to that endpoint.
> >>
> >> I have been able to get the wireguard nodes to connect and route machi=
nes on
> >> their opposite networks, but I haven't been able to get non-wireguard =
nodes
> >> to communicate with non-wireguard nodes across the tunnel. I have a fe=
w questions
> >> I'm trying to clear up:
> >>
> >> * Is it true that there isn't really a notion of a server/client from =
wireguard's
> >> perspective, they're really just nodes, and I've applied the semantic =
designation
> >> of the node behind the endpoint as a server, and the node behind the N=
AT as the client?
> >>
> >> * Here's my "server" config on 192.168.2.0/24:
> >>
> >> =3D=3D=3D
> >>
> >> [Interface]
> >> Address =3D 10.2.0.1/24
> >> ListenPort =3D 34777
> >> PrivateKey =3D <server_priv_key>
> >>
> >> [Peer]
> >> PublicKey =3D <client_pub_key>
> >> AllowedIPs =3D 10.2.0.2/32
> >>
> >> =3D=3D=3D
> >>
> >> Here's my "client" config on 192.168.4.0/24
> >>
> >> =3D=3D=3D
> >>
> >> [Interface]
> >> Address =3D 10.2.0.2/24
> >> PrivateKey =3D <client_priv_key>
> >>
> >> [Peer]
> >> PublicKey =3D <server_pub_key>
> >> AllowedIPs =3D 0.0.0.0/0
> >> Endpoint =3D <server_host>:34777
> >> PersistentKeepalive =3D 15
> >>
> >> =3D=3D=3D
> >>
> >>
> >> The simplicity of the wireguard config is one of the best features abo=
ut it,
> >> but the only thing I'm unclear about here is: exactly what is the "All=
owedIPs"
> >> field configuring? I'm not sure how to configure these fields for my u=
se-case.
> >> I'm guessing the server configuration is explicitly whitelisting the c=
lient,
> >> but I'm not sure what 0.0.0.0/24 on the clientside is saying. It feels=
 like
> >> I should have my subnets as part of this field, but I'm not sure where=
 because
> >> I'm not sure exactly what the field represents.
> >>
> >> If someone could elaborate on it and point me in the right direction g=
iven my
> >> objective, that would be much appreciated!
> >>
> >> -GN
> >
> >
> > I think mainly you need to decide whether you want to just route the tr=
affic between the two networks or you want to use NAT as well.
> > In case you are just routing then you=E2=80=99d need at minimum the ran=
ge of the other network, because after decrypting the source IP will be fro=
m that range. Otoh if you are using NAT you can just use an arbitrary IP ad=
dress inbetween the two tunnel endpoints, because the traffic will be modif=
ied, just like when you go out to the interner via a router.
> > Also don=E2=80=99t forget to add the respective routes to either the lo=
cal default gw or each host in case you are not using NAT - otherwise you w=
on=E2=80=99t get any of the answers.
> > I hope this helped.
> >
> > Cheers
> > Domi
>
