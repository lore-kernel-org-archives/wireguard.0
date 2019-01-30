Return-Path: <SRS0=kH4x=QG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD67C282D8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 30 Jan 2019 15:25:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F394920989
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 30 Jan 2019 15:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F394920989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wenarab.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08c26083;
	Wed, 30 Jan 2019 15:19:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e7ace7b
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Jan 2019 15:19:55 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd6b6fa5
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Jan 2019 15:19:55 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id t17so14465018vsc.8
 for <wireguard@lists.zx2c4.com>; Wed, 30 Jan 2019 07:25:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=jKUT2Ayec3pTF94IDsNEH82V2JKCGgMfkfT5+CKlKVM=;
 b=AuQhcO4ockyc8HRavSvcXuB3e+SaLbd4cdcxDqCdvjD9GqEIYUiFCYlLogM+bJik8h
 /r+YBMjrPqsvwywBMg4gZ/i7kRc5MHQt0/8L+OFW3guMG7AFwrZ9p0uI7wC+VBxoTua6
 2RwIro8rVcF8EsBUzFS1OMe8gK3d7i8nCMQNozAW+K+LZraPBuQVoT30w48bS8f80c9D
 k4vGYSrVErcLQPzQk4Vrjh6MX98iP508FHPTo7l2i+fHV8Jl6yfXEOhmNxDilcCe9Ql5
 GqREUDQG/77cfC+egoYcXivsNksnHq19VdJoIHZnWqFmu4IVMKyGAvvDSg4prJcANra3
 SqTA==
X-Gm-Message-State: AJcUukf8xxm+6aQHafW8SlYk31I3+iVK8zWRtix1dcY+wRErHGMmxR9B
 jq0SI5Puic3xWDy8Kbxa4UukYMcCh7ynLpHeCqQrEkh6FD0=
X-Google-Smtp-Source: ALg8bN6FiZY9kJnCPL8SAwHE9k/1RwfarnNL6wwXjpzSgRiNGqedmAS9UIu/KtzTXB9Ims3Tn4HGOx5e2AMR0qcbHAc=
X-Received: by 2002:a67:d00f:: with SMTP id r15mr12840184vsi.191.1548861952445; 
 Wed, 30 Jan 2019 07:25:52 -0800 (PST)
MIME-Version: 1.0
References: <CADjxVNq-PPTrzd9qDZK+ZFF8v70eme8n87xBK-77e=PNMGCQwg@mail.gmail.com>
 <CAJQSx3aQLGT9Hr=3NNTnrvq2JJCqiJ2vkV092n_zCN2LNjP-1Q@mail.gmail.com>
In-Reply-To: <CAJQSx3aQLGT9Hr=3NNTnrvq2JJCqiJ2vkV092n_zCN2LNjP-1Q@mail.gmail.com>
From: Gawen ARAB <g@wenarab.com>
Date: Wed, 30 Jan 2019 16:25:41 +0100
Message-ID: <CADjxVNrNNbRpanwm4ZEOLbY_e4FEohP=2YzpQFXe28JiHzj-yQ@mail.gmail.com>
Subject: Re: wirehub - decentralized, peer-to-peer and secure overlay networks
 built with WireGuard
To: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============7066324832267128059=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7066324832267128059==
Content-Type: multipart/alternative; boundary="0000000000007b511d0580ae862a"

--0000000000007b511d0580ae862a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Steve,

Thank you for your feedback.

> - uses extra crypto functionality which is not already part of wireguard;
and
> - passes messages across public networks using that functionality; and
>
> For what it's worth, if it would be possible to also encapsulate your
control protocol inside wireguard, that would be vastly preferable: it
allows the transport cryptography to be implemented in one place, once
(i.e. in wireguard), and lets wirehub be a purely organisational overlay
for managing links, rather than touching the crypto and introducing
troubling extra complexities.

I agree.

The main issue to implement this is to accept message_handshake_initiation
packet from unknown initiators. WireHub peers discover themselves through
the
DHT. One peer does not know in advance what peers will communicate with it.
The
current implementation of WireGuard drops packets from unset peers.

I plan to implement a replay mechanism of the message_handshake_initiation
packet, where WireHub peeks it, decrypts the initiator's public key, and if
unknown and has enough workbit, will add it to WireGuard's peers before
replaying the packet. The main advantage is to avoid adding usage-specific
features to WireGuard, but I need to re-implement part of the WireGuard
crypto
scheme (plus the replay mechanism might be a little dirty).

Another approach might be to modify WireGuard to add a hook called when a
unknown peer initiates a session. When it happens, a userland app (here,
WireHub) is called to accept or reject dynamically the initiator. This
reduces
the overhead of processing twice the message_handshake_initiation packet
from
the previous solution, but it would add complexity to the WireGuard's code.

    on_message_handshake_initiation(m) {
        // decrypt static_public

        if (unknown_peer(static_public)) {
            if (hook) {
                r =3D hook(static_public)     // call dynamically WireHub
            }

            // if no hook or hook rejects initiator, drop packet
            if (!hook or !r.accept_initiator) {
                return drop();
            }

            // else add iniatiator to peers
            set_peer(iniator.static_public,
                allowed_ips=3Dr.allowed_ips,
                endpoint=3Diniator.endpoint,
                preshared_key=3Dr.preshared_key,
                persistent_keep_alive=3Dr.persistent_keep_alive)
        }

        // process message_handshake_initiation
    }

> - clamps the wireguard keys in some unspecified way to embed a
proof-of-work (in fairness, I haven't read the code, so please correct me
if I have misunderstood).

The workbit of a Curve25519 key is the count of trailing zeros of a
derivation
of the public key.

    workbit(sk, namespace=3D'public') {
        k =3D pub(sk)
        h =3D blake2b(k =E2=8A=95 namespace)
        wb =3D trailing_0s(h) // see __builtin_clz
        return wb
    }

WireHub peers only accept peers which public key has enough workbits. This
makes
identity expensive to generate, which mitigates Sybil attacks.

When workbit is incremented by one, the count of possible Curve25519 keys i=
s
divided by 2. I don't know if it's a problem? I explored other PoW scheme,
but
the current implementation is the simplest one I found.

> I would also love to see some sort of PKI option with this project, to
avoid having to explicitly trust all the peers. I'd prefer to be able to
simply provide the peers with a signature they can present to other peers
that proves they can be trusted (or even better, have that signature
generated by a nominated host at connect / setup time for each peer, which
avoids much of the shenanigans involved with handling expiry, revocations
etc.) Having the ability to tell all peers on the network to immediately
terminate all connections with a specific compromised peer would also be
handy.

I plan to build this on top of WireHub, once it will be more mature.

A PKI daemon may read peer's certificates, signed by a given authority,
keeps a
list of the trusted peers and updates in live the wirehub's conf file.

Cheers,
Gawen

--0000000000007b511d0580ae862a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hey Steve,<br><br>Thank you for your feed=
back.<br><br>&gt; - uses extra crypto functionality which is not already pa=
rt of wireguard; and<br>&gt; - passes messages across public networks using=
 that functionality; and<br>&gt;<br>&gt; For what it&#39;s worth, if it wou=
ld be possible to also encapsulate your control protocol inside wireguard, =
that would be vastly preferable: it allows the transport cryptography to be=
 implemented in one place, once (i.e. in wireguard), and lets wirehub be a =
purely organisational overlay for managing links, rather than touching the =
crypto and introducing troubling extra complexities.<br><br>I agree.<br><br=
>The main issue to implement this is to accept message_handshake_initiation=
<br>packet from unknown initiators. WireHub peers discover themselves throu=
gh the<br>DHT. One peer does not know in advance what peers will communicat=
e with it. The<br>current implementation of WireGuard drops packets from un=
set peers.<br><br>I plan to implement a replay mechanism of the message_han=
dshake_initiation<br>packet, where WireHub peeks it, decrypts the initiator=
&#39;s public key, and if<br>unknown and has enough workbit, will add it to=
 WireGuard&#39;s peers before<br>replaying the packet. The main advantage i=
s to avoid adding usage-specific<br>features to WireGuard, but I need to re=
-implement part of the WireGuard crypto<br>scheme (plus the replay mechanis=
m might be a little dirty).<br><br>Another approach might be to modify Wire=
Guard to add a hook called when a<br>unknown peer initiates a session. When=
 it happens, a userland app (here,<br>WireHub) is called to accept or rejec=
t dynamically the initiator. This reduces<br>the overhead of processing twi=
ce the message_handshake_initiation packet from<br>the previous solution, b=
ut it would add complexity to the WireGuard&#39;s code.<br><br>=C2=A0=C2=A0=
=C2=A0 on_message_handshake_initiation(m) {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 // decrypt static_public<br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (unknown_peer(static_public)) {<br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (hook) {<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 r =3D hook(static_public)=C2=A0=C2=A0=C2=A0=C2=A0 // call dynamically W=
ireHub<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 }<br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 // if no hook or hook rejects initiator, drop packet<br>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!hook or !r.acce=
pt_initiator) {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return drop();<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br><br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // else add iniatiator =
to peers<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 set_peer(iniator.static_public,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allowed_ips=3Dr.allo=
wed_ips,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 endpoint=3Diniator.endpoint,<br>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 preshared_key=3Dr.preshared_key,<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 persistent_keep_aliv=
e=3Dr.persistent_keep_alive)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
}<br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // process message_hand=
shake_initiation<br>=C2=A0=C2=A0=C2=A0 }<br><br>&gt; - clamps the wireguard=
 keys in some unspecified way to embed a proof-of-work (in fairness, I have=
n&#39;t read the code, so please correct me if I have misunderstood).<br><b=
r>The workbit of a Curve25519 key is the count of trailing zeros of a deriv=
ation<br>of the public key.<br><br>=C2=A0=C2=A0=C2=A0 workbit(sk, namespace=
=3D&#39;public&#39;) {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 k =3D =
pub(sk)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 h =3D blake2b(k =E2=
=8A=95 namespace)<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wb =3D trai=
ling_0s(h) // see __builtin_clz<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return wb<br>=C2=A0=C2=A0=C2=A0 }<br><br>WireHub peers only accept peer=
s which public key has enough workbits. This makes<br>identity expensive to=
 generate, which mitigates Sybil attacks.<br><br>When workbit is incremente=
d by one, the count of possible Curve25519 keys is<br>divided by 2. I don&#=
39;t know if it&#39;s a problem? I explored other PoW scheme, but<br>the cu=
rrent implementation is the simplest one I found.<br><br>&gt; I would also =
love to see some sort of PKI option with this project, to avoid having to e=
xplicitly trust all the peers. I&#39;d prefer to be able to simply provide =
the peers with a signature they can present to other peers that proves they=
 can be trusted (or even better, have that signature generated by a nominat=
ed host at connect / setup time for each peer, which avoids much of the she=
nanigans involved with handling expiry, revocations etc.) Having the abilit=
y to tell all peers on the network to immediately terminate all connections=
 with a specific compromised peer would also be handy.<br><br>I plan to bui=
ld this on top of WireHub, once it will be more mature.<br><br>A PKI daemon=
 may read peer&#39;s certificates, signed by a given authority, keeps a<br>=
list of the trusted peers and updates in live the wirehub&#39;s conf file.<=
br></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Cheers,<br>Gawen</div>=
</div>

--0000000000007b511d0580ae862a--

--===============7066324832267128059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7066324832267128059==--
