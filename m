Return-Path: jens@viisauksena.de
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3406fae7
 for <wireguard@lists.zx2c4.com>; Tue, 4 Oct 2016 09:31:12 +0000 (UTC)
Received: from [10.60.43.110] (unknown [185.66.194.30])
 by v32412.1blu.de (Postfix) with ESMTPSA id 3670220CFF
 for <wireguard@lists.zx2c4.com>; Tue,  4 Oct 2016 11:42:23 +0200 (CEST)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <301b664b59525d15@frisell.zx2c4.com>
From: jens <jens@viisauksena.de>
Message-ID: <3bd5d67d-1d77-e6ba-6eec-ed3044477a2b@viisauksena.de>
Date: Tue, 4 Oct 2016 11:42:14 +0200
MIME-Version: 1.0
In-Reply-To: <301b664b59525d15@frisell.zx2c4.com>
Content-Type: multipart/alternative;
 boundary="------------92A5DDEADCEE717236083396"
Subject: [WireGuard] tp841nd iperf test on `experimental-0.0.20161001`
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------92A5DDEADCEE717236083396
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

yesterday i shortly tested this with tplink 841 and LEDE FW, these
smaller embedded Router System
(as mentioned some emails before)

and we got 30 Mbit Through in on direction and 11-14 the other.
(which doesnt make so much sense to me - but i hadnt time to debug this,
or find out more)

so that as short notice ;)   - iperf3 Test (tcp - with/out reverse and -
server/client changed)

|[ ID] Interval Transfer Bandwidth [ 5] 0.00-10.04 sec 0.00 Bytes 0.00
bits/sec sender [ 5] 0.00-10.04 sec 13.9 MBytes 11.6 Mbits/sec receiver
[ ID] Interval Transfer Bandwidth Retr [ 5] 0.00-10.06 sec 38.7 MBytes
32.3 Mbits/sec 50 sender [ 5] 0.00-10.06 sec 0.00 Bytes 0.00 bits/sec
receiver [ ID] Interval Transfer Bandwidth [ 5] 0.00-10.03 sec 0.00
Bytes 0.00 bits/sec sender [ 5] 0.00-10.03 sec 14.2 MBytes 11.8
Mbits/sec receiver [ ID] Interval Transfer Bandwidth Retr [ 4]
0.00-10.00 sec 38.3 MBytes 32.1 Mbits/sec 40 sender [ 4] 0.00-10.00 sec
37.9 MBytes 31.8 Mbits/sec receiver [ ID] Interval Transfer Bandwidth [
4] 0.00-4.00 sec 0.00 Bytes 0.00 bits/sec sender [ 4] 0.00-4.00 sec 6.78
MBytes 14.2 Mbits/sec receiver [ ID] Interval Transfer Bandwidth Retr [
5] 0.00-10.04 sec 38.7 MBytes 32.4 Mbits/sec 46 sender [ 5] 0.00-10.04
sec 0.00 Bytes 0.00 bits/sec receiver|


https://forum.freifunk.net/t/lede-test-wireguard-und-blanko-durchsatz-tp841nv11-1-und-bug/13163/11

On 01.10.2016 01:34, Jason A. Donenfeld wrote:
> Hello,
>
> A new experimental snapshot, `experimental-0.0.20161001`, has been
> tagged in
> the git repository.
>
> Please note that this snapshot is, like the rest of the project at
> this point
> in time, experimental, and does not consitute a real release that would be
> considered secure and bug-free. However, if you'd like to test this
> snapshot
> out, there are a few relevent changes.
>
> == Changes ==
>
>   * poly1305: optimize unaligned access
>  
>   This is a very appreciated fix from René van Dorst, adjusting the
> arithmetic
>   in Poly1305 to work fast on platforms with slow unaligned access,
> such as
>   MIPS. According to his calculation, this gives a 50% improvement on
> small MIPS
>   boxes.
>  
>   * hashtables: use rdrand() instead of counter
>  
>   Rather than incrementing a counter, we instead use rdrand, which
> gives us an
>   extremely fast source of random numbers. We're still running this
> through
>   siphash with a secret, so a backdoored rdrand implementation won't be a
>   problem.
>  
>   * examples: add nat-hole-punching
>  
>   https://lists.zx2c4.com/pipermail/wireguard/2016-August/000372.html
>  
> https://git.zx2c4.com/WireGuard/tree/contrib/examples/nat-hole-punching/README
>  
>   * examples: add key extractor
>  
>   https://lists.zx2c4.com/pipermail/wireguard/2016-August/000373.html
>  
> https://git.zx2c4.com/WireGuard/tree/contrib/examples/extract-keys/README
>  
>   * tools: allow multiple AllowedIPs invocations
>  
>   Multiple AllowedIPs= lines can now be specified, which could improve
>   readability of the config files.
>  
>   * send: properly encapsulate ECN
>  
>   Thanks to the guidance of Dave Taht, we now support ECN.
>  
>   * Rework headers and includes
>   * compat: Isolate more functions
>  
>   In anticipation of upstreaming WireGuard, we've now moved most of our
>   version-specific #ifdefs to compat.h, where we use horrible macro
> tricks to
>   redefine functions for old versions. This allows us to keep the
> actual code as
>   clean as possible. When we merge to mainline, compat.h will be deleted
>   wholesale.
>  
>   * tests: test jumbo frames with more transfer
>   * tests: add crypto-RP filter test
>   * qemu: enhancements
>  
>   With this an numerous other commits, we've further expanded the test
> suite.
>
> As always, the source is available at https://git.zx2c4.com/WireGuard/ and
> information about the project is available at https://www.wireguard.io/ .
>
> This snapshot is available in tarball form here:
>  
> https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20161001.tar.xz
>   SHA256: ac3abb7b940716ac12b96a2cb3f7666598cbefd26f19c268f627dc47cd113ac8
>
> If you're a snapshot package maintainer, please bump your package
> version. If
> you're a user, the WireGuard team welcomes any and all feedback on
> this latest
> snapshot.
>
> Thank you,
> Jason Donenfeld
>
>
> _______________________________________________ > WireGuard mailing list > WireGuard@lists.zx2c4.com >
http://lists.zx2c4.com/mailman/listinfo/wireguard

-- 
make the world nicer, please use PGP encryption


--------------92A5DDEADCEE717236083396
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    yesterday i shortly tested this with tplink 841 and LEDE FW, these
    smaller embedded Router System <br>
    (as mentioned some emails before)<br>
    <br>
    and we got 30 Mbit Through in on direction and 11-14 the other. <br>
    (which doesnt make so much sense to me - but i hadnt time to debug
    this, or find out more)<br>
    <br>
    so that as short notice ;)   - iperf3 Test (tcp - with/out reverse
    and - server/client changed)<br>
    <br>
    <pre><code class="lang-auto hljs coffeescript">[ ID] Interval           Transfer     Bandwidth
[  <span class="hljs-number">5</span>]   <span class="hljs-number">0.00</span>-<span class="hljs-number">10.04</span>  sec  <span class="hljs-number">0.00</span> Bytes  <span class="hljs-number">0.00</span> bits/sec                  sender
[  <span class="hljs-number">5</span>]   <span class="hljs-number">0.00</span>-<span class="hljs-number">10.04</span>  sec  <span class="hljs-number">13.9</span> MBytes  <span class="hljs-number">11.6</span> Mbits/sec                  receiver

[ ID] Interval           Transfer     Bandwidth       Retr
[  <span class="hljs-number">5</span>]   <span class="hljs-number">0.00</span>-<span class="hljs-number">10.06</span>  sec  <span class="hljs-number">38.7</span> MBytes  <span class="hljs-number">32.3</span> Mbits/sec   <span class="hljs-number">50</span>             sender
[  <span class="hljs-number">5</span>]   <span class="hljs-number">0.00</span>-<span class="hljs-number">10.06</span>  sec  <span class="hljs-number">0.00</span> Bytes  <span class="hljs-number">0.00</span> bits/sec                  receiver

[ ID] Interval           Transfer     Bandwidth
[  <span class="hljs-number">5</span>]   <span class="hljs-number">0.00</span>-<span class="hljs-number">10.03</span>  sec  <span class="hljs-number">0.00</span> Bytes  <span class="hljs-number">0.00</span> bits/sec                  sender
[  <span class="hljs-number">5</span>]   <span class="hljs-number">0.00</span>-<span class="hljs-number">10.03</span>  sec  <span class="hljs-number">14.2</span> MBytes  <span class="hljs-number">11.8</span> Mbits/sec                  receiver

[ ID] Interval           Transfer     Bandwidth       Retr
[  <span class="hljs-number">4</span>]   <span class="hljs-number">0.00</span>-<span class="hljs-number">10.00</span>  sec  <span class="hljs-number">38.3</span> MBytes  <span class="hljs-number">32.1</span> Mbits/sec   <span class="hljs-number">40</span>             sender
[  <span class="hljs-number">4</span>]   <span class="hljs-number">0.00</span>-<span class="hljs-number">10.00</span>  sec  <span class="hljs-number">37.9</span> MBytes  <span class="hljs-number">31.8</span> Mbits/sec                  receiver

[ ID] Interval           Transfer     Bandwidth
[  <span class="hljs-number">4</span>]   <span class="hljs-number">0.00</span>-<span class="hljs-number">4.00</span>   sec  <span class="hljs-number">0.00</span> Bytes  <span class="hljs-number">0.00</span> bits/sec                  sender
[  <span class="hljs-number">4</span>]   <span class="hljs-number">0.00</span>-<span class="hljs-number">4.00</span>   sec  <span class="hljs-number">6.78</span> MBytes  <span class="hljs-number">14.2</span> Mbits/sec                  receiver

[ ID] Interval           Transfer     Bandwidth       Retr
[  <span class="hljs-number">5</span>]   <span class="hljs-number">0.00</span>-<span class="hljs-number">10.04</span>  sec  <span class="hljs-number">38.7</span> MBytes  <span class="hljs-number">32.4</span> Mbits/sec   <span class="hljs-number">46</span>             sender
[  <span class="hljs-number">5</span>]   <span class="hljs-number">0.00</span>-<span class="hljs-number">10.04</span>  sec  <span class="hljs-number">0.00</span> Bytes  <span class="hljs-number">0.00</span> bits/sec                  receiver</code></pre>
    <br>
<a class="moz-txt-link-freetext" href="https://forum.freifunk.net/t/lede-test-wireguard-und-blanko-durchsatz-tp841nv11-1-und-bug/13163/11">https://forum.freifunk.net/t/lede-test-wireguard-und-blanko-durchsatz-tp841nv11-1-und-bug/13163/11</a><br>
    <br>
    On 01.10.2016 01:34, Jason A. Donenfeld wrote:<br>
    <blockquote type="cite">Hello,<br>
      <br>
      A new experimental snapshot, `experimental-0.0.20161001`, has been
      tagged in<br>
      the git repository.<br>
      <br>
      Please note that this snapshot is, like the rest of the project at
      this point<br>
      in time, experimental, and does not consitute a real release that
      would be<br>
      considered secure and bug-free. However, if you'd like to test
      this snapshot<br>
      out, there are a few relevent changes.<br>
      <br>
      == Changes ==<br>
      <br>
        * poly1305: optimize unaligned access<br>
        <br>
        This is a very appreciated fix from René van Dorst, adjusting
      the arithmetic<br>
        in Poly1305 to work fast on platforms with slow unaligned
      access, such as<br>
        MIPS. According to his calculation, this gives a 50% improvement
      on small MIPS<br>
        boxes.<br>
        <br>
        * hashtables: use rdrand() instead of counter<br>
        <br>
        Rather than incrementing a counter, we instead use rdrand, which
      gives us an<br>
        extremely fast source of random numbers. We're still running
      this through<br>
        siphash with a secret, so a backdoored rdrand implementation
      won't be a<br>
        problem.<br>
        <br>
        * examples: add nat-hole-punching<br>
        <br>
       
      <a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/pipermail/wireguard/2016-August/000372.html">https://lists.zx2c4.com/pipermail/wireguard/2016-August/000372.html</a><br>
       
<a class="moz-txt-link-freetext" href="https://git.zx2c4.com/WireGuard/tree/contrib/examples/nat-hole-punching/README">https://git.zx2c4.com/WireGuard/tree/contrib/examples/nat-hole-punching/README</a><br>
        <br>
        * examples: add key extractor<br>
        <br>
       
      <a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/pipermail/wireguard/2016-August/000373.html">https://lists.zx2c4.com/pipermail/wireguard/2016-August/000373.html</a><br>
       
<a class="moz-txt-link-freetext" href="https://git.zx2c4.com/WireGuard/tree/contrib/examples/extract-keys/README">https://git.zx2c4.com/WireGuard/tree/contrib/examples/extract-keys/README</a><br>
        <br>
        * tools: allow multiple AllowedIPs invocations<br>
        <br>
        Multiple AllowedIPs= lines can now be specified, which could
      improve<br>
        readability of the config files.<br>
        <br>
        * send: properly encapsulate ECN<br>
        <br>
        Thanks to the guidance of Dave Taht, we now support ECN.<br>
        <br>
        * Rework headers and includes<br>
        * compat: Isolate more functions<br>
        <br>
        In anticipation of upstreaming WireGuard, we've now moved most
      of our<br>
        version-specific #ifdefs to compat.h, where we use horrible
      macro tricks to<br>
        redefine functions for old versions. This allows us to keep the
      actual code as<br>
        clean as possible. When we merge to mainline, compat.h will be
      deleted<br>
        wholesale.<br>
        <br>
        * tests: test jumbo frames with more transfer<br>
        * tests: add crypto-RP filter test<br>
        * qemu: enhancements<br>
        <br>
        With this an numerous other commits, we've further expanded the
      test suite.<br>
      <br>
      As always, the source is available at
      <a class="moz-txt-link-freetext" href="https://git.zx2c4.com/WireGuard/">https://git.zx2c4.com/WireGuard/</a> and<br>
      information about the project is available at
      <a class="moz-txt-link-freetext" href="https://www.wireguard.io/">https://www.wireguard.io/</a> .<br>
      <br>
      This snapshot is available in tarball form here:<br>
       
<a class="moz-txt-link-freetext" href="https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20161001.tar.xz">https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20161001.tar.xz</a><br>
        SHA256:
      ac3abb7b940716ac12b96a2cb3f7666598cbefd26f19c268f627dc47cd113ac8<br>
      <br>
      If you're a snapshot package maintainer, please bump your package
      version. If<br>
      you're a user, the WireGuard team welcomes any and all feedback on
      this latest<br>
      snapshot.<br>
      <br>
      Thank you,<br>
      Jason Donenfeld<br>
      <br>
      <br>
    </blockquote>
    <span style="white-space: pre;">&gt; _______________________________________________
&gt; WireGuard mailing list
&gt; <a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
&gt; <a class="moz-txt-link-freetext" href="http://lists.zx2c4.com/mailman/listinfo/wireguard">http://lists.zx2c4.com/mailman/listinfo/wireguard</a></span><br>
    <br>
    -- <br>
    make the world nicer, please use PGP encryption<br>
    <br>
  </body>
</html>

--------------92A5DDEADCEE717236083396--
