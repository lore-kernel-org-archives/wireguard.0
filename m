Return-Path: joe@solidadmin.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f021ff8
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 14:45:28 +0000 (UTC)
Received: from conquer.yellowcord.com (conquer.yellowcord.com [45.55.224.114])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88e8e52b
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 14:45:27 +0000 (UTC)
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Martin Hauke <mardnh@gmx.de>,
 Daniel Kahn Gillmor <dkg@fifthhorseman.net>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
 <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
From: Joe Doss <joe@solidadmin.com>
Message-ID: <44ac12fe-685b-730e-8afd-e4081daf038d@solidadmin.com>
Date: Fri, 27 Oct 2017 09:47:10 -0500
MIME-Version: 1.0
In-Reply-To: <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 10/26/2017 04:22 PM, Jason A. Donenfeld wrote:
> So, if I don't ship the hatchet, then I'll leave it to you to handle
> making things not totally fail in Fedora, as they do now. Is this
> okay? You could choose to fix this by just shipping the hatchet patch
> yourself. Or you could try to integrate things a bit deeper with
> whatever networkmanagersystemdresolveddhclientscript situation is
> being used there. (Probably the hatchet is a bit easier though.) What
> would you think of doing that?

I feel this is OK since any WG users at this point are going to accept 
their fate that not all features are going to work correctly. I would 
like to accept the networkmanagersystemdresolveddhclientscript physical 
challenge and try and see if there is some better way to integrate 
things in Fedora before having to ship patches in the RPM to shoehorn 
things in place.

Joe





--
Joe Doss
joe@solidadmin.com
