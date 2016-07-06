Return-Path: dkg@fifthhorseman.net
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Bruno Wolff III <bruno@wolff.to>
In-Reply-To: <CAHmME9qs42O4KQtsuZDdPGPKEkyxGhHEGxB3crkrgrAaLDKh3w@mail.gmail.com>
References: <20160706120410.GA765@wolff.to>
 <CAHmME9qs42O4KQtsuZDdPGPKEkyxGhHEGxB3crkrgrAaLDKh3w@mail.gmail.com>
Date: Wed, 06 Jul 2016 11:28:25 -0400
Message-ID: <878txess4m.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
Cc: WireGuard mailing list <WireGuard@lists.zx2c4.com>
Subject: Re: [WireGuard] Comments on wgserver.service
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed 2016-07-06 10:33:02 -0400, Jason A. Donenfeld wrote:
> Please feel free to make wgserver.service into a more robust unit file
> and send patches (git-send-email), or make a few different unit files
> show casing different types of configurations. I'm not a huge systemd
> guy, so I just sort of threw that together haphazardly. It'd be nice
> also to see this integrated into systemd-networkd and the .network
> units.

I agree with this integration.  The current wireguard configuration is
actually pretty close to a .network unit, but not exactly aligned.

Arguably, it'd be more in-scope for a .netdev unit (see systemd.nedev(5)
than a .network unit, though.

If we could coax the wireguard config format to use config sections
identical to .netdev units, it'd probably be easier to approach
systemd-networkd about integration.  if none of the standard netdev
sections (aside from the descriptive [Netdev] section and the
conditional [Match] section) seem like they should be reusable for
wireguard ([Tunnel] doesn't seem to match exactly), maybe it's worth
defining the sections as [Wireguard] (currently [Interface]) and
[WireguardPeer] (currently [Peer]).

            --dkg
