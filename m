Return-Path: jbenc@redhat.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9aecb9dc
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 11:21:17 +0000 (UTC)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2079445e
 for <wireguard@lists.zx2c4.com>; Fri, 9 Dec 2016 11:21:17 +0000 (UTC)
Date: Fri, 9 Dec 2016 12:26:50 +0100
From: Jiri Benc <jbenc@redhat.com>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Subject: Re: Misalignment, MIPS, and ip_hdr(skb)->version
Message-ID: <20161209122650.36a1a8e8@griffin>
In-Reply-To: <87vauvhwdu.fsf@alice.fifthhorseman.net>
References: <CAHmME9o_eCNXpVztOZKW55kpRtE+1KSEQTQOjUBVn68Y2+or2g@mail.gmail.com>
 <095cac5b-b757-6f4a-e699-8eedf9ed7221@stressinduktion.org>
 <87vauvhwdu.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-mips@linux-mips.org, Netdev <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Hannes Frederic Sowa <hannes@stressinduktion.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, 07 Dec 2016 23:34:21 -0500, Daniel Kahn Gillmor wrote:
> fwiw, i'm not convinced that "most protocols of the IETF follow this
> mantra".  we've had multiple discussions in different protocol groups
> about shaving or bloating by a few bytes here or there in different
> protocols, and i don't think anyone has brought up memory alignment as
> an argument in any of the discussions i've followed.

Which is sad. One would expect that this would be well understood for
decades already.

 Jiri
