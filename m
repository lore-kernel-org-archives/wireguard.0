Return-Path: luci@createc.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2251965c
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Feb 2017 22:20:04 +0000 (UTC)
Received: from mail.crimel.ro (mail.crimel.ro [5.2.196.145])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a96432c7
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Feb 2017 22:20:04 +0000 (UTC)
Subject: Re: RTNETLINK answers: Operation not supported
To: wireguard@lists.zx2c4.com
References: <CAPtYZXijvKABYy35SjHTGNrC4fFkP+9xwyUR8RyUOjMB=mB2WQ@mail.gmail.com>
From: Lucian Cristian <luci@createc.ro>
Message-ID: <4c1be77d-8ea9-43b7-799f-7867bca3a4de@createc.ro>
Date: Wed, 1 Mar 2017 00:21:42 +0200
MIME-Version: 1.0
In-Reply-To: <CAPtYZXijvKABYy35SjHTGNrC4fFkP+9xwyUR8RyUOjMB=mB2WQ@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------987297E89BEA2EC37C552616"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------987297E89BEA2EC37C552616
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 28.02.2017 18:08, William Clark wrote:
> Hello,
>
> So I wanted to try WireGuard but unfortunately I can't get pas this part:
> ip link add dev wg0 type wireguard.
>
> When ever I run the command "ip link add dev wg0 type wireguard"
> I get the output:
> RTNETLINK answers: Operation not supported
>
> This both happens on CentOS 7 and Fedora 25 and Ubuntu 16.04.
>
> CentOS 7 Kernel:
> Linux hostname 3.10.0-514.6.2.el7.x86_64 #1 SMP Thu Feb 23 03:04:39 
> UTC 2017 x86_64 x86_64 x86_64 GNU/Linux
> Fedora 25 Kernel:
> Linux hostname 4.9.7-x86_64-X #2 SMP Thu Feb 2 15:43:55 EST 2017 
> x86_64 x86_64 x86_64 GNU/Linux
>
> I've tried installing Linux headers too, but no luck and I've rebooted 
> after the upgrade too, and still no luck.
>
> Thanks a lot.
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

I'm using centos 7 (even centos 6) with kernel-ml or kernel-lt from 
elrepo, 3.10 is not supported by wireguard


Regards


--------------987297E89BEA2EC37C552616
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 28.02.2017 18:08, William Clark
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAPtYZXijvKABYy35SjHTGNrC4fFkP+9xwyUR8RyUOjMB=mB2WQ@mail.gmail.com"
      type="cite">
      <div dir="ltr"><font face="monospace, monospace">Hello,</font>
        <div><font face="monospace, monospace"><br>
          </font></div>
        <div><font face="monospace, monospace">So I wanted to try
            WireGuard but unfortunately I can't get pas this part:</font></div>
        <div><font face="monospace, monospace">ip link add dev wg0 type
            wireguard.<br>
          </font></div>
        <div><font face="monospace, monospace"><br>
          </font></div>
        <div>
          <div><font face="monospace, monospace">When ever I run the
              command "ip link add dev wg0 type wireguard"<br>
            </font></div>
        </div>
        <div><font face="monospace, monospace">I get the output:</font></div>
        <div>
          <div><font face="monospace, monospace">RTNETLINK answers:
              Operation not supported</font></div>
        </div>
        <div><font face="monospace, monospace"><br>
          </font></div>
        <div><font face="monospace, monospace">This both happens on
            CentOS 7 and Fedora 25 and Ubuntu 16.04.</font></div>
        <div><font face="monospace, monospace"><br>
          </font></div>
        <div><font face="monospace, monospace">CentOS 7 Kernel:</font></div>
        <div>
          <div><font face="monospace, monospace">Linux hostname
              3.10.0-514.6.2.el7.x86_64 #1 SMP Thu Feb 23 03:04:39 UTC
              2017 x86_64 x86_64 x86_64 GNU/Linux</font></div>
        </div>
        <div><font face="monospace, monospace">Fedora 25 Kernel:</font></div>
        <div>
          <div><font face="monospace, monospace">Linux hostname
              4.9.7-x86_64-X #2 SMP Thu Feb 2 15:43:55 EST 2017 x86_64
              x86_64 x86_64 GNU/Linux</font></div>
        </div>
        <div><font face="monospace, monospace"><br>
          </font></div>
        <div><font face="monospace, monospace">I've tried installing
            Linux headers too, but no luck and I've rebooted after the
            upgrade too, and still no luck.</font></div>
        <div><font face="monospace, monospace"><br>
          </font></div>
        <div><font face="monospace, monospace">Thanks a lot.</font></div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
    <p>I'm using centos 7 (even centos 6) with kernel-ml or kernel-lt
      from elrepo, <font face="monospace, monospace">3.10 is not
        supported by wireguard</font></p>
    <p><font face="monospace, monospace"><br>
      </font></p>
    <p><font face="monospace, monospace">Regards<br>
      </font></p>
  </body>
</html>

--------------987297E89BEA2EC37C552616--
