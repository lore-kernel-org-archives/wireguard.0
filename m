Return-Path: mail@53c70r.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6173a27
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jun 2018 12:26:35 +0000 (UTC)
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46c2c3ca
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jun 2018 12:26:34 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id 8DFF140F67
 for <wireguard@lists.zx2c4.com>; Thu, 28 Jun 2018 14:32:21 +0200 (CEST)
Received: from smtp2.mailbox.org ([80.241.60.241])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id TSFy9nVgxg-9 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jun 2018 14:32:18 +0200 (CEST)
Subject: Fwd: Re: wg-quick broken by iproute2 update
References: <eeb61304-6f66-48f9-1418-2a4e502b9289@53c70r.de>
To: wireguard@lists.zx2c4.com
From: Silvan Nagl <mail@53c70r.de>
Message-ID: <10808a9e-d503-245e-546c-d3ca77d2a1b0@53c70r.de>
Date: Thu, 28 Jun 2018 14:32:06 +0200
MIME-Version: 1.0
In-Reply-To: <eeb61304-6f66-48f9-1418-2a4e502b9289@53c70r.de>
Content-Type: multipart/alternative;
 boundary="------------7DAC19D2D13F2D7DBE18A088"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------7DAC19D2D13F2D7DBE18A088
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit




-------- Forwarded Message --------
Subject: 	Re: wg-quick broken by iproute2 update
Date: 	Thu, 28 Jun 2018 11:53:59 +0200
From: 	Silvan Nagl <mail@53c70r.de>
To: 	stunnel@attglobal.net



Hi,

since i had to debug this problem already i can tell you it is not
iproute2 causing the problem.
The main problem is that the current standard kernel of CentOS simple
does not support the handling of "suppress_prefixlength".
Iproute2 supports it since it does not return any error while adding so
it had to be the kernel causing problems.
In essence Red Hats official answer was "It isn't a bug, RHEL7 simple
does not support it".
If you sill want to fix your problem just upgrade your kernel to
long-term or mainline.

Regards,
Silvan

On 06/28/2018 04:47 AM, Eddie wrote:
> Hi,
>
> I just updated both a RHEL and a CentOS system from 7 -> 7.5. 
> Following this, when running wg-quick, the routing tables are not 
> updated correctly.  Both systems are running 
> iproute.x86_64-4.11.0-14.el7, but from different repositories and are 
> definitely different builds as they install to different sbin libraries.
>
> Here's what I'm seeing:
>
> [eddieath@oc8361880017 ~]$ sudo ip rule list
> 0:    from all lookup local
> 32766:    from all lookup main
> 32767:    from all lookup default
> [eddieath@oc8361880017 ~]$
> [eddieath@oc8361880017 ~]$ sudo wg-quick up wg0
> [#] ip link add wg0 type wireguard
> [#] wg setconf wg0 /dev/fd/63
> [#] ip address add 192.168.0.11/24 dev wg0
> [#] ip link set mtu 1420 dev wg0
> [#] ip link set wg0 up
> [#] ip -4 route add 0.0.0.0/0 dev wg0 table 51820
> [#] ip -4 rule add not fwmark 51820 table 51820
> [#] ip -4 rule add table main suppress_prefixlength 0
> [eddieath@oc8361880017 ~]$
> [eddieath@oc8361880017 ~]$ sudo ip rule list
> 0:    from all lookup local
> 32764:    from all lookup main
> 32765:    not from all fwmark 0xca6c lookup 51820
> 32766:    from all lookup main
> 32767:    from all lookup default
> [eddieath@oc8361880017 ~]$
>
> Note the "suppress_prefixlength 0" has been dropped, which really 
> breaks the routing with a "normal" main ahead of table 51820. 
> Following this, when running the "down", the duplicated table is not 
> removed, as there is no match searching for "suppress_prefixlength 0":
>
> [eddieath@oc8361880017 ~]$ sudo wg-quick down wg0
> [#] wg showconf wg0
> sync: ignoring all arguments
> [#] ip -4 rule delete table 51820
> [#] ip link delete dev wg0
> [eddieath@oc8361880017 ~]$ sudo ip rule list
> 0:    from all lookup local
> 32764:    from all lookup main
> 32766:    from all lookup main
> 32767:    from all lookup default
> [eddieath@oc8361880017 ~]$
>
> I've confirmed this on both systems and also that the behaviour is 
> purely within ip, and not anything that wg-quick is doing:
>
> [eddieath@oc8361880017 ~]$ sudo ip rule list
> 0:    from all lookup local
> 32766:    from all lookup main
> 32767:    from all lookup default
> [eddieath@oc8361880017 ~]$ sudo ip -4 rule add table main 
> suppress_prefixlength 0
> [eddieath@oc8361880017 ~]$ sudo ip rule list
> 0:    from all lookup local
> 32765:    from all lookup main
> 32766:    from all lookup main
> 32767:    from all lookup default
> [eddieath@oc8361880017 ~]$
>
> Cheers.
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--------------7DAC19D2D13F2D7DBE18A088
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p><br>
    </p>
    <div class="moz-forward-container"><br>
      <br>
      -------- Forwarded Message --------
      <table class="moz-email-headers-table" cellspacing="0"
        cellpadding="0" border="0">
        <tbody>
          <tr>
            <th nowrap="nowrap" align="RIGHT" valign="BASELINE">Subject:
            </th>
            <td>Re: wg-quick broken by iproute2 update</td>
          </tr>
          <tr>
            <th nowrap="nowrap" align="RIGHT" valign="BASELINE">Date: </th>
            <td>Thu, 28 Jun 2018 11:53:59 +0200</td>
          </tr>
          <tr>
            <th nowrap="nowrap" align="RIGHT" valign="BASELINE">From: </th>
            <td>Silvan Nagl <a class="moz-txt-link-rfc2396E" href="mailto:mail@53c70r.de">&lt;mail@53c70r.de&gt;</a></td>
          </tr>
          <tr>
            <th nowrap="nowrap" align="RIGHT" valign="BASELINE">To: </th>
            <td><a class="moz-txt-link-abbreviated" href="mailto:stunnel@attglobal.net">stunnel@attglobal.net</a></td>
          </tr>
        </tbody>
      </table>
      <br>
      <br>
      <pre>Hi,

since i had to debug this problem already i can tell you it is not 
iproute2 causing the problem.
The main problem is that the current standard kernel of CentOS simple 
does not support the handling of "suppress_prefixlength".
Iproute2 supports it since it does not return any error while adding so 
it had to be the kernel causing problems.
In essence Red Hats official answer was "It isn't a bug, RHEL7 simple 
does not support it".
If you sill want to fix your problem just upgrade your kernel to 
long-term or mainline.

Regards,
Silvan

On 06/28/2018 04:47 AM, Eddie wrote:
&gt; Hi,
&gt;
&gt; I just updated both a RHEL and a CentOS system from 7 -&gt; 7.5. 
&gt; Following this, when running wg-quick, the routing tables are not 
&gt; updated correctly.  Both systems are running 
&gt; iproute.x86_64-4.11.0-14.el7, but from different repositories and are 
&gt; definitely different builds as they install to different sbin libraries.
&gt;
&gt; Here's what I'm seeing:
&gt;
&gt; [eddieath@oc8361880017 ~]$ sudo ip rule list
&gt; 0:    from all lookup local
&gt; 32766:    from all lookup main
&gt; 32767:    from all lookup default
&gt; [eddieath@oc8361880017 ~]$
&gt; [eddieath@oc8361880017 ~]$ sudo wg-quick up wg0
&gt; [#] ip link add wg0 type wireguard
&gt; [#] wg setconf wg0 /dev/fd/63
&gt; [#] ip address add 192.168.0.11/24 dev wg0
&gt; [#] ip link set mtu 1420 dev wg0
&gt; [#] ip link set wg0 up
&gt; [#] ip -4 route add 0.0.0.0/0 dev wg0 table 51820
&gt; [#] ip -4 rule add not fwmark 51820 table 51820
&gt; [#] ip -4 rule add table main suppress_prefixlength 0
&gt; [eddieath@oc8361880017 ~]$
&gt; [eddieath@oc8361880017 ~]$ sudo ip rule list
&gt; 0:    from all lookup local
&gt; 32764:    from all lookup main
&gt; 32765:    not from all fwmark 0xca6c lookup 51820
&gt; 32766:    from all lookup main
&gt; 32767:    from all lookup default
&gt; [eddieath@oc8361880017 ~]$
&gt;
&gt; Note the "suppress_prefixlength 0" has been dropped, which really 
&gt; breaks the routing with a "normal" main ahead of table 51820. 
&gt; Following this, when running the "down", the duplicated table is not 
&gt; removed, as there is no match searching for "suppress_prefixlength 0":
&gt;
&gt; [eddieath@oc8361880017 ~]$ sudo wg-quick down wg0
&gt; [#] wg showconf wg0
&gt; sync: ignoring all arguments
&gt; [#] ip -4 rule delete table 51820
&gt; [#] ip link delete dev wg0
&gt; [eddieath@oc8361880017 ~]$ sudo ip rule list
&gt; 0:    from all lookup local
&gt; 32764:    from all lookup main
&gt; 32766:    from all lookup main
&gt; 32767:    from all lookup default
&gt; [eddieath@oc8361880017 ~]$
&gt;
&gt; I've confirmed this on both systems and also that the behaviour is 
&gt; purely within ip, and not anything that wg-quick is doing:
&gt;
&gt; [eddieath@oc8361880017 ~]$ sudo ip rule list
&gt; 0:    from all lookup local
&gt; 32766:    from all lookup main
&gt; 32767:    from all lookup default
&gt; [eddieath@oc8361880017 ~]$ sudo ip -4 rule add table main 
&gt; suppress_prefixlength 0
&gt; [eddieath@oc8361880017 ~]$ sudo ip rule list
&gt; 0:    from all lookup local
&gt; 32765:    from all lookup main
&gt; 32766:    from all lookup main
&gt; 32767:    from all lookup default
&gt; [eddieath@oc8361880017 ~]$
&gt;
&gt; Cheers.
&gt;
&gt; _______________________________________________
&gt; WireGuard mailing list
&gt; <a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
&gt; <a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>

</pre>
    </div>
  </body>
</html>

--------------7DAC19D2D13F2D7DBE18A088--
