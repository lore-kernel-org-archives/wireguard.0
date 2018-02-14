Return-Path: e1326252@student.tuwien.ac.at
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 05c407f1
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Feb 2018 14:58:10 +0000 (UTC)
Received: from mail1.student.tuwien.ac.at (mail1.student.tuwien.ac.at
 [193.170.73.221])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c07d33f
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Feb 2018 14:58:09 +0000 (UTC)
Received: from [192.168.0.102] ([178.188.66.253]) (authenticated bits=0)
 by mail1.student.tuwien.ac.at (8.14.7/8.13.8) with ESMTP id w1EF50Di010509
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO)
 for <wireguard@lists.zx2c4.com>; Wed, 14 Feb 2018 16:05:00 +0100
To: wireguard@lists.zx2c4.com
From: Max Moser <e1326252@student.tuwien.ac.at>
Subject: NetworkManager Plugin
Message-ID: <7d5325a3-fa07-f67f-a31e-aadd44458d41@student.tuwien.ac.at>
Date: Wed, 14 Feb 2018 16:05:00 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------67BCE5CF4A6372801BE3574D"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------67BCE5CF4A6372801BE3574D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Good day, ladies and gentlemen!



I have been working on a NM plugin for wireguard as part of my thesis 
for quite a while, but somehow I've never really found the time to work 
on that (sorry about that!).

*Until recently.*

Since we have semester break in February, I have finally found the time 
(and motivation) to put some effort into this thing.


So, I forked the OpenVPN plugin at some point and built my current 
solution on that foundation. This means that my plugin is actually 
pretty much pure C, so almost no dependencies (obviously, NM, WG and 
GLib stuff).

After briefly talking to my supervisor about making the thing public 
(which he considered to be a pretty positive step), I uploaded it from 
our internal GitLab to GitHub:
https://github.com/max-moser/network-manager-wireguard/ 
<https://github.com/max-moser/network-manager-wireguard/>


The basic workflow of creating a NMConnection (either from scratch 
through the Connection-Editor UI, or by importing a wg-quick formatted 
conf file [export works too]) and connecting to it works.

However, there are still a ton of issues open, of which I'll list just a 
few:

* the plugin sets up the connection by spawning wg-quick on a temporary 
conf file instead of implementing that logic directly
* the Editor UI isn't quite top notch and there are two tabs (IPv4 and 
IPv6) that I did not use, but also can't seem to get rid of
* internally, everything in the plugin is stored as data-item and not as 
secret
* etc.


However, I think that most of those problems are not actually that huge 
and could be fixed without tremendous effort -- they are just many in 
number.

So, if anybody would be interested in checking it out and maybe even 
contributing, I'd be very glad about that! :)



Best regards,

Max


--------------67BCE5CF4A6372801BE3574D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Good day, ladies and gentlemen!</p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>I have been working on a NM plugin for wireguard as part of my
      thesis for quite a while, but somehow I've never really found the
      time to work on that (sorry about that!).</p>
    <p><b>Until recently.</b></p>
    <p>Since we have semester break in February, I have finally found
      the time (and motivation) to put some effort into this thing.</p>
    <p><br>
    </p>
    <p>So, I forked the OpenVPN plugin at some point and built my
      current solution on that foundation. This means that my plugin is
      actually pretty much pure C, so almost no dependencies (obviously,
      NM, WG and GLib stuff).</p>
    <p>After briefly talking to my supervisor about making the thing
      public (which he considered to be a pretty positive step), I
      uploaded it from our internal GitLab to GitHub:<a
        moz-do-not-send="true"
        href="https://github.com/max-moser/network-manager-wireguard/"><br>
        https://github.com/max-moser/network-manager-wireguard/</a></p>
    <p><br>
    </p>
    <p>The basic workflow of creating a NMConnection (either from
      scratch through the Connection-Editor UI, or by importing a
      wg-quick formatted conf file [export works too]) and connecting to
      it works.</p>
    <p>However, there are still a ton of issues open, of which I'll list
      just a few:</p>
    <p>* the plugin sets up the connection by spawning wg-quick on a
      temporary conf file instead of implementing that logic directly<br>
      * the Editor UI isn't quite top notch and there are two tabs (IPv4
      and IPv6) that I did not use, but also can't seem to get rid of<br>
      * internally, everything in the plugin is stored as data-item and
      not as secret<br>
      * etc.</p>
    <p><br>
    </p>
    <p>However, I think that most of those problems are not actually
      that huge and could be fixed without tremendous effort -- they are
      just many in number.</p>
    <p>So, if anybody would be interested in checking it out and maybe
      even contributing, I'd be very glad about that! :)<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>Best regards,</p>
    <p>Max<br>
    </p>
  </body>
</html>

--------------67BCE5CF4A6372801BE3574D--
