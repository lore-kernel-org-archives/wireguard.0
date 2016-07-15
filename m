Return-Path: jonathan@titanous.com
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e7c9aa0
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 21:50:18 +0000 (UTC)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Jonathan Rudenberg <jonathan@titanous.com>
In-Reply-To: <CAHmME9q5=Yr6PVfaH73C6NrJFe8w=0mjYpOqwMi1a4wOwy8cLg@mail.gmail.com>
Date: Fri, 15 Jul 2016 17:51:32 -0400
Message-Id: <19D6956C-C777-47E3-8102-A31686CEFEC0@titanous.com>
References: <20160712231438.GF5136@gradx.cs.jhu.edu>
 <CAHmME9qvXU0GDfjT+4PrvPK3XTUU7LFz8S0b_n_XtJw3wrT7Dw@mail.gmail.com>
 <87inw9q5d1.fsf@alice.fifthhorseman.net>
 <CAHmME9qqZoyOqmPW=g_Lnp7R0-X_9q4+nXpUwoKKrS6UXxDDmQ@mail.gmail.com>
 <57892EF7.7010204@izri.org>
 <CAHmME9q5=Yr6PVfaH73C6NrJFe8w=0mjYpOqwMi1a4wOwy8cLg@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard key lifetime / keys in smartcard?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

FWIW, the STM32F415 claims to have a hardware RNG and some capabilities =
to protect secrets stored in the onboard flash. The SC4-HSM apparently =
has TweetNaCl running on it: https://sc4.us/hsm/

No information on the performance of Curve25519 that I=E2=80=99m aware =
of.=
