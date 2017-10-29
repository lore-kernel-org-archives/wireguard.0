Return-Path: geokozey@mailfence.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6d3b4a6
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Oct 2017 12:19:22 +0000 (UTC)
Received: from wilbur.contactoffice.com (wilbur.contactoffice.com
 [212.3.242.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 695dec4e
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Oct 2017 12:19:22 +0000 (UTC)
From: Geo Kozey <geokozey@mailfence.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Message-ID: <801971811.33026.1509279684633@ichabod.co-bxl>
In-Reply-To: <CAHmME9quj4hEy37B-+HgP1GZRjF__mZ6YGC3V+NDeGsH7JksKA@mail.gmail.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
 <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
 <44ac12fe-685b-730e-8afd-e4081daf038d@solidadmin.com>
 <CAHmME9oSNNG7-CrC5Emuvi33JD=PBD4rXkwoJABnUcn6-oh6yg@mail.gmail.com>
 <92b6b9c5-b07c-52fa-a72a-0fc2dcc253bc@solidadmin.com>
 <CAHmME9pn977yhsu-rVdR-Mz+ZnsrUaxjQYxc2SveYL9zKNXB4w@mail.gmail.com>
 <87she4fdol.fsf@fifthhorseman.net>
 <CAHmME9r0ji7bE4kzJ6964y8kzt061rUOLFKGfCJbpO19sTOMRw@mail.gmail.com>
 <87ineze3x2.fsf@fifthhorseman.net>
 <CAHmME9quj4hEy37B-+HgP1GZRjF__mZ6YGC3V+NDeGsH7JksKA@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Date: Sun, 29 Oct 2017 13:21:24 +0100 (CET)
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Reply-To: Geo Kozey <geokozey@mailfence.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

October 28, 2017 7:57:06 PM CEST "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

>On Oct 28, 2017 5:03 PM, "Daniel Kahn Gillmor" <dkg@fifthhorseman.net> wrote:
>
>My concern with the resolvconf model (whether implemented by openresolv
>or not) is that each daemon that needs to execute resolvconf needs to be
>root.
>
>1) wg-quick isn't a daemon, though openvpn is.
>
>2) I can think of at least 5 ways to implement a resolvconf binary without requiring root, making your argument moot. There's nothing inherent in the resolvconf model that would require it.
>
>If you're interested in spending the time implementing this for openresolv, I can spec those out in detail for you. Alternatively, you can just wait for the systemd devs to add a resolvconf for controlling systemd-resolved, if that's the horse you're betting on.

FYI you can already change DNS through resolvconf from non-root daemons with correct file permissions or ACLs but that's off-topic.

Yours sincerely

G. K.
