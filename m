Return-Path: najoll@posteo.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c001e653
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 18:50:03 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f19f258
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 18:50:02 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130])
 by mout01.posteo.de (Postfix) with ESMTPS id D8F9220F3E
 for <wireguard@lists.zx2c4.com>; Mon,  5 Mar 2018 19:59:16 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 3zw8Mj146Zz9ry3
 for <wireguard@lists.zx2c4.com>; Mon,  5 Mar 2018 19:59:12 +0100 (CET)
Subject: Update: exempting two things from WireGuard tunneling
References: <d98b43d3-b847-c1c5-931a-5c3164061058@posteo.net>
From: Nicholas Joll <najoll@posteo.net>
To: wireguard@lists.zx2c4.com
Message-ID: <9de22427-0180-ac5a-cd7c-b5f9810ecbf9@posteo.net>
Date: Mon, 5 Mar 2018 18:59:24 +0000
MIME-Version: 1.0
In-Reply-To: <d98b43d3-b847-c1c5-931a-5c3164061058@posteo.net>
Content-Type: multipart/alternative;
 boundary="------------DFE16E620772A6BD78B1D514"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------DFE16E620772A6BD78B1D514
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit

Dear List

    I've tried all sorts of things to answer my own question (the
question I asked the list a little while ago; my initial e-mail is
appended below) but to no avail. However, I've found something, on the
Wireguard list itself, which looks as though it may help - but I do not
understand it well enough. Might anyone help? The material I found is
located here: https://marc.info/?l=wireguard&m=148813372820847&w=2

Yours

Nicholas



-------- Forwarded Message --------
Subject: 	Exempting two things from WireGuard tunneling
Date: 	Fri, 2 Mar 2018 00:33:25 +0000
From: 	
To: 	wireguard@lists.zx2c4.com


Dear List

I'd like to exempt two things from WG: (1) some samba shares, accessed
via autofs, which give me enough trouble without having VPN dropouts
(courtesy of my VPN provider and/or my ISP) as well, (2) Netflix (which
I run via a Chrome app). The samba shares all have fixed IPs and most of
them are on a single Windows machine, on my home network, and another
share is to router-attached USB storage (and only works on Samba
protocol version 1, for some reason; the other shares work on version 3).

I imagine many people will want to do each of these things. There was
something on the list a long time back, I think, about 2, but it was too
technical for me to understand. (My VPN and Wireguard knowledge is
minimal, though I have Bash scripts that put WG up and take it down, and
tell it which servers(s) to use.)

With thanks,

N


--------------DFE16E620772A6BD78B1D514
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Dear List</p>
    <p>    I've tried all sorts of things to answer my own question (the
      question I asked the list a little while ago; my initial e-mail is
      appended below) but to no avail. However, I've found something, on
      the Wireguard list itself, which looks as though it may help - but
      I do not understand it well enough. Might anyone help? The
      material I found is located here:
      <a class="moz-txt-link-freetext" href="https://marc.info/?l=wireguard&amp;m=148813372820847&amp;w=2">https://marc.info/?l=wireguard&amp;m=148813372820847&amp;w=2</a></p>
    <p>Yours</p>
    <p>Nicholas<br>
    </p>
    <div class="moz-forward-container"><br>
      <br>
      -------- Forwarded Message --------
      <table class="moz-email-headers-table" cellspacing="0"
        cellpadding="0" border="0">
        <tbody>
          <tr>
            <th nowrap="nowrap" valign="BASELINE" align="RIGHT">Subject:
            </th>
            <td>Exempting two things from WireGuard tunneling</td>
          </tr>
          <tr>
            <th nowrap="nowrap" valign="BASELINE" align="RIGHT">Date: </th>
            <td>Fri, 2 Mar 2018 00:33:25 +0000</td>
          </tr>
          <tr>
            <th nowrap="nowrap" valign="BASELINE" align="RIGHT">From: </th>
            <td><br>
            </td>
          </tr>
          <tr>
            <th nowrap="nowrap" valign="BASELINE" align="RIGHT">To: </th>
            <td><a class="moz-txt-link-abbreviated" href="mailto:wireguard@lists.zx2c4.com">wireguard@lists.zx2c4.com</a></td>
          </tr>
        </tbody>
      </table>
      <br>
      <pre>Dear List

I'd like to exempt two things from WG: (1) some samba shares, accessed
via autofs, which give me enough trouble without having VPN dropouts
(courtesy of my VPN provider and/or my ISP) as well, (2) Netflix (which
I run via a Chrome app). The samba shares all have fixed IPs and most of
them are on a single Windows machine, on my home network, and another
share is to router-attached USB storage (and only works on Samba
protocol version 1, for some reason; the other shares work on version 3).

I imagine many people will want to do each of these things. There was
something on the list a long time back, I think, about 2, but it was too
technical for me to understand. (My VPN and Wireguard knowledge is
minimal, though I have Bash scripts that put WG up and take it down, and
tell it which servers(s) to use.)

With thanks,

N
</pre>
    </div>
  </body>
</html>

--------------DFE16E620772A6BD78B1D514--
