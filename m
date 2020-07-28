Return-Path: <SRS0=JBbb=BH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE9EC433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jul 2020 21:33:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 607BB2065C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jul 2020 21:33:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SXj64kXz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 607BB2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 808ef3c4;
	Tue, 28 Jul 2020 21:10:18 +0000 (UTC)
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [2607:f8b0:4864:20::730])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 47f9991d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jul 2020 21:10:16 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id 2so16134791qkf.10
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jul 2020 14:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yK6bK+ZQwWMcsYdtJw6u9JyHv2WwlUH9EUM99PTGovQ=;
 b=SXj64kXzF3xjT41vDOpe+BBTObwqk7XHTZYZEPL7IM3SWva1m36q6SjDdWGlQa05qL
 23PeoCXPtFXXZFEc5OCZ9UUXtu/N26EnPGdXxSQS5RV/X4psWHD+J+DDsM3gqpjHlDWm
 DV4g002Ca9cfvjN1gL85rR6H0q5EX/zZqCg092VPl4K0P8XsfzS08ZsQBXdGssRG5GOT
 +HWONtSIjOaz3tkUxmtPUMWbuzmPMMmIEyDxzYFKJwdjHzTIKiUlQRYwnn1nNgjNptkT
 0dI22BxjAO8zRIWbD9QFP30VTDiQlhctS1irRqqH/1YBGV5bUY/nYdWEHI/cng15SvnC
 5yEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yK6bK+ZQwWMcsYdtJw6u9JyHv2WwlUH9EUM99PTGovQ=;
 b=nHmBZ/8OK71A2OlbmvsB4onPtZBDQ4u2gMEJx8wjUdA5V1iW7n3vNWQY10NGY/5pql
 pt/u+gX6UV+zRbzR9Z8+7xJ1O7DU7ekb6E8eVJXuPQvz63zlWzUAg/rySxYSCMZhOTad
 wrL59BtSu2Q9L8clnsfiSJf/x5ecW/VtS/FUm5TPK77zHvjmFM5flkse0ZTlhUqC6KO6
 ZcAoYlNV7omGfyfR7+aa51Sh7YV0rUPiTOSo3YINp06txRGSCQfyth8PyofI/aa58Eq4
 6ai8Sy4mjGa3w7GGLuW1j3J0nt8fLqvVfDi2wwjQA20HBn6nxKZb1+2IGyam8Giw3yyb
 DHqg==
X-Gm-Message-State: AOAM531GwrAOGH3OAOYZ2OBTGH6fnipWphc8KDh5o4VmxUIrx+KyBzwF
 6IiEO8s+jKia5yRK5wCkqVFGI6zWLrI=
X-Google-Smtp-Source: ABdhPJz/NlgbaZrXvrtrL9xvkC8eQTUxO033hGT6ouzfduB7YrUwcLh2KCXB0GQg3o2S2cTg6mu8zA==
X-Received: by 2002:a37:7706:: with SMTP id s6mr31568201qkc.164.1595972025771; 
 Tue, 28 Jul 2020 14:33:45 -0700 (PDT)
Received: from richs-mbp-pro.lan ([70.16.106.169])
 by smtp.gmail.com with ESMTPSA id g21sm52201qts.18.2020.07.28.14.33.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jul 2020 14:33:45 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Confused about AllowedIPs meaning?
From: Rich Brown <richb.hanover@gmail.com>
In-Reply-To: <26A86FD2-5A2D-49DC-A140-2E4B43213936@tomcsanyi.net>
Date: Tue, 28 Jul 2020 17:33:43 -0400
Cc: Gunnar Niels <gunnar.s.niels@gmail.com>,
 wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <ECF44AE9-A461-4252-8A33-B2A813280493@gmail.com>
References: <02830f08-9e6f-a9f1-54c3-43758e95758f@gmail.com>
 <26A86FD2-5A2D-49DC-A140-2E4B43213936@tomcsanyi.net>
To: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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

I'm new to WireGuard (and not an expert on routing), but here's my =
operational understanding of the definition of AllowedIPs:

---
AllowedIPs is the set of addresses that your WireGuard peer will send =
across the tunnel to its peer.=20

When your computer is about to send a packet out, it compares the =
destination address with WireGuard's list of AllowedIPs. If there's a =
match, the packet goes out the WireGuard tunnel. Otherwise, the packet =
uses the default routing process.

In your case (joining private two networks together), you would list the =
subnet range(s) of the *other* network in *this* peer. If you want to =
send all traffic through the WireGuard tunnel (say, if you're in a =
coffee shop), you can include 0.0.0.0/0 (specifies all IPv4 addresses) =
and ::/0 (to specify all IPv6 addresses).
---

I would appreciate having someone else review that definition for =
correctness. (I also have a blog posting that talks about the WireGuard =
GUI on macOS - https://randomneuronsfiring.com/wireguard-on-macos/ =
Comments are welcome there, as well.) Thanks.

Rich

> On Jul 28, 2020, at 5:12 PM, Tomcsanyi, Domonkos <domi@tomcsanyi.net> =
wrote:
>=20
>=20
>> 2020. j=C3=BAl. 28. d=C3=A1tummal, 18:02 id=C5=91pontban Gunnar Niels =
<gunnar.s.niels@gmail.com> =C3=ADrta:
>>=20
>> =EF=BB=BFHello, I'm new to wireguard and have been experimenting with =
it in my home lab.
>> I'm interesting in using it to join two home networks (192.168.2.0/24 =
and
>> 192.168.4.0/24). They're typical home networks in two physically =
different
>> locations, each with their own gateways to the internet. I'd like for =
the
>> machines on each network to use their default gateway for internet =
access, but
>> configure things so they use a simple linux machine (raspberry pi) to =
route
>> to the other subnet over wireguard is the destination is the opposite =
subnet.
>>=20
>> One wireguard node is exposed via an endpoint with a dns A record =
(I'm port
>> forwarding to the internal machine). On the other subnet, the rpi =
node is behind
>> NAT and pointed to that endpoint.
>>=20
>> I have been able to get the wireguard nodes to connect and route =
machines on
>> their opposite networks, but I haven't been able to get non-wireguard =
nodes
>> to communicate with non-wireguard nodes across the tunnel. I have a =
few questions
>> I'm trying to clear up:
>>=20
>> * Is it true that there isn't really a notion of a server/client from =
wireguard's
>> perspective, they're really just nodes, and I've applied the semantic =
designation
>> of the node behind the endpoint as a server, and the node behind the =
NAT as the client?
>>=20
>> * Here's my "server" config on 192.168.2.0/24:
>>=20
>> =3D=3D=3D
>>=20
>> [Interface]
>> Address =3D 10.2.0.1/24
>> ListenPort =3D 34777
>> PrivateKey =3D <server_priv_key>
>>=20
>> [Peer]
>> PublicKey =3D <client_pub_key>
>> AllowedIPs =3D 10.2.0.2/32
>>=20
>> =3D=3D=3D
>>=20
>> Here's my "client" config on 192.168.4.0/24
>>=20
>> =3D=3D=3D
>>=20
>> [Interface]
>> Address =3D 10.2.0.2/24
>> PrivateKey =3D <client_priv_key>
>>=20
>> [Peer]
>> PublicKey =3D <server_pub_key>
>> AllowedIPs =3D 0.0.0.0/0
>> Endpoint =3D <server_host>:34777
>> PersistentKeepalive =3D 15
>>=20
>> =3D=3D=3D
>>=20
>>=20
>> The simplicity of the wireguard config is one of the best features =
about it,
>> but the only thing I'm unclear about here is: exactly what is the =
"AllowedIPs"
>> field configuring? I'm not sure how to configure these fields for my =
use-case.
>> I'm guessing the server configuration is explicitly whitelisting the =
client,
>> but I'm not sure what 0.0.0.0/24 on the clientside is saying. It =
feels like
>> I should have my subnets as part of this field, but I'm not sure =
where because
>> I'm not sure exactly what the field represents.
>>=20
>> If someone could elaborate on it and point me in the right direction =
given my
>> objective, that would be much appreciated!
>>=20
>> -GN
>=20
>=20
> I think mainly you need to decide whether you want to just route the =
traffic between the two networks or you want to use NAT as well.
> In case you are just routing then you=E2=80=99d need at minimum the =
range of the other network, because after decrypting the source IP will =
be from that range. Otoh if you are using NAT you can just use an =
arbitrary IP address inbetween the two tunnel endpoints, because the =
traffic will be modified, just like when you go out to the interner via =
a router.
> Also don=E2=80=99t forget to add the respective routes to either the =
local default gw or each host in case you are not using NAT - otherwise =
you won=E2=80=99t get any of the answers.
> I hope this helped.
>=20
> Cheers
> Domi

