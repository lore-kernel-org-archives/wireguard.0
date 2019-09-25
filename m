Return-Path: <SRS0=As8F=XU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5330C432C2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 22:02:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 140E620673
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Sep 2019 22:02:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mib-infotech-co-nz.20150623.gappssmtp.com header.i=@mib-infotech-co-nz.20150623.gappssmtp.com header.b="VUBja2Ki"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 140E620673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mib-infotech.co.nz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55dc31f7;
	Wed, 25 Sep 2019 22:02:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27397832
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 22:02:05 +0000 (UTC)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db6c87e4
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Sep 2019 22:02:05 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id i30so118909pgl.0
 for <wireguard@lists.zx2c4.com>; Wed, 25 Sep 2019 15:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mib-infotech-co-nz.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language;
 bh=xOCjGnmkanOADpZtqW+efglLtp3Eji3iGoLC76TwlFk=;
 b=VUBja2KivBCVKko4KlaDT5uFVA4NgPUCU/Wpo/tjfQAlPbtkEU37CoJ2Kuaa6HheER
 4G+VdLtlEK1Ysi5CcokFbbZJKgDvYc7FUo6JmFc5qjrquEBBA6GRjoXR7xi0X1IYeMge
 +OPb6/U8wXm4vNYbXbDMEH6aDNao6NrcCjZvfOq16d9N4VyPYw4IkWdvD8MddrIfJ/H4
 V1pB8u11F97Y89rsBVBEXznwmE9IbNiZ5GXDCOf7z0y9sIIOAy4WY1ADZ6wymsK0BXA7
 g365Luk0g5O2wkNyhw8nt0xVDaHToeCPyXry16uIgNZKqtSQstgzn65xlPKRa1G7kVMG
 TYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=xOCjGnmkanOADpZtqW+efglLtp3Eji3iGoLC76TwlFk=;
 b=SXZELakUuazZ7DANPWAC0gDpNKJw+nq36scbcJrZMPsKmnG0Nh9hpi2x8qfo1hBpEh
 DEYVlIx40n1XQuEdblzaarBEfDSPEynUPh1Nk+JM47Vk5dGucyhidpJFowHGycANmV2f
 iDCU9AKZlviBeRexgYx3XdQwh7t3BzjiMtwZlyo6fKOHyUkQslqsbbB+WmoSV+hQmdfi
 yNZnvC+LPOAi5S/M1vSvj0jvMxptK/IQvBEfjCwZVL5FD8tHFl3x1WTCNUpPwuehgwlJ
 eO6i+81rtpUePfM32YyBGrFX/dXB9nuc5r6rjCANvBZEyTZh4279ypcHVlT+IxuvokFC
 zGGA==
X-Gm-Message-State: APjAAAWIKwoXLRVLONSNLEBqM7Ca7YTYLVdOnjXPTCfXYVcMdbCXS1d0
 Zf+pv4JDfA2vtBs4xFncAOHHEqVmD/w=
X-Google-Smtp-Source: APXvYqyQvl0R2gaOwcyCFPYFd947cQYxZPRuz6A/rXxvweo0Hgbc1xwl8d28ysAhSPrrLFB5xe/vJQ==
X-Received: by 2002:a17:90a:2301:: with SMTP id
 f1mr8977995pje.121.1569448923968; 
 Wed, 25 Sep 2019 15:02:03 -0700 (PDT)
Received: from [10.16.226.47] ([103.247.155.34])
 by smtp.gmail.com with ESMTPSA id fa24sm69466pjb.13.2019.09.25.15.02.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Sep 2019 15:02:02 -0700 (PDT)
From: John huttley <john@mib-infotech.co.nz>
X-Google-Original-From: John huttley <John@mib-infotech.co.nz>
Subject: Re: Port dependent issues on iOS 13
To: wireguard@p-np.de, wireguard@lists.zx2c4.com
References: <1394974820.30160.1569317808871@office.mailbox.org>
Message-ID: <bd2be5bf-13c6-8c38-e4e1-705fcfa98f73@mib-infotech.co.nz>
Date: Thu, 26 Sep 2019 10:01:57 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1394974820.30160.1569317808871@office.mailbox.org>
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
Content-Type: multipart/mixed; boundary="===============7526511253332225674=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============7526511253332225674==
Content-Type: multipart/alternative;
 boundary="------------F6930C35E947157DD54FE3A4"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F6930C35E947157DD54FE3A4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Port  4500 is the IPSec UDP nat port and 500 is IKE.

Anyconnect uses ISPEC so I think those ports are simply in use.


--John

On 24/09/19 9:36 PM, wireguard@p-np.de wrote:
> Hello,
>
> in place upgrades from iOS 12 -> iOS 13 (release) seem to work well in 
> general. But there is a bizarre issue depending on *remote* endpoint 
> ports. If you have, in my case, 4500/UDP configured as remote endpoint 
> the tunnel does not send or receive traffic. Changing it to any other 
> port works. Changing back to 4500/UDP breaks it again reproducibly. 
> For others, documented here 
> <https://www.reddit.com/r/WireGuard/comments/d6in39/wg_broken_on_ios_13/> , 
> it is 1500/UDP, in #WireGuard there has been a documented issue for 
> 500/UDP not working.
>
> I have AnyConnect installed in parallel and checked, whether that's 
> related. But removing and resetting Network settings did not fix port 
> 4500 for me.
>
> As there is no port number dependent branching in the WireGuard-iOS 
> code base, this is likely an iOS regression. Does any one of you have 
> a working channel to Apple to report this?
>
> Thank you for an else excellent product. Let me know if I can be of 
> any help.
>
> Best regards,
>
> Christian
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--------------F6930C35E947157DD54FE3A4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi, <br>
    </p>
    <p>Port  4500 is the IPSec UDP nat port and 500 is IKE.</p>
    <p>Anyconnect uses ISPEC so I think those ports are simply in use.</p>
    <p><br>
    </p>
    <p>--John<br>
    </p>
    <div class="moz-cite-prefix">On 24/09/19 9:36 PM, <a class="moz-txt-link-abbreviated" href="mailto:wireguard@p-np.de">wireguard@p-np.de</a>
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1394974820.30160.1569317808871@office.mailbox.org">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <meta charset="UTF-8">
      <div> Hello, </div>
      <div> <br>
      </div>
      <div> in place upgrades from iOS 12 -&gt; iOS 13 (release) seem to
        work well in general. But there is a bizarre issue depending on
        <strong>remote</strong> endpoint ports. If you have, in my case,
        4500/UDP configured as remote endpoint the tunnel does not send
        or receive traffic. Changing it to any other port works.
        Changing back to 4500/UDP breaks it again reproducibly. For
        others, documented <a
href="https://www.reddit.com/r/WireGuard/comments/d6in39/wg_broken_on_ios_13/"
          moz-do-not-send="true">here</a> , it is 1500/UDP, in
        #WireGuard there has been a documented issue for 500/UDP not
        working. </div>
      <div> <br>
      </div>
      <div> I have AnyConnect installed in parallel and checked, whether
        that's related. But removing and resetting Network settings did
        not fix port 4500 for me. </div>
      <div> <br>
      </div>
      <div> As there is no port number dependent branching in the
        WireGuard-iOS code base, this is likely an iOS regression. Does
        any one of you have a working channel to Apple to report this? </div>
      <div> <br>
      </div>
      <div> Thank you for an else excellent product. Let me know if I
        can be of any help. </div>
      <div> <br>
      </div>
      <div> Best regards, </div>
      <div> <br>
      </div>
      <div> Christian </div>
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

--------------F6930C35E947157DD54FE3A4--

--===============7526511253332225674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7526511253332225674==--
