Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523DCF31E24
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Apr 2026 14:32:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0d9acfa8;
	Thu, 9 Apr 2026 14:32:17 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [2001:67c:2050:0:465::101])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d2980b26
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 Apr 2026 14:32:14 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fs2Sp1R93z9tk9
 for <wireguard@lists.zx2c4.com>; Thu,  9 Apr 2026 16:32:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aparcar.org; s=MBO0001;
 t=1775745130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5M2i78YCkCT1IKZq61YQYoUjgngBJq2OnoeZhfHz4QQ=;
 b=KSZ7riZllzwBGJZ5F1Uh0tzkA2heA06QtS3Hvayc5+grWwym8O52ickR05i5Pk38I8hqNy
 ftq4KoCni2W/S17mWA6bJVHcArxdR5VhduHNcx0i9VROGNXgTRtWTYadrET2fa1IrAVbNk
 tGCyoPrGwooAyplc8QLePage3rywxCTd1qOWfEcZpS2W8p4/JCh4RS7vhOH93K/6IPAJ3W
 w0OtphHMcazSiH3d8UmPtbYMtoEq+Qb1GHRntYW03FYWN3P2c5FOpUAn8qALWmiCkNBCLW
 Lya+sd/cSzIir+eYY27e/UhyadsCvKSWv3r5gV1NWxLDNzOQASTKqwsSHctZ0w==
Authentication-Results: outgoing_mbo_mout; dkim=none;
 spf=pass (outgoing_mbo_mout: domain of mail@aparcar.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=mail@aparcar.org
From: Paul Spooren <mail@aparcar.org>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
Subject: Adding message type 5/6 for PQC (was Re: Export noise primitives for
 additional "chain key ratcheting")
Date: Thu, 9 Apr 2026 23:31:55 +0900
References: <9E8ACE91-126B-41BD-BCE2-8B54DCE78B97@aparcar.org>
To: wireguard@lists.zx2c4.com
In-Reply-To: <9E8ACE91-126B-41BD-BCE2-8B54DCE78B97@aparcar.org>
Message-Id: <F28D820C-BB46-4EF2-97BA-37FABE255DB0@aparcar.org>
X-Rspamd-Queue-Id: 4fs2Sp1R93z9tk9
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

Hello again,

To follow up my previous email, I gave it a bit more thoughts. Two new =
messages types now strike me as an easier migration path. I wrote the =
design and mangled it through an AI for readability. I=E2=80=99d be =
interested if other people have similar ideas or pursue entirely =
different approaches for PQC.

Heads up, dealing with such big keys (~500kb) breaks this nice and clean =
WireGuard feel. However, to stay compatible with existing scripts, the =
design outlined below still allows addressing peers with their =
=E2=80=9Cclassical=E2=80=9D public key, while peer setup requires the =
full path.

Anyway, for those who care:

## Motivation

A sufficiently powerful quantum computer running Shor's algorithm can
break Curve25519 ECDH, allowing an attacker to:

- Decrypt recorded WireGuard handshakes ("harvest now, decrypt later")
- Recover static keys from captured initiations and impersonate peers

WireGuard's Noise IK handshake could be augmented with post-quantum
key exchange to protect against this threat while retaining full
backward compatibility with existing deployments.

## Approach

We add two new message types (5 and 6) that extend the existing
Noise IKpsk2 handshake with a hybrid post-quantum layer. The classical
Noise IK steps run first, unchanged, followed by two additional KEM
operations that mix post-quantum shared secrets into the session key.

The design is hybrid: even if the PQC algorithms are broken, the
classical X25519 security remains. The PQC layer can only add entropy,
never weaken.

### Algorithm Choice

- **Classic McEliece 460896** for static peer authentication. Code-based
  cryptography with 40+ years of cryptanalysis. Conservative choice for
  long-term identity keys. Decapsulation is fast (~40=CE=BCs); the =
tradeoff
  is a large public key (~524 KB).

- **ML-KEM-512** (FIPS 203) for ephemeral forward secrecy. =
Lattice-based,
  NIST-standardized. Fresh keypair per handshake ensures that =
compromising
  static keys cannot decrypt past sessions. Compact: 800-byte public =
key,
  768-byte ciphertext.

### Wire Format

```
Type 5 =E2=80=94 PQC Initiation (1104 bytes):
  [type:4][sender:4][ephemeral:32][enc_static:48][enc_timestamp:28]
  [mce_ciphertext:156][mlkem_encaps_key:800]
  [mac1:16][mac2:16]

Type 6 =E2=80=94 PQC Response (1032 bytes):
  [type:4][sender:4][receiver:4][ephemeral:32][enc_nothing:16]
  [mce_ciphertext:156][mlkem_ciphertext:768][enc_empty:16]
  [mac1:16][mac2:16]
```

Backward compatible: existing WireGuard implementations silently drop
unknown message types. Classical peers continue using types 1-4 without
modification.

### Protocol Flow

**Type 5 creation (initiator):**

Phase 1 =E2=80=94 classical Noise IK, identical to Type 1:

1. Generate ephemeral X25519 key, mix into chain
2. DH(ephemeral, responder_static) =E2=86=92 encrypt initiator's static =
key
3. DH(initiator_static, responder_static) =E2=86=92 encrypt timestamp

Phase 2 =E2=80=94 post-quantum augmentation:

4. Domain separation: mix PQC construction string into chain key
5. McEliece encapsulate to responder's static McEliece key =E2=86=92 =
156-byte
   ciphertext + 32-byte shared secret, mixed into chain key via KDF
6. ML-KEM keygen =E2=86=92 800-byte encapsulation key sent in message,
   1632-byte decapsulation key held in handshake state

**Type 6 creation (responder):**

Phase 1 =E2=80=94 classical response (e, ee, se, psk, {}), identical to =
Type 2.

Phase 2 =E2=80=94 post-quantum augmentation:

4. McEliece encapsulate to initiator's static McEliece key =E2=86=92 =
shared
   secret mixed into chain key
5. ML-KEM encapsulate using initiator's ephemeral encapsulation key =E2=86=
=92
   shared secret mixed into chain key
6. Encrypt empty payload for transcript authentication

Both sides derive identical session keys from the combined classical +
PQC chain key, then proceed with the normal WireGuard transport.

### PQC-Aware MAC1

For Type 5/6, the mac1 key derivation includes the responder's McEliece
public key hash:

```
pqc_mac1_key =3D BLAKE2s(classical_mac1_key || BLAKE2s(mce_pubkey))
```

This tightens the DoS boundary: only peers who possess the responder's
full PQC public key (~524 KB) can send valid Type 5 messages. Classical
Type 1/2 mac1 is unchanged.

## Key Management

### No Separate PQC Private Key

The McEliece keypair is derived deterministically from the existing
WireGuard private key:

```
seed =3D BLAKE2s(wg_private_key || "wg-pqc-mceliece-seed")
mce_sk, mce_pk =3D McEliece460896_KeyGen(seed)
```

One secret to protect. No additional key storage. Changing the WireGuard
private key automatically rotates the PQC identity.

### Unified PublicKey Field

There is no separate PQC configuration key. The standard `PublicKey`
field handles both classical and PQC peers:

- **44 base64 characters** (32 bytes decoded): classical Curve25519 key
- **~700 KB base64** (524,192 bytes decoded): classical key + McEliece
  public key, concatenated

Since McEliece public keys are too large for config file lines or
netlink messages, if a PublicKey value starts with `/`, it is read from
that file path:

```ini
[Interface]
PrivateKey =3D yAnz5TF+lXXJte14tji3zlMNq+hd2rYUIgJBgB3fBmk=3D

[Peer]
PublicKey =3D /etc/wireguard/peer1.pub
AllowedIPs =3D 10.0.0.2/32
Endpoint =3D 203.0.113.1:51820
```

A new `wg pqcpubkey` command generates the key file:

```sh
wg genkey | tee /etc/wireguard/private | wg pqcpubkey > =
/etc/wireguard/peer1.pub
```

This reads a private key from stdin (same UX as `wg pubkey`) and outputs
the combined base64 blob.

### PQC Enforcement

When a peer is configured with a PQC public key, classical Type 1
initiations from that peer are silently rejected. There is no way to
downgrade a PQC-configured peer to classical-only. No explicit toggle
is needed =E2=80=94 the presence of the McEliece key implies PQC-only.

## What We Explicitly Do Not Do

- No separate PQC configuration keys or toggles
- No modification to the classical Noise IK protocol
- No changes to the transport data path (Type 4)


> On 1. Apr 2026, at 05:14, Paul Spooren <mail@aparcar.org> wrote:
>=20
> Hi,
>=20
> I=E2=80=99m looking into hardening WireGuard against quantum =
computers, specifically how to extend the Noise-based handshake.=20
>=20
> A bit of background, while PSK injection with external daemons for =
forward secrecy, exists, that=E2=80=99s extra software running, exposing =
extra ports etc. Modifying a Rust/Go implementation is easier than the =
Kernel, but my background is running things on WiFi routers, so Kernel =
is preferred. That said, I=E2=80=99d like to extend the current =
WireGuard message format and attach PQC without exceeding the IPv6 MTU =
of 1280 bytes. In literature I don=E2=80=99t find definitive a PQC =
handshake standard, however combining ML-KEM512 for forward secrecy and =
McEliece460896 for static long-term keys does exist in practice[1] and =
fits into WireGuard init and response messages. Alternatively, sntrup653 =
could be used for forward secrecy without PQ authentication, similar to =
Signal's PQXDH[2]. Possibly new primitives/schemes are developed, with =
smaller public keys and ciphertexts.=20
>=20
> Just today I read an email about ML-KEM and the Kernel; none of these =
cryptographic primitives are (to my knowledge) part of the Linux Kernel, =
making a =E2=80=9Cnew=E2=80=9D protocol version of WireGuard more =
difficult to implement and further out in the future.
>=20
> I wondered if WireGuard could export some of the noise primitives like =
mix_hash and mix_key to allow =E2=80=9Cone way=E2=80=9D (ratchet) =
modifications of the chaining key and =E2=80=9Cappend only" bytes to the =
outgoing packet (PQ pubkey, ciphertext). After appending bytes, =
WireGuard takes over again and calculates the MAC, proceeding as usual. =
The "ratcheting=E2=80=9D Kernel module would work similar to the =
existing PSK approach, it adds additional data to the chaining key, =
however it can=E2=80=99t downgrade it (except crashing the Kernel). =
Another approach could be to add netlink handling for an active daemon, =
this would at least reduce the open ports and network complexity.=20
>=20
> Yet another way to have PQ WireGuard could be to produce one's own =
modules like WolfGuard did the recently[3] with AES/FIPS, however I =
thought to ask anyway.
>=20
> Thanks,
> Paul
>=20
> [1]: https://rosenpass.eu/docs/rosenpass-project/whitepaper/
> [2]: https://signal.org/docs/specifications/pqxdh/
> [3]: https://github.com/wolfSSL/wolfGuard


