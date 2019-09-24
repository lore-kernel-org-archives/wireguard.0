Return-Path: <SRS0=ifwh=XT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BA4C432C2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Sep 2019 15:29:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D488F20665
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Sep 2019 15:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D488F20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=attglobal.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30d22c4f;
	Tue, 24 Sep 2019 15:29:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6007c9ce
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Sep 2019 15:29:07 +0000 (UTC)
Received: from dnvrco-cmomta02.email.rr.com (dnvrco-outbound-snat.email.rr.com
 [107.14.73.232])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 48ec790b
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Sep 2019 15:29:07 +0000 (UTC)
Received: from [192.168.0.2] ([23.243.28.100]) by cmsmtp with ESMTP
 id CmkRiep9hiYm2CmkUiy1ZS; Tue, 24 Sep 2019 15:29:06 +0000
Subject: Re: Centos 7.6 wg-quick not working properly
To: George Lucan <boss_geo2005@yahoo.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <1429556426.5086611.1568572361543.ref@mail.yahoo.com>
 <1429556426.5086611.1568572361543@mail.yahoo.com>
 <432951712.5476709.1568659634512@mail.yahoo.com>
From: Eddie <stunnel@attglobal.net>
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <26c139a5-d8a4-528f-d777-937966557699@attglobal.net>
Date: Tue, 24 Sep 2019 08:29:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <432951712.5476709.1568659634512@mail.yahoo.com>
Content-Language: en-US
X-CMAE-Envelope: MS4wfPx9ti5n/BUlpDNY3mtNdx4XtC8sJfzvY01QMwPy2Su2mXs9qi/VzdHnflOY307Ek/jXLM0Uw/7LKfjqLIQUKYcz58vbHgjmKXYnIQuA7SqH8oHWwSV3
 Ro4ntgRRnVoWPeyTp20gdS3WFYZlWV5ZQObEbG6yxicFQRCvUva+Ucd3KznSNVemIRr5ljaBSx3wS8PwzHPvFKSzLimyNbdVmAA=
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: stunnel@attglobal.net
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7374351373533035368=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============7374351373533035368==
Content-Type: multipart/alternative;
 boundary="------------74D8DAE246B95F130B1DFC37"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------74D8DAE246B95F130B1DFC37
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I'll just repeat verbatim the response I got from Silvan (thank you) 
when I reported the same issue previously:

The main problem is that the current standard kernel of CentOS simple 
does not support the handling of "suppress_prefixlength".
Iproute2 supports it since it does not return any error while adding so 
it had to be the kernel causing problems.
In essence Red Hats official answer was "It isn't a bug, RHEL7 simple 
does not support it".
If you sill want to fix your problem just upgrade your kernel to 
long-term or mainline.

Cheers.

On 9/16/2019 11:47 AM, George Lucan wrote:
> Hello,
>
> Some further investigations have revealed that actually the "second 
> main" table gets created by the last command executed by wg-quick "ip 
> -4 rule add table main suppress_prefixlength 0". Will try to figure 
> out what is happening further.
>
> George
>
> On Sunday, 15 September 2019, 9:32:41 pm GMT+3, George Lucan 
> <boss_geo2005@yahoo.com> wrote:
>
>
> Hello,
>
> I have been trying for several days to setup a wireguard vpn and send 
> all the traffic from a VM to another site (redirect gateway scenario).
>
> Site A
> OS is Centos 7.6 installed with docker and wireguard installed
>
> Site B
> OS is a Opensense 19.7.4 with wireguard installed from the plugin and 
> a bunch of other things on it
>
> I believe the issue is within Ip route on Centos 7.6 but I am reaching 
> out for maybe different opinions.
> On the Centos VM I am using wireguard installed from the repos on the 
> website and using systemd to bring up the tunnel. Everything seem to 
> be brought up correctly except that the traffic does not go through 
> the tunnel.
>
> Further investigating I noticed something unusual (in my opinion).
>
> Before the tunnel is up:
> #ip rule show
> 0:      from all lookup local
> 32766:  from all lookup main
> 32767:  from all lookup default
> After the tunnel is up:
> #ip rule show
> 0:      from all lookup local
> 32764:  from all lookup main
> 32765:  not from all fwmark 0xca6c lookup 51820
> 32766:  from all lookup main
> 32767:  from all lookup default
> To me is seems like somehow there are 2 tables named "main" one after 
> the new table created by wg-quick (looking at the priority it seems it 
> is the same one that was present previously) and another one that gets 
> create out of thin air before the wireguard created one named 51820.
> Ping works through the tunnel for IP to the other end of the tunnel
> #wg
> interface: wg0
>    public key: 8JXLXfl1W2xZd1T+zaCKSNB+FhUbb1IquIHvHhY7/iY=
>    private key: (hidden)
>    listening port: 34559
>    fwmark: 0xca6c
>
> peer: 04kTPSrh08X5uOCmL5aM1iCm8UqFHGtJDsrsPReafS8=
>    endpoint: 188.27.172.68:1300
>    allowed ips: 0.0.0.0/0
>    latest handshake: 1 minute, 41 seconds ago
>    transfer: 87.85 KiB received, 415.61 KiB sent
>    persistent keepalive: every 15 seconds
> # ping 192.168.249.1
> PING 192.168.249.1 (192.168.249.1) 56(84) bytes of data.
> 64 bytes from 192.168.249.1: icmp_seq=1 ttl=64 time=89.2 ms
> 64 bytes from 192.168.249.1: icmp_seq=2 ttl=64 time=89.5 ms
> Is there any step that I might have missed or any kernel feature that would explain the behaviour?
> Worth mentioning it is a home env so I can test whatever is needed to get to the bottom of it.
> Thanks
> George
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--------------74D8DAE246B95F130B1DFC37
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    I'll just repeat verbatim the response I got from Silvan (thank you)
    when I reported the same issue previously:<br>
    <br>
    The main problem is that the current standard kernel of CentOS
    simple does not support the handling of "suppress_prefixlength".
    <br>
    Iproute2 supports it since it does not return any error while adding
    so it had to be the kernel causing problems.
    <br>
    In essence Red Hats official answer was "It isn't a bug, RHEL7
    simple does not support it".
    <br>
    If you sill want to fix your problem just upgrade your kernel to
    long-term or mainline.
    <br>
    <br>
    Cheers.<br>
    <br>
    <div class="moz-cite-prefix">On 9/16/2019 11:47 AM, George Lucan
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:432951712.5476709.1568659634512@mail.yahoo.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div class="ydpb7fc655cyahoo-style-wrap" style="font-family:
        Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 13px;">
        <div dir="ltr" data-setdir="false">Hello,</div>
        <div dir="ltr" data-setdir="false"><br>
        </div>
        <div dir="ltr" data-setdir="false">Some further investigations
          have revealed that actually the "second main" table gets
          created by the last command executed by wg-quick "<span style="orphans: 2; white-space: pre-wrap; widows: 2;">ip -4 rule add table main suppress_prefixlength 0</span>".
          Will try to figure out what is happening further.</div>
        <div dir="ltr" data-setdir="false"><br>
        </div>
        <div dir="ltr" data-setdir="false">George</div>
        <div><br>
        </div>
      </div>
      <div id="ydp88fb36beyahoo_quoted_8919518802"
        class="ydp88fb36beyahoo_quoted">
        <div style="font-family:'Helvetica Neue', Helvetica, Arial,
          sans-serif;font-size:13px;color:#26282a;">
          <div> On Sunday, 15 September 2019, 9:32:41 pm GMT+3, George
            Lucan <a class="moz-txt-link-rfc2396E" href="mailto:boss_geo2005@yahoo.com">&lt;boss_geo2005@yahoo.com&gt;</a> wrote: </div>
          <div><br>
          </div>
          <div><br>
          </div>
          <div>
            <div id="ydp88fb36beyiv3767299611">
              <div>
                <div
                  class="ydp88fb36beyiv3767299611ydpceb13acfyahoo-style-wrap"
                  style="font-size:13px;">
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;">Hello,</div>
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;"><br>
                  </div>
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;">I have been trying
                    for several days to setup a wireguard vpn and send
                    all the traffic from a VM to another site (redirect
                    gateway scenario).</div>
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;"><br>
                  </div>
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;">Site A</div>
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;">OS is Centos 7.6
                    installed with docker and wireguard installed</div>
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;"><br>
                  </div>
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;">Site B</div>
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;">OS is a Opensense
                    19.7.4 with wireguard installed from the plugin and
                    a bunch of other things on it</div>
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;"><br>
                  </div>
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;">I believe the issue
                    is within Ip route on Centos 7.6 but I am reaching
                    out for maybe different opinions.</div>
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;">On the Centos VM I am
                    using wireguard installed from the repos on the
                    website and using systemd to bring up the tunnel.
                    Everything seem to be brought up correctly except
                    that the traffic does not go through the tunnel.</div>
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;"><br>
                  </div>
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;">Further investigating
                    I noticed something unusual (in my opinion).</div>
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;"><br>
                  </div>
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;">Before the tunnel is
                    up:</div>
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;">
                    <div dir="ltr">
                      <pre style="orphans:2;widows:2;">#ip rule show
0:      from all lookup local 
32766:  from all lookup main 
32767:  from all lookup default </pre>
                    </div>
                  </div>
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;">After the tunnel is
                    up:</div>
                  <div dir="ltr">
                    <div dir="ltr">
                      <pre style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;orphans:2;widows:2;">#ip rule show
0:      from all lookup local 
32764:  from all lookup main 
32765:  not from all fwmark 0xca6c lookup 51820 
32766:  from all lookup main 
32767:  from all lookup default </pre>
                      <pre style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;orphans:2;widows:2;"><span><span style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;">To me is seems like somehow there are 2 tables named "main" one after the new table created by wg-quick (looking at the priority it seems it is the same one that was present previously) and another one that gets create out of thin air before the wireguard created one named 51820.</span></span></pre>
                      <pre style="orphans:2;widows:2;"><span style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;">Ping works through the tunnel for IP to the other end of the tunnel</span></pre>
                      <pre style="orphans:2;widows:2;"><div dir="ltr"><pre>#wg
interface: wg0
  public key: 8JXLXfl1W2xZd1T+zaCKSNB+FhUbb1IquIHvHhY7/iY=
  private key: (hidden)
  listening port: 34559
  fwmark: 0xca6c

peer: 04kTPSrh08X5uOCmL5aM1iCm8UqFHGtJDsrsPReafS8=
  endpoint: 188.27.172.68:1300
  allowed ips: 0.0.0.0/0
  latest handshake: 1 minute, 41 seconds ago
  transfer: 87.85 KiB received, 415.61 KiB sent
  persistent keepalive: every 15 seconds</pre><pre><div dir="ltr"><pre># ping 192.168.249.1
PING 192.168.249.1 (192.168.249.1) 56(84) bytes of data.
64 bytes from 192.168.249.1: icmp_seq=1 ttl=64 time=89.2 ms
64 bytes from 192.168.249.1: icmp_seq=2 ttl=64 time=89.5 ms</pre></div></pre></div></pre>
                    </div>
                  </div>
                  <div dir="ltr" style="font-family:Helvetica Neue,
                    Helvetica, Arial, sans-serif;"><span>
                      <pre style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;orphans:2;widows:2;">Is there any step that I might have missed or any kernel feature that would explain the behaviour?</pre>
                      <pre style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;orphans:2;widows:2;">Worth mentioning it is a home env so I can test whatever is needed to get to the bottom of it.</pre>
                      <pre style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;orphans:2;widows:2;">
</pre>
                      <pre style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;orphans:2;widows:2;">Thanks</pre>
                      <pre style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;orphans:2;widows:2;">
</pre>
                      <pre style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;orphans:2;widows:2;">George</pre>
                    </span></div>
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
    </blockquote>
    <br>
  </body>
</html>

--------------74D8DAE246B95F130B1DFC37--

--===============7374351373533035368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7374351373533035368==--
