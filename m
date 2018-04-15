Return-Path: smntov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 670ef347
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 17:35:32 +0000 (UTC)
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
 [209.85.128.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34c40713
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 17:35:32 +0000 (UTC)
Received: by mail-wr0-f171.google.com with SMTP id q6so7829733wrd.6
 for <wireguard@lists.zx2c4.com>; Sun, 15 Apr 2018 10:49:58 -0700 (PDT)
Return-Path: <smntov@gmail.com>
Received: from debox ([37.26.147.242])
 by smtp.gmail.com with ESMTPSA id b5sm1068339wrh.67.2018.04.15.10.49.55
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 15 Apr 2018 10:49:56 -0700 (PDT)
Message-ID: <1523814593.1990.49.camel@gmail.com>
Subject: SFTP-based VPN bootstrapping with automatic collision-free IPs
 assignment/peers' public data sharing
From: ST <smntov@gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Sun, 15 Apr 2018 20:49:53 +0300
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

Hi,

after recent searching/thinking about how to span a VPN from a single
publicly visible server with automatic collision-free IPs
assignment/peers' public data sharing, I came to following scheme.
Please provide your feedback on what possible improvements/security
holes/pitfalls might be...

Everything starts with a central server that has it's WG interface up
and running. As almost every server out there has SSH running - we will
rely on it for communication with new peers that want to join the VPN.
We'll setup an chrooted SFTP account with known public/private SSH keys
to be used by new peers. Only one directory of this account will be
used. On start there will be 2 files:

- hosts_appendix - pool of currently free/assigned IPs (root-owned
read-only for peers)
- read-only link on /etc/wireguard/wg-interface.conf.d/all_peers.conf -
public data (IP/public key) of all peers on the network

How it works:

1. hosts_appendix (/etc/hosts like file which will consist of generated
IPs of desired subnet to use, ways to do this:
https://stackoverflow.com/a/31412705/1876484 ). It doesn't have to cover
the whole range, but rather only part and once the free pool of IPs
becomes nearly exhausted one can just append another piece of IPs to
this file.
So at the beginning it will look like:
10.0.0.1
10.0.0.2
...
10.0.3.128

Once a new peer wants to request an IP it downloads the hosts_appendix
file from the server through SFTP, takes a random line in the file and
then scans it until it sees first free IP. In order to obtain the
discovered IP the peer creates on the server a file with only one line
inside - its public key, the name of the file is the IP that the peer
requests. This way many peers may attempt to obtain IPs from the same
pool without the fair of collisions. (If the peer can't create a file
with that name - seemingly another peer tried to obtain it already, even
though it wasn't marked as assigned inside the hosts_appendix file yet).
Then the peer creates its WG interface based on this IP.

2. Once in a while (through cron) or immediately (through an inotify
event) the server will see the newly created 10.0.2.113 file and do the
following:

(a) mark the IP as assigned inside hosts_appendix by appending in the
relevant line a comment with peers public key, like

...
10.0.2.113 # Ad32dd4kc9d...
...
if desired hostnames can be used as in regular /etc/hosts:
10.0.2.113 recently_joined_peer # Ad32dd4kc9d... 
so that if peers append this file to their local /etc/hosts/ they will
be able to ping/ssh/whatsover by the hostname as well.

(b) then the server adds this new peer to its WG interface and adds the
peer to the file /etc/wireguard/wg-interface.conf.d/all_peers.conf

(c) the server removes the 10.0.2.113 file with the peer's public key.

Once the peer downloads
the /etc/wireguard/wg-interface.conf.d/all_peers.conf file it knows
_ALL_ other peers on the network and can communicate with all of them
directly.

What do you say?

My problem is that I don't have too much experience with bash/python
scripting, so I'm wondering what would be easier to implement the above
or just use tinc with avahi:

https://www.tinc-vpn.org/examples/zeroconf-ip-and-dns/

Thank you!
