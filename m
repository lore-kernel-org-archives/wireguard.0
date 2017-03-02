Return-Path: peter@lekensteyn.nl
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 952d1b47
 for <wireguard@lists.zx2c4.com>; Thu, 2 Mar 2017 16:56:26 +0000 (UTC)
Received: from lekensteyn.nl (lekensteyn.nl [178.21.112.251])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2058c52
 for <wireguard@lists.zx2c4.com>; Thu, 2 Mar 2017 16:56:26 +0000 (UTC)
Date: Thu, 2 Mar 2017 17:58:17 +0100
From: Peter Wu <peter@lekensteyn.nl>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Subject: Re: Encapsulation
Message-ID: <20170302165817.GA23695@al>
References: <CACCLhZQtterheuB9NF4ppEAYbLKXtsPzCEnMGdtAS5KKVfPEjQ@mail.gmail.com>
 <871sugpifa.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <871sugpifa.fsf@alice.fifthhorseman.net>
Cc: James Wilson <ehdot795@gmail.com>, wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Mar 01, 2017 at 05:38:01PM -0800, Daniel Kahn Gillmor wrote:
> On Wed 2017-03-01 16:38:05 -0800, James Wilson wrote:
> > Hi,
> >
> > Just out of curiosity, how does a "wireguard packet' look like on the wire
> > ??
> >
> > I'm guessing:
> >
> >  Ethernet
> >  IP
> >  UDP
> > |------------------|
> > | IP               |
> > | WG payload       |
> > |------------------|
> >
> >
> > What's in the box is encrypted
> >
> > Is that right ?? If not, what does it look like?
> 
> I believe the cleartext (after decryption) is an actual IP packet, so
> everything from layer3 up the stack.

It is more like:

    Ethernet
    IP (to WireGuard peer)
    UDP (UDP payload is as follows:)
        WireGuard header (type, counter)
        Packet (encrypted, decrypted contents are as follows:)
            IP (original)
            (IP payload like ICMP, TCP, etc.)

If it helps, see this picture of the packet dissection for an ICMP
packet tunneled over WireGuard: https://i.imgur.com/MzubvX3.png

> If anyone wants to document this sort of thing explicitly in a useful
> way, you might consider writing a wireshark dissector:

As you can see above I have already been working on one and will publish
it soon after adding some documentation. :-)
-- 
Kind regards,
Peter Wu
https://lekensteyn.nl
