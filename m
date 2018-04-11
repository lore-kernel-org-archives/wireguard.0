Return-Path: chm.duquesne@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39c9c81b
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Apr 2018 20:32:12 +0000 (UTC)
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
 [209.85.192.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52e6ae71
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Apr 2018 20:32:12 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id c78so1656020pfj.6
 for <wireguard@lists.zx2c4.com>; Wed, 11 Apr 2018 13:46:08 -0700 (PDT)
MIME-Version: 1.0
Sender: chm.duquesne@gmail.com
In-Reply-To: <CAHLp1Yk8oz-agDoJzKuU1SK9zsFL7HKep02r-n3hNcrYffp-CQ@mail.gmail.com>
References: <CAHLp1Yk8oz-agDoJzKuU1SK9zsFL7HKep02r-n3hNcrYffp-CQ@mail.gmail.com>
From: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Wed, 11 Apr 2018 22:45:46 +0200
Message-ID: <CAHLp1YndY6g+WdQbNOYdo5AdGR22doGZN0_cVc+f2pG=bn8F-Q@mail.gmail.com>
Subject: Re: wg-ip,
 a tool to assign automatic ip addresses to wireguard interfaces
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hum, I thought this thread had gone unanswered because nothing ever
reached my inbox, but I just found out about the answers browsing the
archive:

from https://lists.zx2c4.com/pipermail/wireguard/2018-April/002594.html:
> I'm interested in it being integrated into WG, as it is exactly what I
> asked for in this list several weeks ago.

Ok, I should rephrase what I wrote: it is more _if_ the wireguard
authors think it would be relevant to host this script directly in the
wireguard repo, I will gladly send a patch. In any case, I will
maintain this separately for my own use.

from https://lists.zx2c4.com/pipermail/wireguard/2018-April/002595.html:
> PS: you write that the "tool does not handle collisions", but does it
> recognize and/or warn about them? I.e. if a peer with the newly
> suggested IP exists already - will it warn?

No, no detection is attempted. The script will not warn you.

> For automation it would be nice to have some sort of "force" or
> "keep-trying" options, so the tool regenerates the keys trying to find a
> free IP and subsequently assigns it. With the enabled SaveConfig options
> the new IP will be saved in the config file...

This is why there is a 'gen' command to make an ip for a single
pubkey. I do not see a good way to extract that info from a particular
wireguard interface, because this interface might not know all other
peers involved in the network, so it I find it pointless to scan for
collisions since you can do this and it will still go undetected.

If you want absolutely want to be sure to generate a key pair which
generates an ip that is garanteed to not collide with existing peers,
it should be fairly straightforward. Assuming all the ips of existing
peers are in the file 'ips':

for i in ($seq 1 1000); do # try 1000 times
  privkey=$(wg genkey)
  ip=$(echo $privkey | wg pubkey | xargs wg-ip gen)
  if ! grep -qs "^$ip$" ips; then
    echo privkey: $privkey
    echo pubkey: $(echo $privkey | wg pubkey)
    break
  fi
done
echo "Could not generate a non colliding key"

I could add this to the script, but I figured that for the number of
peers I have and for the network ranges I am using, it is utterly
pointless. How many peers do you intend to have?

By the way, I just took care of removing all bashisms and I added
automated testing of this script with the 'dash' shell. It should be
safe to run on platform where bash is not present, such as openwrt.

Cheers,
Christophe-Marie
