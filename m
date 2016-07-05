Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bc8fb42
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 22:45:47 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <CAHmME9of+yaYna73cd+H-Mr+6q8c6QT_+mg==M4VGHX6ESckwQ@mail.gmail.com>
References: <8760snzxk6.fsf@alice.fifthhorseman.net>
 <CAHmME9of+yaYna73cd+H-Mr+6q8c6QT_+mg==M4VGHX6ESckwQ@mail.gmail.com>
Date: Tue, 05 Jul 2016 18:45:46 -0400
Message-ID: <87poqru2jp.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] stricter inputs for wg genkey, genpsk, and pubkey
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun 2016-07-03 13:48:52 -0400, Jason A. Donenfeld wrote:
>> + memcpy(private_key_normalized, private_key, sizeof(private_key_normalized));
>> + curve25519_normalize_secret(private_key_normalized);
>> + if (memcmp(private_key_normalized, private_key, sizeof(private_key_normalized))) {
>> + fprintf(stderr, "%s %s: private key was not in normalized form\n", PROG_NAME, argv[0]);
>> + return 1;
>> + }
>
> Do you have a justification for requiring normalized form?
> curve25519-donna doesn't care either way.

My justification was to ensure that the data "wg pubkey" received was as
close as possible to the data emitted by "wg genkey" -- genkey emits
normalized form, so i was following that form.  it makes it slightly
less likely to blindly accept some non-randomly-generated base64-encoded
256-bit string.

happy to go either way on this,

        --dkg
