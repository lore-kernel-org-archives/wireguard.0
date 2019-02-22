Return-Path: <SRS0=7yF6=Q5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73FD4C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Feb 2019 12:35:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CB6B2075A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Feb 2019 12:35:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="RI2CZctZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CB6B2075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6db2d20b;
	Fri, 22 Feb 2019 12:26:42 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e92b8237
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Feb 2019 12:26:40 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dddccf95
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Feb 2019 12:26:39 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 029402400E5
 for <wireguard@lists.zx2c4.com>; Fri, 22 Feb 2019 13:35:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1550838934; bh=gXh1/KlmHHMFx0vGzet+wGv7aax25qfTUbZli5FWUP8=;
 h=Subject:To:From:Openpgp:Autocrypt:Date:From;
 b=RI2CZctZ3aEsDtXx0rWK3bh9Y/S9xWxP2QC1ODKn0oFpxDbCjLSYVujEDSC/ZfpwV
 HgmgTTZrGf+IgMY92cgxltwAkZhzwYddLR/Gh0FEgXTxL8Olo2ZfojMrcxpwnkJd7v
 XcrqeUqxYDpe1np9fhFwPJH/Cnz4PLd0jn1PimoueTwHUSgXHC0UIsko3v+odGnhcu
 PaHEd9Clm9RpticGpOFAes7/lXNmRwEv2nNAp3lEDgLP6GmLb7uPzC3RBONtlEVnQ+
 tjlfRCzKQq+P6KLsSnH4Q+2FXSKXzVw5S6ZtCOVjb49JUau8TSTRuuz9PABwu6Sue8
 oPCio7e0UfiiA==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 445W5d02H2z9rxZ
 for <wireguard@lists.zx2c4.com>; Fri, 22 Feb 2019 13:35:32 +0100 (CET)
Subject: Re: upgrading raspberry pi required me to re install wireguard
To: wireguard@lists.zx2c4.com
References: <CAGCGyt+bsxa-aRoETJFTwvOZ1eb=Q_AemZUwufN_7RYicnnKaw@mail.gmail.com>
 <ac5a35ae-7efb-4143-bf61-a687f6cee8a8@www.fastmail.com>
 <CAGCGytJE5bzXiXB8Go6aHk5OLT0D-m2AnKbRt=Nv1giEVrpsjA@mail.gmail.com>
 <9e6f49da-bf09-ab90-dba7-ac5587863a31@pallas.us>
From: Emanuele Bernardi <e.berna@posteo.net>
Openpgp: preference=signencrypt
Autocrypt: addr=e.berna@posteo.net; prefer-encrypt=mutual; keydata=
 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
Message-ID: <62f9f029-605b-f2a5-5388-658233c2a72b@posteo.net>
Date: Fri, 22 Feb 2019 13:35:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <9e6f49da-bf09-ab90-dba7-ac5587863a31@pallas.us>
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
Content-Type: multipart/mixed; boundary="===============1161328627956469906=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============1161328627956469906==
Content-Type: multipart/alternative;
 boundary="------------CA6ADCEC98726CDCD997E865"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------CA6ADCEC98726CDCD997E865
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

I'm very interesting about make it work with dkms, could you please
explain the process? thanks
Emanuele

On 22/02/19 00:29, Derrick Lyndon Pallas wrote:
>
> I just use DKMS to do it. Check out WireGuard to /usr/src, ln -s
> WireGuard/src WireGuard-0, dkms add WireGuard/0. If it's not auto
> building, have you tried dkms install WireGuard/0? ~D
>
>
> On 2/21/19 2:57 PM, Arpit Gupta wrote:
>> Ya reboot did not solve this for me. I will read up on how I can
>> execute package pre/post install scripts.
>>
>> Curious to know if the rebuild the module is the responsibility of
>> the os or the package after a kernel upgrade?
>>
>> I will try to remember this next time there is a kernel upgrade 😁.
>>
>>
>> --
>> Arpit
>>
>> On Thu, Feb 21, 2019, 4:30 AM <logcabin@fastmail.net
>> <mailto:logcabin@fastmail.net>> wrote:
>>
>>     Yes, the kernel did get updated, causing the wg module
>>     dependencies to get out of sync. A reboot after the update should
>>     solve this, otherwise you may need to run the package's preinst
>>     script to get the modules back in sync. Should be no need to
>>     reinstall the wg packages.
>>
>>     On Thu, Feb 21, 2019, at 2:14 AM, Arpit Gupta wrote:
>>>     Hi All
>>>
>>>     I am running raspberry pi v3 and ran apt-get update and upgrade
>>>     commands to get upto date. It also ended up updating the kernel
>>>     i think. I should have paid more attention to what all was
>>>     getting updated.
>>>
>>>     After the update wireguard was not running and upon debugging i
>>>     found that the wireguard kernel module was no longer present. So
>>>     i uninstalled all wireguard packages and installed them again
>>>     and the module showed up and on reboot system was back to
>>>     normal. What i was curious was how should one go about doing
>>>     os/kernel updates in future in order to avoid this issue?
>>>
>>>     I am running
>>>     Linux raspberrypi 4.14.98-v7+ #1200 SMP Tue Feb 12 20:27:48 GMT
>>>     2019 armv7l GNU/Linux
>>>     No LSB modules are available.
>>>     Distributor ID:Raspbian
>>>     Description:Raspbian GNU/Linux 9.8 (stretch)
>>>     Release:9.8
>>>     Codename:stretch
>>>
>>>     ii  wireguard                       0.0.20190123-1             
>>>      all          fast, modern, secure kernel VPN tunnel (metapackage)
>>>     ii  wireguard-dkms                  0.0.20190123-1             
>>>      all          fast, modern, secure kernel VPN tunnel (DKMS version)
>>>     ii  wireguard-tools                 0.0.20190123-1             
>>>      armhf        fast, modern, secure kernel VPN tunnel (userland
>>>     utilities)
>>>
>>>     --
>>>     Arpit
>>>     _______________________________________________
>>>     WireGuard mailing list
>>>     WireGuard@lists.zx2c4.com <mailto:WireGuard@lists.zx2c4.com>
>>>     https://lists.zx2c4.com/mailman/listinfo/wireguard
>>>
>>
>>     _______________________________________________
>>     WireGuard mailing list
>>     WireGuard@lists.zx2c4.com <mailto:WireGuard@lists.zx2c4.com>
>>     https://lists.zx2c4.com/mailman/listinfo/wireguard
>>
>>
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--------------CA6ADCEC98726CDCD997E865
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <font size="-1"><font face="Liberation Mono">I'm very interesting
        about make it work with dkms, could you please explain the
        process? thanks<br>
        Emanuele<br>
        <br>
      </font></font>
    <div class="moz-cite-prefix">On 22/02/19 00:29, Derrick Lyndon
      Pallas wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9e6f49da-bf09-ab90-dba7-ac5587863a31@pallas.us">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>I just use DKMS to do it. Check out WireGuard to /usr/src, ln
        -s WireGuard/src WireGuard-0, dkms add WireGuard/0. If it's not
        auto building, have you tried dkms install WireGuard/0? ~D<br>
      </p>
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 2/21/19 2:57 PM, Arpit Gupta
        wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:CAGCGytJE5bzXiXB8Go6aHk5OLT0D-m2AnKbRt=Nv1giEVrpsjA@mail.gmail.com">
        <meta http-equiv="content-type" content="text/html;
          charset=UTF-8">
        <div dir="auto">Ya reboot did not solve this for me. I will read
          up on how I can execute package pre/post install scripts.
          <div dir="auto"><br>
          </div>
          <div dir="auto">Curious to know if the rebuild the module is
            the responsibility of the os or the package after a kernel
            upgrade?</div>
          <div dir="auto"><br>
          </div>
          <div dir="auto">I will try to remember this next time there is
            a kernel upgrade 😁.<br>
            <br>
            <div data-smartmail="gmail_signature" dir="auto"><br>
              --<br>
              Arpit</div>
          </div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Feb 21, 2019, 4:30
            AM &lt;<a href="mailto:logcabin@fastmail.net"
              moz-do-not-send="true">logcabin@fastmail.net</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">
            <div>
              <div style="font-family:Arial">Yes, the kernel did get
                updated, causing the wg module dependencies to get out
                of sync. A reboot after the update should solve this,
                otherwise you may need to run the package's preinst
                script to get the modules back in sync. Should be no
                need to reinstall the wg packages.<br>
              </div>
              <div style="font-family:Arial"><br>
              </div>
              <div style="font-family:Arial">On Thu, Feb 21, 2019, at
                2:14 AM, Arpit Gupta wrote:<br>
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
                        <div>I am running raspberry pi v3 and ran
                          apt-get update and upgrade commands to get
                          upto date. It also ended up updating the
                          kernel i think. I should have paid more
                          attention to what all was getting updated.<br>
                        </div>
                        <div><br>
                        </div>
                        <div>After the update wireguard was not running
                          and upon debugging i found that the wireguard
                          kernel module was no longer present. So i
                          uninstalled all wireguard packages and
                          installed them again and the module showed up
                          and on reboot system was back to normal. What
                          i was curious was how should one go about
                          doing os/kernel updates in future in order to
                          avoid this issue?<br>
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
                              fast, modern, secure kernel VPN tunnel
                              (DKMS version)<br>
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
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com" moz-do-not-send="true">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard" moz-do-not-send="true">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
      </blockquote>
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

--------------CA6ADCEC98726CDCD997E865--

--===============1161328627956469906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1161328627956469906==--
