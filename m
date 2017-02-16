Return-Path: jens@viisauksena.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9786849
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Feb 2017 18:06:28 +0000 (UTC)
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6fc8c59b
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Feb 2017 18:06:28 +0000 (UTC)
Received: from [192.168.0.38] (p5B20FBB9.dip0.t-ipconnect.de [91.32.251.185])
 by v32412.1blu.de (Postfix) with ESMTPSA id C777E20416
 for <wireguard@lists.zx2c4.com>; Thu, 16 Feb 2017 19:06:40 +0100 (CET)
Subject: Re: VXLAN
To: wireguard@lists.zx2c4.com
References: <d6qpul2kg1fyp0sdshfmv137.1486933562582@email.android.com>
From: jens <jens@viisauksena.de>
Message-ID: <b3ec4bcb-e867-7e24-0d10-74746240c3f5@viisauksena.de>
Date: Thu, 16 Feb 2017 19:05:32 +0100
MIME-Version: 1.0
In-Reply-To: <d6qpul2kg1fyp0sdshfmv137.1486933562582@email.android.com>
Content-Type: multipart/alternative;
 boundary="------------F22C1732FCC68E970B4A108A"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------F22C1732FCC68E970B4A108A
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

i also understand it like you want to use vxlan0 to connect each other,
surprisingly we are playing with this actually also - but run in
difficulties with v6 and vxlan

doing somethings like on each endpoint (both have wg0 , and this is
working fine with v6 wg internal adresses)

|ip link add vxlan0 type vxlan id 42 local <local_wg_v6>dstport 4789
nolearning bridge fdb add to <remote_mac>dst <remote_wg_v6> dev vxlan0
so fyi: (german only)
https://forum.freifunk.net/t/wireguard-0-0-20161230-linuxkernel-3-18-gluo=
n-v2016-2-2/14122/16
|

you may consider gretap tunnel - which already is working,
but i am also interested in workling vxlan setups


On 12.02.2017 22:07, info wrote:
> Hello,
>
> I would love to use VXLANs for my network to separate stuff, although
> I'm a bit struggling. My topology looks like this:
>
> VM A --> AMSTERDAM -> FRANKFURT -> VIENNA --> VM B
>
> '->' indicates a Wireguard tunnel
> '-->' is a physical link
>
> Actually I'm configuring a VXLAN Interface in AMSTERDAM and VIENNA,
> with the tunnel IPs as remote/local.
>
> Anyway, somehow I'm facing a strange issue here. VM A and VM B can
> ping each other already, although nothing else works. I cannot do
> curl/wget between the VMs nor iperf, etc.
>
> Do you know if my topology above should work? VM A can reach VM B
> without VXLAN just fine over the other hops, as well AMSTERDAM and
> VIENNA can reach each other fully.
>
> No firewall enabled nor anything else. Allowed-IPs is 0.0.0.0/0,::/0
> on all tunnels.
>
> My guess was that this is somewhat MTU related, tried 1200 on the
> VXLAN interfaces - no difference.
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--=20
make the world nicer, please use PGP encryption


--------------F22C1732FCC68E970B4A108A
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <p>i also understand it like you want to use vxlan0 to connect each
      other,<br>
      surprisingly we are playing with this actually also - but run in
      difficulties with v6 and vxlan<br>
    </p>
    doing somethings like on each endpoint (both have wg0 , and this is
    working fine with v6 wg internal adresses)<br>
    <pre><code class="lang-auto hljs css"><span class="hljs-tag">ip</span> <span class="hljs-tag">link</span> <span class="hljs-tag">add</span> <span class="hljs-tag">vxlan0</span> <span class="hljs-tag">type</span> <span class="hljs-tag">vxlan</span> <span class="hljs-tag">id</span> 42 <span class="hljs-tag">local</span> <span class="hljs-tag">&lt;local_wg_v6&gt;</span><span class="hljs-pseudo"></span> <span class="hljs-tag">dstport</span> 4789 <span class="hljs-tag">nolearning</span>
<span class="hljs-tag">bridge</span> <span class="hljs-tag">fdb</span> <span class="hljs-tag">add</span> <span class="hljs-tag">to</span> &lt;remote_mac&gt;<span class="hljs-rule"><span class="hljs-attribute"></span><span class="hljs-value"><span class="hljs-number"></span><span class="hljs-number"></span><span class="hljs-number"></span><span class="hljs-number"></span><span class="hljs-number"></span> dst &lt;remote_wg_v6&gt; dev vxlan0

so fyi: (german only)
<a class="moz-txt-link-freetext" href="https://forum.freifunk.net/t/wireguard-0-0-20161230-linuxkernel-3-18-gluon-v2016-2-2/14122/16">https://forum.freifunk.net/t/wireguard-0-0-20161230-linuxkernel-3-18-gluon-v2016-2-2/14122/16</a>
</span></span></code></pre>
    you may consider gretap tunnel - which already is working, <br>
    but i am also interested in workling vxlan setups <br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 12.02.2017 22:07, info wrote:<br>
    </div>
    <blockquote
      cite="mid:d6qpul2kg1fyp0sdshfmv137.1486933562582@email.android.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <div original_font_attr="-1" original_line_height_attr="">Hello,</div>
      <div original_font_attr="-1" original_line_height_attr=""><br>
      </div>
      <div original_font_attr="-1" original_line_height_attr="">I would
        love to use VXLANs for my network to separate stuff, although
        I'm a bit struggling. My topology looks like this:</div>
      <div><br>
      </div>
      <div original_font_attr="-1" original_line_height_attr="">VM A
        --&gt; AMSTERDAM -&gt; FRANKFURT -&gt; VIENNA --&gt; VM B</div>
      <div><br>
      </div>
      <div original_font_attr="-1" original_line_height_attr="">'-&gt;'
        indicates a Wireguard tunnel</div>
      <div original_font_attr="-1" original_line_height_attr="">'--&gt;'
        is a physical link</div>
      <div><br>
      </div>
      <div original_font_attr="-1" original_line_height_attr="">Actually
        I'm configuring a VXLAN Interface in AMSTERDAM and VIENNA, with
        the tunnel IPs as remote/local.</div>
      <div><br>
      </div>
      <div original_font_attr="-1" original_line_height_attr="">Anyway,
        somehow I'm facing a strange issue here. VM A and VM B can ping
        each other already, although nothing else works. I cannot do
        curl/wget between the VMs nor iperf, etc.</div>
      <div><br>
      </div>
      <div original_font_attr="-1" original_line_height_attr="">Do you
        know if my topology above should work? VM A can reach VM B
        without VXLAN just fine over the other hops, as well AMSTERDAM
        and VIENNA can reach each other fully.</div>
      <div><br>
      </div>
      <div original_font_attr="-1" original_line_height_attr="">No
        firewall enabled nor anything else. Allowed-IPs is
        0.0.0.0/0,::/0 on all tunnels.</div>
      <div original_font_attr="-1" original_line_height_attr=""><br>
      </div>
      <div original_font_attr="-1" original_line_height_attr="">My guess
        was that this is somewhat MTU related, tried 1200 on the VXLAN
        interfaces - no difference.</div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
make the world nicer, please use PGP encryption</pre>
  </body>
</html>

--------------F22C1732FCC68E970B4A108A--
