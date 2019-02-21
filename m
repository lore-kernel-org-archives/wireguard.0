Return-Path: <SRS0=i+YM=Q4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D4EC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 23:29:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94BA0207E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 23:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94BA0207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1612887;
	Thu, 21 Feb 2019 23:20:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94488336
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 23:20:43 +0000 (UTC)
Received: from telperion.info (2600:3c01::f03c:91ff:fe96:a052
 [IPv6:2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae53f8d1
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 23:20:43 +0000 (UTC)
Received: from [10.16.57.126] (1piece.static.monkeybrains.net
 [::ffff:208.90.213.83])
 (AUTH: LOGIN pallas, SSL: TLS1.2,128bits,ECDHE_RSA_AES_128_GCM_SHA256)
 by telperion.info with ESMTPSA; Thu, 21 Feb 2019 15:32:19 -0800
 id 000000000004912D.000000005C6F3503.000019F3
Subject: Re: upgrading raspberry pi required me to re install wireguard
To: wireguard@lists.zx2c4.com
References: <CAGCGyt+bsxa-aRoETJFTwvOZ1eb=Q_AemZUwufN_7RYicnnKaw@mail.gmail.com>
 <ac5a35ae-7efb-4143-bf61-a687f6cee8a8@www.fastmail.com>
 <CAGCGytJE5bzXiXB8Go6aHk5OLT0D-m2AnKbRt=Nv1giEVrpsjA@mail.gmail.com>
From: Derrick Lyndon Pallas <derrick@pallas.us>
Message-ID: <9e6f49da-bf09-ab90-dba7-ac5587863a31@pallas.us>
Date: Thu, 21 Feb 2019 15:29:02 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CAGCGytJE5bzXiXB8Go6aHk5OLT0D-m2AnKbRt=Nv1giEVrpsjA@mail.gmail.com>
Content-Language: en-US
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
Content-Type: multipart/mixed; boundary="===============0717463657181765331=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============0717463657181765331==
Content-Type: multipart/alternative;
 boundary="------------5EB7EED026685A9450DC173A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5EB7EED026685A9450DC173A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

I just use DKMS to do it. Check out WireGuard to /usr/src, ln -s 
WireGuard/src WireGuard-0, dkms add WireGuard/0. If it's not auto 
building, have you tried dkms install WireGuard/0? ~D


On 2/21/19 2:57 PM, Arpit Gupta wrote:
> Ya reboot did not solve this for me. I will read up on how I can 
> execute package pre/post install scripts.
>
> Curious to know if the rebuild the module is the responsibility of the 
> os or the package after a kernel upgrade?
>
> I will try to remember this next time there is a kernel upgrade 😁.
>
>
> --
> Arpit
>
> On Thu, Feb 21, 2019, 4:30 AM <logcabin@fastmail.net 
> <mailto:logcabin@fastmail.net>> wrote:
>
>     Yes, the kernel did get updated, causing the wg module
>     dependencies to get out of sync. A reboot after the update should
>     solve this, otherwise you may need to run the package's preinst
>     script to get the modules back in sync. Should be no need to
>     reinstall the wg packages.
>
>     On Thu, Feb 21, 2019, at 2:14 AM, Arpit Gupta wrote:
>>     Hi All
>>
>>     I am running raspberry pi v3 and ran apt-get update and upgrade
>>     commands to get upto date. It also ended up updating the kernel i
>>     think. I should have paid more attention to what all was getting
>>     updated.
>>
>>     After the update wireguard was not running and upon debugging i
>>     found that the wireguard kernel module was no longer present. So
>>     i uninstalled all wireguard packages and installed them again and
>>     the module showed up and on reboot system was back to normal.
>>     What i was curious was how should one go about doing os/kernel
>>     updates in future in order to avoid this issue?
>>
>>     I am running
>>     Linux raspberrypi 4.14.98-v7+ #1200 SMP Tue Feb 12 20:27:48 GMT
>>     2019 armv7l GNU/Linux
>>     No LSB modules are available.
>>     Distributor ID:Raspbian
>>     Description:Raspbian GNU/Linux 9.8 (stretch)
>>     Release:9.8
>>     Codename:stretch
>>
>>     ii  wireguard  0.0.20190123-1               all fast, modern,
>>     secure kernel VPN tunnel (metapackage)
>>     ii  wireguard-dkms 0.0.20190123-1               all fast, modern,
>>     secure kernel VPN tunnel (DKMS version)
>>     ii  wireguard-tools  0.0.20190123-1               armhf fast,
>>     modern, secure kernel VPN tunnel (userland utilities)
>>
>>     --
>>     Arpit
>>     _______________________________________________
>>     WireGuard mailing list
>>     WireGuard@lists.zx2c4.com <mailto:WireGuard@lists.zx2c4.com>
>>     https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>
>     _______________________________________________
>     WireGuard mailing list
>     WireGuard@lists.zx2c4.com <mailto:WireGuard@lists.zx2c4.com>
>     https://lists.zx2c4.com/mailman/listinfo/wireguard
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--------------5EB7EED026685A9450DC173A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>I just use DKMS to do it. Check out WireGuard to /usr/src, ln -s
      WireGuard/src WireGuard-0, dkms add WireGuard/0. If it's not auto
      building, have you tried dkms install WireGuard/0? ~D<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/21/19 2:57 PM, Arpit Gupta wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAGCGytJE5bzXiXB8Go6aHk5OLT0D-m2AnKbRt=Nv1giEVrpsjA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="auto">Ya reboot did not solve this for me. I will read
        up on how I can execute package pre/post install scripts.
        <div dir="auto"><br>
        </div>
        <div dir="auto">Curious to know if the rebuild the module is the
          responsibility of the os or the package after a kernel
          upgrade?</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">I will try to remember this next time there is a
          kernel upgrade 😁.<br>
          <br>
          <div data-smartmail="gmail_signature" dir="auto"><br>
            --<br>
            Arpit</div>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Thu, Feb 21, 2019, 4:30 AM
          &lt;<a href="mailto:logcabin@fastmail.net"
            moz-do-not-send="true">logcabin@fastmail.net</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          <div>
            <div style="font-family:Arial">Yes, the kernel did get
              updated, causing the wg module dependencies to get out of
              sync. A reboot after the update should solve this,
              otherwise you may need to run the package's preinst script
              to get the modules back in sync. Should be no need to
              reinstall the wg packages.<br>
            </div>
            <div style="font-family:Arial"><br>
            </div>
            <div style="font-family:Arial">On Thu, Feb 21, 2019, at 2:14
              AM, Arpit Gupta wrote:<br>
            </div>
            <blockquote type="cite"
              id="m_-2690143954488973293fastmail-quoted">
              <div dir="ltr">
                <div dir="ltr">
                  <div dir="ltr">
                    <div dir="ltr">
                      <div style="font-family:Arial">Hi All<br>
                      </div>
                      <div><br>
                      </div>
                      <div>I am running raspberry pi v3 and ran apt-get
                        update and upgrade commands to get upto date. It
                        also ended up updating the kernel i think. I
                        should have paid more attention to what all was
                        getting updated.<br>
                      </div>
                      <div><br>
                      </div>
                      <div>After the update wireguard was not running
                        and upon debugging i found that the wireguard
                        kernel module was no longer present. So i
                        uninstalled all wireguard packages and installed
                        them again and the module showed up and on
                        reboot system was back to normal. What i was
                        curious was how should one go about doing
                        os/kernel updates in future in order to avoid
                        this issue?<br>
                      </div>
                      <div><br>
                      </div>
                      <div>I am running<br>
                      </div>
                      <div>Linux raspberrypi 4.14.98-v7+ #1200 SMP Tue
                        Feb 12 20:27:48 GMT 2019 armv7l GNU/Linux<br>
                      </div>
                      <div>
                        <div>No LSB modules are available.<br>
                        </div>
                        <div>Distributor ID:<span style="white-space:pre-wrap"> </span>Raspbian<br>
                        </div>
                        <div>Description:<span style="white-space:pre-wrap"> </span>Raspbian
                          GNU/Linux 9.8 (stretch)<br>
                        </div>
                        <div>Release:<span style="white-space:pre-wrap"> </span>9.8<br>
                        </div>
                        <div>Codename:<span style="white-space:pre-wrap"> </span>stretch<br>
                        </div>
                        <div><br>
                        </div>
                        <div>
                          <div>ii  wireguard                     
                             0.0.20190123-1               all         
                            fast, modern, secure kernel VPN tunnel
                            (metapackage)<br>
                          </div>
                          <div>ii  wireguard-dkms                 
                            0.0.20190123-1               all         
                            fast, modern, secure kernel VPN tunnel (DKMS
                            version)<br>
                          </div>
                          <div>ii  wireguard-tools               
                             0.0.20190123-1               armhf       
                            fast, modern, secure kernel VPN tunnel
                            (userland utilities)<br>
                          </div>
                        </div>
                        <div><br>
                        </div>
                        <div>
                          <div
                            class="m_-2690143954488973293fastmail-quoted-gmail_signature"
                            dir="ltr">
                            <div dir="ltr">
                              <div>--<br>
                              </div>
                              <div style="font-family:Arial">Arpit<br>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div>_______________________________________________<br>
              </div>
              <div>WireGuard mailing list<br>
              </div>
              <div><a href="mailto:WireGuard@lists.zx2c4.com"
                  target="_blank" rel="noreferrer"
                  moz-do-not-send="true">WireGuard@lists.zx2c4.com</a><br>
              </div>
              <div><a
                  href="https://lists.zx2c4.com/mailman/listinfo/wireguard"
                  target="_blank" rel="noreferrer"
                  moz-do-not-send="true">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><br>
              </div>
              <div><br>
              </div>
            </blockquote>
            <div style="font-family:Arial"><br>
            </div>
          </div>
          _______________________________________________<br>
          WireGuard mailing list<br>
          <a href="mailto:WireGuard@lists.zx2c4.com" target="_blank"
            rel="noreferrer" moz-do-not-send="true">WireGuard@lists.zx2c4.com</a><br>
          <a href="https://lists.zx2c4.com/mailman/listinfo/wireguard"
            rel="noreferrer noreferrer" target="_blank"
            moz-do-not-send="true">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><br>
        </blockquote>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
  </body>
</html>

--------------5EB7EED026685A9450DC173A--

--===============0717463657181765331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0717463657181765331==--
