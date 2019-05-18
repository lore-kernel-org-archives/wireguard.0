Return-Path: <SRS0=x/BS=TS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D22C04AAF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 May 2019 17:04:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B16E520873
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 May 2019 17:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B16E520873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=powerneth.ro
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37ec377c;
	Sat, 18 May 2019 17:03:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64895286
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 May 2019 17:03:51 +0000 (UTC)
Received: from mail.insteeldesign.ro (174.15.122.86.static.cluj.rdsnet.ro
 [86.122.15.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f76bd0b2
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 May 2019 17:03:51 +0000 (UTC)
Received: from [10.160.20.20] (unknown [79.119.96.180])
 by mail.insteeldesign.ro (Postfix) with ESMTPSA id 9740322222AD
 for <wireguard@lists.zx2c4.com>; Sat, 18 May 2019 20:03:50 +0300 (EEST)
Subject: Re: WireGuard Bug?
To: wireguard@lists.zx2c4.com
References: <VI1PR08MB430161EDE2737ABEF683CDC7900B0@VI1PR08MB4301.eurprd08.prod.outlook.com>
From: Lucian Cristian <luci@powerneth.ro>
Message-ID: <e7eee97b-ce4e-5179-cf9c-4ed714140f27@powerneth.ro>
Date: Sat, 18 May 2019 20:03:52 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <VI1PR08MB430161EDE2737ABEF683CDC7900B0@VI1PR08MB4301.eurprd08.prod.outlook.com>
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
Content-Type: multipart/mixed; boundary="===============8501350383776242994=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============8501350383776242994==
Content-Type: multipart/alternative;
 boundary="------------CAA8F6399402653C3E900912"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------CAA8F6399402653C3E900912
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 17.05.2019 09:34, . . wrote:
> Hi,
>
> I am using WireGuard on a Raspberry Pi 3 B+ with Raspbian Stretch and 
> 4.14.98-v7+ kernel.
> Now this works great for me and is very efficient, however I tried to 
> add a lot of routes on one of the "spoke/client" nodes, 517 routes to 
> be exact.
> If I do this, WireGuard stops working, tcpdump shows the traffic being 
> sent out the wg0 interface but never actually being processed by 
> wireguard, meaning the encapsulated packet to the "hub" never leaves.
>
> So I tried doing this with wg instead of wg-quick and this works fine 
> until I actually add a lot of the routes to the routing table, the 
> sweet spot seems to be 384. If 383 routes are present in the routing 
> table, wg will still work but if I add one more, all previously 
> working ones dont anymore, if I reduce it again to <=383 then it 
> starts working again. wg itself doesnt mind having all those routes 
> (wg show) but I wonder if it tries to read the routing table as well 
> for some reason?
>
> Appreciate any insight/help on this, thanks.
> Chris
>
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

did you tried using dynamic routing ? or it can't be applied ? I have 
262 routes available so can't confirm if dynamic routing will work


Regards


--------------CAA8F6399402653C3E900912
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 17.05.2019 09:34, . . wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:VI1PR08MB430161EDE2737ABEF683CDC7900B0@VI1PR08MB4301.eurprd08.prod.outlook.com">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <style type="text/css" style="display:none;"> P {margin-top:0;margin-bottom:0;} </style>
      <div style="font-family: Calibri, Helvetica, sans-serif;
        font-size: 12pt; color: rgb(0, 0, 0);">
      </div>
      <span>Hi,<br>
      </span>
      <div><br>
      </div>
      <div>I am using WireGuard on a Raspberry Pi 3 B+ with Raspbian
        Stretch and 4.14.98-v7+ kernel.<br>
      </div>
      <div>Now this works great for me and is very efficient, however I
        tried to add a lot of routes on one of the "spoke/client" nodes,
        517 routes to be exact.<br>
      </div>
      <div>If I do this, WireGuard stops working, tcpdump shows the
        traffic being sent out the wg0 interface but never actually
        being processed by wireguard, meaning the encapsulated packet to
        the "hub" never leaves.<br>
      </div>
      <div><br>
      </div>
      <div>So I tried doing this with wg instead of wg-quick and this
        works fine until I actually add a lot of the routes to the
        routing table, the sweet spot seems to be 384. If 383 routes are
        present in the routing table, wg will still work but if I add
        one more, all previously working ones dont anymore, if I reduce
        it again to &lt;=383 then it starts working again. wg itself
        doesnt mind having all those routes (wg show) but I wonder if it
        tries to read the routing table as well for some reason?<br>
      </div>
      <div><br>
      </div>
      <div>Appreciate any insight/help on this, thanks.<br>
      </div>
      <span>Chris</span>
      <div id="Signature">
        <p><br>
        </p>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
    <p>did you tried using dynamic routing ? or it can't be applied ? I
      have 262 routes available so can't confirm if dynamic routing will
      work</p>
    <p><br>
    </p>
    <p>Regards<br>
    </p>
  </body>
</html>

--------------CAA8F6399402653C3E900912--

--===============8501350383776242994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8501350383776242994==--
