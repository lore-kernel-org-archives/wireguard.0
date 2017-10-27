Return-Path: luci@createc.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd2a7b40
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 17:21:52 +0000 (UTC)
Received: from mail.crimel.ro (109.166.220.71 [109.166.220.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b33606b
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 17:21:52 +0000 (UTC)
Subject: Fwd: wg-quick add_route
References: <fe5fcf1b-a7d1-6f6c-1561-4b1b1fa4e326@createc.ro>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Lucian Cristian <luci@createc.ro>
Message-ID: <079f400c-a2ed-9f11-c8e1-a7a7da1074b9@createc.ro>
Date: Fri, 27 Oct 2017 20:23:45 +0300
MIME-Version: 1.0
In-Reply-To: <fe5fcf1b-a7d1-6f6c-1561-4b1b1fa4e326@createc.ro>
Content-Type: multipart/alternative;
 boundary="------------831C8B7CC64EF3DC525EC3B0"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------831C8B7CC64EF3DC525EC3B0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

coming back with this

is ok if I make a patch to add an option for this situation ?

keep the default as it is and if the let's say NOT_DEFAULT=true, to skip 
the add_route or something like this

Regards!
-------- Forwarded Message --------
Subject: 	wg-quick add_route
Date: 	Wed, 12 Jul 2017 20:53:01 +0300
From: 	Lucian Cristian <luci@createc.ro>
To: 	WireGuard mailing list <wireguard@lists.zx2c4.com>, jason A. 
Donenfeld <Jason@zx2c4.com>



Hi Jason,

I'm using wireguard in some mixed topology and until now I've had LEDE
routers as clients but now I would like to add some CENTOS(and other
distros) clients too.

On LEDE there is an option "Create routes for Allowed IPs for this peer"
that is off by default, but in wg-quick this thing is not optional and
the routes are created by default, so if I would like to allow
10.0.0.0/8 it would create default route for all 10.0.0.0/8 to wg
interface and I don't want that.

I would like to use dynamic routing (rip+eigrp) for routing, if you
could add an entry to peers not to add default route to allowed ip would
be great

until then I've disabled add_route rule in the script

Regards


--------------831C8B7CC64EF3DC525EC3B0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>coming back with this<br>
    </p>
    <p>is ok if I make a patch to add an option for this situation ?<br>
    </p>
    <div class="moz-forward-container">keep the default as it is and if
      the let's say NOT_DEFAULT=true, to skip the add_route or something
      like this<br>
      <br>
      Regards!<br>
      -------- Forwarded Message --------
      <table class="moz-email-headers-table" cellspacing="0"
        cellpadding="0" border="0">
        <tbody>
          <tr>
            <th nowrap="nowrap" valign="BASELINE" align="RIGHT">Subject:
            </th>
            <td>wg-quick add_route</td>
          </tr>
          <tr>
            <th nowrap="nowrap" valign="BASELINE" align="RIGHT">Date: </th>
            <td>Wed, 12 Jul 2017 20:53:01 +0300</td>
          </tr>
          <tr>
            <th nowrap="nowrap" valign="BASELINE" align="RIGHT">From: </th>
            <td>Lucian Cristian <a class="moz-txt-link-rfc2396E" href="mailto:luci@createc.ro">&lt;luci@createc.ro&gt;</a></td>
          </tr>
          <tr>
            <th nowrap="nowrap" valign="BASELINE" align="RIGHT">To: </th>
            <td>WireGuard mailing list
              <a class="moz-txt-link-rfc2396E" href="mailto:wireguard@lists.zx2c4.com">&lt;wireguard@lists.zx2c4.com&gt;</a>, jason A. Donenfeld
              <a class="moz-txt-link-rfc2396E" href="mailto:Jason@zx2c4.com">&lt;Jason@zx2c4.com&gt;</a></td>
          </tr>
        </tbody>
      </table>
      <br>
      <br>
      <pre>Hi Jason,

I'm using wireguard in some mixed topology and until now I've had LEDE 
routers as clients but now I would like to add some CENTOS(and other 
distros) clients too.

On LEDE there is an option "Create routes for Allowed IPs for this peer" 
that is off by default, but in wg-quick this thing is not optional and 
the routes are created by default, so if I would like to allow 
10.0.0.0/8 it would create default route for all 10.0.0.0/8 to wg 
interface and I don't want that.

I would like to use dynamic routing (rip+eigrp) for routing, if you 
could add an entry to peers not to add default route to allowed ip would 
be great

until then I've disabled add_route rule in the script

Regards

</pre>
    </div>
  </body>
</html>

--------------831C8B7CC64EF3DC525EC3B0--
