Return-Path: smntov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc791b4b
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Mar 2018 17:05:29 +0000 (UTC)
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
 [209.85.128.176])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0df904a
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Mar 2018 17:05:28 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id l49so10554852wrl.4
 for <wireguard@lists.zx2c4.com>; Mon, 26 Mar 2018 10:17:22 -0700 (PDT)
Return-Path: <smntov@gmail.com>
Received: from debox ([37.26.147.170])
 by smtp.gmail.com with ESMTPSA id z12sm10821993wrg.20.2018.03.26.10.17.19
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Mar 2018 10:17:21 -0700 (PDT)
Message-ID: <1522084637.2044.53.camel@gmail.com>
Subject: WG: ideas/features
From: ST <smntov@gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Mon, 26 Mar 2018 20:17:17 +0300
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

as I mentioned before I'm learning WireGuard and there are certain
things that I need but didn't find them yet in the docs (either because
I didn't read enough yet or because it's just not there). I'll list them
here and you'll tell whether it is worth for a new feature or not; or
whether I should continue reading...


1. Labels.

Is it possible to add an optional label to a peer to make it a bit more
usable for humans (who tend not to remember IPs or keys). A label
associated with a peer is just a string (could be a first/last name,
email, "NY Office" or whatever). So if you read through the .conf file
or query wg for that label - you can get the right IP to SSH to, if
needed.

In the .conf file it could probably be realized through some sort of
comments before each [Peer] section (didn't check whether # or something
actually work). But querying wg from command line for a label is also
handy...


2. Includes in .conf files.

Is it possible to include .conf files in the main wg0.conf file? Like:

[Interface]
...

Include ./us_peers.conf
Include ./eu_peers.conf

[Peer]
...

This way you can group peers into pools, so there will be a bit more
order/structure...

But what I envision it for is easy maintenance of an N:N mesh of nodes
where each node can communicate with all others. Each node's .conf file
will consist of only 2 things: its own [Interface] with private data and
one Include ./my_complete_mesh.conf with the public data of all [Peer]s.
This single Include file can be put in a central location (or mirrored
to several locations for failover) and all peers will pull it from there
once in a while through a cron job or it can be pushed to them with
rsync/ansible/ssh or whatever.

What do you think?

Thanks.
