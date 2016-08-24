Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a19bb82d
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Aug 2016 01:06:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c623b221
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Aug 2016 01:06:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 79a3e045
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Aug 2016 01:06:44 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id l89so1203219lfi.1
 for <wireguard@lists.zx2c4.com>; Tue, 23 Aug 2016 18:12:49 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 24 Aug 2016 03:12:47 +0200
Message-ID: <CAHmME9qHG=+n30G=XqaGDMP12kpyqKpw2AcnWjgwxik1fXqhkw@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Subject: [WireGuard] NAT Hole Punching PoC/Example
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey folks,

Many have asked about NAT traversal and hole punching, and I've
explained that since WireGuard is just usual UDP, you can use any of
the typical techniques. Not satisfied with that, people have demanded
examples. So, I coded up a very short proof of concept of the most
basic hole punching mechanism that integrates with WireGuard. Note:
this is PoC/example code, and as such it has a number of security
problems and thus should not be used in the real world (distros: do
NOT compile and install this); however, it suffices as a nice
illustration of the underlying concepts.

Voila: https://git.zx2c4.com/WireGuard/tree/contrib/examples/nat-hole-punching

Compile with:
    $ gcc nat-punch-client.c -o client -lresolv
    $ gcc nat-punch-server.c -o server

On the server, simply run "./server" and make sure UDP:49918 is open.
Then, for each client, configure the various peers of a wireguard
interface, as you would normally, except you can omit the endpoint.
That's what the hole punching client adds for us. For each client,
simply run:

    # ./client demo.wireguard.io wg0

It will run until it's received the correct path to all of the peers
of wg0. Replace demo.wiregaurd.io with your own server, or use (but do
not abuse!) the demo instance running on the demo box.

Demo:

# wg show wg0
interface: wg0
  public key: bqodvMJALCmDU32kcjA/cG4ZMTaX/IihN2NruSGhDXo=
  private key: (hidden)
  listening port: 25586

peer: aQoADFvA1zZmCs40G/gp1jDCEgRVyWwSWT463VIxXCQ=
  allowed ips: 192.168.88.2/32

peer: T3TEQxBh/+4sxuIOUhc2T8VVDhD8JBoM/V3/v72NNDI=
  allowed ips: 192.168.88.3/32

# ./client demo.wireguard.io wg0
[+] Requesting IP and port of
aQoADFvA1zZmCs40G/gp1jDCEgRVyWwSWT463VIxXCQ=: 65.182.136.126:999
[+] Requesting IP and port of
T3TEQxBh/+4sxuIOUhc2T8VVDhD8JBoM/V3/v72NNDI=: 88.190.101.12:51821

# wg show wg0
interface: wg0
  public key: bqodvMJALCmDU32kcjA/cG4ZMTaX/IihN2NruSGhDXo=
  private key: (hidden)
  listening port: 25586

peer: aQoADFvA1zZmCs40G/gp1jDCEgRVyWwSWT463VIxXCQ=
  endpoint: 65.182.136.126:999
  allowed ips: 192.168.88.2/32
  latest handshake: 36 seconds ago
  bandwidth: 110 B received, 290 B sent
  persistent keepalive: every 25 seconds

peer: T3TEQxBh/+4sxuIOUhc2T8VVDhD8JBoM/V3/v72NNDI=
  endpoint: 88.190.101.12:51821
  allowed ips: 192.168.88.3/32
  latest handshake: 36 seconds ago
  bandwidth: 110 B received, 290 B sent
  persistent keepalive: every 25 seconds


Enjoy!
Jason
