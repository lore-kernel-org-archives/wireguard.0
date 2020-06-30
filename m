Return-Path: <SRS0=5l8i=AL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458B3C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Jun 2020 08:02:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E5612067D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Jun 2020 08:02:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFftNEPM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E5612067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef1d2b4e;
	Tue, 30 Jun 2020 07:42:25 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6eaeee89
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Jun 2020 07:42:23 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id k15so10790221lfc.4
 for <wireguard@lists.zx2c4.com>; Tue, 30 Jun 2020 01:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BnDmObvUdz6HC2NMOvMiYOrKrmYlkuduxpixFUuaphE=;
 b=hFftNEPMzOtJyC+xvP99acPVvJseWPKxEOhTp03XZp+jrFb3q/tp9O1sw/+4f3jwJX
 DyBdNo3iQTAbzYiIqoahp/qA9v0eNBX1PhZL9E6VeykUP4v279z2qt4aXZuhUVTNfLw/
 bVaYT0baJYkJFMMd1KtB80w/mCxvSg7AbGbDRWCLoqwN+VmtzZHsqBIcKX+ByLEPWx7C
 gqY57dLne+2WLtEU8cFbPCQZeHp62bn0kxQC4AyNgPE4/bG43H1R+yrTXAwwBEJ10yir
 koDSadJ9iNYw9hz0OoMcTq85vlnKRwi7FE3tUw5ScgMEfXoH8Zcv4wjZh6ypkIwdDsv5
 7uTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BnDmObvUdz6HC2NMOvMiYOrKrmYlkuduxpixFUuaphE=;
 b=Yc3cl/i/vZiQiUrLSgV/00gIF2Nf6feG+3360/7g4T6yb6Q96tkFoADwkQMiF0LPRM
 RWYWv8a22sPfPSfogzPXqczY1efAPXbHSCSR7khO2z84mWnEQL0/99tpjLQPlWanfLYE
 1pPc7REcfRyC9i9WAWHdVvzpRzEe+WR1iHl3558+FjHu1rZoGUpekFVRCkSM47b166cI
 jRSWBlK01tL2n7TNiB4FRuvkygHUlvek8KnJF2g/YFo/dRQ13IudiLyLwEhp9jhAivD8
 mzJVy0iY7hhUIhcDzRgMbOjcYEofcxEhYq1DIE4VEYgzH0Z2BUI3CdIUNtqCDploDaKD
 ibgg==
X-Gm-Message-State: AOAM530DduDkZMASXKROTvfLpyquVxpsAJjQWtJJPD/+rJDB1gKGrrtk
 irhFwWFMnEXR1hdFWghxbsIod/3Ja+Z17BuKWco=
X-Google-Smtp-Source: ABdhPJzS5yP8S1lyQEidRlLr6cQp6MqW569tQ6wMH3HxrJsCD5HuoVPOZgyBvP4X2JcHfpREBrxvR4sAxsPPMcyBY3c=
X-Received: by 2002:a19:87c2:: with SMTP id
 j185mr11377628lfd.183.1593504126897; 
 Tue, 30 Jun 2020 01:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
 <20171205035352.01ffe1f5@vega.skynet.aixah.de>
 <CAHmME9ouUNV4pc7qwr4bO-5bEecFc1U64PF13ExgmYnH9q45tw@mail.gmail.com>
 <20200624153706.3yngzzslepqh7q54@ws.flokli.de>
 <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
 <CAMaqUZ0nTL9mbYEifHP-sc8kQ6ehAOOWfmEb7ARNfZWWDkv4eA@mail.gmail.com>
 <875zbai32e.fsf@toke.dk> <20200629153118.4d72f447@natsu>
 <87r1tygmlv.fsf@toke.dk>
 <20200629163851.41d6d755@natsu> <87lfk6gjax.fsf@toke.dk>
 <910f09eb8b67bef5cc55114fe1b0bd6297ea2ec4.camel@gmail.com>
 <CAHmME9rsiejKsNw9Wq6noNPf46m=2eYu9o4e0EHj_=ek5phZig@mail.gmail.com>
 <CAMaqUZ1TkemV7Ocvx+VzHUbOJeEx_L4tVTPLzbzS4hzBu7TXaQ@mail.gmail.com>
 <CAHmME9prQFruLSsJ-jW1yF4ohfOkiqWR3Jjax=HDrLiQ5Dy_MQ@mail.gmail.com>
In-Reply-To: <CAHmME9prQFruLSsJ-jW1yF4ohfOkiqWR3Jjax=HDrLiQ5Dy_MQ@mail.gmail.com>
From: Reid Rankin <reidrankin@gmail.com>
Date: Tue, 30 Jun 2020 04:01:30 -0400
Message-ID: <CAMaqUZ3DV7zOgqz7xDT-EX8nNn1EmZjEj_J0TYJ2Ut46qqWJgw@mail.gmail.com>
Subject: Re: Standardized IPv6 ULA from PublicKey
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, 
 Roman Mamedov <rm@romanrm.net>, ch@ntrv.dk, Arti Zirk <arti.zirk@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

> Fun fact: initial versions of WireGuard from years ago weren't like
> this. We wound up redoing some crypto and coming up with the `_psk2`
> variant for this purpose. I'm glad it's useful. I'm interested to
> learn: what are you doing this for? Got any code online?

That's a dangerous question to ask, because I'm really excited about
it! It's an embedded device that connects otherwise-insecure stuff
together into a transparent overlay network that's centrally
configurable. You get a set of them in a box, plug one legacy
thingamabob into each, and all the devices show up in a GUI. You
configure all the IP allocations and allowed traffic flows, and an
included hardware token signs the configuration. You then throw the
master key into a safe somewhere, confident in the knowledge that even
if your network infrastructure is all broken into by
nation-state-du-jour your traffic will stay confidential; even if the
network you're using to communicate is re-addressed underneath you --
or your stuff is moved across the country -- none of your legacy stuff
will need reconfiguration; and even if the legacy stuff itself is
broken into, the network configuration is being enforced by hardware.
The boxes themselves have no persistent storage at all; in fact,
possession of a private key the devices don't have is required to
unlock the flash. The point is to resist malware infection by making
assured remediation as simple as power-cycling the unit -- eventually,
I'll have a dedicated microcontroller acting as a watchdog which
shorts the reset pin to ground if the unit can't provide a TPM-backed
health attestation every minute or so. The grand master plan is that
as soon as you hack in and try to run something interesting, it all
resets and you're back out again.

Of course, each unit can't be updated every time you need to add a new
one, and that's where the LLAs and in-band authentication stuff comes
in. New boxes use Zeroconf to find peers, after which they connect and
present the certificate authorizing their `AllowedIPs` and appropriate
firewall setup. My goal is for every packet that comes out of each
device except for ICMP, DHCP, and (m)DNS to be a WireGuard packet,
cutting the attack surface to the bone -- and until you present a
valid certificate, the only thing allowed inside the tunnel is TFTP.

Most of my code for this thing is all fairly hacky and
environment-specific at the moment -- that `wg-lla.sh` Gist from
before is the first real piece I've been able to clean up and
open-source. It's a fairly big project, but there are some more
sections that I'm fairly certain I'll end up releasing as well; for
example, the mesh-routing setup might be useful to some people. The
principle is that by "brute-forcing" the MAC1 field from handshake
initiations against the static public keys of all known peers, you can
figure out what peer (or, rather, peer's endpoint) to send the
handshake and subsequent flow towards, which makes every node in the
mesh a potential endpoint for any other peer in the mesh. There's also
a microcontroller-compatible implementation of WireGuard I'm working
on (though in the very early stages), targeted at the Cortex-M0
platform and written in purely `no_std`, `forbid(unsafe_code)` Rust.
All this stuff integrates into one big product in the end, but I'm
very open to hearing community feedback on which of these bits would
be most useful to others -- I'll prioritize them. (And if you're
really interested in any of it, it's all at least proof-of-concept,
and I do contract work!)

By the way, putting the PSK exchange at the end is useful for another
reason, too: you can use it to chain authentication mechanisms. The
key here is that the PSK can be updated after sending an initiation
packet, but before receiving the response. I've done an experiment
using nfqueue on the initiator to catch an outgoing handshake request
and stick an extra nonce on the end -- which is signed using a
secondary key. On the responder side, another nonce is chosen; a new
PSK, calculated by hashing the nonces, is set using `wg`, and the
initiator ID is noted. The handshake initiation is then released for
processing, which occurs using the freshly-set PSK. When WireGuard
sends the handshake response, nfqueue intercepts the outgoing packet,
matches the initiator ID, and sticks the responder's nonce on the end
encrypted to the secondary key. The initiator intercepts the response
with nfqueue, decrypts the second nonce, calculates the new PSK, and
issues the same `wg set` command before releasing the response packet.
This all works just fine (at least, as long as the daemon stays up),
proving that you can do interactive authentication out-of-band. I've
since realized that sticking the authentication I'm looking for inside
the tunnel is a much better choice for my application, but I'm glad to
have options.

> This sounds like a motivation for doing the LLv6 generation inside of
> your daemon, not inside of the kernel, right? In that case, your
> design must already take into account a malicious peer finding public
> key collisions after hashing.

I'm not actually looking for a feature here as much as I am a
standard, and this definitely shouldn't go in the kernel. (Heck, I
wrote a Blake2s implementation in Bash just so it wouldn't have to go
any deeper than `wg-quick`.) That said, part of me would really like
to see a command like `wg lla
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=` that spits out
`fe8b:5ea9:9e65:3bc2:b593:db41:30d1:0a4e`. That would serve the dual
purposes of avoiding running a hash algorithm in a shell script and
serving as a standard. There's not a lot of decisions to make when you
sit down with the goal to make an LLA from a public key hash -- I
listed them in my prior post, and I'm pretty sure it's exhaustive --
and it would be a shame if we didn't have sensible defaults to adopt.

As for security, a 256-bit ECC public key only gives 128 bits of
security in the first place. Hashing the key down to 16 bytes doesn't
hurt security, because it would take as much effort to find a
collision as it would to just run Pollard-rho and crack the key you're
trying to mess with. The compromise comes in when you start masking
off bits, and losing 10 bits to fit into `fe80::/10` isn't actually
that bad -- in fact, I argue that it's negligible, because finding a
colliding keypair requires an ECC scalar multiplication to determine
the public key associated with each private key guess. This easily
takes more than 1024 times as long as running the hash itself, meaning
that the process of finding a keypair that's a second-preimage of a
desired 118-bit LLA suffix actually takes longer than brute-forcing a
second-preimage of a 128-bit Blake2s hash. (For reference, Curve25519
takes [832457 cycles][1] for a single scalar multiplication; Blake2s
on a single 64-byte block takes [5.5 cycles per byte][2], or 352
cycles. These numbers are different microarchitectures, so it's kind
of an apples-to-oranges thing, but we're talking orders of magnitude
here.)

[1]: https://cr.yp.to/ecdh/curve25519-20051115.pdf
[2]: https://blake2.net/blake2.pdf
