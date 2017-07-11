Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d687f16
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 23:28:40 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5412ac7
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 23:28:40 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Installation instructions for Debian
In-Reply-To: <20170708141402.GA13268@tuxmachine.polynome.dn42>
References: <20170513070534.GA22218@tuxmachine.polynome.dn42>
 <CAHmME9o=EGWOcTRVtVQVCoJXL6KueX8eM98GWBJUtzEE67tAhw@mail.gmail.com>
 <20170708141402.GA13268@tuxmachine.polynome.dn42>
Date: Tue, 11 Jul 2017 19:36:02 -0400
Message-ID: <87mv8ay2al.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sat 2017-07-08 16:14:02 +0200, Baptiste Jonglez wrote:

> I think there is a small mistake in the installation instruction for
> Debian, sorry about that: the "Pin-Priority" should be set to 150 instead
> of 200.
>
> Long explanation: on jessie, the jessie-backports repository also has a
> priority of 200.  After enabling unstable with the same priority, APT will
> propose to upgrade all packages from jessie-backports to unstable, which
> is probably not wanted nor expected.
>
> Daniel, does that all make sense?

Yep, that sounds reasonable to me.  fwiw, apt_preferences(5) indicates
what the different cutoffs for priorities are, and explains why
jessie-backports defaults to something in the 200 range ("NotAutomatic:
yes" and "ButAutomaticUpgrades: yes"), and 150 should still have the
same properties (it's above 100, but below 500).

     --dkg
