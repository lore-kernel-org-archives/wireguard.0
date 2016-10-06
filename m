Return-Path: alex_y_xu@yahoo.ca
Received: from nm3-vm0.bullet.mail.bf1.yahoo.com
 (nm3-vm0.bullet.mail.bf1.yahoo.com [98.139.212.154])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9f499e1
 for <wireguard@lists.zx2c4.com>; Thu, 6 Oct 2016 17:31:21 +0000 (UTC)
Date: Thu, 6 Oct 2016 13:42:47 -0400
From: Alex Xu <alex_y_xu@yahoo.ca>
To: wireguard@lists.zx2c4.com
Message-ID: <20161006134247.347b1040@alex-archsus>
In-Reply-To: <1475771658.1684011.747950545.01B63CCC@webmail.messagingengine.com>
References: <1475719977.650386.747317105.1837502D@webmail.messagingengine.com>
 <20161006150310.GB30704@wolff.to>
 <1475771658.1684011.747950545.01B63CCC@webmail.messagingengine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: Re: [WireGuard] auth-only wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, 06 Oct 2016 09:34:18 -0700
Jehan Tremback <jehan@altheamesh.com> wrote:

> Let me be more specific about my application. I'm trying to create a
> system where routers in a "mesh" network (mixed ad-hoc wifi and
> ethernet) pay their neighbors, or are paid by their neighbors for
> bandwidth. To make this happen, I've got to be able to identify
> traffic from specific neighbors with something less spoofable than MAC
> addresses. Creating tunnels between neighbors fits the bill for now,
> and gives me a good handle to apply traffic shaping to different
> neighbors. The encapsulating tunnel packet will have the source IP
> address of the previous hop neighbor, and will be sent to the next
> hop neighbor, and can be prioritized . Authentication keeps anyone
> from spoofing addresses and stealing bandwidth.

So... now everybody can spy on each other's traffic instead of
also spoofing it. That doesn't seem like a huge improvement to me.
