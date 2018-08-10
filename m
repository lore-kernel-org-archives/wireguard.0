Return-Path: b.candler@pobox.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3166345
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 15:51:55 +0000 (UTC)
Received: from pb-smtp1.pobox.com (pb-smtp1.pobox.com [64.147.108.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dce4f9d0
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 15:51:55 +0000 (UTC)
Subject: Re: Reflections on WireGuard Design Goals
To: Roman Mamedov <rm@romanrm.net>
References: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
 <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
 <20180810200346.0e9646ac@natsu>
From: Brian Candler <b.candler@pobox.com>
Message-ID: <1dfc3b75-5737-0961-ba41-81d07e1e5c14@pobox.com>
Date: Fri, 10 Aug 2018 17:03:11 +0100
MIME-Version: 1.0
In-Reply-To: <20180810200346.0e9646ac@natsu>
Content-Type: multipart/alternative;
 boundary="------------685AFAEDB0564DD97279680E"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------685AFAEDB0564DD97279680E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/08/2018 16:03, Roman Mamedov wrote:
>> But I'd feel a lot happier if a second level of authentication were
>> required to establish a wireguard connection, if no packets had been
>> flowing for more than a configurable amount of time - say, an hour. It
>> would give some comfort around lost/stolen devices.
> Couldn't you just encrypt your home directory? Or even the root FS entirely.
> Either of those should be a must on a portable device storing valuable
> information.

But by analogy, would you say that SSH keys and PGP keys don't need 
protection by a passphrase?


--------------685AFAEDB0564DD97279680E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 10/08/2018 16:03, Roman Mamedov
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20180810200346.0e9646ac@natsu">
      <blockquote type="cite" style="color: #000000;">
        <pre wrap="">But I'd feel a lot happier if a second level of authentication were 
required to establish a wireguard connection, if no packets had been 
flowing for more than a configurable amount of time - say, an hour. It 
would give some comfort around lost/stolen devices.
</pre>
      </blockquote>
      <pre wrap="">Couldn't you just encrypt your home directory? Or even the root FS entirely.
Either of those should be a must on a portable device storing valuable
information.</pre>
    </blockquote>
    <p>But by analogy, would you say that SSH keys and PGP keys don't
      need protection by a passphrase?</p>
  </body>
</html>

--------------685AFAEDB0564DD97279680E--
