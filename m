Return-Path: dfawcus@employees.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf388aa4
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 11:11:24 +0000 (UTC)
Received: from accordion.employees.org (accordion.employees.org
 [198.137.202.74])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78ca575a
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 11:11:24 +0000 (UTC)
Date: Fri, 20 Apr 2018 12:11:36 +0100
From: Derek Fawcus <dfawcus+lists-wireguard@employees.org>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: PMTU Discovery Security Concerns
Message-ID: <20180420111136.GA8120@accordion.employees.org>
References: <CAHmME9owJaafkWfz8ruaKWqATmQ9gfoxNtZNyxRJFjyQgr7yvw@mail.gmail.com>
 <CAK_h9uFHeYPaiPVBC+PQi-YOAOCbp6LVTsbM+r8cO4DNmp6RxA@mail.gmail.com>
 <CAHmME9p0Co58utbbd=xA3o2a_+X5YAejQ6qNROLCUczuJ6nqsw@mail.gmail.com>
 <CAK_h9uGaQZ_djbWJTbTZ71uEw9KsXuqHCQ6QYSKqMWjgUeqieA@mail.gmail.com>
 <CAHmME9p7tcwyQEZ5M8NjW_qvEOaw1pzXKtYZ+t3iWWJZ8y=mOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHmME9p7tcwyQEZ5M8NjW_qvEOaw1pzXKtYZ+t3iWWJZ8y=mOg@mail.gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Apr 16, 2018 at 07:23:29AM +0200, Jason A. Donenfeld wrote:
> > See RFC4821, RFC8085 and
> > https://tools.ietf.org/html/draft-ietf-tsvwg-datagram-plpmtud-01
> > for more info about PLMTUD.
> >
> > https://datatracker.ietf.org/meeting/101/materials/slides-101-ipsecme-packetization-layer-path-mtu-discovery-01
> > has a quick overview of where IPsec stands with implementing it.
> 
> Thanks for these. I followed the rabbit hole, and found [1], which
> seems to be the current latest and greatest from the IPsec people.
> It's probes inside the control plane.

Using something based upon that UDP version of PLMTUD would seem to
be the correct approach, sending probe packets protected by the
encryption layer.

Rather than have it totally based upon the control layer, one could
use a data layer notification of decrypted packets arriving to
indicate that certain sizes have been received, then reflect those
back to the sender in a minimal encrypted ack packet.  i.e. something
similar to how solicited probe responses operate for IPv6 NDP.

Keep in mind that the PMTU may be different in the two directions.

DF
