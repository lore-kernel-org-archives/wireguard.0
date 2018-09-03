Return-Path: me@jake.su
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48fac60a
 for <wireguard@lists.zx2c4.com>; Mon, 3 Sep 2018 22:54:25 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53ad4c7d
 for <wireguard@lists.zx2c4.com>; Mon, 3 Sep 2018 22:54:25 +0000 (UTC)
From: Jake McGinty <me@jake.su>
Subject: wg-dark: a tiny toy darknet
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <b896d1df-5f5a-5044-b4f9-5183851aaa43@jake.su>
Date: Mon, 3 Sep 2018 23:08:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: notrhodey@protonmail.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I thought I'd share a toy darknet to the list. It's p2p, but with a
coordinating server to deal with addressing and NAT holepunching.

The client is 134 lines of cross-platform bash. The coordinating server
is an additional ~175 lines of node.

repo: https://github.com/wg-dark/wg-dark


# How it works

A coordinating server is at an external address (ex. cool.dark.net) and
a fixed internal wg address (10.13.37.1). It handles 1) invites,
2) address assignment, and 3) peer announcements / NAT holepunching.

1) Any existing darknet peer GETs http://10.13.37.1:1337/invite, and
receives something like
"cool.dark.net:1337:6e435b7a2541b7443adebec9754fae9d". They give it to
an Invitee.

1) Invitee POSTs https://cool.dark.net:1337/join and sends its invite
code and a generated wg pubkey.

2) Server sends back an assigned address (ex. 10.13.37.2/32) and the
server's pubkey.

3) Invitee adds the server as a peer to a new wg interface.

4) Invitee GETs http://10.13.37.1:1337/status and receives a wireguard
configuration list of all peers with their latest endpoints.

5) Peers periodically repeats the status request to update their peer lists.

That's about it. It's incredibly feature-limited, quick, dirty, and has
infinite room for improvement.


<< Not for use for anything other than funsies. >>
