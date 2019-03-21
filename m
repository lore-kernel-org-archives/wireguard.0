Return-Path: <SRS0=gmne=R2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_FONT_FACE_BAD,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,WEIRD_PORT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46361C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:00:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42A17213F2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:00:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=anatoli.ws header.i=@anatoli.ws header.b="j/W3cwEC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42A17213F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=anatoli.ws
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49af117a;
	Fri, 22 Mar 2019 23:59:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ade6c032
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Mar 2019 06:21:01 +0000 (UTC)
Received: from out-mx.anatoli.ws (out-mx.anatoli.ws [177.54.157.124])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa9725a1
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Mar 2019 06:21:01 +0000 (UTC)
Received: from [192.168.0.1] (unknown [192.168.0.1])
 by out-mx.oprbox.com (Postfix) with ESMTPSA id F129C1E0016A
 for <wireguard@lists.zx2c4.com>; Thu, 21 Mar 2019 06:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anatoli.ws;
 s=5s7aopj1ad; t=1553149283;
 bh=kOxJ6ePcm+fR82BxaoEjhHg02GqPjGNxT2zAPIT9uIA=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=j/W3cwEC7n3FgjCbtYsN7tLY5y32DUkUmPsupmoQoJU5tEq36vcIx202oExS4HPai
 MY2DZ+kARbQEbv+1mN8wO213PTN11AMfGOivcd93PAaSWzVO0Bz2qBtmEu3zuUAcH+
 hmDe02+/f++gT2IB3hEqaO836rjqB8IgPlloN93Ym3S8am8sey5QfUdhiPRztUq5G9
 MBxBAA8I4ggnpSo2fnI9rh13cuxz4bDY0MRTEWR/CURXvTn67x/f6SmFQHIW435hdc
 BUP1Pw6ZYtIsFPyG0FwB3F/bA2Zy7b1x36DebfkS3stiBwM5h2jAkZhJsXNuuHN63W
 7RHek4gw/8f+g==
Subject: Re: How to debug wireguard on the server?
To: wireguard@lists.zx2c4.com
References: <CAPRYYOZY_fPDkQyebrY6vu7CTvzHoniHyhiZwNHLS6zfgk5JQg@mail.gmail.com>
From: Anatoli <me@anatoli.ws>
Message-ID: <2c8b0581-d5e2-86db-4399-ab523a2eb660@anatoli.ws>
Date: Thu, 21 Mar 2019 03:21:21 -0300
Mime-Version: 1.0
In-Reply-To: <CAPRYYOZY_fPDkQyebrY6vu7CTvzHoniHyhiZwNHLS6zfgk5JQg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 23 Mar 2019 00:59:37 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2736858355702675315=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============2736858355702675315==
Content-Type: multipart/alternative;
 boundary="------------EF8607C1A15A9D2314C2BFC7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------EF8607C1A15A9D2314C2BFC7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

First of all, check if the server receives the handshake with: sudo wg 
show wg0 help (you'll see all available options). Start with 
latest-handshakes and endpoints. If the server sees the client in the 
endpoints and its latest handshake time updates accordingly, then the 
tunnel is working.

Then check the routes. When you do sudo wg-quick up wg0, what's the 
output? Are the routes created? What's the output of ip rule show and ip 
route show table all? If you specify on the client AllowedIPs = 
0.0.0.0/0, then wg-quick creates all needed routes automatically. If 
not, you'll have to create them manually. Check the man pages: 
https://git.zx2c4.com/WireGuard/about/src/tools/man/wg-quick.8 and 
https://git.zx2c4.com/WireGuard/about/src/tools/man/wg.8.

Try to see what's the route to the desired destination with: ip -s route 
get <IP>.

*From:* Wojtek Swiatek <w@swtk.info>
*Sent:* Tuesday, February 26, 2019 06:59
*To:* Wireguard Mailing List <wireguard@lists.zx2c4.com>
*Subject:* How to debug wireguard on the server?

Hello everyone

I am trying to set up wireguard on a Linux server (Ubuntu 18.04) and I 
am having some issues. The configuration of the server:

[Interface]
Address = 192.168.20.1/24 <http://192.168.20.1/24>
ListenPort = 51820
PrivateKey = UbuntuPrivateKey

# the laptop I want to connect from
[Peer]
# this public key is derived from the laptop's private key LaptopPrivateKey
PublicKey = kExj276RLpqCZoDdOYHiq4FQHKA94y0eY1W/ptvT2y4=
AllowedIPs = 192.168.20.0/24 <http://192.168.20.0/24>

Bringing up the wg0 interface via wg-quick is OK:

root@srv ~# wg
interface: wg0
   public key: A7MreEBC3maH305tVrU0HEoQrBhy+An6KlvZ+z9KFRA=
   private key: (hidden)
   listening port: 51820

peer: kExj276RLpqCZoDdOYHiq4FQHKA94y0eY1W/ptvT2y4=
   allowed ips: 192.168.20.0/24 <http://192.168.20.0/24>

I have a client peer configured as well:

[Interface]
Address = 192.168.20.2/24 <http://192.168.20.2/24>
ListenPort = 51820
PrivateKey = LaptopPrivateKey

# the server I want to connect to
[Peer]
# this public key is derived from the server's private key UbuntuPrivateKey
PublicKey = A7MreEBC3maH305tVrU0HEoQrBhy+An6KlvZ+z9KFRA=
AllowedIPs = 192.168.20.0/24 <http://192.168.20.0/24>
# Address of the server
Endpoint = wireguard.example.com:51820 <http://wireguard.example.com:51820>
# Send periodic keepalives to ensure connection stays up behind NAT.
PersistentKeepalive = 25

When connecting from the client, I see handshake packets leaving it, and 
arriving on the server - on its external interface:

root@srv ~# tcpdump -i eth0 port 51820 -vvv -X
tcpdump: listening on br0, link-type EN10MB (Ethernet), capture size 
262144 bytes
10:35:29.386976 IP (tos 0x0, ttl 115, id 17333, offset 0, flags [none], 
proto UDP (17), length 176)
     91-244-238-14.rev.ltt.li.59958 > srv.swtk.info.51820: [udp sum ok] 
UDP, length 148
         0x0000:  4500 00b0 43b5 0000 7311 eeda 5bf4 ee0e  E...C...s...[...
         0x0010:  c0a8 0a02 ea36 ca6c 009c 98e7 0100 0000  .....6.l........
         0x0020:  ac50 0f85 6ead 67f6 2c38 4b74 43c4 6388  .P..n.g.,8KtC.c.
         0x0030:  f594 1886 6699 f439 183e ad2b 0e02 4e13  ....f..9.>.+..N.
         0x0040:  c1a8 d14a f1c6 8d13 1f98 8c2c 6cfd dbf6  ...J.......,l...
         0x0050:  9f2f 8d35 9073 bad1 ddd7 927e 0552 aadf  ./.5.s.....~.R..

The same tcpdump command ran against wg0 does not show any traffic (but 
maybe this is normal?)

The client keeps on sending handshake packets.

Q1: is there anything I should do in order for the packets to reach wg0, 
or do they reach it but I just do not see that with tcpdump (sorry, I am 
not well versed with virtual interfaces)
Q2: if there is nothing more to do than a wg-quick, is there a way to 
debug the server to understand what happens with this handshake packet 
(= it is rejected because ...)

Thanks!



_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard



--------------EF8607C1A15A9D2314C2BFC7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body smarttemplateinserted="true">
    <div id="smartTemplate4-quoteHeader">
      <div style="font-size:10.0pt;font-family:Verdana,Arial">First of
        all, check if the server receives the handshake with: <font
          face="Courier New">sudo wg show wg0 help</font> (you'll see
        all available options). Start with <font face="Courier New">latest-handshakes</font>
        and <font face="Courier New">endpoints</font>. If the server
        sees the client in the endpoints and its latest handshake time
        updates accordingly, then the tunnel is working.<br>
        <br>
        Then check the routes. When you do <font face="Courier New">sudo
          wg-quick up wg0</font>, what's the output? Are the routes
        created? What's the output of <font face="Courier New">ip rule
          show</font> and <font face="Courier New">ip route show table
          all</font>? If you specify on the client <font face="Courier
          New">AllowedIPs = 0.0.0.0/0</font>, then wg-quick creates all
        needed routes automatically. If not, you'll have to create them
        manually. Check the man pages:
        <a class="moz-txt-link-freetext" href="https://git.zx2c4.com/WireGuard/about/src/tools/man/wg-quick.8">https://git.zx2c4.com/WireGuard/about/src/tools/man/wg-quick.8</a>
        and <a class="moz-txt-link-freetext" href="https://git.zx2c4.com/WireGuard/about/src/tools/man/wg.8">https://git.zx2c4.com/WireGuard/about/src/tools/man/wg.8</a>.<br>
        <br>
        Try to see what's the route to the desired destination with: <font
          face="Courier New">ip -s route get &lt;IP&gt;</font>.<br>
        <br>
      </div>
      <div style="border:none;border-top:solid #B5C4DF
        1.0pt;padding:3.0pt 0cm 0cm
0cm;font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"><b>From:</b>
        Wojtek Swiatek <a class="moz-txt-link-rfc2396E" href="mailto:w@swtk.info">&lt;w@swtk.info&gt;</a><br>
        <b>Sent:</b> Tuesday, February 26, 2019 06:59<br>
        <b>To:</b> Wireguard Mailing List
        <a class="moz-txt-link-rfc2396E" href="mailto:wireguard@lists.zx2c4.com">&lt;wireguard@lists.zx2c4.com&gt;</a><br>
        <b>Subject:</b> How to debug wireguard on the server?<br>
      </div>
      <br>
    </div>
    <div class="replaced-blockquote"
cite="mid:CAPRYYOZY_fPDkQyebrY6vu7CTvzHoniHyhiZwNHLS6zfgk5JQg@mail.gmail.com"
      type="cite">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div dir="ltr">
            <div dir="ltr">
              <div dir="ltr">Hello everyone
                <div><br>
                </div>
                <div>I am trying to set up wireguard on a Linux server
                  (Ubuntu 18.04) and I am having some issues. The
                  configuration of the server:</div>
                <div><br>
                </div>
                <div>
                  <div>[Interface]</div>
                  <div>Address = <a href="http://192.168.20.1/24"
                      moz-do-not-send="true">192.168.20.1/24</a></div>
                  <div>ListenPort = 51820</div>
                  <div>PrivateKey = UbuntuPrivateKey</div>
                  <div><br>
                  </div>
                  <div># the laptop I want to connect from</div>
                  <div>[Peer]</div>
                  <div># this public key is derived from the laptop's
                    private key LaptopPrivateKey</div>
                  <div>PublicKey =
                    kExj276RLpqCZoDdOYHiq4FQHKA94y0eY1W/ptvT2y4=</div>
                  <div>AllowedIPs = <a href="http://192.168.20.0/24"
                      moz-do-not-send="true">192.168.20.0/24</a></div>
                </div>
                <div><br>
                </div>
                <div>Bringing up the wg0 interface via wg-quick is OK:</div>
                <div><br>
                </div>
                <div>
                  <div>root@srv ~# wg</div>
                  <div>interface: wg0</div>
                  <div>  public key:
                    A7MreEBC3maH305tVrU0HEoQrBhy+An6KlvZ+z9KFRA=</div>
                  <div>  private key: (hidden)</div>
                  <div>  listening port: 51820</div>
                  <div><br>
                  </div>
                  <div>peer:
                    kExj276RLpqCZoDdOYHiq4FQHKA94y0eY1W/ptvT2y4=</div>
                  <div>  allowed ips: <a href="http://192.168.20.0/24"
                      moz-do-not-send="true">192.168.20.0/24</a></div>
                </div>
                <div><br>
                </div>
                <div>I have a client peer configured as well:</div>
                <div><br>
                </div>
                <div>
                  <div>[Interface]</div>
                  <div>Address = <a href="http://192.168.20.2/24"
                      moz-do-not-send="true">192.168.20.2/24</a></div>
                  <div>ListenPort = 51820</div>
                  <div>PrivateKey = LaptopPrivateKey</div>
                  <div><br>
                  </div>
                  <div># the server I want to connect to</div>
                  <div>[Peer]</div>
                  <div># this public key is derived from the server's
                    private key UbuntuPrivateKey</div>
                  <div>PublicKey =
                    A7MreEBC3maH305tVrU0HEoQrBhy+An6KlvZ+z9KFRA=</div>
                  <div>AllowedIPs = <a href="http://192.168.20.0/24"
                      moz-do-not-send="true">192.168.20.0/24</a></div>
                  <div># Address of the server</div>
                  <div>Endpoint = <a
                      href="http://wireguard.example.com:51820"
                      moz-do-not-send="true">wireguard.example.com:51820</a></div>
                  <div># Send periodic keepalives to ensure connection
                    stays up behind NAT.</div>
                  <div>PersistentKeepalive = 25</div>
                </div>
                <div><br>
                </div>
                <div>When connecting from the client, I see handshake
                  packets leaving it, and arriving on the server - on
                  its external interface:</div>
                <div><br>
                </div>
                <div>
                  <div>root@srv ~# tcpdump -i eth0 port 51820 -vvv -X</div>
                  <div>tcpdump: listening on br0, link-type EN10MB
                    (Ethernet), capture size 262144 bytes</div>
                  <div>10:35:29.386976 IP (tos 0x0, ttl 115, id 17333,
                    offset 0, flags [none], proto UDP (17), length 176)</div>
                  <div>    91-244-238-14.rev.ltt.li.59958 &gt;
                    srv.swtk.info.51820: [udp sum ok] UDP, length 148</div>
                  <div>        0x0000:  4500 00b0 43b5 0000 7311 eeda
                    5bf4 ee0e  E...C...s...[...</div>
                  <div>        0x0010:  c0a8 0a02 ea36 ca6c 009c 98e7
                    0100 0000  .....6.l........</div>
                  <div>        0x0020:  ac50 0f85 6ead 67f6 2c38 4b74
                    43c4 6388  .P..n.g.,8KtC.c.</div>
                  <div>        0x0030:  f594 1886 6699 f439 183e ad2b
                    0e02 4e13  ....f..9.&gt;.+..N.</div>
                  <div>        0x0040:  c1a8 d14a f1c6 8d13 1f98 8c2c
                    6cfd dbf6  ...J.......,l...</div>
                  <div>        0x0050:  9f2f 8d35 9073 bad1 ddd7 927e
                    0552 aadf  ./.5.s.....~.R..</div>
                </div>
                <div><br>
                </div>
                <div>The same tcpdump command ran against wg0 does not
                  show any traffic (but maybe this is normal?)</div>
                <div><br>
                </div>
                <div>The client keeps on sending handshake packets.</div>
                <div><br>
                </div>
                <div>Q1: is there anything I should do in order for the
                  packets to reach wg0, or do they reach it but I just
                  do not see that with tcpdump (sorry, I am not well
                  versed with virtual interfaces)</div>
                <div>Q2: if there is nothing more to do than a wg-quick,
                  is there a way to debug the server to understand what
                  happens with this handshake packet (= it is rejected
                  because ...)</div>
                <div><br>
                </div>
                <div>Thanks!</div>
                <div><br>
                </div>
                <div><br>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </div>
    <br>
  </body>
</html>

--------------EF8607C1A15A9D2314C2BFC7--

--===============2736858355702675315==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2736858355702675315==--
