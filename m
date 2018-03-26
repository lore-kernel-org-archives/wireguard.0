Return-Path: wireguard@eldondev.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84a856ad
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Mar 2018 19:03:15 +0000 (UTC)
Received: from npcomp.net (npcomp.net [69.61.8.91])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id beecd1df
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Mar 2018 19:03:15 +0000 (UTC)
Date: Mon, 26 Mar 2018 15:15:07 -0400
From: wireguard@eldondev.com
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: WG: ideas/features
Message-ID: <20180326191507.GD28484@npcomp.net>
References: <1522084637.2044.53.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1522084637.2044.53.camel@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Mar 26, 2018 at 08:17:17PM +0300, ST wrote:
> 1. Labels.
> 
> Is it possible to add an optional label to a peer to make it a bit more
> usable for humans (who tend not to remember IPs or keys). A label
> associated with a peer is just a string (could be a first/last name,
> email, "NY Office" or whatever). So if you read through the .conf file
> or query wg for that label - you can get the right IP to SSH to, if
> needed.
> 
> In the .conf file it could probably be realized through some sort of
> comments before each [Peer] section (didn't check whether # or something
> actually work). But querying wg from command line for a label is also
> handy...
> 

I would probably just use a hosts file for this. That way, applications
don't have to worry about "how do I get this info from wg," they just
resolve it in the normal way. Am I missing something?
