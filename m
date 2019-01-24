Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EF6C10F00
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:20:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7334E21A4A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 01:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7334E21A4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=familie-schwamborn.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9d17acb;
	Sun, 17 Feb 2019 01:11:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6109ba3c
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 23:15:13 +0000 (UTC)
Received: from 2.mo4.mail-out.ovh.net (2.mo4.mail-out.ovh.net [46.105.72.36])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bfd7de11
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 23:15:13 +0000 (UTC)
Received: from player699.ha.ovh.net (unknown [10.109.160.54])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 0F7F71CCDCB
 for <wireguard@lists.zx2c4.com>; Fri, 25 Jan 2019 00:20:27 +0100 (CET)
Received: from familie-schwamborn.com (pD954C7A4.dip0.t-ipconnect.de
 [217.84.199.164])
 (Authenticated sender: fabian@familie-schwamborn.com)
 by player699.ha.ovh.net (Postfix) with ESMTPSA id 4D8582000110;
 Thu, 24 Jan 2019 23:20:26 +0000 (UTC)
Subject: Re: Optional DNS-Check or Ping-test for the Android App
To: David Cowden <dcow@eero.com>
References: <4844f7fa-6e60-4fe3-30b3-e9f87952235b@familie-schwamborn.com>
 <CACN7iOBjmzC9Ft3JRObFFABuuAbdVjD7UkaXxYcXtLE9n4WKMw@mail.gmail.com>
 <012090d9-5191-9741-12e0-bd7352307aa0@familie-schwamborn.com>
 <CACN7iOBQP9e1Q=CB_z2nQ8B8PY_aw2HEbv_AAA2aaAqScK-=PQ@mail.gmail.com>
From: Fabian Schwamborn <fabian@familie-schwamborn.com>
Message-ID: <46f75f76-d175-c268-0d5b-6c298438c6c9@familie-schwamborn.com>
Date: Fri, 25 Jan 2019 00:20:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CACN7iOBQP9e1Q=CB_z2nQ8B8PY_aw2HEbv_AAA2aaAqScK-=PQ@mail.gmail.com>
X-Ovh-Tracer-Id: 5204753794937185871
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtledrieefgddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Mailman-Approved-At: Sun, 17 Feb 2019 02:11:47 +0100
Cc: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============7910932981364575429=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============7910932981364575429==
Content-Type: multipart/alternative;
 boundary="------------0D0B6CED055213D024CAA47B"

This is a multi-part message in MIME format.
--------------0D0B6CED055213D024CAA47B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 16.01.2019 um 23:06 schrieb David Cowden:
>
>
> On Wed, Jan 16, 2019 at 1:29 PM Fabian Schwamborn 
> <fabian@familie-schwamborn.com <mailto:fabian@familie-schwamborn.com>> 
> wrote:
>
>     I think you misunderstood me. Most broadband providers don't offer
>     fixed IPv4. Due to privacy considerations, even under IPv6 on
>     normal connections, addresses will always change. (prefix) As soon
>     as an address changes and my dynamic DNS system registers it, an
>     IPsec or OpenVPN client on my phone can reconnect. (This happens
>     once a week).
>     The Wireguard app simply lacks a monitor to see if the IP address
>     has changed. Therefore a ttl in the DNS was introduced .... (After
>     a registered loss of the connection - also shown in the log - no
>     DNS request is executed and the tunnel breaks down permanently.)
>
>     I think the
>
> Yes, I thought you were asking for what you already have setup. My 
> apologies.
>
>     se are the most common scenarios with OpenWRT routers ...
>
>     Having a DNS entry does not mean that it always points to a static
>     ip, so when a tunnel disconnects, the Android-app itself
>     (userspace) should handle this like many other existing
>     VPN-Clients do by a re-query of the DNS entry...
>
>     My question is, is there any opinion on such an implementation?
>     Should i try to implement it into the android app and provide the
>     code? (Unfortunately i am not a good android app-developer)
>
> This sounds like something the wg-go userspace should support, not the 
> android or ios app ui.

The wg-go userspace application is just the interface to the kernel 
module (or an userspace program, that emulates the kernel module)

The Linux-Kernel is not able to resolve any DNS because it could only 
handle IP-Adresses. I don't think that it would be a good idea to write 
a dns-resolver for a kernel module.

 From my point of view, each connected endpoint has to be monitored 
periodically by a userspace program (in this case java or an additional 
go-module). In case of a tunnel malfunktion OR based on a timer the 
Hostname has to be re-resolved.

Therefore my current question: Are custom code contributions welcome in 
this respect?

I am currently thinking about adding a timer-supported tunnel monitoring 
to the app.


>
>     Am 16.01.2019 um 21:57 schrieb David Cowden:
>>     You need to setup dns for your home site then use that to
>>     connect. Or you need to synchronize the endpoint out of band. I
>>     can't imagine this is something wg wants to tackle--this is a
>>     general problem all software encounters.
>>
>>     On Tue, Jan 15, 2019 at 10:52 PM Fabian Schwamborn
>>     <fabian@familie-schwamborn.com
>>     <mailto:fabian@familie-schwamborn.com>> wrote:
>>
>>         Hello,
>>
>>         I have a suggestion for improving the Android app or would
>>         like to ask if such a change would be desirable in general
>>         (e.g. pull request):
>>
>>         I'm using Wireguard as a connection between my home router
>>         and my mobile phone, but unfortunately I don't have a fixed
>>         IP address. As soon as the IP address changes, the app does
>>         not reconnect. (Happens once a week)
>>
>>         Is it possible to integrate a function into the app, that
>>         pings through the tunnel so that you can perform a keep-alive
>>         check and reconnect the tunnel completely after a failure
>>         (including DNS request)?
>>
>>         Is it conceivable, to implement a DNS-check function in the
>>         app? (E.g. like the existing example DNS check script for
>>         Linux works?)
>>
>>         Then the app would have the same functionality as my previous
>>         IP-Sec client. This would also allow better coverage of
>>         failover IP scenarios.
>>
>>
>>         Best Regards
>>
>>         Fabian
>>
>>         _______________________________________________
>>         WireGuard mailing list
>>         WireGuard@lists.zx2c4.com <mailto:WireGuard@lists.zx2c4.com>
>>         https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>

--------------0D0B6CED055213D024CAA47B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">Am 16.01.2019 um 23:06 schrieb David
      Cowden:<br>
    </div>
    <blockquote type="cite"
cite="mid:CACN7iOBQP9e1Q=CB_z2nQ8B8PY_aw2HEbv_AAA2aaAqScK-=PQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Jan 16, 2019 at 1:29
            PM Fabian Schwamborn &lt;<a
              href="mailto:fabian@familie-schwamborn.com"
              moz-do-not-send="true">fabian@familie-schwamborn.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div bgcolor="#FFFFFF">
              <p>I think you misunderstood me. Most broadband providers
                don't offer fixed IPv4. Due to privacy considerations,
                even under IPv6 on normal connections, addresses will
                always change. (prefix) As soon as an address changes
                and my dynamic DNS system registers it, an IPsec or
                OpenVPN client on my phone can reconnect. (This happens
                once a week).<br>
                The Wireguard app simply lacks a monitor to see if the
                IP address has changed. Therefore a ttl in the DNS was
                introduced .... (After a registered loss of the
                connection - also shown in the log - no DNS request is
                executed and the tunnel breaks down permanently.)</p>
              <p>I think the</p>
            </div>
          </blockquote>
          <div>Yes, I thought you were asking for what you already have
            setup. My apologies.<br>
          </div>
          <div> </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div bgcolor="#FFFFFF">
              <p>se are the most common scenarios with OpenWRT routers
                ...<br>
              </p>
              <p>Having a DNS entry does not mean that it always points
                to a static ip, so when a tunnel disconnects, the
                Android-app itself (userspace) should handle this like
                many other existing VPN-Clients do by a re-query of the
                DNS entry...</p>
              <p>My question is, is there any opinion on such an
                implementation? Should i try to implement it into the
                android app and provide the code? (Unfortunately i am
                not a good android app-developer)<br>
              </p>
            </div>
          </blockquote>
          <div>This sounds like something the wg-go userspace should
            support, not the android or ios app ui. <br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>The wg-go userspace application is just the interface to the
      kernel module (or an userspace program, that emulates the kernel
      module)</p>
    <p>The Linux-Kernel is not able to resolve any DNS because it could
      only handle IP-Adresses. I don't think that it would be a good
      idea to write a dns-resolver for a kernel module. <br>
    </p>
    <p>From my point of view, each connected endpoint has to be
      monitored periodically by a userspace program (in this case java
      or an additional go-module). In case of a tunnel malfunktion OR
      based on a timer the Hostname has to be re-resolved. <br>
    </p>
    <p>Therefore my current question: Are custom code contributions
      welcome in this respect? <br>
    </p>
    <p>I am currently thinking about adding a timer-supported tunnel
      monitoring to the app.</p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CACN7iOBQP9e1Q=CB_z2nQ8B8PY_aw2HEbv_AAA2aaAqScK-=PQ@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div bgcolor="#FFFFFF">
              <p> </p>
              <p><br>
              </p>
              <div class="gmail-m_6222563726764716946moz-cite-prefix">Am
                16.01.2019 um 21:57 schrieb David Cowden:<br>
              </div>
              <blockquote type="cite">
                <div dir="ltr">You need to setup dns for your home site
                  then use that to connect. Or you need to synchronize
                  the endpoint out of band. I can't imagine this is
                  something wg wants to tackle--this is a general
                  problem all software encounters.<br>
                </div>
                <br>
                <div class="gmail_quote">
                  <div dir="ltr"
                    class="gmail-m_6222563726764716946gmail_attr">On
                    Tue, Jan 15, 2019 at 10:52 PM Fabian Schwamborn &lt;<a
                      href="mailto:fabian@familie-schwamborn.com"
                      target="_blank" moz-do-not-send="true">fabian@familie-schwamborn.com</a>&gt;
                    wrote:<br>
                  </div>
                  <blockquote class="gmail_quote" style="margin:0px 0px
                    0px 0.8ex;border-left:1px solid
                    rgb(204,204,204);padding-left:1ex">
                    <div bgcolor="#FFFFFF">
                      <p class="MsoNormal">Hello,</p>
                      <p class="MsoNormal"> </p>
                      <p class="MsoNormal">I have a suggestion for
                        improving the Android app or would like to ask
                        if such a change would be desirable in general
                        (e.g. pull request):</p>
                      <p class="MsoNormal">I'm using Wireguard as a
                        connection between my home router and my mobile
                        phone, but unfortunately I don't have a fixed IP
                        address. As soon as the IP address changes, the
                        app does not reconnect. (Happens once a week)<br>
                      </p>
                      <p class="MsoNormal">Is it possible to integrate a
                        function into the app, that pings through the
                        tunnel so that you can perform a keep-alive
                        check and reconnect the tunnel completely after
                        a failure (including DNS request)?</p>
                      <p class="MsoNormal">Is it conceivable, to
                        implement a DNS-check function in the app? (E.g.
                        like the existing example DNS check script for
                        Linux works?)</p>
                      <p class="MsoNormal">Then the app would have the
                        same functionality as my previous IP-Sec client.
                        This would also allow better coverage of
                        failover IP scenarios.</p>
                      <p class="MsoNormal"><br>
                      </p>
                      <p class="MsoNormal">Best Regards  </p>
                      <p class="MsoNormal">Fabian</p>
                    </div>
                    _______________________________________________<br>
                    WireGuard mailing list<br>
                    <a href="mailto:WireGuard@lists.zx2c4.com"
                      target="_blank" moz-do-not-send="true">WireGuard@lists.zx2c4.com</a><br>
                    <a
                      href="https://lists.zx2c4.com/mailman/listinfo/wireguard"
                      rel="noreferrer" target="_blank"
                      moz-do-not-send="true">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><br>
                  </blockquote>
                </div>
              </blockquote>
              <br>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------0D0B6CED055213D024CAA47B--

--===============7910932981364575429==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7910932981364575429==--
