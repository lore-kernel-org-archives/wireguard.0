Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57877CA6008
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7bf3d4d2;
	Mon, 5 Oct 2026 07:00:29 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 77af7ab2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Aug 2026 23:11:25 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-c1670dad7a8so73674466b.3
 for <wireguard@lists.zx2c4.com>; Thu, 13 Aug 2026 16:11:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786662685; cv=none;
 d=google.com; s=arc-20260327;
 b=FoMWW3wwCWTpBIB4ZJIzD6E78Tp4Qqm2Cst3KS5RdRTNqCV4jS/mmMGSQlSu5743ru
 d+hqwnR4TL7pRKItwaX8uYv5LUMBtiP8ATDpFKzA6O0920zK7TI273xPOBdOqNt9PDyv
 ro7oKDbkSRahjSBXfiV2fk1z/BL7t1KU6qrdRMcj70j58lgj2TJTqynFHsFyhb38jmoS
 HOXgigFtkNOS4D1yp9eHBV/IdYiAVjutQ8hgi1sQDw9T52NYpKZ1WmVG6B0ZvoCkJ/sh
 o7nqqmzcxe1yg6xIiZkkxk5/SP+Kc9Ml7cZtAiucfnqXxf2E2h0ldDzY2qbzgQCduwju
 ouhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:dkim-signature;
 bh=s9CkRR73eau0FXYNzj1Z2+oQ9kN23wMcZJwHRBGqVeg=;
 fh=1CsOgAxkj0tSFTO0bRovl0wQS24+EZdEApJbdc/Xo54=;
 b=Zzfp0fkSM8TwU/viGvou0EWKNG26uFjPw3mG7HGYcWjJ2g0+U8sjuKWXW/n0pElKq7
 Y1CpbzCHITOh93p64hTd36OqRGbV4hGqfE3aCxNbrqyWc17vzKppHH7+Uk4SNvUhAiWe
 CNMSsy8JUSC7pUciq+euy0dPeNAn3l7dJMDYxBR6gi6ncsgI0GLycxW1VATiLOwC5jwQ
 /KSE8EKVob1qFICcXU9GJK9QSaFh4ihBTumT5lYmZO2dGwfGuSlOqsOJNgixTCljC66V
 9j1z2jo6eQ9EtVtihyOrLEMCmLd50A4zPEyCFpakovEGOV/aehgF7xO6UJZgfmis835k
 7ZEw==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786662685; x=1787267485; darn=lists.zx2c4.com;
 h=content-transfer-encoding:content-type:to:subject:message-id:date
 :from:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=s9CkRR73eau0FXYNzj1Z2+oQ9kN23wMcZJwHRBGqVeg=;
 b=JEjaHJQmAtPFdnZZYcf4Ib2AXTQYn0r3DWhiUwUU5y5iIvmRG/ItHvlU33ceeUdJP3
 17c4QyuEVGWdWygUhatRdqQuarBAXaOpT+Vb6ixIPYf31dtaVbfiEvwaP4R3Q0s3j9m3
 NefZLzTAhdGWH31n2fQfu4mJjai7OQS8C66w17pWZpJtYNZZYRKlsO+e+gaRQjOGAP9O
 8J0/U7ftQcBS2bmBgjciT2ijlvM8UPDEbRstyXMpN0wLZNnt46XLO7ruPgXotd6PWkFF
 8B5TwSEeagz/owuhZfowKlWI30ZQo3Jha8zv0SfUv8IQSqzvKgxvfqfLCBhMzrmG5dRi
 ypAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786662685; x=1787267485;
 h=content-transfer-encoding:content-type:to:subject:message-id:date
 :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=s9CkRR73eau0FXYNzj1Z2+oQ9kN23wMcZJwHRBGqVeg=;
 b=B+uu9x/Bsc3Ox7592bbXnk0JepKkkPDACF/iSd3+P0rduKfiX2mS1ezsSfGgpU4TlY
 kuIbtrNr1TqChl7R4as3ExdVDSUUC8YojL3eYLdBXqv41mJweTK21v2UPXktgINC/d4Q
 W5T+L1QQsIKPpXGdJ9T/zC92kOPOMhRtBbcF3XsW4z56DAEkSEetgjg9B7cdAXF7uu6U
 cFVyfFgmdTt3tQ6CqceCUXRYQHvDK9lb5qjlShHmY2AmcP70oaBOqt7xYkm5j2Z7bYC5
 Bf4xAyCi/r7KGJkFSjZNMZNtloHQkOEipg1lmOmO0Qyr3U0dtqpoHLkOFc6pT0YcjgS0
 4eUA==
X-Gm-Message-State: AOJu0YxmvWowwXdB5BltYrXYKftsXIiGKw6Fl5kLCK1Te0RHfkoH3V1k
 RwOlDnW9odHZb02yhWhfZFfzUy0luVgg0XkwHmc1N58twqIMBHgt1r21262o2n5Yv2GJ+j6EgJJ
 6eNwyN7O2Cpet1n64Nc3d7eZ5eafbdqAnCe6QG28=
X-Gm-Gg: AR+sD12N9u+/tndsJY9rCKeAjSthfyseSrSgHyPXzlGOd84N1u71exL7+M2ZUy3KeOV
 7it5lpvAtv4aqi+SIqOHlmvKE1FTDvhu1RNyK4YGhIPxJlZXNLz1awEsbqLD45M/awbnQ69oTSg
 OrWrzCLaeM+ZOOvRGxQIYdjno7SiNG8Kd13b2Ue+zY3STgIqHnw/EYVbVI47caFIHNxj4OXyeO/
 jZFtqRqG7en/jRNbRjxUgKHek5/3lx+sfudcxTa4cf12oeIgtiU3bSqLr7mRbbiDmn9SCJvqRir
 Bxu9pTAzB43WKgsSmwJtNjVtVPpzCcIlUIKmliODOu0+vMTg7YVuwv2eKingThlbGk4yg9+wQEQ
 yYA==
X-Received: by 2002:a17:907:c02:b0:c1f:c061:569a with SMTP id
 a640c23a62f3a-c2129b5b0fbmr69010366b.7.1786662684492; Thu, 13 Aug 2026
 16:11:24 -0700 (PDT)
MIME-Version: 1.0
From: Tomas Navara <michnovka@gmail.com>
Date: Fri, 14 Aug 2026 01:11:12 +0200
X-Gm-Features: AUfX_mytG3SBRQ10G17W2WDn3TqMHsGh_mbftGoONJ7dyDwROBi-4wtznxYmjlY
Message-ID: <CAEcwpkDOdgBqQ=gqnpwARJ0qbgNHLYpaSC8ND_ybud+J1dj-Dw@mail.gmail.com>
Subject: syncconf sends an all-zero private key, clearing device identity
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:59:44 +0000
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

Hi,

Commit 0b7d982 ("wg-quick: use addconf instead of setconf", 2025-06-19)
fixed `wg setconf' wiping an out-of-band private key on the wg-quick
bring-up path, and its commit message names the root cause exactly:

    This is actually wrong because PreUp is followed by set_config(),
    which calls `wg setconf`, which in turn deletes the private key from
    the interface because it is missing from the configuration.

The same root cause still applies to `wg syncconf', which wg-quick(8)
recommends eighty lines below the PreUp example:

    The strip command is useful for reloading configuration files
    without disrupting active sessions:

        # wg syncconf wgnet0 <(wg-quick strip wgnet0)

Run that against an interface whose key was supplied out of band and it
silently destroys the interface's identity. It exits 0, prints nothing
and logs nothing. The interface stays up and keeps forwarding on
established keypairs, but can never complete another handshake in either
direction. This took down a 16-peer production overlay for me and took a
while to diagnose, hence the write-up.

It is not only reachable by typing the man page example. It is what the
shipped systemd unit does on reload, in src/systemd/wg-quick@.service:

    ExecReload=3D/bin/bash -c 'exec /usr/bin/wg syncconf %i <(exec
/usr/bin/wg-quick strip %i)'

So `systemctl reload wg-quick@wg0' destroys such an interface too, with
no man page involved. Alpine's OpenRC reload() does the same. That unit
has shipped since v1.0.20200820, and the man page example changed from
addconf to syncconf four days after the unit landed. addconf took the
append path and was safe.

I am aware you recently settled the opposite reading for peer
attributes. 780182e3 ("syncconf: account for psks removed from config
file") and 0a81a174 (same for persistent keepalive), both 2025-05-23,
make "absent from the file" mean "cleared at runtime". I am not asking
you to reverse that, and I do not think this report depends on it. Two
things separate the device private key from a peer psk.

First, 780182e3's commit message explicitly considers and rejects the
blunt version of exactly the mechanism at issue here:

    Note that this could have been implemented more simply, by just
    setting WGPEER_HAS_PRESHARED_KEY on all of the file's peers, since
    the psk slot is zeroed by calloc in config.c [...] Avoid this by only
    setting it if there's a mismatch between the runtime and the file.

So peers now get real reconciliation. Device-level attributes never
reach that code: sync_conf() touches only peers, and the private key,
listen port and fwmark ride through on the calloc'd zeroes and the
unconditional flags from config_read_init(). The device path is still
the shortcut you turned down for peers.

Second, blast radius. Clearing a psk degrades one peer, and both ends
see a clear symptom. Clearing the device key destroys the identity of
the whole interface for every peer at once, and the only kernel-visible
symptom points at the wrong end of the connection. That asymmetry is
already reflected in the same file: config_read_finish() refuses a
config where any peer lacks a public key ("A peer is missing a public
key"), but says nothing about a device with no private key, which is the
more destructive of the two.

It is also undocumented. wg(8) spells out key removal for the
command-line path ("If /dev/null or another empty file is specified
[...] the key is removed from the device"), but there is no equivalent
sentence anywhere for the configuration-file path.


Mechanism
---------

src/config.c, config_read_init():

    if (!append)
        ctx->device->flags |=3D WGDEVICE_REPLACE_PEERS |
WGDEVICE_HAS_PRIVATE_KEY | WGDEVICE_HAS_FWMARK |
WGDEVICE_HAS_LISTEN_PORT;

Asserted up front for every non-append invocation, that is, for setconf
and syncconf both. config_read_line() only ever adds to the flags, so a
file with no PrivateKey yields HAS_PRIVATE_KEY with private_key still
all zeroes from the calloc(). src/ipc-linux.h transmits it verbatim:

    if (dev->flags & WGDEVICE_HAS_PRIVATE_KEY)
        mnl_attr_put(nlh, WGDEVICE_A_PRIVATE_KEY,
sizeof(dev->private_key), dev->private_key);

Every other backend does the same. ipc-uapi.h emits 64 hex zeroes, and
the freebsd, openbsd and windows backends set their equivalent flags.
sync_conf() in src/setconf.c clears only WGDEVICE_REPLACE_PEERS and
leaves the other three asserted.

Kernel side, in wg_set_device(), the zero key differs from the stored
key, so the crypto_memneq() fast path is not taken, and
wg_noise_set_static_identity_private_key() sets

    static_identity->has_identity =3D curve25519_generate_public(...)

which is false, because curve25519_generate_public() rejects an all-zero
secret. wg_cookie_checker_precompute_device_keys() then takes its else
branch and zeroes message_mac1_key. The netlink call returns 0.

Consequences:

- Every inbound handshake fails mac1 against the zeroed key, giving
  "Invalid MAC of handshake, dropping packet from ..." for every peer,
  even though the packets are valid. I took a pcap and recomputed mac1
  in userspace against the device's real public key to confirm. The
  message points at the wrong side of the connection.

- Outbound initiations are logged but never sent.
  wg_packet_send_handshake_initiation() emits its net_dbg_ratelimited()
  line before calling wg_noise_handshake_create_initiation(), which
  returns false with no identity.

- Existing keypairs keep passing data until they expire, so the
  interface looks partly alive. This is what makes it hard to diagnose.

- `wg show <dev>' omits the "public key" and "private key" lines
  entirely. That is the fastest diagnostic, but it is an absence rather
  than a message.

- wg-quick down && up appears to fix it, which hides the cause.


Reproducer
----------

    [Interface]
    Address =3D 10.98.0.1/24
    ListenPort =3D 51898
    PostUp =3D wg set %i private-key /etc/wireguard/ctl0.key

    # wg-quick up ctl0
    # wg show ctl0 public-key
    <a real key>
    # wg syncconf ctl0 <(wg-quick strip ctl0)
    # echo $?
    0
    # wg show ctl0 public-key
    (none)

Deterministic on wireguard-tools v1.0.20210914 with Linux 6.8.0-137, and
on v1.0.20250521 with Linux 7.0.0-22. The config.c line is unchanged
since 5b65f87 (2017-09-25) and is still in master, so every release
since is affected. 65db147 (2017-10-16, "wg: don't insist on having a
private key") removed the config_read_finish() check that used to catch
it, specifically to enable the PostUp key idiom.

Prior threads, none of which resulted in a change: Tore Anderson's
2020-03-27 report of the fwmark half of this, which got no replies;
Robin Schneider's 2020-10 strip-and-eval patch, declined, with the
now-canonical workaround; and Daniel Gr=C3=B6ber's 2023 PrivateKeyFile=3D
series, never merged, which notes in passing that syncconf "will
(rightly) unset the private key when it's missing".


Same line, other attributes
---------------------------

HAS_LISTEN_PORT and HAS_FWMARK come from the same assignment. A file
with no ListenPort, which is the normal client case, sends
listen_port=3D0, and set_port() rebinds to a fresh random source port,
staling peers' cached endpoints. That is the session disruption syncconf
exists to avoid. And fwmark can never appear in a stripped config,
because wg-quick sets it out of band in add_default(), so for an
ordinary full-tunnel config the documented reload idiom clears the very
fwmark that wg-quick's own `ip rule not fwmark' policy rule depends on.
That is Tore Anderson's 2020 report, and it needs no out-of-band key
setup at all.

Separately, sync_conf() returns early when the file has no peers, before
WGDEVICE_REPLACE_PEERS is cleared, so a peerless file passed to syncconf
removes every peer on the interface.


Suggested fixes
---------------

1) Refuse to transmit an all-zero device private key, in setconf and
   syncconf both. key_is_zero() already exists in encoding.h and is
   already used for preshared keys in every ipc backend, so this is a
   few lines. It is a much narrower version of the check 65db147
   removed: not "you must supply a private key", only "an all-zero
   private key is not a key".

   I think this is the right one because it costs no capability. wg(8)
   already documents an explicit way to remove a device key,
   private-key /dev/null, so refusing the implicit removal only stops it
   happening by accident. It leaves the absent-means-cleared semantics
   of 780182e3 untouched, since peer attributes stay exactly as they
   are, and it covers every entry point at once, including ExecReload
   and hand-rolled setconf.

2) Alternatively, make the device key an explicit exception in syncconf
   only: pass a mode to config_read_init() so syncconf does not
   pre-assert HAS_PRIVATE_KEY, and let config_read_line() set it only
   when a PrivateKey line is parsed. This is the direct analogue of
   0b7d982 for the reload path. It does conflict with 780182e3's
   direction, in that it makes the device key behave unlike a peer psk.
   The argument for the exception is the blast radius above. The same
   question applies to HAS_LISTEN_PORT and HAS_FWMARK, and I think
   fwmark wants this treatment regardless.

3) Kernel-side, have wg_set_device() return -EINVAL for an all-zero
   WGDEVICE_A_PRIVATE_KEY rather than silently entering the
   identity-less state. That is the most robust option, since it also
   covers systemd-networkd, NetworkManager and anything else driving
   netlink directly. But it is a UAPI change, and today's setconf relies
   on the current behaviour to clear a key, so it would need to land
   with (1). The kernel already rejects the all-zero key one layer down,
   in curve25519_generate_public(); it just has no way to report it.

If none of those is wanted, it is at least worth documenting. wg(8)
should note under setconf and syncconf that an absent PrivateKey removes
the device's key, and wg-quick(8) should say that the strip/syncconf
reload idiom cannot be combined with out-of-band key configuration,
since it currently recommends both. That still leaves ExecReload=3D doing
it to people who read neither page.

Two diagnosability improvements worth having regardless. pretty_print()
could print "(none)" rather than omitting the key lines, since an
interface with no identity is always an error state. And the "Invalid
MAC of handshake" path could mention that the device has no private key,
since as it stands the message misdirects.

Happy to write a patch for (1), or (2) if you prefer. I did not want to
send one before checking which way you would want this to go, given
780182e3.

Thanks,
Tomas
