Return-Path: markus.woschank@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b930602
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 18:34:24 +0000 (UTC)
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
 [74.125.82.181])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a8bb5dd
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 18:34:24 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id s4so2796527ote.4
 for <wireguard@lists.zx2c4.com>; Fri, 17 Nov 2017 10:38:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <cdf48a39-3d81-5269-dbb4-93929cdf081f@gmail.com>
References: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
 <CAKUy5axhFKvgeGY1FrP5S4UON2QPV=7jQjZM268qG-M3RCAcVw@mail.gmail.com>
 <593d6d3a-550e-a14d-4c1d-f7ee8e731d87@gmail.com>
 <CAKUy5axo5jO=6qv1XEsHvOUkcm6z7r4UW1hV+Oeomq_dJqQXJg@mail.gmail.com>
 <cdf48a39-3d81-5269-dbb4-93929cdf081f@gmail.com>
From: Markus Woschank <markus.woschank@gmail.com>
Date: Fri, 17 Nov 2017 19:38:54 +0100
Message-ID: <CAKUy5ax4zhSyQoAEMJvebphSKe71CNJOJVZc1n8D5QX89=_Veg@mail.gmail.com>
Subject: Re: Roaming Mischief
To: Aaron Jones <aaronmdjones@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> Roaming means that the current endpoint (at shutdown time) would be
> persisted, and if the reboot doesn't take very long, it is highly
> likely that the (new) endpoint does still make sense, particularly
> because UDP is used which means new sessions can usually resume as if
> nothing happened, even through a NAT (though if you are also behind a
> NAT, source port randomisation may trip you up if you don't have it
> forwarded through the remote one, but that's beside the point).

Thanks for the example, did not yet have look at wg-quick.

But I argue that the concept of configuration and state should not be mixed.
Having the configuration the same and saving the current state, not
via showconf which should be used for configuration and not state as
the name implies, to a different location and restoring that state
(the current endpoint of the roaming peers) would be much cleaner and
not mix up a state-store-operation that stores a so called
configuration mixed with state that includes the private key.

Markus
