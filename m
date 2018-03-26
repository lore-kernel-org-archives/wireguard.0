Return-Path: smntov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70ba9317
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Mar 2018 19:32:23 +0000 (UTC)
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbe88ddd
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Mar 2018 19:32:22 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id a20so18217472wmd.1
 for <wireguard@lists.zx2c4.com>; Mon, 26 Mar 2018 12:44:17 -0700 (PDT)
Return-Path: <smntov@gmail.com>
Message-ID: <1522093454.2044.57.camel@gmail.com>
Subject: Re: WG: ideas/features
From: ST <smntov@gmail.com>
To: wireguard@eldondev.com
Date: Mon, 26 Mar 2018 22:44:14 +0300
In-Reply-To: <20180326191507.GD28484@npcomp.net>
References: <1522084637.2044.53.camel@gmail.com>
 <20180326191507.GD28484@npcomp.net>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, 2018-03-26 at 15:15 -0400, wireguard@eldondev.com wrote:
> On Mon, Mar 26, 2018 at 08:17:17PM +0300, ST wrote:
> > 1. Labels.
> > 
> > Is it possible to add an optional label to a peer to make it a bit more
> > usable for humans (who tend not to remember IPs or keys). A label
> > associated with a peer is just a string (could be a first/last name,
> > email, "NY Office" or whatever). So if you read through the .conf file
> > or query wg for that label - you can get the right IP to SSH to, if
> > needed.
> > 
> > In the .conf file it could probably be realized through some sort of
> > comments before each [Peer] section (didn't check whether # or something
> > actually work). But querying wg from command line for a label is also
> > handy...
> > 
> 
> I would probably just use a hosts file for this. That way, applications
> don't have to worry about "how do I get this info from wg," they just
> resolve it in the normal way. Am I missing something?

This way you'll have to maintain two files, hope that Peers' IPs do not
change too often, so you have to re-map them. But generally it's a
solution. Thank you!
