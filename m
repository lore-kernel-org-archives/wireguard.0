Return-Path: jehan@altheamesh.com
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e0c6fe5
 for <wireguard@lists.zx2c4.com>; Thu, 6 Oct 2016 16:22:49 +0000 (UTC)
Message-Id: <1475771658.1684011.747950545.01B63CCC@webmail.messagingengine.com>
From: Jehan Tremback <jehan@altheamesh.com>
To: Bruno Wolff III <bruno@wolff.to>
MIME-Version: 1.0
Content-Type: text/plain
Date: Thu, 06 Oct 2016 09:34:18 -0700
In-Reply-To: <20161006150310.GB30704@wolff.to>
References: <1475719977.650386.747317105.1837502D@webmail.messagingengine.com>
 <20161006150310.GB30704@wolff.to>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] auth-only wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Let me be more specific about my application. I'm trying to create a
system where routers in a "mesh" network (mixed ad-hoc wifi and
ethernet) pay their neighbors, or are paid by their neighbors for
bandwidth. To make this happen, I've got to be able to identify traffic
from specific neighbors with something less spoofable than MAC
addresses. Creating tunnels between neighbors fits the bill for now, and
gives me a good handle to apply traffic shaping to different neighbors.
The encapsulating tunnel packet will have the source IP address of the
previous hop neighbor, and will be sent to the next hop neighbor, and
can be prioritized . Authentication keeps anyone from spoofing addresses
and stealing bandwidth. 

Anyway, I'm experimenting with fastd right now, and it's working, but
WireGuard seems like a very nicely designed and executed piece of
software so I thought I'd ask. I understand that WireGuard is designed
to be very focused on a traditional VPN server usecase, so more
configurability may not be something you want to support. 

> Without encryption you authentication won't be useful against attackers 
> that can modify packets or insert packets with the source address of your 
> contact.

Isn't this exactly what authentication prevents? If the signature does
not match the sender and the packet content, it will fail authentication
by definition, at least by any definition of authentication that I am
familiar with.

-Jehan

-- 
  Jehan Tremback
  jehan@altheamesh.com

On Thu, Oct 6, 2016, at 08:03 AM, Bruno Wolff III wrote:
> On Wed, Oct 05, 2016 at 19:12:57 -0700,
>   Jehan Tremback <jehan@altheamesh.com> wrote:
> >Are there any plans, or would you even consider, adding an option to
> >WireGuard to disable encryption, and only authenticate packets? I'm
> >assuming that an authentication-only mode would be significantly faster
> >(maybe I'm wrong though). My use-case only needs auth, so if I were to
> >use WireGuard, the encryption would be redundant.
> 
> That would depend on how fast your internet connection is and how much
> CPU 
> power you have. I suspect in many cases the extra latency is negligible 
> and it would be rare for encryption to be limiting bandwidth.
> 
> Without encryption you authentication won't be useful against attackers 
> that can modify packets or insert packets with the source address of your 
> contact.
